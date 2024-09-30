****	This do file creates the various windspeed v at 850hPa				****

*** generating windspeed data for 2002	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_1 windv850_2 windv850_3 windv850_4 ///
			windv850_5 windv850_6 windv850_7 windv850_8 ///
			windv850_9 windv850_10 windv850_11 windv850_12

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)






gen jan_avgt = windv850_1
gen feb_avgt = windv850_2
gen mar_avgt = windv850_3
gen apr_avgt = windv850_4
gen may_avgt = windv850_5
gen jun_avgt = windv850_6
gen jul_avgt = windv850_7
gen aug_avgt = windv850_8
gen sep_avgt = windv850_9
gen oct_avgt = windv850_10
gen nov_avgt = windv850_11
gen dec_avgt = windv850_12


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2002

save "${...}/2002.dta", replace


*** generating windspeed data for 2003	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_13 windv850_14 windv850_15 windv850_16 ///
			windv850_17 windv850_18 windv850_19 windv850_20 ///
			windv850_21 windv850_22 windv850_23 windv850_24

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_13
gen feb_avgt = windv850_14
gen mar_avgt = windv850_15
gen apr_avgt = windv850_16
gen may_avgt = windv850_17
gen jun_avgt = windv850_18
gen jul_avgt = windv850_19
gen aug_avgt = windv850_20
gen sep_avgt = windv850_21
gen oct_avgt = windv850_22
gen nov_avgt = windv850_23
gen dec_avgt = windv850_24


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2003

save "${...}/2003.dta", replace


*** generating windspeed data for 2004	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_25 windv850_26 windv850_27 windv850_28 ///
			windv850_29 windv850_30 windv850_31 windv850_32 ///
			windv850_33 windv850_34 windv850_35 windv850_36

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_25
gen feb_avgt = windv850_26
gen mar_avgt = windv850_27
gen apr_avgt = windv850_28
gen may_avgt = windv850_29
gen jun_avgt = windv850_30
gen jul_avgt = windv850_31
gen aug_avgt = windv850_32
gen sep_avgt = windv850_33
gen oct_avgt = windv850_34
gen nov_avgt = windv850_35
gen dec_avgt = windv850_36


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2004

save "${...}/2004.dta", replace




*** generating windspeed data for 2005	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_37 windv850_38 windv850_39 windv850_40 ///
			windv850_41 windv850_42 windv850_43 windv850_44 ///
			windv850_45 windv850_46 windv850_47 windv850_48

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_37
gen feb_avgt = windv850_38
gen mar_avgt = windv850_39
gen apr_avgt = windv850_40
gen may_avgt = windv850_41
gen jun_avgt = windv850_42
gen jul_avgt = windv850_43
gen aug_avgt = windv850_44
gen sep_avgt = windv850_45
gen oct_avgt = windv850_46
gen nov_avgt = windv850_47
gen dec_avgt = windv850_48


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2005

save "${...}/2005.dta", replace


*** generating windspeed data for 2006	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_49 windv850_50 windv850_51 windv850_52 ///
			windv850_53 windv850_54 windv850_55 windv850_56 ///
			windv850_57 windv850_58 windv850_59 windv850_60

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_49
gen feb_avgt = windv850_50
gen mar_avgt = windv850_51
gen apr_avgt = windv850_52
gen may_avgt = windv850_53
gen jun_avgt = windv850_54
gen jul_avgt = windv850_55
gen aug_avgt = windv850_56
gen sep_avgt = windv850_57
gen oct_avgt = windv850_58
gen nov_avgt = windv850_59
gen dec_avgt = windv850_60


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2006

save "${...}/2006.dta", replace



*** generating windspeed data for 2007	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_61 windv850_62 windv850_63 windv850_64 ///
			windv850_65 windv850_66 windv850_67 windv850_68 ///
			windv850_69 windv850_70 windv850_71 windv850_72

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_61
gen feb_avgt = windv850_62
gen mar_avgt = windv850_63
gen apr_avgt = windv850_64
gen may_avgt = windv850_65
gen jun_avgt = windv850_66
gen jul_avgt = windv850_67
gen aug_avgt = windv850_68
gen sep_avgt = windv850_69
gen oct_avgt = windv850_70
gen nov_avgt = windv850_71
gen dec_avgt = windv850_72


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2007

save "${...}/2007.dta", replace




