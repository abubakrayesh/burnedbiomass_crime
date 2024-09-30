****	This do file creates the final rainfall dataset							****


*** generating monthly precipitation data for 2002	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_25 precip_month_26 precip_month_27 precip_month_28 ///
			precip_month_29 precip_month_30 precip_month_31 precip_month_32 ///
			precip_month_33 precip_month_34 precip_month_35 precip_month_36

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = precip_month_25
gen feb_avgt = precip_month_26
gen mar_avgt = precip_month_27
gen apr_avgt = precip_month_28
gen may_avgt = precip_month_29
gen jun_avgt = precip_month_30
gen jul_avgt = precip_month_31
gen aug_avgt = precip_month_32
gen sep_avgt = precip_month_33
gen oct_avgt = precip_month_34
gen nov_avgt = precip_month_35
gen dec_avgt = precip_month_36

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




*** generating monthly precipitation data for 2003	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_37 precip_month_38 precip_month_39 precip_month_40 ///
			precip_month_41 precip_month_42 precip_month_43 precip_month_44 ///
			precip_month_45 precip_month_46 precip_month_47 precip_month_48

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_37
gen feb_avgt = precip_month_38
gen mar_avgt = precip_month_39
gen apr_avgt = precip_month_40
gen may_avgt = precip_month_41
gen jun_avgt = precip_month_42
gen jul_avgt = precip_month_43
gen aug_avgt = precip_month_44
gen sep_avgt = precip_month_45
gen oct_avgt = precip_month_46
gen nov_avgt = precip_month_47
gen dec_avgt = precip_month_48

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


*** generating monthly precipitation data for 2004	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_49 precip_month_50 precip_month_51 precip_month_52 ///
			precip_month_53 precip_month_54 precip_month_55 precip_month_56 ///
			precip_month_57 precip_month_58 precip_month_59 precip_month_60

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = precip_month_49
gen feb_avgt = precip_month_50
gen mar_avgt = precip_month_51
gen apr_avgt = precip_month_52
gen may_avgt = precip_month_53
gen jun_avgt = precip_month_54
gen jul_avgt = precip_month_55
gen aug_avgt = precip_month_56
gen sep_avgt = precip_month_57
gen oct_avgt = precip_month_58
gen nov_avgt = precip_month_59
gen dec_avgt = precip_month_60

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



*** generating monthly precipitation data for 2005	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_61 precip_month_62 precip_month_63 precip_month_64 ///
			precip_month_65 precip_month_66 precip_month_67 precip_month_68 ///
			precip_month_69 precip_month_70 precip_month_71 precip_month_72

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = precip_month_61
gen feb_avgt = precip_month_62
gen mar_avgt = precip_month_63
gen apr_avgt = precip_month_64
gen may_avgt = precip_month_65
gen jun_avgt = precip_month_66
gen jul_avgt = precip_month_67
gen aug_avgt = precip_month_68
gen sep_avgt = precip_month_69
gen oct_avgt = precip_month_70
gen nov_avgt = precip_month_71
gen dec_avgt = precip_month_72

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




*** generating monthly precipitation data for 2006	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_73 precip_month_74 precip_month_75 precip_month_76 ///
			precip_month_77 precip_month_78 precip_month_79 precip_month_80 ///
			precip_month_81 precip_month_82 precip_month_83 precip_month_84

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_73
gen feb_avgt = precip_month_74
gen mar_avgt = precip_month_75
gen apr_avgt = precip_month_76
gen may_avgt = precip_month_77
gen jun_avgt = precip_month_78
gen jul_avgt = precip_month_79
gen aug_avgt = precip_month_80
gen sep_avgt = precip_month_81
gen oct_avgt = precip_month_82
gen nov_avgt = precip_month_83
gen dec_avgt = precip_month_84

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




*** generating monthly precipitation data for 2007	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_85 precip_month_86 precip_month_87 precip_month_88 ///
			precip_month_89 precip_month_90 precip_month_91 precip_month_92 ///
			precip_month_93 precip_month_94 precip_month_95 precip_month_96

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = precip_month_85
gen feb_avgt = precip_month_86
gen mar_avgt = precip_month_87
gen apr_avgt = precip_month_88
gen may_avgt = precip_month_89
gen jun_avgt = precip_month_90
gen jul_avgt = precip_month_91
gen aug_avgt = precip_month_92
gen sep_avgt = precip_month_93
gen oct_avgt = precip_month_94
gen nov_avgt = precip_month_95
gen dec_avgt = precip_month_96

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




