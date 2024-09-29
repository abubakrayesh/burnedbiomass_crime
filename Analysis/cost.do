****	This do file calculates VOSL estimates ****
****																	****

global crime "C:\Users\abuba\Dropbox\Smog-Crime\Data\Crime"
global finaltemp "C:\Users\abuba\Dropbox\Smog-Crime\Data\Final_temp"
global final "C:\Users\abuba\Dropbox\Smog-Crime\Data\Final"
global weather "C:\Users\abuba\Dropbox\Smog-Crime\Data\Rainfall and Temp"
global shape "C:\Users\abuba\Dropbox\Smog-Crime\Data\Pak_SHP"
global rice "C:\Users\abuba\Dropbox\Smog-Crime\Data\Rice"
global graphs "C:\Users\abuba\Dropbox\Smog-Crime\Output\Graphs"
global distance "C:\Users\abuba\Dropbox\Smog-Crime\Data\Distance"
global ghd "C:\Users\abuba\Dropbox\Smog-Crime\Data\GHDx"

clear
set more off



use"${final}\final_totalcrime.dta", clear
set more off

*storing the effect of crime from the regression
ivreg2 log_crimev_area (zscore_w_aod = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id, cluster(yrdist)

matrix 		all_results = e(b)						//storing all the results from the regression//
matrix 		crime_result = all_results[1,1]			//storing only the relevant coefficient on zscore_w_aod//
local 		crime_effect = trace(crime_result)			//storing the coefficient of zscore_w_aod as a local//

*storing the standard deviation of main aod variable used in the regression
sum			d_w_avgt_aod
local 		sd_waod = r(sd)

*generating the effect of onse standard dev increase in aod on crime
gen		crime_effect_sd =  (`crime_effect') * 100
sum		crime_effect_sd		//this var takes only one value//
local	mean_crime_effect = r(mean)				//this is the effect of one st dev change in air pollution//

*now generating the change in aod after 2014 in terms of standard dev of the main aod variable used in the regression
sum		d_w_avgt_aod	if year==2002
local	mean_waod_before = r(mean)

sum		d_w_avgt_aod	if year==2016
local	mean_waod_after = r(mean)

gen		avg_aod_change = `mean_waod_after' - `mean_waod_before'
sum		avg_aod_change
local	mean_aod_change = r(mean)

gen		sd_aod_change = `mean_aod_change' / `sd_waod'
sum		sd_aod_change
local	aod_change = r(mean)

gen		crime_change = `aod_change' * `mean_crime_effect'  //this is the change in crime after 2014 due to a one st dev increase in air pollution//
sum		crime_change
local	crime_change_aod = r(mean)

*levelsof 	crimeno if year==2002 , local(crime_2017)
*sum		crimeno if year<=2014
bys year: egen 		punjab_annual_crime = sum(crimeno)

bys year: egen 		punjab_annual_crime_violent = sum(crime_v)

*sum 	punjab_annual_crime				if year<=2014		//need to decide whether to use this or nor//
sum 	punjab_annual_crime_violent		if year<=2014 
local	crime_before_aod = r(mean)


** Calculations to transfer US and India's VOSL And Other Crime cost calculations to Pakistan
local Ind_VOSL06_2010 = 0.3 / 0.6987209853
local USA_VOSL06_2010 = 7.7 / 0.9244970508

local USA_Assault14_2010 = 0.02434 / 0.9244970508
local USA_Rape14_2010 = 0.051165 / 0.9244970508
local USA_Murder_2010 = 10.3 / 0.9244970508


local Pak_GNIcapita10_2017 = 3835.512924
local Pak_GNIcapita10_2010 = `Pak_GNIcapita10_2017' / 1.569113459
*local Pak_GNIcapita10_2006 = `Pak_GNIcapita10_2010' * 0.6019676858

local IND_GNIcapita10_2017 = 4189.433075
local IND_GNIcapita10_2010 = `IND_GNIcapita10_2017' / 1.603468515
*local IND_GNIcapita06_2006 = `Ind_GNIcapita10_2010' * 0.6987209853 

local USA_GNIcapita14_2017 = 58376.42303
local USA_GNIcapita14_2010 = `USA_GNIcapita14_2017' / 112.4115573
*local USA_GNIcapita14_2006 = `USA_GNIcapita14_2010' * 0.9244970508 

local Pak_VOSL_2010IND = `Ind_VOSL06_2010' * ( ( `Pak_GNIcapita10_2010' / `IND_GNIcapita10_2010' ) ^ 1 )
local Pak_VOSL_2018IND = `Pak_VOSL_2010IND' * 1.648793939
di `Pak_VOSL_2018IND'

