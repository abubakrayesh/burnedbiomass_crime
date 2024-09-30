****	This do file uses DTA files created in R, to create one final dta file  ****
****	of distance from rice growing districts									****


*********THE BELOW CAN ONLY BE DONE ONCE THE DISTANCE DTA FILES HAVE BEEN CREATED IN R USING R CODE************


*now using the stata files from R to calculate mean distance for each rice district
*first, append all the stata files generated from R
use "${...}\distshape_1.dta", clear

foreach num of numlist 2/12 {
	append using "${...}\distshape_`num'.dta"
}

foreach num of numlist 1/12 {
	append using "${...}\distshape_r`num'.dta"
}

rename ADM2_EN dist_name
rename ADM2_PCODE dist_id

*gen ADM2_PCODE = min_dist_id

save "${...}\final_distance.dta", replace


*now merging the appended dataset from R with treatment data
use "${...}\treatment.dta", clear

decode dist_id, gen(distid_str)
drop dist_id
rename distid_str dist_id

encode dist_id, gen(distid_num)

*keep if treat_code!=1
keep ADM2_EN ADM2_PCODE dist_id distid_num


merge 1:m dist_id using "${...}\final_distance.dta", force
drop if _merge==2
drop _merge

encode min_dist_id, gen(min_distid)
drop min_dist_id
rename min_distid min_dist_id

bys dist_id: egen mean_ricedist_distance = mean(min_distance)

drop dist_id
rename distid_num dist_id

collapse (max) mean_ricedist_distance, by(dist_id)

label var mean_ricedist_distance "Avg. dist from rice dist.s to non-rice dist.s, =1 for rice dist.s"

save "${...}\final_ricedist_distance.dta", replace





		**********************************************************
