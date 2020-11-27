#include "ntc.h"

eResult aboveZeroFlag = TRUE;
//	MF52E 10K at 25, B = 3950, ADC = 12 bits9
const uint16_t igbtTempTable[]={
		223 ,	//;-30	0
		236 ,	//;-29	1
		249 ,	//;-28	2
		264 ,	//;-27	3
		278 ,	//;-26	4
		294 ,	//;-25	5
		310 ,	//;-24	6
		327 ,	//;-23	7
		344 ,	//;-22	8
		362 ,	//;-21	9
		381 ,	//;-20	10
		402 ,	//;-19	11
		423 ,	//;-18	12
		445 ,	//;-17	13
		468 ,	//;-16	14
		492 ,	//;-15	15
		517 ,	//;-14	16
		542 ,	//;-13	17
		568 ,	//;-12	18
		595 ,	//;-11	19
		622 ,	//;-10	20
		652 ,	//;-9	21
		682 ,	//;-8	22
		713 ,	//;-7	23
		744 ,	//;-6	24
		777 ,	//;-5	25
		811 ,	//;-4	26
		845 ,	//;-3	27
		880 ,	//;-2	28
		916 ,	//;-1	29
		953 ,	//;0	30
		991 ,	//;1	31
		1030,	//;2	32
		1070,	//;3	33
		1111,	//;4	34
		1152,	//;5	35
		1193,	//;6	36
		1235,	//;7	37
		1277,	//;8	38
		1319,	//;9	39
		1362,	//;10	40
		1407,	//;11	41
		1452,	//;12	42
		1498,	//;13	43
		1544,	//;14	44
		1590,	//;15	45
		1636,	//;16	46
		1682,	//;17	47
		1728,	//;18	48
		1773,	//;19	49
		1819,	//;20	50
		1865,	//;21	51
		1911,	//;22	52
		1957,	//;23	53
		2003,	//;24	54
		2048,	//;25	55
		2092,	//;26	56
		2137,	//;27	57
		2180,	//;28	58
		2224,	//;29	59
		2267,	//;30	60
		2310,	//;31	61
		2352,	//;32	62
		2394,	//;33	63
		2435,	//;34	64
		2476,	//;35	65
		2517,	//;36	66
		2557,	//;37	67
		2597,	//;38	68
		2635,	//;39	69
		2674,	//;40	70
		2711,	//;41	71
		2748,	//;42	72
		2784,	//;43	73
		2819,	//;44	74
		2854,	//;45	75
		2888,	//;46	76
		2921,	//;47	77
		2953,	//;48	78
		2985,	//;49	79
		3015,	//;50	80
		3044,	//;51	81
		3073,	//;52	82
		3100,	//;53	83
		3127,	//;54	84
		3153,	//;55	85
		3180,	//;56	86
		3206,	//;57	87
		3231,	//;58	88
		3256,	//;59	89
		3279,	//;60	90
		3302,	//;61	91
		3325,	//;62	92
		3347,	//;63	93
		3368,	//;64	94
		3388,	//;65	95
		3409,	//;66	96
		3429,	//;67	97
		3449,	//;68	98
		3468,	//;69	99
		3486,	//;70	100
		3504,	//;71	101
		3520,	//;72	102
		3537,	//;73	103
		3552,	//;74	104
		3568,	//;75	105
		3583,	//;76	106
		3597,	//;77	107
		3611,	//;78	108
		3625,	//;79	109
		3638,	//;80	110
		3651,	//;81	111
		3664,	//;82	112
		3676,	//;83	113
		3688,	//;84	114
		3699,	//;85	115
		3711,	//;86	116
		3721,	//;87	117
		3732,	//;88	118
		3742,	//;89	119
		3752,	//;90	120
		3761,	//;91	121
		3770,	//;92	122
		3779,	//;93	123
		3787,	//;94	124
		3796,	//;95	125
		3804,	//;96	126
		3812,	//;97	127
		3820,	//;98	128
		3827,	//;99	129
		3834,	//;100	130
		3840,	//;101	131
		3847,	//;102	132
		3853,	//;103	133
		3859,	//;104	134
		3864,	//;105	135
		3870,	//;106	136
		3876,	//;107	137
		3882,	//;108	138
		3888,	//;109	139
		3893,	//;110	140
		3898,	//;111	141
		3903,	//;112	142
		3908,	//;113	143
		3912,	//;114	144
		3917,	//;115	145
		3921,	//;116	146
		3926,	//;117	147
		3930,	//;118	148
		3934,	//;119	149
		3938,	//;120	150
		3943,	//;121	151
		3947,	//;122	152
		3950,	//;123	153
		3954,	//;124	154
		3958,	//;125	155
		3961,	//;126	156
		3964,	//;127	157
		3967,	//;128	158
		3970,	//;129	159
		3973,	//;130	160		
};

