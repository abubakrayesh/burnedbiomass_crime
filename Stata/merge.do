****	This do file merges all the  data. 										****
****	It also creates necessary variables.									****														


clear
set more off

*******		Merging and creating the necessary variables		***********

*merge fire and aod data
use "${...}\aod_final_d.dta", clear

keep year dist_id dist_name d_avgt_aod d_w_avgt_aod d_s_avgt_aod d_w_avgt_2_aod

merge 1:1 year dist_id using "${...}\aod_final_d_new.dta", 	///
					keepusing(mean_stat_aod)
drop if _merge==2
drop _merge


merge 1:1 year dist_id using "${...}\fire_final_d.dta", 	///
					keepusing(d_avgt_fire d_w_avgt_fire d_s_avgt_fire)
drop if _merge==2
drop _merge


*merge population data
merge m:1 dist_id using "${...}\pop_final.dta" 
drop if _merge==2
drop _merge

label var pop_2017 "district population in 2017 census"
label var pop_1998 "district population in 1998 cnsus"
label var area_2017 "district area in 2017 census"
label var area_1998 "district area in 1998 census"
label var no_hh_2017 "no of houses in each district in 2017 census"
label var no_hh_1998 "no of houses in each district in 1998 census"
label var density_2017 "population density in each district in 2017 census"
label var density_1998 "population density in each district in 1998 census"

*merge treatment data
merge m:1 dist_id using "${...}\treatment.dta"
drop if _merge==2
drop _merge

drop 	Shape_Leng Shape_Area ADM2_EN ADM2_PCODE ADM2_REF ADM2ALT1EN ADM2ALT2EN ///
					ADM1_EN ADM1_PCODE ADM0_PCODE ADM0_EN date validOn validTo

*merge precipitation data
merge 1:1 year dist_id using "${...}\precip_final_d.dta", 	///
					keepusing(d_avgt_precip d_w_avgt_precip d_s_avgt_precip)
drop if _merge==2
drop _merge

*merge temperature data
merge 1:1 year dist_id using "${...}\temp_final_d.dta", 	///
					keepusing(d_avgt_temp d_w_avgt_temp d_s_avgt_temp)
drop if _merge==2
drop _merge

*merge rice data
merge m:1 year dist_id using "${...}\rice_final.dta"
drop if _merge==2
drop _merge


*merge wind u at 850 hPa data
merge 1:1 year dist_id using "${...}\windu850_final_d.dta", 	///
					keepusing(d_avgt_windu850 d_w_avgt_windu850 d_s_avgt_windu850 d_w_avgt_2_windu850 d_w_avgt_lag_windu850)
drop if _merge==2
drop _merge

*merge wind v at 850 hPa data
merge 1:1 year dist_id using "${...}\windv850_final_d.dta", 	///
					keepusing(d_avgt_windv850 d_w_avgt_windv850 d_s_avgt_windv850 d_w_avgt_2_windv850 d_w_avgt_lag_windv850)
drop if _merge==2
drop _merge

gen d_avgt_windspeed850 = sqrt( (d_avgt_windu850^2) + (d_avgt_windv850^2) )
label var d_avgt_windspeed850 "avg windspeed at 850hPa each year in each district"

gen d_avgt_winddir850 = .
replace d_avgt_winddir850 = atan2(d_avgt_windv850, d_avgt_windu850) 		if d_avgt_windu850>0
replace d_avgt_winddir850 = atan2(d_avgt_windv850, d_avgt_windu850) + c(pi)	if d_avgt_windu850<0 & d_avgt_windv850>=0 
replace d_avgt_winddir850 = atan2(d_avgt_windv850, d_avgt_windu850) - c(pi)	if d_avgt_windu850<0 & d_avgt_windv850<0
replace d_avgt_winddir850 =  c(pi)											if d_avgt_windu850>0 & d_avgt_windv850==0
replace d_avgt_winddir850 = - c(pi)											if d_avgt_windu850<0 & d_avgt_windv850==0
label var d_avgt_winddir850 "avg wind direction at 850hPa each year in each district"