local PAK_VOSL_2010USA = `USA_VOSL06_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_VOSL_2018USA = `PAK_VOSL_2010USA ' * 1.648793939
di `Pak_VOSL_2018USA'

local PAK_Assault_2010USA = `USA_Assault14_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Assault_2018USA = `PAK_Assault_2010USA' * 1.648793939

local PAK_Rape_2010USA = `USA_Rape14_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Rape_2018USA = `PAK_Rape_2010USA' * 1.648793939

local PAK_Murder_2010USA = `USA_Murder_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Murder_2018USA = `PAK_Murder_2010USA' * 1.648793939


** Now calculating the true costs for Pakistan in 2018
gen		crime_aod_cost_INDVosl = (`crime_change_aod' / 100) * (`crime_before_aod') * (`Pak_VOSL_2018IND')
sum		crime_aod_cost_INDVosl

gen		crime_aod_cost_USAVosl = (`crime_change_aod' / 100) * (`crime_before_aod') * (`Pak_VOSL_2018USA')
sum		crime_aod_cost_USAVosl

gen		crime_aod_cost_USAAssault = (`crime_change_aod' / 100) * (`crime_before_aod') * (`Pak_Assault_2018USA') * 1.569113
sum		crime_aod_cost_USAAssault

*gen		crime_aod_cost_USARape = (`crime_change_aod' / 100) * (`crime_before_aod') * (`Pak_Rape_2018USA')
*sum		crime_aod_cost_USARape

*gen		crime_aod_cost_USAMurder = (`crime_change_aod' / 100) * (`crime_before_aod') * (`Pak_Murder_2018USA')
*sum		crime_aod_cost_USAMurder
*exit





*use "${final}\value_life.dta", clear	

*storing the value of lost years in life for later calculations
*levelsof val if year==2017 & measure_id==2, local(value_lostyears)

*gen		crime_aod_cost = `crime_change_aod' * `value_lostyears'
*sum		crime_aod_cost




*** Now separate calculations for each type of crime***
use"${final}\final_totalcrime.dta", clear
set more off


** Calculations to transfer US and India's VOSL And Other Crime cost calculations to Pakistan
local Ind_VOSL06_2010 = 0.3 / 0.6987209853
local USA_VOSL06_2010 = 7.7 / 0.9244970508

local USA_Assault14_2010 = 0.02434 / 0.9244970508
local USA_Rape14_2010 = 0.051165 / 0.9244970508
local USA_Murder_2010 = 10.3 / 0.9244970508


local Pak_GNIcapita10_2017 = 3835.512924
local Pak_GNIcapita10_2010 = `Pak_GNIcapita10_2017' / 1.569113459
*local Pak_GNIcapita10_2006 = `Pak_GNIcapita10_2010' * 0.6019676858

local IND_GNIcapita10_2017 = 4189.433075
local IND_GNIcapita10_2010 = `IND_GNIcapita10_2017' / 1.603468515
*local IND_GNIcapita06_2006 = `Ind_GNIcapita10_2010' * 0.6987209853 

local USA_GNIcapita14_2017 = 58376.42303
local USA_GNIcapita14_2010 = `USA_GNIcapita14_2017' / 112.4115573
*local USA_GNIcapita14_2006 = `USA_GNIcapita14_2010' * 0.9244970508 

local Pak_VOSL_2010IND = `Ind_VOSL06_2010' * ( ( `Pak_GNIcapita10_2010' / `IND_GNIcapita10_2010' ) ^ 1 )
local Pak_VOSL_2018IND = `Pak_VOSL_2010IND' * 1.648793939
di `Pak_VOSL_2018IND'