#if 0
const uint16_t coilTempTable[]={
		22 ,	//;-30  0
		23 ,	//;-29  1
		25 ,	//;-28  2
		26 ,	//;-27  3
		28 ,	//;-26  4
		30 ,	//;-25  5
		32 ,	//;-24  6
		34 ,	//;-23  7
		36 ,	//;-22  8
		40 ,	//;-21  9
		43 ,	//;-20  10
		43 ,	//;-19  11
		46 ,	//;-18  12
		48 ,	//;-17  13
		51 ,	//;-16  14
		54 ,	//;-15  15
		57 ,	//;-14  16
		61 ,	//;-13  17
		64 ,	//;-12  18
		68 ,	//;-11  19
		71 ,	//;-10  20
		75 ,	//;-9   21
		80 ,	//;-8   22
		84 ,	//;-7   23
		88 ,	//;-6   24
		93 ,	//;-5   25
		98 ,	//;-4   26
		103 ,	//;-3   27
		109 ,	//;-2   28
		114 ,	//;-1   29
		120 ,	//;0    30
		126 ,	//;1    31
		133 ,	//;2    32
		140 ,	//;3    33
		147 ,	//;4    34
		154 ,	//;5    35
		162 ,	//;6    36
		170 ,	//;7    37
		178 ,	//;8    38
		186 ,	//;9    39
		195 ,	//;10   40
		204 ,	//;11   41
		214 ,	//;12   42
		224 ,	//;13   43
		234 ,	//;14   44
		245 ,	//;15   45
		256 ,	//;16   46
		267 ,	//;17   47
		279 ,	//;18   48
		291 ,	//;19   49
		303 ,	//;20   50
		316 ,	//;21   51
		330 ,	//;22   52
		344 ,	//;23   53
		358 ,	//;24   54
		372 ,	//;25   55
		388 ,	//;26   56
		403 ,	//;27   57
		420 ,	//;28   58
		436 ,	//;29   59
		454 ,	//;30   60
		471 ,	//;31   61
		489 ,	//;32   62
		508 ,	//;33   63
		527 ,	//;34   64
		547 ,	//;35   65
		567 ,	//;36   66
		588 ,	//;37   67
		610 ,	//;38   68
		632 ,	//;39   69
		654 ,	//;40   70
		677 ,	//;41   71
		701 ,	//;42   72
		724 ,	//;43   73
		749 ,	//;44   74
		774 ,	//;45   75
		799 ,	//;46   76
		825 ,	//;47   77
		851 ,	//;48   78
		878 ,	//;49   79
		905 ,	//;50   80
		933 ,	//;51   81
		962 ,	//;52   82
		991 ,	//;53   83
		1021,	//;54   84
		1050,	//;55   85
		1081,	//;56   86
		1111,	//;57   87
		1142,	//;58   88
		1174,	//;59   89
		1206,	//;60   90
		1237,	//;61   91
		1270,	//;62   92
		1302,	//;63   93
		1335,	//;64   94
		1368,	//;65   95
		1401,	//;66   96
		1435,	//;67   97
		1468,	//;68   98
		1502,	//;69   99
		1536,	//;70   100
		1570,	//;71   101
		1604,	//;72   102
		1638,	//;73   103
		1672,	//;74   104
		1706,	//;75   105
		1740,	//;76   106
		1774,	//;77   107
		1808,	//;78   108
		1842,	//;79   109
		1876,	//;80   110
		1910,	//;81   111
		1943,	//;82   112
		1977,	//;83   113
		2010,	//;84   114
		2044,	//;85   115
		2077,	//;86   116
		2111,	//;87   117
		2144,	//;88   118
		2176,	//;89   119
		2209,	//;90   120
		2241,	//;91   121
		2273,	//;92   122
		2304,	//;93   123
		2335,	//;94   124
		2366,	//;95   125
		2397,	//;96   126
		2427,	//;97   127
		2457,	//;98   128
		2486,	//;99   129
		2516,	//;100  130
		2545,	//;101  131
		2574,	//;102  132
		2602,	//;103  133
		2631,	//;104  134
		2659,	//;105  135
		2686,	//;106  136
		2713,	//;107  137
		2740,	//;108  138
		2766,	//;109  139
		2792,	//;110  140
		2817,	//;111  141
		2842,	//;112  142
		2867,	//;113  143
		2891,	//;114  144
		2915,	//;115  145
		2938,	//;116  146
		2961,	//;117  147
		2984,	//;118  148
		3006,	//;119  149
		3028,	//;120  150
		3049,	//;121  151
		3070,	//;122  152
		3090,	//;123  153
		3110,	//;124  154
		3129,	//;125  155
		3149,	//;126  156
		3168,	//;127  157
		3187,	//;128  158
		3205,	//;129  159
		3223,	//;130  160
};
#endif