gen d_w_avgt_windspeed850 = sqrt( (d_w_avgt_windu850^2) + (d_w_avgt_windv850^2) )
label var d_w_avgt_windspeed850 "mean windspeed at 850hPa in treatment months each year in each district"

gen d_s_avgt_windspeed850 = sqrt( (d_s_avgt_windu850^2) + (d_s_avgt_windv850^2) )
label var d_s_avgt_windspeed850 "mean windspeed at 850hPa in nontreatment months each year in each district"

gen d_w_avgt_winddir850 = .
replace d_w_avgt_winddir850 = atan2(d_w_avgt_windv850, d_w_avgt_windu850) 			if d_w_avgt_windu850>0
replace d_w_avgt_winddir850 = atan2(d_w_avgt_windv850, d_w_avgt_windu850) + c(pi)	if d_w_avgt_windu850<0 & d_w_avgt_windv850>=0 
replace d_w_avgt_winddir850 = atan2(d_w_avgt_windv850, d_w_avgt_windu850) - c(pi)	if d_w_avgt_windu850<0 & d_w_avgt_windv850<0
replace d_w_avgt_winddir850 =  c(pi)												if d_w_avgt_windu850>0 & d_w_avgt_windv850==0
replace d_w_avgt_winddir850 = - c(pi)												if d_w_avgt_windu850<0 & d_w_avgt_windv850==0
label var d_w_avgt_winddir850 "avg wind direction at 850hPa for treatment months each year in each district"

gen d_s_avgt_winddir850 = .
replace d_s_avgt_winddir850 = atan2(d_s_avgt_windv850, d_s_avgt_windu850) 			if d_s_avgt_windu850>0
replace d_s_avgt_winddir850 = atan2(d_s_avgt_windv850, d_s_avgt_windu850) + c(pi)	if d_s_avgt_windu850<0 & d_s_avgt_windv850>=0 
replace d_s_avgt_winddir850 = atan2(d_s_avgt_windv850, d_s_avgt_windu850) - c(pi)	if d_s_avgt_windu850<0 & d_s_avgt_windv850<0
replace d_s_avgt_winddir850 =  c(pi)												if d_s_avgt_windu850>0 & d_s_avgt_windv850==0
replace d_s_avgt_winddir850 = - c(pi)												if d_s_avgt_windu850<0 & d_s_avgt_windv850==0
label var d_s_avgt_winddir850 "avg wind direction at 850hPa for nontreatment months each year in each district"

gen d_w_avgt_2_winddir850 = .
replace d_w_avgt_2_winddir850 = atan2(d_w_avgt_2_windv850, d_w_avgt_2_windu850) 			if d_w_avgt_2_windu850>0
replace d_w_avgt_2_winddir850 = atan2(d_w_avgt_2_windv850, d_w_avgt_2_windu850) + c(pi)	if d_w_avgt_2_windu850<0 & d_w_avgt_2_windv850>=0 
replace d_w_avgt_2_winddir850 = atan2(d_w_avgt_2_windv850, d_w_avgt_2_windu850) - c(pi)	if d_w_avgt_2_windu850<0 & d_w_avgt_2_windv850<0
replace d_w_avgt_2_winddir850 =  c(pi)												if d_w_avgt_2_windu850>0 & d_w_avgt_2_windv850==0
replace d_w_avgt_2_winddir850 = - c(pi)												if d_w_avgt_2_windu850<0 & d_w_avgt_2_windv850==0
label var d_w_avgt_2_winddir850 "avg wind direction at 850hPa for all 5 treatment months each year in each district"

gen d_w_avgt_lag_winddir850 = .
replace d_w_avgt_lag_winddir850 = atan2(d_w_avgt_lag_windv850, d_w_avgt_lag_windu850) 			if d_w_avgt_lag_windu850>0
replace d_w_avgt_lag_winddir850 = atan2(d_w_avgt_lag_windv850, d_w_avgt_lag_windu850) + c(pi)	if d_w_avgt_lag_windu850<0 & d_w_avgt_lag_windv850>=0 
replace d_w_avgt_lag_winddir850 = atan2(d_w_avgt_lag_windv850, d_w_avgt_lag_windu850) - c(pi)	if d_w_avgt_lag_windu850<0 & d_w_avgt_lag_windv850<0
replace d_w_avgt_lag_winddir850 =  c(pi)												if d_w_avgt_lag_windu850>0 & d_w_avgt_lag_windv850==0
replace d_w_avgt_lag_winddir850 = - c(pi)												if d_w_avgt_lag_windu850<0 & d_w_avgt_lag_windv850==0

