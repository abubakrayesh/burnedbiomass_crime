

clear
set more off

**	Cleaning and Merging PSLSMS 2004-05	**

* Month and year of interview
use "${...}\PSLM 2004-05\SA_interview_info.dta", clear

rename *,	lower

tostring a6_date1, replace
gen month = substr(a6_date1, -4, 2)
destring month, replace

label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname

tostring a6_date1, replace
gen yr = substr(a6_date1, -2, 2)

drop	year
gen 	year = 2004	if yr=="04"
replace	year = 2005 if yr=="05"

tostring pcode hno, replace
egen hhcode = concat (pcode hno)
destring hhcode pcode hno,		replace

rename msno				idc

keep hhcode month year

bys hhcode: gen place=_n
tab place
drop if place>1					//only 2 observations deleted//

save "${...}\Temp\2004-05\time.dta", replace 


* Roster of all households
use "${...}\PSLM 2004-05\SB_HH_Member.dta", clear

rename *,	lower

gen district=trunc(pcode/100000)

recode district (302=303)

label define dist 100 "Islamabad" 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
201	"Khairpur" 202	"Sukkur" 203 "Nawabshah" 204 "Nowshero Feroze" 205 "Ghotki" ///
207	"Shikarpur" 208	"Larkana" 209	"Dadu" 210 "Hyderabad" 211 "Badin" 212 "Thatta" ///
213	"Sanghar" 214 "Mir Pur Khas" 215 "Tharparkar" 216"Karachi" 301 "Swat" ///
303	"Dir" 304	"Chitral" 305 "Shangla" 306	"Malakand" 307 "Bonair" 308	"Peshawar" ///
309	"Charsada" 310 "Nowshra" 311 "Kohat" 312 "Karak" 313 "Hangu" 314 "D.I. Khan" ///
315	"Tank" 316 "Manshera" 317 "Abbottabad" 318 "Batgram" 319 "Kohistan" 320 "Haripur" 321	"Bannu" ///
322	"Lakki Marwat" 323 "Mardan" 324	"Swabi" 401	"Quetta" 402 "Pashin" ///
403	"Qillah Abdullah" 404 "Chghi" 405 "Sibbi" 406 "Ziarat" 408 "Deara Bughti" ///
409	"Kalat" 410	"Mastung" 411 "Khuzdar" 412	"Awaran" 413 "Kharan" 414 "Lasbilla" ///
415	"Ketch/Turbat" 416 "Gawadar" 417 "Panjgur" 418 "Zhob" 419 "Loralai" ///
420	"Barkhan" 421	"Musa Khel" 422	"Qillah Abdullah" 423	"Nasirabad" ///
424	"Jafarabad" 425	"Jhal Magsi" 426	"Bolan/Kachi"

label values district dist

gen province = 1
replace province = 2	if inrange(district, 200, 299)
replace province = 3	if inrange(district, 300, 399)
replace province = 4	if inrange(district, 400, 499)

label define prov 1 "punjab" 2"sind" 3 "nwfp" 4 "baluchistan"
label values province prov

tostring pcode hno, replace
egen hhcode = concat (pcode hno)
destring hhcode pcode hno,		replace

rename msno				idc

tostring pcode, gen(code)
gen region = substr(code, -5, 1)
destring region, replace

rename b4	 				age

gen male = 0
replace male = 1		if b1==1

keep		hhcode idc  province district age male

save "${...}\Temp\2004-05\roster.dta", replace 


* Education Information
use "${...}\PSLM 2004-05\SC_Education.dta", clear

rename *,	lower

tostring pcode hno, replace
egen hhcode = concat (pcode hno)
destring hhcode pcode hno,		replace 

rename msno				idc
			
gen read_write = .
replace read_write = 0 		if c1==2
replace read_write = 1 		if c1==1
label var read_write 		"=1 if person can both read and write in any language"

gen ever_school = .
replace ever_school = 0 	if c3==2
replace ever_school = 1 	if c3==1
label var ever_school 		"=1 if person ever attended school"

gen years_educ = c4
replace	years_educ = 0		if ever_school==0
replace years_educ = 12 	if c4==11
replace years_educ = 16 	if c4==12 | c4==13 | c4==15 | c4==16 // Assuming BA/BSc/Degree in engineering, computers  //
																			 // and agriculture equals 16 years of education	 //
replace years_educ = 17 	if c4==14 | c4==17						// Assuming MA/MSc, MBBS equals 17 years of education //
replace years_educ = 21 	if c4==18									// Assuming PhD/M.Phil equals 21 years of education //
replace years_educ = .a 	if c4==19									// Taking "others" as missing vallues, total no of "others" //
																			// observations is 80 //
label var years_educ 		"Total completed years of education"

keep 	hhcode idc read_write ever_school years_educ
	
bys hhcode idc: gen place = _n
tab place
drop if place>1		//only 1 observation dropped//
drop place
			
save "${...}\Temp\2004-05\education.dta", replace 


* Employment Information
use "${...}\PSLM 2004-05\SE_Employment.dta", clear	

rename *,	lower

