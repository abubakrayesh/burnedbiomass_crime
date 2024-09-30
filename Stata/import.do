****	This do file cleans the different datasets and gets them ready to merge ****
****	together																****

clear
set more off

**import crime data**
clear
import excel 	"${...}\Crime_Punjab_Import_2.xlsx", sheet("Sheet1") ///
				firstrow case(lower)

rename district dist_name

replace crimeno="0"		if crimeno=="-"
destring crimeno, replace

sort dist_name

drop f

encode dist_name, gen(dist_id)

save "${...}\crime_final.dta", replace

**import rice data
clear
import excel 	"${...}\rice_final.xlsx", sheet("Sheet1") ///
				firstrow case(lower)


sort dist_name

encode dist_name, gen(dist_id)

label var rice_area "rice_area in thousand of hectares"
label var rice_production "rice production in thousand tonnes"

save "${...}\rice_final.dta", replace	

		**********************************************************
		
		
*Create shapefile data 

shp2dta 	using "${...}\pak_admbnda_adm2_ocha_pco_gaul_20181218.shp" ///
			, genid(_ID) database("${...}\dist_shp.dta") ///
			coordinates("${...}\dist_shp_coor.dta") ///
			replace
		
use "${finaltemp}\dist_shp_coor.dta", clear

merge m:1 _ID using "${finaltemp}\dist_shp.dta", nogen

keep if ADM1_PCODE=="PK6"

keep _Y _X _ID

save "${finaltemp}\dist_shp_coor1.dta", replace



*create treatment vars 
use "${...}\dist_shp.dta", replace

keep if ADM1_PCODE=="PK6"


sort ADM2_EN
encode ADM2_PCODE, gen(dist_id)

gen 	rice_dist = 0
replace rice_dist = 1	if dist_id==2 | dist_id==6 | dist_id==9 | dist_id==11 | ///
						dist_id==14 | dist_id==20 | dist_id==24 | dist_id==25 | ///
						dist_id==26 | dist_id==27 | dist_id==33 | dist_id==34
label var rice_dist "=1 if rice production district above 75th percentile"

gen		rice_dist_fao = 0
replace rice_dist_fao = 1	if dist_id==8 | dist_id==9 | dist_id==10 | dist_id==11 | ///
						dist_id==14 | dist_id==17 | dist_id==20 | dist_id==24 | ///
						dist_id==25 | dist_id==33 | dist_id==34

*replace rice_dist_placebo = 1 if dist_id==1 | dist_id==4 | dist_id==7 | dist_id==18 | ///
*								 dist_id==21 | dist_id==30
						

gen 	rice_nbor_dist = 0
replace rice_nbor_dist = 1	if dist_id==10 | dist_id==36 | dist_id==32 | dist_id==13 | ///
							dist_id==17 | dist_id==31 | dist_id==8 | dist_id==26 | ///
							dist_id==11 | dist_id==9 | dist_id==14 | dist_id==24 | ///
							dist_id==34 | dist_id==33 | dist_id==20 | dist_id==27
label var rice_nbor_dist "=1 if either rice producing above 75th percentile or neighboring district"
							
gen		ctrl_dist=0
replace ctrl_dist=1		if rice_dist==0 & rice_nbor_dist==0
label var ctrl_dist "=1 if control district"

gen 	rice_nbor_only = 0
replace rice_nbor_only = 1	if dist_id==10 | dist_id==36 | dist_id==32 | dist_id==13 | ///
							dist_id==17 | dist_id==31 | dist_id==8 
label var rice_nbor_only "=1 if neighboring district of a rice producing district above 75th percentile"

gen		rice_dist_placebo = 0
replace rice_dist_placebo = 1 if ctrl_dist==1
							
gen 	treat_code = 0
replace treat_code = 1	if rice_dist==1
replace treat_code = 2	if rice_nbor_only==1
label var treat_code "=0 if control, =1 if rice producing, =2 if neighboring district"
							
save "${...}\treatment.dta", replace

