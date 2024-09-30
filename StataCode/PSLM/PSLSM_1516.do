*** This do file cleans HIES 2015-16 datasets and restricts them to relevant	***
***	variables.																	*** 

clear
set more off

**	Cleaning and Merging PSLSMS 2015-16	**

* Month and year of interview
use "${...}\PSLM-HIES 2015-16\sec_00a.dta", clear

gen 		month = enum_month
label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname	

gen			year = 2015		if enum_year==2015
replace		year = 2016		if enum_year==2016

keep hhcode month year

save "${...}\Temp\2015-16\time.dta", replace 


* Adding hh weights
use "${...}\PSLM-HIES 2015-16\weight.dta", clear

keep psu weights

save "${...}\Temp\2015-16\weights.dta", replace 


* Roster of all households
use "${...}\PSLM-HIES 2015-16\roster.dta", clear

gen dist=trunc(hhcode/100000)
#delimit ;
lab def dist 14231 "Peshawar"
14232 "Peshawar"
14233 "Peshawar"
21231 "Rawalpindi"
21232 "Rawalpindi"
21233 "Rawalpindi"
22131 "Sargodha"
22132 "Sargodha"
22133 "Sargodha"
23131 "Faisalabad"
23132 "Faisalabad"
23133 "Faisalabad"
24131 "Gujranwala"
24132 "Gujranwala"
24133 "Gujranwala"
24531 "Sialkot"
24532 "Sialkot"
24533 "Sialkot"
25131 "Lahore"
25132 "Lahore"
25133 "Lahore"
27231 "Multan"
27232 "Multan"
27233 "Multan"
29131 "Bahawalpur"
29132 "Bahawalpur"
29133 "Bahawalpur"
32131 "Sukkur"
32132 "Sukkur"
33331 "Hyderabad"
33332 "Hyderabad"
33333 "Hyderabad"
35131 "Karachi West"
35132 "Karachi West"
35133 "Karachi West"
35231 "Karachi Malir"
35232 "Karachi Malir"
35233 "Karachi Malir"
35331 "Karachi South"
35332 "Karachi South"
35333 "Karachi South"
35431 "Karachi East"
35432 "Karachi East"
35433 "Karachi East"
35531 "Karachi Central"
35532 "Karachi Central"
35533 "Karachi Central"
41131 "Quetta"
41132 "Quetta"
41133 "Quetta"
61131 "Islamabad"
61132 "Islamabad"
61133 "Islamabad"
11020 "MALAKAND"
12020 "HAZARA"
13020 "MARDAN"
14020 "PESHAWAR"
15020 "KOHAT"
16020 "BANNU"
17020 "D.I.KHAN"
21020 "RAWALPINDI"
22020 "SARGODHA"
23020 "FAISALABAD"
24020 "GUJRANWALA"
25020 "LAHORE"
26020 "SAHIWAL"
27020 "MULTAN"
28020 "D.G.KHAN"
29020 "BAHAWALPUR"
31020 "LARKANA"
32020 "SUKKUR"
33020 "HYDERABAD"
34020 "MIRPUR KHAS"
41020 "QUETTA"
42020 "ZHOB"
43020 "SIBBI"
44020 "NASIRABAD"
45020 "KALAT"
46020 "MEKRAN"
11110 "Chitral"
11210 "Upper Dir"
11310 "Lower Dir"
11410 "Swat"
11510 "Shangla"
11610 "Bonair"
11710 "Malakand"
12110 "Kohistan"
12210 "Manshera"
12310 "Batagram"
12410 "Abbottabad"
12510 "Haripur"
12610 "Tor Garh"
13110 "Mardan"
13210 "Swabi"
14110 "Charsada"
14210 "Peshawar"
14310 "Nowsehra"
15110 "Kohat"
15210 "Hangu"
15310 "Karak"
16110 "Bannu"
16210 "Lakki Marwat"
17110 "D. I. Khan"
17210 "Tank"
21110 "Attock"
21210 "Rawalpindi"
21310 "Jehlum"
21410 "Chakwal"
22110 "Sargodha"
22210 "Bhakhar"
22310 "Khushab"
22410 "Mianwali"
23110 "Faisalabad"
23210 "Chiniot"
23310 "Jhang"
23410 "T.T. Singh"
24110 "Gujranwala"
24210 "Hafizabad"
24310 "Gujrat"
24410 "Mandi Bahuddin"
24510 "Sialkot"
24610 "Narowal"
25110 "Lahore"
25210 "Kasur"
25310 "Sheikhupura"
25410 "Nankana Sahib"
26110 "Okara"
26210 "Sahiwal"
26310 "Pakpatten"
27110 "Vehari"
27210 "Multan"
27310 "Lodhran"
27410 "Khanewal"
28110 "D. G. Khan"
28210 "Rajanpur"
28310 "Layyah"
28410 "Muzaffar Garh"
29110 "Bahawalpur"
29210 "Bahawalnagar"
29310 "Rahim Yar Khan"
31110 "Jacobabad"
31210 "Kashmore"
31310 "Shikarpur"
31410 "Larkana"
31510 "Shahdadkot"
32110 "Sukkur"
32210 "Ghotki"
32310 "Khairpur"
32410 "Nowshero Feroze"
32510 "Nawabshah"
33110 "Dadu"
33210 "Jamshoro"
33310 "Hyderabad"
33410 "Tando Allah Yar"
33510 "Tando Muhammad Khan"
33610 "Matiari"
33710 "Badin"
33810 "Thatta"
33910 "Sijawal"
34110 "Sanghar"
34210 "Mir Pur Khas"
34310 "Umer Kot"
34410 "Tharparkar"
35010 "Karachi West"
35010 "Karachi Malir"
35010 "Karachi South"
35010 "Karachi East"
35010 "Karachi Central"
41010 "Quetta"
41010 "Pishine"
41010 "Qilla Abdullah"
41010 "Chaghai"
41010 "Nushki"
42010 "Loralai"
42010 "Barkhan"
42010 "Musa Khel"
42010 "Qilla Saifullah"
42010 "Zhob"
42010 "Sherani"
43010 "Sibbi"
43010 "Harnai"
43010 "Ziarat"
43010 "Kohlu"
43010 "Dera Bugti"
44010 "Bolan/ Kachhi"
44010 "Jaffarabad"
44010 "Nasirabad/ Tamboo"
44010 "Jhal Magsi"
45010 "Kalat"
45010 "Mastung"
45010 "Khuzdar"
45010 "Awaran"
45010 "Kharan"
45010 "Washuk"
45010 "Lasbela"
46010 "Ketch/Turbat"
46010 "Gwader"
46010 "Panjgoor"
61110 "ISLAMABAD", replace;
lab val dist dist;
recode dist (11020=11710)
(12020=12510)
(13020=13110)
(14231=14210) (14232=14210) (14233=14210) (14020=14210)
(15020=15110)
(16020=16110)
(17020=17110)
(21231=21210) (21232=21210) (21233=21210) (21020=21210)
(22131=22110) (22132=22110) (22133=22110) (22020=22110)
(23131=23110) (23132=23110) (23133=23110) (23020=23110)
(24131=24110) (24132=24110) (24133=24110) (24020=24110)
(24531=24510) (24532=24510) (24533=24510)
(25131=25110) (25132=25110) (25133=25110) (25020=25110)
(26020=26210)
(27231=27210) (27232=27210) (27233=27210) (27020=27210)
(28020=28110)
(29131=29110) (29132=29110) (29133=29110) (29020=29110)
(31020=31410)
(32131=32110) (32132=32110) (32020=32110)
(33331=33310) (33332=33310) (33333=33310) (33020=33310)
(34020=34210)
(35131=35010) (35132=35010) (35133=35010)
(35231=35010) (35232=35010) (35233=35010)
(35331=35010) (35332=35010) (35333=35010)
(35431=35010) (35432=35010) (35433=35010)
(35531=35010) (35532=35010) (35533=35010)
(41131=41010) (41132=41010) (41133=41010) (41020=41010)
(42020=42010)
(43020=43010)
(44020=44010)
(45020=45010)
(46020=46010)
(61131=61110) (61132=61110) (61133=61110), gen(dist_uniq);
lab val dist_uniq dist;
#delimit cr

