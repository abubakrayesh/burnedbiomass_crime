****	This do file runs (a) the first stage regressions, (b) the OLS 			****
****	regressions for air pollution and crime respectively, and the 			****
****	placebo tests.															****



use"${...}\final_totalcrime.dta", clear
set more off


***	main firststage regressions (with total overall crime)

*Table 1
 
*Column 1
ivreg2 log_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)
						
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)

				
				
							****************

*Column2
ivreg2 log_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
			
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)

				
				
							****************									

*Column 3
ivreg2 log_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_area rice_production pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)						


				
				
							****************													

*Column 4
ivreg2 log_lag_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)						

					
					
					
							****************

*Column 5
ivreg2 log_lag_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
 							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)						

				
				
							****************													

*Column 6
ivreg2 log_lag_crime_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_area rice_production pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
							
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)											
				
				
				
				********************************************									
							
							
							
							
*Table A2							

*Column 1
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	

local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)
				
				
				
							****************

*Column 2

ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
							****************

*Column 3
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
							****************

*Column 4
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)											
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
				********************************************									
							
							
			
*Table A3

*Column 1
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	

				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)					
				
				
							****************

*Column 2
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)				
				
				
				
							****************

*Column 3
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)

local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)
				
				
				
							****************

*Column 4
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)											
				
				
				********************************************	
				
				
				
						
*** OLS linking fire & windspeed with AOD				

*Table A6
*Column 1
reg zscore_w_aod_2 zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				year i.dist_id if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)

					

							****************
							
*Column 2				
reg zscore_w_aod_2 zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)

					

							****************
							
*Column 3
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

					

							****************
							
*Column 4
reg zscore_aod zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				year i.dist_id if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				d_avgt_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)

					

							****************
							
*Column 5
reg zscore_aod zscore_treatfire ///
				d_avgt_temp d_avgt_precip d_w_avgt_fire ///
				i.dist_id i.dist_id#c.year if year<2019, cluster(dist_id)

boottest		zscore_treatfire, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				d_avgt_aod
local	avgaod	= r(mean)
sum				mean_treatment_fire_2
local	avgfire	= r(mean)

					

							****************
							
*Column 6
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
						
						

						
*Placebo Test 1
*Table A7

*Column 1
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_3 ins_3_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)

					

							****************
							
*Column 2				
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_3 ins_3_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) 

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				crime_v
local	avgcrime 	= r(mean)

					

							****************
							
*Column 3							
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_3 ins_3_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)

					

							****************
							
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_3 ins_3_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)
local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)	

				
				
				
					**************************************											
							
*Placebo Test 2
*Table A8

*Column 1
ivreg2 log_crimev_pop (zscore_s_aod = ins_3_6 ins_3_6a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 	

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)				

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************

*Column 2							
ivreg2 log_crimev_pop (zscore_s_aod = ins_3_6 ins_3_6a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)					

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)

			
				
							****************
							
*Column 3							
ivreg2 log_lag_crimev_pop (zscore_s_aod = ins_3_6 ins_3_6a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)				

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)

				
				
							****************
							
*Column 4							
ivreg2 log_lag_crimev_pop (zscore_s_aod = ins_3_6 ins_3_6a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)	

local	fstat2 = e(widstat)
weakivtest
local	fstat3 = r(F_eff)			

boottest		zscore_s_aod, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)		
				
				
				
				*********************************************
