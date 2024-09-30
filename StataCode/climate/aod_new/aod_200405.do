****	This do file creates the various AOD variables for 2004 & 2005		****

*** generating 2004 data
clear
set maxvar 10000

local j = 2004

use "${...}/smognew_200405_1.dta", clear
set more off

	foreach m of numlist 2/4 {
	merge 1:1 ADM3_PCODE using "${...}/smognew_200405_`m'.dta"
	drop if _merge==2
	drop _merge
	}

	

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

egen count_sum = rowtotal(X`j'*_count)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

local m = 0
local n = 0
forvalues i = 1/9	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`m'`n'`i'_0`k'_1_sum * ( X`j'`m'`n'`i'_0`k'_1_count / count_sum)
	}	
}


local m = 0
forvalues i = 10/99	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`m'`i'_0`k'_1_sum * (X`j'`m'`i'_0`k'_1_count / count_sum)
	}	
}


forvalues i = 100/366	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`i'_0`k'_1_sum * (X`j'`i'_0`k'_1_count / count_sum)
	}	
}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1_1 - avg_`j'_30_3)
egen feb_avgt = rowmean(avg_`j'_32_1 - avg_`j'_58_3)
egen mar_avgt = rowmean(avg_`j'_61_1 - avg_`j'_90_3)
egen apr_avgt = rowmean(avg_`j'_92_1 - avg_`j'_120_4)
egen may_avgt = rowmean(avg_`j'_122_1 - avg_`j'_151_4)
egen jun_avgt = rowmean(avg_`j'_153_1 - avg_`j'_181_4)
egen jul_avgt = rowmean(avg_`j'_183_1 - avg_`j'_212_4)
egen aug_avgt = rowmean(avg_`j'_214_1 - avg_`j'_243_4)
egen sep_avgt = rowmean(avg_`j'_245_1 - avg_`j'_273_3)
egen oct_avgt = rowmean(avg_`j'_275_1 - avg_`j'_304_4)
egen nov_avgt = rowmean(avg_`j'_306_1 - avg_`j'_334_4)
egen dec_avgt = rowmean(avg_`j'_336_1 - avg_`j'_365_4)


foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'_new.dta", replace







*** generating 2005 data
clear
set maxvar 10000

local j = 2005

use "${...}/smognew_200405_1.dta", clear
set more off

	foreach m of numlist 2/4 {
	merge 1:1 ADM3_PCODE using "${...}/smognew_200405_`m'.dta"
	drop if _merge==2
	drop _merge
	}

	

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

egen count_sum = rowtotal(X`j'*_count)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

local m = 0
local n = 0
forvalues i = 1/9	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`m'`n'`i'_0`k'_1_sum * ( X`j'`m'`n'`i'_0`k'_1_count / count_sum)
	}	
}


local m = 0
forvalues i = 10/99	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`m'`i'_0`k'_1_sum * (X`j'`m'`i'_0`k'_1_count / count_sum)
	}	
}


forvalues i = 100/366	{

	forvalues k = 1/4	{

	capture gen avg_`j'_`i'_`k' = ///
		X`j'`i'_0`k'_1_sum * (X`j'`i'_0`k'_1_count / count_sum)
	}	
}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1_1 - avg_`j'_30_4)
egen feb_avgt = rowmean(avg_`j'_32_1 - avg_`j'_58_1)
egen mar_avgt = rowmean(avg_`j'_60_1 - avg_`j'_89_4)
egen apr_avgt = rowmean(avg_`j'_91_1 - avg_`j'_119_4)
egen may_avgt = rowmean(avg_`j'_121_1 - avg_`j'_136_3)
egen jun_avgt = rowmean(avg_`j'_152_1 - avg_`j'_180_4)
egen jul_avgt = rowmean(avg_`j'_182_1 - avg_`j'_188_2)		
egen aug_avgt = rowmean(avg_`j'_213_1 - avg_`j'_242_4)
*egen sep_avgt = rowmean(avg_`j'_244_1 - avg_`j'_272_4)		//september missing in 2005
egen oct_avgt = rowmean(avg_`j'_274_1 - avg_`j'_291_1)
egen nov_avgt = rowmean(avg_`j'_305_1 - avg_`j'_333_4)
egen dec_avgt = rowmean(avg_`j'_335_1 - avg_`j'_354_2)


foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'_new.dta", replace




