*** This do file uses all PSLSM, MICS and HIES datasets to create the final		***
*** PSLM dataset, ready for merging to crime dataset							***
***	First, run all the other DO files in this folder, and then run this one		***

clear
set more off


****** Now create the necessary variables in each dataset and merge them ******


foreach num of numlist 405 607 809	{				

use "${...}\PSLSM_0`num'_final.dta", clear

bys district: egen pslm_lit_dist = sum(read_write)
label var pslm_lit_dist "no of ppl who can read and write, in each district"

bys district: egen pslm_sch_dist = sum(ever_school)
label var pslm_sch_dist "no of ppl who ever attended school, in each district"

bys district: egen pslm_meaneduc_dist = mean(years_educ)
label var pslm_meaneduc_dist "mean years of schooling in each district"

bys district: egen pslm_meandaywk_dist = mean(work_days_month)
label var pslm_meandaywk_dist "mean days worked in each district"

rename employed_dist pslm_emp_dist
rename emp_lfp 		 pslm_emp_lfp
rename emp_workage	 pslm_emp_wkage
rename workage_dist  pslm_wkage_dist

keep year month district pslm*

drop if year==.

*keep if month==10 | month==11 | month==1 | month==2

collapse (max) pslm*, by(year district)

save "${...}\pslm0`num'.dta", replace

}



foreach num of numlist 1011 1213 1415 1516 1819 1920	{				

use "${...}\PSLSM_`num'_final.dta", clear


bys district: egen pslm_lit_dist = sum(read_write)
label var pslm_lit_dist "no of ppl who can read and write, in each district"

bys district: egen pslm_sch_dist = sum(ever_school)
label var pslm_sch_dist "no of ppl who ever attended school, in each district"

bys district: egen pslm_meaneduc_dist = mean(years_educ)
label var pslm_meaneduc_dist "mean years of schooling in each district"

bys district: egen pslm_meandaywk_dist = mean(work_days_month)
label var pslm_meandaywk_dist "mean days worked in each district"


rename employed_dist pslm_emp_dist
rename emp_lfp 		 pslm_emp_lfp
rename emp_workage	 pslm_emp_wkage
rename workage_dist  pslm_wkage_dist

keep year month district pslm*

drop if year==.

*keep if month==10 | month==11 | month==1 | month==2

collapse (max) pslm*, by(year district)

save "${...}\pslm`num'.dta", replace

}




****** Now append all the PSLSM datasets ******

use "${...}\pslm0405.dta", clear

foreach num of numlist 607 809 {

	append using "${...}\pslm0`num'.dta"
	}

foreach num of numlist 1011 1213 1415 1516 1819 1920 {

	append using "${...}\pslm`num'.dta"
	}
	
drop if district==100

label define dist10 101 "Attock" 102 "Rawalpindi" 103 "Jehlum" 104	"Chakwal" ///
105	"Sarghodha" 106	"Bhakkar" 107 "Khushab" 108	"Mianwali" 109	"Faisalabad" ///
110	"Jhang" 111	"T. T. singh" 112	"Gujranwala" 113	"Gujrat" 114 "Sialkot" ///
115	"Hafizabad" 116	"Mandi Bahuddin" 117	"Narowal" 118 "Lahore" 119 "Kasur" ///
120	"Okara" 121	"Sheikhupura" 122 "Vehari" 123 "Sahiwal" 124 "Multan" 125 "Khanewal" ///
126	"Pakpatten" 127	"Lodhran" 128 "D.G. Khan" 129 "Rajanpur" 130 "Layya" ///
131	"Muzaffar Garh" 132	"Bahawalpur" 133	"Bahawalnagar" 134	"Rahimyar Khan" ///
135 "Nankana Sahib" 136 "Chiniot"

label values district dist10

decode district, gen(dist_name)
sort dist_name
encode dist_name, gen(dist_id)
drop district	
						
collapse (mean) pslm_* (first) dist_name, by(year dist_id)
	
save "${...}\final_pslm_district.dta", replace