const uint16_t coilTempTable[]={
	
120 ,   // 	0
126 ,   // 	1
133 ,   // 	2
140 ,   // 	3
147 ,   // 	4
154 ,   // 	5
162 ,   // 	6
170 ,   // 	7
178 ,   // 	8
186 ,   // 	9
195 ,   // 	10
204 ,   // 	11
214 ,   // 	12
224 ,   // 	13
234 ,   // 	14
245 ,   // 	15
256 ,   // 	16
267 ,   // 	17
279 ,   // 	18
291 ,   // 	19
303 ,   // 	20
316 ,   // 	21
330 ,   // 	22
344 ,   // 	23
358 ,   // 	24
372 ,   // 	25
388 ,   // 	26
403 ,   // 	27
420 ,   // 	28
436 ,   // 	29
454 ,   // 	30
471 ,   // 	31
489 ,   // 	32
508 ,   // 	33
527 ,   // 	34
547 ,   // 	35
567 ,   // 	36
588 ,   // 	37
610 ,   // 	38
632 ,   // 	39
654 ,   // 	40
677 ,   // 	41
701 ,   // 	42
724 ,   // 	43
749 ,   // 	44
774 ,   // 	45
799 ,   // 	46
825 ,   // 	47
851 ,   // 	48
878 ,   // 	49
905 ,   // 	50
933 ,   // 	51
962 ,   // 	52
991 ,   // 	53
1021,   // 	54
1050,   // 	55
1081,   // 	56
1111,   // 	57
1142,   // 	58
1174,   // 	59
1206,   // 	60
1237,   // 	61
1270,   // 	62
1302,   // 	63
1335,   // 	64
1368,   // 	65
1401,   // 	66
1435,   // 	67
1468,   // 	68
1502,   // 	69
1536,   // 	70
1570,   // 	71
1604,   // 	72
1638,   // 	73
1672,   // 	74
1706,   // 	75
1740,   // 	76
1774,   // 	77
1808,   // 	78
1842,   // 	79
1876,   // 	80
1910,   // 	81
1943,   // 	82
1977,   // 	83
2010,   // 	84
2044,   // 	85
2077,   // 	86
2111,   // 	87
2144,   // 	88
2176,   // 	89
2209,   // 	90
2241,   // 	91
2273,   // 	92
2304,   // 	93
2335,   // 	94
2366,   // 	95
2397,   // 	96
2427,   // 	97
2457,   // 	98
2486,   // 	99
2516,   // 	100
2545,   // 	101
2574,   // 	102
2602,   // 	103
2631,   // 	104
2659,   // 	105
2686,   // 	106
2713,   // 	107
2740,   // 	108
2766,   // 	109
2792,   // 	110
2817,   // 	111
2842,   // 	112
2867,   // 	113
2891,   // 	114
2915,   // 	115
2938,   // 	116
2961,   // 	117
2984,   // 	118
3006,   // 	119
3028,   // 	120
3049,   // 	121
3070,   // 	122
3090,   // 	123
3110,   //	124
3129,   //	125
3149,   //	126
3168,   //	127
3187,   //	128
3205,   //	129
3223,   //	130
3241,   //	131
3259,   //	132
3276,   //	133
3293,   //	134
3309,   //	135
3326,   //	136
3341,   //	137
3357,   //	138
3372,   //	139
3387,   //	140
3402,   //	141
3416,   //	142
3430,   //	143
3444,   //	144
3457,   //	145
3471,   //	146
3483,   //	147
3496,   //	148
3508,   //	149
3520,   //	150
3532,   //	151
3544,   //	152
3555,   //	153
3566,   //	154
3577,   //	155
3588,   //	156
3598,   //	157
3608,   //	158
3619,   //	159
3628,   //	160
3638,   //	161
3647,   //	162
3656,   //	163
3665,   //	164
3674,   //	165
3682,   //	166
3691,   //	167
3699,   //	168
3707,   //	169
3715,   //	170
3722,   //	171
3730,   //	172
3737,   //	173
3744,   //	174
3751,   //	175
3758,   //	176
3764,   //	177
3771,   //	178
3777,   //	179
3783,   //	180
3789,   //	181
3795,   //	182
3801,   //	183
3807,   //	184
3812,   //	185
3818,   //	186
3823,   //	187
3828,   //	188
3833,   //	189
3838,   //	190
3843,   //	191
3848,   //	192
3853,   //	193
3857,   //	194
3862,   //	195
3866,   //	196
3870,   //	197
3874,   //	198
3878,   //	199
3882,   //	200
3887,   //	201
3890,   //	202
3894,   //	203
3898,   //	204
3901,   //	205
3905,   //	206
3908,   //	207
3912,   //	208
3915,   //	209
3918,   //	210
3921,   //	211
3924,   //	212
3928,   //	213
3931,   //	214
3934,   //	215
3936,   //	216
3939,   //	217
3942,   //	218
3945,   //	219
3947,   //	220
3949,   //	221
3952,   //	222
3955,   //	223
3957,   //	224
3959,   //	225
3962,   //	226
3964,   //	227
3966,   //	228
3968,   //	229
3971,   //	230
3972,   //	231
3975,   //	232
3977,   //	233
3979,   //	234
3981,   //	235
3982,   //	236
3984,   //	237
3986,   //	238
3988,   //	239
3989,   //	240
3991,   //	241
3993,   //	242
3995,   //	243
3996,   //	244
3998,   //	245
4000,   //	246
4001,   //	247
4002,   //	248
4004,   //	249
4005,   //	250
4007,   //	251
4008,   //	252
4009,   //	253
4011,   //	254
4012,   //	255
4013,   //	256
4015,   //	257
4016,   //	258
4017,   //	259
4018,   //	260
4020,   //	261
4021,   //	262
4022,   //	263
4023,   //	264
4024,   //	265
4025,   //	266
4026,   //	267
4027,   //	268
4028,   //	269
4029,   //	270
4030,   //	271
4031,   //	272
4032,   //	273
4033,   //	274
4034,   //	275
4035,   //	276
4036,   //	277
4037,   //	278
4037,   //	279
4038,   //	280
4039,   //	281
4040,   //	282
4041,   //	283
4041,   //	284
4042,   //	285
4043,   //	286
4044,   //	287
4045,   //	288
4045,   //	289
4046,   //	290
4047,   //	291
4047,   //	292
4048,   //	293
4049,   //	294
4049,   //	295
4050,   //	296
4051,   //	297
4051,   //	298
4052,   //	299
4052,   // 	300
4053,   //	301
4053,   //	302
4054,   //	303
4055,   //	304
4055,   //	305
4056,   //	306
4056,   //	307
4057,   //	308
4057,   //	309
4058,   //	310
4059,   //	311
4059,   //	312
4060,   //	313
4060,   //	314
4061,   //	315
4061,   //	316
4062,   //	317
4063,   //	318
4063,   //	319
4064,   //	320
};


