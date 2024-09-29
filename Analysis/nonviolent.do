****	This do file runs the main IV regressions and robustness checks			****
****	for non-violent crimes													****



use"${...}\final_totalcrime.dta", clear
set more off


***	main firststage regressions (with total overall crime)							
							
							
** Nonviolent Crimes							

*Table 3 Panel A:
*Column 1
reg log_crimenv_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				crime_nv
local	avgcrime 	= r(mean)



							****************

*Column 2							
reg log_crimenv_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				crime_nv
local	avgcrime 	= r(mean)

				
				
							****************

*Column 3
ivreg2 log_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)


				
				
							****************

*Column 4
ivreg2 log_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) 					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)

				
				
							****************
							
*Column 5							
ivreg2 log_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p) 
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)

				
				
							****************
							
*Column 6				
ivreg2 log_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)  
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_nv
local	avgcrime	= r(mean)		

		
				
				
						******************************************							

						
						
*Table 3 Panel B:
*Column 1							
reg log_lag_crimenv_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimenv
local	avgcrime 	= r(mean)							

				
				
							****************
							
							
*Column 2
reg log_lag_crimenv_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimenv
local	avgcrime 	= r(mean)							

				
				
							****************
							
	
	
*Column 3				
ivreg2 log_lag_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
							****************
											
							
*Column 4
ivreg2 log_lag_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)

				
							****************
		
							
*Column 5				
ivreg2 log_lag_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)  
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)
				
							****************
							
							
							
*Column 6
ivreg2 log_lag_crimenv_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p) 
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimenv
local	avgcrime	= r(mean)


				
						******************************************							
							
							