local PAK_VOSL_2010USA = `USA_VOSL06_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_VOSL_2018USA = `PAK_VOSL_2010USA ' * 1.648793939
di `Pak_VOSL_2018USA'

local PAK_Assault_2010USA = `USA_Assault14_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Assault_2018USA = `PAK_Assault_2010USA' * 1.648793939

local PAK_Rape_2010USA = `USA_Rape14_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Rape_2018USA = `PAK_Rape_2010USA' * 1.648793939

local PAK_Murder_2010USA = `USA_Murder_2010' * ( ( `Pak_GNIcapita10_2010' / `USA_GNIcapita14_2010' ) ^ 1 )
local Pak_Murder_2018USA = `PAK_Murder_2010USA' * 1.648793939


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
		

*storing the standard deviation of main aod variable used in the regression
sum			d_w_avgt_aod
local 		sd_waod = r(sd)

*now generating the change in aod after 2014 in terms of standard dev of the main aod variable used in the regression
sum		d_w_avgt_aod	if year==2002
local	mean_waod_before = r(mean)

sum		d_w_avgt_aod	if year==2016
local	mean_waod_after = r(mean)

gen		avg_aod_change = `mean_waod_after' - `mean_waod_before'
sum		avg_aod_change
local	mean_aod_change = r(mean)

gen		sd_aod_change = `mean_aod_change' / `sd_waod'
sum		sd_aod_change
local	aod_change = r(mean)


bys year: egen 		punjab_annual_crime_violent = sum(crime_v)	
sum 	punjab_annual_crime_violent		if year<=2014 
local	crime_before_aod = r(mean)
	

*Murder
ivreg2 log_crime_Murder_a (zscore_w_aod = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)
matrix 		all_results = e(b)						//storing all the results from the regression//
matrix 		crime_result = all_results[1,1]			//storing only the relevant coefficient on zscore_w_aod//
local 		crime_effect_murder = trace(crime_result)			//storing the coefficient of zscore_w_aod as a local//			
				
