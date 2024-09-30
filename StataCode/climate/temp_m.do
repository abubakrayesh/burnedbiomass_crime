****	This do file creates the final temperature dataset						****


*** The pixel size is same for each district for each year, so no need to find average for each observation first	***




*** generating monthly tempitation data for 2002	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_25 temp_month_26 temp_month_27 temp_month_28 ///
			temp_month_29 temp_month_30 temp_month_31 temp_month_32 ///
			temp_month_33 temp_month_34 temp_month_35 temp_month_36

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = temp_month_25
gen feb_avgt = temp_month_26
gen mar_avgt = temp_month_27
gen apr_avgt = temp_month_28
gen may_avgt = temp_month_29
gen jun_avgt = temp_month_30
gen jul_avgt = temp_month_31
gen aug_avgt = temp_month_32
gen sep_avgt = temp_month_33
gen oct_avgt = temp_month_34
gen nov_avgt = temp_month_35
gen dec_avgt = temp_month_36

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




*** generating monthly tempitation data for 2003	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_37 temp_month_38 temp_month_39 temp_month_40 ///
			temp_month_41 temp_month_42 temp_month_43 temp_month_44 ///
			temp_month_45 temp_month_46 temp_month_47 temp_month_48

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_37
gen feb_avgt = temp_month_38
gen mar_avgt = temp_month_39
gen apr_avgt = temp_month_40
gen may_avgt = temp_month_41
gen jun_avgt = temp_month_42
gen jul_avgt = temp_month_43
gen aug_avgt = temp_month_44
gen sep_avgt = temp_month_45
gen oct_avgt = temp_month_46
gen nov_avgt = temp_month_47
gen dec_avgt = temp_month_48

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2003

save "${...}/2003.dta", replace


*** generating monthly tempitation data for 2004	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_49 temp_month_50 temp_month_51 temp_month_52 ///
			temp_month_53 temp_month_54 temp_month_55 temp_month_56 ///
			temp_month_57 temp_month_58 temp_month_59 temp_month_60

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = temp_month_49
gen feb_avgt = temp_month_50
gen mar_avgt = temp_month_51
gen apr_avgt = temp_month_52
gen may_avgt = temp_month_53
gen jun_avgt = temp_month_54
gen jul_avgt = temp_month_55
gen aug_avgt = temp_month_56
gen sep_avgt = temp_month_57
gen oct_avgt = temp_month_58
gen nov_avgt = temp_month_59
gen dec_avgt = temp_month_60

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2004

save "${...}/2004.dta", replace



*** generating monthly tempitation data for 2005	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_61 temp_month_62 temp_month_63 temp_month_64 ///
			temp_month_65 temp_month_66 temp_month_67 temp_month_68 ///
			temp_month_69 temp_month_70 temp_month_71 temp_month_72

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = temp_month_61
gen feb_avgt = temp_month_62
gen mar_avgt = temp_month_63
gen apr_avgt = temp_month_64
gen may_avgt = temp_month_65
gen jun_avgt = temp_month_66
gen jul_avgt = temp_month_67
gen aug_avgt = temp_month_68
gen sep_avgt = temp_month_69
gen oct_avgt = temp_month_70
gen nov_avgt = temp_month_71
gen dec_avgt = temp_month_72

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2005

save "${...}/2005.dta", replace




*** generating monthly tempitation data for 2006	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_73 temp_month_74 temp_month_75 temp_month_76 ///
			temp_month_77 temp_month_78 temp_month_79 temp_month_80 ///
			temp_month_81 temp_month_82 temp_month_83 temp_month_84

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_73
gen feb_avgt = temp_month_74
gen mar_avgt = temp_month_75
gen apr_avgt = temp_month_76
gen may_avgt = temp_month_77
gen jun_avgt = temp_month_78
gen jul_avgt = temp_month_79
gen aug_avgt = temp_month_80
gen sep_avgt = temp_month_81
gen oct_avgt = temp_month_82
gen nov_avgt = temp_month_83
gen dec_avgt = temp_month_84

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2006

