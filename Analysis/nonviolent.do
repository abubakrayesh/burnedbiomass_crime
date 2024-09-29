****	This do file runs the main IV regressions and robustness checks			****
****	for non-violent crimes													****



use"${...}\final_totalcrime.dta", clear
set more off


***	main firststage regressions (with total overall crime)							
							
							
** Nonviolent Crimes							

*Table 4:
							
ivreg2 log_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)

				
				
							****************
							
ivreg2 log_lag_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
				
						******************************************							
							
							
***	Adding PSLM and Rice Controls
							
*Table 5:
								
ivreg2 log_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							


				
				
							****************
							
ivreg2 log_lag_crimenv_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
						******************************************							
							
							