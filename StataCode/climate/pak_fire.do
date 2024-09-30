****	This do file creates the various FIRE variables for 2002-2020		****


clear
set maxvar 20000

*generating data for 2002
local j = 2002


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_30)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_59)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_90)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_120)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_151)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_212)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_243)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_273)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_303)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_334)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2003
local j = 2003


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


*egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_29)	//January missing for 2003
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2004
local j = 2004


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_365)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace





*generating data for 2005
local j = 2005


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2006
local j = 2006


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2007
local j = 2007


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2008
local j = 2008


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)

forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


*egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_29)		//data for January - July not available for 2008//
*egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
*egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
*egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
*egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
*egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
*egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_219 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_365)



foreach var of varlist avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace





*generating data for 2009
local j = 2009


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2010
local j = 2010


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace



*generating data for 2011
local j = 2011


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2012
local j = 2012


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)


foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist*  *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2013
local j = 2013


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2014
local j = 2014


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2015
local j = 2015


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2016
local j = 2016


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2017
local j = 2017


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_83)
egen apr_avgt = rowmean(avg_`j'_93 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2018
local j = 2018


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)


foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace




*generating data for 2019
local j = 2019


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)

egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_333)
egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace





*generating data for 2020
local j = 2020


use "${...}/pak_fire.dta", clear
set more off

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)
encode 		ADM3_PCODE, gen(tehsil_id)

collapse (sum) *_sum *_count (first) ADM2_EN, by(dist_id)

egen count_sum = rowtotal(X`j'*_count)


forvalues i = 1/9	{
	
	local m = 0
	local n = 0
	
	capture gen avg_`j'_`i' = ///
		X`j'`m'`n'`i'_1_sum * (X`j'`m'`n'`i'_1_count / count_sum)
	}	


forvalues i = 10/99	{

	local m = 0
	capture gen avg_`j'_`i' = ///
		X`j'`m'`i'_1_sum * (X`j'`m'`i'_1_count / count_sum)
	}	


forvalues i = 100/366	{

	capture gen avg_`j'_`i' = ///
		X`j'`i'_1_sum * (X`j'`i'_1_count / count_sum)
	}


drop *_sum *_count

egen avgt = rowmean(avg_*)


egen jan_avgt = rowmean(avg_`j'_1 - avg_`j'_31)
egen feb_avgt = rowmean(avg_`j'_32 - avg_`j'_58)
egen mar_avgt = rowmean(avg_`j'_60 - avg_`j'_89)
egen apr_avgt = rowmean(avg_`j'_91 - avg_`j'_119)
egen may_avgt = rowmean(avg_`j'_121 - avg_`j'_150)
egen jun_avgt = rowmean(avg_`j'_152 - avg_`j'_180)
egen jul_avgt = rowmean(avg_`j'_182 - avg_`j'_207)
egen aug_avgt = rowmean(avg_`j'_213 - avg_`j'_242)
egen sep_avgt = rowmean(avg_`j'_244 - avg_`j'_272)
egen oct_avgt = rowmean(avg_`j'_274 - avg_`j'_302)
egen nov_avgt = rowmean(avg_`j'_305 - avg_`j'_325)
*egen dec_avgt = rowmean(avg_`j'_335 - avg_`j'_364)		//December missing for 2020//



foreach var of varlist avgt jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt	{
	rename `var' d_`var'
}


rename 	ADM2_EN dist_name

keep 	dist* *_avgt

gen 	year = `j'

save "${...}/`j'.dta", replace



**append the data for all the years					
use "${...}/2002.dta", clear

set more off

foreach num of numlist 2003/2020 {

	append using "${...}/`num'.dta"
	}
	
save "${...}/pakfire_final.dta", replace
