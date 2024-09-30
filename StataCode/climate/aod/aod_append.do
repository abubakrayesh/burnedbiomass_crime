****	This do file creates the various AOD variables by summing them		****
*** This file then cleans the data, and then appends and merges it			****	

**append the data for all the years					
use "${...}/2002.dta", clear

set more off

foreach num of numlist 2003/2020 {

	append using "${tempaod}/`num'.dta"
	}
	
save "${...}/aod_final.dta", replace