*** generating monthly precipitation data for 2008	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_97 precip_month_98 precip_month_99 precip_month_100 ///
			precip_month_101 precip_month_102 precip_month_103 precip_month_104 ///
			precip_month_105 precip_month_106 precip_month_107 precip_month_108

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_97
gen feb_avgt = precip_month_98
gen mar_avgt = precip_month_99
gen apr_avgt = precip_month_100
gen may_avgt = precip_month_101
gen jun_avgt = precip_month_102
gen jul_avgt = precip_month_103
gen aug_avgt = precip_month_104
gen sep_avgt = precip_month_105
gen oct_avgt = precip_month_106
gen nov_avgt = precip_month_107
gen dec_avgt = precip_month_108


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




*** generating monthly precipitation data for 2009	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_109 precip_month_110 precip_month_111 precip_month_112 ///
			precip_month_113 precip_month_114 precip_month_115 precip_month_116 ///
			precip_month_117 precip_month_118 precip_month_119 precip_month_120

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = precip_month_109
gen feb_avgt = precip_month_110
gen mar_avgt = precip_month_111
gen apr_avgt = precip_month_112
gen may_avgt = precip_month_113
gen jun_avgt = precip_month_114
gen jul_avgt = precip_month_115
gen aug_avgt = precip_month_116
gen sep_avgt = precip_month_117
gen oct_avgt = precip_month_118
gen nov_avgt = precip_month_119
gen dec_avgt = precip_month_120

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



*** generating monthly precipitation data for 2010	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_121 precip_month_122 precip_month_123 precip_month_124 ///
			precip_month_125 precip_month_126 precip_month_127 precip_month_128 ///
			precip_month_129 precip_month_130 precip_month_131 precip_month_132

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_121
gen feb_avgt = precip_month_122
gen mar_avgt = precip_month_123
gen apr_avgt = precip_month_124
gen may_avgt = precip_month_125
gen jun_avgt = precip_month_126
gen jul_avgt = precip_month_127
gen aug_avgt = precip_month_128
gen sep_avgt = precip_month_129
gen oct_avgt = precip_month_130
gen nov_avgt = precip_month_131
gen dec_avgt = precip_month_132

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




*** generating monthly precipitation data for 2011	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_133 precip_month_134 precip_month_135 precip_month_136 ///
			precip_month_137 precip_month_138 precip_month_139 precip_month_140 ///
			precip_month_141 precip_month_142 precip_month_143 precip_month_144

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_133
gen feb_avgt = precip_month_134
gen mar_avgt = precip_month_135
gen apr_avgt = precip_month_136
gen may_avgt = precip_month_137
gen jun_avgt = precip_month_138
gen jul_avgt = precip_month_139
gen aug_avgt = precip_month_140
gen sep_avgt = precip_month_141
gen oct_avgt = precip_month_142
gen nov_avgt = precip_month_143
gen dec_avgt = precip_month_144

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





*** generating monthly precipitation data for 2012	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_145 precip_month_146 precip_month_147 precip_month_148 ///
			precip_month_149 precip_month_150 precip_month_151 precip_month_152 ///
			precip_month_153 precip_month_154 precip_month_155 precip_month_156

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = precip_month_145
gen feb_avgt = precip_month_146
gen mar_avgt = precip_month_147
gen apr_avgt = precip_month_148
gen may_avgt = precip_month_149
gen jun_avgt = precip_month_150
gen jul_avgt = precip_month_151
gen aug_avgt = precip_month_152
gen sep_avgt = precip_month_153
gen oct_avgt = precip_month_154
gen nov_avgt = precip_month_155
gen dec_avgt = precip_month_156

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





*** generating monthly precipitation data for 2013	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_157 precip_month_158 precip_month_159 precip_month_160 ///
			precip_month_161 precip_month_162 precip_month_163 precip_month_164 ///
			precip_month_165 precip_month_166 precip_month_167 precip_month_168

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_157
gen feb_avgt = precip_month_158
gen mar_avgt = precip_month_159
gen apr_avgt = precip_month_160
gen may_avgt = precip_month_161
gen jun_avgt = precip_month_162
gen jul_avgt = precip_month_163
gen aug_avgt = precip_month_164
gen sep_avgt = precip_month_165
gen oct_avgt = precip_month_166
gen nov_avgt = precip_month_167
gen dec_avgt = precip_month_168

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



*** generating monthly precipitation data for 2014	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_169 precip_month_170 precip_month_171 precip_month_172 ///
			precip_month_173 precip_month_174 precip_month_175 precip_month_176 ///
			precip_month_177 precip_month_178 precip_month_179 precip_month_180

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)





gen jan_avgt = precip_month_169
gen feb_avgt = precip_month_170
gen mar_avgt = precip_month_171
gen apr_avgt = precip_month_172
gen may_avgt = precip_month_173
gen jun_avgt = precip_month_174
gen jul_avgt = precip_month_175
gen aug_avgt = precip_month_176
gen sep_avgt = precip_month_177
gen oct_avgt = precip_month_178
gen nov_avgt = precip_month_179
gen dec_avgt = precip_month_180

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