gen d_w_avgt_lag_2_winddir850 = .
replace d_w_avgt_lag_2_winddir850 = atan2(d_w_avgt_lag_2_windv850, d_w_avgt_lag_2_windu850) 			if d_w_avgt_lag_2_windu850>0
replace d_w_avgt_lag_2_winddir850 = atan2(d_w_avgt_lag_2_windv850, d_w_avgt_lag_2_windu850) + c(pi)	if d_w_avgt_lag_2_windu850<0 & d_w_avgt_lag_2_windv850>=0 
replace d_w_avgt_lag_2_winddir850 = atan2(d_w_avgt_lag_2_windv850, d_w_avgt_lag_2_windu850) - c(pi)	if d_w_avgt_lag_2_windu850<0 & d_w_avgt_lag_2_windv850<0
replace d_w_avgt_lag_2_winddir850 =  c(pi)												if d_w_avgt_lag_2_windu850>0 & d_w_avgt_lag_2_windv850==0
replace d_w_avgt_lag_2_winddir850 = - c(pi)												if d_w_avgt_lag_2_windu850<0 & d_w_avgt_lag_2_windv850==0

gen d_s_avgt_lag_winddir850 = .
replace d_s_avgt_lag_winddir850 = atan2(d_s_avgt_lag_windv850, d_s_avgt_lag_windu850) 			if d_s_avgt_lag_windu850>0
replace d_s_avgt_lag_winddir850 = atan2(d_s_avgt_lag_windv850, d_s_avgt_lag_windu850) + c(pi)	if d_s_avgt_lag_windu850<0 & d_s_avgt_lag_windv850>=0 
replace d_s_avgt_lag_winddir850 = atan2(d_s_avgt_lag_windv850, d_s_avgt_lag_windu850) - c(pi)	if d_s_avgt_lag_windu850<0 & d_s_avgt_lag_windv850<0
replace d_s_avgt_lag_winddir850 =  c(pi)												if d_s_avgt_lag_windu850>0 & d_s_avgt_lag_windv850==0
replace d_s_avgt_lag_winddir850 = - c(pi)												if d_s_avgt_lag_windu850<0 & d_s_avgt_lag_windv850==0



*drop if year==2002	//drop because 2002 crime data not available//
*drop if year>2018	//drop because no crime data after 2018//

egen yrdist = group(year dist_id)
label var yrdist "grouped by year and district"

gen dist_affected=0 	if treat_code==0
replace dist_affected=1 if treat_code>0
label var dist_affected "=1 if treat_code > 0"

gen year_affected=0			if year<2015
replace year_affected =1	if year>=2015	
label var year_affected "=1 if year greater than 2014"

gen year_dist_affected = 0
replace year_dist_affected =1 if year_affected==1 & dist_affected==1
label var year_dist_affected "=1 if both dist_affected & year_affected equal 1"


save "${...}\final.dta", replace



*collapse and keep relevant variables for creating treatment area mean wind & fire variables
use "${...}\final.dta", clear
collapse (mean)  d_avgt_fire d_avgt_winddir850 ///
		d_w_avgt_winddir850 d_s_avgt_winddir850 ///
		d_w_avgt_windspeed850 d_s_avgt_windspeed850 d_w_avgt_fire d_s_avgt_fire ///
		d_w_avgt_2_winddir850 d_w_avgt_lag_winddir850, by(year dist_id) 
		
save "${...}\final_treatbd.dta", replace


		****************************************************

*create mean wind direction and windspeed variables for rice growing districts
use "${...}\treatment.dta", clear


merge 1:m dist_id using "${...}\final_treatbd.dta" 

drop 	Shape_Leng Shape_Area ADM2_EN ADM2_PCODE ADM2_REF ADM2ALT1EN ADM2ALT2EN ///
		ADM1_EN ADM1_PCODE ADM0_EN date ADM0_PCODE validOn validTo _ID