*create a coordinates file just for treatment indicator and draw the map 
use "${...}\dist_shp_coor.dta", clear
merge m:1 _ID using "${...}\treatment.dta"
keep if _merge==3
drop _merge
*drop if treat_code==0
*keep _ID _X _Y treat_code
save "${...}\dist_shp_coor2.dta", replace		


		
*generate district centroids latitude and longitude
*use "${...}\treatment.dta", clear
			
shp2dta 	using "${...}\pak_admbnda_adm2_ocha_pco_gaul_20181218.shp"  ///
			, genid(center_id) database("${...}\dist_shp_cent.dta") ///
			coordinates("${...}\dist_shp_coor_cent.dta") ///
			gencentroids(centroid) replace			
			
			
use "${...}\dist_shp_cent.dta", clear		

keep if ADM1_PCODE=="PK6"	

rename ADM2_EN dist_name
encode dist_name, gen(dist_id)

keep dist_* *_centroid

merge 1:1 dist_id using "${...}\treatment.dta"
drop if _merge==2
drop _merge

keep if rice_dist==1

egen mean_lat_treat = mean(y_centroid)
egen mean_lon_treat = mean(x_centroid)

sum mean_lat_treat
local meanlat = r(mean)
sum mean_lon_treat
local meanlon = r(mean)


save "${...}\treat_latlon.dta", replace

*now create the weighted lat and lon vars for instrument
use "${...}\dist_shp_cent.dta", clear		

keep if ADM1_PCODE=="PK6"	

rename ADM2_EN dist_name
encode dist_name, gen(dist_id)

keep dist_* *_centroid	

gen treat_lat = `meanlat'
gen treat_lon = `meanlon'

**calculation of azimuth angle from https://www.omnicalculator.com/other/azimuth**

gen a = (sin( (treat_lat-y_centroid)/2) )^2 + (cos(treat_lat) * cos(y_centroid) * (sin( (treat_lon-x_centroid)/2) ) )
replace a = -1*a	if a<0
gen c = 2 * atan2( sqrt(a), (1-sqrt(a)) )
gen d = 6371 * c
gen weight_lat = atan2( sin( treat_lon-x_centroid ) * cos(y_centroid), cos(treat_lat) * sin(y_centroid) - sin(treat_lat) * cos(y_centroid) * cos( treat_lon-x_centroid ) )


*gen weight_lat = y_centroid
gen weight_lon = x_centroid

save "${...}\final_lat_lon.dta", replace
		

*saving some files in stata 12 for use in R
use "${...}\treatment.dta", clear
saveold "${...}\treatment12.dta", replace version(12)

use "${...}\dist_shp_coor1.dta", clear
drop if _X==. | _Y==. | _ID==.
saveold "${...}\dist_shp_coor1_12.dta", replace version(12)



	**********************************



		
*collapse aod data
use "${...}\aod_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt)
egen d_w_avgt_2 = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
rename d_* d_*_aod

label var d_avgt_aod "avg value of AOD each year weighted by pixel size in each district"
label var d_w_avgt_aod "mean value of AOD in the treatment months in each district"
label var d_s_avgt_aod "mean value of AOD in the nontreatment months in each district"
label var d_w_avgt_2_aod "mean value of AOD in the all 5 treatment months in each district"

save "${...}\aod_final_d.dta", replace


*collapse fire data
use "${...}\pakfire_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt)
*egen d_s_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt)
egen d_s_avgt1 = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt)

sort dist_id year
bys dist_id: gen d_s_avgt2 = d_s_avgt1[_n-1]
egen d_s_avgt = rowmean(d_s_avgt1 d_s_avgt2)
drop d_s_avgt1 d_s_avgt2

rename d_* d_*_fire


label var d_avgt_fire "avg no of fires each year weighted by pixel size in each district"
label var d_w_avgt_fire "mean no of fires in the treatment months in each district"
label var d_s_avgt_fire "mean no of fires in the nontreatment months in each district"

save "${...}\fire_final_d.dta", replace


*collapse precipitation data
use "${...}\precipm_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt)
rename d_* d_*_precip

