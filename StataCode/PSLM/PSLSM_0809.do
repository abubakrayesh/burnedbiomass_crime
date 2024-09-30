*** This do file cleans PSLSMS 2008-09 datasets and restricts them to relevant	***
***	variables.																	*** 

global crime "C:\Users\abuba\Dropbox\Smog-Crime\Data\Crime"
global finaltemp "C:\Users\abuba\Dropbox\Smog-Crime\Data\Final_temp"
global final "C:\Users\abuba\Dropbox\Smog-Crime\Data\Final"
global pslm "C:\Users\abuba\Dropbox\Smog-Crime\Data\PSLSM"

clear
set more off

**	Cleaning and Merging PSLSMS 2008-09	**

* Month and year of interview
use "${...}\PSLM 2008-09\sec_a.dta", clear

tostring 	int_date, replace

gen 		month = substr(int_date, 3,2)
destring 	month, replace

label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname	

gen 		yr = substr(int_date,5,2)
destring	yr, replace

gen 		year = 2008 		if yr==8
replace		year = 2009			if yr==9

keep hhcode month year

save "${...}\Temp\2008-09\time.dta", replace 


* Adding hh weights
use "${...}\PSLM 2008-09\weights_file.dta", clear

keep psu weights

save "${...}\Temp\2008-09\weights.dta", replace 


* Roster of all households
use "${...}\PSLM 2008-09\sec_b.dta", clear

gen male = 0
replace male = 1		if sbq01==1

keep 		hhcode idc province district age male psu

save "${...}\Temp\2008-09\roster.dta", replace 


* Education Information
use "${...}\PSLM 2008-09\sec_c.dta", clear

keep 		hhcode idc scq01 scq02 scq03 scq04 scq05 scq06 scq07 scq08a ///
			scq08b scq09a scq09b
			
gen read_write = .
replace read_write = 0 		if scq01==2
replace read_write = 1 		if scq01==1
label var read_write 		"=1 if person can both read and write in any language"

gen ever_school = .
replace ever_school = 0 	if scq03==2
replace ever_school = 1 	if scq03==1
label var ever_school 		"=1 if person ever attended school"

gen years_educ = scq04
replace	years_educ = 0		if ever_school==0
replace years_educ = 12 	if scq04==11
replace years_educ = 16 	if scq04==12 | scq04==13 | scq04==15 | scq04==16 // Assuming BA/BSc/Degree in engineering, computers  //
																			 // and agriculture equals 16 years of education	 //
replace years_educ = 17 	if scq04==14 | scq04==17						// Assuming MA/MSc, MBBS equals 17 years of education //
replace years_educ = 21 	if scq04==18									// Assuming PhD/M.Phil equals 21 years of education //
replace years_educ = .a 	if scq04==19									// Taking "others" as missing vallues, total no of "others" //
																			// observations is 80 //
label var years_educ 		"Total completed years of education"

keep	hhcode idc years_educ ever_school read_write

save "${...}\Temp\2008-09\education.dta", replace 


* Employment Information
use "${...}\PSLM 2008-09\section_e.dta", clear

gen has_job = .
replace has_job = 0 				if seq01==2
replace has_job = 1 				if seq02==1 | seq01==1
label var has_job 					"=1 if the person has a job conditional on looking for a job"

gen		working = 0
replace working = 1 				if has_job==1
label var working "=1 if the person has a job"

gen active_lfp = .
replace active_lfp = 0				if seq05!=. | seq06!=.
replace active_lfp = 1				if seq01==1 | seq02==1 | seq03==1 | seq04==1
label var active_lfp "=1 if the individual is active in the labor market"

rename seq12			work_days_month
rename seq14			work_months_year
rename seq13			income_m
rename seq16			income_y

gen income_y_to_m = income_y/12		if income_m==.

egen income = rowtotal 		(income_m income_y_to_m), m
label var income "monthly cash income earned"

gen		self_employed = .
replace	self_employed = 0			if seq07!=2 & seq07!=3 & seq07!=5 & seq07!=7 & seq07!=8 & seq07!=.
replace	self_employed = 1			if seq07==2 | seq07==3 | seq07==5 | seq07==7 | seq07==8 
label var self_employed "=1 if self employed"

gen		salaried = .
replace	salaried = 0				if seq07!=1 & seq07!=4 & seq07!=6 & seq07!=.
replace	salaried = 1					if seq07==1 | seq07==4 | seq07==6
label var salaried "=1 if salaried"

gen		type_occ_ag = .
replace type_occ_ag = 0				if seq09!=6 & seq09!=.
replace	type_occ_ag = 1				if seq09==6
label var type_occ_ag "=1 if nature of occ. is agriculture"