save "${...}/2006.dta", replace




*** generating monthly tempitation data for 2007	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_85 temp_month_86 temp_month_87 temp_month_88 ///
			temp_month_89 temp_month_90 temp_month_91 temp_month_92 ///
			temp_month_93 temp_month_94 temp_month_95 temp_month_96

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = temp_month_85
gen feb_avgt = temp_month_86
gen mar_avgt = temp_month_87
gen apr_avgt = temp_month_88
gen may_avgt = temp_month_89
gen jun_avgt = temp_month_90
gen jul_avgt = temp_month_91
gen aug_avgt = temp_month_92
gen sep_avgt = temp_month_93
gen oct_avgt = temp_month_94
gen nov_avgt = temp_month_95
gen dec_avgt = temp_month_96

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2007

save "${...}/2007.dta", replace




*** generating monthly tempitation data for 2008	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_97 temp_month_98 temp_month_99 temp_month_100 ///
			temp_month_101 temp_month_102 temp_month_103 temp_month_104 ///
			temp_month_105 temp_month_106 temp_month_107 temp_month_108

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_97
gen feb_avgt = temp_month_98
gen mar_avgt = temp_month_99
gen apr_avgt = temp_month_100
gen may_avgt = temp_month_101
gen jun_avgt = temp_month_102
gen jul_avgt = temp_month_103
gen aug_avgt = temp_month_104
gen sep_avgt = temp_month_105
gen oct_avgt = temp_month_106
gen nov_avgt = temp_month_107
gen dec_avgt = temp_month_108


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2008

save "${...}/2008.dta", replace




*** generating monthly tempitation data for 2009	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_109 temp_month_110 temp_month_111 temp_month_112 ///
			temp_month_113 temp_month_114 temp_month_115 temp_month_116 ///
			temp_month_117 temp_month_118 temp_month_119 temp_month_120

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = temp_month_109
gen feb_avgt = temp_month_110
gen mar_avgt = temp_month_111
gen apr_avgt = temp_month_112
gen may_avgt = temp_month_113
gen jun_avgt = temp_month_114
gen jul_avgt = temp_month_115
gen aug_avgt = temp_month_116
gen sep_avgt = temp_month_117
gen oct_avgt = temp_month_118
gen nov_avgt = temp_month_119
gen dec_avgt = temp_month_120

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2009

save "${...}/2009.dta", replace



*** generating monthly tempitation data for 2010	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_121 temp_month_122 temp_month_123 temp_month_124 ///
			temp_month_125 temp_month_126 temp_month_127 temp_month_128 ///
			temp_month_129 temp_month_130 temp_month_131 temp_month_132

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_121
gen feb_avgt = temp_month_122
gen mar_avgt = temp_month_123
gen apr_avgt = temp_month_124
gen may_avgt = temp_month_125
gen jun_avgt = temp_month_126
gen jul_avgt = temp_month_127
gen aug_avgt = temp_month_128
gen sep_avgt = temp_month_129
gen oct_avgt = temp_month_130
gen nov_avgt = temp_month_131
gen dec_avgt = temp_month_132

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2010

save "${...}/2010.dta", replace




*** generating monthly tempitation data for 2011	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_133 temp_month_134 temp_month_135 temp_month_136 ///
			temp_month_137 temp_month_138 temp_month_139 temp_month_140 ///
			temp_month_141 temp_month_142 temp_month_143 temp_month_144

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_133
gen feb_avgt = temp_month_134
gen mar_avgt = temp_month_135
gen apr_avgt = temp_month_136
gen may_avgt = temp_month_137
gen jun_avgt = temp_month_138
gen jul_avgt = temp_month_139
gen aug_avgt = temp_month_140
gen sep_avgt = temp_month_141
gen oct_avgt = temp_month_142
gen nov_avgt = temp_month_143
gen dec_avgt = temp_month_144

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2011