drop _merge
		
keep if rice_dist==1		/// or treat_code==1 ///

*bys year: egen mean_treatment_winddir850 = mean(d_diff_avg_winddir850)

*bys year: egen mean_treatment_windspeed850 = mean(d_diff_avg_windspeed850)

bys year: egen mean_treatment_fire = mean(d_avgt_fire)

ys year: egen mean_treatment_winddir850_2 = mean(d_w_avgt_winddir850)

bys year: egen mean_treatment_winddir850_3 = mean(d_w_avgt_2_winddir850)

bys year: egen mean_treatment_winddir850_4 = mean(d_w_avgt_lag_winddir850)

bys year: egen mean_treatment_winddir850_5 = mean(d_s_avgt_winddir850)

bys year: egen mean_treatment_winddir850_6 = mean(d_w_avgt_lag_2_winddir850)

bys year: egen mean_treatment_winddir850_7 = mean(d_s_avgt_lag_winddir850)

bys year: egen mean_treatment_fire_2 = mean(d_w_avgt_fire)
				
collapse (max) mean_treatment_winddir850*  ///
				mean_treatment_fire*, by(year)
				
save "${...}\final_treat_means.dta", replace

		**********************************************************

*create mean wind direction and windspeed variables for placebo rice growing districts
use "${...}\treatment.dta", clear


merge 1:m dist_id using "${...}\final_treatbd.dta" 

drop 	Shape_Leng Shape_Area ADM2_EN ADM2_PCODE ADM2_REF ADM2ALT1EN ADM2ALT2EN ///
		ADM1_EN ADM1_PCODE ADM0_EN date ADM0_PCODE validOn validTo _ID
drop _merge
		
keep if rice_dist_placebo==1		/// or treat_code==0 ///

bys year: egen mean_treatment_winddir850_place = mean(d_w_avgt_winddir850)
bys year: egen mean_treatment_winddir850a_place = mean(d_w_avgt_lag_winddir850)
				
collapse (max) mean_treatment_winddir850* , by(year)
				
save "${...}\final_treat_means_placebo.dta", replace

		**********************************************************

*create mean wind direction and windspeed variables for FAO rice growing districts
use "${...}\treatment.dta", clear


merge 1:m dist_id using "${...}\final_treatbd.dta" 

drop 	Shape_Leng Shape_Area ADM2_EN ADM2_PCODE ADM2_REF ADM2ALT1EN ADM2ALT2EN ///
		ADM1_EN ADM1_PCODE ADM0_EN date ADM0_PCODE validOn validTo _ID
drop _merge
		
keep if rice_dist_fao==1		

bys year: egen mean_treatment_winddir850_fao = mean(d_w_avgt_winddir850)
bys year: egen mean_treatment_winddir850a_fao = mean(d_w_avgt_lag_winddir850)
				
collapse (max) mean_treatment_winddir850* , by(year)
				
save "${...}\final_treat_means_fao.dta", replace

		**********************************************************
		

*now merge back the treatment variables that have been created
use "${...}\final.dta", clear

merge m:1 year using "${...}\final_treat_means.dta"
drop if _merge==2
drop _merge

merge m:1 year using "${...}\final_treat_means_placebo.dta"
drop if _merge==2
drop _merge

merge m:1 year using "${...}\final_treat_means_fao.dta"
drop if _merge==2
drop _merge


merge m:1 dist_id using "${...}\final_ricedist_distance.dta"
*replace mean_ricedist_distance = 0.5 if _merge==1
drop if _merge==2
drop _merge

replace mean_ricedist_distance = mean_ricedist_distance / 1000

merge m:1 dist_id using "${...}\final_lat_lon.dta"
drop if _merge==2
drop _merge

merge m:1 year dist_id using "${...}\final_pslm_district.dta"
drop if _merge==2
drop _merge

gen log_pslm_emp_dist = ln(pslm_emp_dist)
gen log_pslm_meandaywk_dist = ln(pslm_meandaywk_dist)
gen log_pslm_emp_lfp = ln(pslm_emp_lfp)
*gen log_pslm_sick_dist = ln(pslm_sick_dist)

