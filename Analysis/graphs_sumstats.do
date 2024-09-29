****	This do file produces the figures 1 and 3 presented in the paper		****
***		It also generates summary stats for table A1 in the appendix			***


*** Figure 3
use "${...}\fire_final_d.dta", clear

preserve
keep if inlist(month, 10,11,12)
collapse (sum) avg_fire, by(year)
twoway bar avg_fire year,  ytitle(Total No. of Fires in Rice October-December) xtitle(Year)
graph export "${graphs}\year_fire.png", as(png) replace
restore

preserve
keep if !inlist(month, 10,11,12)
collapse (sum) avg_fire, by(year)
twoway bar avg_fire year,  ytitle(Total No. of Fires during Rest of the Year) xtitle(Year)
graph export "${graphs}\year_fire2.png", as(png) replace
restore

****************

*** Figure 1

use "${...}\aod_final_d.dta", clear

preserve
collapse (mean) d_avgt_aod d_w_avgt_aod d_s_avgt_aod, by(year)
twoway 		(connected d_w_avgt_aod year if year<2019, lcolor(black) lpattern(solid))  ///
			(connected d_s_avgt_aod year if year<2019, lcolor(green) lpattern(longdash)), ///
		ytitle(Average Air Pollution) xtitle(Year) ///
		legend(label(1 "November-February") label(2 "March-October"))
graph export "${...}\year_aod.png", as(png) replace
restore


*** Figure 2
use "${...}\treatment.dta", clear

label 	define rice 		0 "Other districts" ///
		2 "Neighbors to North & North-West of rice districts" ///
		1 "Rice growing districts" ///
		
label values treat_code rice

label 	define rice1  ///
		0 "Other districts" ///
		1 "Rice growing districts" ///
		
label values rice_dist rice1

spmap rice_dist using "${...}\dist_shp_coor.dta", ///
			id(_ID) title("Districts of Punjab", size(*1.0)) ///
			clmethod(unique) fcolor(blue green) ///
			legend(pos(6) row(3) ring(1) size(*.75) symx(*.75) symy(*.75) forcesize )



*** Table A1: Generating summary stats 

clear*
use"${...}\final_totalcrime.dta", clear
set more off
set matsize 1000
keep	crimeno crime_v crime_nv d_avgt_aod ///
		mean_stat_aod d_s_avgt_aod d_avgt_fire d_w_avgt_fire d_s_avgt_fire ///
		d_w_avgt_temp d_w_avgt_precip rice_production rice_area ///
		weight_lat
outreg2 using sumstats.tex, replace tex sum(log) eqkeep(N mean sd) ///
		keep(crimeno crime_v crime_nv d_avgt_aod ///
		mean_stat_aod d_s_avgt_aod d_avgt_fire d_w_avgt_fire d_s_avgt_fire ///
		d_w_avgt_temp d_w_avgt_precip rice_production rice_area) 
		
		
clear*
use"${...}\final_totalcrime.dta", clear
set more off
set matsize 1000
keep	area_2017 pop_2017 mean_ricedist_distance weight_lat dist_id
collapse (max) area_2017 pop_2017 mean_ricedist_distance weight_lat, by(dist_id)
outreg2 using sumstats.tex, append tex sum(log) eqkeep(N mean sd) ///
		keep(area_2017 pop_2017 mean_ricedist_distance weight_lat) 
		
		
clear*
use"${...}\final_totalcrime.dta", clear
set more off
set matsize 1000
keep	mean_treatment_winddir850* year
collapse (max) mean_treatment_winddir850_2, by(year)
outreg2 using sumstats.tex, append tex sum(log) eqkeep(N mean sd) ///
		keep(mean_treatment_winddir850_2) 
		
		
				
