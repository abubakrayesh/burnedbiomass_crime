****	This do file runs the main IV regressions and robustness checks			****
****	for violent crimes														****



use"${...}\final_totalcrime.dta", clear
set more off

		

***		main IV regression (with first stage, saved separately)

**	Violent Crimes	
*Tables 2 and A2:
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)

				
				
							****************
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)							


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
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
							
*Tables 3 and A3:
								
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3) ///
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
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3) ///
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
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3) ///
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
sum				lag_crimev
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)						


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3) ///
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
sum				lag_crimev
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
						******************************************							
							
							
***	Using Population instead of Area for Weighting							
*Tables A7 and A4:
															
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgpop	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_crimev_pop (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgpop	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgpop	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)						


				
				
							****************
							
ivreg2 log_lag_crimev_pop (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				rice_production rice_area pslm_meaneduc_dist pslm_meandaywk_dist ///
				i.year i.dist_id i.division_id#c.year, cluster(dist_id) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				pop_2017
local	avgpop	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
local	fstat1 = e(cdf)
local	fstat2 = e(widstat)
est restore	first_zscore_w_aod_2
sum				mean_stat_aod
local	sumaod		= r(mean)
sum				ins_3
local	suminstr	= r(mean)


				
				
						******************************************							
							
							
							
***	FAOs classification of rice districts							
*Table A8:			
				
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_4) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
				
							****************

ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_4) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)
				
				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_4) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)			
				

				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_4) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)						

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)

						
				
				
				*********************************************					
							
							
***	Same treatment months for air pollution and instrument						
*Table A9:
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_2) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_2) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_2) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)					


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_2) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
				
				
				*********************************************							
							
							
***	Lagged average of the instrument	

*Table A12:

ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_5) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_crimev_area (zscore_w_aod_2 = ins_3_5) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_v
local	avgcrime	= r(mean)


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_5) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)						


				
				
							****************
							
ivreg2 log_lag_crimev_area (zscore_w_aod_2 = ins_3_5) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id i.division_id#c.year, cluster(yrdist) first  ///
				savefirst savefprefix(first_)					

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				
				
				
				
				
				
				*********************************************							

*Accounting for spatial correlation in SEs
*Table A15:
				
use"${final}\final_totalcrime.dta", clear
set more off
*spmat use invdist2 using invdist2.spmat

merge m:1 dist_id using "${final}\spweight.dta"


acreg 	log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year i.division_id#c.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(75)		
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
				

				
							****************


acreg 	log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year i.division_id#c.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(150)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)


				
							****************
				
acreg 	log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(200)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)


				
							****************
				
acreg 	log_crimev_area (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.dist_id i.year, spatial ///
				latitude(y_centroid) longitude(x_centroid) dist(300)
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				lag_crimev
local	avgcrime	= r(mean)
