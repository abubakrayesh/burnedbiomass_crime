****	This do file runs the mechanisms.										****



*mechanisms

use "${...}\final_mech.dta", clear
set more off

keep if male==1

preserve
keep if age>15 & age<=25
collapse (mean) ln_income log_work_days_month years_educ age emp_lfp unemployed ///
		        consulted_doc real_income ///
		 (max) division_id zscore_w_aod_2 ins_3 d_w_avgt_temp d_w_avgt_precip ///
			   d_avgt_fire monthtreat21_aod treat_month_21 ins_3_*, by(year dist_id)
			   
*Table A20:
			   

ivreg2 unemployed (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)	 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed
local	avgemp 	= r(mean)
			   
			   
*Table 6:

ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 
local	avgemp 	= r(mean)	

*Table A21:
				
ivreg2 consulted_doc (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				consulted_doc		
local	avgdoc 	= r(mean)	
			
restore



					**************************************


preserve
keep if age>25 & age<=35
collapse (mean) ln_income log_work_days_month years_educ age emp_lfp unemployed ///
		        consulted_doc real_income ///
		 (max) division_id zscore_w_aod_2 ins_3 d_w_avgt_temp d_w_avgt_precip ///
			   d_avgt_fire monthtreat21_aod treat_month_21 ins_3_*, by(year dist_id)
			   
			   
*Table A20:

ivreg2 unemployed (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed
local	avgemp 	= r(mean)
			   
*Table 6:

ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 
local	avgemp 	= r(mean)

*Table A21:
				
ivreg2 consulted_doc (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				consulted_doc		
local	avgdoc 	= r(mean)
					
restore


					**************************************


preserve
keep if age>35 & age<=45
collapse (mean) ln_income log_work_days_month years_educ age emp_lfp unemployed ///
		        consulted_doc real_income ///
		 (max) division_id zscore_w_aod_2 ins_3 d_w_avgt_temp d_w_avgt_precip ///
			   d_avgt_fire monthtreat21_aod treat_month_21 ins_3_*, by(year dist_id)
			   
			   
*Table A20:

ivreg2 unemployed (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed
local	avgemp 	= r(mean)
			   
			   
*Table 6:

ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 
local	avgemp 	= r(mean)

*Table A21:
				
ivreg2 consulted_doc (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				consulted_doc		
local	avgdoc 	= r(mean)
				
restore




					**************************************


preserve
keep if age>45
collapse (mean) ln_income log_work_days_month years_educ age emp_lfp unemployed ///
		        consulted_doc real_income ///
		 (max) division_id zscore_w_aod_2 ins_3 d_w_avgt_temp d_w_avgt_precip ///
			   d_avgt_fire monthtreat21_aod treat_month_21 ins_3_*, by(year dist_id)
			   
			   
*Table A20:

ivreg2 unemployed (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed
local	avgemp 	= r(mean)
			   
			   
*Table 6:

ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 
local	avgemp 	= r(mean)

*Table A21:
				
ivreg2 consulted_doc (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id, cluster(dist_id)

boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				consulted_doc		
local	avgdoc 	= r(mean)
					
restore							
					
					
					

				*************************************************


use "${...}\final_mech.dta", clear
set more off


*Table A19:
										
ivreg2 ln_income (zscore_w_aod_2 = ins_3)  log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id if male==1 ///
				& age>16 & age<=25, cluster(dist_id) 

boottest		zscore_w_aod_2, boottype(wild) seed(5)	 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 if male==1 & age>15 & age<=25
local	avgemp 	= r(mean)
										
ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id if male==1 ///
				& age>25 & age<=35, cluster(dist_id) 

boottest		zscore_w_aod_2, boottype(wild) seed(5)	 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 if male==1 & age>25 & age<=35
local	avgemp 	= r(mean)	

				
ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id if male==1 ///
				& age>35 & age<=45, cluster(dist_id) 
				
boottest		zscore_w_aod_2, boottype(wild) seed(5)	  
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 if male==1 & age>35 & age<=45
local	avgemp 	= r(mean)				

				
ivreg2 ln_income (zscore_w_aod_2 = ins_3) log_work_days_month ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ age ///
				i.year i.dist_id if male==1 ///
				& age>45, cluster(dist_id) 
				
boottest		zscore_w_aod_2, boottype(wild) seed(5)	 	 
local	bootp	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				real_income		 if male==1 & age>45 & age<=60
local	avgemp 	= r(mean)		
		

				
				************************								
				
				