tostring pcode hno, replace
egen hhcode = concat (pcode hno)
destring hhcode pcode hno,		replace 

rename msno				idc

gen has_job = .
replace has_job = 0 				if e02==2
replace has_job = 1 				if e02==1 | e01==1
label var has_job 					"=1 if the person has a job conditional on looking for a job"

gen		working = 0
replace working = 1 				if has_job==1
label var working "=1 if the person has a job"

gen active_lfp = .
replace active_lfp = 0				if e05!=. | e06!=.
replace active_lfp = 1				if e01==1 | e02==1 | e03==1 | e04==1
label var active_lfp "=1 if the individual is active in the labor market"

rename e12			work_days_month
rename e14			work_months_year
rename e13			income_m
rename e16			income_y

gen income_y_to_m = income_y/12		if income_m==.

egen income = rowtotal 		(income_m income_y_to_m), m
label var income "monthly cash income earned"

gen		self_employed = .
replace	self_employed = 0			if e07!=2 & e07!=3 & e07!=5 & e07!=7 & e07!=8 &  e07!=.
replace	self_employed = 1			if e07==2 | e07==3 | e07==5 | e07==7 | e07==8
label var self_employed "=1 if self employed"

gen		salaried = .
replace	salaried = 0				if e07!=1 & e07!=4 & e07!=6 & e07!=.
replace	salaried = 1					if e07==1 | e07==4 | e07==6
label var salaried "=1 if salaried"

gen		type_occ_ag = .
replace type_occ_ag = 0				if e09!=6 & e09!=.
replace	type_occ_ag = 1				if e09==6
label var type_occ_ag "=1 if nature of occ. is agriculture"

gen		type_occ_manuf = .
replace type_occ_manuf = 0				if e09!=8 & e09!=.
replace	type_occ_manuf = 1				if e09==8
label var type_occ_manuf "=1 if nature of occ. is manufacturing"

gen		type_occ_serv = .
replace type_occ_serv = 0				if type_occ_ag==1 | type_occ_manuf==1
replace	type_occ_serv = 1				if type_occ_ag==0 & type_occ_manuf==0
label var type_occ_ag "=1 if nature of occ. is service"

gen		type_ind_ag = .
replace type_ind_ag = 0				if e10!=1 & e10!=2 & e10!=.
replace	type_ind_ag = 1				if e10==1 | e10==2
label var type_ind_ag "=1 if industry is ag"

gen		type_ind_manuf = .
replace type_ind_manuf = 0				if e10!=3 & e10!=4 & e10!=5 & e10!=.
replace	type_ind_manuf = 1				if e10==3 | e10==4 | e10==5
label var type_ind_manuf "=1 if industry is manufacturing, electric or construction"

gen		type_ind_serv = .
replace type_ind_serv = 0				if type_ind_ag==1 | type_ind_manuf==1
replace	type_ind_serv = 1				if type_ind_ag==0 & type_ind_manuf==0
label var type_occ_ag "=1 if industry is service"

keep hhcode idc has_job working active_lfp work_days_month work_months_year income ///
	income_m income_y self_employed salaried type_*
									
save "${...}\Temp\2004-05\employment.dta", replace 


* Health Information
use "${...}\PSLM 2004-05\SD_Health.dta", clear	

rename *,	lower

tostring pcode hno, replace
egen hhcode = concat (pcode hno)
destring hhcode pcode hno,		replace 

rename msno				idc


gen sick_injured = .
replace sick_injured = 0 			if d1==2
replace sick_injured = 1 			if d1==1
label var sick_injured 				"=1 if sick or injured in last two weeks"

gen consulted_doc = .
replace consulted_doc = 0			if d2==2
replace consulted_doc = 1			if d2==1
label var consulted_doc				"=1 if consulted a doctor"

keep hhcode idc sick_injured consulted_doc

save "${...}\Temp\2004-05\health.dta", replace 


* Merging all datasets
use "${...}\Temp\2004-05\roster.dta", clear

merge 1:1 hhcode idc using "${...}\Temp\2004-05\education.dta"
drop if _merge==2
drop _merge	

merge 1:1 hhcode idc using "${...}\Temp\2004-05\employment.dta"
drop if _merge==2
drop _merge

merge 1:1 hhcode idc using "${...}\Temp\2004-05\health.dta"
drop if _merge==2
drop _merge

merge m:1 hhcode using "${...}\Temp\2004-05\time.dta"
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

*gen	year = 2004		

keep	if province==1

gen gdp_deflator_04 = 78.4822385676479 / 100
gen gdp_deflator_05 = 83.9967669240849 / 100

gen cpi_04 = 50.7200615536489 / 100
gen cpi_05 = 55.3169867746759 / 100

gen inflation_04 = 0.0744462469342739
gen inflation_05 = 0.09906332737

gen 	real_income = income_m / (1 + inflation_04)		if year==2004
replace real_income = income_m / (1 + inflation_05)		if year==2005
label var real_income "monthly cash income adjusted for inflation"

gen ln_income = ln(real_income)
label var ln_income "Log of real monthly cash income"

save "${...}\PSLSM_0405_final.dta", replace
