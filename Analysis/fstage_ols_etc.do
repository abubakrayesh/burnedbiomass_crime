****	This do file runs the general first regressions with all crimes,		****
****	the OLS regressions for air pollution and crime respectively,			****
****	and the placebo tests.													****



use"${...}\final_totalcrime.dta", clear
set more off


***	main firststage regressions (with total overall crime)

*Table 1: 

ivreg2 log_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)
						
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************

ivreg2 log_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
			
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							


				
				
							****************									

ivreg2 log_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_area rice_production pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
 			
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)						


				
				
							****************													

ivreg2 log_lag_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							

					
					
					
							****************

ivreg2 log_lag_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
 							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							



				
				
							****************													

ivreg2 log_lag_crime_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_area rice_production pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							

					
					
									
				
				
				
				********************************************									
							
							

						
*** OLS linking fire & windspeed with AOD				

* Table A10: First running everything for just winter AOD		
		
reg zscore_w_aod_2 zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				year i.dist_id if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)			
				
				
reg zscore_w_aod_2 zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)

				
reg zscore_w_aod_2 zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				rice_area rice_production ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)				
				
				
				
							****************************

* Table A11: Now running everything on annual AOD

reg zscore_aod zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				year i.dist_id if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				d_avgt_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)			
				
				
reg zscore_aod zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				d_avgt_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)	
				
reg zscore_aod zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				rice_area rice_production ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				d_avgt_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)								
							

				
				
					**************************************			

						
*Table A5: OLS for the Results section						
										
reg log_crimev_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)				
				
				
reg log_crimev_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)
										
reg log_lag_crimev_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)				
				
				
reg log_lag_crimev_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)

				
reg log_lag_crimev_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)
				

						*******************************	
						

*Table A6: OLS for the Results section						
										
reg log_crimenv_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_nv
local	avgcrime 	= r(mean)			
				
				
reg log_crimenv_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_nv
local	avgcrime 	= r(mean)
										
reg log_lag_crimenv_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimenv
local	avgcrime 	= r(mean)			
				
				
reg log_lag_crimenv_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimenv
local	avgcrime 	= r(mean)	

				
reg log_lag_crimenv_area zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimenv
local	avgcrime 	= r(mean)
								
				

				*****************************************	
						
						
						
*Placebo Tests
*Table A13

ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)

local	fstat2 = e(widstat)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)
				
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)

local	fstat2 = e(widstat)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)		
				
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)

local	fstat2 = e(widstat)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)

ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)

local	fstat2 = e(widstat)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				area_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)						
				
							****************
							
			
				

*Table A14


ivreg2 log_crimev_area (zscore_s_aod = ins_3_6) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_crimev_area (zscore_s_aod = ins_3_6) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_s_aod = ins_3_6) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)

				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_s_aod = ins_3_6) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
				
				
				
				
				
				*********************************************
