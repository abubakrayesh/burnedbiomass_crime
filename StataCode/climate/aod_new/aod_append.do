****	This do file creates the various AOD variables by summing them		****
*** This file then cleans the data, and then appends and merges it			****	

**append the data for all the years					
use "${...}/2002_new.dta", clear

set more off

foreach num of numlist 2003/2020 {

	append using "${tempaod}/`num'_new.dta"
	}
	
save "${...}/aod_final_new.dta", replace