gen		type_occ_manuf = .
replace type_occ_manuf = 0				if seq09!=8 & seq09!=.
replace	type_occ_manuf = 1				if seq09==8
label var type_occ_manuf "=1 if nature of occ. is manufacturing"

gen		type_occ_serv = .
replace type_occ_serv = 0				if type_occ_ag==1 | type_occ_manuf==1
replace	type_occ_serv = 1				if type_occ_ag==0 & type_occ_manuf==0
label var type_occ_ag "=1 if nature of occ. is service"

gen		type_ind_ag = .
replace type_ind_ag = 0				if seq10!=1 & seq10!=2 & seq10!=.
replace	type_ind_ag = 1				if seq10==1 | seq10==2
label var type_ind_ag "=1 if industry is ag"

gen		type_ind_manuf = .
replace type_ind_manuf = 0				if seq10!=3 & seq10!=4 & seq10!=5 & seq10!=.
replace	type_ind_manuf = 1				if seq10==3 | seq10==4 | seq10==5
label var type_ind_manuf "=1 if industry is manufacturing, electric or construction"

gen		type_ind_serv = .
replace type_ind_serv = 0				if type_ind_ag==1 | type_ind_manuf==1
replace	type_ind_serv = 1				if type_ind_ag==0 & type_ind_manuf==0
label var type_occ_ag "=1 if industry is service"

keep hhcode idc has_job working active_lfp work_days_month work_months_year income ///
	income_m income_y self_employed salaried type_*

save "${...}\Temp\2008-09\employment.dta", replace 


* Health Information
use "${...}\PSLM 2008-09\sec_d.dta", clear	

keep 		hhcode idc sdq01 sdq02 sdq03 sdq04 sdq05a sdq05b sdq06a sdq06b ///
			sdq07 sdq08

gen sick_injured = .
replace sick_injured = 0 			if sdq01==2
replace sick_injured = 1 			if sdq01==1
label var sick_injured 				"=1 if sick or injured in last two weeks"

gen consulted_doc = .
replace consulted_doc = 0			if sdq02==2
replace consulted_doc = 1			if sdq02==1
label var consulted_doc				"=1 if consulted a doctor"

keep hhcode idc sick_injured consulted_doc

save "${...}\Temp\2008-09\health.dta", replace 


* Merging all datasets
use "${...}\Temp\2008-09\roster.dta", clear

merge 1:1 hhcode idc using "${...}\Temp\2008-09\education.dta"
drop if _merge==2
drop _merge	

merge 1:1 hhcode idc using "${...}\Temp\2008-09\employment.dta"
drop if _merge==2
drop _merge

merge 1:1 hhcode idc using "${...}\Temp\2008-09\health.dta"
drop if _merge==2
drop _merge

merge m:1 hhcode using "${...}\Temp\2008-09\time.dta"
drop if _merge==2
drop _merge

merge m:1 psu using "${...}\Temp\2008-09\weights.dta"
drop if _merge==2
drop _merge

bys district:						egen employed_dist = sum(working)
label var employed_dist "Total employed people in each district"

bys district:						egen lfp_dist = sum(active_lfp)
label var lfp_dist "Total active labor force in each district"

gen work_age = .
replace work_age = 0			if age<16 | age>60
replace work_age = 1			if age>=16 & age<=60
label var work_age "=1 if in the working age"

bys district:						egen workage_dist = sum(work_age)
label var workage_dist "Total working age population in each district"


gen emp_lfp = (employed_dist / lfp_dist) * 100
label var emp_lfp "Employed to active labor force participants ratio -in each district"

gen emp_workage = (employed_dist / workage_dist) * 100
label var emp_lfp "Employed to working age population ratio -in each district"

bys district:						egen sick_dist = sum(sick_injured)
label var sick_dist "Total sick in each district"

*gen	year = 2008									

keep	if province==1


gen gdp_deflator_08 = 121.438830984073 / 100
gen gdp_deflator_09 = 146.536006194614 / 100

gen cpi_08 = 77.2657985279387 / 100
gen cpi_09 = 87.8108531858369 / 100

gen inflation_08 = 0.202861210929554
gen inflation_09 = 0.1364776506

gen 	real_income = income_m / (1 + inflation_08)		if year==2008
replace real_income = income_m / (1 + inflation_09)		if year==2009
label var real_income "monthly cash income adjusted for inflation"

gen ln_income = ln(real_income)
label var ln_income "Log of real monthly cash income"

recode  district	(122 = 150)
recode 	district	(123=122) (124=123) (125=124) (126=125) (127=126) (128=127) ///
					(129=128) (130=129) (131=130) (132=131) (133=132) (134=133) ///
					(135=134)
recode	district	(150=135)		

label define dist1 100 "Islamabad" 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib"

label values district dist1

save "${...}\PSLSM_0809_final.dta", replace