#if 0
/*
 * 函数名：get_temperature
 * 描述  ：计算温度
 * 输入  ：12bit的ADC值
 * 返回  : 计算结果: 0对应-30.0度, 300对应0度, 550对应25.0度, 最大1600对应130.0度
 */
#define		D_SCALE		10		//结果放大倍数, 放大10倍就是保留一位小数
uint16_t	get_temperature(uint16_t adc)
{
	uint16_t  const *p;
	uint16_t  i;
	uint8_t   j,k,min,max;
	
	adc = 4096 - adc;	//Rt接地
	p = igbtTempTable;
	if(adc < p[0])		return (0xfffe);
	if(adc > p[160])	return (0xffff);
	
	min = 0;		//-40度
	max = 160;		//120度

	for(j=0; j<5; j++)	//采用二分法查表
	{
		k = min / 2 + max / 2;
		if(adc <= p[k])	max = k;
		else			min = k;
	}
		 if(adc == p[min])	i = min * D_SCALE;
	else if(adc == p[max])	i = max * D_SCALE;
	else	// min < temp < max
	{
		while(min <= max)
		{
			min++;
			if(adc == p[min])	{i = min * D_SCALE;	break;}
			else if(adc < p[min])
			{
				min--;
				i = p[min];	//min
				j = (adc - i) * D_SCALE / (p[min+1] - i);
				i = min;
				i *= D_SCALE;
				i += j;
				break;
			}
		}
	}
	return i;
}