gen male = 0
replace male = 1		if s1aq04==1

keep 		idc hhcode province dist_uniq age male	psu	
	
save "${...}\Temp\2015-16\roster.dta", replace 


* Education Information
use "${...}\PSLM-HIES 2015-16\sec_2a.dta", clear
			
gen read_write = .
replace read_write = 0 		if s2ac01==2 | s2ac02==2
replace read_write = 1 		if s2ac01==1 & s2ac02==1
label var read_write 		"=1 if person can both read and write in any language"

gen ever_school = .
replace ever_school = 0 	if s2ac04==2
replace ever_school = 1 	if s2ac04==1
label var ever_school 		"=1 if person ever attended school"

gen years_educ = s2ac05
replace	years_educ = 0		if ever_school==0
replace years_educ = 12 	if s2ac05==12 | s2ac05==11
replace years_educ = 16 	if s2ac05==13 | s2ac05==15 | s2ac05==16 | s2ac05==17 | s2ac05==18 // Assuming BA/BSc/Degree in engineering, computers  //
																			 // and agriculture equals 16 years of education	 //
replace years_educ = 17 	if s2ac05==14 						// Assuming MA/MSc, MBBS equals 17 years of education //
replace years_educ = 21 	if s2ac05==19									// Assuming PhD/M.Phil equals 21 years of education //
replace years_educ = .a 	if s2ac05==20									// Taking "others" as missing vallues, total no of "others" //
																			// observations is 80 //
