*** This do file cleans PSLSMS 2019-20 datasets and restricts them to relevant	***
***	variables.																	*** 
clear
set more off

**	Cleaning and Merging PSLSMS 2019-20	**
use "${...}\PSLM 2019-20\info.dta", clear

gen entrydate = substr(int_date, 1, 10)

split 	entrydate, gen(date_) parse(-)

drop 		if date_2=="Jan" | date_2=="Mar"		//only 25 observations dropped//
destring 	date_2, replace
gen 		month = date_2
label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname	

gen			year = 2019 		if date_1=="2019"
replace		year = 2020			if date_1=="2020"			//this is not perfect but I have accounted for about 92% of the observations//

keep hhcode month year

save "${...}\Temp\2019-20\time.dta", replace 


* Adding hh weights
use "${...}\PSLM 2019-20\weight_file.dta", clear

keep psu weights

save "${...}\Temp\2019-20\weights.dta", replace 


* Roster of all households
use "${...}\PSLM 2019-20\roster.dta", clear

gen male = 0
replace male = 1		if sb1q4==1

keep hhcode idc province district age male psu

save "${...}\Temp\2019-20\roster.dta", replace 


* Education Information
use "${...}\PSLM 2019-20\secc1.dta", clear

gen read_write=.
replace read_write = 0	if sc1q1a==2 | sc1q2a==2
replace read_write = 0	if sc1q1a==1 & sc1q1a==1
label var read_write 		"=1 if person can both read and write in any language"

gen ever_school = .
replace ever_school = 0 	if sc1q01==1
replace ever_school = 1 	if sc1q01!=1
label var ever_school 		"=1 if person ever attended school"

gen years_educ = sc1q05
replace	years_educ = 0		if ever_school==0
replace years_educ = 10 	if sc1q05==11											// Assuming diploma equals 10 years of education //			
replace years_educ = 16 	if sc1q05==13 | sc1q05==14 | sc1q05==15 | sc1q05==18 | ///	// Assuming BA/BSc/Degree in engineering, computers  //
							sc1q05==19 | sc1q05==20 | sc1q05==21 						// and agriculture equals 16 years of education	 //
																						
replace years_educ = 17 	if sc1q05==16 | sc1q05==17 | sc1q05==24					// Assuming MA/MSc, MBBS equals 17 years of education //
replace years_educ = 21 	if sc1q05==22 | sc1q05==23								// Assuming PhD/M.Phil equals 21 years of education //
replace years_educ = .a 	if sc1q05>24												// Taking "others" as missing vallues, total no of "others" //
																						// observations is 839 //
label var years_educ 		"Total completed years of education"

keep hhcode idc province district read_write ever_school years_educ

save "${...}\Temp\2019-20\education.dta", replace


* Employment Information
use "${...}\PSLM 2019-20\sece.dta", clear	

gen has_job = .
replace has_job = 0 				if seaq01==2
replace has_job = 1 				if seaq03==1 | seaq01==1
label var has_job 					"=1 if the person has a job conditional on looking for a job"

gen		working = 0
replace working = 1 				if has_job==1
label var working "=1 if the person has a job"

gen active_lfp = .
replace active_lfp = 0				if seaq03==3
replace active_lfp = 1				if seaq01==1 | seaq03==1 | seaq03==2
label var active_lfp "=1 if the individual is active in the labor market"

rename seaq02						work_days_month
rename seaq09						work_months_year
rename seaq08						income_m
rename seaq10						income_y

gen income_y_to_m = income_y/12		if income_m==.

egen income = rowtotal 		(income_m income_y_to_m), m
label var income "monthly cash income earned"

gen		self_employed = .
replace	self_employed = 0			if seaq06!=1 & seaq06!=2 & seaq06!=3 & seaq07!=6 & seaq06!=7 & seaq06!=9 & seaq06!=.
replace	self_employed = 1			if seaq06==1 | seaq06==2 | seaq06==3 | seaq06==6 | seaq06==7 | seaq06==9 
label var self_employed "=1 if self employed"

gen		salaried = .
replace	salaried = 0				if seaq06!=4 & seaq06!=5 & seaq06!=.8 & seaq06!=.
replace	salaried = 1					if seaq06==4 | seaq06==5 | seaq06==8
label var salaried "=1 if salaried"

gen		type_occ_ag = .
replace type_occ_ag = 0				if !inlist(seaq04, 6111, 6340) & seaq04!=.
replace	type_occ_ag = 1				if inlist(seaq04, 6111, 6340)
label var type_occ_ag "=1 if nature of occ. is agriculture"

