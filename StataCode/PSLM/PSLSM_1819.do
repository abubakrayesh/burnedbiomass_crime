*** This do file cleans HIES 2018-19 datasets and restricts them to relevant	***
***	variables.																	*** 
clear
set more off

**	Cleaning and Merging PSLSMS 2015-16	**

* Month and year of interview
use "${...}\PSLM-HIES 2018-19\sec_00.dta", clear

gen 		month = enum_month
label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname	

gen			year = 2018		if enum_year==2018
replace		year = 2019		if enum_year==2019

keep hhcode month year

save "${...}\Temp\2018-19\time.dta", replace 


* Adding hh weights
use "${...}\PSLM-HIES 2018-19\weight.dta", clear

rename weight weights

keep psu weights

save "${...}\Temp\2018-19\weights.dta", replace 


* Roster of all households
use "${...}\PSLM-HIES 2018-19\sec 1a.dta", clear

gen dist=trunc(hhcode/1000000)		if province==2

#delimit ;
lab def dist 2102 "Rawalpindi"
2202 "Sargodha"
2302 "Faisalabad"
2402 "Gujranwala"
2502 "Lahore"
2602 "Sahiwal"
2702 "Multan"
2802 "D.G.Khan"
2902 "Bahawalpur"
2012 "Islamabad"
2111 "Attock"
2121 "Rawalpindi"
2131 "Jehlum"
2141 "Chakwal"
2211 "Sargodha"
2221 "Bhakhar"
2231 "Khushab"
2241 "Mianwali"
2311 "Faisalabad"
2321 "Chiniot"
2331 "Jhang"
2341 "T.T. Singh"
2411 "Gujranwala"
2421 "Hafizabad"
2431 "Gujrat"
2441 "Mandi Bahuddin"
2451 "Sialkot"
2461 "Narowal"
2511 "Lahore"
2521 "Kasur"
2531 "Sheikhupura"
2541 "Nankana Sahib"
2611 "Okara"
2621 "Sahiwal"
2631 "Pakpatten"
2711 "Vehari"
2721 "Multan"
2731 "Lodhran"
2741 "Khanewal"
2811 "D. G. Khan"
2821 "Rajanpur"
2831 "Layyah"
2841 "Muzaffar Garh"
2911 "Bahawalpur"
2921 "Bahawalnagar"
2931 "Rahim Yar Khan"
2011 "ISLAMABAD", replace;
lab val dist dist;
#delimit cr

gen male = 0
replace male = 1		if s1aq04==1

keep 		idc hhcode province dist age male	psu	
	
save "${...}\Temp\2018-19\roster.dta", replace 


* Education Information
use "${...}\PSLM-HIES 2018-19\sec_2ab.dta", clear
			
gen read_write = .
replace read_write = 0 		if s2aq01==2 | s2aq02==2
replace read_write = 1 		if s2aq01==1 & s2aq02==1
label var read_write 		"=1 if person can both read and write in any language"

gen ever_school = .
replace ever_school = 0 	if s2aq04==2
replace ever_school = 1 	if s2aq04==1
label var ever_school 		"=1 if person ever attended school"

gen years_educ = s2bq05
replace	years_educ = 0		if ever_school==0
replace years_educ = 12 	if s2bq05==12 | s2bq05==11
replace years_educ = 16 	if s2bq05==13 | s2bq05==14 | s2bq05==15 | s2bq05==18 | s2bq05==19 | ///
							s2bq05==20 | s2bq05==21
																				// Assuming BA/BSc/Degree in engineering, computers  //
																			 // and agriculture equals 16 years of education	 //
replace years_educ = 17 	if s2bq05==16 | s2bq05==17	| s2bq05==24		// Assuming MA/MSc, MBBS equals 17 years of education //
replace years_educ = 21 	if s2bq05==22 | s2bq05==23						// Assuming PhD/M.Phil equals 21 years of education //
replace years_educ = .a 	if s2bq05>24									// Taking "others" as missing vallues, total no of "others" //
																			// observations is 80 //
label var years_educ 		"Total completed years of education"

keep 		hhcode idc read_write years_educ ever_school
			
save "${...}\Temp\2018-19\education.dta", replace 


* Employment Information
use "${...}\PSLM-HIES 2018-19\sec_1b (2).dta", clear	

gen has_job = .
replace has_job = 0 				if s1bq01==2
replace has_job = 1 				if s1bq03==1 | s1bq01==1
label var has_job 					"=1 if the person has a job conditional on looking for a job"

gen		working = 0
replace working = 1 				if has_job==1
label var working "=1 if the person has a job"

gen active_lfp = .
replace active_lfp = 0				if s1bq03==3
replace active_lfp = 1				if s1bq01==1 | s1bq03==1 | s1bq03==2
label var active_lfp "=1 if the individual is active in the labor market"

rename s1bq02						work_days_month
rename s1bq09						work_months_year
rename s1bq08						income_m
rename s1bq10						income_y

gen income_y_to_m = income_y/12		if income_m==.

egen income = rowtotal 		(income_m income_y_to_m), m
label var income "monthly cash income earned"

gen		self_employed = .
replace	self_employed = 0			if s1bq06!=1 & s1bq06!=2 & s1bq06!=3 & s1bq06!=6 & s1bq06!=7 & s1bq06!=9 & s1bq06!=.
replace	self_employed = 1			if s1bq06==1 | s1bq06==2 | s1bq06==3 | s1bq06==6 | s1bq06==7 | s1bq06==9 
label var self_employed "=1 if self employed"