save "${...}/2011.dta", replace





*** generating monthly tempitation data for 2012	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_145 temp_month_146 temp_month_147 temp_month_148 ///
			temp_month_149 temp_month_150 temp_month_151 temp_month_152 ///
			temp_month_153 temp_month_154 temp_month_155 temp_month_156

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = temp_month_145
gen feb_avgt = temp_month_146
gen mar_avgt = temp_month_147
gen apr_avgt = temp_month_148
gen may_avgt = temp_month_149
gen jun_avgt = temp_month_150
gen jul_avgt = temp_month_151
gen aug_avgt = temp_month_152
gen sep_avgt = temp_month_153
gen oct_avgt = temp_month_154
gen nov_avgt = temp_month_155
gen dec_avgt = temp_month_156

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2012

save "${...}/2012.dta", replace





*** generating monthly tempitation data for 2013	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_157 temp_month_158 temp_month_159 temp_month_160 ///
			temp_month_161 temp_month_162 temp_month_163 temp_month_164 ///
			temp_month_165 temp_month_166 temp_month_167 temp_month_168

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_157
gen feb_avgt = temp_month_158
gen mar_avgt = temp_month_159
gen apr_avgt = temp_month_160
gen may_avgt = temp_month_161
gen jun_avgt = temp_month_162
gen jul_avgt = temp_month_163
gen aug_avgt = temp_month_164
gen sep_avgt = temp_month_165
gen oct_avgt = temp_month_166
gen nov_avgt = temp_month_167
gen dec_avgt = temp_month_168

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2013

save "${...}/2013.dta", replace



*** generating monthly tempitation data for 2014	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_169 temp_month_170 temp_month_171 temp_month_172 ///
			temp_month_173 temp_month_174 temp_month_175 temp_month_176 ///
			temp_month_177 temp_month_178 temp_month_179 temp_month_180

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = temp_month_169
gen feb_avgt = temp_month_170
gen mar_avgt = temp_month_171
gen apr_avgt = temp_month_172
gen may_avgt = temp_month_173
gen jun_avgt = temp_month_174
gen jul_avgt = temp_month_175
gen aug_avgt = temp_month_176
gen sep_avgt = temp_month_177
gen oct_avgt = temp_month_178
gen nov_avgt = temp_month_179
gen dec_avgt = temp_month_180

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2014

save "${...}/2014.dta", replace



*** generating monthly tempitation data for 2015	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_181 temp_month_182 temp_month_183 temp_month_184 ///
			temp_month_185 temp_month_186 temp_month_187 temp_month_188 ///
			temp_month_189 temp_month_190 temp_month_191 temp_month_192

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_181
gen feb_avgt = temp_month_182
gen mar_avgt = temp_month_183
gen apr_avgt = temp_month_184
gen may_avgt = temp_month_185
gen jun_avgt = temp_month_186
gen jul_avgt = temp_month_187
gen aug_avgt = temp_month_188
gen sep_avgt = temp_month_189
gen oct_avgt = temp_month_190
gen nov_avgt = temp_month_191
gen dec_avgt = temp_month_192

rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2015

save "${...}/2015.dta", replace




*** generating monthly tempitation data for 2016	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_193 temp_month_194 temp_month_195 temp_month_196 ///
			temp_month_197 temp_month_198 temp_month_199 temp_month_200 ///
			temp_month_201 temp_month_202 temp_month_203 temp_month_204

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_193
gen feb_avgt = temp_month_194
gen mar_avgt = temp_month_195
gen apr_avgt = temp_month_196
gen may_avgt = temp_month_197
gen jun_avgt = temp_month_198
gen jul_avgt = temp_month_199
gen aug_avgt = temp_month_200
gen sep_avgt = temp_month_201
gen oct_avgt = temp_month_202
gen nov_avgt = temp_month_203
gen dec_avgt = temp_month_204


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2016