*** generating monthly precipitation data for 2015	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_181 precip_month_182 precip_month_183 precip_month_184 ///
			precip_month_185 precip_month_186 precip_month_187 precip_month_188 ///
			precip_month_189 precip_month_190 precip_month_191 precip_month_192

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_181
gen feb_avgt = precip_month_182
gen mar_avgt = precip_month_183
gen apr_avgt = precip_month_184
gen may_avgt = precip_month_185
gen jun_avgt = precip_month_186
gen jul_avgt = precip_month_187
gen aug_avgt = precip_month_188
gen sep_avgt = precip_month_189
gen oct_avgt = precip_month_190
gen nov_avgt = precip_month_191
gen dec_avgt = precip_month_192

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




*** generating monthly precipitation data for 2016	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_193 precip_month_194 precip_month_195 precip_month_196 ///
			precip_month_197 precip_month_198 precip_month_199 precip_month_200 ///
			precip_month_201 precip_month_202 precip_month_203 precip_month_204

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_193
gen feb_avgt = precip_month_194
gen mar_avgt = precip_month_195
gen apr_avgt = precip_month_196
gen may_avgt = precip_month_197
gen jun_avgt = precip_month_198
gen jul_avgt = precip_month_199
gen aug_avgt = precip_month_200
gen sep_avgt = precip_month_201
gen oct_avgt = precip_month_202
gen nov_avgt = precip_month_203
gen dec_avgt = precip_month_204


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




*** generating monthly precipitation data for 2017	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_205 precip_month_206 precip_month_207 precip_month_208 ///
			precip_month_209 precip_month_210 precip_month_211 precip_month_212 ///
			precip_month_213 precip_month_214 precip_month_215 precip_month_216

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)



gen jan_avgt = precip_month_205
gen feb_avgt = precip_month_206
gen mar_avgt = precip_month_207
gen apr_avgt = precip_month_208
gen may_avgt = precip_month_209
gen jun_avgt = precip_month_210
gen jul_avgt = precip_month_211
gen aug_avgt = precip_month_212
gen sep_avgt = precip_month_213
gen oct_avgt = precip_month_214
gen nov_avgt = precip_month_215
gen dec_avgt = precip_month_216


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




*** generating monthly precipitation data for 2018	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_217 precip_month_218 precip_month_219 precip_month_220 ///
			precip_month_221 precip_month_222 precip_month_223 precip_month_224 ///
			precip_month_225 precip_month_226 precip_month_227 precip_month_228

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_217
gen feb_avgt = precip_month_218
gen mar_avgt = precip_month_219
gen apr_avgt = precip_month_220
gen may_avgt = precip_month_221
gen jun_avgt = precip_month_222
gen jul_avgt = precip_month_223
gen aug_avgt = precip_month_224
gen sep_avgt = precip_month_225
gen oct_avgt = precip_month_226
gen nov_avgt = precip_month_227
gen dec_avgt = precip_month_228


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




*** generating monthly precipitation data for 2019	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_229 precip_month_230 precip_month_231 precip_month_232 ///
			precip_month_233 precip_month_234 precip_month_235 precip_month_236 ///
			precip_month_237 precip_month_238 precip_month_239 precip_month_240

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)




gen jan_avgt = precip_month_229
gen feb_avgt = precip_month_230
gen mar_avgt = precip_month_231
gen apr_avgt = precip_month_232
gen may_avgt = precip_month_233
gen jun_avgt = precip_month_234
gen jul_avgt = precip_month_235
gen aug_avgt = precip_month_236
gen sep_avgt = precip_month_237
gen oct_avgt = precip_month_238
gen nov_avgt = precip_month_239
gen dec_avgt = precip_month_240


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




*** generating monthly precipitation data for 2020	***
clear
set maxvar 10000

use "${...}/precip_m.dta", clear
set more off

keep 		ADM2_EN ADM2_PCODE ADM1_EN ADM1_PCODE ///
			precip_month_241 precip_month_242 precip_month_243 precip_month_244 ///
			precip_month_245 precip_month_246 precip_month_247 precip_month_248 ///
			precip_month_249 precip_month_250 precip_month_251 precip_month_252

keep if 	ADM1_PCODE=="PK6"
encode 		ADM2_PCODE, gen(dist_id)


gen jan_avgt = precip_month_241
gen feb_avgt = precip_month_242
gen mar_avgt = precip_month_243
gen apr_avgt = precip_month_244
gen may_avgt = precip_month_245
gen jun_avgt = precip_month_246
gen jul_avgt = precip_month_247
gen aug_avgt = precip_month_248
gen sep_avgt = precip_month_249
gen oct_avgt = precip_month_250
gen nov_avgt = precip_month_251
gen dec_avgt = precip_month_252


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
	
save "${...}/pakprecipm_final.dta", replace