*** generating windspeed data for 2008	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_73 windv850_74 windv850_75 windv850_76 ///
			windv850_77 windv850_78 windv850_79 windv850_80 ///
			windv850_81 windv850_82 windv850_83 windv850_84

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_73
gen feb_avgt = windv850_74
gen mar_avgt = windv850_75
gen apr_avgt = windv850_76
gen may_avgt = windv850_77
gen jun_avgt = windv850_78
gen jul_avgt = windv850_79
gen aug_avgt = windv850_80
gen sep_avgt = windv850_81
gen oct_avgt = windv850_82
gen nov_avgt = windv850_83
gen dec_avgt = windv850_84


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2008

save "${...}/2008.dta", replace




*** generating windspeed data for 2009	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_85 windv850_86 windv850_87 windv850_88 ///
			windv850_89 windv850_90 windv850_91 windv850_92 ///
			windv850_93 windv850_94 windv850_95 windv850_96

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_85
gen feb_avgt = windv850_86
gen mar_avgt = windv850_87
gen apr_avgt = windv850_88
gen may_avgt = windv850_89
gen jun_avgt = windv850_90
gen jul_avgt = windv850_91
gen aug_avgt = windv850_92
gen sep_avgt = windv850_93
gen oct_avgt = windv850_94
gen nov_avgt = windv850_95
gen dec_avgt = windv850_96


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2009

save "${...}/2009.dta", replace




*** generating windspeed data for 2010	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_97 windv850_98 windv850_99 windv850_100 ///
			windv850_101 windv850_102 windv850_103 windv850_104 ///
			windv850_105 windv850_106 windv850_107 windv850_108

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_97
gen feb_avgt = windv850_98
gen mar_avgt = windv850_99
gen apr_avgt = windv850_100
gen may_avgt = windv850_101
gen jun_avgt = windv850_102
gen jul_avgt = windv850_103
gen aug_avgt = windv850_104
gen sep_avgt = windv850_105
gen oct_avgt = windv850_106
gen nov_avgt = windv850_107
gen dec_avgt = windv850_108


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2010

save "${...}/2010.dta", replace




*** generating windspeed data for 2011	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_109 windv850_110 windv850_111 windv850_112 ///
			windv850_113 windv850_114 windv850_115 windv850_116 ///
			windv850_117 windv850_118 windv850_119 windv850_120

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_109
gen feb_avgt = windv850_110
gen mar_avgt = windv850_111
gen apr_avgt = windv850_112
gen may_avgt = windv850_113
gen jun_avgt = windv850_114
gen jul_avgt = windv850_115
gen aug_avgt = windv850_116
gen sep_avgt = windv850_117
gen oct_avgt = windv850_118
gen nov_avgt = windv850_119
gen dec_avgt = windv850_120


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2011

save "${...}/2011.dta", replace



*** generating windspeed data for 2012	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_121 windv850_122 windv850_123 windv850_124 ///
			windv850_125 windv850_126 windv850_127 windv850_128 ///
			windv850_129 windv850_130 windv850_131 windv850_132

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_121
gen feb_avgt = windv850_122
gen mar_avgt = windv850_123
gen apr_avgt = windv850_124
gen may_avgt = windv850_125
gen jun_avgt = windv850_126
gen jul_avgt = windv850_127
gen aug_avgt = windv850_128
gen sep_avgt = windv850_129
gen oct_avgt = windv850_130
gen nov_avgt = windv850_131
gen dec_avgt = windv850_132


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2012

save "${...}/2012.dta", replace




*** generating windspeed data for 2013	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_133 windv850_134 windv850_135 windv850_136 ///
			windv850_137 windv850_138 windv850_139 windv850_140 ///
			windv850_141 windv850_142 windv850_143 windv850_144

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_133
gen feb_avgt = windv850_134
gen mar_avgt = windv850_135
gen apr_avgt = windv850_136
gen may_avgt = windv850_137
gen jun_avgt = windv850_138
gen jul_avgt = windv850_139
gen aug_avgt = windv850_140
gen sep_avgt = windv850_141
gen oct_avgt = windv850_142
gen nov_avgt = windv850_143
gen dec_avgt = windv850_144


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2013

save "${...}/2013.dta", replace





*** generating windspeed data for 2014	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_145 windv850_146 windv850_147 windv850_148 ///
			windv850_149 windv850_150 windv850_151 windv850_152 ///
			windv850_153 windv850_154 windv850_155 windv850_156

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_145
gen feb_avgt = windv850_146
gen mar_avgt = windv850_147
gen apr_avgt = windv850_148
gen may_avgt = windv850_149
gen jun_avgt = windv850_150
gen jul_avgt = windv850_151
gen aug_avgt = windv850_152
gen sep_avgt = windv850_153
gen oct_avgt = windv850_154
gen nov_avgt = windv850_155
gen dec_avgt = windv850_156


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2014