gen		crime_effect_sd_murder =  (`crime_effect_murder') * 100
sum		crime_effect_sd_murder						//this var takes only one value//
local	mean_crime_effect_murder = r(mean)			//this is the effect of one st dev change in air pollution//				

gen		crime_change_murder = `aod_change' * `mean_crime_effect_murder'  //this is the change in crime after 2014 due to a one st dev increase in air pollution//
sum		crime_change_murder
local	crime_change_murder_aod = r(mean)

bys year: egen 		punjab_annual_crime_murder = sum(crime_Murder)
sum 	punjab_annual_crime_murder		if year<=2014 
local	crime_murder_before_aod = r(mean)
				
gen prptn_murder_before_aod		= 	(`crime_murder_before_aod' / `crime_before_aod') * 100
sum prptn_murder_before_aod	
local murder_before_aod = r(mean)

	
				

*Rape
ivreg2 log_crime_Rape_a (zscore_w_aod = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)
matrix 		all_results = e(b)						//storing all the results from the regression//
matrix 		crime_result = all_results[1,1]			//storing only the relevant coefficient on zscore_w_aod//
local 		crime_effect_rape = trace(crime_result)			//storing the coefficient of zscore_w_aod as a local//			
				
gen		crime_effect_sd_rape =  (`crime_effect_rape') * 100
sum		crime_effect_sd_rape						//this var takes only one value//
local	mean_crime_effect_rape = r(mean)			//this is the effect of one st dev change in air pollution//				

gen		crime_change_rape = `aod_change' * `mean_crime_effect_rape'  //this is the change in crime after 2014 due to a one st dev increase in air pollution//
sum		crime_change_rape
local	crime_change_rape_aod = r(mean)

bys year: egen 		punjab_annual_crime_rape = sum(crime_Rape)
sum 	punjab_annual_crime_rape		if year<=2014 
local	crime_rape_before_aod = r(mean)
				
gen prptn_rape_before_aod		= 	(`crime_rape_before_aod' / `crime_before_aod') * 100
sum prptn_rape_before_aod	
local rape_before_aod = r(mean)




*Assault				
ivreg2 log_crime_Hurt_a (zscore_w_aod = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)
matrix 		all_results = e(b)						//storing all the results from the regression//
matrix 		crime_result = all_results[1,1]			//storing only the relevant coefficient on zscore_w_aod//
local 		crime_effect_hurt = trace(crime_result)			//storing the coefficient of zscore_w_aod as a local//			
				
gen		crime_effect_sd_hurt =  (`crime_effect_hurt') * 100
sum		crime_effect_sd_hurt						//this var takes only one value//
local	mean_crime_effect_hurt = r(mean)			//this is the effect of one st dev change in air pollution//				

gen		crime_change_hurt = `aod_change' * `mean_crime_effect_hurt'  //this is the change in crime after 2014 due to a one st dev increase in air pollution//
sum		crime_change_hurt
local	crime_change_hurt_aod = r(mean)

bys year: egen 		punjab_annual_crime_hurt = sum(crime_Hurt)
sum 	punjab_annual_crime_hurt		if year<=2014 
local	crime_hurt_before_aod = r(mean)
				
gen prptn_hurt_before_aod		= 	(`crime_hurt_before_aod' / `crime_before_aod') * 100
sum prptn_hurt_before_aod	
local hurt_before_aod = r(mean)




*Attempted Murder
ivreg2 log_crime_AttemptedMurder_a (zscore_w_aod = ins_3) ///
				d_w_avgt_temp d_w_avgt_precip d_avgt_fire ///
				i.year i.dist_id,  cluster(dist_id)  ///
				savefirst savefprefix(first_)
matrix 		all_results = e(b)						//storing all the results from the regression//
matrix 		crime_result = all_results[1,1]			//storing only the relevant coefficient on zscore_w_aod//
local 		crime_effect_attmurder = trace(crime_result)			//storing the coefficient of zscore_w_aod as a local//				
				
gen		crime_effect_sd_attmurder =  (`crime_effect_attmurder') * 100
sum		crime_effect_sd_attmurder						//this var takes only one value//
local	mean_crime_effect_attmurder = r(mean)			//this is the effect of one st dev change in air pollution//				

gen		crime_change_attmurder = `aod_change' * `mean_crime_effect_attmurder'  //this is the change in crime after 2014 due to a one st dev increase in air pollution//
sum		crime_change_attmurder
local	crime_change_attmurder_aod = r(mean)

bys year: egen 		punjab_annual_crime_attmurder = sum(crime_AttemptedMurder)
sum 	punjab_annual_crime_attmurder		if year<=2014 
local	crime_attmurder_before_aod = r(mean)
				
gen prptn_attmurder_before_aod		= 	(`crime_attmurder_before_aod' / `crime_before_aod') * 100
sum prptn_attmurder_before_aod	
local attmurder_before_aod = r(mean)





gen		crime_aod_cost_USA_murder = (`crime_change_murder_aod' / 100) * (`crime_murder_before_aod') * (`Pak_Murder_2018USA') * 1.569113
sum		crime_aod_cost_USA_murder

gen		crime_aod_cost_USA_rape = (`crime_change_murder_aod' / 100) * (`crime_rape_before_aod') * (`Pak_Rape_2018USA') * 1.569113
sum		crime_aod_cost_USA_rape	

gen		crime_aod_cost_USA_hurt = (`crime_change_hurt_aod' / 100) * (`crime_hurt_before_aod') * (`Pak_Assault_2018USA') * 1.569113
sum		crime_aod_cost_USA_hurt	

gen		crime_aod_cost_USA_attmurder = (`crime_change_attmurder_aod' / 100) * (`crime_attmurder_before_aod') * (`Pak_Assault_2018USA') * 1.569113
sum		crime_aod_cost_USA_attmurder	

///Bring USA's Vosl estimates to India's; dividing by 97.7///

