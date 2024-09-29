****	This do file runs the main IV regressions and robustness checks			****
****	for violent crimes														****



use"${...}\final_totalcrime.dta", clear
set more off

		

***		main IV regression (with first stage, saved separately)

**	Violent Crimes	

*Table 2 Panel A:
*Column 1
reg log_crimev_pop zscore_w_aod_2 ///
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
reg log_crimev_pop zscore_w_aod_2 ///
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
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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

						
						
*Table 2 Panel B:
*Column 1							
reg log_lag_crimev_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)							

				
				
							****************
							
							
*Column 2
reg log_lag_crimev_pop zscore_w_aod_2 ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 			
sum				mean_stat_aod
local	avgaod		= r(mean)
sum				pop_2017
local	avgarea		= r(mean)
sum				lag_crimev
local	avgcrime 	= r(mean)							

				
				
							****************
							
	
	
*Column 3				
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	 
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
							****************
											
							
*Column 4
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)

				
							****************
		
							
*Column 5				
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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
sum				lag_crimev
local	avgcrime	= r(mean)



				
							****************
								
							
*Column 6
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
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
sum				lag_crimev
local	avgcrime	= r(mean)


				
						******************************************							
					
					
					
					

*Table A4: Rice District Classification

*Column 1
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_4 ins_3_4a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
					

							****************
				
*Column 2
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_4 ins_3_4a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)



							****************


*Column 3
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_4 ins_3_4a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



							****************

*Column 4
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_4 ins_3_4a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)						

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



						******************************************							

						
						
						
						
*Table A5: Same Treatment Months

*Column 1
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_2 ins_3_2a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) 				

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)

					

							****************
				
*Column 2


ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3_2 ins_3_2a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)
				
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)



							****************


*Column 3
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_2 ins_3_2a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



							****************

*Column 4
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3_2 ins_3_2a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
weakivtest
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



				
						******************************************	
						
				
				
				
						
						
*Table A9
*Column 1
merge m:1 dist_id using "${...}\spweight.dta"


acreg 	log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(75)		
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)

					

							****************
				
*Column 2


acreg 	log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(150)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



							****************


*Column 3
acreg 	log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(200)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)



							****************

*Column 4
acreg 	log_lag_crimev_pop (zscore_w_aod_2 = ins_3 ins_3a) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(250)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
						******************************************							
