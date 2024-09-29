****	This do file runs the mechanisms.										****



*mechanisms

use "${...}\final_mech.dta", clear
set more off


gen		w_aod_15_25 = 0
replace w_aod_15_25 = zscore_w_aod_2		if age>15 & age<=25
gen		w_aod_25_35 = 0
replace w_aod_25_35 = zscore_w_aod_2		if age>25 & age<=35
gen		w_aod_35_45 = 0
replace w_aod_35_45 = zscore_w_aod_2		if age>35 & age<=45
gen		w_aod_45 = 0
replace w_aod_45 = zscore_w_aod_2			if age>45

gen		ins_3d_15_25 = 0
replace ins_3d_15_25 = ins_3				if age>15 & age<=25
gen		ins_3d_25_35 = 0
replace ins_3d_25_35 = ins_3				if age>25 & age<=35
gen		ins_3d_35_45 = 0
replace ins_3d_35_45 = ins_3				if age>35 & age<=45
gen		ins_3d_45 = 0
replace ins_3d_45 = ins_3					if age>45

gen		ins_3da_15_25 = 0
replace ins_3da_15_25 = ins_3a				if age>15 & age<=25
gen		ins_3da_25_35 = 0
replace ins_3da_25_35 = ins_3a				if age>25 & age<=35
gen		ins_3da_35_45 = 0
replace ins_3da_35_45 = ins_3a				if age>35 & age<=45
gen		ins_3da_45 = 0
replace ins_3da_45 = ins_3a					if age>45

*preserve

drop if month>12
keep if male==1
keep if age>15

keep if month==1 | month==2 | month==3 | month==11 | month==12


*Table 4

*Column 1
ivreg2 unemployed (zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45 = ins_3 ins_3a ///
				ins_3d_25_35 ins_3da_25_35 ins_3d_35_45 ins_3da_35_45 ins_3d_45 ///
				ins_3da_45) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ ///
				i.year i.dist_id i.month, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp1	= r(p)					
boottest		w_aod_25_35, boottype(wild) seed(5)		 
local	bootp2	= r(p)	
boottest		w_aod_35_45, boottype(wild) seed(5)		 
local	bootp3	= r(p)	
boottest		w_aod_45, boottype(wild) seed(5)		 
local	bootp4	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed		 if male==1 & age>15 & age<=25
local	avgemp 	= r(mean)



				
				************************	

*Column 2
ivreg2 ln_income (zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45 = ins_3 ins_3a ///
				ins_3d_25_35 ins_3da_25_35 ins_3d_35_45 ins_3da_35_45 ins_3d_45 ///
				ins_3da_45) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ log_work_days_month ///
				i.year i.dist_id i.month, cluster(dist_id)  
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp1	= r(p)			
boottest		w_aod_25_35, boottype(wild) seed(5)		 
local	bootp2	= r(p)	
boottest		w_aod_35_45, boottype(wild) seed(5)		 
local	bootp3	= r(p)	
boottest		w_aod_45, boottype(wild) seed(5)		 
local	bootp4	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed		 if male==1 & age>15 & age<=25
local	avgemp 	= r(mean)
outreg2  using mech_1.tex, sdec(5) bdec(5) alpha(0.01, 0.05, 0.1) ///
				symbol(***, **, *) stats(coef se)  append ///
				title(Labor Supply Response to Air Pollution) ///
				ctitle(IV, Log Monthly, Income) tex	///
				keep(zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45) nocons ///
				adds(Avg. Air Pollution, `avgaod', Avg. Employment, `avgemp') ///
				addtext(District FE, Yes, Time FE, Yes, Division-Specific Trend, No, ///
				Weather Controls, Yes, Bootstrap P-value1, `bootp1', Bootstrap P-value2, ///
				`bootp2', Bootstrap P-value3, `bootp3', Bootstrap P-value4, `bootp4')
				

				
				************************					
				

*Column 3				
ivreg2 log_work_days_month (zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45 = ins_3 ins_3a ///
				ins_3d_25_35 ins_3da_25_35 ins_3d_35_45 ins_3da_35_45 ins_3d_45 ///
				ins_3da_45) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ ///
				i.year i.dist_id i.month, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp1	= r(p)			 
boottest		w_aod_25_35, boottype(wild) seed(5)		 
local	bootp2	= r(p)	
boottest		w_aod_35_45, boottype(wild) seed(5)		 
local	bootp3	= r(p)	
boottest		w_aod_45, boottype(wild) seed(5)		 
local	bootp4	= r(p)	
sum				zscore_w_aod_2
local	avgaod		= r(mean)
sum				unemployed		 if male==1 & age>15 & age<=25
local	avgemp 	= r(mean)
outreg2  using mech_1.tex, sdec(5) bdec(5) alpha(0.01, 0.05, 0.1) ///
				symbol(***, **, *) stats(coef se)  append ///
				title(Labor Supply Response to Air Pollution) ///
				ctitle(IV, Log Days Worked, per Month) tex	///
				keep(zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45) nocons ///
				adds(Avg. Air Pollution, `avgaod', Avg. Employment, `avgemp') ///
				addtext(District FE, Yes, Time FE, Yes, Division-Specific Trend, No, ///
				Weather Controls, Yes, Bootstrap P-value1, `bootp1', Bootstrap P-value2, ///
				`bootp2', Bootstrap P-value3, `bootp3', Bootstrap P-value4, `bootp4')
								
			
			
				
					**************************************
					

*Table A12	
ivreg2 consulted_doc (zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45 = ins_3 ins_3a ///
				ins_3d_25_35 ins_3da_25_35 ins_3d_35_45 ins_3da_35_45 ins_3d_45 ///
				ins_3da_45) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire years_educ log_work_days_month ///
				i.year i.dist_id i.month, cluster(dist_id) 
boottest		zscore_w_aod_2, boottype(wild) seed(5)		 
local	bootp1	= r(p)			 
boottest		w_aod_25_35, boottype(wild) seed(5)		 
local	bootp2	= r(p)	
boottest		w_aod_35_45, boottype(wild) seed(5)		 
local	bootp3	= r(p)	
boottest		w_aod_45, boottype(wild) seed(5)		 
local	bootp4	= r(p)					
sum				consulted_doc		
local	avgdoc 	= r(mean)
outreg2  using mech_2.tex, sdec(5) bdec(5) alpha(0.01, 0.05, 0.1) ///
				symbol(***, **, *) stats(coef se)  replace ///
				title($=1$ If Consulted Doctor \& Male) ///
				ctitle(IV, ) tex	keep(zscore_w_aod_2 w_aod_25_35 w_aod_35_45 w_aod_45) nocons ///
				adds(Avg. Air Pollution, `avgaod', Avg. Employment, `avgemp') ///
				addtext(District FE, Yes, Time FE, Yes, Division-Specific Trend, No, ///
				Weather Controls, Yes, Bootstrap P-value1, `bootp1', Bootstrap P-value2, ///
				`bootp2', Bootstrap P-value3, `bootp3', Bootstrap P-value4, `bootp4')					
				
				

				*************************************************		
							
				
				