save "${...}/2014.dta", replace





*** generating windspeed data for 2015	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_157 windv850_158 windv850_159 windv850_160 ///
			windv850_161 windv850_162 windv850_163 windv850_164 ///
			windv850_165 windv850_166 windv850_167 windv850_168

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_157
gen feb_avgt = windv850_158
gen mar_avgt = windv850_159
gen apr_avgt = windv850_160
gen may_avgt = windv850_161
gen jun_avgt = windv850_162
gen jul_avgt = windv850_163
gen aug_avgt = windv850_164
gen sep_avgt = windv850_165
gen oct_avgt = windv850_166
gen nov_avgt = windv850_167
gen dec_avgt = windv850_168


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2015

save "${...}/2015.dta", replace



*** generating windspeed data for 2016	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_169 windv850_170 windv850_171 windv850_172 ///
			windv850_173 windv850_174 windv850_175 windv850_176 ///
			windv850_177 windv850_178 windv850_179 windv850_180

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_169
gen feb_avgt = windv850_170
gen mar_avgt = windv850_171
gen apr_avgt = windv850_172
gen may_avgt = windv850_173
gen jun_avgt = windv850_174
gen jul_avgt = windv850_175
gen aug_avgt = windv850_176
gen sep_avgt = windv850_177
gen oct_avgt = windv850_178
gen nov_avgt = windv850_179
gen dec_avgt = windv850_180


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2016

save "${...}/2016.dta", replace



*** generating windspeed data for 2017	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_181 windv850_182 windv850_183 windv850_184 ///
			windv850_185 windv850_186 windv850_187 windv850_188 ///
			windv850_189 windv850_190 windv850_191 windv850_192

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_181
gen feb_avgt = windv850_182
gen mar_avgt = windv850_183
gen apr_avgt = windv850_184
gen may_avgt = windv850_185
gen jun_avgt = windv850_186
gen jul_avgt = windv850_187
gen aug_avgt = windv850_188
gen sep_avgt = windv850_189
gen oct_avgt = windv850_190
gen nov_avgt = windv850_191
gen dec_avgt = windv850_192


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2017

save "${...}/2017.dta", replace




*** generating windspeed data for 2018	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_193 windv850_194 windv850_195 windv850_196 ///
			windv850_197 windv850_198 windv850_199 windv850_200 ///
			windv850_201 windv850_202 windv850_203 windv850_204

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_193
gen feb_avgt = windv850_194
gen mar_avgt = windv850_195
gen apr_avgt = windv850_196
gen may_avgt = windv850_197
gen jun_avgt = windv850_198
gen jul_avgt = windv850_199
gen aug_avgt = windv850_200
gen sep_avgt = windv850_201
gen oct_avgt = windv850_202
gen nov_avgt = windv850_203
gen dec_avgt = windv850_204


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2018

save "${...}/2018.dta", replace




*** generating windspeed data for 2019	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_205 windv850_206 windv850_207 windv850_208 ///
			windv850_209 windv850_210 windv850_211 windv850_212 ///
			windv850_213 windv850_214 windv850_215 windv850_216

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_205
gen feb_avgt = windv850_206
gen mar_avgt = windv850_207
gen apr_avgt = windv850_208
gen may_avgt = windv850_209
gen jun_avgt = windv850_210
gen jul_avgt = windv850_211
gen aug_avgt = windv850_212
gen sep_avgt = windv850_213
gen oct_avgt = windv850_214
gen nov_avgt = windv850_215
gen dec_avgt = windv850_216


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2019

save "${...}/2019.dta", replace




*** generating windspeed data for 2020	***
clear
set maxvar 10000

use "${...}/windv_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windv850_217 windv850_218 windv850_219 windv850_220 ///
			windv850_221 windv850_222 windv850_223 windv850_224 ///
			windv850_225 windv850_226 windv850_227 windv850_228

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windv850_217
gen feb_avgt = windv850_218
gen mar_avgt = windv850_219
gen apr_avgt = windv850_220
gen may_avgt = windv850_221
gen jun_avgt = windv850_222
gen jul_avgt = windv850_223
gen aug_avgt = windv850_224
gen sep_avgt = windv850_225
gen oct_avgt = windv850_226
gen nov_avgt = windv850_227
gen dec_avgt = windv850_228


rename 	ADM2_EN dist_name

foreach var of varlist jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2020

save "${...}/2020.dta", replace


**append the data for all the years					
use "${...}/2002.dta", clear

set more off

foreach num of numlist 2003/2020 {

	append using "${...}/`num'.dta"
	}
	
save "${...}/pakwindv850_final.dta", replace


