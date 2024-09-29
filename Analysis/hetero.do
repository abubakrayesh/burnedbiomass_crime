****	This do file runs the heterogeneity checcks								****



use"${...}\final_totalcrime.dta", clear
set more off

sort dist_id year

foreach var of varlist crime_AttemptedMurder crime_Burglary crime_Hurt  ///
		crime_KidnappingAbduction crime_MotorVehiclesTheft crime_Dacoity ///
		crime_Murder crime_OrdinaryThefts crime_Rape crime_Robbery 		{
	
	bys dist_id: gen lag_`var' = `var'[_n+1]
	gen lag_`var'_a = lag_`var'/area_2017
	gen logl_`var'_a 			= ln(lag_`var'_a)
	replace logl_`var'_a 		= 0 					if lag_`var'_a==0
	
	gen `var'_area = `var'/area_2017
	gen log_`var'_a			= ln(`var'_a)
	replace `var'_a 		= 0 						if `var'==0
		
		}

*Table A16

ivreg2 log_crime_AttemptedMurder_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_AttemptedMurder
local	avgcrime	= r(mean)
										
ivreg2 log_crime_Hurt_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Hurt
local	avgcrime	= r(mean)
				
				
ivreg2 logl_crime_KidnappingAbduction_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_KidnappingAbduction
local	avgcrime	= r(mean)
				
				
ivreg2 log_crime_Murder_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Murder
local	avgcrime	= r(mean)	
								
				
ivreg2 log_crime_Rape_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Rape
local	avgcrime	= r(mean)
						
						
						
						
						
						
						
						*****************************
		
*Table A18:
		
ivreg2 log_crime_Dacoity_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Dacoity
local	avgcrime	= r(mean)						
				
ivreg2 log_crime_Robbery_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Robbery
local	avgcrime	= r(mean)	
				
				
ivreg2 log_crime_Burglary_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Burglary
local	avgcrime	= r(mean)
				
				
ivreg2 log_crime_MotorVehiclesTheft_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_MotorVehiclesTheft
local	avgcrime	= r(mean)					
								
				
ivreg2 log_crime_OrdinaryThefts_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_OrdinaryThefts
local	avgcrime	= r(mean)
				
				
				
				
				
				******************************
				
*Table A17:				
ivreg2 logl_crime_AttemptedMurder_a (zscore_w_aod_2= ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_AttemptedMurder
local	avgcrime	= r(mean)
										
ivreg2 logl_crime_Hurt_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Hurt
local	avgcrime	= r(mean)
				
				
ivreg2 logl_crime_KidnappingAbduction_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_KidnappingAbduction
local	avgcrime	= r(mean)
				
				
ivreg2 logl_crime_Murder_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Murder
local	avgcrime	= r(mean)			
								
				
ivreg2 logl_crime_Rape_a (zscore_w_aod_2 = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)	

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				mean_stat_aod
local	avgaod	= r(mean)
sum				area_2017
local	avgarea	= r(mean)
sum				crime_Rape
local	avgcrime	= r(mean)