/*
 * 函数名：calculated_Temperature
 * 描述  ：根据AD值计算温度
 * 输入  ：12位AD值
 * 返回  : 温度值, bit15为“1”表示温度为负数
 */
#define		TEMP_PRECISION		0		//输出精度，1：保留一位小数（个位数表示小数部分）  0：只输出整数部分
uint16_t calculated_Temperature(uint16_t adc_val)
{
		uint16_t temp;
	
		temp =	get_temperature(adc_val);	//计算温度值

		if(temp >= 300)		temp -= 300;		//温度 >= 0度
		else			      	temp  = (300 - temp);	//温度 <  0度
	
#if TEMP_PRECISION
		return temp;
#else
		return (temp/10);
#endif
}

#endif


/*
 * 函数名：get_temperature
 * 描述  ：计算温度
 * 输入  ：adc 12bit的ADC值，e_NtcType NTC的类型，IGBT是10k NTC，线盘的蘑菇头是100k NTC
 * 返回  : 计算结果: 0对应0度, 320对应320度
 */
#define		D_SCALE		10		//结果放大倍数, 放大10倍就是保留一位小数
uint16_t	lookUpNtcTable(uint16_t adc, enum ntcType e_ntc_type)
{
	uint16_t  const *p;
	uint16_t  i;
	uint16_t   j,k,min,max;
	
	adc = 4096 - adc;	//Rt接地
	if(e_ntc_type == IGBT_NTC)
	{
			p = igbtTempTable;
	}
	else if(e_ntc_type == COIL_NTC)
	{
			p = coilTempTable;
	}
	if(adc < p[0])		return (0xfffe);
	if(adc > p[320])	return (0xffff);
	
	min = 0;		//0度
	max = 320;		//300度

	for(j=0; j<6; j++)	//采用二分法查表
	{
		k = min / 2 + max / 2;
		if(adc <= p[k])	max = k;
		else			min = k;
	}
		 if(adc == p[min])	i = min * D_SCALE;
	else if(adc == p[max])	i = max * D_SCALE;
	else	// min < temp < max
	{
		while(min <= max)
		{
			min++;
			if(adc == p[min])	{i = min * D_SCALE;	break;}
			else if(adc < p[min])
			{
				min--;
				i = p[min];	//min
				j = (adc - i) * D_SCALE / (p[min+1] - i);
				i = min;
				i *= D_SCALE;
				i += j;
				break;
			}
		}
	}
	return i;
}

/*
 * 函数名：calculated_Temperature
 * 描述  ：根据AD值计算温度
 * 输入  ：12位AD值
 * 返回  : 温度值, bit15为“1”表示温度为负数
 */
#define		TEMP_PRECISION		0		//输出精度，1：保留一位小数（个位数表示小数部分）  0：只输出整数部分
uint16_t getTemperature(uint16_t adc_val, enum ntcType e_ntc_type)
{
		uint16_t temp;

		temp = lookUpNtcTable(adc_val, e_ntc_type);	//计算温度值
	
		/* AD有问题直接返回错误代号 */
		if(temp == 0xfffe)        return  NTC_ERROR_OPEN;
		else if(temp == 0xffff)		return  NTC_ERROR_SHORT_CIRCUIT;

//		if(temp >= 300)		temp -= 300, aboveZeroFlag = TRUE;		//温度 >= 0度
//		else			      	temp  = (300 - temp), aboveZeroFlag = FALSE;	//温度 <  0度
	
#if TEMP_PRECISION
		return temp;
#else
		return (temp/10);
#endif
}