egen t = group(year)

*merge crime data
merge 1:m year dist_id using "${...}\crime_final.dta"
drop if _merge==2
drop _merge

encode crimetype, gen(crime_type)

gen log_crime = ln(crimeno)
replace log_crime = 0 		if crimeno==0 

egen mean_pop = rowmean(pop_2017 pop_1998)
gen crime_pop = (crimeno / pop_2017) * 100000
gen log_crime_pop = ln(crime_pop)
replace log_crime_pop=0 if crimeno==0

egen mean_area = rowmean(area_2017 area_1998)
gen crime_area = (crimeno / area_2017) * 1000
gen log_crime_area = ln(crime_area)
replace log_crime_area=0 if crimeno==0

label var crimeno "total annual district crimes"
label var log_crime "log of annual dist crimes"
label var mean_pop "mean of census populations in 2017 & 1998"
label var mean_area "mean of census areas in 2017 & 1998"
label var crime_pop "total annual dist crimes normalized by dist population in 2017 census"
label var crime_area "total annual dist crimes normalized by dist area in 2017 census"
label var log_crime_pop "log of no of annual dist crimes normalized by dist pop in 2017"
label var log_crime_area "log of no of annual dist crimes normalized by dist area in 2017"

encode division, gen(division_id)


replace crimetype = subinstr(crimetype, " ", "", .)
replace crimetype = subinstr(crimetype, ".", "", .)
replace crimetype = subinstr(crimetype, "/", "", .)

*levelsof crimetype, local(j)
*foreach X of local j {
*	gen crime_`X' = crimeno		if crimetype=="`X'"
*	}

local crime "AllReported AssaultonGovtServants AttemptedMurder Burglary CattleTheft Dacoity Hurt KidnappingAbduction Misc MotorVehiclesTheft Murder OrdinaryThefts Rape Rioting Robbery"

forvalues g = 1/15	{
	local c : word `g' of `crime'
	gen crime_`c' = crimeno		if crimetype=="`c'"
}


egen crime_violent = rowtotal(crime_AssaultonGovtServants crime_AttemptedMurder ///
					crime_Dacoity crime_Hurt crime_Murder crime_Rape crime_Rioting), m
egen crime_nonviolent = rowtotal(crime_CattleTheft crime_Burglary crime_KidnappingAbduction ///
					crime_MotorVehiclesTheft crime_OrdinaryThefts crime_Robbery crime_Misc ), m
					
gen log_crime_violent = ln(crime_violent)
replace log_crime_violent = 0 if crime_violent==0
gen log_crime_nonviolent = ln(crime_nonviolent)
replace log_crime_nonviolent = 0 if crime_nonviolent==0

foreach var of varlist crime_violent crime_nonviolent {

	gen `var'_pop = (`var' / mean_pop) * 10000
	gen log_`var'_pop = ln(`var'_pop)
	replace log_`var'_pop = 0	if `var'==0
	
	gen `var'_area = (`var' / area_2017) * 1000
	gen log_`var'_area = ln(`var'_area)
	replace log_`var'_area = 0	if `var'==0
	}


label var crime_violent "total annual district crimes classified violent"
label var crime_nonviolent "total annual district crimes classified non-violent"
label var log_crime_violent "log of total annual district crimes classified non-violent"
label var log_crime_nonviolent "log of total annual district crimes classified violent"
label var crime_nonviolent "log of total annual district crimes classified non-violent"
label var crime_violent_pop "total annual district crimes classified violent normalized by dist pop"
label var crime_nonviolent_pop "total annual district crimes classified non-violent normalized by dist pop"
label var log_crime_violent_pop "log of total annual district crimes classified violent normalized by dist pop"
label var log_crime_nonviolent_pop "log of total annual district crimes classified non-violent normalized by dist pop"
label var crime_violent_area "total annual district crimes classified violent normalized by dist area"
label var crime_nonviolent_area "total annual district crimes classified non-violent normalized by dist area"
label var log_crime_violent_area "log of total annual district crimes classified violent normalized by dist area"
label var log_crime_nonviolent_area "log of total annual district crimes classified non-violent normalized by dist area"

				
bys dist_id: egen longrun_avg_temp = mean(d_avgt_temp)
gen shock_avg_temp = d_avgt_temp - longrun_avg_temp
bys dist_id: egen longrun_sd_temp = sd(d_avgt_temp)	
gen zscore_temp = shock_avg_temp / longrun_sd_temp	
				