gen		salaried = .
replace	salaried = 0				if s1bq06!=4 & s1bq06!=5 & s1bq06!=.8 & s1bq06!=.
replace	salaried = 1					if s1bq06==4 | s1bq06==5 | s1bq06==8
label var salaried "=1 if salaried"

gen		type_occ_ag = .
replace type_occ_ag = 0				if !inlist(s1bq04, 6111, 6340) & s1bq04!=.
replace	type_occ_ag = 1				if inlist(s1bq04, 6111, 6340)
label var type_occ_ag "=1 if nature of occ. is agriculture"

gen		type_occ_manuf = .
replace type_occ_manuf = 0				if !inlist(s1bq04, 8111, 8350) & s1bq04!=.
replace	type_occ_manuf = 1				if inlist(s1bq04, 8111, 8350)
label var type_occ_manuf "=1 if nature of occ. is manufacturing"

gen		type_occ_serv = .
replace type_occ_serv = 0				if type_occ_ag==1 | type_occ_manuf==1
replace	type_occ_serv = 1				if type_occ_ag==0 & type_occ_manuf==0
label var type_occ_ag "=1 if nature of occ. is service"

gen		type_ind_ag = .
replace type_ind_ag = 0				if !inlist(s1bq05, 111, 990) & s1bq05!=.
replace	type_ind_ag = 1				if inlist(s1bq05, 111, 990)
label var type_ind_ag "=1 if industry is ag"

gen		type_ind_manuf = .
replace type_ind_manuf = 0				if !inlist(s1bq05, 1010, 4390) & s1bq05!=.
replace	type_ind_manuf = 1				if inlist(s1bq05, 1010, 4390)
label var type_ind_manuf "=1 if industry is manufacturing, electric or construction"

gen		type_ind_serv = .
replace type_ind_serv = 0				if type_ind_ag==1 | type_ind_manuf==1
replace	type_ind_serv = 1				if type_ind_ag==0 & type_ind_manuf==0
label var type_occ_ag "=1 if industry is service"

keep hhcode idc working active_lfp work_days_month work_months_year income ///
	income_m income_y self_employed salaried type_*

save "${...}\Temp\2018-19\employment.dta", replace 



* Merging all datasets
use "${...}\Temp\2018-19\roster.dta", clear

merge 1:1 hhcode idc using "${...}\Temp\2018-19\education.dta"
drop if _merge==2
drop _merge	

merge 1:1 hhcode idc using "${...}\Temp\2018-19\employment.dta"
drop if _merge==2
drop _merge

merge m:1 hhcode using "${...}\Temp\2018-19\time.dta"
drop if _merge==2
drop _merge

merge m:1 psu using "${...}\Temp\2018-19\weights.dta"
drop if _merge==2
drop _merge

bys dist:						egen employed_dist = sum(working)
label var employed_dist "Total employed people in each district"

bys dist:						egen lfp_dist = sum(active_lfp)
label var lfp_dist "Total active labor force in each district"

gen work_age = .
replace work_age = 0			if age<16 | age>60
replace work_age = 1			if age>=16 & age<=60
label var work_age "=1 if in the working age"

bys dist:						egen workage_dist = sum(work_age)
label var workage_dist "Total working age population in each district"

gen emp_lfp = (employed_dist / lfp_dist) * 100
label var emp_lfp "Employed to active labor force participants ratio -in each district"

gen emp_workage = (employed_dist / workage_dist) * 100
label var emp_lfp "Employed to working age population ratio -in each district"

*bys dist_uniq:						egen sick_dist = sum(sick_injured)
*label var sick_dist "Total sick in each district"

keep	if province==2

*gen gdp_deflator_15 = 246.3436449 / 100
*gen gdp_deflator_16 = 236.6180588 / 100 

*gen cpi_14 = 141.699320320248 / 100
*gen cpi_15 = 145.283361149409 / 100

gen inflation_18 = 0.05078057
gen inflation_19 = 0.1057836

gen 	real_income = income_m / (1 + inflation_18)		if year==2018
replace real_income = income_m / (1 + inflation_19)		if year==2019
label var real_income "monthly cash income adjusted for inflation"

gen ln_income = ln(real_income)
label var ln_income "Log of real monthly cash income"

gen district = dist
				
recode district		(2011=100) (2012=100) (2102=102) (2111=101) (2121=102) (2131=103) ///
					(2141=104) (2202=105) (2211=105) (2221=106) (2231=107) (2241=108) ///
					(2302=109) (2311=109) (2321=136) (2331=110) (2341=111) (2402=112) ///
					(2411=112) (2421=115) (2431=113) (2441=116) (2451=114) (2461=117) ///
					(2502=118) (2521=119) (2531=121) (2541=135) (2602=123) (2611=120) ///
					(2621=123) (2631=126) (2702=124) (2711=122) (2721=124) (2731=127) ///
					(2741=125) (2802=128) (2811=128) (2821=129) (2831=130) (2841=131) ///
					(2902=132) (2911=132) (2921=133) (2931=134)
				
drop dist

label define dist4 100 "Islamabad" 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib" 136 "Chiniot"

label values district dist4
																															
save "${...}\PSLSM_1819_final.dta", replace