label var d_avgt_precip "avg precipitation in mm each year weighted by pixel size in each district"
label var d_w_avgt_precip "mean precipitation in mm in the treatment months in each district"
label var d_s_avgt_precip "mean precipitation in mm nontreatment months in each district"

save "${...}\precip_final_d.dta", replace


*collapse temperature data
use "${...}\tempm_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt)
rename d_* d_*_temp

label var d_avgt_temp "avg temperature in C each year weighted by pixel size in each district"
label var d_w_avgt_temp "mean temperature in C in the treatment months in each district"
label var d_s_avgt_temp "mean temperature in C nontreatment months in each district"

save "${...}\temp_final_d.dta", replace


*collapse wind u at 850hPa data
use "${finaltemp}\pakwindu850_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt)
egen d_w_avgt_2 = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt) 	//for same treatment months of pollution & wind//

sort dist_id year
bys dist_id: gen d_w2_avgt = d_w_avgt[_n-1]
gen d_w_avgt_lag = d_w2_avgt
drop d_w2_avgt

sort dist_id year
bys dist_id: gen d_w2_avgt_2 = d_w_avgt_2[_n-1]
gen d_w_avgt_lag_2 = d_w2_avgt_2
drop d_w2_avgt_2

sort dist_id year
bys dist_id: gen d_s2_avgt = d_s_avgt[_n-1]
gen d_s_avgt_lag = d_s2_avgt
drop d_s2_avgt

rename d_* d_*_windu850

label var d_avgt_windu850 "avg u-wind at 850hPa each year weighted by pixel size in each district"
label var d_w_avgt_windu850 "mean u-wind at 850hPa in the treatment months in each district"
label var d_s_avgt_windu850 "mean u-wind at 850hPa in mm nontreatment months in each district"
label var d_w_avgt_2_windu850 "mean u-wind at 850hPa in all 5 treatment months in each district"

save "${final}\windu850_final_d.dta", replace


*collapse wind v at 850hPa data
use "${finaltemp}\pakwindv850_final.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt)
egen d_w_avgt_2 = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt) 	//for same treatment months of pollution & wind//

sort dist_id year
bys dist_id: gen d_w2_avgt = d_w_avgt[_n-1]
gen d_w_avgt_lag = d_w2_avgt
drop d_w2_avgt

sort dist_id year
bys dist_id: gen d_w2_avgt_2 = d_w_avgt_2[_n-1]
gen d_w_avgt_lag_2 = d_w2_avgt_2
drop d_w2_avgt_2

sort dist_id year
bys dist_id: gen d_s2_avgt = d_s_avgt[_n-1]
gen d_s_avgt_lag = d_s2_avgt
drop d_s2_avgt

rename d_* d_*_windv850

label var d_avgt_windv850 "avg v-wind at 850hPa each year weighted by pixel size in each district"
label var d_w_avgt_windv850 "mean v-wind at 850hPa in the treatment months in each district"
label var d_s_avgt_windv850 "mean v-wind at 850hPa in mm nontreatment months in each district"
label var d_w_avgt_2_windv850 "mean v-wind at 850hPa in all 5 treatment months in each district"

save "${final}\windv850_final_d.dta", replace


				*************************************


*collapse for mean value of aod data
use "${...}\aod_final_new.dta", clear

collapse (max) d_* (first) dist_name, by(year dist_id)
egen d_w_avgt = rowmean(d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
egen d_s_avgt = rowmean(d_mar_avgt d_apr_avgt d_may_avgt d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt)
egen d_w_avgt_2 = rowmean(d_oct_avgt d_nov_avgt d_dec_avgt d_jan_avgt d_feb_avgt)
rename d_* d_*_aod

label var d_avgt_aod "avg value of AOD each year weighted by pixel size in each district"
label var d_w_avgt_aod "mean value of AOD in the treatment months in each district"
label var d_s_avgt_aod "mean value of AOD in the nontreatment months in each district"
label var d_w_avgt_2_aod "mean value of AOD in the all 5 treatment months in each district"

gen mean_stat_aod = d_w_avgt_2_aod

save "${...}\aod_final_d_new.dta", replace


		