save "${...}/2016.dta", replace




*** generating monthly tempitation data for 2017	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_205 temp_month_206 temp_month_207 temp_month_208 ///
			temp_month_209 temp_month_210 temp_month_211 temp_month_212 ///
			temp_month_213 temp_month_214 temp_month_215 temp_month_216

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = temp_month_205
gen feb_avgt = temp_month_206
gen mar_avgt = temp_month_207
gen apr_avgt = temp_month_208
gen may_avgt = temp_month_209
gen jun_avgt = temp_month_210
gen jul_avgt = temp_month_211
gen aug_avgt = temp_month_212
gen sep_avgt = temp_month_213
gen oct_avgt = temp_month_214
gen nov_avgt = temp_month_215
gen dec_avgt = temp_month_216


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2017

save "${...}/2017.dta", replace




*** generating monthly tempitation data for 2018	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_217 temp_month_218 temp_month_219 temp_month_220 ///
			temp_month_221 temp_month_222 temp_month_223 temp_month_224 ///
			temp_month_225 temp_month_226 temp_month_227 temp_month_228

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_217
gen feb_avgt = temp_month_218
gen mar_avgt = temp_month_219
gen apr_avgt = temp_month_220
gen may_avgt = temp_month_221
gen jun_avgt = temp_month_222
gen jul_avgt = temp_month_223
gen aug_avgt = temp_month_224
gen sep_avgt = temp_month_225
gen oct_avgt = temp_month_226
gen nov_avgt = temp_month_227
gen dec_avgt = temp_month_228


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
}

keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2018

save "${...}/2018.dta", replace




*** generating monthly tempitation data for 2019	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_229 temp_month_230 temp_month_231 temp_month_232 ///
			temp_month_233 temp_month_234 temp_month_235 temp_month_236 ///
			temp_month_237 temp_month_238 temp_month_239 temp_month_240

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = temp_month_229
gen feb_avgt = temp_month_230
gen mar_avgt = temp_month_231
gen apr_avgt = temp_month_232
gen may_avgt = temp_month_233
gen jun_avgt = temp_month_234
gen jul_avgt = temp_month_235
gen aug_avgt = temp_month_236
gen sep_avgt = temp_month_237
gen oct_avgt = temp_month_238
gen nov_avgt = temp_month_239
gen dec_avgt = temp_month_240


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
		jun_avgt jul_avgt aug_avgt sep_avgt oct_avgt nov_avgt dec_avgt	{
	rename `var' d_`var'
	}


keep 	dist* *_avgt

egen d_avgt = rowmean(d_jan_avgt d_feb_avgt d_mar_avgt d_apr_avgt d_may_avgt ///
		d_jun_avgt d_jul_avgt d_aug_avgt d_sep_avgt d_oct_avgt d_nov_avgt d_dec_avgt )
	
gen 	year = 2019

save "${...}/2019.dta", replace




*** generating monthly tempitation data for 2020	***
clear
set maxvar 10000

use "${...}/temp_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			temp_month_241 temp_month_242 temp_month_243 temp_month_244 ///
			temp_month_245 temp_month_246 temp_month_247 temp_month_248 ///
			temp_month_249 temp_month_250 temp_month_251 temp_month_252

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)


gen jan_avgt = temp_month_241
gen feb_avgt = temp_month_242
gen mar_avgt = temp_month_243
gen apr_avgt = temp_month_244
gen may_avgt = temp_month_245
gen jun_avgt = temp_month_246
gen jul_avgt = temp_month_247
gen aug_avgt = temp_month_248
gen sep_avgt = temp_month_249
gen oct_avgt = temp_month_250
gen nov_avgt = temp_month_251
gen dec_avgt = temp_month_252


rename 	ADM2_EN dist_name

foreach var of varlist  jan_avgt feb_avgt mar_avgt apr_avgt may_avgt ///
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
	
save "${...}/paktempm_final.dta", replace