bys dist_id: egen longrun_avg_precip = mean(d_avgt_precip)
gen shock_avg_precip = d_avgt_precip - longrun_avg_precip
bys dist_id: egen longrun_sd_precip = sd(d_avgt_precip)	
gen zscore_precip = shock_avg_precip / longrun_sd_precip

bys dist_id: egen longrun_s_avg_aod = mean(d_s_avgt_aod)
gen shock_s_avg_aod = d_s_avgt_aod - longrun_s_avg_aod	
bys dist_id: egen longrun_s_sd_aod = sd(d_s_avgt_aod)
gen zscore_s_aod = shock_s_avg_aod / longrun_s_sd_aod

bys dist_id: egen longrun_w_avg_aod = mean(d_w_avgt_aod)
gen shock_w_avg_aod = d_w_avgt_aod - longrun_w_avg_aod	
bys dist_id: egen longrun_w_sd_aod = sd(d_w_avgt_aod)
gen zscore_w_aod = shock_w_avg_aod / longrun_w_sd_aod	

egen longrun_avg_rice_area = mean(rice_area)	if rice_dist==1
sum longrun_avg_rice_area
local rice_avg = r(mean)
	 
*gen ins_3 = (weight_lat - mean_treatment_winddir850_2) * d_diff_avg_windspeed850 / mean_ricedist_distance
*gen ins_3 = (weight_lat - mean_treatment_winddir850_2) / (mean_ricedist_distance * `rice_avg')
gen ins_3 = (weight_lat - mean_treatment_winddir850_2) * (100000) / (mean_ricedist_distance)		//main instrument//
gen ins_3_2 = (weight_lat - mean_treatment_winddir850_3) * (100000) / (mean_ricedist_distance)		//instrument with same treatment months for pollution and wind//
gen ins_3_3 = (weight_lat - mean_treatment_winddir850_placeb) * (100000) / (mean_ricedist_distance)		//instrument with placebo ricegrowing districts for wind//
gen ins_3_4 = (weight_lat - mean_treatment_winddir850_fao) * (100000) / (mean_ricedist_distance)		//instrument with fao districts for wind//
gen ins_3_5 = (weight_lat - mean_treatment_winddir850_4) * (100000) / (mean_ricedist_distance)		//instrument with lagged avg//
gen ins_3_6 = (weight_lat - mean_treatment_winddir850_5) * (100000) / (mean_ricedist_distance)		//instrument with wind direction from remaining 9 months//

gen ins_3a = (weight_lat - mean_treatment_winddir850_4) * (100000) / (mean_ricedist_distance)		//instrument with lagged wind direction//
gen ins_3_4a = (weight_lat - mean_treatment_winddir850a_fao) * (100000) / (mean_ricedist_distance)		//instrument with lagged fao districts for wind//
gen ins_3_3a = (weight_lat - mean_treatment_winddir850a_place) * (100000) / (mean_ricedist_distance)		//instrument with placebo ricegrowing districts for wind//
gen ins_3_2a = (weight_lat - mean_treatment_winddir850_6) * (100000) / (mean_ricedist_distance)		//instrument with same treatment months for pollution and wind//
gen ins_3_6a = (weight_lat - mean_treatment_winddir850_7) * (100000) / (mean_ricedist_distance)		//instrument with wind direction from remaining 9 months//


bys dist_id: egen longrun_avg_ins_3 = mean(ins_3)
gen shock_avg_ins_3 = ins_3 - longrun_avg_ins_3
bys dist_id: egen longrun_sd_ins_3 = sd(ins_3)
gen zscore_ins_3 = shock_avg_ins_3 / longrun_sd_ins_3	

bys dist_id: egen longrun_w_avg_aod_2 = mean(d_w_avgt_2_aod)
gen shock_w_avg_aod_2 = d_w_avgt_2_aod - longrun_w_avg_aod_2	
bys dist_id: egen longrun_w_sd_aod_2 = sd(d_w_avgt_2_aod)
gen zscore_w_aod_2 = shock_w_avg_aod_2 / longrun_w_sd_aod_2	

save "${...}\final.dta", replace


	************************************************************************


use "${...}\final.dta", clear

*drop province

drop pslm_*

keep if crimetype=="AllReported"

merge 1:m year dist_id using "${final}\final_pslm_ind.dta"
drop if _merge==2		//2019 year obervations dropped//
drop _merge

*keep if month==1 | month==2 | month==11 | month==12

gen log_work_days_month = ln(work_days_month)

set more off

gen unemployed = .
replace unemployed = 0		if working==1
replace unemployed = 1		if working==0 & active_lfp==1

*drop if month<1 | month>12

gen treat_month = 0
replace treat_month = 1 if month==1 | month==2 | month==11 | month==12
gen monthtreat_ins_3 = ins_3 * treat_month
gen monthtreat_aod = zscore_w_aod * treat_month

gen nontreat_month=0
replace nontreat_month = 1 if month!=1 & month!=2 & month!=11 & month!=12
gen monthnontreat_ins_3 = ins_3 * nontreat_month
gen monthnontreat_aod = zscore_w_aod * nontreat_month


gen treat_month_2 = 0
replace treat_month_2 = 1 if month==1 | month==2 | month==3 | month==12
gen monthtreat2_ins_3 = ins_3 * treat_month_2
gen monthtreat2_aod = zscore_w_aod * treat_month_2

gen nontreat_month_2 = 0
replace nontreat_month_2 = 1 if month!=1 & month!=2 & month!=3 & month!=12
gen monthnontreat2_ins_3 = ins_3 * nontreat_month_2
gen monthnontreat2_aod = zscore_w_aod * nontreat_month_2

gen treat_month_21 = 0
replace treat_month_21 = 1 if month==1 | month==2 | month==3 | month==12 | month==11
gen monthtreat21_ins_3 = ins_3 * treat_month_21
gen monthtreat21_aod = zscore_w_aod_2 * treat_month_2

save "${...}\final_mech.dta", replace

	************************************************************************


use"${...}\final.dta", clear
set more off

bys year dist_id: egen crime_v = max(crime_violent)
bys year dist_id: egen crime_nv = max(crime_nonviolent)


collapse 		(mean) crimeno crime_v crime_nv pslm_* ///
				d_w_avgt_aod ins_3 ins_3a ins_3_* d_w_avgt_temp d_w_avgt_precip rice_production ///
				rice_area d_avgt_temp d_avgt_precip d_w_avgt_fire d_avgt_aod ///
				mean_treatment_fire_2 d_avgt_fire  ///
				d_w_avgt_windspeed850 d_s_avgt_aod d_s_avgt_fire ///
				crime_AttemptedMurder crime_Burglary crime_CattleTheft crime_Dacoity ///
				crime_Hurt crime_KidnappingAbduction crime_MotorVehiclesTheft ///
				crime_Murder crime_OrdinaryThefts crime_Rape crime_Rioting crime_Robbery ///
				(max) division_id yrdist area_2017 pop_2017 rice_dist weight_lat ///
				mean_treatment_winddir850_2 mean_ricedist_distance mean_stat_aod ///
				mean_treatment_winddir850_3 d_w_avgt_2_aod, by(year dist_id)
				
sort dist_id year
bys dist_id: gen lag_crimev = crime_v[_n+1]
gen lag_crimev_area = lag_crimev/area_2017
gen log_lag_crimev_area 			= ln(lag_crimev_area)
replace log_lag_crimev_area 		= 0 					if lag_crimev_area==0

sort dist_id year
bys dist_id: gen lag_crimenv = crime_nv[_n+1]
gen lag_crimenv_area = lag_crimenv/area_2017
gen log_lag_crimenv_area 			= ln(lag_crimenv_area)
replace log_lag_crimenv_area 		= 0 					if lag_crimenv_area==0

gen lag_crimev_pop = lag_crimev/pop_2017
gen log_lag_crimev_pop	 			= ln(lag_crimev_pop)
replace log_lag_crimev_pop	 		= 0 					if lag_crimev_pop==0

gen lag_crimenv_pop = lag_crimenv/pop_2017
gen log_lag_crimenv_pop	 			= ln(lag_crimenv_pop)
replace log_lag_crimenv_pop	 		= 0 					if lag_crimenv_pop==0

sort dist_id year
bys dist_id: gen lag_crime = crimeno[_n+1]
gen lag_crime_area = lag_crime/area_2017
gen log_lag_crime_area 			= ln(lag_crime_area)
replace log_lag_crime_area 		= 0 					if lag_crime_area==0

gen lag_crime_pop = lag_crime/pop_2017
gen log_lag_crime_pop 			= ln(lag_crime_pop)
replace log_lag_crime_pop 		= 0 					if lag_crime_pop==0

sort dist_id year
by dist_id: gen lag_year = year[_n+1]

gen crime_area = crimeno/area_2017
gen log_crime_area 			= ln(crime_area)
replace log_crime_area 		= 0 						if crimeno==0

gen crime_pop = crimeno/pop_2017
gen log_crime_pop 			= ln(crime_pop)
replace log_crime_pop 		= 0 						if crimeno==0

gen crimev_area = crime_v/area_2017
gen log_crimev_area 			= ln(crimev_area)
replace log_crimev_area 		= 0 					if crimev_area==0

gen crimev_pop = crime_v/pop_2017
gen log_crimev_pop 			= ln(crimev_pop)
replace log_crimev_pop 		= 0 						if crimev_pop==0

gen crimenv_area = crime_nv/area_2017
gen log_crimenv_area 			= ln(crimenv_area)
replace log_crimenv_area 		= 0 					if crimenv_area==0

gen crimenv_pop = crime_nv/pop_2017
gen log_crimenv_pop 			= ln(crimenv_pop)
replace log_crimenv_pop 		= 0 					if crimenv_pop==0

bys dist_id: egen longrun_w_avg_aod = mean(d_w_avgt_aod)
gen shock_w_avg_aod = d_w_avgt_aod - longrun_w_avg_aod	
bys dist_id: egen longrun_w_sd_aod = sd(d_w_avgt_aod)
gen zscore_w_aod = shock_w_avg_aod / longrun_w_sd_aod	

bys dist_id: egen longrun_w_avg_aod_2 = mean(d_w_avgt_2_aod)
gen shock_w_avg_aod_2 = d_w_avgt_2_aod - longrun_w_avg_aod_2	
bys dist_id: egen longrun_w_sd_aod_2 = sd(d_w_avgt_2_aod)
gen zscore_w_aod_2 = shock_w_avg_aod_2 / longrun_w_sd_aod_2	

bys dist_id: egen longrun_s_avg_aod = mean(d_s_avgt_aod)
gen shock_s_avg_aod = d_s_avgt_aod - longrun_s_avg_aod	
bys dist_id: egen longrun_s_sd_aod = sd(d_s_avgt_aod)
gen zscore_s_aod = shock_s_avg_aod / longrun_s_sd_aod	

bys dist_id: egen longrun_avg_aod = mean(d_avgt_aod)
gen shock_avg_aod = d_avgt_aod - longrun_avg_aod	
bys dist_id: egen longrun_sd_aod = sd(d_avgt_aod)
gen zscore_aod = shock_avg_aod / longrun_sd_aod

bys dist_id: egen longrun_avg_ins_3 = mean(ins_3)
gen shock_avg_ins_3 = ins_3 - longrun_avg_ins_3
bys dist_id: egen longrun_sd_ins_3 = sd(ins_3)
gen zscore_ins_3 = shock_avg_ins_3 / longrun_sd_ins_3
		

bys dist_id: egen longrun_avg_treatfire = mean(mean_treatment_fire_2)
gen shock_avg_treatfire = mean_treatment_fire_2 - longrun_avg_treatfire
bys dist_id: egen longrun_sd_treatfire = sd(mean_treatment_fire_2)
gen zscore_treatfire = shock_avg_treatfire / longrun_sd_treatfire

save "${...}\final_totalcrime.dta", replace


