****	This do file creates the various windspeed u at 850hPa				****

*** generating windspeed data for 2002	***
clear
set maxvar 10000

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_1 windu850_2 windu850_3 windu850_4 ///
			windu850_5 windu850_6 windu850_7 windu850_8 ///
			windu850_9 windu850_10 windu850_11 windu850_12

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)






gen jan_avgt = windu850_1
gen feb_avgt = windu850_2
gen mar_avgt = windu850_3
gen apr_avgt = windu850_4
gen may_avgt = windu850_5
gen jun_avgt = windu850_6
gen jul_avgt = windu850_7
gen aug_avgt = windu850_8
gen sep_avgt = windu850_9
gen oct_avgt = windu850_10
gen nov_avgt = windu850_11
gen dec_avgt = windu850_12


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_13 windu850_14 windu850_15 windu850_16 ///
			windu850_17 windu850_18 windu850_19 windu850_20 ///
			windu850_21 windu850_22 windu850_23 windu850_24

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_13
gen feb_avgt = windu850_14
gen mar_avgt = windu850_15
gen apr_avgt = windu850_16
gen may_avgt = windu850_17
gen jun_avgt = windu850_18
gen jul_avgt = windu850_19
gen aug_avgt = windu850_20
gen sep_avgt = windu850_21
gen oct_avgt = windu850_22
gen nov_avgt = windu850_23
gen dec_avgt = windu850_24


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_25 windu850_26 windu850_27 windu850_28 ///
			windu850_29 windu850_30 windu850_31 windu850_32 ///
			windu850_33 windu850_34 windu850_35 windu850_36

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_25
gen feb_avgt = windu850_26
gen mar_avgt = windu850_27
gen apr_avgt = windu850_28
gen may_avgt = windu850_29
gen jun_avgt = windu850_30
gen jul_avgt = windu850_31
gen aug_avgt = windu850_32
gen sep_avgt = windu850_33
gen oct_avgt = windu850_34
gen nov_avgt = windu850_35
gen dec_avgt = windu850_36


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_37 windu850_38 windu850_39 windu850_40 ///
			windu850_41 windu850_42 windu850_43 windu850_44 ///
			windu850_45 windu850_46 windu850_47 windu850_48

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_37
gen feb_avgt = windu850_38
gen mar_avgt = windu850_39
gen apr_avgt = windu850_40
gen may_avgt = windu850_41
gen jun_avgt = windu850_42
gen jul_avgt = windu850_43
gen aug_avgt = windu850_44
gen sep_avgt = windu850_45
gen oct_avgt = windu850_46
gen nov_avgt = windu850_47
gen dec_avgt = windu850_48


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_49 windu850_50 windu850_51 windu850_52 ///
			windu850_53 windu850_54 windu850_55 windu850_56 ///
			windu850_57 windu850_58 windu850_59 windu850_60

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_49
gen feb_avgt = windu850_50
gen mar_avgt = windu850_51
gen apr_avgt = windu850_52
gen may_avgt = windu850_53
gen jun_avgt = windu850_54
gen jul_avgt = windu850_55
gen aug_avgt = windu850_56
gen sep_avgt = windu850_57
gen oct_avgt = windu850_58
gen nov_avgt = windu850_59
gen dec_avgt = windu850_60


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_61 windu850_62 windu850_63 windu850_64 ///
			windu850_65 windu850_66 windu850_67 windu850_68 ///
			windu850_69 windu850_70 windu850_71 windu850_72

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_61
gen feb_avgt = windu850_62
gen mar_avgt = windu850_63
gen apr_avgt = windu850_64
gen may_avgt = windu850_65
gen jun_avgt = windu850_66
gen jul_avgt = windu850_67
gen aug_avgt = windu850_68
gen sep_avgt = windu850_69
gen oct_avgt = windu850_70
gen nov_avgt = windu850_71
gen dec_avgt = windu850_72


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_73 windu850_74 windu850_75 windu850_76 ///
			windu850_77 windu850_78 windu850_79 windu850_80 ///
			windu850_81 windu850_82 windu850_83 windu850_84

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_73
gen feb_avgt = windu850_74
gen mar_avgt = windu850_75
gen apr_avgt = windu850_76
gen may_avgt = windu850_77
gen jun_avgt = windu850_78
gen jul_avgt = windu850_79
gen aug_avgt = windu850_80
gen sep_avgt = windu850_81
gen oct_avgt = windu850_82
gen nov_avgt = windu850_83
gen dec_avgt = windu850_84


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_85 windu850_86 windu850_87 windu850_88 ///
			windu850_89 windu850_90 windu850_91 windu850_92 ///
			windu850_93 windu850_94 windu850_95 windu850_96

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_85
gen feb_avgt = windu850_86
gen mar_avgt = windu850_87
gen apr_avgt = windu850_88
gen may_avgt = windu850_89
gen jun_avgt = windu850_90
gen jul_avgt = windu850_91
gen aug_avgt = windu850_92
gen sep_avgt = windu850_93
gen oct_avgt = windu850_94
gen nov_avgt = windu850_95
gen dec_avgt = windu850_96


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_97 windu850_98 windu850_99 windu850_100 ///
			windu850_101 windu850_102 windu850_103 windu850_104 ///
			windu850_105 windu850_106 windu850_107 windu850_108

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_97
gen feb_avgt = windu850_98
gen mar_avgt = windu850_99
gen apr_avgt = windu850_100
gen may_avgt = windu850_101
gen jun_avgt = windu850_102
gen jul_avgt = windu850_103
gen aug_avgt = windu850_104
gen sep_avgt = windu850_105
gen oct_avgt = windu850_106
gen nov_avgt = windu850_107
gen dec_avgt = windu850_108


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_109 windu850_110 windu850_111 windu850_112 ///
			windu850_113 windu850_114 windu850_115 windu850_116 ///
			windu850_117 windu850_118 windu850_119 windu850_120

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_109
gen feb_avgt = windu850_110
gen mar_avgt = windu850_111
gen apr_avgt = windu850_112
gen may_avgt = windu850_113
gen jun_avgt = windu850_114
gen jul_avgt = windu850_115
gen aug_avgt = windu850_116
gen sep_avgt = windu850_117
gen oct_avgt = windu850_118
gen nov_avgt = windu850_119
gen dec_avgt = windu850_120


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_121 windu850_122 windu850_123 windu850_124 ///
			windu850_125 windu850_126 windu850_127 windu850_128 ///
			windu850_129 windu850_130 windu850_131 windu850_132

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_121
gen feb_avgt = windu850_122
gen mar_avgt = windu850_123
gen apr_avgt = windu850_124
gen may_avgt = windu850_125
gen jun_avgt = windu850_126
gen jul_avgt = windu850_127
gen aug_avgt = windu850_128
gen sep_avgt = windu850_129
gen oct_avgt = windu850_130
gen nov_avgt = windu850_131
gen dec_avgt = windu850_132


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_133 windu850_134 windu850_135 windu850_136 ///
			windu850_137 windu850_138 windu850_139 windu850_140 ///
			windu850_141 windu850_142 windu850_143 windu850_144

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_133
gen feb_avgt = windu850_134
gen mar_avgt = windu850_135
gen apr_avgt = windu850_136
gen may_avgt = windu850_137
gen jun_avgt = windu850_138
gen jul_avgt = windu850_139
gen aug_avgt = windu850_140
gen sep_avgt = windu850_141
gen oct_avgt = windu850_142
gen nov_avgt = windu850_143
gen dec_avgt = windu850_144


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_145 windu850_146 windu850_147 windu850_148 ///
			windu850_149 windu850_150 windu850_151 windu850_152 ///
			windu850_153 windu850_154 windu850_155 windu850_156

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_145
gen feb_avgt = windu850_146
gen mar_avgt = windu850_147
gen apr_avgt = windu850_148
gen may_avgt = windu850_149
gen jun_avgt = windu850_150
gen jul_avgt = windu850_151
gen aug_avgt = windu850_152
gen sep_avgt = windu850_153
gen oct_avgt = windu850_154
gen nov_avgt = windu850_155
gen dec_avgt = windu850_156


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_157 windu850_158 windu850_159 windu850_160 ///
			windu850_161 windu850_162 windu850_163 windu850_164 ///
			windu850_165 windu850_166 windu850_167 windu850_168

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_157
gen feb_avgt = windu850_158
gen mar_avgt = windu850_159
gen apr_avgt = windu850_160
gen may_avgt = windu850_161
gen jun_avgt = windu850_162
gen jul_avgt = windu850_163
gen aug_avgt = windu850_164
gen sep_avgt = windu850_165
gen oct_avgt = windu850_166
gen nov_avgt = windu850_167
gen dec_avgt = windu850_168


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_169 windu850_170 windu850_171 windu850_172 ///
			windu850_173 windu850_174 windu850_175 windu850_176 ///
			windu850_177 windu850_178 windu850_179 windu850_180

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_169
gen feb_avgt = windu850_170
gen mar_avgt = windu850_171
gen apr_avgt = windu850_172
gen may_avgt = windu850_173
gen jun_avgt = windu850_174
gen jul_avgt = windu850_175
gen aug_avgt = windu850_176
gen sep_avgt = windu850_177
gen oct_avgt = windu850_178
gen nov_avgt = windu850_179
gen dec_avgt = windu850_180


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_181 windu850_182 windu850_183 windu850_184 ///
			windu850_185 windu850_186 windu850_187 windu850_188 ///
			windu850_189 windu850_190 windu850_191 windu850_192

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_181
gen feb_avgt = windu850_182
gen mar_avgt = windu850_183
gen apr_avgt = windu850_184
gen may_avgt = windu850_185
gen jun_avgt = windu850_186
gen jul_avgt = windu850_187
gen aug_avgt = windu850_188
gen sep_avgt = windu850_189
gen oct_avgt = windu850_190
gen nov_avgt = windu850_191
gen dec_avgt = windu850_192


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_193 windu850_194 windu850_195 windu850_196 ///
			windu850_197 windu850_198 windu850_199 windu850_200 ///
			windu850_201 windu850_202 windu850_203 windu850_204

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_193
gen feb_avgt = windu850_194
gen mar_avgt = windu850_195
gen apr_avgt = windu850_196
gen may_avgt = windu850_197
gen jun_avgt = windu850_198
gen jul_avgt = windu850_199
gen aug_avgt = windu850_200
gen sep_avgt = windu850_201
gen oct_avgt = windu850_202
gen nov_avgt = windu850_203
gen dec_avgt = windu850_204


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_205 windu850_206 windu850_207 windu850_208 ///
			windu850_209 windu850_210 windu850_211 windu850_212 ///
			windu850_213 windu850_214 windu850_215 windu850_216

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_205
gen feb_avgt = windu850_206
gen mar_avgt = windu850_207
gen apr_avgt = windu850_208
gen may_avgt = windu850_209
gen jun_avgt = windu850_210
gen jul_avgt = windu850_211
gen aug_avgt = windu850_212
gen sep_avgt = windu850_213
gen oct_avgt = windu850_214
gen nov_avgt = windu850_215
gen dec_avgt = windu850_216


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

use "${...}/windu_850.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			windu850_217 windu850_218 windu850_219 windu850_220 ///
			windu850_221 windu850_222 windu850_223 windu850_224 ///
			windu850_225 windu850_226 windu850_227 windu850_228

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)









gen jan_avgt = windu850_217
gen feb_avgt = windu850_218
gen mar_avgt = windu850_219
gen apr_avgt = windu850_220
gen may_avgt = windu850_221
gen jun_avgt = windu850_222
gen jul_avgt = windu850_223
gen aug_avgt = windu850_224
gen sep_avgt = windu850_225
gen oct_avgt = windu850_226
gen nov_avgt = windu850_227
gen dec_avgt = windu850_228


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
	
save "${...}/pakwindu850_final.dta", replace


