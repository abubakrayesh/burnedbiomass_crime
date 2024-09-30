*** This do file cleans MICS 2017-18 datasets and restricts them to relevant	***
***	variables.	

clear
set more off
				
				
				
**	Cleaning and Merging MICS 2017-18	**

* Month and year of interview
use "${...}\MICS2017_Punjab\Households.dta", clear	

rename *, lower	

gen 		month = hh5m
label define monthname 1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" ///
			8 "Aug" 9 "Sep" 10 "Oct" 11"Nov" 12"Dec"
label values month monthname	

gen			year = 2017		if hh5y==2017
replace		year = 2018		if hh5y==2018

egen hhcode = group(hh1 hh2)

rename hh7 district

decode district, gen(dist_name)

keep hhcode month year district dist_name

drop district
sort dist_name
encode dist_name, gen(dist_id)


save "${...}\Temp\2017-18\time.dta", replace 


* Men's Education, Violence and Satisfaction data
use "${...}\MICS2017_Punjab\Men.dta", clear	

rename *, lower	

egen hhcode = group(hh1 hh2)
rename mwm3 idc

rename mwb4 age

gen male=1

gen 	happy_current = .
replace happy_current = 0		if mls1==3 | mls1==4 | mls1==5 
replace happy_current = 1		if mls1==1 | mls1==2
label var happy_current "=1 if overall life estimation is happy"

gen 	happy_nowvslast = .
replace happy_nowvslast = 0		if mls3==3 
replace happy_nowvslast = 1		if mls3==1 | mls3==2
label var happy_nowvslast "=1 if overall life estimation this yr is happier vs last year"

gen 	happy_nowvsnext = .
replace happy_nowvsnext = 0		if mls4==3
replace happy_nowvsnext = 1		if mls4==1 | mls4==2
label var happy_nowvsnext "=1 if overall life estimation this yr is happier vs last year"

gen 	years_educ=.
replace	years_educ = 0			if mwb5==2
replace years_educ = 5			if mwb6a==1
replace years_educ = 10			if mwb6a==2
replace years_educ = 12			if mwb6a==3
replace years_educ = 16			if mwb6a==4

gen 	violence_justified = .
replace	violence_justified = 0		if		mdv1a==2 & mdv1b==2 & mdv1c==2 & mdv1d==2 & mdv1e==2
replace violence_justified = 1		if 		mdv1a==1 | mdv1b==1 | mdv1c==1 | mdv1d==1 | mdv1e==1

keep hhcode idc happy_* violence_justified years_educ male age

save "${...}\Temp\2017-18\men.dta", replace 

* Merging all datasets
use "${...}\Temp\2017-18\time.dta", clear

merge 1:m hhcode using "${...}\Temp\2017-18\men.dta"
drop if _merge==2
drop _merge	

*recode district		(1=132) (2=133) (3=134) (4=128) (5=130) (6=131) (7=129) (8=109) ///
*					(9=136) (10=110) (11=111) (12=112) (12=113) (14=115) (15=116) ///
*					(16=117) (17=114) (18=118) (19=119) (20=135) (21=121) (22=124) ///
*					(23=125) (24=127) (25=122) (26=102) (27=101) (28=104) (29=103) ///
*					(30=123) (31=120) (32=126) (33=105) (34=106) (35=107) (36=108)

label define dist4 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakhar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bhawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib" 136 "Chiniot"

save "${...}\MICS_1718_final.dta", replace