gen		type_occ_manuf = .
replace type_occ_manuf = 0				if !inlist(seaq04, 8111, 8350) & seaq04!=.
replace	type_occ_manuf = 1				if inlist(seaq04, 8111, 8350)
label var type_occ_manuf "=1 if nature of occ. is manufacturing"

gen		type_occ_serv = .
replace type_occ_serv = 0				if type_occ_ag==1 | type_occ_manuf==1
replace	type_occ_serv = 1				if type_occ_ag==0 & type_occ_manuf==0
label var type_occ_ag "=1 if nature of occ. is service"

gen		type_ind_ag = .
replace type_ind_ag = 0				if !inlist(seaq05, 111, 990) & seaq05!=.
replace	type_ind_ag = 1				if inlist(seaq05, 111, 990)
label var type_ind_ag "=1 if industry is ag"

gen		type_ind_manuf = .
replace type_ind_manuf = 0				if !inlist(seaq05, 1010, 4390) & seaq05!=.
replace	type_ind_manuf = 1				if inlist(seaq05, 1010, 4390)
label var type_ind_manuf "=1 if industry is manufacturing, electric or construction"

gen		type_ind_serv = .
replace type_ind_serv = 0				if type_ind_ag==1 | type_ind_manuf==1
replace	type_ind_serv = 1				if type_ind_ag==0 & type_ind_manuf==0
label var type_occ_ag "=1 if industry is service"

keep hhcode idc has_job working active_lfp work_days_month work_months_year income ///
	income_m income_y self_employed salaried type_*

save "${...}\Temp\2019-20\employment.dta", replace


* Health Information
use "${...}\PSLM 2019-20\secd.dta", clear	

gen sick_injured = .
replace sick_injured = 0 			if sdaq01==2
replace sick_injured = 1 			if sdaq01==1
label var sick_injured 				"=1 if sick or injured in last two weeks"

gen consulted_doc = .
replace consulted_doc = 0			if sdaq02==2
replace consulted_doc = 1			if sdaq02==1
label var consulted_doc				"=1 if consulted a doctor"

keep hhcode idc sick_injured consulted_doc

save "${...}\Temp\2019-20\health.dta", replace 




* Merging all datasets
use "${...}\Temp\2019-20\roster.dta", clear

merge 1:1 hhcode idc using "${...}\Temp\2019-20\education.dta"
drop if _merge==2
drop _merge	

merge 1:1 hhcode idc using "${...}\Temp\2019-20\employment.dta"
drop if _merge==2
drop _merge

merge 1:1 hhcode idc using "${...}\Temp\2019-20\health.dta"
drop if _merge==2
drop _merge

merge m:1 hhcode using "${...}\Temp\2019-20\time.dta"
drop if _merge==2
drop _merge

merge m:1 psu using "${...}\Temp\2019-20\weights.dta"
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

*gen	year = 2018			

keep	if province==1 | province==2
recode province (1=3) (2=1)

label define pr1 1 "punjab" 3 "kpk"
label values province pr1

keep	if province==1

*gen gdp_deflator_19 = 236.6180588 / 100 
*gen gdp_deflator_20 = 246.3436449 / 100

*gen cpi_19 = 141.699320320248 / 100
*gen cpi_20 = 145.283361149409 / 100


gen inflation_17 = 0.04085374
gen inflation_19 = 0.1057836
gen inflation_20 = 0.09739993

gen 	real_income = income_m / (1 + inflation_19)		if year==2018	//while 2019 is treated as 2020, the inflation needs to be for correct year//
replace real_income = income_m / (1 + inflation_20)		if year==2019
label var real_income "monthly cash income adjusted for inflation"

gen ln_income = ln(real_income)
label var ln_income "Log of real monthly cash income"

rename	district	dist

gen district = dist
				
recode district		(201=101) (202=132) (203=133) (204=106) (205=104) (206=136) ///
					(207=128) (208=109) (209=112) (210=113) (211=115) (212=100) ///
					(213=103) (214=110) (215=119) (216=125) (217=107) (218=118) ///
					(219=130) (220=127) (221=116) (222=108) (223=124) (224=131) ///
					(225=135) (226=117) (227=120) (228=126) (229=134) (230=129) ///
					(231=102) (232=123) (233=105) (234=121) (235=114) (236=111) ///
					(237=122)
				
drop dist

label define dist5 100 "Islamabad" 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib" 136 "Chiniot"

label values district dist5
																															
save "${...}\PSLSM_1920_final.dta", replace



 