label var years_educ 		"Total completed years of education"

keep 		hhcode idc read_write years_educ ever_school
			
save "${...}\Temp\2015-16\education.dta", replace 


* Employment Information
use "${...}\PSLM-HIES 2015-16\sec_1b.dta", clear	

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

save "${...}\Temp\2015-16\employment.dta", replace 



* Merging all datasets
use "${...}\Temp\2015-16\roster.dta", clear

merge 1:1 hhcode idc using "${...}\Temp\2015-16\education.dta"
drop if _merge==2
drop _merge	

merge 1:1 hhcode idc using "${...}\Temp\2015-16\employment.dta"
drop if _merge==2
drop _merge

merge m:1 hhcode using "${...}\Temp\2015-16\time.dta"
drop if _merge==2
drop _merge

merge m:1 psu using "${...}\Temp\2015-16\weights.dta"
drop if _merge==2
drop _merge

bys dist_uniq:						egen employed_dist = sum(working)
label var employed_dist "Total employed people in each district"

bys dist_uniq:						egen lfp_dist = sum(active_lfp)
label var lfp_dist "Total active labor force in each district"

gen work_age = .
replace work_age = 0			if age<16 | age>60
replace work_age = 1			if age>=16 & age<=60
label var work_age "=1 if in the working age"

bys dist_uniq:						egen workage_dist = sum(work_age)
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

gen inflation_15 = 0.02529328173
gen inflation_16 = 0.03765119164

gen 	real_income = income_m / (1 + inflation_15)		if year==2015
replace real_income = income_m / (1 + inflation_16)		if year==2016
label var real_income "monthly cash income adjusted for inflation"

gen ln_income = ln(real_income)
label var ln_income "Log of real monthly cash income"


gen district = dist_uniq
				
recode district		(6110=100) (21110=101) (21210=102) (21310=103) (21410=104) (22110=105) ///
					(22210=106) (22310=107) (22410=108) (23110=109) (232=136) (23310=110) ///
					(23410=111) (24110=112) (24210=115) (24310=113) (24410=116) (24510=114) ///
					(24610=117) (25110=118) (25210=119) (25310=121) (25410=135) (26110=120) ///
					(26210=123) (26310=126) (27110=122) (27210=124) (27310=127) (27410=125) ///
					(28110=128) (28210=129) (28310=130) (28410=131) (29110=132) (29210=133) ///
					(29310=134) (61110=136)
				
drop dist_uniq

label define dist4 100 "Islamabad" 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib" 136 "Chiniot"

label values district dist4
																															
save "${...}\PSLSM_1516_final.dta", replace
