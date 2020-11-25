   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _SW_disp:
   6  0000 00            	dc.b	0
   7  0001               _bit_comm:
   8  0001 00000000      	dc.l	0
   9  0005               _Add_Status:
  10  0005 00            	dc.b	0
  11  0006               _syn_delay:
  12  0006 04            	dc.b	4
  13  0007               _cur_no:
  14  0007 38            	dc.b	56
  15  0008               _max_pwm:
  16  0008 0a            	dc.b	10
  17  0009               _Get_word_1:
  18  0009 0000          	dc.w	0
  19  000b               _Get_word_2:
  20  000b 0000          	dc.w	0
  21  000d               _Get_word_3:
  22  000d 0000          	dc.w	0
  23  000f               _Get_word_4:
  24  000f 0000          	dc.w	0
  25  0011               _relay_delay_bz:
  26  0011 00            	dc.b	0
  27  0012               _Ms10_bz1:
  28  0012 00            	dc.b	0
  29  0013               _Ms10_bz2:
  30  0013 00            	dc.b	0
  31  0014               _Ms10_bz3:
  32  0014 00            	dc.b	0
  33  0015               _Ms10_bz4:
  34  0015 00            	dc.b	0
  35  0016               _Ms10_bz5:
  36  0016 00            	dc.b	0
  37  0017               _Ms10_bz6:
  38  0017 00            	dc.b	0
  39  0018               _Ms10_bz7:
  40  0018 00            	dc.b	0
  41  0019               _Flash_500ms_bz:
  42  0019 00            	dc.b	0
  43  001a               _timer_precise_bz:
  44  001a 00            	dc.b	0
  45  001b               _Sec_bz:
  46  001b 00            	dc.b	0
  47  001c               _Min_bz:
  48  001c 00            	dc.b	0
  49  001d               _Time_dot_bz:
  50  001d 00            	dc.b	0
  51  001e               _Prepare_data_bz:
  52  001e 00            	dc.b	0
  53  001f               _Power_on_bz:
  54  001f 00            	dc.b	0
  55  0020               _lock_bz:
  56  0020 00            	dc.b	0
  57  0021               _lock_flash_accout:
  58  0021 00            	dc.b	0
  59  0022               _buzzer_time:
  60  0022 00            	dc.b	0
  61  0023               _buzzer_account:
  62  0023 00            	dc.b	0
  63  0024               _Disp_buf:
  64  0024 00            	dc.b	0
  65  0025 00            	dc.b	0
  66  0026 00            	dc.b	0
  67  0027 00            	dc.b	0
  68  0028 00            	dc.b	0
  69  0029 00            	dc.b	0
  70  002a 00            	dc.b	0
  71  002b               _key_initial_count:
  72  002b fa            	dc.b	250
  73  002c               _idle_count:
  74  002c 00            	dc.b	0
  75  002d               _zone_flash_count:
  76  002d 00            	dc.b	0
  77  002e               _cmd_relay_wait:
  78  002e c8            	dc.b	200
  79  002f               _change_count:
  80  002f 00            	dc.b	0
  81  0030               _limit_count:
  82  0030 00            	dc.b	0
  83  0031               _count_1_key:
  84  0031 00            	dc.b	0
  85  0032               _count_2_key:
  86  0032 00            	dc.b	0
  87  0033               _count_3_key:
  88  0033 00            	dc.b	0
  89  0034               _count_4_key:
  90  0034 00            	dc.b	0
  91  0035               _key_zone:
  92  0035 00            	dc.b	0
  93  0036               _timer_status:
  94  0036 00            	dc.b	0
  95  0037               _time_flash_count:
  96  0037 00            	dc.b	0
  97  0038               _flash_H_1_min:
  98  0038 00            	dc.b	0
  99  0039               _flash_H_2_min:
 100  0039 00            	dc.b	0
 101  003a               _flash_H_3_min:
 102  003a 00            	dc.b	0
 103  003b               _flash_H_4_min:
 104  003b 00            	dc.b	0
 105  003c               _boost_time_1:
 106  003c 0000          	dc.w	0
 107  003e               _boost_time_2:
 108  003e 0000          	dc.w	0
 109  0040               _boost_time_3:
 110  0040 0000          	dc.w	0
 111  0042               _boost_time_4:
 112  0042 0000          	dc.w	0
 113  0044               _flex_L_bz:
 114  0044 00            	dc.b	0
 115  0045               _flex_R_bz:
 116  0045 00            	dc.b	0
 117  0046               _bbq_L_bz:
 118  0046 00            	dc.b	0
 119  0047               _bbq_R_bz:
 120  0047 00            	dc.b	0
 121  0048               _bbq_L_time:
 122  0048 0000          	dc.w	0
 123  004a               _bbq_R_time:
 124  004a 0000          	dc.w	0
 125  004c               _boost_1_save:
 126  004c 00            	dc.b	0
 127  004d               _boost_2_save:
 128  004d 00            	dc.b	0
 129  004e               _boost_3_save:
 130  004e 00            	dc.b	0
 131  004f               _boost_4_save:
 132  004f 00            	dc.b	0
 133  0050               _arr_default_timer:
 134  0050 0000          	dc.w	0
 135  0052 01e0          	dc.w	480
 136  0054 01e0          	dc.w	480
 137  0056 01e0          	dc.w	480
 138  0058 00f0          	dc.w	240
 139  005a 00f0          	dc.w	240
 140  005c 00f0          	dc.w	240
 141  005e 0078          	dc.w	120
 142  0060 0078          	dc.w	120
 143  0062 0078          	dc.w	120
 144  0064               _Comm_step:
 145  0064 00            	dc.b	0
 146  0065               _disp_debug1:
 147  0065 00            	dc.b	0
 148  0066               _disp_debug2:
 149  0066 00            	dc.b	0
 150  0067               _debug_list:
 151  0067 00            	dc.b	0
 152  0068               _zone_1_pan:
 153  0068 00            	dc.b	0
 154  0069               _zone_2_pan:
 155  0069 00            	dc.b	0
 156  006a               _zone_3_pan:
 157  006a 00            	dc.b	0
 158  006b               _zone_4_pan:
 159  006b 00            	dc.b	0
 160  006c               _zone_1_nopan_time:
 161  006c 00            	dc.b	0
 162  006d               _zone_2_nopan_time:
 163  006d 00            	dc.b	0
 164  006e               _zone_3_nopan_time:
 165  006e 00            	dc.b	0
 166  006f               _zone_4_nopan_time:
 167  006f 00            	dc.b	0
 168  0070               _Get_addr:
 169  0070 00            	dc.b	0
 170  0071               _Get_data:
 171  0071 00            	dc.b	0
 172  0072               _Get_vol:
 173  0072 00            	dc.b	0
 174  0073               _Get_cur:
 175  0073 00            	dc.b	0
 176  0074               _Get_tigbt:
 177  0074 00            	dc.b	0
 178  0075               _Get_tmain:
 179  0075 00            	dc.b	0
 180  0076               _Get_ppg:
 181  0076 00            	dc.b	0
 182  0077               _Get_cur_no:
 183  0077 00            	dc.b	0
 184  0078               _Err_1_data:
 185  0078 00            	dc.b	0
 186  0079               _Err_2_data:
 187  0079 00            	dc.b	0
 188  007a               _Err_3_data:
 189  007a 00            	dc.b	0
 190  007b               _Err_4_data:
 191  007b 00            	dc.b	0
 192  007c               _Err_1_count:
 193  007c 00            	dc.b	0
 194  007d               _Err_2_count:
 195  007d 00            	dc.b	0
 196  007e               _Err_3_count:
 197  007e 00            	dc.b	0
 198  007f               _Err_4_count:
 199  007f 00            	dc.b	0
 200  0080               _boost_status:
 201  0080 00            	dc.b	0
 202  0081               _key_scan_value:
 203  0081 00000000      	dc.l	0
 204  0085               _key_ok_bit:
 205  0085 00            	dc.b	0
 206  0086               _key_account:
 207  0086 0000          	dc.w	0
 208  0088               _key_err_account:
 209  0088 0000          	dc.w	0
 210  008a               _work_1_time:
 211  008a 0000          	dc.w	0
 212  008c               _work_2_time:
 213  008c 0000          	dc.w	0
 214  008e               _work_3_time:
 215  008e 0000          	dc.w	0
 216  0090               _work_4_time:
 217  0090 0000          	dc.w	0
 218  0092               _limit_time:
 219  0092 0000          	dc.w	0
 220  0094               _zone_1_level:
 221  0094 00            	dc.b	0
 222  0095               _zone_2_level:
 223  0095 00            	dc.b	0
 224  0096               _zone_3_level:
 225  0096 00            	dc.b	0
 226  0097               _zone_4_level:
 227  0097 00            	dc.b	0
 228  0098               _general_timer:
 229  0098 00            	dc.b	0
 230  0099               _pause_x_timer:
 231  0099 00            	dc.b	0
 232  009a               _zone_1_timer:
 233  009a 0000          	dc.w	0
 234  009c               _zone_2_timer:
 235  009c 0000          	dc.w	0
 236  009e               _zone_3_timer:
 237  009e 0000          	dc.w	0
 238  00a0               _zone_4_timer:
 239  00a0 0000          	dc.w	0
 240  00a2               _I2C_GET_DATA_H:
 241  00a2 0000          	dc.w	0
 242  00a4               _I2C_GET_DATA_L:
 243  00a4 0000          	dc.w	0
 244  00a6               _I2C_GET_DATA:
 245  00a6 00000000      	dc.l	0
 246  00aa               _match_ok:
 247  00aa 00            	dc.b	0
 248  00ab               _vol_1:
 249  00ab 00            	dc.b	0
 250  00ac               _vol_2:
 251  00ac 00            	dc.b	0
 252  00ad               _vol_3:
 253  00ad 00            	dc.b	0
 254  00ae               _vol_4:
 255  00ae 00            	dc.b	0
 256  00af               _cur_1:
 257  00af 00            	dc.b	0
 258  00b0               _cur_2:
 259  00b0 00            	dc.b	0
 260  00b1               _cur_3:
 261  00b1 00            	dc.b	0
 262  00b2               _cur_4:
 263  00b2 00            	dc.b	0
 264  00b3               _tigbt_1:
 265  00b3 00            	dc.b	0
 266  00b4               _tigbt_2:
 267  00b4 00            	dc.b	0
 268  00b5               _tigbt_3:
 269  00b5 00            	dc.b	0
 270  00b6               _tigbt_4:
 271  00b6 00            	dc.b	0
 272  00b7               _tmain_1:
 273  00b7 00            	dc.b	0
 274  00b8               _tmain_2:
 275  00b8 00            	dc.b	0
 276  00b9               _tmain_3:
 277  00b9 00            	dc.b	0
 278  00ba               _tmain_4:
 279  00ba 00            	dc.b	0
 280  00bb               _ppg_1:
 281  00bb 00            	dc.b	0
 282  00bc               _ppg_2:
 283  00bc 00            	dc.b	0
 284  00bd               _ppg_3:
 285  00bd 00            	dc.b	0
 286  00be               _ppg_4:
 287  00be 00            	dc.b	0
 288  00bf               _time_level_1:
 289  00bf 00            	dc.b	0
 290  00c0               _time_level_2:
 291  00c0 00            	dc.b	0
 292  00c1               _time_level_3:
 293  00c1 00            	dc.b	0
 294  00c2               _time_level_4:
 295  00c2 00            	dc.b	0
 296  00c3               _pwm_temp_1:
 297  00c3 00            	dc.b	0
 298  00c4               _pwm_temp_2:
 299  00c4 00            	dc.b	0
 300  00c5               _pwm_temp_3:
 301  00c5 00            	dc.b	0
 302  00c6               _pwm_temp_4:
 303  00c6 00            	dc.b	0
 304  00c7               _com_count:
 305  00c7 00            	dc.b	0
 306  00c8               _comm_status:
 307  00c8 00            	dc.b	0
 308  00c9               _comm_list:
 309  00c9 00            	dc.b	0
 310  00ca               _fan_count:
 311  00ca 00            	dc.b	0
 312  00cb               _fan_status:
 313  00cb 00            	dc.b	0
 314  00cc               _timer_list:
 315  00cc 00            	dc.b	0
 316  00cd               _sys_pow_status:
 317  00cd 74            	dc.b	116
 318  00ce               _sys_adj_secjs:
 319  00ce 00            	dc.b	0
 320  00cf               _sys_adj_status:
 321  00cf 00            	dc.b	0
 322  00d0               _sys_disp_status:
 323  00d0 00            	dc.b	0
 324  00d1               _Pause_bz:
 325  00d1 00            	dc.b	0
 326  00d2               _Pause_save_timer_1:
 327  00d2 00            	dc.b	0
 328  00d3               _Pause_save_timer_2:
 329  00d3 00            	dc.b	0
 330  00d4               _Pause_save_timer_3:
 331  00d4 00            	dc.b	0
 332  00d5               _Pause_save_timer_4:
 333  00d5 00            	dc.b	0
 334  00d6               _Warm_status:
 335  00d6 00            	dc.b	0
 336  00d7               _Warm_1_timer:
 337  00d7 00            	dc.b	0
 338  00d8               _Warm_2_timer:
 339  00d8 00            	dc.b	0
 340  00d9               _Warm_3_timer:
 341  00d9 00            	dc.b	0
 342  00da               _Warm_4_timer:
 343  00da 00            	dc.b	0
 344                     	switch	.data
 345  0000               _tiao_on_1:
 346  0000 00            	dc.b	0
 347  0001               _tiao_on_2:
 348  0001 00            	dc.b	0
 349  0002               _tiao_on_3:
 350  0002 00            	dc.b	0
 351  0003               _tiao_on_4:
 352  0003 00            	dc.b	0
 353  0004               _oil_high_1:
 354  0004 00            	dc.b	0
 355  0005               _oil_high_2:
 356  0005 00            	dc.b	0
 357  0006               _oil_high_3:
 358  0006 00            	dc.b	0
 359  0007               _oil_high_4:
 360  0007 00            	dc.b	0
 361  0008               _igbt_high_1:
 362  0008 00            	dc.b	0
 363  0009               _igbt_high_2:
 364  0009 00            	dc.b	0
 365  000a               _igbt_high_3:
 366  000a 00            	dc.b	0
 367  000b               _igbt_high_4:
 368  000b 00            	dc.b	0
 369  000c               _boost_1_count:
 370  000c 00            	dc.b	0
 371  000d               _boost_2_count:
 372  000d 00            	dc.b	0
 373  000e               _boost_3_count:
 374  000e 00            	dc.b	0
 375  000f               _boost_4_count:
 376  000f 00            	dc.b	0
 377  0010               _zone_1_nopan_wait:
 378  0010 00            	dc.b	0
 379  0011               _zone_2_nopan_wait:
 380  0011 00            	dc.b	0
 381  0012               _zone_3_nopan_wait:
 382  0012 00            	dc.b	0
 383  0013               _zone_4_nopan_wait:
 384  0013 00            	dc.b	0
 385  0014               _arr_tiao_on:
 386  0014 04            	dc.b	4
 387  0015 05            	dc.b	5
 388  0016 06            	dc.b	6
 389  0017 07            	dc.b	7
 390  0018 08            	dc.b	8
 391  0019 0a            	dc.b	10
 392  001a               _arr_tiao_180_pwm:
 393  001a c0            	dc.b	192
 394  001b c0            	dc.b	192
 395  001c b8            	dc.b	184
 396  001d b0            	dc.b	176
 397  001e b0            	dc.b	176
 398  001f b0            	dc.b	176
 399  0020               _erp_pwm:
 400  0020 cc            	dc.b	204
 401  0021 bc            	dc.b	188
 402  0022 cc            	dc.b	204
 403  0023 bc            	dc.b	188
 404  0024               _apt_min_reset:
 405  0024 00            	dc.b	0
 406  0025               _arr_1_pow:
 407  0025 3f            	dc.b	63
 408  0026 44            	dc.b	68
 409  0027 71            	dc.b	113
 410  0028 98            	dc.b	152
 411  0029               _arr_3_pow:
 412  0029 3f            	dc.b	63
 413  002a 44            	dc.b	68
 414  002b 71            	dc.b	113
 415  002c 98            	dc.b	152
 416  002d               _arr_2_pow:
 417  002d 88            	dc.b	136
 418  002e 93            	dc.b	147
 419  002f aa            	dc.b	170
 420  0030 e6            	dc.b	230
 421  0031               _arr_4_pow:
 422  0031 88            	dc.b	136
 423  0032 93            	dc.b	147
 424  0033 aa            	dc.b	170
 425  0034 e6            	dc.b	230
 426                     .user:	section	.text
 427  0000               _arr_flex_pwm:
 428  0000 b8            	dc.b	184
 429  0001 b0            	dc.b	176
 430  0002 a8            	dc.b	168
 431  0003 a4            	dc.b	164
 432  0004 a0            	dc.b	160
 433  0005 98            	dc.b	152
 434  0006               _arr_APTRegData_H:
 435  0006 03            	dc.b	3
 436  0007 04            	dc.b	4
 437  0008 20            	dc.b	32
 438  0009 03            	dc.b	3
 439  000a e0            	dc.b	224
 440  000b 40            	dc.b	64
 441  000c 08            	dc.b	8
 442  000d 02            	dc.b	2
 443  000e 02            	dc.b	2
 444  000f 80            	dc.b	128
 445  0010 ff            	dc.b	255
 446  0011 04            	dc.b	4
 447  0012 40            	dc.b	64
 448  0013 00            	dc.b	0
 449  0014               _arr_T_Sens_H:
 450  0014 ff            	dc.b	255
 451  0015 ff            	dc.b	255
 452  0016 0d            	dc.b	13
 453  0017 0d            	dc.b	13
 454  0018 0a            	dc.b	10
 455  0019 0c            	dc.b	12
 456  001a 0d            	dc.b	13
 457  001b 0d            	dc.b	13
 458  001c 0d            	dc.b	13
 459  001d 0b            	dc.b	11
 460  001e 0a            	dc.b	10
 461  001f 0d            	dc.b	13
 462  0020 0d            	dc.b	13
 463  0021 ff            	dc.b	255
 464  0022 ff            	dc.b	255
 465  0023 ff            	dc.b	255
 466  0024               _arr_APTRegData_L:
 467  0024 03            	dc.b	3
 468  0025 04            	dc.b	4
 469  0026 20            	dc.b	32
 470  0027 01            	dc.b	1
 471  0028 80            	dc.b	128
 472  0029 40            	dc.b	64
 473  002a 08            	dc.b	8
 474  002b 02            	dc.b	2
 475  002c 02            	dc.b	2
 476  002d 80            	dc.b	128
 477  002e ff            	dc.b	255
 478  002f 04            	dc.b	4
 479  0030 40            	dc.b	64
 480  0031 00            	dc.b	0
 481  0032               _arr_T_Sens_L:
 482  0032 ff            	dc.b	255
 483  0033 ff            	dc.b	255
 484  0034 ff            	dc.b	255
 485  0035 0f            	dc.b	15
 486  0036 0d            	dc.b	13
 487  0037 0e            	dc.b	14
 488  0038 0f            	dc.b	15
 489  0039 0f            	dc.b	15
 490  003a 0e            	dc.b	14
 491  003b 0d            	dc.b	13
 492  003c 0a            	dc.b	10
 493  003d 0a            	dc.b	10
 494  003e 0a            	dc.b	10
 495  003f 09            	dc.b	9
 496  0040 0a            	dc.b	10
 497  0041 0f            	dc.b	15
 498  0042               _arr_flex_b:
 499  0042 37            	dc.b	55
 500  0043 3b            	dc.b	59
 501  0044 3f            	dc.b	63
 502  0045 43            	dc.b	67
 503  0046 47            	dc.b	71
 504  0047 50            	dc.b	80
 505  0048               _arr_flex_s:
 506  0048 6e            	dc.b	110
 507  0049 76            	dc.b	118
 508  004a 7e            	dc.b	126
 509  004b 86            	dc.b	134
 510  004c 8e            	dc.b	142
 511  004d 99            	dc.b	153
 512  004e               _arr_2000:
 513  004e 0032          	dc.w	50
 514  0050 0064          	dc.w	100
 515  0052 00c8          	dc.w	200
 516  0054 012c          	dc.w	300
 517  0056 0258          	dc.w	600
 518  0058 03e8          	dc.w	1000
 519  005a 04b0          	dc.w	1200
 520  005c 0514          	dc.w	1300
 521  005e 07d0          	dc.w	2000
 522  0060 0a28          	dc.w	2600
 523  0062               _arr_1500:
 524  0062 0032          	dc.w	50
 525  0064 0064          	dc.w	100
 526  0066 00c8          	dc.w	200
 527  0068 012c          	dc.w	300
 528  006a 0258          	dc.w	600
 529  006c 03e8          	dc.w	1000
 530  006e 04b0          	dc.w	1200
 531  0070 0514          	dc.w	1300
 532  0072 05dc          	dc.w	1500
 533  0074 07d0          	dc.w	2000
 574                     ; 322 void  Write_Data_to_EEPROM(u8 data)
 574                     ; 323 {              	
 576                     	switch	.text
 577  0000               _Write_Data_to_EEPROM:
 581                     ; 324 	FLASH->CR1 &= (u8)(~FLASH_CR1_FIX);
 583  0000 7211505a      	bres	20570,#0
 584                     ; 325 	FLASH->DUKR = FLASH_RASS_KEY2; 
 586  0004 35ae5064      	mov	20580,#174
 587                     ; 326         FLASH->DUKR = FLASH_RASS_KEY1; 	
 589  0008 35565064      	mov	20580,#86
 590                     ; 327 	*((PointerAttr u8*) User_eeprom_address_1) =data;
 592  000c bd004051      	ldf	16465,a
 593                     ; 328 }
 596  0010 81            	ret
 635                     ; 330 u8 comm_vertify(void)
 635                     ; 331 {
 636                     	switch	.text
 637  0011               _comm_vertify:
 639  0011 88            	push	a
 640       00000001      OFST:	set	1
 643                     ; 332    u8 status =0;
 645  0012 0f01          	clr	(OFST+0,sp)
 646                     ; 333    	if(Get_addr ==Add_Status)						status++;
 648  0014 b670          	ld	a,_Get_addr
 649  0016 b105          	cp	a,_Add_Status
 650  0018 2602          	jrne	L54
 653  001a 0c01          	inc	(OFST+0,sp)
 654  001c               L54:
 655                     ; 334 	if(Get_cur_no == cur_no)		   	        		status++;  
 657  001c b677          	ld	a,_Get_cur_no
 658  001e b107          	cp	a,_cur_no
 659  0020 2602          	jrne	L74
 662  0022 0c01          	inc	(OFST+0,sp)
 663  0024               L74:
 664                     ; 335 	if((Get_data ==0)||(Get_data ==DATA_PAN_NO)||(Get_data ==DATA_PAN_OK))  status++;	
 666  0024 3d71          	tnz	_Get_data
 667  0026 270c          	jreq	L35
 669  0028 b671          	ld	a,_Get_data
 670  002a a165          	cp	a,#101
 671  002c 2706          	jreq	L35
 673  002e b671          	ld	a,_Get_data
 674  0030 a156          	cp	a,#86
 675  0032 2602          	jrne	L15
 676  0034               L35:
 679  0034 0c01          	inc	(OFST+0,sp)
 680  0036               L15:
 681                     ; 336         if(status ==3) return(1);
 683  0036 7b01          	ld	a,(OFST+0,sp)
 684  0038 a103          	cp	a,#3
 685  003a 2605          	jrne	L75
 688  003c a601          	ld	a,#1
 691  003e 5b01          	addw	sp,#1
 692  0040 81            	ret
 693  0041               L75:
 694                     ; 337    else return(0);
 696  0041 4f            	clr	a
 699  0042 5b01          	addw	sp,#1
 700  0044 81            	ret
 762                     ; 340 void flex_deal(u8 index)
 762                     ; 341 {	
 763                     	switch	.text
 764  0045               _flex_deal:
 766  0045 88            	push	a
 767  0046 89            	pushw	x
 768       00000002      OFST:	set	2
 771                     ; 342    u8 ds =0;
 773  0047 0f01          	clr	(OFST-1,sp)
 774                     ; 343    u8 dr =0;
 776  0049 0f02          	clr	(OFST+0,sp)
 777                     ; 345    if((index ==1)||(index ==0x11))
 779  004b a101          	cp	a,#1
 780  004d 2704          	jreq	L311
 782  004f a111          	cp	a,#17
 783  0051 261c          	jrne	L111
 784  0053               L311:
 785                     ; 347 		if(flex_L_bz)  	
 787  0053 3d44          	tnz	_flex_L_bz
 788  0055 2718          	jreq	L111
 789                     ; 349 		ds =0;	
 791  0057 0f01          	clr	(OFST-1,sp)
 792                     ; 350 		dr =1;
 794  0059 a601          	ld	a,#1
 795  005b 6b02          	ld	(OFST+0,sp),a
 796                     ; 351 		count_2_key =0;
 798  005d 3f32          	clr	_count_2_key
 799                     ; 352 		if(timer_status &0x01)  timer_status |=0x02;
 801  005f b636          	ld	a,_timer_status
 802  0061 a501          	bcp	a,#1
 803  0063 2706          	jreq	L711
 806  0065 72120036      	bset	_timer_status,#1
 808  0069 2004          	jra	L111
 809  006b               L711:
 810                     ; 353 		else timer_status &=~0x02;
 812  006b 72130036      	bres	_timer_status,#1
 813  006f               L111:
 814                     ; 357    if((index ==2)||(index ==0x12))
 816  006f 7b03          	ld	a,(OFST+1,sp)
 817  0071 a102          	cp	a,#2
 818  0073 2706          	jreq	L521
 820  0075 7b03          	ld	a,(OFST+1,sp)
 821  0077 a112          	cp	a,#18
 822  0079 261c          	jrne	L321
 823  007b               L521:
 824                     ; 359 		if(flex_L_bz)  	
 826  007b 3d44          	tnz	_flex_L_bz
 827  007d 2718          	jreq	L321
 828                     ; 361 		ds =1;	
 830  007f a601          	ld	a,#1
 831  0081 6b01          	ld	(OFST-1,sp),a
 832                     ; 362 		dr =0;
 834  0083 0f02          	clr	(OFST+0,sp)
 835                     ; 363 		count_1_key =0;
 837  0085 3f31          	clr	_count_1_key
 838                     ; 364 		if(timer_status &0x02)  timer_status |=0x01;
 840  0087 b636          	ld	a,_timer_status
 841  0089 a502          	bcp	a,#2
 842  008b 2706          	jreq	L131
 845  008d 72100036      	bset	_timer_status,#0
 847  0091 2004          	jra	L321
 848  0093               L131:
 849                     ; 365 		else timer_status &=~0x01;
 851  0093 72110036      	bres	_timer_status,#0
 852  0097               L321:
 853                     ; 369    if((index ==3)||(index ==0x14))
 855  0097 7b03          	ld	a,(OFST+1,sp)
 856  0099 a103          	cp	a,#3
 857  009b 2706          	jreq	L731
 859  009d 7b03          	ld	a,(OFST+1,sp)
 860  009f a114          	cp	a,#20
 861  00a1 261e          	jrne	L531
 862  00a3               L731:
 863                     ; 371 		if(flex_R_bz)  	
 865  00a3 3d45          	tnz	_flex_R_bz
 866  00a5 271a          	jreq	L531
 867                     ; 373 		ds =2;	
 869  00a7 a602          	ld	a,#2
 870  00a9 6b01          	ld	(OFST-1,sp),a
 871                     ; 374 		dr =3;
 873  00ab a603          	ld	a,#3
 874  00ad 6b02          	ld	(OFST+0,sp),a
 875                     ; 375 		count_4_key =0;
 877  00af 3f34          	clr	_count_4_key
 878                     ; 376 		if(timer_status &0x04)  timer_status |=0x08;
 880  00b1 b636          	ld	a,_timer_status
 881  00b3 a504          	bcp	a,#4
 882  00b5 2706          	jreq	L341
 885  00b7 72160036      	bset	_timer_status,#3
 887  00bb 2004          	jra	L531
 888  00bd               L341:
 889                     ; 377 		else timer_status &=~0x08;
 891  00bd 72170036      	bres	_timer_status,#3
 892  00c1               L531:
 893                     ; 381    if((index ==4)||(index ==0x18))
 895  00c1 7b03          	ld	a,(OFST+1,sp)
 896  00c3 a104          	cp	a,#4
 897  00c5 2706          	jreq	L151
 899  00c7 7b03          	ld	a,(OFST+1,sp)
 900  00c9 a118          	cp	a,#24
 901  00cb 261e          	jrne	L741
 902  00cd               L151:
 903                     ; 383 		if(flex_R_bz)  
 905  00cd 3d45          	tnz	_flex_R_bz
 906  00cf 271a          	jreq	L741
 907                     ; 385 		ds =3;	
 909  00d1 a603          	ld	a,#3
 910  00d3 6b01          	ld	(OFST-1,sp),a
 911                     ; 386 		dr =2;
 913  00d5 a602          	ld	a,#2
 914  00d7 6b02          	ld	(OFST+0,sp),a
 915                     ; 387 		count_3_key =0;
 917  00d9 3f33          	clr	_count_3_key
 918                     ; 388 		if(timer_status &0x08)  timer_status |=0x04;
 920  00db b636          	ld	a,_timer_status
 921  00dd a508          	bcp	a,#8
 922  00df 2706          	jreq	L551
 925  00e1 72140036      	bset	_timer_status,#2
 927  00e5 2004          	jra	L741
 928  00e7               L551:
 929                     ; 389 		else timer_status &=~0x04;
 931  00e7 72150036      	bres	_timer_status,#2
 932  00eb               L741:
 933                     ; 392    if(ds+dr)    
 935  00eb 7b01          	ld	a,(OFST-1,sp)
 936  00ed 5f            	clrw	x
 937  00ee 1b02          	add	a,(OFST+0,sp)
 938  00f0 2401          	jrnc	L21
 939  00f2 5c            	incw	x
 940  00f3               L21:
 941  00f3 02            	rlwa	x,a
 942  00f4 5d            	tnzw	x
 943  00f5 2737          	jreq	L161
 944                     ; 394      		*((u8*)(&zone_1_level+dr)) =*((u8*)(&zone_1_level+ds));
 946  00f7 7b02          	ld	a,(OFST+0,sp)
 947  00f9 5f            	clrw	x
 948  00fa 97            	ld	xl,a
 949  00fb 7b01          	ld	a,(OFST-1,sp)
 950  00fd 905f          	clrw	y
 951  00ff 9097          	ld	yl,a
 952  0101 90e694        	ld	a,(_zone_1_level,y)
 953  0104 e794          	ld	(_zone_1_level,x),a
 954                     ; 395      		*((u16*)(&boost_time_1)+dr)  =*((u16*)(&boost_time_1)+ds);
 956  0106 7b01          	ld	a,(OFST-1,sp)
 957  0108 5f            	clrw	x
 958  0109 97            	ld	xl,a
 959  010a 58            	sllw	x
 960  010b 7b02          	ld	a,(OFST+0,sp)
 961  010d 905f          	clrw	y
 962  010f 9097          	ld	yl,a
 963  0111 9058          	sllw	y
 964  0113 89            	pushw	x
 965  0114 ee3c          	ldw	x,(_boost_time_1,x)
 966  0116 90ef3c        	ldw	(_boost_time_1,y),x
 967  0119 85            	popw	x
 968                     ; 396      		*((u16*)(&zone_1_timer)+dr)  =*((u16*)(&zone_1_timer)+ds);    		
 970  011a 7b01          	ld	a,(OFST-1,sp)
 971  011c 5f            	clrw	x
 972  011d 97            	ld	xl,a
 973  011e 58            	sllw	x
 974  011f 7b02          	ld	a,(OFST+0,sp)
 975  0121 905f          	clrw	y
 976  0123 9097          	ld	yl,a
 977  0125 9058          	sllw	y
 978  0127 89            	pushw	x
 979  0128 ee9a          	ldw	x,(_zone_1_timer,x)
 980  012a 90ef9a        	ldw	(_zone_1_timer,y),x
 981  012d 85            	popw	x
 982  012e               L161:
 983                     ; 398 }
 986  012e 5b03          	addw	sp,#3
 987  0130 81            	ret
1012                     ; 400 void comm_asm_deal(void)
1012                     ; 401 {
1013                     	switch	.text
1014  0131               _comm_asm_deal:
1018                     ; 403      		mov _bit_comm+0,_Add_Status
1021  0131 450501        mov _bit_comm+0,_Add_Status
1023                     ; 404      		mov _bit_comm+1,_syn_delay
1026  0134 450602        mov _bit_comm+1,_syn_delay
1028                     ; 405      		mov _bit_comm+2,_cur_no
1031  0137 450703        mov _bit_comm+2,_cur_no
1033                     ; 406      		mov _bit_comm+3,_max_pwm
1036  013a 450804        mov _bit_comm+3,_max_pwm
1038                     ; 408      	comm_status =0;  
1040  013d 3fc8          	clr	_comm_status
1041                     ; 409         comm_list =0; 
1043  013f 3fc9          	clr	_comm_list
1044                     ; 410 }
1047  0141 81            	ret
1246                     ; 412 void comm_get_deal(u8 index)
1246                     ; 413 {
1247                     	switch	.text
1248  0142               _comm_get_deal:
1250  0142 88            	push	a
1251  0143 521b          	subw	sp,#27
1252       0000001b      OFST:	set	27
1255                     ; 414       u8 result =0;
1257  0145 0f1b          	clr	(OFST+0,sp)
1258                     ; 415 	u8 *v =&vol_1 +index;   
1260  0147 abab          	add	a,#_vol_1
1261  0149 5f            	clrw	x
1262  014a 97            	ld	xl,a
1263  014b 1f03          	ldw	(OFST-24,sp),x
1264                     ; 416 	u8 *c =&cur_1 +index;   
1266  014d 7b1c          	ld	a,(OFST+1,sp)
1267  014f abaf          	add	a,#_cur_1
1268  0151 5f            	clrw	x
1269  0152 97            	ld	xl,a
1270  0153 1f0f          	ldw	(OFST-12,sp),x
1271                     ; 417 	u8 *i =&tigbt_1 +index; 
1273  0155 7b1c          	ld	a,(OFST+1,sp)
1274  0157 abb3          	add	a,#_tigbt_1
1275  0159 5f            	clrw	x
1276  015a 97            	ld	xl,a
1277  015b 1f05          	ldw	(OFST-22,sp),x
1278                     ; 418 	u8 *m =&tmain_1 +index; 
1280  015d 7b1c          	ld	a,(OFST+1,sp)
1281  015f abb7          	add	a,#_tmain_1
1282  0161 5f            	clrw	x
1283  0162 97            	ld	xl,a
1284  0163 1f07          	ldw	(OFST-20,sp),x
1285                     ; 419 	u8 *p =&ppg_1 +index;   
1287  0165 7b1c          	ld	a,(OFST+1,sp)
1288  0167 abbb          	add	a,#_ppg_1
1289  0169 5f            	clrw	x
1290  016a 97            	ld	xl,a
1291  016b 1f09          	ldw	(OFST-18,sp),x
1292                     ; 420 	u8 *z =&zone_1_pan +index;  
1294  016d 7b1c          	ld	a,(OFST+1,sp)
1295  016f ab68          	add	a,#_zone_1_pan
1296  0171 5f            	clrw	x
1297  0172 97            	ld	xl,a
1298  0173 1f0b          	ldw	(OFST-16,sp),x
1299                     ; 421 	u8 *so =&oil_high_1 +index;
1301  0175 a604          	ld	a,#high(_oil_high_1)
1302  0177 97            	ld	xl,a
1303  0178 a604          	ld	a,#low(_oil_high_1)
1304  017a 1b1c          	add	a,(OFST+1,sp)
1305  017c 2401          	jrnc	L02
1306  017e 5c            	incw	x
1307  017f               L02:
1308  017f 02            	rlwa	x,a
1309  0180 1f19          	ldw	(OFST-2,sp),x
1310  0182 01            	rrwa	x,a
1311                     ; 422 	u8 *si =&igbt_high_1 +index;
1313  0183 a608          	ld	a,#high(_igbt_high_1)
1314  0185 97            	ld	xl,a
1315  0186 a608          	ld	a,#low(_igbt_high_1)
1316  0188 1b1c          	add	a,(OFST+1,sp)
1317  018a 2401          	jrnc	L22
1318  018c 5c            	incw	x
1319  018d               L22:
1320  018d 02            	rlwa	x,a
1321  018e 1f13          	ldw	(OFST-8,sp),x
1322  0190 01            	rrwa	x,a
1323                     ; 423 	u8 *time =&zone_1_nopan_time +index; 
1325  0191 7b1c          	ld	a,(OFST+1,sp)
1326  0193 ab6c          	add	a,#_zone_1_nopan_time
1327  0195 5f            	clrw	x
1328  0196 97            	ld	xl,a
1329  0197 1f17          	ldw	(OFST-4,sp),x
1330                     ; 424 	u8 *npan =&zone_1_nopan_wait +index;
1332  0199 a610          	ld	a,#high(_zone_1_nopan_wait)
1333  019b 97            	ld	xl,a
1334  019c a610          	ld	a,#low(_zone_1_nopan_wait)
1335  019e 1b1c          	add	a,(OFST+1,sp)
1336  01a0 2401          	jrnc	L42
1337  01a2 5c            	incw	x
1338  01a3               L42:
1339  01a3 02            	rlwa	x,a
1340  01a4 1f0d          	ldw	(OFST-14,sp),x
1341  01a6 01            	rrwa	x,a
1342                     ; 425 	u8 *level =&zone_1_level +index; 
1344  01a7 7b1c          	ld	a,(OFST+1,sp)
1345  01a9 ab94          	add	a,#_zone_1_level
1346  01ab 5f            	clrw	x
1347  01ac 97            	ld	xl,a
1348  01ad 1f01          	ldw	(OFST-26,sp),x
1349                     ; 426 	u8 *count =&Err_1_count +index; 
1351  01af 7b1c          	ld	a,(OFST+1,sp)
1352  01b1 ab7c          	add	a,#_Err_1_count
1353  01b3 5f            	clrw	x
1354  01b4 97            	ld	xl,a
1355  01b5 1f15          	ldw	(OFST-6,sp),x
1356                     ; 427 	u8 *err =&Err_1_data +index; 
1358  01b7 7b1c          	ld	a,(OFST+1,sp)
1359  01b9 ab78          	add	a,#_Err_1_data
1360  01bb 5f            	clrw	x
1361  01bc 97            	ld	xl,a
1362  01bd 1f11          	ldw	(OFST-10,sp),x
1363                     ; 429        (*v) =Get_vol;
1365  01bf 1e03          	ldw	x,(OFST-24,sp)
1366  01c1 b672          	ld	a,_Get_vol
1367  01c3 f7            	ld	(x),a
1368                     ; 430        (*c) =Get_cur;  
1370  01c4 1e0f          	ldw	x,(OFST-12,sp)
1371  01c6 b673          	ld	a,_Get_cur
1372  01c8 f7            	ld	(x),a
1373                     ; 431        (*i) =Get_tigbt;
1375  01c9 1e05          	ldw	x,(OFST-22,sp)
1376  01cb b674          	ld	a,_Get_tigbt
1377  01cd f7            	ld	(x),a
1378                     ; 432        (*m) =Get_tmain;  
1380  01ce 1e07          	ldw	x,(OFST-20,sp)
1381  01d0 b675          	ld	a,_Get_tmain
1382  01d2 f7            	ld	(x),a
1383                     ; 433        (*p) =Get_ppg;
1385  01d3 1e09          	ldw	x,(OFST-18,sp)
1386  01d5 b676          	ld	a,_Get_ppg
1387  01d7 f7            	ld	(x),a
1388                     ; 434        (*z) =Get_data;
1390  01d8 1e0b          	ldw	x,(OFST-16,sp)
1391  01da b671          	ld	a,_Get_data
1392  01dc f7            	ld	(x),a
1393                     ; 437      if(index >=1)	//  //2# 3# 4#special deal temperature  ((index ==1)||(index==3))
1395  01dd 0d1c          	tnz	(OFST+1,sp)
1396  01df 2731          	jreq	L103
1397                     ; 439       	if(Get_tmain >CON_TMAIN_180)  (*so) =3;		//180  0xF1
1399  01e1 b675          	ld	a,_Get_tmain
1400  01e3 a1f2          	cp	a,#242
1401  01e5 2505          	jrult	L303
1404  01e7 1e19          	ldw	x,(OFST-2,sp)
1405  01e9 a603          	ld	a,#3
1406  01eb f7            	ld	(x),a
1407  01ec               L303:
1408                     ; 440         if(Get_tmain >CON_TMAIN_190)  (*so) =1;       	//190  0xF3
1410  01ec b675          	ld	a,_Get_tmain
1411  01ee a1f4          	cp	a,#244
1412  01f0 2505          	jrult	L503
1415  01f2 1e19          	ldw	x,(OFST-2,sp)
1416  01f4 a601          	ld	a,#1
1417  01f6 f7            	ld	(x),a
1418  01f7               L503:
1419                     ; 441         if(*so)
1421  01f7 1e19          	ldw	x,(OFST-2,sp)
1422  01f9 7d            	tnz	(x)
1423  01fa 2743          	jreq	L513
1424                     ; 443        	if(Get_tmain <CON_TMAIN_170)  (*so) =4;		//170  0xED
1426  01fc b675          	ld	a,_Get_tmain
1427  01fe a1ed          	cp	a,#237
1428  0200 2405          	jruge	L113
1431  0202 1e19          	ldw	x,(OFST-2,sp)
1432  0204 a604          	ld	a,#4
1433  0206 f7            	ld	(x),a
1434  0207               L113:
1435                     ; 444        	if(Get_tmain <CON_TMAIN_160)  (*so) =0;		//160  0xE9
1437  0207 b675          	ld	a,_Get_tmain
1438  0209 a1e9          	cp	a,#233
1439  020b 2432          	jruge	L513
1442  020d 1e19          	ldw	x,(OFST-2,sp)
1443  020f 7f            	clr	(x)
1444  0210 202d          	jra	L513
1445  0212               L103:
1446                     ; 449        if(Get_tmain >CON_TMAIN_180)  (*so) =1;
1448  0212 b675          	ld	a,_Get_tmain
1449  0214 a1f2          	cp	a,#242
1450  0216 2507          	jrult	L713
1453  0218 1e19          	ldw	x,(OFST-2,sp)
1454  021a a601          	ld	a,#1
1455  021c f7            	ld	(x),a
1457  021d 2020          	jra	L513
1458  021f               L713:
1459                     ; 450        else if(*so)
1461  021f 1e19          	ldw	x,(OFST-2,sp)
1462  0221 7d            	tnz	(x)
1463  0222 271b          	jreq	L513
1464                     ; 452        	if(((*c) <0x10)&&(Get_tmain <CON_TMAIN_160)) (*so) =2;
1466  0224 1e0f          	ldw	x,(OFST-12,sp)
1467  0226 f6            	ld	a,(x)
1468  0227 a110          	cp	a,#16
1469  0229 240b          	jruge	L523
1471  022b b675          	ld	a,_Get_tmain
1472  022d a1e9          	cp	a,#233
1473  022f 2405          	jruge	L523
1476  0231 1e19          	ldw	x,(OFST-2,sp)
1477  0233 a602          	ld	a,#2
1478  0235 f7            	ld	(x),a
1479  0236               L523:
1480                     ; 453        	if(Get_tmain <CON_TMAIN_140) (*so) =0;		//140  0xDD
1482  0236 b675          	ld	a,_Get_tmain
1483  0238 a1dd          	cp	a,#221
1484  023a 2403          	jruge	L513
1487  023c 1e19          	ldw	x,(OFST-2,sp)
1488  023e 7f            	clr	(x)
1489  023f               L513:
1490                     ; 458        if(Get_tigbt >CON_TIGBT_105)   (*si) =1;
1492  023f b674          	ld	a,_Get_tigbt
1493  0241 a1f6          	cp	a,#246
1494  0243 2507          	jrult	L133
1497  0245 1e13          	ldw	x,(OFST-8,sp)
1498  0247 a601          	ld	a,#1
1499  0249 f7            	ld	(x),a
1501  024a 200e          	jra	L333
1502  024c               L133:
1503                     ; 459      else  if((*si)&&(Get_tigbt <CON_TIGBT_90))  (*si) =0;
1505  024c 1e13          	ldw	x,(OFST-8,sp)
1506  024e 7d            	tnz	(x)
1507  024f 2709          	jreq	L333
1509  0251 b674          	ld	a,_Get_tigbt
1510  0253 a1f0          	cp	a,#240
1511  0255 2403          	jruge	L333
1514  0257 1e13          	ldw	x,(OFST-8,sp)
1515  0259 7f            	clr	(x)
1516  025a               L333:
1517                     ; 461       if(Get_data ==DATA_PAN_NO)  
1519  025a b671          	ld	a,_Get_data
1520  025c a165          	cp	a,#101
1521  025e 265b          	jrne	L733
1522                     ; 463       	(*npan) =5;
1524  0260 1e0d          	ldw	x,(OFST-14,sp)
1525  0262 a605          	ld	a,#5
1526  0264 f7            	ld	(x),a
1527                     ; 464       	if((*time)<3)  (*time)++;
1529  0265 1e17          	ldw	x,(OFST-4,sp)
1530  0267 f6            	ld	a,(x)
1531  0268 a103          	cp	a,#3
1532  026a 2403          	jruge	L143
1535  026c 1e17          	ldw	x,(OFST-4,sp)
1536  026e 7c            	inc	(x)
1537  026f               L143:
1538                     ; 465      	if((*time) >=60)  	
1540  026f 1e17          	ldw	x,(OFST-4,sp)
1541  0271 f6            	ld	a,(x)
1542  0272 a13c          	cp	a,#60
1543  0274 2545          	jrult	L733
1544                     ; 467      		(*time) =60;    	    
1546  0276 1e17          	ldw	x,(OFST-4,sp)
1547  0278 a63c          	ld	a,#60
1548  027a f7            	ld	(x),a
1549                     ; 468      	    	if(index <=1)
1551  027b 7b1c          	ld	a,(OFST+1,sp)
1552  027d a102          	cp	a,#2
1553  027f 2416          	jruge	L543
1554                     ; 470      	          if(flex_L_bz) {if((zone_1_nopan_time >=60)&&(zone_2_nopan_time >=60)) result=1;}
1556  0281 3d44          	tnz	_flex_L_bz
1557  0283 2726          	jreq	L353
1560  0285 b66c          	ld	a,_zone_1_nopan_time
1561  0287 a13c          	cp	a,#60
1562  0289 2520          	jrult	L353
1564  028b b66d          	ld	a,_zone_2_nopan_time
1565  028d a13c          	cp	a,#60
1566  028f 251a          	jrult	L353
1569  0291 a601          	ld	a,#1
1570  0293 6b1b          	ld	(OFST+0,sp),a
1571  0295 2014          	jra	L353
1572  0297               L543:
1573                     ; 474      	    	  if(flex_R_bz) {if((zone_3_nopan_time >=60)&&(zone_4_nopan_time >=60)) result =1;} 
1575  0297 3d45          	tnz	_flex_R_bz
1576  0299 2710          	jreq	L353
1579  029b b66e          	ld	a,_zone_3_nopan_time
1580  029d a13c          	cp	a,#60
1581  029f 250a          	jrult	L353
1583  02a1 b66f          	ld	a,_zone_4_nopan_time
1584  02a3 a13c          	cp	a,#60
1585  02a5 2504          	jrult	L353
1588  02a7 a601          	ld	a,#1
1589  02a9 6b1b          	ld	(OFST+0,sp),a
1590  02ab               L353:
1591                     ; 477      	    if(result)  (*((u8*)(&zone_1_level +index))) =0;
1593  02ab 0d1b          	tnz	(OFST+0,sp)
1594  02ad 2706          	jreq	L163
1597  02af 7b1c          	ld	a,(OFST+1,sp)
1598  02b1 5f            	clrw	x
1599  02b2 97            	ld	xl,a
1600  02b3 6f94          	clr	(_zone_1_level,x)
1601  02b5               L163:
1602                     ; 478      	    flex_deal(index+1);	
1604  02b5 7b1c          	ld	a,(OFST+1,sp)
1605  02b7 4c            	inc	a
1606  02b8 cd0045        	call	_flex_deal
1608  02bb               L733:
1609                     ; 481       if(Get_data ==DATA_PAN_OK) (*time) =0;	
1611  02bb b671          	ld	a,_Get_data
1612  02bd a156          	cp	a,#86
1613  02bf 2603          	jrne	L363
1616  02c1 1e17          	ldw	x,(OFST-4,sp)
1617  02c3 7f            	clr	(x)
1618  02c4               L363:
1619                     ; 482       if(Pause_bz) 	(*time) =0;		
1621  02c4 3dd1          	tnz	_Pause_bz
1622  02c6 2703          	jreq	L563
1625  02c8 1e17          	ldw	x,(OFST-4,sp)
1626  02ca 7f            	clr	(x)
1627  02cb               L563:
1628                     ; 484        if(Get_vol >CON_VOL_270V)    result=0xE1;
1630  02cb b672          	ld	a,_Get_vol
1631  02cd a1b3          	cp	a,#179
1632  02cf 2504          	jrult	L763
1635  02d1 a6e1          	ld	a,#225
1636  02d3 6b1b          	ld	(OFST+0,sp),a
1637  02d5               L763:
1638                     ; 485        if(Get_vol <CON_VOL_160V)    result=0xE2;
1640  02d5 b672          	ld	a,_Get_vol
1641  02d7 a169          	cp	a,#105
1642  02d9 2404          	jruge	L173
1645  02db a6e2          	ld	a,#226
1646  02dd 6b1b          	ld	(OFST+0,sp),a
1647  02df               L173:
1648                     ; 487        if(Get_tigbt >CON_TIGBT_120) result=0xE5;       
1650  02df b674          	ld	a,_Get_tigbt
1651  02e1 a1f9          	cp	a,#249
1652  02e3 2504          	jrult	L373
1655  02e5 a6e5          	ld	a,#229
1656  02e7 6b1b          	ld	(OFST+0,sp),a
1657  02e9               L373:
1658                     ; 488        if(Get_tigbt >CON_NTC_SHORT) result=0xF9;       
1660  02e9 b674          	ld	a,_Get_tigbt
1661  02eb a1fb          	cp	a,#251
1662  02ed 2504          	jrult	L573
1665  02ef a6f9          	ld	a,#249
1666  02f1 6b1b          	ld	(OFST+0,sp),a
1667  02f3               L573:
1668                     ; 489        if(Get_tigbt <CON_NTC_OPEN)  result=0xFA; 
1670  02f3 b674          	ld	a,_Get_tigbt
1671  02f5 a104          	cp	a,#4
1672  02f7 2404          	jruge	L773
1675  02f9 a6fa          	ld	a,#250
1676  02fb 6b1b          	ld	(OFST+0,sp),a
1677  02fd               L773:
1678                     ; 491        if(Get_tmain >CON_TMAIN_220) result=0xE3;       
1680  02fd b675          	ld	a,_Get_tmain
1681  02ff a1f9          	cp	a,#249
1682  0301 2504          	jrult	L104
1685  0303 a6e3          	ld	a,#227
1686  0305 6b1b          	ld	(OFST+0,sp),a
1687  0307               L104:
1688                     ; 492        if(Get_tmain >CON_NTC_SHORT) result=0xF3;       
1690  0307 b675          	ld	a,_Get_tmain
1691  0309 a1fb          	cp	a,#251
1692  030b 2504          	jrult	L304
1695  030d a6f3          	ld	a,#243
1696  030f 6b1b          	ld	(OFST+0,sp),a
1697  0311               L304:
1698                     ; 493        if(Get_tmain <CON_NTC_OPEN)  result=0xF4; 
1700  0311 b675          	ld	a,_Get_tmain
1701  0313 a104          	cp	a,#4
1702  0315 2404          	jruge	L504
1705  0317 a6f4          	ld	a,#244
1706  0319 6b1b          	ld	(OFST+0,sp),a
1707  031b               L504:
1708                     ; 495        if(result)  
1710  031b 0d1b          	tnz	(OFST+0,sp)
1711  031d 2713          	jreq	L704
1712                     ; 497          if((*count)>3) (*err) =result;
1714  031f 1e15          	ldw	x,(OFST-6,sp)
1715  0321 f6            	ld	a,(x)
1716  0322 a104          	cp	a,#4
1717  0324 2507          	jrult	L114
1720  0326 7b1b          	ld	a,(OFST+0,sp)
1721  0328 1e11          	ldw	x,(OFST-10,sp)
1722  032a f7            	ld	(x),a
1724  032b 200b          	jra	L514
1725  032d               L114:
1726                     ; 498        	 else (*count)++;
1728  032d 1e15          	ldw	x,(OFST-6,sp)
1729  032f 7c            	inc	(x)
1730  0330 2006          	jra	L514
1731  0332               L704:
1732                     ; 502        	(*count) =0;
1734  0332 1e15          	ldw	x,(OFST-6,sp)
1735  0334 7f            	clr	(x)
1736                     ; 503        	(*err) =0;
1738  0335 1e11          	ldw	x,(OFST-10,sp)
1739  0337 7f            	clr	(x)
1740  0338               L514:
1741                     ; 505 }
1744  0338 5b1c          	addw	sp,#28
1745  033a 81            	ret
1784                     ; 506 void set_off_power(u8 ADD)
1784                     ; 507 {
1785                     	switch	.text
1786  033b               _set_off_power:
1790                     ; 508 	Add_Status =ADD|DATA_TURN_OFF;		
1792  033b b705          	ld	_Add_Status,a
1793                     ; 509 	cur_no =0x0A;				
1795  033d 350a0007      	mov	_cur_no,#10
1796                     ; 510 	syn_delay =CON_0500;			
1798  0341 35040006      	mov	_syn_delay,#4
1799                     ; 511 	max_pwm =CON_PWM_10us;	
1801  0345 35b00008      	mov	_max_pwm,#176
1802                     ; 513 	comm_asm_deal(); 		
1804  0349 cd0131        	call	_comm_asm_deal
1806                     ; 514 }
1809  034c 81            	ret
1853                     ; 515 u8  zone_x_t_status(u8 level,u8 ton_js)
1853                     ; 516 {
1854                     	switch	.text
1855  034d               _zone_x_t_status:
1857  034d 89            	pushw	x
1858       00000000      OFST:	set	0
1861                     ; 517     if(ton_js >= arr_tiao_on[level-1]) return(0);
1863  034e 9e            	ld	a,xh
1864  034f 5f            	clrw	x
1865  0350 97            	ld	xl,a
1866  0351 5a            	decw	x
1867  0352 d60014        	ld	a,(_arr_tiao_on,x)
1868  0355 1102          	cp	a,(OFST+2,sp)
1869  0357 2203          	jrugt	L754
1872  0359 4f            	clr	a
1874  035a 2002          	jra	L23
1875  035c               L754:
1876                     ; 518   	else  return(1);
1878  035c a601          	ld	a,#1
1880  035e               L23:
1882  035e 85            	popw	x
1883  035f 81            	ret
1935                     ; 520 u8  syn_deal(u8 par,u8 pwm)
1935                     ; 521 {
1936                     	switch	.text
1937  0360               _syn_deal:
1939  0360 89            	pushw	x
1940  0361 88            	push	a
1941       00000001      OFST:	set	1
1944                     ; 522    u8 data =CON_0750;				
1946  0362 a606          	ld	a,#6
1947  0364 6b01          	ld	(OFST+0,sp),a
1948                     ; 523    if(pwm >CON_PWM_23us)  data =CON_0250;	//23us(72)
1950  0366 9f            	ld	a,xl
1951  0367 a149          	cp	a,#73
1952  0369 2504          	jrult	L115
1955  036b a602          	ld	a,#2
1956  036d 6b01          	ld	(OFST+0,sp),a
1957  036f               L115:
1958                     ; 524    if(pwm >CON_PWM_21us)  data =CON_0375;	//21us(88)
1960  036f 7b03          	ld	a,(OFST+2,sp)
1961  0371 a159          	cp	a,#89
1962  0373 2504          	jrult	L315
1965  0375 a603          	ld	a,#3
1966  0377 6b01          	ld	(OFST+0,sp),a
1967  0379               L315:
1968                     ; 525    if(pwm >CON_PWM_19us)  data =CON_0500;	//19us(104)
1970  0379 7b03          	ld	a,(OFST+2,sp)
1971  037b a169          	cp	a,#105
1972  037d 2504          	jrult	L515
1975  037f a604          	ld	a,#4
1976  0381 6b01          	ld	(OFST+0,sp),a
1977  0383               L515:
1978                     ; 526    if(pwm >CON_PWM_17us)  data =CON_0625;	//17us(120)
1980  0383 7b03          	ld	a,(OFST+2,sp)
1981  0385 a179          	cp	a,#121
1982  0387 2504          	jrult	L715
1985  0389 a605          	ld	a,#5
1986  038b 6b01          	ld	(OFST+0,sp),a
1987  038d               L715:
1988                     ; 528     if(data >0x30)   data =0x30;     				//00xx xxxx  low 6bits is active
1990  038d 7b01          	ld	a,(OFST+0,sp)
1991  038f a131          	cp	a,#49
1992  0391 2504          	jrult	L125
1995  0393 a630          	ld	a,#48
1996  0395 6b01          	ld	(OFST+0,sp),a
1997  0397               L125:
1998                     ; 529     return(data);
2000  0397 7b01          	ld	a,(OFST+0,sp)
2003  0399 5b03          	addw	sp,#3
2004  039b 81            	ret
2193                     ; 531 void comm_deal(u8 index,u8 add,u8 level,u8 limit_t,u8 err)
2193                     ; 532 {
2194                     	switch	.text
2195  039c               _comm_deal:
2197  039c 89            	pushw	x
2198  039d 5210          	subw	sp,#16
2199       00000010      OFST:	set	16
2202                     ; 533   u8 temp_pwm =0;
2204  039f 0f0e          	clr	(OFST-2,sp)
2205                     ; 534   u8 heat_status =0;
2207  03a1 7b0b          	ld	a,(OFST-5,sp)
2208  03a3 97            	ld	xl,a
2209                     ; 536         u8 *o =&oil_high_1 +index;
2211  03a4 a604          	ld	a,#high(_oil_high_1)
2212  03a6 97            	ld	xl,a
2213  03a7 a604          	ld	a,#low(_oil_high_1)
2214  03a9 1b11          	add	a,(OFST+1,sp)
2215  03ab 2401          	jrnc	L04
2216  03ad 5c            	incw	x
2217  03ae               L04:
2218  03ae 02            	rlwa	x,a
2219  03af 1f07          	ldw	(OFST-9,sp),x
2220  03b1 01            	rrwa	x,a
2221                     ; 537         u8 *i =&igbt_high_1+index;
2223  03b2 a608          	ld	a,#high(_igbt_high_1)
2224  03b4 97            	ld	xl,a
2225  03b5 a608          	ld	a,#low(_igbt_high_1)
2226  03b7 1b11          	add	a,(OFST+1,sp)
2227  03b9 2401          	jrnc	L24
2228  03bb 5c            	incw	x
2229  03bc               L24:
2230  03bc 02            	rlwa	x,a
2231  03bd 1f01          	ldw	(OFST-15,sp),x
2232  03bf 01            	rrwa	x,a
2233                     ; 538         u8 *t =&tiao_on_1+index;
2235  03c0 a600          	ld	a,#high(_tiao_on_1)
2236  03c2 97            	ld	xl,a
2237  03c3 a600          	ld	a,#low(_tiao_on_1)
2238  03c5 1b11          	add	a,(OFST+1,sp)
2239  03c7 2401          	jrnc	L44
2240  03c9 5c            	incw	x
2241  03ca               L44:
2242  03ca 02            	rlwa	x,a
2243  03cb 1f0f          	ldw	(OFST-1,sp),x
2244  03cd 01            	rrwa	x,a
2245                     ; 539         u8 *pwm =&pwm_temp_1+index;
2247  03ce 7b11          	ld	a,(OFST+1,sp)
2248  03d0 abc3          	add	a,#_pwm_temp_1
2249  03d2 5f            	clrw	x
2250  03d3 97            	ld	xl,a
2251  03d4 1f0c          	ldw	(OFST-4,sp),x
2252                     ; 540         u8 *g =&ppg_1+index;
2254  03d6 7b11          	ld	a,(OFST+1,sp)
2255  03d8 abbb          	add	a,#_ppg_1
2256  03da 5f            	clrw	x
2257  03db 97            	ld	xl,a
2258  03dc 1f09          	ldw	(OFST-7,sp),x
2259                     ; 541         u16 *tw =&work_1_time+index;
2261  03de 7b11          	ld	a,(OFST+1,sp)
2262  03e0 5f            	clrw	x
2263  03e1 97            	ld	xl,a
2264  03e2 58            	sllw	x
2265  03e3 01            	rrwa	x,a
2266  03e4 ab8a          	add	a,#_work_1_time
2267  03e6 2401          	jrnc	L64
2268  03e8 5c            	incw	x
2269  03e9               L64:
2270  03e9 5f            	clrw	x
2271  03ea 97            	ld	xl,a
2272  03eb 1f03          	ldw	(OFST-13,sp),x
2273                     ; 542         u8 *npan =&zone_1_nopan_wait+index;
2275  03ed a610          	ld	a,#high(_zone_1_nopan_wait)
2276  03ef 97            	ld	xl,a
2277  03f0 a610          	ld	a,#low(_zone_1_nopan_wait)
2278  03f2 1b11          	add	a,(OFST+1,sp)
2279  03f4 2401          	jrnc	L05
2280  03f6 5c            	incw	x
2281  03f7               L05:
2282  03f7 02            	rlwa	x,a
2283  03f8 1f05          	ldw	(OFST-11,sp),x
2284  03fa 01            	rrwa	x,a
2285                     ; 544        if((limit_time >2400)&&(level >5)&&(level <10)) level =5;  // if(limit_time >2400) level =5;
2287  03fb be92          	ldw	x,_limit_time
2288  03fd a30961        	cpw	x,#2401
2289  0400 2510          	jrult	L526
2291  0402 7b15          	ld	a,(OFST+5,sp)
2292  0404 a106          	cp	a,#6
2293  0406 250a          	jrult	L526
2295  0408 7b15          	ld	a,(OFST+5,sp)
2296  040a a10a          	cp	a,#10
2297  040c 2404          	jruge	L526
2300  040e a605          	ld	a,#5
2301  0410 6b15          	ld	(OFST+5,sp),a
2302  0412               L526:
2303                     ; 546   if(err)  {set_off_power(add);(*t) =0;}	//issue of "E5->U->9"
2305  0412 0d17          	tnz	(OFST+7,sp)
2306  0414 270c          	jreq	L726
2309  0416 7b12          	ld	a,(OFST+2,sp)
2310  0418 cd033b        	call	_set_off_power
2314  041b 1e0f          	ldw	x,(OFST-1,sp)
2315  041d 7f            	clr	(x)
2317  041e ac5e085e      	jpf	L136
2318  0422               L726:
2319                     ; 549   if(level ==0)  set_off_power(add);
2321  0422 0d15          	tnz	(OFST+5,sp)
2322  0424 2609          	jrne	L336
2325  0426 7b12          	ld	a,(OFST+2,sp)
2326  0428 cd033b        	call	_set_off_power
2329  042b ac5e085e      	jpf	L136
2330  042f               L336:
2331                     ; 552 	Add_Status =add|DATA_TURN_ON|DATA_PULSE;		                     
2333  042f 7b12          	ld	a,(OFST+2,sp)
2334  0431 aa10          	or	a,#16
2335  0433 aa05          	or	a,#5
2336  0435 b705          	ld	_Add_Status,a
2337                     ; 554 		if(*o) level =(*o);
2339  0437 1e07          	ldw	x,(OFST-9,sp)
2340  0439 7d            	tnz	(x)
2341  043a 2705          	jreq	L736
2344  043c 1e07          	ldw	x,(OFST-9,sp)
2345  043e f6            	ld	a,(x)
2346  043f 6b15          	ld	(OFST+5,sp),a
2347  0441               L736:
2348                     ; 555 		if(*i) level =3;
2350  0441 1e01          	ldw	x,(OFST-15,sp)
2351  0443 7d            	tnz	(x)
2352  0444 2704          	jreq	L146
2355  0446 a603          	ld	a,#3
2356  0448 6b15          	ld	(OFST+5,sp),a
2357  044a               L146:
2358                     ; 557 	heat_status =1;
2360  044a a601          	ld	a,#1
2361  044c 6b0b          	ld	(OFST-5,sp),a
2362                     ; 558 		if(level <7)      
2364  044e 7b15          	ld	a,(OFST+5,sp)
2365  0450 a107          	cp	a,#7
2366  0452 2503          	jrult	L25
2367  0454 cc0602        	jp	L346
2368  0457               L25:
2369                     ; 560 			(*t)++;  
2371  0457 1e0f          	ldw	x,(OFST-1,sp)
2372  0459 7c            	inc	(x)
2373                     ; 561 			heat_status =zone_x_t_status(level,(*t)); 
2375  045a 1e0f          	ldw	x,(OFST-1,sp)
2376  045c f6            	ld	a,(x)
2377  045d 97            	ld	xl,a
2378  045e 7b15          	ld	a,(OFST+5,sp)
2379  0460 95            	ld	xh,a
2380  0461 cd034d        	call	_zone_x_t_status
2382  0464 6b0b          	ld	(OFST-5,sp),a
2383                     ; 563 			Add_Status +=2;		//1-6 detect more smaller pot
2385  0466 3c05          	inc	_Add_Status
2386  0468 3c05          	inc	_Add_Status
2387                     ; 569 			if(index ==0) 	//180mm big
2389  046a 0d11          	tnz	(OFST+1,sp)
2390  046c 2660          	jrne	L546
2391                     ; 571 				if(level ==1)  {if((*t)>=42) (*t) =0;}    //  50w
2393  046e 7b15          	ld	a,(OFST+5,sp)
2394  0470 a101          	cp	a,#1
2395  0472 260a          	jrne	L746
2398  0474 1e0f          	ldw	x,(OFST-1,sp)
2399  0476 f6            	ld	a,(x)
2400  0477 a12a          	cp	a,#42
2401  0479 2503          	jrult	L746
2404  047b 1e0f          	ldw	x,(OFST-1,sp)
2405  047d 7f            	clr	(x)
2406  047e               L746:
2407                     ; 572 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
2409  047e 7b15          	ld	a,(OFST+5,sp)
2410  0480 a102          	cp	a,#2
2411  0482 260a          	jrne	L356
2414  0484 1e0f          	ldw	x,(OFST-1,sp)
2415  0486 f6            	ld	a,(x)
2416  0487 a11e          	cp	a,#30
2417  0489 2503          	jrult	L356
2420  048b 1e0f          	ldw	x,(OFST-1,sp)
2421  048d 7f            	clr	(x)
2422  048e               L356:
2423                     ; 573 				if(level ==3)  {if((*t)>=25) (*t) =0;}    // 200w
2425  048e 7b15          	ld	a,(OFST+5,sp)
2426  0490 a103          	cp	a,#3
2427  0492 260a          	jrne	L756
2430  0494 1e0f          	ldw	x,(OFST-1,sp)
2431  0496 f6            	ld	a,(x)
2432  0497 a119          	cp	a,#25
2433  0499 2503          	jrult	L756
2436  049b 1e0f          	ldw	x,(OFST-1,sp)
2437  049d 7f            	clr	(x)
2438  049e               L756:
2439                     ; 574 				if(level ==4)  {if((*t)>=24) (*t) =0;}    // 300w
2441  049e 7b15          	ld	a,(OFST+5,sp)
2442  04a0 a104          	cp	a,#4
2443  04a2 260a          	jrne	L366
2446  04a4 1e0f          	ldw	x,(OFST-1,sp)
2447  04a6 f6            	ld	a,(x)
2448  04a7 a118          	cp	a,#24
2449  04a9 2503          	jrult	L366
2452  04ab 1e0f          	ldw	x,(OFST-1,sp)
2453  04ad 7f            	clr	(x)
2454  04ae               L366:
2455                     ; 575 				if(level ==5)  {if((*t)>=13) (*t) =0;}    // 600w
2457  04ae 7b15          	ld	a,(OFST+5,sp)
2458  04b0 a105          	cp	a,#5
2459  04b2 260a          	jrne	L766
2462  04b4 1e0f          	ldw	x,(OFST-1,sp)
2463  04b6 f6            	ld	a,(x)
2464  04b7 a10d          	cp	a,#13
2465  04b9 2503          	jrult	L766
2468  04bb 1e0f          	ldw	x,(OFST-1,sp)
2469  04bd 7f            	clr	(x)
2470  04be               L766:
2471                     ; 576 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
2473  04be 7b15          	ld	a,(OFST+5,sp)
2474  04c0 a106          	cp	a,#6
2475  04c2 260a          	jrne	L546
2478  04c4 1e0f          	ldw	x,(OFST-1,sp)
2479  04c6 f6            	ld	a,(x)
2480  04c7 a10b          	cp	a,#11
2481  04c9 2503          	jrult	L546
2484  04cb 1e0f          	ldw	x,(OFST-1,sp)
2485  04cd 7f            	clr	(x)
2486  04ce               L546:
2487                     ; 578 			if(index ==1)	//180mm small
2489  04ce 7b11          	ld	a,(OFST+1,sp)
2490  04d0 a101          	cp	a,#1
2491  04d2 2660          	jrne	L776
2492                     ; 580 				if(level ==1)  {if((*t)>=42) (*t) =0;}    //  50w
2494  04d4 7b15          	ld	a,(OFST+5,sp)
2495  04d6 a101          	cp	a,#1
2496  04d8 260a          	jrne	L107
2499  04da 1e0f          	ldw	x,(OFST-1,sp)
2500  04dc f6            	ld	a,(x)
2501  04dd a12a          	cp	a,#42
2502  04df 2503          	jrult	L107
2505  04e1 1e0f          	ldw	x,(OFST-1,sp)
2506  04e3 7f            	clr	(x)
2507  04e4               L107:
2508                     ; 581 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
2510  04e4 7b15          	ld	a,(OFST+5,sp)
2511  04e6 a102          	cp	a,#2
2512  04e8 260a          	jrne	L507
2515  04ea 1e0f          	ldw	x,(OFST-1,sp)
2516  04ec f6            	ld	a,(x)
2517  04ed a11e          	cp	a,#30
2518  04ef 2503          	jrult	L507
2521  04f1 1e0f          	ldw	x,(OFST-1,sp)
2522  04f3 7f            	clr	(x)
2523  04f4               L507:
2524                     ; 582 				if(level ==3)  {if((*t)>=20) (*t) =0;}    // 200w
2526  04f4 7b15          	ld	a,(OFST+5,sp)
2527  04f6 a103          	cp	a,#3
2528  04f8 260a          	jrne	L117
2531  04fa 1e0f          	ldw	x,(OFST-1,sp)
2532  04fc f6            	ld	a,(x)
2533  04fd a114          	cp	a,#20
2534  04ff 2503          	jrult	L117
2537  0501 1e0f          	ldw	x,(OFST-1,sp)
2538  0503 7f            	clr	(x)
2539  0504               L117:
2540                     ; 583 				if(level ==4)  {if((*t)>=18) (*t) =0;}    // 300w
2542  0504 7b15          	ld	a,(OFST+5,sp)
2543  0506 a104          	cp	a,#4
2544  0508 260a          	jrne	L517
2547  050a 1e0f          	ldw	x,(OFST-1,sp)
2548  050c f6            	ld	a,(x)
2549  050d a112          	cp	a,#18
2550  050f 2503          	jrult	L517
2553  0511 1e0f          	ldw	x,(OFST-1,sp)
2554  0513 7f            	clr	(x)
2555  0514               L517:
2556                     ; 584 				if(level ==5)  {if((*t)>=11) (*t) =0;}    // 600w
2558  0514 7b15          	ld	a,(OFST+5,sp)
2559  0516 a105          	cp	a,#5
2560  0518 260a          	jrne	L127
2563  051a 1e0f          	ldw	x,(OFST-1,sp)
2564  051c f6            	ld	a,(x)
2565  051d a10b          	cp	a,#11
2566  051f 2503          	jrult	L127
2569  0521 1e0f          	ldw	x,(OFST-1,sp)
2570  0523 7f            	clr	(x)
2571  0524               L127:
2572                     ; 585 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
2574  0524 7b15          	ld	a,(OFST+5,sp)
2575  0526 a106          	cp	a,#6
2576  0528 260a          	jrne	L776
2579  052a 1e0f          	ldw	x,(OFST-1,sp)
2580  052c f6            	ld	a,(x)
2581  052d a10b          	cp	a,#11
2582  052f 2503          	jrult	L776
2585  0531 1e0f          	ldw	x,(OFST-1,sp)
2586  0533 7f            	clr	(x)
2587  0534               L776:
2588                     ; 587 			if(index ==2)	//180mm
2590  0534 7b11          	ld	a,(OFST+1,sp)
2591  0536 a102          	cp	a,#2
2592  0538 2660          	jrne	L137
2593                     ; 589 				if(level ==1)  {if((*t)>=42) (*t) =0;}    //  50w
2595  053a 7b15          	ld	a,(OFST+5,sp)
2596  053c a101          	cp	a,#1
2597  053e 260a          	jrne	L337
2600  0540 1e0f          	ldw	x,(OFST-1,sp)
2601  0542 f6            	ld	a,(x)
2602  0543 a12a          	cp	a,#42
2603  0545 2503          	jrult	L337
2606  0547 1e0f          	ldw	x,(OFST-1,sp)
2607  0549 7f            	clr	(x)
2608  054a               L337:
2609                     ; 590 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
2611  054a 7b15          	ld	a,(OFST+5,sp)
2612  054c a102          	cp	a,#2
2613  054e 260a          	jrne	L737
2616  0550 1e0f          	ldw	x,(OFST-1,sp)
2617  0552 f6            	ld	a,(x)
2618  0553 a11e          	cp	a,#30
2619  0555 2503          	jrult	L737
2622  0557 1e0f          	ldw	x,(OFST-1,sp)
2623  0559 7f            	clr	(x)
2624  055a               L737:
2625                     ; 591 				if(level ==3)  {if((*t)>=26) (*t) =0;}    // 200w
2627  055a 7b15          	ld	a,(OFST+5,sp)
2628  055c a103          	cp	a,#3
2629  055e 260a          	jrne	L347
2632  0560 1e0f          	ldw	x,(OFST-1,sp)
2633  0562 f6            	ld	a,(x)
2634  0563 a11a          	cp	a,#26
2635  0565 2503          	jrult	L347
2638  0567 1e0f          	ldw	x,(OFST-1,sp)
2639  0569 7f            	clr	(x)
2640  056a               L347:
2641                     ; 592 				if(level ==4)  {if((*t)>=23) (*t) =0;}    // 300w
2643  056a 7b15          	ld	a,(OFST+5,sp)
2644  056c a104          	cp	a,#4
2645  056e 260a          	jrne	L747
2648  0570 1e0f          	ldw	x,(OFST-1,sp)
2649  0572 f6            	ld	a,(x)
2650  0573 a117          	cp	a,#23
2651  0575 2503          	jrult	L747
2654  0577 1e0f          	ldw	x,(OFST-1,sp)
2655  0579 7f            	clr	(x)
2656  057a               L747:
2657                     ; 593 				if(level ==5)  {if((*t)>=13) (*t) =0;}    // 600w
2659  057a 7b15          	ld	a,(OFST+5,sp)
2660  057c a105          	cp	a,#5
2661  057e 260a          	jrne	L357
2664  0580 1e0f          	ldw	x,(OFST-1,sp)
2665  0582 f6            	ld	a,(x)
2666  0583 a10d          	cp	a,#13
2667  0585 2503          	jrult	L357
2670  0587 1e0f          	ldw	x,(OFST-1,sp)
2671  0589 7f            	clr	(x)
2672  058a               L357:
2673                     ; 594 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
2675  058a 7b15          	ld	a,(OFST+5,sp)
2676  058c a106          	cp	a,#6
2677  058e 260a          	jrne	L137
2680  0590 1e0f          	ldw	x,(OFST-1,sp)
2681  0592 f6            	ld	a,(x)
2682  0593 a10b          	cp	a,#11
2683  0595 2503          	jrult	L137
2686  0597 1e0f          	ldw	x,(OFST-1,sp)
2687  0599 7f            	clr	(x)
2688  059a               L137:
2689                     ; 596 			if(index ==3)	//180mm small
2691  059a 7b11          	ld	a,(OFST+1,sp)
2692  059c a103          	cp	a,#3
2693  059e 2665          	jrne	L5101
2694                     ; 598 				if(level ==1)  {if((*t)>=42) (*t) =0;}    //  50w
2696  05a0 7b15          	ld	a,(OFST+5,sp)
2697  05a2 a101          	cp	a,#1
2698  05a4 260a          	jrne	L567
2701  05a6 1e0f          	ldw	x,(OFST-1,sp)
2702  05a8 f6            	ld	a,(x)
2703  05a9 a12a          	cp	a,#42
2704  05ab 2503          	jrult	L567
2707  05ad 1e0f          	ldw	x,(OFST-1,sp)
2708  05af 7f            	clr	(x)
2709  05b0               L567:
2710                     ; 599 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
2712  05b0 7b15          	ld	a,(OFST+5,sp)
2713  05b2 a102          	cp	a,#2
2714  05b4 260a          	jrne	L177
2717  05b6 1e0f          	ldw	x,(OFST-1,sp)
2718  05b8 f6            	ld	a,(x)
2719  05b9 a11e          	cp	a,#30
2720  05bb 2503          	jrult	L177
2723  05bd 1e0f          	ldw	x,(OFST-1,sp)
2724  05bf 7f            	clr	(x)
2725  05c0               L177:
2726                     ; 600 				if(level ==3)  {if((*t)>=20) (*t) =0;}    // 200w
2728  05c0 7b15          	ld	a,(OFST+5,sp)
2729  05c2 a103          	cp	a,#3
2730  05c4 260a          	jrne	L577
2733  05c6 1e0f          	ldw	x,(OFST-1,sp)
2734  05c8 f6            	ld	a,(x)
2735  05c9 a114          	cp	a,#20
2736  05cb 2503          	jrult	L577
2739  05cd 1e0f          	ldw	x,(OFST-1,sp)
2740  05cf 7f            	clr	(x)
2741  05d0               L577:
2742                     ; 601 				if(level ==4)  {if((*t)>=18) (*t) =0;}    // 300w
2744  05d0 7b15          	ld	a,(OFST+5,sp)
2745  05d2 a104          	cp	a,#4
2746  05d4 260a          	jrne	L1001
2749  05d6 1e0f          	ldw	x,(OFST-1,sp)
2750  05d8 f6            	ld	a,(x)
2751  05d9 a112          	cp	a,#18
2752  05db 2503          	jrult	L1001
2755  05dd 1e0f          	ldw	x,(OFST-1,sp)
2756  05df 7f            	clr	(x)
2757  05e0               L1001:
2758                     ; 602 				if(level ==5)  {if((*t)>=11) (*t) =0;}    // 600w
2760  05e0 7b15          	ld	a,(OFST+5,sp)
2761  05e2 a105          	cp	a,#5
2762  05e4 260a          	jrne	L5001
2765  05e6 1e0f          	ldw	x,(OFST-1,sp)
2766  05e8 f6            	ld	a,(x)
2767  05e9 a10b          	cp	a,#11
2768  05eb 2503          	jrult	L5001
2771  05ed 1e0f          	ldw	x,(OFST-1,sp)
2772  05ef 7f            	clr	(x)
2773  05f0               L5001:
2774                     ; 603 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
2776  05f0 7b15          	ld	a,(OFST+5,sp)
2777  05f2 a106          	cp	a,#6
2778  05f4 260f          	jrne	L5101
2781  05f6 1e0f          	ldw	x,(OFST-1,sp)
2782  05f8 f6            	ld	a,(x)
2783  05f9 a10b          	cp	a,#11
2784  05fb 2508          	jrult	L5101
2787  05fd 1e0f          	ldw	x,(OFST-1,sp)
2788  05ff 7f            	clr	(x)
2789  0600 2003          	jra	L5101
2790  0602               L346:
2791                     ; 607 		else  (*t) =0;
2793  0602 1e0f          	ldw	x,(OFST-1,sp)
2794  0604 7f            	clr	(x)
2795  0605               L5101:
2796                     ; 609 	if(heat_status ==0) set_off_power(add);
2798  0605 0d0b          	tnz	(OFST-5,sp)
2799  0607 2609          	jrne	L7101
2802  0609 7b12          	ld	a,(OFST+2,sp)
2803  060b cd033b        	call	_set_off_power
2806  060e ac5e085e      	jpf	L136
2807  0612               L7101:
2808                     ; 612 		index++;
2810  0612 0c11          	inc	(OFST+1,sp)
2811                     ; 614 		if(level >=7)
2813  0614 7b15          	ld	a,(OFST+5,sp)
2814  0616 a107          	cp	a,#7
2815  0618 2403          	jruge	L45
2816  061a cc077d        	jp	L3201
2817  061d               L45:
2818                     ; 616 		   if(index ==1)		
2820  061d 7b11          	ld	a,(OFST+1,sp)
2821  061f a101          	cp	a,#1
2822  0621 2642          	jrne	L5201
2823                     ; 618 		   		temp_pwm =arr_1_pow[level-7];  
2825  0623 7b15          	ld	a,(OFST+5,sp)
2826  0625 5f            	clrw	x
2827  0626 97            	ld	xl,a
2828  0627 1d0007        	subw	x,#7
2829  062a d60025        	ld	a,(_arr_1_pow,x)
2830  062d 6b0e          	ld	(OFST-2,sp),a
2831                     ; 619 		   		if(flex_L_bz)  {temp_pwm =arr_flex_b[level-5];Add_Status +=2;}	//felx detect pulse++	
2833  062f 3d44          	tnz	_flex_L_bz
2834  0631 2710          	jreq	L7201
2837  0633 7b15          	ld	a,(OFST+5,sp)
2838  0635 5f            	clrw	x
2839  0636 97            	ld	xl,a
2840  0637 1d0005        	subw	x,#5
2841  063a d60042        	ld	a,(_arr_flex_b,x)
2842  063d 6b0e          	ld	(OFST-2,sp),a
2845  063f 3c05          	inc	_Add_Status
2846  0641 3c05          	inc	_Add_Status
2847  0643               L7201:
2848                     ; 621 		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
2850  0643 0d16          	tnz	(OFST+6,sp)
2851  0645 270a          	jreq	L1301
2853  0647 7b0e          	ld	a,(OFST-2,sp)
2854  0649 1116          	cp	a,(OFST+6,sp)
2855  064b 2304          	jrule	L1301
2858  064d 7b16          	ld	a,(OFST+6,sp)
2859  064f 6b0e          	ld	(OFST-2,sp),a
2860  0651               L1301:
2861                     ; 622 		   		if((vol_1 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_1-CON_VOL_230V); 
2863  0651 b6ab          	ld	a,_vol_1
2864  0653 a19e          	cp	a,#158
2865  0655 250e          	jrult	L5201
2867  0657 7b0e          	ld	a,(OFST-2,sp)
2868  0659 a158          	cp	a,#88
2869  065b 2408          	jruge	L5201
2872  065d b6ab          	ld	a,_vol_1
2873  065f a097          	sub	a,#151
2874  0661 1b0e          	add	a,(OFST-2,sp)
2875  0663 6b0e          	ld	(OFST-2,sp),a
2876  0665               L5201:
2877                     ; 624 	           if(index ==2)		
2879  0665 7b11          	ld	a,(OFST+1,sp)
2880  0667 a102          	cp	a,#2
2881  0669 2645          	jrne	L5301
2882                     ; 626 	           		temp_pwm =arr_2_pow[level-7];
2884  066b 7b15          	ld	a,(OFST+5,sp)
2885  066d 5f            	clrw	x
2886  066e 97            	ld	xl,a
2887  066f 1d0007        	subw	x,#7
2888  0672 d6002d        	ld	a,(_arr_2_pow,x)
2889  0675 6b0e          	ld	(OFST-2,sp),a
2890                     ; 627 	           		if(flex_L_bz) {temp_pwm =arr_flex_s[level-5];Add_Status +=4;}	//felx detect pulse++
2892  0677 3d44          	tnz	_flex_L_bz
2893  0679 2712          	jreq	L7301
2896  067b 7b15          	ld	a,(OFST+5,sp)
2897  067d 5f            	clrw	x
2898  067e 97            	ld	xl,a
2899  067f 1d0005        	subw	x,#5
2900  0682 d60048        	ld	a,(_arr_flex_s,x)
2901  0685 6b0e          	ld	(OFST-2,sp),a
2904  0687 b605          	ld	a,_Add_Status
2905  0689 ab04          	add	a,#4
2906  068b b705          	ld	_Add_Status,a
2907  068d               L7301:
2908                     ; 629 		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
2910  068d 0d16          	tnz	(OFST+6,sp)
2911  068f 270a          	jreq	L1401
2913  0691 7b0e          	ld	a,(OFST-2,sp)
2914  0693 1116          	cp	a,(OFST+6,sp)
2915  0695 2304          	jrule	L1401
2918  0697 7b16          	ld	a,(OFST+6,sp)
2919  0699 6b0e          	ld	(OFST-2,sp),a
2920  069b               L1401:
2921                     ; 630 		   		if((vol_2 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_2-CON_VOL_230V)*2;
2923  069b b6ac          	ld	a,_vol_2
2924  069d a19e          	cp	a,#158
2925  069f 250f          	jrult	L5301
2927  06a1 7b0e          	ld	a,(OFST-2,sp)
2928  06a3 a18f          	cp	a,#143
2929  06a5 2409          	jruge	L5301
2932  06a7 b6ac          	ld	a,_vol_2
2933  06a9 48            	sll	a
2934  06aa a02e          	sub	a,#46
2935  06ac 1b0e          	add	a,(OFST-2,sp)
2936  06ae 6b0e          	ld	(OFST-2,sp),a
2937  06b0               L5301:
2938                     ; 632 	           if(index ==3)		
2940  06b0 7b11          	ld	a,(OFST+1,sp)
2941  06b2 a103          	cp	a,#3
2942  06b4 2642          	jrne	L5401
2943                     ; 634 	           		temp_pwm =arr_3_pow[level-7];
2945  06b6 7b15          	ld	a,(OFST+5,sp)
2946  06b8 5f            	clrw	x
2947  06b9 97            	ld	xl,a
2948  06ba 1d0007        	subw	x,#7
2949  06bd d60029        	ld	a,(_arr_3_pow,x)
2950  06c0 6b0e          	ld	(OFST-2,sp),a
2951                     ; 635 	           		if(flex_R_bz)  {temp_pwm =arr_flex_b[level-5];Add_Status +=2;}	//felx detect pulse++
2953  06c2 3d45          	tnz	_flex_R_bz
2954  06c4 2710          	jreq	L7401
2957  06c6 7b15          	ld	a,(OFST+5,sp)
2958  06c8 5f            	clrw	x
2959  06c9 97            	ld	xl,a
2960  06ca 1d0005        	subw	x,#5
2961  06cd d60042        	ld	a,(_arr_flex_b,x)
2962  06d0 6b0e          	ld	(OFST-2,sp),a
2965  06d2 3c05          	inc	_Add_Status
2966  06d4 3c05          	inc	_Add_Status
2967  06d6               L7401:
2968                     ; 637 		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
2970  06d6 0d16          	tnz	(OFST+6,sp)
2971  06d8 270a          	jreq	L1501
2973  06da 7b0e          	ld	a,(OFST-2,sp)
2974  06dc 1116          	cp	a,(OFST+6,sp)
2975  06de 2304          	jrule	L1501
2978  06e0 7b16          	ld	a,(OFST+6,sp)
2979  06e2 6b0e          	ld	(OFST-2,sp),a
2980  06e4               L1501:
2981                     ; 638 		   		if((vol_3 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_3-CON_VOL_230V);
2983  06e4 b6ad          	ld	a,_vol_3
2984  06e6 a19e          	cp	a,#158
2985  06e8 250e          	jrult	L5401
2987  06ea 7b0e          	ld	a,(OFST-2,sp)
2988  06ec a158          	cp	a,#88
2989  06ee 2408          	jruge	L5401
2992  06f0 b6ad          	ld	a,_vol_3
2993  06f2 a097          	sub	a,#151
2994  06f4 1b0e          	add	a,(OFST-2,sp)
2995  06f6 6b0e          	ld	(OFST-2,sp),a
2996  06f8               L5401:
2997                     ; 640 	           if(index ==4)		
2999  06f8 7b11          	ld	a,(OFST+1,sp)
3000  06fa a104          	cp	a,#4
3001  06fc 2645          	jrne	L5501
3002                     ; 642 	           		temp_pwm =arr_4_pow[level-7];
3004  06fe 7b15          	ld	a,(OFST+5,sp)
3005  0700 5f            	clrw	x
3006  0701 97            	ld	xl,a
3007  0702 1d0007        	subw	x,#7
3008  0705 d60031        	ld	a,(_arr_4_pow,x)
3009  0708 6b0e          	ld	(OFST-2,sp),a
3010                     ; 643 	           		if(flex_R_bz)  {temp_pwm =arr_flex_s[level-5];Add_Status +=4;}	//felx detect pulse++	
3012  070a 3d45          	tnz	_flex_R_bz
3013  070c 2712          	jreq	L7501
3016  070e 7b15          	ld	a,(OFST+5,sp)
3017  0710 5f            	clrw	x
3018  0711 97            	ld	xl,a
3019  0712 1d0005        	subw	x,#5
3020  0715 d60048        	ld	a,(_arr_flex_s,x)
3021  0718 6b0e          	ld	(OFST-2,sp),a
3024  071a b605          	ld	a,_Add_Status
3025  071c ab04          	add	a,#4
3026  071e b705          	ld	_Add_Status,a
3027  0720               L7501:
3028                     ; 645 		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
3030  0720 0d16          	tnz	(OFST+6,sp)
3031  0722 270a          	jreq	L1601
3033  0724 7b0e          	ld	a,(OFST-2,sp)
3034  0726 1116          	cp	a,(OFST+6,sp)
3035  0728 2304          	jrule	L1601
3038  072a 7b16          	ld	a,(OFST+6,sp)
3039  072c 6b0e          	ld	(OFST-2,sp),a
3040  072e               L1601:
3041                     ; 646 		   		if((vol_4 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_4-CON_VOL_230V)*2;
3043  072e b6ae          	ld	a,_vol_4
3044  0730 a19e          	cp	a,#158
3045  0732 250f          	jrult	L5501
3047  0734 7b0e          	ld	a,(OFST-2,sp)
3048  0736 a18f          	cp	a,#143
3049  0738 2409          	jruge	L5501
3052  073a b6ae          	ld	a,_vol_4
3053  073c 48            	sll	a
3054  073d a02e          	sub	a,#46
3055  073f 1b0e          	add	a,(OFST-2,sp)
3056  0741 6b0e          	ld	(OFST-2,sp),a
3057  0743               L5501:
3058                     ; 650 		   (*pwm) =temp_pwm;
3060  0743 7b0e          	ld	a,(OFST-2,sp)
3061  0745 1e0c          	ldw	x,(OFST-4,sp)
3062  0747 f7            	ld	(x),a
3063                     ; 651 		   cur_no =zone_x_cur_no_set(index,(*g));
3065  0748 1e09          	ldw	x,(OFST-7,sp)
3066  074a f6            	ld	a,(x)
3067  074b 97            	ld	xl,a
3068  074c 7b11          	ld	a,(OFST+1,sp)
3069  074e 95            	ld	xh,a
3070  074f cd0000        	call	_zone_x_cur_no_set
3072  0752 b707          	ld	_cur_no,a
3073                     ; 656 		   if(((*tw)<5)||(*npan))  
3075  0754 1e03          	ldw	x,(OFST-13,sp)
3076  0756 9093          	ldw	y,x
3077  0758 90fe          	ldw	y,(y)
3078  075a 90a30005      	cpw	y,#5
3079  075e 2505          	jrult	L7601
3081  0760 1e05          	ldw	x,(OFST-11,sp)
3082  0762 7d            	tnz	(x)
3083  0763 2749          	jreq	L5701
3084  0765               L7601:
3085                     ; 658 			cur_no =0x10;
3087  0765 35100007      	mov	_cur_no,#16
3088                     ; 659 			if(index%2)  (*pwm) =70;				
3090  0769 7b11          	ld	a,(OFST+1,sp)
3091  076b a501          	bcp	a,#1
3092  076d 2707          	jreq	L1701
3095  076f 1e0c          	ldw	x,(OFST-4,sp)
3096  0771 a646          	ld	a,#70
3097  0773 f7            	ld	(x),a
3099  0774 2038          	jra	L5701
3100  0776               L1701:
3101                     ; 660 			else   (*pwm) =115;
3103  0776 1e0c          	ldw	x,(OFST-4,sp)
3104  0778 a673          	ld	a,#115
3105  077a f7            	ld	(x),a
3106  077b 2031          	jra	L5701
3107  077d               L3201:
3108                     ; 669 		    	(*pwm) =arr_tiao_180_pwm[level-1];
3110  077d 7b15          	ld	a,(OFST+5,sp)
3111  077f 5f            	clrw	x
3112  0780 97            	ld	xl,a
3113  0781 5a            	decw	x
3114  0782 d6001a        	ld	a,(_arr_tiao_180_pwm,x)
3115  0785 1e0c          	ldw	x,(OFST-4,sp)
3116  0787 f7            	ld	(x),a
3117                     ; 671 		    	if((index ==2)||(index ==4)) 	(*pwm) =CON_PWM_11us;	//180mm small 1000w
3119  0788 7b11          	ld	a,(OFST+1,sp)
3120  078a a102          	cp	a,#2
3121  078c 2706          	jreq	L1011
3123  078e 7b11          	ld	a,(OFST+1,sp)
3124  0790 a104          	cp	a,#4
3125  0792 2605          	jrne	L7701
3126  0794               L1011:
3129  0794 1e0c          	ldw	x,(OFST-4,sp)
3130  0796 a6a8          	ld	a,#168
3131  0798 f7            	ld	(x),a
3132  0799               L7701:
3133                     ; 674 		    	if(level ==2)  (*pwm) =erp_pwm[index-1];	    		
3135  0799 7b15          	ld	a,(OFST+5,sp)
3136  079b a102          	cp	a,#2
3137  079d 260b          	jrne	L3011
3140  079f 7b11          	ld	a,(OFST+1,sp)
3141  07a1 5f            	clrw	x
3142  07a2 97            	ld	xl,a
3143  07a3 5a            	decw	x
3144  07a4 d60020        	ld	a,(_erp_pwm,x)
3145  07a7 1e0c          	ldw	x,(OFST-4,sp)
3146  07a9 f7            	ld	(x),a
3147  07aa               L3011:
3148                     ; 676 		    	cur_no =0x10;
3150  07aa 35100007      	mov	_cur_no,#16
3151  07ae               L5701:
3152                     ; 678 		if((index ==1)||(index ==3))  cur_no =cur_no/2;		//1# 3# boost double igbt & current
3154  07ae 7b11          	ld	a,(OFST+1,sp)
3155  07b0 a101          	cp	a,#1
3156  07b2 2706          	jreq	L7011
3158  07b4 7b11          	ld	a,(OFST+1,sp)
3159  07b6 a103          	cp	a,#3
3160  07b8 2602          	jrne	L5011
3161  07ba               L7011:
3164  07ba 3407          	srl	_cur_no
3165  07bc               L5011:
3166                     ; 680 		if((flex_L_bz)&&(index ==1))  
3168  07bc 3d44          	tnz	_flex_L_bz
3169  07be 272e          	jreq	L1111
3171  07c0 7b11          	ld	a,(OFST+1,sp)
3172  07c2 a101          	cp	a,#1
3173  07c4 2628          	jrne	L1111
3174                     ; 682 		   	if(cur_no ==0x10)     cur_no =0x05;
3176  07c6 b607          	ld	a,_cur_no
3177  07c8 a110          	cp	a,#16
3178  07ca 2604          	jrne	L3111
3181  07cc 35050007      	mov	_cur_no,#5
3182  07d0               L3111:
3183                     ; 683 		   	if(cur_no ==0x18)     cur_no =0x09;
3185  07d0 b607          	ld	a,_cur_no
3186  07d2 a118          	cp	a,#24
3187  07d4 2604          	jrne	L5111
3190  07d6 35090007      	mov	_cur_no,#9
3191  07da               L5111:
3192                     ; 684 		   	if(cur_no ==0x1C)     cur_no =0x0E;
3194  07da b607          	ld	a,_cur_no
3195  07dc a11c          	cp	a,#28
3196  07de 2604          	jrne	L7111
3199  07e0 350e0007      	mov	_cur_no,#14
3200  07e4               L7111:
3201                     ; 685 		   	if(cur_no ==0x24)     cur_no =0x12;
3203  07e4 b607          	ld	a,_cur_no
3204  07e6 a124          	cp	a,#36
3205  07e8 2604          	jrne	L1111
3208  07ea 35120007      	mov	_cur_no,#18
3209  07ee               L1111:
3210                     ; 687 		if((flex_L_bz)&&(index ==2))  cur_no -=10;
3212  07ee 3d44          	tnz	_flex_L_bz
3213  07f0 270c          	jreq	L3211
3215  07f2 7b11          	ld	a,(OFST+1,sp)
3216  07f4 a102          	cp	a,#2
3217  07f6 2606          	jrne	L3211
3220  07f8 b607          	ld	a,_cur_no
3221  07fa a00a          	sub	a,#10
3222  07fc b707          	ld	_cur_no,a
3223  07fe               L3211:
3224                     ; 688 		if((flex_R_bz)&&(index ==3))  
3226  07fe 3d45          	tnz	_flex_R_bz
3227  0800 272e          	jreq	L5211
3229  0802 7b11          	ld	a,(OFST+1,sp)
3230  0804 a103          	cp	a,#3
3231  0806 2628          	jrne	L5211
3232                     ; 690 		   	if(cur_no ==0x10)     cur_no =0x05;
3234  0808 b607          	ld	a,_cur_no
3235  080a a110          	cp	a,#16
3236  080c 2604          	jrne	L7211
3239  080e 35050007      	mov	_cur_no,#5
3240  0812               L7211:
3241                     ; 691 		   	if(cur_no ==0x18)     cur_no =0x09;
3243  0812 b607          	ld	a,_cur_no
3244  0814 a118          	cp	a,#24
3245  0816 2604          	jrne	L1311
3248  0818 35090007      	mov	_cur_no,#9
3249  081c               L1311:
3250                     ; 692 		   	if(cur_no ==0x1C)     cur_no =0x0E;
3252  081c b607          	ld	a,_cur_no
3253  081e a11c          	cp	a,#28
3254  0820 2604          	jrne	L3311
3257  0822 350e0007      	mov	_cur_no,#14
3258  0826               L3311:
3259                     ; 693 		   	if(cur_no ==0x24)     cur_no =0x12;
3261  0826 b607          	ld	a,_cur_no
3262  0828 a124          	cp	a,#36
3263  082a 2604          	jrne	L5211
3266  082c 35120007      	mov	_cur_no,#18
3267  0830               L5211:
3268                     ; 695 		if((flex_R_bz)&&(index ==4))  cur_no -=10;
3270  0830 3d45          	tnz	_flex_R_bz
3271  0832 270c          	jreq	L7311
3273  0834 7b11          	ld	a,(OFST+1,sp)
3274  0836 a104          	cp	a,#4
3275  0838 2606          	jrne	L7311
3278  083a b607          	ld	a,_cur_no
3279  083c a00a          	sub	a,#10
3280  083e b707          	ld	_cur_no,a
3281  0840               L7311:
3282                     ; 697                 max_pwm =(*pwm);
3284  0840 1e0c          	ldw	x,(OFST-4,sp)
3285  0842 f6            	ld	a,(x)
3286  0843 b708          	ld	_max_pwm,a
3287                     ; 700 		syn_delay=syn_deal(index,(*g));
3289  0845 1e09          	ldw	x,(OFST-7,sp)
3290  0847 f6            	ld	a,(x)
3291  0848 97            	ld	xl,a
3292  0849 7b11          	ld	a,(OFST+1,sp)
3293  084b 95            	ld	xh,a
3294  084c cd0360        	call	_syn_deal
3296  084f b706          	ld	_syn_delay,a
3297                     ; 703 	       if(level <7)  syn_delay |=0x40;			//bit7 ->1 -> PWM direct setting mode
3299  0851 7b15          	ld	a,(OFST+5,sp)
3300  0853 a107          	cp	a,#7
3301  0855 2404          	jruge	L1411
3304  0857 721c0006      	bset	_syn_delay,#6
3305  085b               L1411:
3306                     ; 705 	       comm_asm_deal();	
3308  085b cd0131        	call	_comm_asm_deal
3310  085e               L136:
3311                     ; 709 } 
3314  085e 5b12          	addw	sp,#18
3315  0860 81            	ret
3368                     ; 710 void Power_off_deal(void)
3368                     ; 711 {
3369                     	switch	.text
3370  0861               _Power_off_deal:
3374                     ; 712  	Power_on_bz =FALSE;
3376  0861 3f1f          	clr	_Power_on_bz
3377                     ; 713  	key_zone =0;
3379  0863 3f35          	clr	_key_zone
3380                     ; 715  	timer_status =0;
3382  0865 3f36          	clr	_timer_status
3383                     ; 716  	time_flash_count =0;
3385  0867 3f37          	clr	_time_flash_count
3386                     ; 717  	zone_flash_count =0;
3388  0869 3f2d          	clr	_zone_flash_count
3389                     ; 719  	boost_status =0;
3391  086b 3f80          	clr	_boost_status
3392                     ; 720  	boost_time_1 =0;
3394  086d 5f            	clrw	x
3395  086e bf3c          	ldw	_boost_time_1,x
3396                     ; 721  	boost_time_2 =0;
3398  0870 5f            	clrw	x
3399  0871 bf3e          	ldw	_boost_time_2,x
3400                     ; 722  	boost_time_3 =0;
3402  0873 5f            	clrw	x
3403  0874 bf40          	ldw	_boost_time_3,x
3404                     ; 723  	boost_time_4 =0;
3406  0876 5f            	clrw	x
3407  0877 bf42          	ldw	_boost_time_4,x
3408                     ; 725  	boost_1_count =0;
3410  0879 725f000c      	clr	_boost_1_count
3411                     ; 726  	boost_2_count =0;
3413  087d 725f000d      	clr	_boost_2_count
3414                     ; 727  	boost_3_count =0;
3416  0881 725f000e      	clr	_boost_3_count
3417                     ; 728  	boost_4_count =0;
3419  0885 725f000f      	clr	_boost_4_count
3420                     ; 730  	zone_1_level =0;
3422  0889 3f94          	clr	_zone_1_level
3423                     ; 731  	zone_2_level =0;
3425  088b 3f95          	clr	_zone_2_level
3426                     ; 732  	zone_3_level =0;
3428  088d 3f96          	clr	_zone_3_level
3429                     ; 733  	zone_4_level =0; 
3431  088f 3f97          	clr	_zone_4_level
3432                     ; 735  	general_timer =0;
3434  0891 3f98          	clr	_general_timer
3435                     ; 736  	flex_L_bz =0;	
3437  0893 3f44          	clr	_flex_L_bz
3438                     ; 737  	flex_R_bz =0;
3440  0895 3f45          	clr	_flex_R_bz
3441                     ; 738  	bbq_L_bz =0;
3443  0897 3f46          	clr	_bbq_L_bz
3444                     ; 739  	bbq_R_bz =0;	
3446  0899 3f47          	clr	_bbq_R_bz
3447                     ; 741  	Warm_status =0;
3449  089b 3fd6          	clr	_Warm_status
3450                     ; 742  	Warm_1_timer =0;
3452  089d 3fd7          	clr	_Warm_1_timer
3453                     ; 743  	Warm_2_timer =0;
3455  089f 3fd8          	clr	_Warm_2_timer
3456                     ; 744  	Warm_3_timer =0;
3458  08a1 3fd9          	clr	_Warm_3_timer
3459                     ; 745  	Warm_4_timer =0;
3461  08a3 3fda          	clr	_Warm_4_timer
3462                     ; 747  	Pause_bz =0;	
3464  08a5 3fd1          	clr	_Pause_bz
3465                     ; 748  	pause_x_timer =0; 	
3467  08a7 3f99          	clr	_pause_x_timer
3468                     ; 749 }
3471  08a9 81            	ret
3523                     ; 750 u8 minium_value(u8 a,u8 b)
3523                     ; 751 {
3524                     	switch	.text
3525  08aa               _minium_value:
3527  08aa 89            	pushw	x
3528  08ab 88            	push	a
3529       00000001      OFST:	set	1
3532                     ; 752 	u8 data =0;
3534  08ac 0f01          	clr	(OFST+0,sp)
3535                     ; 753 	return(Compare_min(a,b,data));
3537  08ae 9e            	ld	a,xh
3538  08af 1103          	cp	a,(OFST+2,sp)
3539  08b1 2207          	jrugt	L26
3540  08b3 9e            	ld	a,xh
3541  08b4 6b01          	ld	(OFST+0,sp),a
3542  08b6 7b01          	ld	a,(OFST+0,sp)
3543  08b8 2005          	jra	L46
3544  08ba               L26:
3545  08ba 9f            	ld	a,xl
3546  08bb 6b01          	ld	(OFST+0,sp),a
3547  08bd 7b01          	ld	a,(OFST+0,sp)
3548  08bf               L46:
3551  08bf 5b03          	addw	sp,#3
3552  08c1 81            	ret
3623                     ; 755 u8 calculate_min(u8 d1,u8 d2,u8 d3,u8 d4)
3623                     ; 756 {
3624                     	switch	.text
3625  08c2               _calculate_min:
3627  08c2 89            	pushw	x
3628  08c3 88            	push	a
3629       00000001      OFST:	set	1
3632                     ; 757    u8 result =0;
3634  08c4 0f01          	clr	(OFST+0,sp)
3635                     ; 759    result =minium_value(d1,d2);
3637  08c6 9f            	ld	a,xl
3638  08c7 97            	ld	xl,a
3639  08c8 7b02          	ld	a,(OFST+1,sp)
3640  08ca 95            	ld	xh,a
3641  08cb addd          	call	_minium_value
3643  08cd 6b01          	ld	(OFST+0,sp),a
3644                     ; 760    result =minium_value(d3,result);
3646  08cf 7b01          	ld	a,(OFST+0,sp)
3647  08d1 97            	ld	xl,a
3648  08d2 7b06          	ld	a,(OFST+5,sp)
3649  08d4 95            	ld	xh,a
3650  08d5 add3          	call	_minium_value
3652  08d7 6b01          	ld	(OFST+0,sp),a
3653                     ; 761    result =minium_value(d4,result);   
3655  08d9 7b01          	ld	a,(OFST+0,sp)
3656  08db 97            	ld	xl,a
3657  08dc 7b07          	ld	a,(OFST+6,sp)
3658  08de 95            	ld	xh,a
3659  08df adc9          	call	_minium_value
3661  08e1 6b01          	ld	(OFST+0,sp),a
3662                     ; 763    if(result ==255) result =0;
3664  08e3 7b01          	ld	a,(OFST+0,sp)
3665  08e5 a1ff          	cp	a,#255
3666  08e7 2602          	jrne	L7321
3669  08e9 0f01          	clr	(OFST+0,sp)
3670  08eb               L7321:
3671                     ; 764    return(result);
3673  08eb 7b01          	ld	a,(OFST+0,sp)
3676  08ed 5b03          	addw	sp,#3
3677  08ef 81            	ret
3720                     	switch	.user
3721  0076               L47:
3722  0076 0900          	dc.w	L1421
3723  0078 0906          	dc.w	L3421
3724  007a 090c          	dc.w	L5421
3725  007c 0912          	dc.w	L7421
3726  007e 0918          	dc.w	L1521
3727  0080 091e          	dc.w	L3521
3728  0082 0924          	dc.w	L5521
3729  0084 092a          	dc.w	L7521
3730  0086 0930          	dc.w	L1621
3731  0088 0936          	dc.w	L3621
3732  008a 093c          	dc.w	L5621
3733  008c 0942          	dc.w	L7621
3734  008e 0948          	dc.w	L1721
3735  0090 094e          	dc.w	L3721
3736  0092 0954          	dc.w	L5721
3737  0094 095a          	dc.w	L7721
3738                     ; 767 u8 Display_decode(u8 In_data)
3738                     ; 768 {
3739                     	switch	.text
3740  08f0               _Display_decode:
3742  08f0 88            	push	a
3743       00000001      OFST:	set	1
3746                     ; 769 	u8 code_data = 0;
3748  08f1 0f01          	clr	(OFST+0,sp)
3749                     ; 770 	switch(In_data)
3752                     ; 787 		case 15: code_data = CHR_F;break;
3753  08f3 a110          	cp	a,#16
3754  08f5 2407          	jruge	L27
3755  08f7 5f            	clrw	x
3756  08f8 97            	ld	xl,a
3757  08f9 58            	sllw	x
3758  08fa de0076        	ldw	x,(L47,x)
3759  08fd fc            	jp	(x)
3760  08fe               L27:
3761  08fe 205e          	jra	L5231
3762  0900               L1421:
3763                     ; 772 		case 0: code_data  = NUM_0;break;
3765  0900 a63f          	ld	a,#63
3766  0902 6b01          	ld	(OFST+0,sp),a
3769  0904 2058          	jra	L5231
3770  0906               L3421:
3771                     ; 773 		case 1: code_data  = NUM_1;break;
3773  0906 a606          	ld	a,#6
3774  0908 6b01          	ld	(OFST+0,sp),a
3777  090a 2052          	jra	L5231
3778  090c               L5421:
3779                     ; 774 		case 2: code_data  = NUM_2;break;
3781  090c a65b          	ld	a,#91
3782  090e 6b01          	ld	(OFST+0,sp),a
3785  0910 204c          	jra	L5231
3786  0912               L7421:
3787                     ; 775 		case 3: code_data  = NUM_3;break;
3789  0912 a64f          	ld	a,#79
3790  0914 6b01          	ld	(OFST+0,sp),a
3793  0916 2046          	jra	L5231
3794  0918               L1521:
3795                     ; 776 		case 4: code_data  = NUM_4;break;
3797  0918 a666          	ld	a,#102
3798  091a 6b01          	ld	(OFST+0,sp),a
3801  091c 2040          	jra	L5231
3802  091e               L3521:
3803                     ; 777 		case 5: code_data  = NUM_5;break;
3805  091e a66d          	ld	a,#109
3806  0920 6b01          	ld	(OFST+0,sp),a
3809  0922 203a          	jra	L5231
3810  0924               L5521:
3811                     ; 778 		case 6: code_data  = NUM_6;break;
3813  0924 a67d          	ld	a,#125
3814  0926 6b01          	ld	(OFST+0,sp),a
3817  0928 2034          	jra	L5231
3818  092a               L7521:
3819                     ; 779 		case 7: code_data  = NUM_7;break;
3821  092a a627          	ld	a,#39
3822  092c 6b01          	ld	(OFST+0,sp),a
3825  092e 202e          	jra	L5231
3826  0930               L1621:
3827                     ; 780 		case 8: code_data  = NUM_8;break;
3829  0930 a67f          	ld	a,#127
3830  0932 6b01          	ld	(OFST+0,sp),a
3833  0934 2028          	jra	L5231
3834  0936               L3621:
3835                     ; 781 		case 9: code_data  = NUM_9;break;
3837  0936 a66f          	ld	a,#111
3838  0938 6b01          	ld	(OFST+0,sp),a
3841  093a 2022          	jra	L5231
3842  093c               L5621:
3843                     ; 782 		case 10: code_data = CHR_A;break;
3845  093c a677          	ld	a,#119
3846  093e 6b01          	ld	(OFST+0,sp),a
3849  0940 201c          	jra	L5231
3850  0942               L7621:
3851                     ; 783 		case 11: code_data = CHR_B;break;
3853  0942 a67c          	ld	a,#124
3854  0944 6b01          	ld	(OFST+0,sp),a
3857  0946 2016          	jra	L5231
3858  0948               L1721:
3859                     ; 784 		case 12: code_data = CHR_C;break;
3861  0948 a658          	ld	a,#88
3862  094a 6b01          	ld	(OFST+0,sp),a
3865  094c 2010          	jra	L5231
3866  094e               L3721:
3867                     ; 785 		case 13: code_data = CHR_D;break;
3869  094e a65e          	ld	a,#94
3870  0950 6b01          	ld	(OFST+0,sp),a
3873  0952 200a          	jra	L5231
3874  0954               L5721:
3875                     ; 786 		case 14: code_data = CHR_E;break;
3877  0954 a679          	ld	a,#121
3878  0956 6b01          	ld	(OFST+0,sp),a
3881  0958 2004          	jra	L5231
3882  095a               L7721:
3883                     ; 787 		case 15: code_data = CHR_F;break;
3885  095a a671          	ld	a,#113
3886  095c 6b01          	ld	(OFST+0,sp),a
3889  095e               L5231:
3890                     ; 789 	 return ((u8)code_data);
3892  095e 7b01          	ld	a,(OFST+0,sp)
3895  0960 5b01          	addw	sp,#1
3896  0962 81            	ret
4035                     ; 791 u8 ON_disp_zone_x(u8 index,u8 BBQ,u8 warm_disp,u8 level,u8 *change,u8 index_f,u8 select,u8 flash,u8 pan,u8 other_pan,u8 err)
4035                     ; 792 {
4036                     	switch	.text
4037  0963               _ON_disp_zone_x:
4039  0963 89            	pushw	x
4040  0964 88            	push	a
4041       00000001      OFST:	set	1
4044                     ; 793    u8 dis_buf =CHR_BLANK;
4046  0965 0f01          	clr	(OFST+0,sp)
4047                     ; 794    if((*change) &select)
4049  0967 1e08          	ldw	x,(OFST+7,sp)
4050  0969 f6            	ld	a,(x)
4051  096a 150b          	bcp	a,(OFST+10,sp)
4052  096c 2713          	jreq	L1241
4053                     ; 796    	if(zone_flash_count %2) dis_buf =CHR_P; 
4055  096e b62d          	ld	a,_zone_flash_count
4056  0970 a501          	bcp	a,#1
4057  0972 2704          	jreq	L3241
4060  0974 a673          	ld	a,#115
4061  0976 6b01          	ld	(OFST+0,sp),a
4062  0978               L3241:
4063                     ; 797    	if(zone_flash_count <6) (*change) =0;
4065  0978 b62d          	ld	a,_zone_flash_count
4066  097a a106          	cp	a,#6
4067  097c 2403          	jruge	L1241
4070  097e 1e08          	ldw	x,(OFST+7,sp)
4071  0980 7f            	clr	(x)
4072  0981               L1241:
4073                     ; 799    if((key_zone != select) || ((zone_flash_count %2)==0)) 
4075  0981 b635          	ld	a,_key_zone
4076  0983 110b          	cp	a,(OFST+10,sp)
4077  0985 2609          	jrne	L1341
4079  0987 b62d          	ld	a,_zone_flash_count
4080  0989 a501          	bcp	a,#1
4081  098b 2703          	jreq	L001
4082  098d cc0a63        	jp	L7241
4083  0990               L001:
4084  0990               L1341:
4085                     ; 801 	if((level)||(warm_disp))    
4087  0990 0d07          	tnz	(OFST+6,sp)
4088  0992 2607          	jrne	L5341
4090  0994 0d06          	tnz	(OFST+5,sp)
4091  0996 2603          	jrne	L201
4092  0998 cc0a20        	jp	L3341
4093  099b               L201:
4094  099b               L5341:
4095                     ; 803                	dis_buf = Display_decode(level);  
4097  099b 7b07          	ld	a,(OFST+6,sp)
4098  099d cd08f0        	call	_Display_decode
4100  09a0 6b01          	ld	(OFST+0,sp),a
4101                     ; 804                	if(level ==10)      dis_buf =CHR_P;  
4103  09a2 7b07          	ld	a,(OFST+6,sp)
4104  09a4 a10a          	cp	a,#10
4105  09a6 2604          	jrne	L7341
4108  09a8 a673          	ld	a,#115
4109  09aa 6b01          	ld	(OFST+0,sp),a
4110  09ac               L7341:
4111                     ; 806                	if(warm_disp) dis_buf =CHR_A;    
4113  09ac 0d06          	tnz	(OFST+5,sp)
4114  09ae 2704          	jreq	L1441
4117  09b0 a677          	ld	a,#119
4118  09b2 6b01          	ld	(OFST+0,sp),a
4119  09b4               L1441:
4120                     ; 808                	if(BBQ)  
4122  09b4 0d03          	tnz	(OFST+2,sp)
4123  09b6 271e          	jreq	L3441
4124                     ; 810                	if((index ==0)||(index ==2))   dis_buf =CHR_B;	
4126  09b8 0d02          	tnz	(OFST+1,sp)
4127  09ba 2706          	jreq	L7441
4129  09bc 7b02          	ld	a,(OFST+1,sp)
4130  09be a102          	cp	a,#2
4131  09c0 2604          	jrne	L5441
4132  09c2               L7441:
4135  09c2 a67c          	ld	a,#124
4136  09c4 6b01          	ld	(OFST+0,sp),a
4137  09c6               L5441:
4138                     ; 811                	if((index ==1)||(index ==3))   dis_buf =CHR_Q;
4140  09c6 7b02          	ld	a,(OFST+1,sp)
4141  09c8 a101          	cp	a,#1
4142  09ca 2706          	jreq	L3541
4144  09cc 7b02          	ld	a,(OFST+1,sp)
4145  09ce a103          	cp	a,#3
4146  09d0 2604          	jrne	L3441
4147  09d2               L3541:
4150  09d2 a667          	ld	a,#103
4151  09d4 6b01          	ld	(OFST+0,sp),a
4152  09d6               L3441:
4153                     ; 814                	if(timer_status & select) 	   dis_buf |=SEG_P;
4155  09d6 b636          	ld	a,_timer_status
4156  09d8 150b          	bcp	a,(OFST+10,sp)
4157  09da 2706          	jreq	L5541
4160  09dc 7b01          	ld	a,(OFST+0,sp)
4161  09de aa80          	or	a,#128
4162  09e0 6b01          	ld	(OFST+0,sp),a
4163  09e2               L5541:
4164                     ; 816 		if(zone_flash_count ==0)
4166  09e2 3d2d          	tnz	_zone_flash_count
4167  09e4 265c          	jrne	L1051
4168                     ; 818                		if(index_f ==0) 
4170  09e6 0d0a          	tnz	(OFST+9,sp)
4171  09e8 2618          	jrne	L1641
4172                     ; 820                	 	if(pan >4)    //normal status            	
4174  09ea 7b0d          	ld	a,(OFST+12,sp)
4175  09ec a105          	cp	a,#5
4176  09ee 2552          	jrult	L1051
4177                     ; 822                			if(Time_dot_bz ==TRUE)	   dis_buf =CHR_V;
4179  09f0 b61d          	ld	a,_Time_dot_bz
4180  09f2 a101          	cp	a,#1
4181  09f4 2606          	jrne	L5641
4184  09f6 a66a          	ld	a,#106
4185  09f8 6b01          	ld	(OFST+0,sp),a
4187  09fa 2046          	jra	L1051
4188  09fc               L5641:
4189                     ; 823       		 		else dis_buf =SEG_D;
4191  09fc a608          	ld	a,#8
4192  09fe 6b01          	ld	(OFST+0,sp),a
4193  0a00 2040          	jra	L1051
4194  0a02               L1641:
4195                     ; 826       	        	else if((pan>4)&&(other_pan>4))   
4197  0a02 7b0d          	ld	a,(OFST+12,sp)
4198  0a04 a105          	cp	a,#5
4199  0a06 253a          	jrult	L1051
4201  0a08 7b0e          	ld	a,(OFST+13,sp)
4202  0a0a a105          	cp	a,#5
4203  0a0c 2534          	jrult	L1051
4204                     ; 828       	          	if(Time_dot_bz ==TRUE)	   dis_buf =CHR_V;
4206  0a0e b61d          	ld	a,_Time_dot_bz
4207  0a10 a101          	cp	a,#1
4208  0a12 2606          	jrne	L5741
4211  0a14 a66a          	ld	a,#106
4212  0a16 6b01          	ld	(OFST+0,sp),a
4214  0a18 2028          	jra	L1051
4215  0a1a               L5741:
4216                     ; 829       		 	else dis_buf =SEG_D;		
4218  0a1a a608          	ld	a,#8
4219  0a1c 6b01          	ld	(OFST+0,sp),a
4220  0a1e 2022          	jra	L1051
4221  0a20               L3341:
4222                     ; 835              	if((zone_flash_count ==0)&&(flash)&&(Time_dot_bz ==TRUE)) dis_buf = CHR_H;
4224  0a20 3d2d          	tnz	_zone_flash_count
4225  0a22 2610          	jrne	L3051
4227  0a24 0d0c          	tnz	(OFST+11,sp)
4228  0a26 270c          	jreq	L3051
4230  0a28 b61d          	ld	a,_Time_dot_bz
4231  0a2a a101          	cp	a,#1
4232  0a2c 2606          	jrne	L3051
4235  0a2e a676          	ld	a,#118
4236  0a30 6b01          	ld	(OFST+0,sp),a
4238  0a32 200e          	jra	L1051
4239  0a34               L3051:
4240                     ; 838                 	if(zone_flash_count)  dis_buf = NUM_0;            	
4242  0a34 3d2d          	tnz	_zone_flash_count
4243  0a36 2706          	jreq	L7051
4246  0a38 a63f          	ld	a,#63
4247  0a3a 6b01          	ld	(OFST+0,sp),a
4249  0a3c 2004          	jra	L1051
4250  0a3e               L7051:
4251                     ; 839                 	else dis_buf = SEG_G;
4253  0a3e a640          	ld	a,#64
4254  0a40 6b01          	ld	(OFST+0,sp),a
4255  0a42               L1051:
4256                     ; 842         if(err)
4258  0a42 0d0f          	tnz	(OFST+14,sp)
4259  0a44 271d          	jreq	L7241
4260                     ; 844             	if(Time_dot_bz ==TRUE)  dis_buf = Display_decode((err & 0xF0) >>4);
4262  0a46 b61d          	ld	a,_Time_dot_bz
4263  0a48 a101          	cp	a,#1
4264  0a4a 260e          	jrne	L5151
4267  0a4c 7b0f          	ld	a,(OFST+14,sp)
4268  0a4e a4f0          	and	a,#240
4269  0a50 4e            	swap	a
4270  0a51 a40f          	and	a,#15
4271  0a53 cd08f0        	call	_Display_decode
4273  0a56 6b01          	ld	(OFST+0,sp),a
4275  0a58 2009          	jra	L7241
4276  0a5a               L5151:
4277                     ; 845             	else dis_buf =Display_decode(err & 0x0F);
4279  0a5a 7b0f          	ld	a,(OFST+14,sp)
4280  0a5c a40f          	and	a,#15
4281  0a5e cd08f0        	call	_Display_decode
4283  0a61 6b01          	ld	(OFST+0,sp),a
4284  0a63               L7241:
4285                     ; 848       return(dis_buf);
4287  0a63 7b01          	ld	a,(OFST+0,sp)
4290  0a65 5b03          	addw	sp,#3
4291  0a67 81            	ret
4338                     ; 850 void APT8L16Init_H(void)
4338                     ; 851 {
4339                     	switch	.text
4340  0a68               _APT8L16Init_H:
4342  0a68 89            	pushw	x
4343       00000002      OFST:	set	2
4346                     ; 852    u8 i=0;
4348  0a69 7b02          	ld	a,(OFST+0,sp)
4349  0a6b 97            	ld	xl,a
4350                     ; 853    u8 j=0;
4352  0a6c 7b02          	ld	a,(OFST+0,sp)
4353  0a6e 97            	ld	xl,a
4354  0a6f               L3451:
4355                     ; 856    APTTouchWrOneData(APT_ADD_H,0x3A,0x5A);    //setting mode  
4357  0a6f 4b5a          	push	#90
4358  0a71 ae003a        	ldw	x,#58
4359  0a74 a656          	ld	a,#86
4360  0a76 95            	ld	xh,a
4361  0a77 cd0000        	call	_APTTouchWrOneData
4363  0a7a 84            	pop	a
4364                     ; 857    j =APTTouchRdOneData(APT_ADD_H,0x3A); 
4366  0a7b ae003a        	ldw	x,#58
4367  0a7e a656          	ld	a,#86
4368  0a80 95            	ld	xh,a
4369  0a81 cd0000        	call	_APTTouchRdOneData
4371  0a84 6b02          	ld	(OFST+0,sp),a
4372                     ; 858    }while (j!=0x5A);
4374  0a86 7b02          	ld	a,(OFST+0,sp)
4375  0a88 a15a          	cp	a,#90
4376  0a8a 26e3          	jrne	L3451
4377                     ; 860    for(i=0x20;i<=0x2D;)   
4379  0a8c a620          	ld	a,#32
4380  0a8e 6b02          	ld	(OFST+0,sp),a
4381  0a90               L1551:
4382                     ; 862 	  APTTouchWrOneData(APT_ADD_H,i,arr_APTRegData_H[i-0x20]);
4384  0a90 7b02          	ld	a,(OFST+0,sp)
4385  0a92 5f            	clrw	x
4386  0a93 97            	ld	xl,a
4387  0a94 1d0020        	subw	x,#32
4388  0a97 d60006        	ld	a,(_arr_APTRegData_H,x)
4389  0a9a 88            	push	a
4390  0a9b 7b03          	ld	a,(OFST+1,sp)
4391  0a9d 97            	ld	xl,a
4392  0a9e a656          	ld	a,#86
4393  0aa0 95            	ld	xh,a
4394  0aa1 cd0000        	call	_APTTouchWrOneData
4396  0aa4 84            	pop	a
4397                     ; 863 	  if(APTTouchRdOneData(APT_ADD_H,i)==arr_APTRegData_H[i-0x20]) i++;
4399  0aa5 7b02          	ld	a,(OFST+0,sp)
4400  0aa7 5f            	clrw	x
4401  0aa8 97            	ld	xl,a
4402  0aa9 1d0020        	subw	x,#32
4403  0aac d60006        	ld	a,(_arr_APTRegData_H,x)
4404  0aaf 6b01          	ld	(OFST-1,sp),a
4405  0ab1 7b02          	ld	a,(OFST+0,sp)
4406  0ab3 97            	ld	xl,a
4407  0ab4 a656          	ld	a,#86
4408  0ab6 95            	ld	xh,a
4409  0ab7 cd0000        	call	_APTTouchRdOneData
4411  0aba 1101          	cp	a,(OFST-1,sp)
4412  0abc 2602          	jrne	L7551
4415  0abe 0c02          	inc	(OFST+0,sp)
4416  0ac0               L7551:
4417                     ; 860    for(i=0x20;i<=0x2D;)   
4419  0ac0 7b02          	ld	a,(OFST+0,sp)
4420  0ac2 a12e          	cp	a,#46
4421  0ac4 25ca          	jrult	L1551
4422                     ; 865    for(i=0;i<=0x0F;)   
4424  0ac6 0f02          	clr	(OFST+0,sp)
4425  0ac8               L1651:
4426                     ; 867      	APTTouchWrOneData(APT_ADD_H,i,arr_T_Sens_H[i]);            //Set sensing K00~K17
4428  0ac8 7b02          	ld	a,(OFST+0,sp)
4429  0aca 5f            	clrw	x
4430  0acb 97            	ld	xl,a
4431  0acc d60014        	ld	a,(_arr_T_Sens_H,x)
4432  0acf 88            	push	a
4433  0ad0 7b03          	ld	a,(OFST+1,sp)
4434  0ad2 97            	ld	xl,a
4435  0ad3 a656          	ld	a,#86
4436  0ad5 95            	ld	xh,a
4437  0ad6 cd0000        	call	_APTTouchWrOneData
4439  0ad9 84            	pop	a
4440                     ; 868      	if(APTTouchRdOneData(APT_ADD_H,i)==arr_T_Sens_H[i]) i++;   //vertify K00~K17
4442  0ada 7b02          	ld	a,(OFST+0,sp)
4443  0adc 5f            	clrw	x
4444  0add 97            	ld	xl,a
4445  0ade d60014        	ld	a,(_arr_T_Sens_H,x)
4446  0ae1 6b01          	ld	(OFST-1,sp),a
4447  0ae3 7b02          	ld	a,(OFST+0,sp)
4448  0ae5 97            	ld	xl,a
4449  0ae6 a656          	ld	a,#86
4450  0ae8 95            	ld	xh,a
4451  0ae9 cd0000        	call	_APTTouchRdOneData
4453  0aec 1101          	cp	a,(OFST-1,sp)
4454  0aee 2602          	jrne	L7651
4457  0af0 0c02          	inc	(OFST+0,sp)
4458  0af2               L7651:
4459                     ; 865    for(i=0;i<=0x0F;)   
4461  0af2 7b02          	ld	a,(OFST+0,sp)
4462  0af4 a110          	cp	a,#16
4463  0af6 25d0          	jrult	L1651
4464  0af8               L1751:
4465                     ; 872    APTTouchWrOneData(APT_ADD_H,0x3A,0x00);    //working mode
4467  0af8 4b00          	push	#0
4468  0afa ae003a        	ldw	x,#58
4469  0afd a656          	ld	a,#86
4470  0aff 95            	ld	xh,a
4471  0b00 cd0000        	call	_APTTouchWrOneData
4473  0b03 84            	pop	a
4474                     ; 873    j =APTTouchRdOneData(APT_ADD_H,0x3A); 
4476  0b04 ae003a        	ldw	x,#58
4477  0b07 a656          	ld	a,#86
4478  0b09 95            	ld	xh,a
4479  0b0a cd0000        	call	_APTTouchRdOneData
4481  0b0d 6b02          	ld	(OFST+0,sp),a
4482                     ; 874    }while (j !=0x00);
4484  0b0f 0d02          	tnz	(OFST+0,sp)
4485  0b11 26e5          	jrne	L1751
4486                     ; 875 }
4489  0b13 85            	popw	x
4490  0b14 81            	ret
4537                     ; 876 void APT8L16Init_L(void)
4537                     ; 877 {
4538                     	switch	.text
4539  0b15               _APT8L16Init_L:
4541  0b15 89            	pushw	x
4542       00000002      OFST:	set	2
4545                     ; 878    u8 i=0;
4547  0b16 7b02          	ld	a,(OFST+0,sp)
4548  0b18 97            	ld	xl,a
4549                     ; 879    u8 j=0;
4551  0b19 7b02          	ld	a,(OFST+0,sp)
4552  0b1b 97            	ld	xl,a
4553  0b1c               L1261:
4554                     ; 882    APTTouchWrOneData(APT_ADD_L,0x3A,0x5A);    //setting mode  
4556  0b1c 4b5a          	push	#90
4557  0b1e ae003a        	ldw	x,#58
4558  0b21 a657          	ld	a,#87
4559  0b23 95            	ld	xh,a
4560  0b24 cd0000        	call	_APTTouchWrOneData
4562  0b27 84            	pop	a
4563                     ; 883    j =APTTouchRdOneData(APT_ADD_L,0x3A); 
4565  0b28 ae003a        	ldw	x,#58
4566  0b2b a657          	ld	a,#87
4567  0b2d 95            	ld	xh,a
4568  0b2e cd0000        	call	_APTTouchRdOneData
4570  0b31 6b02          	ld	(OFST+0,sp),a
4571                     ; 884    }while (j!=0x5A);
4573  0b33 7b02          	ld	a,(OFST+0,sp)
4574  0b35 a15a          	cp	a,#90
4575  0b37 26e3          	jrne	L1261
4576                     ; 886    for(i=0x20;i<=0x2D;)   
4578  0b39 a620          	ld	a,#32
4579  0b3b 6b02          	ld	(OFST+0,sp),a
4580  0b3d               L7261:
4581                     ; 888 	  APTTouchWrOneData(APT_ADD_L,i,arr_APTRegData_L[i-0x20]);
4583  0b3d 7b02          	ld	a,(OFST+0,sp)
4584  0b3f 5f            	clrw	x
4585  0b40 97            	ld	xl,a
4586  0b41 1d0020        	subw	x,#32
4587  0b44 d60024        	ld	a,(_arr_APTRegData_L,x)
4588  0b47 88            	push	a
4589  0b48 7b03          	ld	a,(OFST+1,sp)
4590  0b4a 97            	ld	xl,a
4591  0b4b a657          	ld	a,#87
4592  0b4d 95            	ld	xh,a
4593  0b4e cd0000        	call	_APTTouchWrOneData
4595  0b51 84            	pop	a
4596                     ; 889 	  if(APTTouchRdOneData(APT_ADD_L,i)==arr_APTRegData_L[i-0x20]) i++;
4598  0b52 7b02          	ld	a,(OFST+0,sp)
4599  0b54 5f            	clrw	x
4600  0b55 97            	ld	xl,a
4601  0b56 1d0020        	subw	x,#32
4602  0b59 d60024        	ld	a,(_arr_APTRegData_L,x)
4603  0b5c 6b01          	ld	(OFST-1,sp),a
4604  0b5e 7b02          	ld	a,(OFST+0,sp)
4605  0b60 97            	ld	xl,a
4606  0b61 a657          	ld	a,#87
4607  0b63 95            	ld	xh,a
4608  0b64 cd0000        	call	_APTTouchRdOneData
4610  0b67 1101          	cp	a,(OFST-1,sp)
4611  0b69 2602          	jrne	L5361
4614  0b6b 0c02          	inc	(OFST+0,sp)
4615  0b6d               L5361:
4616                     ; 886    for(i=0x20;i<=0x2D;)   
4618  0b6d 7b02          	ld	a,(OFST+0,sp)
4619  0b6f a12e          	cp	a,#46
4620  0b71 25ca          	jrult	L7261
4621                     ; 891    for(i=0;i<=0x0F;)   
4623  0b73 0f02          	clr	(OFST+0,sp)
4624  0b75               L7361:
4625                     ; 893      	APTTouchWrOneData(APT_ADD_L,i,arr_T_Sens_L[i]);            //Set sensing K00~K17
4627  0b75 7b02          	ld	a,(OFST+0,sp)
4628  0b77 5f            	clrw	x
4629  0b78 97            	ld	xl,a
4630  0b79 d60032        	ld	a,(_arr_T_Sens_L,x)
4631  0b7c 88            	push	a
4632  0b7d 7b03          	ld	a,(OFST+1,sp)
4633  0b7f 97            	ld	xl,a
4634  0b80 a657          	ld	a,#87
4635  0b82 95            	ld	xh,a
4636  0b83 cd0000        	call	_APTTouchWrOneData
4638  0b86 84            	pop	a
4639                     ; 894      	if(APTTouchRdOneData(APT_ADD_L,i)==arr_T_Sens_L[i]) i++;   //vertify K00~K17
4641  0b87 7b02          	ld	a,(OFST+0,sp)
4642  0b89 5f            	clrw	x
4643  0b8a 97            	ld	xl,a
4644  0b8b d60032        	ld	a,(_arr_T_Sens_L,x)
4645  0b8e 6b01          	ld	(OFST-1,sp),a
4646  0b90 7b02          	ld	a,(OFST+0,sp)
4647  0b92 97            	ld	xl,a
4648  0b93 a657          	ld	a,#87
4649  0b95 95            	ld	xh,a
4650  0b96 cd0000        	call	_APTTouchRdOneData
4652  0b99 1101          	cp	a,(OFST-1,sp)
4653  0b9b 2602          	jrne	L5461
4656  0b9d 0c02          	inc	(OFST+0,sp)
4657  0b9f               L5461:
4658                     ; 891    for(i=0;i<=0x0F;)   
4660  0b9f 7b02          	ld	a,(OFST+0,sp)
4661  0ba1 a110          	cp	a,#16
4662  0ba3 25d0          	jrult	L7361
4663  0ba5               L7461:
4664                     ; 898    APTTouchWrOneData(APT_ADD_L,0x3A,0x00);    //working mode
4666  0ba5 4b00          	push	#0
4667  0ba7 ae003a        	ldw	x,#58
4668  0baa a657          	ld	a,#87
4669  0bac 95            	ld	xh,a
4670  0bad cd0000        	call	_APTTouchWrOneData
4672  0bb0 84            	pop	a
4673                     ; 899    j =APTTouchRdOneData(APT_ADD_L,0x3A); 
4675  0bb1 ae003a        	ldw	x,#58
4676  0bb4 a657          	ld	a,#87
4677  0bb6 95            	ld	xh,a
4678  0bb7 cd0000        	call	_APTTouchRdOneData
4680  0bba 6b02          	ld	(OFST+0,sp),a
4681                     ; 900    }while (j !=0x00);
4683  0bbc 0d02          	tnz	(OFST+0,sp)
4684  0bbe 26e5          	jrne	L7461
4685                     ; 901 } 
4688  0bc0 85            	popw	x
4689  0bc1 81            	ret
4750                     ; 902 void key_scan_I2C(u8 list)
4750                     ; 903 {
4751                     	switch	.text
4752  0bc2               _key_scan_I2C:
4754  0bc2 88            	push	a
4755  0bc3 89            	pushw	x
4756       00000002      OFST:	set	2
4759                     ; 905   if(list ==1)
4761  0bc4 a101          	cp	a,#1
4762  0bc6 2624          	jrne	L3071
4763                     ; 907   APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_H,0x34);
4765  0bc8 ae0034        	ldw	x,#52
4766  0bcb a656          	ld	a,#86
4767  0bcd 95            	ld	xh,a
4768  0bce cd0000        	call	_APTTouchRdOneData
4770  0bd1 6b01          	ld	(OFST-1,sp),a
4771                     ; 908   APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_H,0x35);
4773  0bd3 ae0035        	ldw	x,#53
4774  0bd6 a656          	ld	a,#86
4775  0bd8 95            	ld	xh,a
4776  0bd9 cd0000        	call	_APTTouchRdOneData
4778  0bdc 6b02          	ld	(OFST+0,sp),a
4779                     ; 909   I2C_GET_DATA_H =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
4781  0bde 7b02          	ld	a,(OFST+0,sp)
4782  0be0 5f            	clrw	x
4783  0be1 97            	ld	xl,a
4784  0be2 4f            	clr	a
4785  0be3 02            	rlwa	x,a
4786  0be4 01            	rrwa	x,a
4787  0be5 1a01          	or	a,(OFST-1,sp)
4788  0be7 b7a3          	ld	_I2C_GET_DATA_H+1,a
4789  0be9 9f            	ld	a,xl
4790  0bea b7a2          	ld	_I2C_GET_DATA_H,a
4791  0bec               L3071:
4792                     ; 911   if(list ==2)
4794  0bec 7b03          	ld	a,(OFST+1,sp)
4795  0bee a102          	cp	a,#2
4796  0bf0 2624          	jrne	L5071
4797                     ; 913   APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_L,0x34);
4799  0bf2 ae0034        	ldw	x,#52
4800  0bf5 a657          	ld	a,#87
4801  0bf7 95            	ld	xh,a
4802  0bf8 cd0000        	call	_APTTouchRdOneData
4804  0bfb 6b01          	ld	(OFST-1,sp),a
4805                     ; 914   APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_L,0x35);
4807  0bfd ae0035        	ldw	x,#53
4808  0c00 a657          	ld	a,#87
4809  0c02 95            	ld	xh,a
4810  0c03 cd0000        	call	_APTTouchRdOneData
4812  0c06 6b02          	ld	(OFST+0,sp),a
4813                     ; 915   I2C_GET_DATA_L =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
4815  0c08 7b02          	ld	a,(OFST+0,sp)
4816  0c0a 5f            	clrw	x
4817  0c0b 97            	ld	xl,a
4818  0c0c 4f            	clr	a
4819  0c0d 02            	rlwa	x,a
4820  0c0e 01            	rrwa	x,a
4821  0c0f 1a01          	or	a,(OFST-1,sp)
4822  0c11 b7a5          	ld	_I2C_GET_DATA_L+1,a
4823  0c13 9f            	ld	a,xl
4824  0c14 b7a4          	ld	_I2C_GET_DATA_L,a
4825  0c16               L5071:
4826                     ; 917   if(list ==3)
4828  0c16 7b03          	ld	a,(OFST+1,sp)
4829  0c18 a103          	cp	a,#3
4830  0c1a 2656          	jrne	L7071
4831                     ; 919   	I2C_GET_DATA =I2C_GET_DATA_H;
4833  0c1c bea2          	ldw	x,_I2C_GET_DATA_H
4834  0c1e cd0000        	call	c_uitolx
4836  0c21 ae00a6        	ldw	x,#_I2C_GET_DATA
4837  0c24 cd0000        	call	c_rtol
4839                     ; 920   	I2C_GET_DATA <<=16;
4841  0c27 ae00a6        	ldw	x,#_I2C_GET_DATA
4842  0c2a a610          	ld	a,#16
4843  0c2c cd0000        	call	c_lglsh
4845                     ; 921   	I2C_GET_DATA |=I2C_GET_DATA_L;
4847  0c2f bea4          	ldw	x,_I2C_GET_DATA_L
4848  0c31 cd0000        	call	c_uitolx
4850  0c34 ae00a6        	ldw	x,#_I2C_GET_DATA
4851  0c37 cd0000        	call	c_lgor
4853                     ; 923      if(I2C_GET_DATA ==0)
4855  0c3a ae00a6        	ldw	x,#_I2C_GET_DATA
4856  0c3d cd0000        	call	c_lzmp
4858  0c40 260a          	jrne	L1171
4859                     ; 925      		key_account =0;
4861  0c42 5f            	clrw	x
4862  0c43 bf86          	ldw	_key_account,x
4863                     ; 926      		key_ok_bit =0;
4865  0c45 3f85          	clr	_key_ok_bit
4866                     ; 927      		key_err_account =0;	
4868  0c47 5f            	clrw	x
4869  0c48 bf88          	ldw	_key_err_account,x
4871  0c4a 2026          	jra	L7071
4872  0c4c               L1171:
4873                     ; 931      		apt_min_reset =0;
4875  0c4c 725f0024      	clr	_apt_min_reset
4876                     ; 933      		 if(I2C_GET_DATA == key_scan_value)     key_account++; 
4878  0c50 ae00a6        	ldw	x,#_I2C_GET_DATA
4879  0c53 cd0000        	call	c_ltor
4881  0c56 ae0081        	ldw	x,#_key_scan_value
4882  0c59 cd0000        	call	c_lcmp
4884  0c5c 2609          	jrne	L5171
4887  0c5e be86          	ldw	x,_key_account
4888  0c60 1c0001        	addw	x,#1
4889  0c63 bf86          	ldw	_key_account,x
4891  0c65 200b          	jra	L7071
4892  0c67               L5171:
4893                     ; 934      	         else    {key_scan_value =I2C_GET_DATA; key_account =0;}  
4895  0c67 bea8          	ldw	x,_I2C_GET_DATA+2
4896  0c69 bf83          	ldw	_key_scan_value+2,x
4897  0c6b bea6          	ldw	x,_I2C_GET_DATA
4898  0c6d bf81          	ldw	_key_scan_value,x
4901  0c6f 5f            	clrw	x
4902  0c70 bf86          	ldw	_key_account,x
4903  0c72               L7071:
4904                     ; 937 }
4907  0c72 5b03          	addw	sp,#3
4908  0c74 81            	ret
4948                     	switch	.user
4949  0096               L411:
4950  0096 10000000      	dc.l	268435456
4951  009a               L611:
4952  009a 08000000      	dc.l	134217728
4953  009e               L021:
4954  009e 04000000      	dc.l	67108864
4955  00a2               L221:
4956  00a2 02000000      	dc.l	33554432
4957  00a6               L421:
4958  00a6 01000000      	dc.l	16777216
4959  00aa               L621:
4960  00aa 00800000      	dc.l	8388608
4961  00ae               L031:
4962  00ae 00400000      	dc.l	4194304
4963  00b2               L231:
4964  00b2 00040000      	dc.l	262144
4965  00b6               L431:
4966  00b6 00080000      	dc.l	524288
4967  00ba               L631:
4968  00ba 00200000      	dc.l	2097152
4969  00be               L041:
4970  00be 00100000      	dc.l	1048576
4971  00c2               L241:
4972  00c2 00001000      	dc.l	4096
4973  00c6               L441:
4974  00c6 00000800      	dc.l	2048
4975  00ca               L641:
4976  00ca 00000400      	dc.l	1024
4977  00ce               L051:
4978  00ce 00000200      	dc.l	512
4979  00d2               L251:
4980  00d2 00000100      	dc.l	256
4981  00d6               L451:
4982  00d6 00000080      	dc.l	128
4983  00da               L651:
4984  00da 00000040      	dc.l	64
4985  00de               L061:
4986  00de 00000020      	dc.l	32
4987  00e2               L261:
4988  00e2 00004000      	dc.l	16384
4989  00e6               L461:
4990  00e6 00002000      	dc.l	8192
4991                     ; 938 void key_next_deal(void)
4991                     ; 939 { 
4992                     	switch	.text
4993  0c75               _key_next_deal:
4995  0c75 88            	push	a
4996       00000001      OFST:	set	1
4999                     ; 940   u8  key_effective =0;
5001  0c76 0f01          	clr	(OFST+0,sp)
5002                     ; 941               if((key_account == short_press_time) || (key_account == long_press_time))   key_effective =1;
5004  0c78 be86          	ldw	x,_key_account
5005  0c7a a30002        	cpw	x,#2
5006  0c7d 2707          	jreq	L1471
5008  0c7f be86          	ldw	x,_key_account
5009  0c81 a30064        	cpw	x,#100
5010  0c84 2604          	jrne	L7371
5011  0c86               L1471:
5014  0c86 a601          	ld	a,#1
5015  0c88 6b01          	ld	(OFST+0,sp),a
5016  0c8a               L7371:
5017                     ; 942               if((key_account > long_press_time)  && (((key_account - long_press_time) %50) ==0))   key_effective =1;//speed up 0827
5019  0c8a be86          	ldw	x,_key_account
5020  0c8c a30065        	cpw	x,#101
5021  0c8f 2513          	jrult	L3471
5023  0c91 be86          	ldw	x,_key_account
5024  0c93 1d0064        	subw	x,#100
5025  0c96 a632          	ld	a,#50
5026  0c98 62            	div	x,a
5027  0c99 5f            	clrw	x
5028  0c9a 97            	ld	xl,a
5029  0c9b a30000        	cpw	x,#0
5030  0c9e 2604          	jrne	L3471
5033  0ca0 a601          	ld	a,#1
5034  0ca2 6b01          	ld	(OFST+0,sp),a
5035  0ca4               L3471:
5036                     ; 943               if(key_effective)
5038  0ca4 0d01          	tnz	(OFST+0,sp)
5039  0ca6 2603          	jrne	L661
5040  0ca8 cc0e92        	jp	L5471
5041  0cab               L661:
5042                     ; 945                 	if(key_scan_value == VALUE_ONOFF)       key_ok_bit =KEY_ONOFF;  		    
5044  0cab ae0081        	ldw	x,#_key_scan_value
5045  0cae cd0000        	call	c_ltor
5047  0cb1 ae0096        	ldw	x,#L411
5048  0cb4 cd0000        	call	c_lcmp
5050  0cb7 2608          	jrne	L7471
5053  0cb9 35010085      	mov	_key_ok_bit,#1
5055  0cbd ac940e94      	jpf	L1012
5056  0cc1               L7471:
5057                     ; 946 		   else	if(key_scan_value == VALUE_LOCK)	key_ok_bit =KEY_LOCK; 
5059  0cc1 ae0081        	ldw	x,#_key_scan_value
5060  0cc4 cd0000        	call	c_ltor
5062  0cc7 ae009a        	ldw	x,#L611
5063  0cca cd0000        	call	c_lcmp
5065  0ccd 2608          	jrne	L3571
5068  0ccf 35020085      	mov	_key_ok_bit,#2
5070  0cd3 ac940e94      	jpf	L1012
5071  0cd7               L3571:
5072                     ; 947 		   else	if(key_scan_value == VALUE_STOP)	key_ok_bit =KEY_STOP; 
5074  0cd7 ae0081        	ldw	x,#_key_scan_value
5075  0cda cd0000        	call	c_ltor
5077  0cdd ae009e        	ldw	x,#L021
5078  0ce0 cd0000        	call	c_lcmp
5080  0ce3 2608          	jrne	L7571
5083  0ce5 35050085      	mov	_key_ok_bit,#5
5085  0ce9 ac940e94      	jpf	L1012
5086  0ced               L7571:
5087                     ; 948 		   else if(key_scan_value == VALUE_FL)	    	key_ok_bit =KEY_FL; 
5089  0ced ae0081        	ldw	x,#_key_scan_value
5090  0cf0 cd0000        	call	c_ltor
5092  0cf3 ae00a2        	ldw	x,#L221
5093  0cf6 cd0000        	call	c_lcmp
5095  0cf9 2608          	jrne	L3671
5098  0cfb 35060085      	mov	_key_ok_bit,#6
5100  0cff ac940e94      	jpf	L1012
5101  0d03               L3671:
5102                     ; 950 		   else	if(key_scan_value == VALUE_WARM)    	key_ok_bit =KEY_WARM; 
5104  0d03 ae0081        	ldw	x,#_key_scan_value
5105  0d06 cd0000        	call	c_ltor
5107  0d09 ae00a6        	ldw	x,#L421
5108  0d0c cd0000        	call	c_lcmp
5110  0d0f 2608          	jrne	L7671
5113  0d11 35040085      	mov	_key_ok_bit,#4
5115  0d15 ac940e94      	jpf	L1012
5116  0d19               L7671:
5117                     ; 951 		   else	if(key_scan_value == VALUE_S1)	    	key_ok_bit =KEY_S1; 
5119  0d19 ae0081        	ldw	x,#_key_scan_value
5120  0d1c cd0000        	call	c_ltor
5122  0d1f ae00aa        	ldw	x,#L621
5123  0d22 cd0000        	call	c_lcmp
5125  0d25 2608          	jrne	L3771
5128  0d27 35110085      	mov	_key_ok_bit,#17
5130  0d2b ac940e94      	jpf	L1012
5131  0d2f               L3771:
5132                     ; 952 		   else	if(key_scan_value == VALUE_S2)	    	key_ok_bit =KEY_S2;		   
5134  0d2f ae0081        	ldw	x,#_key_scan_value
5135  0d32 cd0000        	call	c_ltor
5137  0d35 ae00ae        	ldw	x,#L031
5138  0d38 cd0000        	call	c_lcmp
5140  0d3b 2608          	jrne	L7771
5143  0d3d 35120085      	mov	_key_ok_bit,#18
5145  0d41 ac940e94      	jpf	L1012
5146  0d45               L7771:
5147                     ; 953 		   else	if(key_scan_value == VALUE_KEY_1)	key_ok_bit =KEY_1;   
5149  0d45 ae0081        	ldw	x,#_key_scan_value
5150  0d48 cd0000        	call	c_ltor
5152  0d4b ae00b2        	ldw	x,#L231
5153  0d4e cd0000        	call	c_lcmp
5155  0d51 2608          	jrne	L3002
5158  0d53 350a0085      	mov	_key_ok_bit,#10
5160  0d57 ac940e94      	jpf	L1012
5161  0d5b               L3002:
5162                     ; 955 		   else	if(key_scan_value == VALUE_KEY_2)	key_ok_bit =KEY_2;  
5164  0d5b ae0081        	ldw	x,#_key_scan_value
5165  0d5e cd0000        	call	c_ltor
5167  0d61 ae00b6        	ldw	x,#L431
5168  0d64 cd0000        	call	c_lcmp
5170  0d67 2608          	jrne	L7002
5173  0d69 350b0085      	mov	_key_ok_bit,#11
5175  0d6d ac940e94      	jpf	L1012
5176  0d71               L7002:
5177                     ; 956                    else	if(key_scan_value == VALUE_S3)	    	key_ok_bit =KEY_S3; 
5179  0d71 ae0081        	ldw	x,#_key_scan_value
5180  0d74 cd0000        	call	c_ltor
5182  0d77 ae00ba        	ldw	x,#L631
5183  0d7a cd0000        	call	c_lcmp
5185  0d7d 2608          	jrne	L3102
5188  0d7f 35130085      	mov	_key_ok_bit,#19
5190  0d83 ac940e94      	jpf	L1012
5191  0d87               L3102:
5192                     ; 957                    else	if(key_scan_value == VALUE_S4)	    	key_ok_bit =KEY_S4; 
5194  0d87 ae0081        	ldw	x,#_key_scan_value
5195  0d8a cd0000        	call	c_ltor
5197  0d8d ae00be        	ldw	x,#L041
5198  0d90 cd0000        	call	c_lcmp
5200  0d93 2608          	jrne	L7102
5203  0d95 35140085      	mov	_key_ok_bit,#20
5205  0d99 ac940e94      	jpf	L1012
5206  0d9d               L7102:
5207                     ; 958                    else if(key_scan_value == VALUE_S5)	    	key_ok_bit =KEY_S5;
5209  0d9d ae0081        	ldw	x,#_key_scan_value
5210  0da0 cd0000        	call	c_ltor
5212  0da3 ae00c2        	ldw	x,#L241
5213  0da6 cd0000        	call	c_lcmp
5215  0da9 2608          	jrne	L3202
5218  0dab 35150085      	mov	_key_ok_bit,#21
5220  0daf ac940e94      	jpf	L1012
5221  0db3               L3202:
5222                     ; 959                    else	if(key_scan_value == VALUE_S6)	    	key_ok_bit =KEY_S6; 
5224  0db3 ae0081        	ldw	x,#_key_scan_value
5225  0db6 cd0000        	call	c_ltor
5227  0db9 ae00c6        	ldw	x,#L441
5228  0dbc cd0000        	call	c_lcmp
5230  0dbf 2608          	jrne	L7202
5233  0dc1 35160085      	mov	_key_ok_bit,#22
5235  0dc5 ac940e94      	jpf	L1012
5236  0dc9               L7202:
5237                     ; 961                    else	if(key_scan_value == VALUE_S7)	    	key_ok_bit =KEY_S7;                    
5239  0dc9 ae0081        	ldw	x,#_key_scan_value
5240  0dcc cd0000        	call	c_ltor
5242  0dcf ae00ca        	ldw	x,#L641
5243  0dd2 cd0000        	call	c_lcmp
5245  0dd5 2608          	jrne	L3302
5248  0dd7 35170085      	mov	_key_ok_bit,#23
5250  0ddb ac940e94      	jpf	L1012
5251  0ddf               L3302:
5252                     ; 962                    else	if(key_scan_value == VALUE_S8)	    	key_ok_bit =KEY_S8;
5254  0ddf ae0081        	ldw	x,#_key_scan_value
5255  0de2 cd0000        	call	c_ltor
5257  0de5 ae00ce        	ldw	x,#L051
5258  0de8 cd0000        	call	c_lcmp
5260  0deb 2608          	jrne	L7302
5263  0ded 35180085      	mov	_key_ok_bit,#24
5265  0df1 ac940e94      	jpf	L1012
5266  0df5               L7302:
5267                     ; 963                    else	if(key_scan_value == VALUE_S9)	    	key_ok_bit =KEY_S9;                    
5269  0df5 ae0081        	ldw	x,#_key_scan_value
5270  0df8 cd0000        	call	c_ltor
5272  0dfb ae00d2        	ldw	x,#L251
5273  0dfe cd0000        	call	c_lcmp
5275  0e01 2608          	jrne	L3402
5278  0e03 35190085      	mov	_key_ok_bit,#25
5280  0e07 ac940e94      	jpf	L1012
5281  0e0b               L3402:
5282                     ; 964                    else	if(key_scan_value == VALUE_BOOST)	key_ok_bit =KEY_BOOST; 
5284  0e0b ae0081        	ldw	x,#_key_scan_value
5285  0e0e cd0000        	call	c_ltor
5287  0e11 ae00d6        	ldw	x,#L451
5288  0e14 cd0000        	call	c_lcmp
5290  0e17 2606          	jrne	L7402
5293  0e19 35030085      	mov	_key_ok_bit,#3
5295  0e1d 2075          	jra	L1012
5296  0e1f               L7402:
5297                     ; 965                    else	if(key_scan_value == VALUE_FR)	    	key_ok_bit =KEY_FR;
5299  0e1f ae0081        	ldw	x,#_key_scan_value
5300  0e22 cd0000        	call	c_ltor
5302  0e25 ae00da        	ldw	x,#L651
5303  0e28 cd0000        	call	c_lcmp
5305  0e2b 2606          	jrne	L3502
5308  0e2d 35070085      	mov	_key_ok_bit,#7
5310  0e31 2061          	jra	L1012
5311  0e33               L3502:
5312                     ; 966                    else	if(key_scan_value == VALUE_TIMER)	key_ok_bit =KEY_TIMER; 
5314  0e33 ae0081        	ldw	x,#_key_scan_value
5315  0e36 cd0000        	call	c_ltor
5317  0e39 ae00de        	ldw	x,#L061
5318  0e3c cd0000        	call	c_lcmp
5320  0e3f 2606          	jrne	L7502
5323  0e41 35080085      	mov	_key_ok_bit,#8
5325  0e45 204d          	jra	L1012
5326  0e47               L7502:
5327                     ; 967                    else	if(key_scan_value == VALUE_KEY_4)	key_ok_bit =KEY_4;                                                        
5329  0e47 ae0081        	ldw	x,#_key_scan_value
5330  0e4a cd0000        	call	c_ltor
5332  0e4d ae00e2        	ldw	x,#L261
5333  0e50 cd0000        	call	c_lcmp
5335  0e53 2606          	jrne	L3602
5338  0e55 350d0085      	mov	_key_ok_bit,#13
5340  0e59 2039          	jra	L1012
5341  0e5b               L3602:
5342                     ; 968                    else	if(key_scan_value == VALUE_KEY_3)	key_ok_bit =KEY_3;                                                                                                                                    
5344  0e5b ae0081        	ldw	x,#_key_scan_value
5345  0e5e cd0000        	call	c_ltor
5347  0e61 ae00e6        	ldw	x,#L461
5348  0e64 cd0000        	call	c_lcmp
5350  0e67 2606          	jrne	L7602
5353  0e69 350c0085      	mov	_key_ok_bit,#12
5355  0e6d 2025          	jra	L1012
5356  0e6f               L7602:
5357                     ; 971                     if(key_scan_value &VALUE_ONOFF)  key_ok_bit =KEY_ONOFF;
5359  0e6f b681          	ld	a,_key_scan_value
5360  0e71 a510          	bcp	a,#16
5361  0e73 2706          	jreq	L3702
5364  0e75 35010085      	mov	_key_ok_bit,#1
5366  0e79 2019          	jra	L1012
5367  0e7b               L3702:
5368                     ; 974                    	key_err_account++;
5370  0e7b be88          	ldw	x,_key_err_account
5371  0e7d 1c0001        	addw	x,#1
5372  0e80 bf88          	ldw	_key_err_account,x
5373                     ; 975                    	if(key_err_account == 10)   {Power_off_deal();buzzer_time = buz_1000ms;} //8s
5375  0e82 be88          	ldw	x,_key_err_account
5376  0e84 a3000a        	cpw	x,#10
5377  0e87 260b          	jrne	L1012
5380  0e89 cd0861        	call	_Power_off_deal
5384  0e8c 35640022      	mov	_buzzer_time,#100
5385  0e90 2002          	jra	L1012
5386  0e92               L5471:
5387                     ; 979               else key_ok_bit =0;
5389  0e92 3f85          	clr	_key_ok_bit
5390  0e94               L1012:
5391                     ; 981 }
5394  0e94 84            	pop	a
5395  0e95 81            	ret
5490                     ; 982 void boost_x_time(u8 index,u16 *time_x,u8 *save_x,u8 *level_x,u8 select,u8 *count,u16 *zone_timer)
5490                     ; 983 {
5491                     	switch	.text
5492  0e96               _boost_x_time:
5494  0e96 88            	push	a
5495       00000000      OFST:	set	0
5498                     ; 984 	if((*time_x) ==300)
5500  0e97 1e04          	ldw	x,(OFST+4,sp)
5501  0e99 9093          	ldw	y,x
5502  0e9b 90fe          	ldw	y,(y)
5503  0e9d 90a3012c      	cpw	y,#300
5504  0ea1 260b          	jrne	L1512
5505                     ; 986 		(*save_x) =(*level_x);	
5507  0ea3 1e08          	ldw	x,(OFST+8,sp)
5508  0ea5 f6            	ld	a,(x)
5509  0ea6 1e06          	ldw	x,(OFST+6,sp)
5510  0ea8 f7            	ld	(x),a
5511                     ; 987 		(*level_x) =10;
5513  0ea9 1e08          	ldw	x,(OFST+8,sp)
5514  0eab a60a          	ld	a,#10
5515  0ead f7            	ld	(x),a
5516  0eae               L1512:
5517                     ; 989 	if(*time_x)  
5519  0eae 1e04          	ldw	x,(OFST+4,sp)
5520  0eb0 e601          	ld	a,(1,x)
5521  0eb2 fa            	or	a,(x)
5522  0eb3 2733          	jreq	L3512
5523                     ; 991 		(*time_x)--;
5525  0eb5 1e04          	ldw	x,(OFST+4,sp)
5526  0eb7 9093          	ldw	y,x
5527  0eb9 fe            	ldw	x,(x)
5528  0eba 1d0001        	subw	x,#1
5529  0ebd 90ff          	ldw	(y),x
5530                     ; 992 		if((*time_x) ==0) 
5532  0ebf 1e04          	ldw	x,(OFST+4,sp)
5533  0ec1 e601          	ld	a,(1,x)
5534  0ec3 fa            	or	a,(x)
5535  0ec4 2622          	jrne	L3512
5536                     ; 995 				(*level_x) =9;
5538  0ec6 1e08          	ldw	x,(OFST+8,sp)
5539  0ec8 a609          	ld	a,#9
5540  0eca f7            	ld	(x),a
5541                     ; 997 				if((*zone_timer)==0)  (*zone_timer) =120;	//setting 2h defult timer
5543  0ecb 1e0d          	ldw	x,(OFST+13,sp)
5544  0ecd e601          	ld	a,(1,x)
5545  0ecf fa            	or	a,(x)
5546  0ed0 2607          	jrne	L7512
5549  0ed2 1e0d          	ldw	x,(OFST+13,sp)
5550  0ed4 90ae0078      	ldw	y,#120
5551  0ed8 ff            	ldw	(x),y
5552  0ed9               L7512:
5553                     ; 999 				(*count)++;
5555  0ed9 1e0b          	ldw	x,(OFST+11,sp)
5556  0edb 7c            	inc	(x)
5557                     ; 1000 				flex_deal(index);
5559  0edc 7b01          	ld	a,(OFST+1,sp)
5560  0ede cd0045        	call	_flex_deal
5562                     ; 1001 				boost_status &=~select;
5564  0ee1 7b0a          	ld	a,(OFST+10,sp)
5565  0ee3 43            	cpl	a
5566  0ee4 b480          	and	a,_boost_status
5567  0ee6 b780          	ld	_boost_status,a
5568  0ee8               L3512:
5569                     ; 1004 }
5572  0ee8 84            	pop	a
5573  0ee9 81            	ret
5617                     ; 1005 void boost_time_deal(void)
5617                     ; 1006 {
5618                     	switch	.text
5619  0eea               _boost_time_deal:
5623                     ; 1007 	boost_x_time(1,&boost_time_1,&boost_1_save,&zone_1_level,Select_1_KEY,&boost_1_count,&zone_1_timer);
5625  0eea ae009a        	ldw	x,#_zone_1_timer
5626  0eed 89            	pushw	x
5627  0eee ae000c        	ldw	x,#_boost_1_count
5628  0ef1 89            	pushw	x
5629  0ef2 4b01          	push	#1
5630  0ef4 ae0094        	ldw	x,#_zone_1_level
5631  0ef7 89            	pushw	x
5632  0ef8 ae004c        	ldw	x,#_boost_1_save
5633  0efb 89            	pushw	x
5634  0efc ae003c        	ldw	x,#_boost_time_1
5635  0eff 89            	pushw	x
5636  0f00 a601          	ld	a,#1
5637  0f02 ad92          	call	_boost_x_time
5639  0f04 5b0b          	addw	sp,#11
5640                     ; 1008 	boost_x_time(2,&boost_time_2,&boost_2_save,&zone_2_level,Select_2_KEY,&boost_2_count,&zone_2_timer);
5642  0f06 ae009c        	ldw	x,#_zone_2_timer
5643  0f09 89            	pushw	x
5644  0f0a ae000d        	ldw	x,#_boost_2_count
5645  0f0d 89            	pushw	x
5646  0f0e 4b02          	push	#2
5647  0f10 ae0095        	ldw	x,#_zone_2_level
5648  0f13 89            	pushw	x
5649  0f14 ae004d        	ldw	x,#_boost_2_save
5650  0f17 89            	pushw	x
5651  0f18 ae003e        	ldw	x,#_boost_time_2
5652  0f1b 89            	pushw	x
5653  0f1c a602          	ld	a,#2
5654  0f1e cd0e96        	call	_boost_x_time
5656  0f21 5b0b          	addw	sp,#11
5657                     ; 1009 	boost_x_time(3,&boost_time_3,&boost_3_save,&zone_3_level,Select_3_KEY,&boost_3_count,&zone_3_timer);
5659  0f23 ae009e        	ldw	x,#_zone_3_timer
5660  0f26 89            	pushw	x
5661  0f27 ae000e        	ldw	x,#_boost_3_count
5662  0f2a 89            	pushw	x
5663  0f2b 4b04          	push	#4
5664  0f2d ae0096        	ldw	x,#_zone_3_level
5665  0f30 89            	pushw	x
5666  0f31 ae004e        	ldw	x,#_boost_3_save
5667  0f34 89            	pushw	x
5668  0f35 ae0040        	ldw	x,#_boost_time_3
5669  0f38 89            	pushw	x
5670  0f39 a603          	ld	a,#3
5671  0f3b cd0e96        	call	_boost_x_time
5673  0f3e 5b0b          	addw	sp,#11
5674                     ; 1010 	boost_x_time(4,&boost_time_4,&boost_4_save,&zone_4_level,Select_4_KEY,&boost_4_count,&zone_4_timer);
5676  0f40 ae00a0        	ldw	x,#_zone_4_timer
5677  0f43 89            	pushw	x
5678  0f44 ae000f        	ldw	x,#_boost_4_count
5679  0f47 89            	pushw	x
5680  0f48 4b08          	push	#8
5681  0f4a ae0097        	ldw	x,#_zone_4_level
5682  0f4d 89            	pushw	x
5683  0f4e ae004f        	ldw	x,#_boost_4_save
5684  0f51 89            	pushw	x
5685  0f52 ae0042        	ldw	x,#_boost_time_4
5686  0f55 89            	pushw	x
5687  0f56 a604          	ld	a,#4
5688  0f58 cd0e96        	call	_boost_x_time
5690  0f5b 5b0b          	addw	sp,#11
5691                     ; 1011 } 	
5694  0f5d 81            	ret
5732                     ; 1012 void time_b_power(u8 data)
5732                     ; 1013 {
5733                     	switch	.text
5734  0f5e               _time_b_power:
5736  0f5e 88            	push	a
5737       00000000      OFST:	set	0
5740                     ; 1014 	if(zone_1_level <10) time_level_1 =data;  
5742  0f5f b694          	ld	a,_zone_1_level
5743  0f61 a10a          	cp	a,#10
5744  0f63 2404          	jruge	L7022
5747  0f65 7b01          	ld	a,(OFST+1,sp)
5748  0f67 b7bf          	ld	_time_level_1,a
5749  0f69               L7022:
5750                     ; 1015 	if(zone_3_level <10) time_level_3 =data;	  			   
5752  0f69 b696          	ld	a,_zone_3_level
5753  0f6b a10a          	cp	a,#10
5754  0f6d 2404          	jruge	L1122
5757  0f6f 7b01          	ld	a,(OFST+1,sp)
5758  0f71 b7c1          	ld	_time_level_3,a
5759  0f73               L1122:
5760                     ; 1016 }  
5763  0f73 84            	pop	a
5764  0f74 81            	ret
5802                     ; 1017 void time_s_power(u8 data)
5802                     ; 1018 {
5803                     	switch	.text
5804  0f75               _time_s_power:
5806  0f75 88            	push	a
5807       00000000      OFST:	set	0
5810                     ; 1019 	if(zone_2_level <10) time_level_2 =data;				   
5812  0f76 b695          	ld	a,_zone_2_level
5813  0f78 a10a          	cp	a,#10
5814  0f7a 2404          	jruge	L1322
5817  0f7c 7b01          	ld	a,(OFST+1,sp)
5818  0f7e b7c0          	ld	_time_level_2,a
5819  0f80               L1322:
5820                     ; 1020 	if(zone_4_level <10) time_level_4 =data;
5822  0f80 b697          	ld	a,_zone_4_level
5823  0f82 a10a          	cp	a,#10
5824  0f84 2404          	jruge	L3322
5827  0f86 7b01          	ld	a,(OFST+1,sp)
5828  0f88 b7c2          	ld	_time_level_4,a
5829  0f8a               L3322:
5830                     ; 1021 } 
5833  0f8a 84            	pop	a
5834  0f8b 81            	ret
5904                     ; 1022 u8  Zone_Big_Set(u8 index,u8 level,u8 count,u8 data,u16 tw)  
5904                     ; 1023 {
5905                     	switch	.text
5906  0f8c               _Zone_Big_Set:
5908  0f8c 89            	pushw	x
5909       00000000      OFST:	set	0
5912                     ; 1024       if(level ==10)
5914  0f8d 9f            	ld	a,xl
5915  0f8e a10a          	cp	a,#10
5916  0f90 261a          	jrne	L3722
5917                     ; 1028 	   if(count ==1)  data -=20;		//dec 400w 2300w
5919  0f92 7b05          	ld	a,(OFST+5,sp)
5920  0f94 a101          	cp	a,#1
5921  0f96 2606          	jrne	L5722
5924  0f98 7b06          	ld	a,(OFST+6,sp)
5925  0f9a a014          	sub	a,#20
5926  0f9c 6b06          	ld	(OFST+6,sp),a
5927  0f9e               L5722:
5928                     ; 1029 	   if(count >1)   data -=35;		//dec 600w 2000w
5930  0f9e 7b05          	ld	a,(OFST+5,sp)
5931  0fa0 a102          	cp	a,#2
5932  0fa2 2534          	jrult	L1032
5935  0fa4 7b06          	ld	a,(OFST+6,sp)
5936  0fa6 a023          	sub	a,#35
5937  0fa8 6b06          	ld	(OFST+6,sp),a
5938  0faa 202c          	jra	L1032
5939  0fac               L3722:
5940                     ; 1039            if(tw >720)	  data =102;	//12min  1800w
5942  0fac 1e07          	ldw	x,(OFST+7,sp)
5943  0fae a302d1        	cpw	x,#721
5944  0fb1 2504          	jrult	L3032
5947  0fb3 a666          	ld	a,#102
5948  0fb5 6b06          	ld	(OFST+6,sp),a
5949  0fb7               L3032:
5950                     ; 1040    	   if(tw >900)	  data =97;	//15min  1700w
5952  0fb7 1e07          	ldw	x,(OFST+7,sp)
5953  0fb9 a30385        	cpw	x,#901
5954  0fbc 2504          	jrult	L5032
5957  0fbe a661          	ld	a,#97
5958  0fc0 6b06          	ld	(OFST+6,sp),a
5959  0fc2               L5032:
5960                     ; 1041    	   if(tw >1200)	  data =85;	//20min  1500w
5962  0fc2 1e07          	ldw	x,(OFST+7,sp)
5963  0fc4 a304b1        	cpw	x,#1201
5964  0fc7 2504          	jrult	L7032
5967  0fc9 a655          	ld	a,#85
5968  0fcb 6b06          	ld	(OFST+6,sp),a
5969  0fcd               L7032:
5970                     ; 1042    	   if(tw >1800)	  data =74;	//30min  1300w
5972  0fcd 1e07          	ldw	x,(OFST+7,sp)
5973  0fcf a30709        	cpw	x,#1801
5974  0fd2 2504          	jrult	L1032
5977  0fd4 a64a          	ld	a,#74
5978  0fd6 6b06          	ld	(OFST+6,sp),a
5979  0fd8               L1032:
5980                     ; 1044     return(data);
5982  0fd8 7b06          	ld	a,(OFST+6,sp)
5985  0fda 85            	popw	x
5986  0fdb 81            	ret
6047                     ; 1046 u8  Zone_Small_Set(u8 level,u8 count,u8 data,u16 tw) 
6047                     ; 1047 {
6048                     	switch	.text
6049  0fdc               _Zone_Small_Set:
6051  0fdc 89            	pushw	x
6052       00000000      OFST:	set	0
6055                     ; 1048       if(level ==10)
6057  0fdd 9e            	ld	a,xh
6058  0fde a10a          	cp	a,#10
6059  0fe0 2619          	jrne	L5432
6060                     ; 1050 	   if(count ==1)  data -=20;	//dec 200w  1600w
6062  0fe2 9f            	ld	a,xl
6063  0fe3 a101          	cp	a,#1
6064  0fe5 2606          	jrne	L7432
6067  0fe7 7b05          	ld	a,(OFST+5,sp)
6068  0fe9 a014          	sub	a,#20
6069  0feb 6b05          	ld	(OFST+5,sp),a
6070  0fed               L7432:
6071                     ; 1051 	   if(count >1)   data -=40;	//dec 400w  1500w
6073  0fed 7b02          	ld	a,(OFST+2,sp)
6074  0fef a102          	cp	a,#2
6075  0ff1 2529          	jrult	L3532
6078  0ff3 7b05          	ld	a,(OFST+5,sp)
6079  0ff5 a028          	sub	a,#40
6080  0ff7 6b05          	ld	(OFST+5,sp),a
6081  0ff9 2021          	jra	L3532
6082  0ffb               L5432:
6083                     ; 1055            if(tw >900)	  data =175;	//15min  1350w
6085  0ffb 1e06          	ldw	x,(OFST+6,sp)
6086  0ffd a30385        	cpw	x,#901
6087  1000 2504          	jrult	L5532
6090  1002 a6af          	ld	a,#175
6091  1004 6b05          	ld	(OFST+5,sp),a
6092  1006               L5532:
6093                     ; 1056    	   if(tw >1200)	  data =162;	//20min  1250w
6095  1006 1e06          	ldw	x,(OFST+6,sp)
6096  1008 a304b1        	cpw	x,#1201
6097  100b 2504          	jrult	L7532
6100  100d a6a2          	ld	a,#162
6101  100f 6b05          	ld	(OFST+5,sp),a
6102  1011               L7532:
6103                     ; 1057    	   if(tw >1800)	  data =133;	//30min	 1150w
6105  1011 1e06          	ldw	x,(OFST+6,sp)
6106  1013 a30709        	cpw	x,#1801
6107  1016 2504          	jrult	L3532
6110  1018 a685          	ld	a,#133
6111  101a 6b05          	ld	(OFST+5,sp),a
6112  101c               L3532:
6113                     ; 1059     return(data);
6115  101c 7b05          	ld	a,(OFST+5,sp)
6118  101e 85            	popw	x
6119  101f 81            	ret
6167                     ; 1061 void time_power_deal(void)
6167                     ; 1062 {
6168                     	switch	.text
6169  1020               _time_power_deal:
6173                     ; 1063    	if(zone_1_level >6)  	//1#  
6175  1020 b694          	ld	a,_zone_1_level
6176  1022 a107          	cp	a,#7
6177  1024 2516          	jrult	L3732
6178                     ; 1065    			time_level_1  = Zone_Big_Set(1,zone_1_level,boost_1_count,arr_1_pow[3],work_1_time);
6180  1026 be8a          	ldw	x,_work_1_time
6181  1028 89            	pushw	x
6182  1029 3b0028        	push	_arr_1_pow+3
6183  102c 3b000c        	push	_boost_1_count
6184  102f b694          	ld	a,_zone_1_level
6185  1031 97            	ld	xl,a
6186  1032 a601          	ld	a,#1
6187  1034 95            	ld	xh,a
6188  1035 cd0f8c        	call	_Zone_Big_Set
6190  1038 5b04          	addw	sp,#4
6191  103a b7bf          	ld	_time_level_1,a
6192  103c               L3732:
6193                     ; 1067    	if(zone_2_level >6)	//2#
6195  103c b695          	ld	a,_zone_2_level
6196  103e a107          	cp	a,#7
6197  1040 2513          	jrult	L5732
6198                     ; 1069    			time_level_2 =Zone_Small_Set(zone_2_level,boost_2_count,arr_2_pow[3],work_2_time);
6200  1042 be8c          	ldw	x,_work_2_time
6201  1044 89            	pushw	x
6202  1045 3b0030        	push	_arr_2_pow+3
6203  1048 c6000d        	ld	a,_boost_2_count
6204  104b 97            	ld	xl,a
6205  104c b695          	ld	a,_zone_2_level
6206  104e 95            	ld	xh,a
6207  104f ad8b          	call	_Zone_Small_Set
6209  1051 5b03          	addw	sp,#3
6210  1053 b7c0          	ld	_time_level_2,a
6211  1055               L5732:
6212                     ; 1071    	if(zone_3_level >6) 	//3#   
6214  1055 b696          	ld	a,_zone_3_level
6215  1057 a107          	cp	a,#7
6216  1059 2516          	jrult	L7732
6217                     ; 1073    			time_level_3  = Zone_Big_Set(3,zone_3_level,boost_3_count,arr_3_pow[3],work_3_time);
6219  105b be8e          	ldw	x,_work_3_time
6220  105d 89            	pushw	x
6221  105e 3b002c        	push	_arr_3_pow+3
6222  1061 3b000e        	push	_boost_3_count
6223  1064 b696          	ld	a,_zone_3_level
6224  1066 97            	ld	xl,a
6225  1067 a603          	ld	a,#3
6226  1069 95            	ld	xh,a
6227  106a cd0f8c        	call	_Zone_Big_Set
6229  106d 5b04          	addw	sp,#4
6230  106f b7c1          	ld	_time_level_3,a
6231  1071               L7732:
6232                     ; 1075    	if(zone_4_level >6)	//4#
6234  1071 b697          	ld	a,_zone_4_level
6235  1073 a107          	cp	a,#7
6236  1075 2514          	jrult	L1042
6237                     ; 1077    			time_level_4 =Zone_Small_Set(zone_4_level,boost_4_count,arr_4_pow[3],work_4_time);
6239  1077 be90          	ldw	x,_work_4_time
6240  1079 89            	pushw	x
6241  107a 3b0034        	push	_arr_4_pow+3
6242  107d c6000f        	ld	a,_boost_4_count
6243  1080 97            	ld	xl,a
6244  1081 b697          	ld	a,_zone_4_level
6245  1083 95            	ld	xh,a
6246  1084 cd0fdc        	call	_Zone_Small_Set
6248  1087 5b03          	addw	sp,#3
6249  1089 b7c2          	ld	_time_level_4,a
6250  108b               L1042:
6251                     ; 1079    	if((zone_1_level)&&(zone_2_level)&&(zone_3_level)&&(zone_4_level))  //1# 2# 3# 4#
6253  108b 3d94          	tnz	_zone_1_level
6254  108d 2762          	jreq	L3042
6256  108f 3d95          	tnz	_zone_2_level
6257  1091 275e          	jreq	L3042
6259  1093 3d96          	tnz	_zone_3_level
6260  1095 275a          	jreq	L3042
6262  1097 3d97          	tnz	_zone_4_level
6263  1099 2756          	jreq	L3042
6264                     ; 1081    			if(limit_time  ==0)  limit_time =1;
6266  109b be92          	ldw	x,_limit_time
6267  109d 2605          	jrne	L5042
6270  109f ae0001        	ldw	x,#1
6271  10a2 bf92          	ldw	_limit_time,x
6272  10a4               L5042:
6273                     ; 1082    			if(limit_time >300)  {time_b_power(80);time_s_power(138);}	  	//05min		 
6275  10a4 be92          	ldw	x,_limit_time
6276  10a6 a3012d        	cpw	x,#301
6277  10a9 250a          	jrult	L7042
6280  10ab a650          	ld	a,#80
6281  10ad cd0f5e        	call	_time_b_power
6285  10b0 a68a          	ld	a,#138
6286  10b2 cd0f75        	call	_time_s_power
6288  10b5               L7042:
6289                     ; 1083 			if(limit_time >600)  {time_b_power(70);time_s_power(128);}		//10min
6291  10b5 be92          	ldw	x,_limit_time
6292  10b7 a30259        	cpw	x,#601
6293  10ba 250a          	jrult	L1142
6296  10bc a646          	ld	a,#70
6297  10be cd0f5e        	call	_time_b_power
6301  10c1 a680          	ld	a,#128
6302  10c3 cd0f75        	call	_time_s_power
6304  10c6               L1142:
6305                     ; 1084 			if(limit_time >1200) {time_b_power(60);time_s_power(117);}		//20min
6307  10c6 be92          	ldw	x,_limit_time
6308  10c8 a304b1        	cpw	x,#1201
6309  10cb 250a          	jrult	L3142
6312  10cd a63c          	ld	a,#60
6313  10cf cd0f5e        	call	_time_b_power
6317  10d2 a675          	ld	a,#117
6318  10d4 cd0f75        	call	_time_s_power
6320  10d7               L3142:
6321                     ; 1085 			if(limit_time >1800) {time_b_power(55);time_s_power(107);}		//30min
6323  10d7 be92          	ldw	x,_limit_time
6324  10d9 a30709        	cpw	x,#1801
6325  10dc 250a          	jrult	L5142
6328  10de a637          	ld	a,#55
6329  10e0 cd0f5e        	call	_time_b_power
6333  10e3 a66b          	ld	a,#107
6334  10e5 cd0f75        	call	_time_s_power
6336  10e8               L5142:
6337                     ; 1087 			limit_time++;
6339  10e8 be92          	ldw	x,_limit_time
6340  10ea 1c0001        	addw	x,#1
6341  10ed bf92          	ldw	_limit_time,x
6343  10ef 2003          	jra	L7142
6344  10f1               L3042:
6345                     ; 1089    	else  limit_time =0;
6347  10f1 5f            	clrw	x
6348  10f2 bf92          	ldw	_limit_time,x
6349  10f4               L7142:
6350                     ; 1090 }  
6353  10f4 81            	ret
6376                     ; 1091 u8 limit_power(void)
6376                     ; 1092 {
6377                     	switch	.text
6378  10f5               _limit_power:
6382                     ; 1113   return(0);
6384  10f5 4f            	clr	a
6387  10f6 81            	ret
6412                     ; 1115 void  short_key_buzzer(void)
6412                     ; 1116 {
6413                     	switch	.text
6414  10f7               _short_key_buzzer:
6418                     ; 1117 	if(key_account == short_press_time)  buzzer_time = buz_200ms; 
6420  10f7 be86          	ldw	x,_key_account
6421  10f9 a30002        	cpw	x,#2
6422  10fc 2604          	jrne	L1442
6425  10fe 35140022      	mov	_buzzer_time,#20
6426  1102               L1442:
6427                     ; 1118 }
6430  1102 81            	ret
6456                     ; 1119 void  inc_dec_deal(void)
6456                     ; 1120 {
6457                     	switch	.text
6458  1103               _inc_dec_deal:
6462                     ; 1121 	short_key_buzzer();
6464  1103 adf2          	call	_short_key_buzzer
6466                     ; 1122 	time_flash_count =10; 
6468  1105 350a0037      	mov	_time_flash_count,#10
6469                     ; 1123        	timer_precise_bz =TRUE;	 
6471  1109 3501001a      	mov	_timer_precise_bz,#1
6472                     ; 1124 }
6475  110d 81            	ret
6500                     ; 1125 void  speed_up(void)
6500                     ; 1126 {
6501                     	switch	.text
6502  110e               _speed_up:
6506                     ; 1128 	Prepare_data_bz =TRUE;
6508  110e 3501001e      	mov	_Prepare_data_bz,#1
6509                     ; 1129 	Flash_500ms_bz =TRUE;
6511  1112 35010019      	mov	_Flash_500ms_bz,#1
6512                     ; 1131 }
6515  1116 81            	ret
6543                     ; 1132 void  on_off_key_deal(void)
6543                     ; 1133 {
6544                     	switch	.text
6545  1117               _on_off_key_deal:
6549                     ; 1134    if(key_account == short_press_time)
6551  1117 be86          	ldw	x,_key_account
6552  1119 a30002        	cpw	x,#2
6553  111c 2619          	jrne	L3742
6554                     ; 1136       buzzer_time = buz_200ms;
6556  111e 35140022      	mov	_buzzer_time,#20
6557                     ; 1137       if(Power_on_bz == TRUE)  {Power_off_deal();idle_count =0;}
6559  1122 b61f          	ld	a,_Power_on_bz
6560  1124 a101          	cp	a,#1
6561  1126 2607          	jrne	L5742
6564  1128 cd0861        	call	_Power_off_deal
6568  112b 3f2c          	clr	_idle_count
6570  112d 2008          	jra	L3742
6571  112f               L5742:
6572                     ; 1138       else         {Power_on_bz=TRUE; idle_count=60;}	
6574  112f 3501001f      	mov	_Power_on_bz,#1
6577  1133 353c002c      	mov	_idle_count,#60
6578  1137               L3742:
6579                     ; 1140 }
6582  1137 81            	ret
6676                     ; 1141 void  boost_x_deal(u8 select,u8 *level1,u8 *level2,u16 *time,u16 *o_time,u16 *tim1,u16 *tim2)
6676                     ; 1142 {
6677                     	switch	.text
6678  1138               _boost_x_deal:
6680  1138 88            	push	a
6681       00000000      OFST:	set	0
6684                     ; 1143      if((key_zone & select)&&(Warm_status &select)==0)
6686  1139 b435          	and	a,_key_zone
6687  113b 2603          	jrne	L222
6688  113d cc11cf        	jp	L3452
6689  1140               L222:
6691  1140 b6d6          	ld	a,_Warm_status
6692  1142 1501          	bcp	a,(OFST+1,sp)
6693  1144 2703          	jreq	L422
6694  1146 cc11cf        	jp	L3452
6695  1149               L422:
6696                     ; 1145          buzzer_time = buz_200ms;
6698  1149 35140022      	mov	_buzzer_time,#20
6699                     ; 1146          zone_flash_count =10;
6701  114d 350a002d      	mov	_zone_flash_count,#10
6702                     ; 1147          if(((select <=Select_2_KEY)&&(flex_L_bz))||((select >Select_2_KEY)&&(flex_R_bz)))
6704  1151 7b01          	ld	a,(OFST+1,sp)
6705  1153 a103          	cp	a,#3
6706  1155 2404          	jruge	L1552
6708  1157 3d44          	tnz	_flex_L_bz
6709  1159 260a          	jrne	L7452
6710  115b               L1552:
6712  115b 7b01          	ld	a,(OFST+1,sp)
6713  115d a103          	cp	a,#3
6714  115f 2524          	jrult	L5452
6716  1161 3d45          	tnz	_flex_R_bz
6717  1163 2720          	jreq	L5452
6718  1165               L7452:
6719                     ; 1149          	if(*time)    (*time) =1; 
6721  1165 1e08          	ldw	x,(OFST+8,sp)
6722  1167 e601          	ld	a,(1,x)
6723  1169 fa            	or	a,(x)
6724  116a 2709          	jreq	L3552
6727  116c 1e08          	ldw	x,(OFST+8,sp)
6728  116e 90ae0001      	ldw	y,#1
6729  1172 ff            	ldw	(x),y
6731  1173 2007          	jra	L5552
6732  1175               L3552:
6733                     ; 1150            	else      (*time) =300;  
6735  1175 1e08          	ldw	x,(OFST+8,sp)
6736  1177 90ae012c      	ldw	y,#300
6737  117b ff            	ldw	(x),y
6738  117c               L5552:
6739                     ; 1151            	flex_deal(select+0x10);
6741  117c 7b01          	ld	a,(OFST+1,sp)
6742  117e ab10          	add	a,#16
6743  1180 cd0045        	call	_flex_deal
6746  1183 204a          	jra	L3452
6747  1185               L5452:
6748                     ; 1155          if((*level2)<=5)
6750  1185 1e06          	ldw	x,(OFST+6,sp)
6751  1187 f6            	ld	a,(x)
6752  1188 a106          	cp	a,#6
6753  118a 2420          	jruge	L1652
6754                     ; 1157      		if(*time)    (*time) =1; 
6756  118c 1e08          	ldw	x,(OFST+8,sp)
6757  118e e601          	ld	a,(1,x)
6758  1190 fa            	or	a,(x)
6759  1191 2709          	jreq	L3652
6762  1193 1e08          	ldw	x,(OFST+8,sp)
6763  1195 90ae0001      	ldw	y,#1
6764  1199 ff            	ldw	(x),y
6766  119a 2007          	jra	L5652
6767  119c               L3652:
6768                     ; 1158            	else      (*time) =300;  
6770  119c 1e08          	ldw	x,(OFST+8,sp)
6771  119e 90ae012c      	ldw	y,#300
6772  11a2 ff            	ldw	(x),y
6773  11a3               L5652:
6774                     ; 1159            	flex_deal(select+0x10);
6776  11a3 7b01          	ld	a,(OFST+1,sp)
6777  11a5 ab10          	add	a,#16
6778  11a7 cd0045        	call	_flex_deal
6781  11aa 2023          	jra	L3452
6782  11ac               L1652:
6783                     ; 1170          	change_count =select;	         	
6785  11ac 7b01          	ld	a,(OFST+1,sp)
6786  11ae b72f          	ld	_change_count,a
6787                     ; 1171          	if(*o_time) (*level1) =5;
6789  11b0 1e0a          	ldw	x,(OFST+10,sp)
6790  11b2 e601          	ld	a,(1,x)
6791  11b4 fa            	or	a,(x)
6792  11b5 2707          	jreq	L1752
6795  11b7 1e04          	ldw	x,(OFST+4,sp)
6796  11b9 a605          	ld	a,#5
6797  11bb f7            	ld	(x),a
6799  11bc 2005          	jra	L3752
6800  11be               L1752:
6801                     ; 1172          	else (*level1) =9;
6803  11be 1e04          	ldw	x,(OFST+4,sp)
6804  11c0 a609          	ld	a,#9
6805  11c2 f7            	ld	(x),a
6806  11c3               L3752:
6807                     ; 1173          	if((timer_status & select)==0) (*tim1)  =arr_default_timer[9];
6809  11c3 b636          	ld	a,_timer_status
6810  11c5 1501          	bcp	a,(OFST+1,sp)
6811  11c7 2606          	jrne	L3452
6814  11c9 1e0c          	ldw	x,(OFST+12,sp)
6815  11cb 90be62        	ldw	y,_arr_default_timer+18
6816  11ce ff            	ldw	(x),y
6817  11cf               L3452:
6818                     ; 1344 }
6821  11cf 84            	pop	a
6822  11d0 81            	ret
6861                     ; 1345 void  boost_key_deal(void)
6861                     ; 1346 {
6862                     	switch	.text
6863  11d1               _boost_key_deal:
6867                     ; 1347    if((key_account == short_press_time)&&(zone_flash_count))
6869  11d1 be86          	ldw	x,_key_account
6870  11d3 a30002        	cpw	x,#2
6871  11d6 2703cc125f    	jrne	L7062
6873  11db 3d2d          	tnz	_zone_flash_count
6874  11dd 27f9          	jreq	L7062
6875                     ; 1349      boost_x_deal(Select_1_KEY,&zone_1_level,&zone_2_level,&boost_time_1,&boost_time_2,&zone_1_timer,&zone_2_timer);
6877  11df ae009c        	ldw	x,#_zone_2_timer
6878  11e2 89            	pushw	x
6879  11e3 ae009a        	ldw	x,#_zone_1_timer
6880  11e6 89            	pushw	x
6881  11e7 ae003e        	ldw	x,#_boost_time_2
6882  11ea 89            	pushw	x
6883  11eb ae003c        	ldw	x,#_boost_time_1
6884  11ee 89            	pushw	x
6885  11ef ae0095        	ldw	x,#_zone_2_level
6886  11f2 89            	pushw	x
6887  11f3 ae0094        	ldw	x,#_zone_1_level
6888  11f6 89            	pushw	x
6889  11f7 a601          	ld	a,#1
6890  11f9 cd1138        	call	_boost_x_deal
6892  11fc 5b0c          	addw	sp,#12
6893                     ; 1350      boost_x_deal(Select_2_KEY,&zone_2_level,&zone_1_level,&boost_time_2,&boost_time_1,&zone_2_timer,&zone_1_timer);
6895  11fe ae009a        	ldw	x,#_zone_1_timer
6896  1201 89            	pushw	x
6897  1202 ae009c        	ldw	x,#_zone_2_timer
6898  1205 89            	pushw	x
6899  1206 ae003c        	ldw	x,#_boost_time_1
6900  1209 89            	pushw	x
6901  120a ae003e        	ldw	x,#_boost_time_2
6902  120d 89            	pushw	x
6903  120e ae0094        	ldw	x,#_zone_1_level
6904  1211 89            	pushw	x
6905  1212 ae0095        	ldw	x,#_zone_2_level
6906  1215 89            	pushw	x
6907  1216 a602          	ld	a,#2
6908  1218 cd1138        	call	_boost_x_deal
6910  121b 5b0c          	addw	sp,#12
6911                     ; 1351      boost_x_deal(Select_3_KEY,&zone_3_level,&zone_4_level,&boost_time_3,&boost_time_4,&zone_3_timer,&zone_4_timer);
6913  121d ae00a0        	ldw	x,#_zone_4_timer
6914  1220 89            	pushw	x
6915  1221 ae009e        	ldw	x,#_zone_3_timer
6916  1224 89            	pushw	x
6917  1225 ae0042        	ldw	x,#_boost_time_4
6918  1228 89            	pushw	x
6919  1229 ae0040        	ldw	x,#_boost_time_3
6920  122c 89            	pushw	x
6921  122d ae0097        	ldw	x,#_zone_4_level
6922  1230 89            	pushw	x
6923  1231 ae0096        	ldw	x,#_zone_3_level
6924  1234 89            	pushw	x
6925  1235 a604          	ld	a,#4
6926  1237 cd1138        	call	_boost_x_deal
6928  123a 5b0c          	addw	sp,#12
6929                     ; 1352      boost_x_deal(Select_4_KEY,&zone_4_level,&zone_3_level,&boost_time_4,&boost_time_3,&zone_4_timer,&zone_3_timer);
6931  123c ae009e        	ldw	x,#_zone_3_timer
6932  123f 89            	pushw	x
6933  1240 ae00a0        	ldw	x,#_zone_4_timer
6934  1243 89            	pushw	x
6935  1244 ae0040        	ldw	x,#_boost_time_3
6936  1247 89            	pushw	x
6937  1248 ae0042        	ldw	x,#_boost_time_4
6938  124b 89            	pushw	x
6939  124c ae0096        	ldw	x,#_zone_3_level
6940  124f 89            	pushw	x
6941  1250 ae0097        	ldw	x,#_zone_4_level
6942  1253 89            	pushw	x
6943  1254 a608          	ld	a,#8
6944  1256 cd1138        	call	_boost_x_deal
6946  1259 5b0c          	addw	sp,#12
6947                     ; 1353      Sec_bz =TRUE;
6949  125b 3501001b      	mov	_Sec_bz,#1
6950  125f               L7062:
6951                     ; 1355 } 
6954  125f 81            	ret
7020                     ; 1357 void  cancel_boost_x_deal(u8 select,u8 *level,u16 *time,u8 *save)
7020                     ; 1358 {    
7021                     	switch	.text
7022  1260               _cancel_boost_x_deal:
7024  1260 88            	push	a
7025       00000000      OFST:	set	0
7028                     ; 1359       if(key_zone == select)
7030  1261 b635          	ld	a,_key_zone
7031  1263 1101          	cp	a,(OFST+1,sp)
7032  1265 2612          	jrne	L3462
7033                     ; 1361      		if(*time)   
7035  1267 1e06          	ldw	x,(OFST+6,sp)
7036  1269 e601          	ld	a,(1,x)
7037  126b fa            	or	a,(x)
7038  126c 270b          	jreq	L3462
7039                     ; 1363      			 (*level) =0;
7041  126e 1e04          	ldw	x,(OFST+4,sp)
7042  1270 7f            	clr	(x)
7043                     ; 1364      			 (*time) =0; 
7045  1271 1e06          	ldw	x,(OFST+6,sp)
7046  1273 905f          	clrw	y
7047  1275 ff            	ldw	(x),y
7048                     ; 1365      			 (*save) =0;
7050  1276 1e08          	ldw	x,(OFST+8,sp)
7051  1278 7f            	clr	(x)
7052  1279               L3462:
7053                     ; 1368 }
7056  1279 84            	pop	a
7057  127a 81            	ret
7099                     ; 1370 void bbq_key_deal(void)
7099                     ; 1371 {
7100                     	switch	.text
7101  127b               _bbq_key_deal:
7105                     ; 1372 	if((key_zone ==Select_1_KEY)||(key_zone ==Select_2_KEY))
7107  127b b635          	ld	a,_key_zone
7108  127d a101          	cp	a,#1
7109  127f 2706          	jreq	L1662
7111  1281 b635          	ld	a,_key_zone
7112  1283 a102          	cp	a,#2
7113  1285 2638          	jrne	L7562
7114  1287               L1662:
7115                     ; 1374 		if(flex_L_bz)	
7117  1287 3d44          	tnz	_flex_L_bz
7118  1289 2734          	jreq	L7562
7119                     ; 1376 				buzzer_time = buz_200ms;
7121  128b 35140022      	mov	_buzzer_time,#20
7122                     ; 1377 				if(bbq_L_bz ==0) 
7124  128f 3d46          	tnz	_bbq_L_bz
7125  1291 2626          	jrne	L5662
7126                     ; 1379 				     	bbq_L_bz =1;
7128  1293 35010046      	mov	_bbq_L_bz,#1
7129                     ; 1380 				        zone_1_level =1;
7131  1297 35010094      	mov	_zone_1_level,#1
7132                     ; 1381 				        zone_2_level =1;
7134  129b 35010095      	mov	_zone_2_level,#1
7135                     ; 1382 				        boost_time_1 =0;
7137  129f 5f            	clrw	x
7138  12a0 bf3c          	ldw	_boost_time_1,x
7139                     ; 1383 				        boost_time_2 =0;
7141  12a2 5f            	clrw	x
7142  12a3 bf3e          	ldw	_boost_time_2,x
7143                     ; 1384 				        timer_status &=~Select_1_KEY;
7145  12a5 72110036      	bres	_timer_status,#0
7146                     ; 1385 				        timer_status &=~Select_2_KEY;
7148  12a9 72130036      	bres	_timer_status,#1
7149                     ; 1386 				        zone_1_timer =120;
7151  12ad ae0078        	ldw	x,#120
7152  12b0 bf9a          	ldw	_zone_1_timer,x
7153                     ; 1387 				        zone_2_timer =120;	//default timer
7155  12b2 ae0078        	ldw	x,#120
7156  12b5 bf9c          	ldw	_zone_2_timer,x
7158  12b7 2006          	jra	L7562
7159  12b9               L5662:
7160                     ; 1389 				else {bbq_L_bz =0;zone_1_level =0;zone_2_level =0;}
7162  12b9 3f46          	clr	_bbq_L_bz
7165  12bb 3f94          	clr	_zone_1_level
7168  12bd 3f95          	clr	_zone_2_level
7169  12bf               L7562:
7170                     ; 1392 	if((key_zone ==Select_3_KEY)||(key_zone ==Select_4_KEY))
7172  12bf b635          	ld	a,_key_zone
7173  12c1 a104          	cp	a,#4
7174  12c3 2706          	jreq	L3762
7176  12c5 b635          	ld	a,_key_zone
7177  12c7 a108          	cp	a,#8
7178  12c9 2638          	jrne	L1762
7179  12cb               L3762:
7180                     ; 1394 		if(flex_R_bz)	
7182  12cb 3d45          	tnz	_flex_R_bz
7183  12cd 2734          	jreq	L1762
7184                     ; 1396 				buzzer_time = buz_200ms;
7186  12cf 35140022      	mov	_buzzer_time,#20
7187                     ; 1397 				if(bbq_R_bz ==0) 
7189  12d3 3d47          	tnz	_bbq_R_bz
7190  12d5 2626          	jrne	L7762
7191                     ; 1399 					   bbq_R_bz =1;
7193  12d7 35010047      	mov	_bbq_R_bz,#1
7194                     ; 1400 					   zone_3_level =1;
7196  12db 35010096      	mov	_zone_3_level,#1
7197                     ; 1401 					   zone_4_level =1;
7199  12df 35010097      	mov	_zone_4_level,#1
7200                     ; 1402 					   boost_time_3 =0;
7202  12e3 5f            	clrw	x
7203  12e4 bf40          	ldw	_boost_time_3,x
7204                     ; 1403 				           boost_time_4 =0;
7206  12e6 5f            	clrw	x
7207  12e7 bf42          	ldw	_boost_time_4,x
7208                     ; 1404 					   timer_status &=~Select_3_KEY;
7210  12e9 72150036      	bres	_timer_status,#2
7211                     ; 1405 				           timer_status &=~Select_4_KEY;
7213  12ed 72170036      	bres	_timer_status,#3
7214                     ; 1406 					   zone_3_timer =120;
7216  12f1 ae0078        	ldw	x,#120
7217  12f4 bf9e          	ldw	_zone_3_timer,x
7218                     ; 1407 					   zone_4_timer =120;	//default timer
7220  12f6 ae0078        	ldw	x,#120
7221  12f9 bfa0          	ldw	_zone_4_timer,x
7223  12fb 2006          	jra	L1762
7224  12fd               L7762:
7225                     ; 1409 				else {bbq_R_bz =0;zone_3_level =0;zone_4_level =0;}
7227  12fd 3f47          	clr	_bbq_R_bz
7230  12ff 3f96          	clr	_zone_3_level
7233  1301 3f97          	clr	_zone_4_level
7234  1303               L1762:
7235                     ; 1412 }
7238  1303 81            	ret
7276                     ; 1413 void  flex_L_key_deal(void)
7276                     ; 1414 {
7277                     	switch	.text
7278  1304               _flex_L_key_deal:
7282                     ; 1415      	if((key_zone ==Select_1_KEY)||(key_zone ==Select_2_KEY))
7284  1304 b635          	ld	a,_key_zone
7285  1306 a101          	cp	a,#1
7286  1308 2706          	jreq	L5172
7288  130a b635          	ld	a,_key_zone
7289  130c a102          	cp	a,#2
7290  130e 2660          	jrne	L3172
7291  1310               L5172:
7292                     ; 1417      	 	buzzer_time = buz_200ms;
7294  1310 35140022      	mov	_buzzer_time,#20
7295                     ; 1418      	 	zone_flash_count =10;
7297  1314 350a002d      	mov	_zone_flash_count,#10
7298                     ; 1420      	 	if(flex_L_bz ==0)  
7300  1318 3d44          	tnz	_flex_L_bz
7301  131a 262e          	jrne	L7172
7302                     ; 1422      	 	  if((Warm_status &Select_1_KEY)||(Warm_status &Select_2_KEY))	;
7304  131c b6d6          	ld	a,_Warm_status
7305  131e a501          	bcp	a,#1
7306  1320 264e          	jrne	L3172
7308  1322 b6d6          	ld	a,_Warm_status
7309  1324 a502          	bcp	a,#2
7310  1326 2648          	jrne	L3172
7311                     ; 1425      	 		flex_L_bz =1;
7313  1328 35010044      	mov	_flex_L_bz,#1
7314                     ; 1426      	 		if(key_zone ==Select_1_KEY)       {flex_deal(0x11);boost_2_save =boost_1_save;}
7316  132c b635          	ld	a,_key_zone
7317  132e a101          	cp	a,#1
7318  1330 2608          	jrne	L7272
7321  1332 a611          	ld	a,#17
7322  1334 cd0045        	call	_flex_deal
7326  1337 454c4d        	mov	_boost_2_save,_boost_1_save
7327  133a               L7272:
7328                     ; 1427      	 		if(key_zone ==Select_2_KEY)       {flex_deal(0x12);boost_1_save =boost_2_save;}
7330  133a b635          	ld	a,_key_zone
7331  133c a102          	cp	a,#2
7332  133e 2630          	jrne	L3172
7335  1340 a612          	ld	a,#18
7336  1342 cd0045        	call	_flex_deal
7340  1345 454d4c        	mov	_boost_1_save,_boost_2_save
7341  1348 2026          	jra	L3172
7342  134a               L7172:
7343                     ; 1432      			flex_L_bz =0;
7345  134a 3f44          	clr	_flex_L_bz
7346                     ; 1433      			if(bbq_L_bz)  {bbq_L_bz =0;zone_1_level =0;zone_2_level =0;}
7348  134c 3d46          	tnz	_bbq_L_bz
7349  134e 2706          	jreq	L5372
7352  1350 3f46          	clr	_bbq_L_bz
7355  1352 3f94          	clr	_zone_1_level
7358  1354 3f95          	clr	_zone_2_level
7359  1356               L5372:
7360                     ; 1434      			zone_1_nopan_time =0;
7362  1356 3f6c          	clr	_zone_1_nopan_time
7363                     ; 1435      			zone_2_nopan_time =0;
7365  1358 3f6d          	clr	_zone_2_nopan_time
7366                     ; 1436      			if(zone_1_level ==10)   boost_time_1 =1;
7368  135a b694          	ld	a,_zone_1_level
7369  135c a10a          	cp	a,#10
7370  135e 2605          	jrne	L7372
7373  1360 ae0001        	ldw	x,#1
7374  1363 bf3c          	ldw	_boost_time_1,x
7375  1365               L7372:
7376                     ; 1437      			if(zone_2_level ==10)   boost_time_2 =1;
7378  1365 b695          	ld	a,_zone_2_level
7379  1367 a10a          	cp	a,#10
7380  1369 2605          	jrne	L3172
7383  136b ae0001        	ldw	x,#1
7384  136e bf3e          	ldw	_boost_time_2,x
7385  1370               L3172:
7386                     ; 1440 } 
7389  1370 81            	ret
7427                     ; 1441 void  flex_R_key_deal(void)
7427                     ; 1442 {
7428                     	switch	.text
7429  1371               _flex_R_key_deal:
7433                     ; 1443      	 if((key_zone ==Select_3_KEY)||(key_zone ==Select_4_KEY))
7435  1371 b635          	ld	a,_key_zone
7436  1373 a104          	cp	a,#4
7437  1375 2706          	jreq	L5572
7439  1377 b635          	ld	a,_key_zone
7440  1379 a108          	cp	a,#8
7441  137b 2660          	jrne	L3572
7442  137d               L5572:
7443                     ; 1445      	 	buzzer_time = buz_200ms;
7445  137d 35140022      	mov	_buzzer_time,#20
7446                     ; 1446      	 	zone_flash_count =10; 
7448  1381 350a002d      	mov	_zone_flash_count,#10
7449                     ; 1448      	 	if(flex_R_bz ==0)  
7451  1385 3d45          	tnz	_flex_R_bz
7452  1387 262e          	jrne	L7572
7453                     ; 1450      	 	  if((Warm_status &Select_3_KEY)||(Warm_status &Select_4_KEY))	;
7455  1389 b6d6          	ld	a,_Warm_status
7456  138b a504          	bcp	a,#4
7457  138d 264e          	jrne	L3572
7459  138f b6d6          	ld	a,_Warm_status
7460  1391 a508          	bcp	a,#8
7461  1393 2648          	jrne	L3572
7462                     ; 1453      	 		flex_R_bz =1;
7464  1395 35010045      	mov	_flex_R_bz,#1
7465                     ; 1454      	 		if(key_zone ==Select_3_KEY)       {flex_deal(0x14);boost_4_save =boost_3_save;}
7467  1399 b635          	ld	a,_key_zone
7468  139b a104          	cp	a,#4
7469  139d 2608          	jrne	L7672
7472  139f a614          	ld	a,#20
7473  13a1 cd0045        	call	_flex_deal
7477  13a4 454e4f        	mov	_boost_4_save,_boost_3_save
7478  13a7               L7672:
7479                     ; 1455      	 		if(key_zone ==Select_4_KEY)       {flex_deal(0x18);boost_3_save =boost_4_save;}
7481  13a7 b635          	ld	a,_key_zone
7482  13a9 a108          	cp	a,#8
7483  13ab 2630          	jrne	L3572
7486  13ad a618          	ld	a,#24
7487  13af cd0045        	call	_flex_deal
7491  13b2 454f4e        	mov	_boost_3_save,_boost_4_save
7492  13b5 2026          	jra	L3572
7493  13b7               L7572:
7494                     ; 1460      			flex_R_bz =0;
7496  13b7 3f45          	clr	_flex_R_bz
7497                     ; 1461      			if(bbq_R_bz)  {bbq_R_bz =0;zone_3_level =0;zone_4_level =0;}
7499  13b9 3d47          	tnz	_bbq_R_bz
7500  13bb 2706          	jreq	L5772
7503  13bd 3f47          	clr	_bbq_R_bz
7506  13bf 3f96          	clr	_zone_3_level
7509  13c1 3f97          	clr	_zone_4_level
7510  13c3               L5772:
7511                     ; 1462      			zone_3_nopan_time =0;
7513  13c3 3f6e          	clr	_zone_3_nopan_time
7514                     ; 1463      			zone_4_nopan_time =0;
7516  13c5 3f6f          	clr	_zone_4_nopan_time
7517                     ; 1464      			if(zone_3_level ==10)   boost_time_3 =1;
7519  13c7 b696          	ld	a,_zone_3_level
7520  13c9 a10a          	cp	a,#10
7521  13cb 2605          	jrne	L7772
7524  13cd ae0001        	ldw	x,#1
7525  13d0 bf40          	ldw	_boost_time_3,x
7526  13d2               L7772:
7527                     ; 1465      			if(zone_4_level ==10)   boost_time_4 =1; 
7529  13d2 b697          	ld	a,_zone_4_level
7530  13d4 a10a          	cp	a,#10
7531  13d6 2605          	jrne	L3572
7534  13d8 ae0001        	ldw	x,#1
7535  13db bf42          	ldw	_boost_time_4,x
7536  13dd               L3572:
7537                     ; 1468 }  
7540  13dd 81            	ret
7568                     ; 1470 void  lock_key_deal(void)
7568                     ; 1471 {
7569                     	switch	.text
7570  13de               _lock_key_deal:
7574                     ; 1472      if(lock_bz == FALSE) 
7576  13de 3d20          	tnz	_lock_bz
7577  13e0 261c          	jrne	L3103
7578                     ; 1474       	if(key_account == short_press_time)
7580  13e2 be86          	ldw	x,_key_account
7581  13e4 a30002        	cpw	x,#2
7582  13e7 2626          	jrne	L7103
7583                     ; 1476       		buzzer_time = buz_200ms;
7585  13e9 35140022      	mov	_buzzer_time,#20
7586                     ; 1477       		lock_bz =TRUE;
7588  13ed 35010020      	mov	_lock_bz,#1
7589                     ; 1478       		idle_count=60;
7591  13f1 353c002c      	mov	_idle_count,#60
7592                     ; 1479       		key_account =lock_press_time+1;
7594  13f5 ae00fb        	ldw	x,#251
7595  13f8 bf86          	ldw	_key_account,x
7596                     ; 1480       		timer_list =0;
7598  13fa 3fcc          	clr	_timer_list
7599  13fc 2011          	jra	L7103
7600  13fe               L3103:
7601                     ; 1485       	if(key_account == lock_press_time)
7603  13fe be86          	ldw	x,_key_account
7604  1400 a300fa        	cpw	x,#250
7605  1403 260a          	jrne	L7103
7606                     ; 1487       	  	buzzer_time = buz_200ms;
7608  1405 35140022      	mov	_buzzer_time,#20
7609                     ; 1488       	  	lock_bz =FALSE;
7611  1409 3f20          	clr	_lock_bz
7612                     ; 1489       	  	idle_count=60;
7614  140b 353c002c      	mov	_idle_count,#60
7615  140f               L7103:
7616                     ; 1492 }
7619  140f 81            	ret
7676                     ; 1493 void  ktimer_x_deal(u8 select,u16 *p,u8 level)
7676                     ; 1494 {
7677                     	switch	.text
7678  1410               _ktimer_x_deal:
7680  1410 88            	push	a
7681       00000000      OFST:	set	0
7684                     ; 1495    if(key_zone ==select)
7686  1411 b635          	ld	a,_key_zone
7687  1413 1101          	cp	a,(OFST+1,sp)
7688  1415 2630          	jrne	L1503
7689                     ; 1497 	if(timer_status & select) {timer_status &= ~select; (*p) =arr_default_timer[level];}
7691  1417 b636          	ld	a,_timer_status
7692  1419 1501          	bcp	a,(OFST+1,sp)
7693  141b 2716          	jreq	L3503
7696  141d 7b01          	ld	a,(OFST+1,sp)
7697  141f 43            	cpl	a
7698  1420 b436          	and	a,_timer_status
7699  1422 b736          	ld	_timer_status,a
7702  1424 7b06          	ld	a,(OFST+6,sp)
7703  1426 5f            	clrw	x
7704  1427 97            	ld	xl,a
7705  1428 58            	sllw	x
7706  1429 1604          	ldw	y,(OFST+4,sp)
7707  142b 89            	pushw	x
7708  142c ee50          	ldw	x,(_arr_default_timer,x)
7709  142e 90ff          	ldw	(y),x
7710  1430 85            	popw	x
7712  1431 200d          	jra	L5503
7713  1433               L3503:
7714                     ; 1498       	 	else {timer_status |= select; (*p) =default_timer;}
7716  1433 b636          	ld	a,_timer_status
7717  1435 1a01          	or	a,(OFST+1,sp)
7718  1437 b736          	ld	_timer_status,a
7721  1439 1e04          	ldw	x,(OFST+4,sp)
7722  143b 90ae001e      	ldw	y,#30
7723  143f ff            	ldw	(x),y
7724  1440               L5503:
7725                     ; 1499       	 flex_deal(select+0x10);
7727  1440 7b01          	ld	a,(OFST+1,sp)
7728  1442 ab10          	add	a,#16
7729  1444 cd0045        	call	_flex_deal
7731  1447               L1503:
7732                     ; 1501 }
7735  1447 84            	pop	a
7736  1448 81            	ret
7774                     ; 1502 void  timer_key_deal(void)
7774                     ; 1503 {
7775                     	switch	.text
7776  1449               _timer_key_deal:
7780                     ; 1504       if((key_zone) || (timer_status == 0))
7782  1449 3d35          	tnz	_key_zone
7783  144b 2604          	jrne	L1703
7785  144d 3d36          	tnz	_timer_status
7786  144f 2608          	jrne	L7603
7787  1451               L1703:
7788                     ; 1506       	buzzer_time = buz_200ms;     
7790  1451 35140022      	mov	_buzzer_time,#20
7791                     ; 1507         time_flash_count =10;  
7793  1455 350a0037      	mov	_time_flash_count,#10
7794  1459               L7603:
7795                     ; 1510       if(key_zone)
7797  1459 3d35          	tnz	_key_zone
7798  145b 273d          	jreq	L3703
7799                     ; 1512      	  timer_precise_bz =TRUE;
7801  145d 3501001a      	mov	_timer_precise_bz,#1
7802                     ; 1513      	  ktimer_x_deal(Select_1_KEY,&zone_1_timer,zone_1_level);
7804  1461 3b0094        	push	_zone_1_level
7805  1464 ae009a        	ldw	x,#_zone_1_timer
7806  1467 89            	pushw	x
7807  1468 a601          	ld	a,#1
7808  146a ada4          	call	_ktimer_x_deal
7810  146c 5b03          	addw	sp,#3
7811                     ; 1514       	  ktimer_x_deal(Select_2_KEY,&zone_2_timer,zone_2_level);
7813  146e 3b0095        	push	_zone_2_level
7814  1471 ae009c        	ldw	x,#_zone_2_timer
7815  1474 89            	pushw	x
7816  1475 a602          	ld	a,#2
7817  1477 ad97          	call	_ktimer_x_deal
7819  1479 5b03          	addw	sp,#3
7820                     ; 1515       	  ktimer_x_deal(Select_3_KEY,&zone_3_timer,zone_3_level);
7822  147b 3b0096        	push	_zone_3_level
7823  147e ae009e        	ldw	x,#_zone_3_timer
7824  1481 89            	pushw	x
7825  1482 a604          	ld	a,#4
7826  1484 ad8a          	call	_ktimer_x_deal
7828  1486 5b03          	addw	sp,#3
7829                     ; 1516       	  ktimer_x_deal(Select_4_KEY,&zone_4_timer,zone_4_level);
7831  1488 3b0097        	push	_zone_4_level
7832  148b ae00a0        	ldw	x,#_zone_4_timer
7833  148e 89            	pushw	x
7834  148f a608          	ld	a,#8
7835  1491 cd1410        	call	_ktimer_x_deal
7837  1494 5b03          	addw	sp,#3
7838                     ; 1518       	  general_timer =0;
7840  1496 3f98          	clr	_general_timer
7842  1498 2010          	jra	L5703
7843  149a               L3703:
7844                     ; 1522           if(timer_status == 0)    
7846  149a 3d36          	tnz	_timer_status
7847  149c 260c          	jrne	L5703
7848                     ; 1524        	     if(general_timer)  general_timer =0;
7850  149e 3d98          	tnz	_general_timer
7851  14a0 2704          	jreq	L1013
7854  14a2 3f98          	clr	_general_timer
7856  14a4 2004          	jra	L5703
7857  14a6               L1013:
7858                     ; 1525        	     else 	general_timer =default_timer;
7860  14a6 351e0098      	mov	_general_timer,#30
7861  14aa               L5703:
7862                     ; 1528 }
7865  14aa 81            	ret
7904                     ; 1529 void  key_x_deal(u8 select)
7904                     ; 1530 {
7905                     	switch	.text
7906  14ab               _key_x_deal:
7910                     ; 1531 	buzzer_time = buz_200ms; 	 //0.5s continue increase one time 
7912  14ab 35140022      	mov	_buzzer_time,#20
7913                     ; 1532 	key_zone =select;
7915  14af b735          	ld	_key_zone,a
7916                     ; 1534 	zone_flash_count =10;
7918  14b1 350a002d      	mov	_zone_flash_count,#10
7919                     ; 1535 	if(time_flash_count)  time_flash_count =0;	
7921  14b5 3d37          	tnz	_time_flash_count
7922  14b7 2702          	jreq	L3213
7925  14b9 3f37          	clr	_time_flash_count
7926  14bb               L3213:
7927                     ; 1537 	timer_list =0;					     	   	        	        		     		
7929  14bb 3fcc          	clr	_timer_list
7930                     ; 1538 }
7933  14bd 81            	ret
8044                     ; 1539 void  inc_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2,u8 *tiao)
8044                     ; 1540 {
8045                     	switch	.text
8046  14be               _inc_x_key_level:
8048  14be 89            	pushw	x
8049  14bf 88            	push	a
8050       00000001      OFST:	set	1
8053                     ; 1541   u8 save =(*level);
8055  14c0 1e06          	ldw	x,(OFST+5,sp)
8056  14c2 f6            	ld	a,(x)
8057  14c3 6b01          	ld	(OFST+0,sp),a
8058                     ; 1542   if((key_zone ==select) &&((Warm_status &select)==0))
8060  14c5 b635          	ld	a,_key_zone
8061  14c7 110e          	cp	a,(OFST+13,sp)
8062  14c9 2702          	jreq	L252
8063  14cb 2071          	jp	L7713
8064  14cd               L252:
8066  14cd b6d6          	ld	a,_Warm_status
8067  14cf 150e          	bcp	a,(OFST+13,sp)
8068  14d1 266b          	jrne	L7713
8069                     ; 1544       if(time1 ==0)
8071  14d3 1e0a          	ldw	x,(OFST+9,sp)
8072  14d5 265e          	jrne	L1023
8073                     ; 1546     	if(((*count) ==0) && ((*level) ==0))   (*level) = default_level;
8075  14d7 1e02          	ldw	x,(OFST+1,sp)
8076  14d9 7d            	tnz	(x)
8077  14da 260c          	jrne	L3023
8079  14dc 1e06          	ldw	x,(OFST+5,sp)
8080  14de 7d            	tnz	(x)
8081  14df 2607          	jrne	L3023
8084  14e1 1e06          	ldw	x,(OFST+5,sp)
8085  14e3 a605          	ld	a,#5
8086  14e5 f7            	ld	(x),a
8088  14e6 200a          	jra	L5023
8089  14e8               L3023:
8090                     ; 1547         else  if((*level) <9)  (*level)++; 
8092  14e8 1e06          	ldw	x,(OFST+5,sp)
8093  14ea f6            	ld	a,(x)
8094  14eb a109          	cp	a,#9
8095  14ed 2403          	jruge	L5023
8098  14ef 1e06          	ldw	x,(OFST+5,sp)
8099  14f1 7c            	inc	(x)
8100  14f2               L5023:
8101                     ; 1548         if((*level)<7) (*tiao) =0;
8103  14f2 1e06          	ldw	x,(OFST+5,sp)
8104  14f4 f6            	ld	a,(x)
8105  14f5 a107          	cp	a,#7
8106  14f7 2403          	jruge	L1123
8109  14f9 1e13          	ldw	x,(OFST+18,sp)
8110  14fb 7f            	clr	(x)
8111  14fc               L1123:
8112                     ; 1549     	(*count) =1;
8114  14fc 1e02          	ldw	x,(OFST+1,sp)
8115  14fe a601          	ld	a,#1
8116  1500 f7            	ld	(x),a
8117                     ; 1550     	change_count =0;	     		     	
8119  1501 3f2f          	clr	_change_count
8120                     ; 1551     	if(*time2)
8122  1503 1e0c          	ldw	x,(OFST+11,sp)
8123  1505 e601          	ld	a,(1,x)
8124  1507 fa            	or	a,(x)
8125  1508 270c          	jreq	L3123
8126                     ; 1558     	  	   if((*level) >5)  (*level) =5;
8128  150a 1e06          	ldw	x,(OFST+5,sp)
8129  150c f6            	ld	a,(x)
8130  150d a106          	cp	a,#6
8131  150f 2505          	jrult	L3123
8134  1511 1e06          	ldw	x,(OFST+5,sp)
8135  1513 a605          	ld	a,#5
8136  1515 f7            	ld	(x),a
8137  1516               L3123:
8138                     ; 1560     	if(limit_power())  (*level) =save;
8140  1516 cd10f5        	call	_limit_power
8142  1519 4d            	tnz	a
8143  151a 2705          	jreq	L7123
8146  151c 7b01          	ld	a,(OFST+0,sp)
8147  151e 1e06          	ldw	x,(OFST+5,sp)
8148  1520 f7            	ld	(x),a
8149  1521               L7123:
8150                     ; 1561     	if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
8152  1521 b636          	ld	a,_timer_status
8153  1523 150e          	bcp	a,(OFST+13,sp)
8154  1525 260e          	jrne	L1023
8157  1527 1e06          	ldw	x,(OFST+5,sp)
8158  1529 f6            	ld	a,(x)
8159  152a 5f            	clrw	x
8160  152b 97            	ld	xl,a
8161  152c 58            	sllw	x
8162  152d 160f          	ldw	y,(OFST+14,sp)
8163  152f 89            	pushw	x
8164  1530 ee50          	ldw	x,(_arr_default_timer,x)
8165  1532 90ff          	ldw	(y),x
8166  1534 85            	popw	x
8167  1535               L1023:
8168                     ; 1563   	zone_flash_count =10;
8170  1535 350a002d      	mov	_zone_flash_count,#10
8171                     ; 1564 	time_flash_count =0;  	
8173  1539 3f37          	clr	_time_flash_count
8174                     ; 1565      short_key_buzzer();
8176  153b cd10f7        	call	_short_key_buzzer
8178  153e               L7713:
8179                     ; 1567 }
8182  153e 5b03          	addw	sp,#3
8183  1540 81            	ret
8231                     ; 1568 void  inc_x_timer(u8 select,u16 *timer)
8231                     ; 1569 {
8232                     	switch	.text
8233  1541               _inc_x_timer:
8235  1541 88            	push	a
8236       00000000      OFST:	set	0
8239                     ; 1570   if(key_zone ==select) 
8241  1542 b635          	ld	a,_key_zone
8242  1544 1101          	cp	a,(OFST+1,sp)
8243  1546 2645          	jrne	L5423
8244                     ; 1572 	if(timer_status & select) 
8246  1548 b636          	ld	a,_timer_status
8247  154a 1501          	bcp	a,(OFST+1,sp)
8248  154c 271f          	jreq	L7423
8249                     ; 1574         	   if(key_account == short_press_time) (*timer)++;
8251  154e be86          	ldw	x,_key_account
8252  1550 a30002        	cpw	x,#2
8253  1553 260c          	jrne	L1523
8256  1555 1e04          	ldw	x,(OFST+4,sp)
8257  1557 9093          	ldw	y,x
8258  1559 fe            	ldw	x,(x)
8259  155a 1c0001        	addw	x,#1
8260  155d 90ff          	ldw	(y),x
8262  155f 2019          	jra	L5523
8263  1561               L1523:
8264                     ; 1575         	   else (*timer) +=10;
8266  1561 1e04          	ldw	x,(OFST+4,sp)
8267  1563 9093          	ldw	y,x
8268  1565 fe            	ldw	x,(x)
8269  1566 1c000a        	addw	x,#10
8270  1569 90ff          	ldw	(y),x
8271  156b 200d          	jra	L5523
8272  156d               L7423:
8273                     ; 1577            else {timer_status |= select; (*timer) = default_timer;}
8275  156d b636          	ld	a,_timer_status
8276  156f 1a01          	or	a,(OFST+1,sp)
8277  1571 b736          	ld	_timer_status,a
8280  1573 1e04          	ldw	x,(OFST+4,sp)
8281  1575 90ae001e      	ldw	y,#30
8282  1579 ff            	ldw	(x),y
8283  157a               L5523:
8284                     ; 1578         if((*timer) >99)  (*timer)  =0; 
8286  157a 1e04          	ldw	x,(OFST+4,sp)
8287  157c 9093          	ldw	y,x
8288  157e 90fe          	ldw	y,(y)
8289  1580 90a30064      	cpw	y,#100
8290  1584 2505          	jrult	L7523
8293  1586 1e04          	ldw	x,(OFST+4,sp)
8294  1588 905f          	clrw	y
8295  158a ff            	ldw	(x),y
8296  158b               L7523:
8297                     ; 1579         general_timer =0;   //if setting to timer function ,clear counter function
8299  158b 3f98          	clr	_general_timer
8300  158d               L5423:
8301                     ; 1581 }
8304  158d 84            	pop	a
8305  158e 81            	ret
8416                     ; 1582 void  dec_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2,u8 *tiao)
8416                     ; 1583 {
8417                     	switch	.text
8418  158f               _dec_x_key_level:
8420  158f 89            	pushw	x
8421  1590 88            	push	a
8422       00000001      OFST:	set	1
8425                     ; 1584   u8 save =(*level);	
8427  1591 1e06          	ldw	x,(OFST+5,sp)
8428  1593 f6            	ld	a,(x)
8429  1594 6b01          	ld	(OFST+0,sp),a
8430                     ; 1585   if((key_zone ==select) &&((Warm_status &select)==0))
8432  1596 b635          	ld	a,_key_zone
8433  1598 110e          	cp	a,(OFST+13,sp)
8434  159a 266f          	jrne	L3333
8436  159c b6d6          	ld	a,_Warm_status
8437  159e 150e          	bcp	a,(OFST+13,sp)
8438  15a0 2669          	jrne	L3333
8439                     ; 1587    	if(time1 ==0)
8441  15a2 1e0a          	ldw	x,(OFST+9,sp)
8442  15a4 265c          	jrne	L5333
8443                     ; 1589     	   if(((*count) ==0) && ((*level) ==0))  	(*level) = default_level;
8445  15a6 1e02          	ldw	x,(OFST+1,sp)
8446  15a8 7d            	tnz	(x)
8447  15a9 260c          	jrne	L7333
8449  15ab 1e06          	ldw	x,(OFST+5,sp)
8450  15ad 7d            	tnz	(x)
8451  15ae 2607          	jrne	L7333
8454  15b0 1e06          	ldw	x,(OFST+5,sp)
8455  15b2 a605          	ld	a,#5
8456  15b4 f7            	ld	(x),a
8458  15b5 2008          	jra	L1433
8459  15b7               L7333:
8460                     ; 1590 	   else if(*level)  (*level)--;
8462  15b7 1e06          	ldw	x,(OFST+5,sp)
8463  15b9 7d            	tnz	(x)
8464  15ba 2703          	jreq	L1433
8467  15bc 1e06          	ldw	x,(OFST+5,sp)
8468  15be 7a            	dec	(x)
8469  15bf               L1433:
8470                     ; 1591 	   if((*level)<7) (*tiao) =0;
8472  15bf 1e06          	ldw	x,(OFST+5,sp)
8473  15c1 f6            	ld	a,(x)
8474  15c2 a107          	cp	a,#7
8475  15c4 2403          	jruge	L5433
8478  15c6 1e13          	ldw	x,(OFST+18,sp)
8479  15c8 7f            	clr	(x)
8480  15c9               L5433:
8481                     ; 1593     	(*count) =1; 
8483  15c9 1e02          	ldw	x,(OFST+1,sp)
8484  15cb a601          	ld	a,#1
8485  15cd f7            	ld	(x),a
8486                     ; 1594     	change_count =0;
8488  15ce 3f2f          	clr	_change_count
8489                     ; 1595     	if(*time2)
8491  15d0 1e0c          	ldw	x,(OFST+11,sp)
8492  15d2 e601          	ld	a,(1,x)
8493  15d4 fa            	or	a,(x)
8494  15d5 270c          	jreq	L7433
8495                     ; 1602     	  	   if((*level) >5)  (*level) =5;
8497  15d7 1e06          	ldw	x,(OFST+5,sp)
8498  15d9 f6            	ld	a,(x)
8499  15da a106          	cp	a,#6
8500  15dc 2505          	jrult	L7433
8503  15de 1e06          	ldw	x,(OFST+5,sp)
8504  15e0 a605          	ld	a,#5
8505  15e2 f7            	ld	(x),a
8506  15e3               L7433:
8507                     ; 1604     	if(limit_power())  (*level) =save;
8509  15e3 cd10f5        	call	_limit_power
8511  15e6 4d            	tnz	a
8512  15e7 2705          	jreq	L3533
8515  15e9 7b01          	ld	a,(OFST+0,sp)
8516  15eb 1e06          	ldw	x,(OFST+5,sp)
8517  15ed f7            	ld	(x),a
8518  15ee               L3533:
8519                     ; 1605     	if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
8521  15ee b636          	ld	a,_timer_status
8522  15f0 150e          	bcp	a,(OFST+13,sp)
8523  15f2 260e          	jrne	L5333
8526  15f4 1e06          	ldw	x,(OFST+5,sp)
8527  15f6 f6            	ld	a,(x)
8528  15f7 5f            	clrw	x
8529  15f8 97            	ld	xl,a
8530  15f9 58            	sllw	x
8531  15fa 160f          	ldw	y,(OFST+14,sp)
8532  15fc 89            	pushw	x
8533  15fd ee50          	ldw	x,(_arr_default_timer,x)
8534  15ff 90ff          	ldw	(y),x
8535  1601 85            	popw	x
8536  1602               L5333:
8537                     ; 1607     	zone_flash_count =10;
8539  1602 350a002d      	mov	_zone_flash_count,#10
8540                     ; 1608 	time_flash_count =0;   
8542  1606 3f37          	clr	_time_flash_count
8543                     ; 1609   	short_key_buzzer();
8545  1608 cd10f7        	call	_short_key_buzzer
8547  160b               L3333:
8548                     ; 1611 }
8551  160b 5b03          	addw	sp,#3
8552  160d 81            	ret
8600                     ; 1612 void  dec_x_timer(u8 select,u16 *timer)
8600                     ; 1613 {
8601                     	switch	.text
8602  160e               _dec_x_timer:
8604  160e 88            	push	a
8605       00000000      OFST:	set	0
8608                     ; 1614    if(key_zone ==select) 
8610  160f b635          	ld	a,_key_zone
8611  1611 1101          	cp	a,(OFST+1,sp)
8612  1613 2659          	jrne	L1043
8613                     ; 1616 	if(timer_status & select) 
8615  1615 b636          	ld	a,_timer_status
8616  1617 1501          	bcp	a,(OFST+1,sp)
8617  1619 2744          	jreq	L3043
8618                     ; 1618             	if(key_account == short_press_time)
8620  161b be86          	ldw	x,_key_account
8621  161d a30002        	cpw	x,#2
8622  1620 261c          	jrne	L5043
8623                     ; 1620                	   if((*timer)) (*timer)--;
8625  1622 1e04          	ldw	x,(OFST+4,sp)
8626  1624 e601          	ld	a,(1,x)
8627  1626 fa            	or	a,(x)
8628  1627 270c          	jreq	L7043
8631  1629 1e04          	ldw	x,(OFST+4,sp)
8632  162b 9093          	ldw	y,x
8633  162d fe            	ldw	x,(x)
8634  162e 1d0001        	subw	x,#1
8635  1631 90ff          	ldw	(y),x
8637  1633 2037          	jra	L1243
8638  1635               L7043:
8639                     ; 1621                	   else (*timer) =99;
8641  1635 1e04          	ldw	x,(OFST+4,sp)
8642  1637 90ae0063      	ldw	y,#99
8643  163b ff            	ldw	(x),y
8644  163c 202e          	jra	L1243
8645  163e               L5043:
8646                     ; 1625                	   if((*timer) >10) (*timer) -=10;
8648  163e 1e04          	ldw	x,(OFST+4,sp)
8649  1640 9093          	ldw	y,x
8650  1642 90fe          	ldw	y,(y)
8651  1644 90a3000b      	cpw	y,#11
8652  1648 250c          	jrult	L5143
8655  164a 1e04          	ldw	x,(OFST+4,sp)
8656  164c 9093          	ldw	y,x
8657  164e fe            	ldw	x,(x)
8658  164f 1d000a        	subw	x,#10
8659  1652 90ff          	ldw	(y),x
8661  1654 2016          	jra	L1243
8662  1656               L5143:
8663                     ; 1626                	   else (*timer)=99;
8665  1656 1e04          	ldw	x,(OFST+4,sp)
8666  1658 90ae0063      	ldw	y,#99
8667  165c ff            	ldw	(x),y
8668  165d 200d          	jra	L1243
8669  165f               L3043:
8670                     ; 1629          else {timer_status |= select; (*timer) = default_timer;}
8672  165f b636          	ld	a,_timer_status
8673  1661 1a01          	or	a,(OFST+1,sp)
8674  1663 b736          	ld	_timer_status,a
8677  1665 1e04          	ldw	x,(OFST+4,sp)
8678  1667 90ae001e      	ldw	y,#30
8679  166b ff            	ldw	(x),y
8680  166c               L1243:
8681                     ; 1630          general_timer =0;   //if setting to timer function ,clear counter function
8683  166c 3f98          	clr	_general_timer
8684  166e               L1043:
8685                     ; 1632 }
8688  166e 84            	pop	a
8689  166f 81            	ret
8749                     ; 1633 void  inc_key_deal(void)
8749                     ; 1634 {                 
8750                     	switch	.text
8751  1670               _inc_key_deal:
8755                     ; 1635      if(time_flash_count)
8757  1670 3d37          	tnz	_time_flash_count
8758  1672 2771          	jreq	L3343
8759                     ; 1637        	   if(key_zone)
8761  1674 3d35          	tnz	_key_zone
8762  1676 273f          	jreq	L5343
8763                     ; 1639         	inc_x_timer(Select_1_KEY,&zone_1_timer);       			   
8765  1678 ae009a        	ldw	x,#_zone_1_timer
8766  167b 89            	pushw	x
8767  167c a601          	ld	a,#1
8768  167e cd1541        	call	_inc_x_timer
8770  1681 85            	popw	x
8771                     ; 1640         	inc_x_timer(Select_2_KEY,&zone_2_timer);
8773  1682 ae009c        	ldw	x,#_zone_2_timer
8774  1685 89            	pushw	x
8775  1686 a602          	ld	a,#2
8776  1688 cd1541        	call	_inc_x_timer
8778  168b 85            	popw	x
8779                     ; 1641         	inc_x_timer(Select_3_KEY,&zone_3_timer);
8781  168c ae009e        	ldw	x,#_zone_3_timer
8782  168f 89            	pushw	x
8783  1690 a604          	ld	a,#4
8784  1692 cd1541        	call	_inc_x_timer
8786  1695 85            	popw	x
8787                     ; 1642         	inc_x_timer(Select_4_KEY,&zone_4_timer);
8789  1696 ae00a0        	ldw	x,#_zone_4_timer
8790  1699 89            	pushw	x
8791  169a a608          	ld	a,#8
8792  169c cd1541        	call	_inc_x_timer
8794  169f 85            	popw	x
8795                     ; 1644         	inc_dec_deal();
8797  16a0 cd1103        	call	_inc_dec_deal
8799                     ; 1645         	if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
8801  16a3 b635          	ld	a,_key_zone
8802  16a5 a109          	cp	a,#9
8803  16a7 2503          	jrult	L462
8804  16a9 cc17f5        	jp	L5543
8805  16ac               L462:
8808  16ac b635          	ld	a,_key_zone
8809  16ae ab10          	add	a,#16
8810  16b0 cd0045        	call	_flex_deal
8812  16b3 acf517f5      	jpf	L5543
8813  16b7               L5343:
8814                     ; 1649             if(timer_status == 0) 
8816  16b7 3d36          	tnz	_timer_status
8817  16b9 2703          	jreq	L662
8818  16bb cc17f5        	jp	L5543
8819  16be               L662:
8820                     ; 1651          		if(time_flash_count)
8822  16be 3d37          	tnz	_time_flash_count
8823  16c0 2603          	jrne	L072
8824  16c2 cc17f5        	jp	L5543
8825  16c5               L072:
8826                     ; 1653          		    if(key_account == short_press_time) general_timer++;
8828  16c5 be86          	ldw	x,_key_account
8829  16c7 a30002        	cpw	x,#2
8830  16ca 2604          	jrne	L7443
8833  16cc 3c98          	inc	_general_timer
8835  16ce 2006          	jra	L1543
8836  16d0               L7443:
8837                     ; 1654          		    else     general_timer +=10; 
8839  16d0 b698          	ld	a,_general_timer
8840  16d2 ab0a          	add	a,#10
8841  16d4 b798          	ld	_general_timer,a
8842  16d6               L1543:
8843                     ; 1655          		    if(general_timer >99) general_timer =0;
8845  16d6 b698          	ld	a,_general_timer
8846  16d8 a164          	cp	a,#100
8847  16da 2502          	jrult	L3543
8850  16dc 3f98          	clr	_general_timer
8851  16de               L3543:
8852                     ; 1657          		    inc_dec_deal();
8854  16de cd1103        	call	_inc_dec_deal
8856  16e1 acf517f5      	jpf	L5543
8857  16e5               L3343:
8858                     ; 1664      	if(bbq_L_bz ==0) 
8860  16e5 3d46          	tnz	_bbq_L_bz
8861  16e7 2703cc176d    	jrne	L7543
8862                     ; 1666          if(flex_L_bz)
8864  16ec 3d44          	tnz	_flex_L_bz
8865  16ee 2726          	jreq	L1643
8866                     ; 1668             if(((key_zone == Select_1_KEY)&&(boost_time_1))||((key_zone == Select_2_KEY)&&(boost_time_2)))  
8868  16f0 b635          	ld	a,_key_zone
8869  16f2 a101          	cp	a,#1
8870  16f4 2604          	jrne	L7643
8872  16f6 be3c          	ldw	x,_boost_time_1
8873  16f8 260a          	jrne	L5643
8874  16fa               L7643:
8876  16fa b635          	ld	a,_key_zone
8877  16fc a102          	cp	a,#2
8878  16fe 2616          	jrne	L1643
8880  1700 be3e          	ldw	x,_boost_time_2
8881  1702 2712          	jreq	L1643
8882  1704               L5643:
8883                     ; 1670           		zone_1_level =8;boost_time_1 =0;boost_1_save =0;
8885  1704 35080094      	mov	_zone_1_level,#8
8888  1708 5f            	clrw	x
8889  1709 bf3c          	ldw	_boost_time_1,x
8892  170b 3f4c          	clr	_boost_1_save
8893                     ; 1671           		zone_2_level =8;boost_time_2 =0;boost_2_save =0;
8895  170d 35080095      	mov	_zone_2_level,#8
8898  1711 5f            	clrw	x
8899  1712 bf3e          	ldw	_boost_time_2,x
8902  1714 3f4d          	clr	_boost_2_save
8903  1716               L1643:
8904                     ; 1675 	 inc_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&tiao_on_1);			   		     	
8906  1716 ae0000        	ldw	x,#_tiao_on_1
8907  1719 89            	pushw	x
8908  171a ae009c        	ldw	x,#_zone_2_timer
8909  171d 89            	pushw	x
8910  171e ae009a        	ldw	x,#_zone_1_timer
8911  1721 89            	pushw	x
8912  1722 4b01          	push	#1
8913  1724 ae003e        	ldw	x,#_boost_time_2
8914  1727 89            	pushw	x
8915  1728 be3c          	ldw	x,_boost_time_1
8916  172a 89            	pushw	x
8917  172b ae0095        	ldw	x,#_zone_2_level
8918  172e 89            	pushw	x
8919  172f ae0094        	ldw	x,#_zone_1_level
8920  1732 89            	pushw	x
8921  1733 ae0031        	ldw	x,#_count_1_key
8922  1736 cd14be        	call	_inc_x_key_level
8924  1739 5b0f          	addw	sp,#15
8925                     ; 1676 	 inc_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&tiao_on_2);
8927  173b ae0001        	ldw	x,#_tiao_on_2
8928  173e 89            	pushw	x
8929  173f ae009a        	ldw	x,#_zone_1_timer
8930  1742 89            	pushw	x
8931  1743 ae009c        	ldw	x,#_zone_2_timer
8932  1746 89            	pushw	x
8933  1747 4b02          	push	#2
8934  1749 ae003c        	ldw	x,#_boost_time_1
8935  174c 89            	pushw	x
8936  174d be3e          	ldw	x,_boost_time_2
8937  174f 89            	pushw	x
8938  1750 ae0094        	ldw	x,#_zone_1_level
8939  1753 89            	pushw	x
8940  1754 ae0095        	ldw	x,#_zone_2_level
8941  1757 89            	pushw	x
8942  1758 ae0032        	ldw	x,#_count_2_key
8943  175b cd14be        	call	_inc_x_key_level
8945  175e 5b0f          	addw	sp,#15
8946                     ; 1677 	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
8948  1760 b635          	ld	a,_key_zone
8949  1762 a109          	cp	a,#9
8950  1764 2407          	jruge	L7543
8953  1766 b635          	ld	a,_key_zone
8954  1768 ab10          	add	a,#16
8955  176a cd0045        	call	_flex_deal
8957  176d               L7543:
8958                     ; 1679 	if(bbq_R_bz ==0)
8960  176d 3d47          	tnz	_bbq_R_bz
8961  176f 2703cc17f5    	jrne	L5543
8962                     ; 1681          if(flex_R_bz)
8964  1774 3d45          	tnz	_flex_R_bz
8965  1776 2726          	jreq	L5743
8966                     ; 1683              if(((key_zone == Select_3_KEY)&&(boost_time_3))||((key_zone == Select_4_KEY)&&(boost_time_4)))  
8968  1778 b635          	ld	a,_key_zone
8969  177a a104          	cp	a,#4
8970  177c 2604          	jrne	L3053
8972  177e be40          	ldw	x,_boost_time_3
8973  1780 260a          	jrne	L1053
8974  1782               L3053:
8976  1782 b635          	ld	a,_key_zone
8977  1784 a108          	cp	a,#8
8978  1786 2616          	jrne	L5743
8980  1788 be42          	ldw	x,_boost_time_4
8981  178a 2712          	jreq	L5743
8982  178c               L1053:
8983                     ; 1685                		zone_3_level =8;boost_time_3 =0;boost_3_save =0;
8985  178c 35080096      	mov	_zone_3_level,#8
8988  1790 5f            	clrw	x
8989  1791 bf40          	ldw	_boost_time_3,x
8992  1793 3f4e          	clr	_boost_3_save
8993                     ; 1686                 	zone_4_level =8;boost_time_4 =0;boost_4_save =0;
8995  1795 35080097      	mov	_zone_4_level,#8
8998  1799 5f            	clrw	x
8999  179a bf42          	ldw	_boost_time_4,x
9002  179c 3f4f          	clr	_boost_4_save
9003  179e               L5743:
9004                     ; 1690 	 inc_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&tiao_on_3);
9006  179e ae0002        	ldw	x,#_tiao_on_3
9007  17a1 89            	pushw	x
9008  17a2 ae00a0        	ldw	x,#_zone_4_timer
9009  17a5 89            	pushw	x
9010  17a6 ae009e        	ldw	x,#_zone_3_timer
9011  17a9 89            	pushw	x
9012  17aa 4b04          	push	#4
9013  17ac ae0042        	ldw	x,#_boost_time_4
9014  17af 89            	pushw	x
9015  17b0 be40          	ldw	x,_boost_time_3
9016  17b2 89            	pushw	x
9017  17b3 ae0097        	ldw	x,#_zone_4_level
9018  17b6 89            	pushw	x
9019  17b7 ae0096        	ldw	x,#_zone_3_level
9020  17ba 89            	pushw	x
9021  17bb ae0033        	ldw	x,#_count_3_key
9022  17be cd14be        	call	_inc_x_key_level
9024  17c1 5b0f          	addw	sp,#15
9025                     ; 1691 	 inc_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer,&tiao_on_4);
9027  17c3 ae0003        	ldw	x,#_tiao_on_4
9028  17c6 89            	pushw	x
9029  17c7 ae009e        	ldw	x,#_zone_3_timer
9030  17ca 89            	pushw	x
9031  17cb ae00a0        	ldw	x,#_zone_4_timer
9032  17ce 89            	pushw	x
9033  17cf 4b08          	push	#8
9034  17d1 ae0040        	ldw	x,#_boost_time_3
9035  17d4 89            	pushw	x
9036  17d5 be42          	ldw	x,_boost_time_4
9037  17d7 89            	pushw	x
9038  17d8 ae0096        	ldw	x,#_zone_3_level
9039  17db 89            	pushw	x
9040  17dc ae0097        	ldw	x,#_zone_4_level
9041  17df 89            	pushw	x
9042  17e0 ae0034        	ldw	x,#_count_4_key
9043  17e3 cd14be        	call	_inc_x_key_level
9045  17e6 5b0f          	addw	sp,#15
9046                     ; 1693      	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
9048  17e8 b635          	ld	a,_key_zone
9049  17ea a109          	cp	a,#9
9050  17ec 2407          	jruge	L5543
9053  17ee b635          	ld	a,_key_zone
9054  17f0 ab10          	add	a,#16
9055  17f2 cd0045        	call	_flex_deal
9057  17f5               L5543:
9058                     ; 1696 }
9061  17f5 81            	ret
9112                     ; 1697 void  Sinc_key_deal(void) 
9112                     ; 1698 {   
9113                     	switch	.text
9114  17f6               _Sinc_key_deal:
9118                     ; 1699     cancel_boost_x_deal(Select_1_KEY,&zone_1_level,&boost_time_1,&boost_1_save);  
9120  17f6 ae004c        	ldw	x,#_boost_1_save
9121  17f9 89            	pushw	x
9122  17fa ae003c        	ldw	x,#_boost_time_1
9123  17fd 89            	pushw	x
9124  17fe ae0094        	ldw	x,#_zone_1_level
9125  1801 89            	pushw	x
9126  1802 a601          	ld	a,#1
9127  1804 cd1260        	call	_cancel_boost_x_deal
9129  1807 5b06          	addw	sp,#6
9130                     ; 1700     cancel_boost_x_deal(Select_2_KEY,&zone_2_level,&boost_time_2,&boost_2_save);
9132  1809 ae004d        	ldw	x,#_boost_2_save
9133  180c 89            	pushw	x
9134  180d ae003e        	ldw	x,#_boost_time_2
9135  1810 89            	pushw	x
9136  1811 ae0095        	ldw	x,#_zone_2_level
9137  1814 89            	pushw	x
9138  1815 a602          	ld	a,#2
9139  1817 cd1260        	call	_cancel_boost_x_deal
9141  181a 5b06          	addw	sp,#6
9142                     ; 1701     cancel_boost_x_deal(Select_3_KEY,&zone_3_level,&boost_time_3,&boost_3_save);
9144  181c ae004e        	ldw	x,#_boost_3_save
9145  181f 89            	pushw	x
9146  1820 ae0040        	ldw	x,#_boost_time_3
9147  1823 89            	pushw	x
9148  1824 ae0096        	ldw	x,#_zone_3_level
9149  1827 89            	pushw	x
9150  1828 a604          	ld	a,#4
9151  182a cd1260        	call	_cancel_boost_x_deal
9153  182d 5b06          	addw	sp,#6
9154                     ; 1702     cancel_boost_x_deal(Select_4_KEY,&zone_4_level,&boost_time_4,&boost_4_save);    		 	  			
9156  182f ae004f        	ldw	x,#_boost_4_save
9157  1832 89            	pushw	x
9158  1833 ae0042        	ldw	x,#_boost_time_4
9159  1836 89            	pushw	x
9160  1837 ae0097        	ldw	x,#_zone_4_level
9161  183a 89            	pushw	x
9162  183b a608          	ld	a,#8
9163  183d cd1260        	call	_cancel_boost_x_deal
9165  1840 5b06          	addw	sp,#6
9166                     ; 1703 	 inc_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&tiao_on_1); 			   		     	
9168  1842 ae0000        	ldw	x,#_tiao_on_1
9169  1845 89            	pushw	x
9170  1846 ae009c        	ldw	x,#_zone_2_timer
9171  1849 89            	pushw	x
9172  184a ae009a        	ldw	x,#_zone_1_timer
9173  184d 89            	pushw	x
9174  184e 4b01          	push	#1
9175  1850 ae003e        	ldw	x,#_boost_time_2
9176  1853 89            	pushw	x
9177  1854 be3c          	ldw	x,_boost_time_1
9178  1856 89            	pushw	x
9179  1857 ae0095        	ldw	x,#_zone_2_level
9180  185a 89            	pushw	x
9181  185b ae0094        	ldw	x,#_zone_1_level
9182  185e 89            	pushw	x
9183  185f ae0031        	ldw	x,#_count_1_key
9184  1862 cd14be        	call	_inc_x_key_level
9186  1865 5b0f          	addw	sp,#15
9187                     ; 1704 	 inc_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&tiao_on_2);       	  		     	
9189  1867 ae0001        	ldw	x,#_tiao_on_2
9190  186a 89            	pushw	x
9191  186b ae009a        	ldw	x,#_zone_1_timer
9192  186e 89            	pushw	x
9193  186f ae009c        	ldw	x,#_zone_2_timer
9194  1872 89            	pushw	x
9195  1873 4b02          	push	#2
9196  1875 ae003c        	ldw	x,#_boost_time_1
9197  1878 89            	pushw	x
9198  1879 be3e          	ldw	x,_boost_time_2
9199  187b 89            	pushw	x
9200  187c ae0094        	ldw	x,#_zone_1_level
9201  187f 89            	pushw	x
9202  1880 ae0095        	ldw	x,#_zone_2_level
9203  1883 89            	pushw	x
9204  1884 ae0032        	ldw	x,#_count_2_key
9205  1887 cd14be        	call	_inc_x_key_level
9207  188a 5b0f          	addw	sp,#15
9208                     ; 1705 	 inc_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&tiao_on_3);    	   		     	
9210  188c ae0002        	ldw	x,#_tiao_on_3
9211  188f 89            	pushw	x
9212  1890 ae00a0        	ldw	x,#_zone_4_timer
9213  1893 89            	pushw	x
9214  1894 ae009e        	ldw	x,#_zone_3_timer
9215  1897 89            	pushw	x
9216  1898 4b04          	push	#4
9217  189a ae0042        	ldw	x,#_boost_time_4
9218  189d 89            	pushw	x
9219  189e be40          	ldw	x,_boost_time_3
9220  18a0 89            	pushw	x
9221  18a1 ae0097        	ldw	x,#_zone_4_level
9222  18a4 89            	pushw	x
9223  18a5 ae0096        	ldw	x,#_zone_3_level
9224  18a8 89            	pushw	x
9225  18a9 ae0033        	ldw	x,#_count_3_key
9226  18ac cd14be        	call	_inc_x_key_level
9228  18af 5b0f          	addw	sp,#15
9229                     ; 1706 	 inc_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer,&tiao_on_4); 
9231  18b1 ae0003        	ldw	x,#_tiao_on_4
9232  18b4 89            	pushw	x
9233  18b5 ae009e        	ldw	x,#_zone_3_timer
9234  18b8 89            	pushw	x
9235  18b9 ae00a0        	ldw	x,#_zone_4_timer
9236  18bc 89            	pushw	x
9237  18bd 4b08          	push	#8
9238  18bf ae0040        	ldw	x,#_boost_time_3
9239  18c2 89            	pushw	x
9240  18c3 be42          	ldw	x,_boost_time_4
9241  18c5 89            	pushw	x
9242  18c6 ae0096        	ldw	x,#_zone_3_level
9243  18c9 89            	pushw	x
9244  18ca ae0097        	ldw	x,#_zone_4_level
9245  18cd 89            	pushw	x
9246  18ce ae0034        	ldw	x,#_count_4_key
9247  18d1 cd14be        	call	_inc_x_key_level
9249  18d4 5b0f          	addw	sp,#15
9250                     ; 1707 	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);     				                 		 			
9252  18d6 b635          	ld	a,_key_zone
9253  18d8 a109          	cp	a,#9
9254  18da 2407          	jruge	L7153
9257  18dc b635          	ld	a,_key_zone
9258  18de ab10          	add	a,#16
9259  18e0 cd0045        	call	_flex_deal
9261  18e3               L7153:
9262                     ; 1708 }
9265  18e3 81            	ret
9325                     ; 1709 void  dec_key_deal(void)
9325                     ; 1710 {                   
9326                     	switch	.text
9327  18e4               _dec_key_deal:
9331                     ; 1711      if(time_flash_count)
9333  18e4 3d37          	tnz	_time_flash_count
9334  18e6 277c          	jreq	L1353
9335                     ; 1713          if(key_zone)
9337  18e8 3d35          	tnz	_key_zone
9338  18ea 273f          	jreq	L3353
9339                     ; 1715          	 dec_x_timer(Select_1_KEY,&zone_1_timer);   	     
9341  18ec ae009a        	ldw	x,#_zone_1_timer
9342  18ef 89            	pushw	x
9343  18f0 a601          	ld	a,#1
9344  18f2 cd160e        	call	_dec_x_timer
9346  18f5 85            	popw	x
9347                     ; 1716          	 dec_x_timer(Select_2_KEY,&zone_2_timer);  
9349  18f6 ae009c        	ldw	x,#_zone_2_timer
9350  18f9 89            	pushw	x
9351  18fa a602          	ld	a,#2
9352  18fc cd160e        	call	_dec_x_timer
9354  18ff 85            	popw	x
9355                     ; 1717          	 dec_x_timer(Select_3_KEY,&zone_3_timer);   
9357  1900 ae009e        	ldw	x,#_zone_3_timer
9358  1903 89            	pushw	x
9359  1904 a604          	ld	a,#4
9360  1906 cd160e        	call	_dec_x_timer
9362  1909 85            	popw	x
9363                     ; 1718          	 dec_x_timer(Select_4_KEY,&zone_4_timer);
9365  190a ae00a0        	ldw	x,#_zone_4_timer
9366  190d 89            	pushw	x
9367  190e a608          	ld	a,#8
9368  1910 cd160e        	call	_dec_x_timer
9370  1913 85            	popw	x
9371                     ; 1720          	 inc_dec_deal();
9373  1914 cd1103        	call	_inc_dec_deal
9375                     ; 1721          	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);		  			  
9377  1917 b635          	ld	a,_key_zone
9378  1919 a109          	cp	a,#9
9379  191b 2503          	jrult	L672
9380  191d cc1a74        	jp	L1653
9381  1920               L672:
9384  1920 b635          	ld	a,_key_zone
9385  1922 ab10          	add	a,#16
9386  1924 cd0045        	call	_flex_deal
9388  1927 ac741a74      	jpf	L1653
9389  192b               L3353:
9390                     ; 1725          if(timer_status == 0)   
9392  192b 3d36          	tnz	_timer_status
9393  192d 2703          	jreq	L003
9394  192f cc1a74        	jp	L1653
9395  1932               L003:
9396                     ; 1727          	if(time_flash_count)
9398  1932 3d37          	tnz	_time_flash_count
9399  1934 2727          	jreq	L3453
9400                     ; 1729               		if(key_account == short_press_time)
9402  1936 be86          	ldw	x,_key_account
9403  1938 a30002        	cpw	x,#2
9404  193b 260e          	jrne	L5453
9405                     ; 1731           				if(general_timer) general_timer--;
9407  193d 3d98          	tnz	_general_timer
9408  193f 2704          	jreq	L7453
9411  1941 3a98          	dec	_general_timer
9413  1943 2018          	jra	L3453
9414  1945               L7453:
9415                     ; 1732           				else general_timer =99;
9417  1945 35630098      	mov	_general_timer,#99
9418  1949 2012          	jra	L3453
9419  194b               L5453:
9420                     ; 1734              		else if(general_timer >10) general_timer -=10;
9422  194b b698          	ld	a,_general_timer
9423  194d a10b          	cp	a,#11
9424  194f 2508          	jrult	L5553
9427  1951 b698          	ld	a,_general_timer
9428  1953 a00a          	sub	a,#10
9429  1955 b798          	ld	_general_timer,a
9431  1957 2004          	jra	L3453
9432  1959               L5553:
9433                     ; 1735                   	else general_timer=99; 
9435  1959 35630098      	mov	_general_timer,#99
9436  195d               L3453:
9437                     ; 1738                  inc_dec_deal();
9439  195d cd1103        	call	_inc_dec_deal
9441  1960 ac741a74      	jpf	L1653
9442  1964               L1353:
9443                     ; 1744       	if(bbq_L_bz ==0) 
9445  1964 3d46          	tnz	_bbq_L_bz
9446  1966 2703cc19ec    	jrne	L3653
9447                     ; 1746          if(flex_L_bz)
9449  196b 3d44          	tnz	_flex_L_bz
9450  196d 2726          	jreq	L5653
9451                     ; 1748             if(((key_zone == Select_1_KEY)&&(boost_time_1))||((key_zone == Select_2_KEY)&&(boost_time_2)))  
9453  196f b635          	ld	a,_key_zone
9454  1971 a101          	cp	a,#1
9455  1973 2604          	jrne	L3753
9457  1975 be3c          	ldw	x,_boost_time_1
9458  1977 260a          	jrne	L1753
9459  1979               L3753:
9461  1979 b635          	ld	a,_key_zone
9462  197b a102          	cp	a,#2
9463  197d 2616          	jrne	L5653
9465  197f be3e          	ldw	x,_boost_time_2
9466  1981 2712          	jreq	L5653
9467  1983               L1753:
9468                     ; 1750           		zone_1_level =2;boost_time_1 =0;boost_1_save =0;
9470  1983 35020094      	mov	_zone_1_level,#2
9473  1987 5f            	clrw	x
9474  1988 bf3c          	ldw	_boost_time_1,x
9477  198a 3f4c          	clr	_boost_1_save
9478                     ; 1751           		zone_2_level =2;boost_time_2 =0;boost_2_save =0;
9480  198c 35020095      	mov	_zone_2_level,#2
9483  1990 5f            	clrw	x
9484  1991 bf3e          	ldw	_boost_time_2,x
9487  1993 3f4d          	clr	_boost_2_save
9488  1995               L5653:
9489                     ; 1755          dec_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&tiao_on_1);			   		     	
9491  1995 ae0000        	ldw	x,#_tiao_on_1
9492  1998 89            	pushw	x
9493  1999 ae009c        	ldw	x,#_zone_2_timer
9494  199c 89            	pushw	x
9495  199d ae009a        	ldw	x,#_zone_1_timer
9496  19a0 89            	pushw	x
9497  19a1 4b01          	push	#1
9498  19a3 ae003e        	ldw	x,#_boost_time_2
9499  19a6 89            	pushw	x
9500  19a7 be3c          	ldw	x,_boost_time_1
9501  19a9 89            	pushw	x
9502  19aa ae0095        	ldw	x,#_zone_2_level
9503  19ad 89            	pushw	x
9504  19ae ae0094        	ldw	x,#_zone_1_level
9505  19b1 89            	pushw	x
9506  19b2 ae0031        	ldw	x,#_count_1_key
9507  19b5 cd158f        	call	_dec_x_key_level
9509  19b8 5b0f          	addw	sp,#15
9510                     ; 1756 	 dec_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&tiao_on_2);
9512  19ba ae0001        	ldw	x,#_tiao_on_2
9513  19bd 89            	pushw	x
9514  19be ae009a        	ldw	x,#_zone_1_timer
9515  19c1 89            	pushw	x
9516  19c2 ae009c        	ldw	x,#_zone_2_timer
9517  19c5 89            	pushw	x
9518  19c6 4b02          	push	#2
9519  19c8 ae003c        	ldw	x,#_boost_time_1
9520  19cb 89            	pushw	x
9521  19cc be3e          	ldw	x,_boost_time_2
9522  19ce 89            	pushw	x
9523  19cf ae0094        	ldw	x,#_zone_1_level
9524  19d2 89            	pushw	x
9525  19d3 ae0095        	ldw	x,#_zone_2_level
9526  19d6 89            	pushw	x
9527  19d7 ae0032        	ldw	x,#_count_2_key
9528  19da cd158f        	call	_dec_x_key_level
9530  19dd 5b0f          	addw	sp,#15
9531                     ; 1757 	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
9533  19df b635          	ld	a,_key_zone
9534  19e1 a109          	cp	a,#9
9535  19e3 2407          	jruge	L3653
9538  19e5 b635          	ld	a,_key_zone
9539  19e7 ab10          	add	a,#16
9540  19e9 cd0045        	call	_flex_deal
9542  19ec               L3653:
9543                     ; 1759 	if(bbq_R_bz ==0)
9545  19ec 3d47          	tnz	_bbq_R_bz
9546  19ee 2703cc1a74    	jrne	L1653
9547                     ; 1761          if(flex_R_bz)
9549  19f3 3d45          	tnz	_flex_R_bz
9550  19f5 2726          	jreq	L1063
9551                     ; 1763              if(((key_zone == Select_3_KEY)&&(boost_time_3))||((key_zone == Select_4_KEY)&&(boost_time_4)))  
9553  19f7 b635          	ld	a,_key_zone
9554  19f9 a104          	cp	a,#4
9555  19fb 2604          	jrne	L7063
9557  19fd be40          	ldw	x,_boost_time_3
9558  19ff 260a          	jrne	L5063
9559  1a01               L7063:
9561  1a01 b635          	ld	a,_key_zone
9562  1a03 a108          	cp	a,#8
9563  1a05 2616          	jrne	L1063
9565  1a07 be42          	ldw	x,_boost_time_4
9566  1a09 2712          	jreq	L1063
9567  1a0b               L5063:
9568                     ; 1765                		zone_3_level =2;boost_time_3 =0;boost_3_save =0;
9570  1a0b 35020096      	mov	_zone_3_level,#2
9573  1a0f 5f            	clrw	x
9574  1a10 bf40          	ldw	_boost_time_3,x
9577  1a12 3f4e          	clr	_boost_3_save
9578                     ; 1766                 	zone_4_level =2;boost_time_4 =0;boost_4_save =0;
9580  1a14 35020097      	mov	_zone_4_level,#2
9583  1a18 5f            	clrw	x
9584  1a19 bf42          	ldw	_boost_time_4,x
9587  1a1b 3f4f          	clr	_boost_4_save
9588  1a1d               L1063:
9589                     ; 1770 	 dec_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&tiao_on_3);
9591  1a1d ae0002        	ldw	x,#_tiao_on_3
9592  1a20 89            	pushw	x
9593  1a21 ae00a0        	ldw	x,#_zone_4_timer
9594  1a24 89            	pushw	x
9595  1a25 ae009e        	ldw	x,#_zone_3_timer
9596  1a28 89            	pushw	x
9597  1a29 4b04          	push	#4
9598  1a2b ae0042        	ldw	x,#_boost_time_4
9599  1a2e 89            	pushw	x
9600  1a2f be40          	ldw	x,_boost_time_3
9601  1a31 89            	pushw	x
9602  1a32 ae0097        	ldw	x,#_zone_4_level
9603  1a35 89            	pushw	x
9604  1a36 ae0096        	ldw	x,#_zone_3_level
9605  1a39 89            	pushw	x
9606  1a3a ae0033        	ldw	x,#_count_3_key
9607  1a3d cd158f        	call	_dec_x_key_level
9609  1a40 5b0f          	addw	sp,#15
9610                     ; 1771 	 dec_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer,&tiao_on_4);
9612  1a42 ae0003        	ldw	x,#_tiao_on_4
9613  1a45 89            	pushw	x
9614  1a46 ae009e        	ldw	x,#_zone_3_timer
9615  1a49 89            	pushw	x
9616  1a4a ae00a0        	ldw	x,#_zone_4_timer
9617  1a4d 89            	pushw	x
9618  1a4e 4b08          	push	#8
9619  1a50 ae0040        	ldw	x,#_boost_time_3
9620  1a53 89            	pushw	x
9621  1a54 be42          	ldw	x,_boost_time_4
9622  1a56 89            	pushw	x
9623  1a57 ae0096        	ldw	x,#_zone_3_level
9624  1a5a 89            	pushw	x
9625  1a5b ae0097        	ldw	x,#_zone_4_level
9626  1a5e 89            	pushw	x
9627  1a5f ae0034        	ldw	x,#_count_4_key
9628  1a62 cd158f        	call	_dec_x_key_level
9630  1a65 5b0f          	addw	sp,#15
9631                     ; 1773          if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
9633  1a67 b635          	ld	a,_key_zone
9634  1a69 a109          	cp	a,#9
9635  1a6b 2407          	jruge	L1653
9638  1a6d b635          	ld	a,_key_zone
9639  1a6f ab10          	add	a,#16
9640  1a71 cd0045        	call	_flex_deal
9642  1a74               L1653:
9643                     ; 1776 }
9646  1a74 81            	ret
9697                     ; 1777 void  Sdec_key_deal(void)
9697                     ; 1778 {
9698                     	switch	.text
9699  1a75               _Sdec_key_deal:
9703                     ; 1779     cancel_boost_x_deal(Select_1_KEY,&zone_1_level,&boost_time_1,&boost_1_save);  
9705  1a75 ae004c        	ldw	x,#_boost_1_save
9706  1a78 89            	pushw	x
9707  1a79 ae003c        	ldw	x,#_boost_time_1
9708  1a7c 89            	pushw	x
9709  1a7d ae0094        	ldw	x,#_zone_1_level
9710  1a80 89            	pushw	x
9711  1a81 a601          	ld	a,#1
9712  1a83 cd1260        	call	_cancel_boost_x_deal
9714  1a86 5b06          	addw	sp,#6
9715                     ; 1780     cancel_boost_x_deal(Select_2_KEY,&zone_2_level,&boost_time_2,&boost_2_save);
9717  1a88 ae004d        	ldw	x,#_boost_2_save
9718  1a8b 89            	pushw	x
9719  1a8c ae003e        	ldw	x,#_boost_time_2
9720  1a8f 89            	pushw	x
9721  1a90 ae0095        	ldw	x,#_zone_2_level
9722  1a93 89            	pushw	x
9723  1a94 a602          	ld	a,#2
9724  1a96 cd1260        	call	_cancel_boost_x_deal
9726  1a99 5b06          	addw	sp,#6
9727                     ; 1781     cancel_boost_x_deal(Select_3_KEY,&zone_3_level,&boost_time_3,&boost_3_save);
9729  1a9b ae004e        	ldw	x,#_boost_3_save
9730  1a9e 89            	pushw	x
9731  1a9f ae0040        	ldw	x,#_boost_time_3
9732  1aa2 89            	pushw	x
9733  1aa3 ae0096        	ldw	x,#_zone_3_level
9734  1aa6 89            	pushw	x
9735  1aa7 a604          	ld	a,#4
9736  1aa9 cd1260        	call	_cancel_boost_x_deal
9738  1aac 5b06          	addw	sp,#6
9739                     ; 1782     cancel_boost_x_deal(Select_4_KEY,&zone_4_level,&boost_time_4,&boost_4_save);
9741  1aae ae004f        	ldw	x,#_boost_4_save
9742  1ab1 89            	pushw	x
9743  1ab2 ae0042        	ldw	x,#_boost_time_4
9744  1ab5 89            	pushw	x
9745  1ab6 ae0097        	ldw	x,#_zone_4_level
9746  1ab9 89            	pushw	x
9747  1aba a608          	ld	a,#8
9748  1abc cd1260        	call	_cancel_boost_x_deal
9750  1abf 5b06          	addw	sp,#6
9751                     ; 1784         dec_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&tiao_on_1);
9753  1ac1 ae0000        	ldw	x,#_tiao_on_1
9754  1ac4 89            	pushw	x
9755  1ac5 ae009c        	ldw	x,#_zone_2_timer
9756  1ac8 89            	pushw	x
9757  1ac9 ae009a        	ldw	x,#_zone_1_timer
9758  1acc 89            	pushw	x
9759  1acd 4b01          	push	#1
9760  1acf ae003e        	ldw	x,#_boost_time_2
9761  1ad2 89            	pushw	x
9762  1ad3 be3c          	ldw	x,_boost_time_1
9763  1ad5 89            	pushw	x
9764  1ad6 ae0095        	ldw	x,#_zone_2_level
9765  1ad9 89            	pushw	x
9766  1ada ae0094        	ldw	x,#_zone_1_level
9767  1add 89            	pushw	x
9768  1ade ae0031        	ldw	x,#_count_1_key
9769  1ae1 cd158f        	call	_dec_x_key_level
9771  1ae4 5b0f          	addw	sp,#15
9772                     ; 1785 	dec_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&tiao_on_2);
9774  1ae6 ae0001        	ldw	x,#_tiao_on_2
9775  1ae9 89            	pushw	x
9776  1aea ae009a        	ldw	x,#_zone_1_timer
9777  1aed 89            	pushw	x
9778  1aee ae009c        	ldw	x,#_zone_2_timer
9779  1af1 89            	pushw	x
9780  1af2 4b02          	push	#2
9781  1af4 ae003c        	ldw	x,#_boost_time_1
9782  1af7 89            	pushw	x
9783  1af8 be3e          	ldw	x,_boost_time_2
9784  1afa 89            	pushw	x
9785  1afb ae0094        	ldw	x,#_zone_1_level
9786  1afe 89            	pushw	x
9787  1aff ae0095        	ldw	x,#_zone_2_level
9788  1b02 89            	pushw	x
9789  1b03 ae0032        	ldw	x,#_count_2_key
9790  1b06 cd158f        	call	_dec_x_key_level
9792  1b09 5b0f          	addw	sp,#15
9793                     ; 1786 	dec_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&tiao_on_3);         	 	
9795  1b0b ae0002        	ldw	x,#_tiao_on_3
9796  1b0e 89            	pushw	x
9797  1b0f ae00a0        	ldw	x,#_zone_4_timer
9798  1b12 89            	pushw	x
9799  1b13 ae009e        	ldw	x,#_zone_3_timer
9800  1b16 89            	pushw	x
9801  1b17 4b04          	push	#4
9802  1b19 ae0042        	ldw	x,#_boost_time_4
9803  1b1c 89            	pushw	x
9804  1b1d be40          	ldw	x,_boost_time_3
9805  1b1f 89            	pushw	x
9806  1b20 ae0097        	ldw	x,#_zone_4_level
9807  1b23 89            	pushw	x
9808  1b24 ae0096        	ldw	x,#_zone_3_level
9809  1b27 89            	pushw	x
9810  1b28 ae0033        	ldw	x,#_count_3_key
9811  1b2b cd158f        	call	_dec_x_key_level
9813  1b2e 5b0f          	addw	sp,#15
9814                     ; 1787 	dec_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer,&tiao_on_4);
9816  1b30 ae0003        	ldw	x,#_tiao_on_4
9817  1b33 89            	pushw	x
9818  1b34 ae009e        	ldw	x,#_zone_3_timer
9819  1b37 89            	pushw	x
9820  1b38 ae00a0        	ldw	x,#_zone_4_timer
9821  1b3b 89            	pushw	x
9822  1b3c 4b08          	push	#8
9823  1b3e ae0040        	ldw	x,#_boost_time_3
9824  1b41 89            	pushw	x
9825  1b42 be42          	ldw	x,_boost_time_4
9826  1b44 89            	pushw	x
9827  1b45 ae0096        	ldw	x,#_zone_3_level
9828  1b48 89            	pushw	x
9829  1b49 ae0097        	ldw	x,#_zone_4_level
9830  1b4c 89            	pushw	x
9831  1b4d ae0034        	ldw	x,#_count_4_key
9832  1b50 cd158f        	call	_dec_x_key_level
9834  1b53 5b0f          	addw	sp,#15
9835                     ; 1788 	if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
9837  1b55 b635          	ld	a,_key_zone
9838  1b57 a109          	cp	a,#9
9839  1b59 2407          	jruge	L3263
9842  1b5b b635          	ld	a,_key_zone
9843  1b5d ab10          	add	a,#16
9844  1b5f cd0045        	call	_flex_deal
9846  1b62               L3263:
9847                     ; 1789 }
9850  1b62 81            	ret
9896                     ; 1790 void slide_x_timer(u8 index)
9896                     ; 1791 {
9897                     	switch	.text
9898  1b63               _slide_x_timer:
9900  1b63 88            	push	a
9901  1b64 89            	pushw	x
9902       00000002      OFST:	set	2
9905                     ; 1792        if(key_zone)
9907  1b65 3d35          	tnz	_key_zone
9908  1b67 2603          	jrne	L613
9909  1b69 cc1c7c        	jp	L3463
9910  1b6c               L613:
9911                     ; 1794          	 if(key_zone &Select_1_KEY) 
9913  1b6c b635          	ld	a,_key_zone
9914  1b6e a501          	bcp	a,#1
9915  1b70 2739          	jreq	L5463
9916                     ; 1796          	 	if(timer_list ==1) zone_1_timer =(index*10)+(zone_1_timer%10);
9918  1b72 b6cc          	ld	a,_timer_list
9919  1b74 a101          	cp	a,#1
9920  1b76 2614          	jrne	L7463
9923  1b78 be9a          	ldw	x,_zone_1_timer
9924  1b7a a60a          	ld	a,#10
9925  1b7c 62            	div	x,a
9926  1b7d 5f            	clrw	x
9927  1b7e 97            	ld	xl,a
9928  1b7f 1f01          	ldw	(OFST-1,sp),x
9929  1b81 7b03          	ld	a,(OFST+1,sp)
9930  1b83 97            	ld	xl,a
9931  1b84 a60a          	ld	a,#10
9932  1b86 42            	mul	x,a
9933  1b87 72fb01        	addw	x,(OFST-1,sp)
9934  1b8a bf9a          	ldw	_zone_1_timer,x
9935  1b8c               L7463:
9936                     ; 1797         	   	if(timer_list ==2) zone_1_timer =zone_1_timer-(zone_1_timer%10)+index;
9938  1b8c b6cc          	ld	a,_timer_list
9939  1b8e a102          	cp	a,#2
9940  1b90 2619          	jrne	L5463
9943  1b92 be9a          	ldw	x,_zone_1_timer
9944  1b94 a60a          	ld	a,#10
9945  1b96 62            	div	x,a
9946  1b97 5f            	clrw	x
9947  1b98 97            	ld	xl,a
9948  1b99 1f01          	ldw	(OFST-1,sp),x
9949  1b9b be9a          	ldw	x,_zone_1_timer
9950  1b9d 72f001        	subw	x,(OFST-1,sp)
9951  1ba0 01            	rrwa	x,a
9952  1ba1 1b03          	add	a,(OFST+1,sp)
9953  1ba3 2401          	jrnc	L603
9954  1ba5 5c            	incw	x
9955  1ba6               L603:
9956  1ba6 b79b          	ld	_zone_1_timer+1,a
9957  1ba8 9f            	ld	a,xl
9958  1ba9 b79a          	ld	_zone_1_timer,a
9959  1bab               L5463:
9960                     ; 1799          	 if(key_zone &Select_2_KEY) 
9962  1bab b635          	ld	a,_key_zone
9963  1bad a502          	bcp	a,#2
9964  1baf 2739          	jreq	L3563
9965                     ; 1801          	 	if(timer_list ==1) zone_2_timer =(index*10)+(zone_2_timer%10);
9967  1bb1 b6cc          	ld	a,_timer_list
9968  1bb3 a101          	cp	a,#1
9969  1bb5 2614          	jrne	L5563
9972  1bb7 be9c          	ldw	x,_zone_2_timer
9973  1bb9 a60a          	ld	a,#10
9974  1bbb 62            	div	x,a
9975  1bbc 5f            	clrw	x
9976  1bbd 97            	ld	xl,a
9977  1bbe 1f01          	ldw	(OFST-1,sp),x
9978  1bc0 7b03          	ld	a,(OFST+1,sp)
9979  1bc2 97            	ld	xl,a
9980  1bc3 a60a          	ld	a,#10
9981  1bc5 42            	mul	x,a
9982  1bc6 72fb01        	addw	x,(OFST-1,sp)
9983  1bc9 bf9c          	ldw	_zone_2_timer,x
9984  1bcb               L5563:
9985                     ; 1802         	   	if(timer_list ==2) zone_2_timer =zone_2_timer-(zone_2_timer%10)+index;
9987  1bcb b6cc          	ld	a,_timer_list
9988  1bcd a102          	cp	a,#2
9989  1bcf 2619          	jrne	L3563
9992  1bd1 be9c          	ldw	x,_zone_2_timer
9993  1bd3 a60a          	ld	a,#10
9994  1bd5 62            	div	x,a
9995  1bd6 5f            	clrw	x
9996  1bd7 97            	ld	xl,a
9997  1bd8 1f01          	ldw	(OFST-1,sp),x
9998  1bda be9c          	ldw	x,_zone_2_timer
9999  1bdc 72f001        	subw	x,(OFST-1,sp)
10000  1bdf 01            	rrwa	x,a
10001  1be0 1b03          	add	a,(OFST+1,sp)
10002  1be2 2401          	jrnc	L013
10003  1be4 5c            	incw	x
10004  1be5               L013:
10005  1be5 b79d          	ld	_zone_2_timer+1,a
10006  1be7 9f            	ld	a,xl
10007  1be8 b79c          	ld	_zone_2_timer,a
10008  1bea               L3563:
10009                     ; 1804         	 if(key_zone &Select_3_KEY) 
10011  1bea b635          	ld	a,_key_zone
10012  1bec a504          	bcp	a,#4
10013  1bee 2739          	jreq	L1663
10014                     ; 1806          	 	if(timer_list ==1) zone_3_timer =(index*10)+(zone_3_timer%10);
10016  1bf0 b6cc          	ld	a,_timer_list
10017  1bf2 a101          	cp	a,#1
10018  1bf4 2614          	jrne	L3663
10021  1bf6 be9e          	ldw	x,_zone_3_timer
10022  1bf8 a60a          	ld	a,#10
10023  1bfa 62            	div	x,a
10024  1bfb 5f            	clrw	x
10025  1bfc 97            	ld	xl,a
10026  1bfd 1f01          	ldw	(OFST-1,sp),x
10027  1bff 7b03          	ld	a,(OFST+1,sp)
10028  1c01 97            	ld	xl,a
10029  1c02 a60a          	ld	a,#10
10030  1c04 42            	mul	x,a
10031  1c05 72fb01        	addw	x,(OFST-1,sp)
10032  1c08 bf9e          	ldw	_zone_3_timer,x
10033  1c0a               L3663:
10034                     ; 1807         	   	if(timer_list ==2) zone_3_timer =zone_3_timer-(zone_3_timer%10)+index;
10036  1c0a b6cc          	ld	a,_timer_list
10037  1c0c a102          	cp	a,#2
10038  1c0e 2619          	jrne	L1663
10041  1c10 be9e          	ldw	x,_zone_3_timer
10042  1c12 a60a          	ld	a,#10
10043  1c14 62            	div	x,a
10044  1c15 5f            	clrw	x
10045  1c16 97            	ld	xl,a
10046  1c17 1f01          	ldw	(OFST-1,sp),x
10047  1c19 be9e          	ldw	x,_zone_3_timer
10048  1c1b 72f001        	subw	x,(OFST-1,sp)
10049  1c1e 01            	rrwa	x,a
10050  1c1f 1b03          	add	a,(OFST+1,sp)
10051  1c21 2401          	jrnc	L213
10052  1c23 5c            	incw	x
10053  1c24               L213:
10054  1c24 b79f          	ld	_zone_3_timer+1,a
10055  1c26 9f            	ld	a,xl
10056  1c27 b79e          	ld	_zone_3_timer,a
10057  1c29               L1663:
10058                     ; 1809         	 if(key_zone &Select_4_KEY) 
10060  1c29 b635          	ld	a,_key_zone
10061  1c2b a508          	bcp	a,#8
10062  1c2d 2739          	jreq	L7663
10063                     ; 1811          	 	if(timer_list ==1) zone_4_timer =(index*10)+(zone_4_timer%10);
10065  1c2f b6cc          	ld	a,_timer_list
10066  1c31 a101          	cp	a,#1
10067  1c33 2614          	jrne	L1763
10070  1c35 bea0          	ldw	x,_zone_4_timer
10071  1c37 a60a          	ld	a,#10
10072  1c39 62            	div	x,a
10073  1c3a 5f            	clrw	x
10074  1c3b 97            	ld	xl,a
10075  1c3c 1f01          	ldw	(OFST-1,sp),x
10076  1c3e 7b03          	ld	a,(OFST+1,sp)
10077  1c40 97            	ld	xl,a
10078  1c41 a60a          	ld	a,#10
10079  1c43 42            	mul	x,a
10080  1c44 72fb01        	addw	x,(OFST-1,sp)
10081  1c47 bfa0          	ldw	_zone_4_timer,x
10082  1c49               L1763:
10083                     ; 1812         	   	if(timer_list ==2) zone_4_timer =zone_4_timer-(zone_4_timer%10)+index;
10085  1c49 b6cc          	ld	a,_timer_list
10086  1c4b a102          	cp	a,#2
10087  1c4d 2619          	jrne	L7663
10090  1c4f bea0          	ldw	x,_zone_4_timer
10091  1c51 a60a          	ld	a,#10
10092  1c53 62            	div	x,a
10093  1c54 5f            	clrw	x
10094  1c55 97            	ld	xl,a
10095  1c56 1f01          	ldw	(OFST-1,sp),x
10096  1c58 bea0          	ldw	x,_zone_4_timer
10097  1c5a 72f001        	subw	x,(OFST-1,sp)
10098  1c5d 01            	rrwa	x,a
10099  1c5e 1b03          	add	a,(OFST+1,sp)
10100  1c60 2401          	jrnc	L413
10101  1c62 5c            	incw	x
10102  1c63               L413:
10103  1c63 b7a1          	ld	_zone_4_timer+1,a
10104  1c65 9f            	ld	a,xl
10105  1c66 b7a0          	ld	_zone_4_timer,a
10106  1c68               L7663:
10107                     ; 1814         	 zone_flash_count =0;	//in order to avoid slide to boost level setting
10109  1c68 3f2d          	clr	_zone_flash_count
10110                     ; 1815          	 inc_dec_deal();
10112  1c6a cd1103        	call	_inc_dec_deal
10114                     ; 1816          	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);		  			  
10116  1c6d b635          	ld	a,_key_zone
10117  1c6f a109          	cp	a,#9
10118  1c71 244b          	jruge	L7763
10121  1c73 b635          	ld	a,_key_zone
10122  1c75 ab10          	add	a,#16
10123  1c77 cd0045        	call	_flex_deal
10125  1c7a 2042          	jra	L7763
10126  1c7c               L3463:
10127                     ; 1820           if(timer_status == 0)   
10129  1c7c 3d36          	tnz	_timer_status
10130  1c7e 263e          	jrne	L7763
10131                     ; 1822          	if(time_flash_count)
10133  1c80 3d37          	tnz	_time_flash_count
10134  1c82 2737          	jreq	L3073
10135                     ; 1824                	 	if(timer_list ==1) general_timer =(index*10)+(general_timer%10);
10137  1c84 b6cc          	ld	a,_timer_list
10138  1c86 a101          	cp	a,#1
10139  1c88 2618          	jrne	L5073
10142  1c8a b698          	ld	a,_general_timer
10143  1c8c ae000a        	ldw	x,#10
10144  1c8f 51            	exgw	x,y
10145  1c90 5f            	clrw	x
10146  1c91 97            	ld	xl,a
10147  1c92 65            	divw	x,y
10148  1c93 909f          	ld	a,yl
10149  1c95 6b02          	ld	(OFST+0,sp),a
10150  1c97 7b03          	ld	a,(OFST+1,sp)
10151  1c99 97            	ld	xl,a
10152  1c9a a60a          	ld	a,#10
10153  1c9c 42            	mul	x,a
10154  1c9d 9f            	ld	a,xl
10155  1c9e 1b02          	add	a,(OFST+0,sp)
10156  1ca0 b798          	ld	_general_timer,a
10157  1ca2               L5073:
10158                     ; 1825         	   	if(timer_list ==2) general_timer =((general_timer/10)*10)+index;
10160  1ca2 b6cc          	ld	a,_timer_list
10161  1ca4 a102          	cp	a,#2
10162  1ca6 2613          	jrne	L3073
10165  1ca8 b698          	ld	a,_general_timer
10166  1caa ae000a        	ldw	x,#10
10167  1cad 51            	exgw	x,y
10168  1cae 5f            	clrw	x
10169  1caf 97            	ld	xl,a
10170  1cb0 65            	divw	x,y
10171  1cb1 9f            	ld	a,xl
10172  1cb2 97            	ld	xl,a
10173  1cb3 a60a          	ld	a,#10
10174  1cb5 42            	mul	x,a
10175  1cb6 9f            	ld	a,xl
10176  1cb7 1b03          	add	a,(OFST+1,sp)
10177  1cb9 b798          	ld	_general_timer,a
10178  1cbb               L3073:
10179                     ; 1827                 inc_dec_deal();
10181  1cbb cd1103        	call	_inc_dec_deal
10183  1cbe               L7763:
10184                     ; 1830 }
10187  1cbe 5b03          	addw	sp,#3
10188  1cc0 81            	ret
10280                     ; 1831 void slide_x_setting(u8 select,u8 *level,u8 index,u16 *timer,u8 *o_level,u16 *tim2,u16 *o_boost_time)
10280                     ; 1832 {
10281                     	switch	.text
10282  1cc1               _slide_x_setting:
10284  1cc1 88            	push	a
10285  1cc2 88            	push	a
10286       00000001      OFST:	set	1
10289                     ; 1833   u8 save =(*level);		
10291  1cc3 1e05          	ldw	x,(OFST+4,sp)
10292  1cc5 f6            	ld	a,(x)
10293  1cc6 6b01          	ld	(OFST+0,sp),a
10294                     ; 1834     if((key_zone ==select)&& ((*level) !=10)&&((Warm_status &select)==0))
10296  1cc8 b635          	ld	a,_key_zone
10297  1cca 1102          	cp	a,(OFST+1,sp)
10298  1ccc 2678          	jrne	L3573
10300  1cce 1e05          	ldw	x,(OFST+4,sp)
10301  1cd0 f6            	ld	a,(x)
10302  1cd1 a10a          	cp	a,#10
10303  1cd3 2771          	jreq	L3573
10305  1cd5 b6d6          	ld	a,_Warm_status
10306  1cd7 1502          	bcp	a,(OFST+1,sp)
10307  1cd9 266b          	jrne	L3573
10308                     ; 1836          buzzer_time = buz_50ms;
10310  1cdb 35050022      	mov	_buzzer_time,#5
10311                     ; 1844     	  if((select ==Select_1_KEY)&&(flex_L_bz))  ;
10313  1cdf 7b02          	ld	a,(OFST+1,sp)
10314  1ce1 a101          	cp	a,#1
10315  1ce3 2604          	jrne	L5573
10317  1ce5 3d44          	tnz	_flex_L_bz
10318  1ce7 262f          	jrne	L7573
10321  1ce9               L5573:
10322                     ; 1845     	  else if((select ==Select_2_KEY)&&(flex_L_bz))  ;
10324  1ce9 7b02          	ld	a,(OFST+1,sp)
10325  1ceb a102          	cp	a,#2
10326  1ced 2604          	jrne	L1673
10328  1cef 3d44          	tnz	_flex_L_bz
10329  1cf1 2625          	jrne	L7573
10332  1cf3               L1673:
10333                     ; 1846     	  else if((select ==Select_3_KEY)&&(flex_R_bz))  ;
10335  1cf3 7b02          	ld	a,(OFST+1,sp)
10336  1cf5 a104          	cp	a,#4
10337  1cf7 2604          	jrne	L5673
10339  1cf9 3d45          	tnz	_flex_R_bz
10340  1cfb 261b          	jrne	L7573
10343  1cfd               L5673:
10344                     ; 1847     	  else if((select ==Select_4_KEY)&&(flex_R_bz))  ;
10346  1cfd 7b02          	ld	a,(OFST+1,sp)
10347  1cff a108          	cp	a,#8
10348  1d01 2604          	jrne	L1773
10350  1d03 3d45          	tnz	_flex_R_bz
10351  1d05 2611          	jrne	L7573
10354  1d07               L1773:
10355                     ; 1848     	  else if((*o_level)==10)    {if(index >5) index =5;}
10357  1d07 1e0a          	ldw	x,(OFST+9,sp)
10358  1d09 f6            	ld	a,(x)
10359  1d0a a10a          	cp	a,#10
10360  1d0c 260a          	jrne	L7573
10363  1d0e 7b07          	ld	a,(OFST+6,sp)
10364  1d10 a106          	cp	a,#6
10365  1d12 2504          	jrult	L7573
10368  1d14 a605          	ld	a,#5
10369  1d16 6b07          	ld	(OFST+6,sp),a
10370  1d18               L7573:
10371                     ; 1849        	  (*level) =index;
10373  1d18 7b07          	ld	a,(OFST+6,sp)
10374  1d1a 1e05          	ldw	x,(OFST+4,sp)
10375  1d1c f7            	ld	(x),a
10376                     ; 1850        	  if(limit_power())  (*level) =save;
10378  1d1d cd10f5        	call	_limit_power
10380  1d20 4d            	tnz	a
10381  1d21 2705          	jreq	L1004
10384  1d23 7b01          	ld	a,(OFST+0,sp)
10385  1d25 1e05          	ldw	x,(OFST+4,sp)
10386  1d27 f7            	ld	(x),a
10387  1d28               L1004:
10388                     ; 1851        	  if((timer_status & select) ==0)  (*timer) =arr_default_timer[index];
10390  1d28 b636          	ld	a,_timer_status
10391  1d2a 1502          	bcp	a,(OFST+1,sp)
10392  1d2c 260d          	jrne	L3004
10395  1d2e 7b07          	ld	a,(OFST+6,sp)
10396  1d30 5f            	clrw	x
10397  1d31 97            	ld	xl,a
10398  1d32 58            	sllw	x
10399  1d33 1608          	ldw	y,(OFST+7,sp)
10400  1d35 89            	pushw	x
10401  1d36 ee50          	ldw	x,(_arr_default_timer,x)
10402  1d38 90ff          	ldw	(y),x
10403  1d3a 85            	popw	x
10404  1d3b               L3004:
10405                     ; 1852        	  zone_flash_count =10;         
10407  1d3b 350a002d      	mov	_zone_flash_count,#10
10408                     ; 1853           flex_deal(select+0x10); 
10410  1d3f 7b02          	ld	a,(OFST+1,sp)
10411  1d41 ab10          	add	a,#16
10412  1d43 cd0045        	call	_flex_deal
10414  1d46               L3573:
10415                     ; 1855 }
10418  1d46 85            	popw	x
10419  1d47 81            	ret
10473                     ; 1856 void slide_x_deal(u8 index)
10473                     ; 1857 {
10474                     	switch	.text
10475  1d48               _slide_x_deal:
10477  1d48 88            	push	a
10478       00000000      OFST:	set	0
10481                     ; 1861     cancel_boost_x_deal(Select_1_KEY,&zone_1_level,&boost_time_1,&boost_1_save);  
10483  1d49 ae004c        	ldw	x,#_boost_1_save
10484  1d4c 89            	pushw	x
10485  1d4d ae003c        	ldw	x,#_boost_time_1
10486  1d50 89            	pushw	x
10487  1d51 ae0094        	ldw	x,#_zone_1_level
10488  1d54 89            	pushw	x
10489  1d55 a601          	ld	a,#1
10490  1d57 cd1260        	call	_cancel_boost_x_deal
10492  1d5a 5b06          	addw	sp,#6
10493                     ; 1862     cancel_boost_x_deal(Select_2_KEY,&zone_2_level,&boost_time_2,&boost_2_save);
10495  1d5c ae004d        	ldw	x,#_boost_2_save
10496  1d5f 89            	pushw	x
10497  1d60 ae003e        	ldw	x,#_boost_time_2
10498  1d63 89            	pushw	x
10499  1d64 ae0095        	ldw	x,#_zone_2_level
10500  1d67 89            	pushw	x
10501  1d68 a602          	ld	a,#2
10502  1d6a cd1260        	call	_cancel_boost_x_deal
10504  1d6d 5b06          	addw	sp,#6
10505                     ; 1863     cancel_boost_x_deal(Select_3_KEY,&zone_3_level,&boost_time_3,&boost_3_save);
10507  1d6f ae004e        	ldw	x,#_boost_3_save
10508  1d72 89            	pushw	x
10509  1d73 ae0040        	ldw	x,#_boost_time_3
10510  1d76 89            	pushw	x
10511  1d77 ae0096        	ldw	x,#_zone_3_level
10512  1d7a 89            	pushw	x
10513  1d7b a604          	ld	a,#4
10514  1d7d cd1260        	call	_cancel_boost_x_deal
10516  1d80 5b06          	addw	sp,#6
10517                     ; 1864     cancel_boost_x_deal(Select_4_KEY,&zone_4_level,&boost_time_4,&boost_4_save);
10519  1d82 ae004f        	ldw	x,#_boost_4_save
10520  1d85 89            	pushw	x
10521  1d86 ae0042        	ldw	x,#_boost_time_4
10522  1d89 89            	pushw	x
10523  1d8a ae0097        	ldw	x,#_zone_4_level
10524  1d8d 89            	pushw	x
10525  1d8e a608          	ld	a,#8
10526  1d90 cd1260        	call	_cancel_boost_x_deal
10528  1d93 5b06          	addw	sp,#6
10529                     ; 1866     if(bbq_L_bz ==0) 
10531  1d95 3d46          	tnz	_bbq_L_bz
10532  1d97 263c          	jrne	L3204
10533                     ; 1868     slide_x_setting(Select_1_KEY,&zone_1_level,index,&zone_1_timer,&zone_2_level,&zone_2_timer,&boost_time_2);
10535  1d99 ae003e        	ldw	x,#_boost_time_2
10536  1d9c 89            	pushw	x
10537  1d9d ae009c        	ldw	x,#_zone_2_timer
10538  1da0 89            	pushw	x
10539  1da1 ae0095        	ldw	x,#_zone_2_level
10540  1da4 89            	pushw	x
10541  1da5 ae009a        	ldw	x,#_zone_1_timer
10542  1da8 89            	pushw	x
10543  1da9 7b09          	ld	a,(OFST+9,sp)
10544  1dab 88            	push	a
10545  1dac ae0094        	ldw	x,#_zone_1_level
10546  1daf 89            	pushw	x
10547  1db0 a601          	ld	a,#1
10548  1db2 cd1cc1        	call	_slide_x_setting
10550  1db5 5b0b          	addw	sp,#11
10551                     ; 1869     slide_x_setting(Select_2_KEY,&zone_2_level,index,&zone_2_timer,&zone_1_level,&zone_1_timer,&boost_time_1);
10553  1db7 ae003c        	ldw	x,#_boost_time_1
10554  1dba 89            	pushw	x
10555  1dbb ae009a        	ldw	x,#_zone_1_timer
10556  1dbe 89            	pushw	x
10557  1dbf ae0094        	ldw	x,#_zone_1_level
10558  1dc2 89            	pushw	x
10559  1dc3 ae009c        	ldw	x,#_zone_2_timer
10560  1dc6 89            	pushw	x
10561  1dc7 7b09          	ld	a,(OFST+9,sp)
10562  1dc9 88            	push	a
10563  1dca ae0095        	ldw	x,#_zone_2_level
10564  1dcd 89            	pushw	x
10565  1dce a602          	ld	a,#2
10566  1dd0 cd1cc1        	call	_slide_x_setting
10568  1dd3 5b0b          	addw	sp,#11
10569  1dd5               L3204:
10570                     ; 1871     if(bbq_R_bz ==0)
10572  1dd5 3d47          	tnz	_bbq_R_bz
10573  1dd7 263c          	jrne	L5204
10574                     ; 1873     slide_x_setting(Select_3_KEY,&zone_3_level,index,&zone_3_timer,&zone_4_level,&zone_4_timer,&boost_time_4);
10576  1dd9 ae0042        	ldw	x,#_boost_time_4
10577  1ddc 89            	pushw	x
10578  1ddd ae00a0        	ldw	x,#_zone_4_timer
10579  1de0 89            	pushw	x
10580  1de1 ae0097        	ldw	x,#_zone_4_level
10581  1de4 89            	pushw	x
10582  1de5 ae009e        	ldw	x,#_zone_3_timer
10583  1de8 89            	pushw	x
10584  1de9 7b09          	ld	a,(OFST+9,sp)
10585  1deb 88            	push	a
10586  1dec ae0096        	ldw	x,#_zone_3_level
10587  1def 89            	pushw	x
10588  1df0 a604          	ld	a,#4
10589  1df2 cd1cc1        	call	_slide_x_setting
10591  1df5 5b0b          	addw	sp,#11
10592                     ; 1874     slide_x_setting(Select_4_KEY,&zone_4_level,index,&zone_4_timer,&zone_3_level,&zone_3_timer,&boost_time_3);   
10594  1df7 ae0040        	ldw	x,#_boost_time_3
10595  1dfa 89            	pushw	x
10596  1dfb ae009e        	ldw	x,#_zone_3_timer
10597  1dfe 89            	pushw	x
10598  1dff ae0096        	ldw	x,#_zone_3_level
10599  1e02 89            	pushw	x
10600  1e03 ae00a0        	ldw	x,#_zone_4_timer
10601  1e06 89            	pushw	x
10602  1e07 7b09          	ld	a,(OFST+9,sp)
10603  1e09 88            	push	a
10604  1e0a ae0097        	ldw	x,#_zone_4_level
10605  1e0d 89            	pushw	x
10606  1e0e a608          	ld	a,#8
10607  1e10 cd1cc1        	call	_slide_x_setting
10609  1e13 5b0b          	addw	sp,#11
10610  1e15               L5204:
10611                     ; 1877 }
10614  1e15 84            	pop	a
10615  1e16 81            	ret
10679                     ; 1878 void Warm_func_x_set(u8 select)
10679                     ; 1879 {
10680                     	switch	.text
10681  1e17               _Warm_func_x_set:
10683  1e17 88            	push	a
10684       00000001      OFST:	set	1
10687                     ; 1880   u8 save =0;
10689  1e18 0f01          	clr	(OFST+0,sp)
10690                     ; 1881   if((key_account == short_press_time)&&(select)&&(zone_flash_count))
10692  1e1a be86          	ldw	x,_key_account
10693  1e1c a30002        	cpw	x,#2
10694  1e1f 2703          	jreq	L623
10695  1e21 cc1ed8        	jp	L1504
10696  1e24               L623:
10698  1e24 4d            	tnz	a
10699  1e25 2603          	jrne	L033
10700  1e27 cc1ed8        	jp	L1504
10701  1e2a               L033:
10703  1e2a 3d2d          	tnz	_zone_flash_count
10704  1e2c 2603          	jrne	L233
10705  1e2e cc1ed8        	jp	L1504
10706  1e31               L233:
10707                     ; 1883    if(((key_zone <=Select_2_KEY)&&(flex_L_bz ==0))||((key_zone >=Select_3_KEY)&&(flex_R_bz ==0)))
10709  1e31 b635          	ld	a,_key_zone
10710  1e33 a103          	cp	a,#3
10711  1e35 2404          	jruge	L7504
10713  1e37 3d44          	tnz	_flex_L_bz
10714  1e39 2710          	jreq	L5504
10715  1e3b               L7504:
10717  1e3b b635          	ld	a,_key_zone
10718  1e3d a104          	cp	a,#4
10719  1e3f 2403          	jruge	L433
10720  1e41 cc1ed8        	jp	L1504
10721  1e44               L433:
10723  1e44 3d45          	tnz	_flex_R_bz
10724  1e46 2703          	jreq	L633
10725  1e48 cc1ed8        	jp	L1504
10726  1e4b               L633:
10727  1e4b               L5504:
10728                     ; 1885 	buzzer_time = buz_200ms; 	 //0.5s continue increase one time 
10730  1e4b 35140022      	mov	_buzzer_time,#20
10731                     ; 1887 	zone_flash_count =10;
10733  1e4f 350a002d      	mov	_zone_flash_count,#10
10734                     ; 1888 	time_flash_count =0;
10736  1e53 3f37          	clr	_time_flash_count
10737                     ; 1889 	sec_counter =0;		
10739  1e55 3f01          	clr	_sec_counter
10740                     ; 1891      if(Warm_status &key_zone) 
10742  1e57 b6d6          	ld	a,_Warm_status
10743  1e59 b535          	bcp	a,_key_zone
10744  1e5b 2731          	jreq	L1604
10745                     ; 1893        	Warm_status &=~key_zone;
10747  1e5d b635          	ld	a,_key_zone
10748  1e5f 43            	cpl	a
10749  1e60 b4d6          	and	a,_Warm_status
10750  1e62 b7d6          	ld	_Warm_status,a
10751                     ; 1894        	if(key_zone ==Select_1_KEY) {Warm_1_timer =0;zone_1_level =0;}
10753  1e64 b635          	ld	a,_key_zone
10754  1e66 a101          	cp	a,#1
10755  1e68 2604          	jrne	L3604
10758  1e6a 3fd7          	clr	_Warm_1_timer
10761  1e6c 3f94          	clr	_zone_1_level
10762  1e6e               L3604:
10763                     ; 1895        	if(key_zone ==Select_2_KEY) {Warm_2_timer =0;zone_2_level =0;}
10765  1e6e b635          	ld	a,_key_zone
10766  1e70 a102          	cp	a,#2
10767  1e72 2604          	jrne	L5604
10770  1e74 3fd8          	clr	_Warm_2_timer
10773  1e76 3f95          	clr	_zone_2_level
10774  1e78               L5604:
10775                     ; 1896        	if(key_zone ==Select_3_KEY) {Warm_3_timer =0;zone_3_level =0;}
10777  1e78 b635          	ld	a,_key_zone
10778  1e7a a104          	cp	a,#4
10779  1e7c 2604          	jrne	L7604
10782  1e7e 3fd9          	clr	_Warm_3_timer
10785  1e80 3f96          	clr	_zone_3_level
10786  1e82               L7604:
10787                     ; 1897        	if(key_zone ==Select_4_KEY) {Warm_4_timer =0;zone_4_level =0;}
10789  1e82 b635          	ld	a,_key_zone
10790  1e84 a108          	cp	a,#8
10791  1e86 2650          	jrne	L1504
10794  1e88 3fda          	clr	_Warm_4_timer
10797  1e8a 3f97          	clr	_zone_4_level
10798  1e8c 204a          	jra	L1504
10799  1e8e               L1604:
10800                     ; 1901        	Warm_status |=key_zone;
10802  1e8e b6d6          	ld	a,_Warm_status
10803  1e90 ba35          	or	a,_key_zone
10804  1e92 b7d6          	ld	_Warm_status,a
10805                     ; 1902        	if(key_zone ==Select_1_KEY) {Warm_1_timer =120;zone_1_level =3;boost_time_1=0;}
10807  1e94 b635          	ld	a,_key_zone
10808  1e96 a101          	cp	a,#1
10809  1e98 260b          	jrne	L5704
10812  1e9a 357800d7      	mov	_Warm_1_timer,#120
10815  1e9e 35030094      	mov	_zone_1_level,#3
10818  1ea2 5f            	clrw	x
10819  1ea3 bf3c          	ldw	_boost_time_1,x
10820  1ea5               L5704:
10821                     ; 1903        	if(key_zone ==Select_2_KEY) {Warm_2_timer =120;zone_2_level =3;boost_time_2=0;}
10823  1ea5 b635          	ld	a,_key_zone
10824  1ea7 a102          	cp	a,#2
10825  1ea9 260b          	jrne	L7704
10828  1eab 357800d8      	mov	_Warm_2_timer,#120
10831  1eaf 35030095      	mov	_zone_2_level,#3
10834  1eb3 5f            	clrw	x
10835  1eb4 bf3e          	ldw	_boost_time_2,x
10836  1eb6               L7704:
10837                     ; 1904        	if(key_zone ==Select_3_KEY) {Warm_3_timer =120;zone_3_level =3;boost_time_3=0;}
10839  1eb6 b635          	ld	a,_key_zone
10840  1eb8 a104          	cp	a,#4
10841  1eba 260b          	jrne	L1014
10844  1ebc 357800d9      	mov	_Warm_3_timer,#120
10847  1ec0 35030096      	mov	_zone_3_level,#3
10850  1ec4 5f            	clrw	x
10851  1ec5 bf40          	ldw	_boost_time_3,x
10852  1ec7               L1014:
10853                     ; 1905        	if(key_zone ==Select_4_KEY) {Warm_4_timer =120;zone_4_level =3;boost_time_4=0;}
10855  1ec7 b635          	ld	a,_key_zone
10856  1ec9 a108          	cp	a,#8
10857  1ecb 260b          	jrne	L1504
10860  1ecd 357800da      	mov	_Warm_4_timer,#120
10863  1ed1 35030097      	mov	_zone_4_level,#3
10866  1ed5 5f            	clrw	x
10867  1ed6 bf42          	ldw	_boost_time_4,x
10868  1ed8               L1504:
10869                     ; 1909 }
10872  1ed8 84            	pop	a
10873  1ed9 81            	ret
10925                     ; 1910 u8 Warm_function_deal(u8 T_temp,u8 work_time)
10925                     ; 1911 {
10926                     	switch	.text
10927  1eda               _Warm_function_deal:
10929  1eda 89            	pushw	x
10930  1edb 88            	push	a
10931       00000001      OFST:	set	1
10934                     ; 1912    u8 warm_level =1;
10936  1edc a601          	ld	a,#1
10937  1ede 6b01          	ld	(OFST+0,sp),a
10938                     ; 1913    if(work_time <=60)
10940  1ee0 9f            	ld	a,xl
10941  1ee1 a13d          	cp	a,#61
10942  1ee3 241a          	jruge	L3314
10943                     ; 1915     if((T_temp >CON_TMAIN_50)&&(T_temp <CON_TMAIN_55)) warm_level =2;
10945  1ee5 9e            	ld	a,xh
10946  1ee6 a14c          	cp	a,#76
10947  1ee8 2509          	jrult	L5314
10949  1eea 9e            	ld	a,xh
10950  1eeb a155          	cp	a,#85
10951  1eed 2404          	jruge	L5314
10954  1eef a602          	ld	a,#2
10955  1ef1 6b01          	ld	(OFST+0,sp),a
10956  1ef3               L5314:
10957                     ; 1916     if(T_temp <=CON_TMAIN_50)  warm_level =4;
10959  1ef3 7b02          	ld	a,(OFST+1,sp)
10960  1ef5 a14c          	cp	a,#76
10961  1ef7 2420          	jruge	L1414
10964  1ef9 a604          	ld	a,#4
10965  1efb 6b01          	ld	(OFST+0,sp),a
10966  1efd 201a          	jra	L1414
10967  1eff               L3314:
10968                     ; 1920     if((T_temp >CON_TMAIN_45)&&(T_temp <CON_TMAIN_50)) warm_level =2;
10970  1eff 7b02          	ld	a,(OFST+1,sp)
10971  1f01 a142          	cp	a,#66
10972  1f03 250a          	jrult	L3414
10974  1f05 7b02          	ld	a,(OFST+1,sp)
10975  1f07 a14b          	cp	a,#75
10976  1f09 2404          	jruge	L3414
10979  1f0b a602          	ld	a,#2
10980  1f0d 6b01          	ld	(OFST+0,sp),a
10981  1f0f               L3414:
10982                     ; 1921     if(T_temp <=CON_TMAIN_45)  warm_level =4;
10984  1f0f 7b02          	ld	a,(OFST+1,sp)
10985  1f11 a142          	cp	a,#66
10986  1f13 2404          	jruge	L1414
10989  1f15 a604          	ld	a,#4
10990  1f17 6b01          	ld	(OFST+0,sp),a
10991  1f19               L1414:
10992                     ; 1923    return(warm_level);
10994  1f19 7b01          	ld	a,(OFST+0,sp)
10997  1f1b 5b03          	addw	sp,#3
10998  1f1d 81            	ret
11048                     ; 1925 void Pause_function_key(void)
11048                     ; 1926 {   
11049                     	switch	.text
11050  1f1e               _Pause_function_key:
11054                     ; 1927      if(key_account == short_press_time)    //with stop & go function
11056  1f1e be86          	ldw	x,_key_account
11057  1f20 a30002        	cpw	x,#2
11058  1f23 2703          	jreq	L443
11059  1f25 cc1fda        	jp	L7514
11060  1f28               L443:
11061                     ; 1929       if((lock_bz == FALSE)&&(zone_1_level |zone_2_level|zone_3_level|zone_4_level))
11063  1f28 3d20          	tnz	_lock_bz
11064  1f2a 2703          	jreq	L643
11065  1f2c cc1fda        	jp	L7514
11066  1f2f               L643:
11068  1f2f b694          	ld	a,_zone_1_level
11069  1f31 ba95          	or	a,_zone_2_level
11070  1f33 ba96          	or	a,_zone_3_level
11071  1f35 ba97          	or	a,_zone_4_level
11072  1f37 2603          	jrne	L053
11073  1f39 cc1fda        	jp	L7514
11074  1f3c               L053:
11075                     ; 1931      	buzzer_time = buz_200ms;
11077  1f3c 35140022      	mov	_buzzer_time,#20
11078                     ; 1932      	zone_flash_count =0;
11080  1f40 3f2d          	clr	_zone_flash_count
11081                     ; 1933 	time_flash_count =0;
11083  1f42 3f37          	clr	_time_flash_count
11084                     ; 1935 	if(Pause_bz) 
11086  1f44 3dd1          	tnz	_Pause_bz
11087  1f46 275a          	jreq	L3614
11088                     ; 1937 		Pause_bz =0;
11090  1f48 3fd1          	clr	_Pause_bz
11091                     ; 1938 		pause_x_timer =0;
11093  1f4a 3f99          	clr	_pause_x_timer
11094                     ; 1939 		zone_1_timer =arr_default_timer[zone_1_level];
11096  1f4c b694          	ld	a,_zone_1_level
11097  1f4e 5f            	clrw	x
11098  1f4f 97            	ld	xl,a
11099  1f50 58            	sllw	x
11100  1f51 ee50          	ldw	x,(_arr_default_timer,x)
11101  1f53 bf9a          	ldw	_zone_1_timer,x
11102                     ; 1940 		zone_2_timer =arr_default_timer[zone_2_level];
11104  1f55 b695          	ld	a,_zone_2_level
11105  1f57 5f            	clrw	x
11106  1f58 97            	ld	xl,a
11107  1f59 58            	sllw	x
11108  1f5a ee50          	ldw	x,(_arr_default_timer,x)
11109  1f5c bf9c          	ldw	_zone_2_timer,x
11110                     ; 1941 		zone_3_timer =arr_default_timer[zone_3_level];
11112  1f5e b696          	ld	a,_zone_3_level
11113  1f60 5f            	clrw	x
11114  1f61 97            	ld	xl,a
11115  1f62 58            	sllw	x
11116  1f63 ee50          	ldw	x,(_arr_default_timer,x)
11117  1f65 bf9e          	ldw	_zone_3_timer,x
11118                     ; 1942 		zone_4_timer =arr_default_timer[zone_4_level];
11120  1f67 b697          	ld	a,_zone_4_level
11121  1f69 5f            	clrw	x
11122  1f6a 97            	ld	xl,a
11123  1f6b 58            	sllw	x
11124  1f6c ee50          	ldw	x,(_arr_default_timer,x)
11125  1f6e bfa0          	ldw	_zone_4_timer,x
11126                     ; 1943 		if(timer_status & Select_1_KEY)  zone_1_timer =Pause_save_timer_1; 
11128  1f70 b636          	ld	a,_timer_status
11129  1f72 a501          	bcp	a,#1
11130  1f74 2706          	jreq	L5614
11133  1f76 b6d2          	ld	a,_Pause_save_timer_1
11134  1f78 5f            	clrw	x
11135  1f79 97            	ld	xl,a
11136  1f7a bf9a          	ldw	_zone_1_timer,x
11137  1f7c               L5614:
11138                     ; 1944 	 	if(timer_status & Select_2_KEY)  zone_2_timer =Pause_save_timer_2; 
11140  1f7c b636          	ld	a,_timer_status
11141  1f7e a502          	bcp	a,#2
11142  1f80 2706          	jreq	L7614
11145  1f82 b6d3          	ld	a,_Pause_save_timer_2
11146  1f84 5f            	clrw	x
11147  1f85 97            	ld	xl,a
11148  1f86 bf9c          	ldw	_zone_2_timer,x
11149  1f88               L7614:
11150                     ; 1945 	 	if(timer_status & Select_3_KEY)  zone_3_timer =Pause_save_timer_3; 
11152  1f88 b636          	ld	a,_timer_status
11153  1f8a a504          	bcp	a,#4
11154  1f8c 2706          	jreq	L1714
11157  1f8e b6d4          	ld	a,_Pause_save_timer_3
11158  1f90 5f            	clrw	x
11159  1f91 97            	ld	xl,a
11160  1f92 bf9e          	ldw	_zone_3_timer,x
11161  1f94               L1714:
11162                     ; 1946 	 	if(timer_status & Select_4_KEY)  zone_4_timer =Pause_save_timer_4; 
11164  1f94 b636          	ld	a,_timer_status
11165  1f96 a508          	bcp	a,#8
11166  1f98 2740          	jreq	L7514
11169  1f9a b6d5          	ld	a,_Pause_save_timer_4
11170  1f9c 5f            	clrw	x
11171  1f9d 97            	ld	xl,a
11172  1f9e bfa0          	ldw	_zone_4_timer,x
11173  1fa0 2038          	jra	L7514
11174  1fa2               L3614:
11175                     ; 1950 	 	Pause_bz =1;
11177  1fa2 350100d1      	mov	_Pause_bz,#1
11178                     ; 1951 	 	pause_x_timer =120;	 	
11180  1fa6 35780099      	mov	_pause_x_timer,#120
11181                     ; 1952 	 	if(timer_status & Select_1_KEY)  Pause_save_timer_1 =zone_1_timer; 
11183  1faa b636          	ld	a,_timer_status
11184  1fac a501          	bcp	a,#1
11185  1fae 2703          	jreq	L7714
11188  1fb0 459bd2        	mov	_Pause_save_timer_1,_zone_1_timer+1
11189  1fb3               L7714:
11190                     ; 1953 	 	if(timer_status & Select_2_KEY)  Pause_save_timer_2 =zone_2_timer; 
11192  1fb3 b636          	ld	a,_timer_status
11193  1fb5 a502          	bcp	a,#2
11194  1fb7 2703          	jreq	L1024
11197  1fb9 459dd3        	mov	_Pause_save_timer_2,_zone_2_timer+1
11198  1fbc               L1024:
11199                     ; 1954 	 	if(timer_status & Select_3_KEY)  Pause_save_timer_3 =zone_3_timer; 
11201  1fbc b636          	ld	a,_timer_status
11202  1fbe a504          	bcp	a,#4
11203  1fc0 2703          	jreq	L3024
11206  1fc2 459fd4        	mov	_Pause_save_timer_3,_zone_3_timer+1
11207  1fc5               L3024:
11208                     ; 1955 	 	if(timer_status & Select_4_KEY)  Pause_save_timer_4 =zone_4_timer;
11210  1fc5 b636          	ld	a,_timer_status
11211  1fc7 a508          	bcp	a,#8
11212  1fc9 2703          	jreq	L5024
11215  1fcb 45a1d5        	mov	_Pause_save_timer_4,_zone_4_timer+1
11216  1fce               L5024:
11217                     ; 1956 	 	zone_1_timer =0;
11219  1fce 5f            	clrw	x
11220  1fcf bf9a          	ldw	_zone_1_timer,x
11221                     ; 1957 	 	zone_2_timer =0;
11223  1fd1 5f            	clrw	x
11224  1fd2 bf9c          	ldw	_zone_2_timer,x
11225                     ; 1958 	 	zone_3_timer =0;
11227  1fd4 5f            	clrw	x
11228  1fd5 bf9e          	ldw	_zone_3_timer,x
11229                     ; 1959 	 	zone_4_timer =0;	 	
11231  1fd7 5f            	clrw	x
11232  1fd8 bfa0          	ldw	_zone_4_timer,x
11233  1fda               L7514:
11234                     ; 1963     if((lock_bz == FALSE)&&(key_account >450) && (key_account <550))    //5s with power adjust function
11236  1fda 3d20          	tnz	_lock_bz
11237  1fdc 2636          	jrne	L7024
11239  1fde be86          	ldw	x,_key_account
11240  1fe0 a301c3        	cpw	x,#451
11241  1fe3 252f          	jrult	L7024
11243  1fe5 be86          	ldw	x,_key_account
11244  1fe7 a30226        	cpw	x,#550
11245  1fea 2428          	jruge	L7024
11246                     ; 1965      	if(Power_on_bz == FALSE)
11248  1fec 3d1f          	tnz	_Power_on_bz
11249  1fee 2624          	jrne	L7024
11250                     ; 1967      		buzzer_time = buz_200ms;
11252  1ff0 35140022      	mov	_buzzer_time,#20
11253                     ; 1968      		key_account =851;		//ignore re-operation in
11255  1ff4 ae0353        	ldw	x,#851
11256  1ff7 bf86          	ldw	_key_account,x
11257                     ; 1969      		sys_adj_status++;
11259  1ff9 3ccf          	inc	_sys_adj_status
11260                     ; 1970      		if(sys_adj_status ==1)  sys_adj_secjs =5;   //within 5sec need to press +&- together 3sec
11262  1ffb b6cf          	ld	a,_sys_adj_status
11263  1ffd a101          	cp	a,#1
11264  1fff 2606          	jrne	L3124
11267  2001 350500ce      	mov	_sys_adj_secjs,#5
11269  2005 200d          	jra	L7024
11270  2007               L3124:
11271                     ; 1973      		  sys_adj_status =0;
11273  2007 3fcf          	clr	_sys_adj_status
11274                     ; 1974      		  sys_adj_secjs =0;
11276  2009 3fce          	clr	_sys_adj_secjs
11277                     ; 1975       		  buzzer_time = 0; 
11279  200b 3f22          	clr	_buzzer_time
11280                     ; 1976       		  sys_pow_status =sys_disp_status;
11282  200d 45d0cd        	mov	_sys_pow_status,_sys_disp_status
11283                     ; 1977       		  buzzer_account =60;		//beeper 10times
11285  2010 353c0023      	mov	_buzzer_account,#60
11286  2014               L7024:
11287                     ; 1981 }
11290  2014 81            	ret
11321                     ; 1982 void bbq_power_deal(void)
11321                     ; 1983 {
11322                     	switch	.text
11323  2015               _bbq_power_deal:
11327                     ; 1984 	if((bbq_L_bz)&&(zone_1_level+zone_2_level)) 
11329  2015 3d46          	tnz	_bbq_L_bz
11330  2017 2775          	jreq	L7224
11332  2019 b694          	ld	a,_zone_1_level
11333  201b 5f            	clrw	x
11334  201c bb95          	add	a,_zone_2_level
11335  201e 2401          	jrnc	L453
11336  2020 5c            	incw	x
11337  2021               L453:
11338  2021 02            	rlwa	x,a
11339  2022 5d            	tnzw	x
11340  2023 2769          	jreq	L7224
11341                     ; 1986 		bbq_L_time++;
11343  2025 be48          	ldw	x,_bbq_L_time
11344  2027 1c0001        	addw	x,#1
11345  202a bf48          	ldw	_bbq_L_time,x
11346                     ; 1987 		if(bbq_L_time <=75) 			  {zone_1_level =8;zone_2_level =8;}
11348  202c be48          	ldw	x,_bbq_L_time
11349  202e a3004c        	cpw	x,#76
11350  2031 2408          	jruge	L1324
11353  2033 35080094      	mov	_zone_1_level,#8
11356  2037 35080095      	mov	_zone_2_level,#8
11357  203b               L1324:
11358                     ; 1988 		if((bbq_L_time >75)&&(bbq_L_time <=120))  {zone_1_level =7;zone_2_level =7;}
11360  203b be48          	ldw	x,_bbq_L_time
11361  203d a3004c        	cpw	x,#76
11362  2040 250f          	jrult	L3324
11364  2042 be48          	ldw	x,_bbq_L_time
11365  2044 a30079        	cpw	x,#121
11366  2047 2408          	jruge	L3324
11369  2049 35070094      	mov	_zone_1_level,#7
11372  204d 35070095      	mov	_zone_2_level,#7
11373  2051               L3324:
11374                     ; 1989 		if((bbq_L_time>120)&&(bbq_L_time <=300))  {zone_1_level =6;zone_2_level =6;}
11376  2051 be48          	ldw	x,_bbq_L_time
11377  2053 a30079        	cpw	x,#121
11378  2056 250f          	jrult	L5324
11380  2058 be48          	ldw	x,_bbq_L_time
11381  205a a3012d        	cpw	x,#301
11382  205d 2408          	jruge	L5324
11385  205f 35060094      	mov	_zone_1_level,#6
11388  2063 35060095      	mov	_zone_2_level,#6
11389  2067               L5324:
11390                     ; 1990 		if((bbq_L_time>300)&&(bbq_L_time <=600))  {zone_1_level =5;zone_2_level =5;}
11392  2067 be48          	ldw	x,_bbq_L_time
11393  2069 a3012d        	cpw	x,#301
11394  206c 250f          	jrult	L7324
11396  206e be48          	ldw	x,_bbq_L_time
11397  2070 a30259        	cpw	x,#601
11398  2073 2408          	jruge	L7324
11401  2075 35050094      	mov	_zone_1_level,#5
11404  2079 35050095      	mov	_zone_2_level,#5
11405  207d               L7324:
11406                     ; 1991 		if(bbq_L_time>600)	                  {zone_1_level =4;zone_2_level =4;}
11408  207d be48          	ldw	x,_bbq_L_time
11409  207f a30259        	cpw	x,#601
11410  2082 250d          	jrult	L3424
11413  2084 35040094      	mov	_zone_1_level,#4
11416  2088 35040095      	mov	_zone_2_level,#4
11417  208c 2003          	jra	L3424
11418  208e               L7224:
11419                     ; 1993 	else bbq_L_time =0;
11421  208e 5f            	clrw	x
11422  208f bf48          	ldw	_bbq_L_time,x
11423  2091               L3424:
11424                     ; 1995 	if((bbq_R_bz)&&(zone_3_level+zone_4_level))  
11426  2091 3d47          	tnz	_bbq_R_bz
11427  2093 2775          	jreq	L5424
11429  2095 b696          	ld	a,_zone_3_level
11430  2097 5f            	clrw	x
11431  2098 bb97          	add	a,_zone_4_level
11432  209a 2401          	jrnc	L653
11433  209c 5c            	incw	x
11434  209d               L653:
11435  209d 02            	rlwa	x,a
11436  209e 5d            	tnzw	x
11437  209f 2769          	jreq	L5424
11438                     ; 1997 		bbq_R_time++;
11440  20a1 be4a          	ldw	x,_bbq_R_time
11441  20a3 1c0001        	addw	x,#1
11442  20a6 bf4a          	ldw	_bbq_R_time,x
11443                     ; 1998 		if( bbq_R_time <=75) 			  {zone_3_level =8;zone_4_level =8;}
11445  20a8 be4a          	ldw	x,_bbq_R_time
11446  20aa a3004c        	cpw	x,#76
11447  20ad 2408          	jruge	L7424
11450  20af 35080096      	mov	_zone_3_level,#8
11453  20b3 35080097      	mov	_zone_4_level,#8
11454  20b7               L7424:
11455                     ; 1999 		if((bbq_R_time >75)&&(bbq_R_time <=120))  {zone_3_level =7;zone_4_level =7;}
11457  20b7 be4a          	ldw	x,_bbq_R_time
11458  20b9 a3004c        	cpw	x,#76
11459  20bc 250f          	jrult	L1524
11461  20be be4a          	ldw	x,_bbq_R_time
11462  20c0 a30079        	cpw	x,#121
11463  20c3 2408          	jruge	L1524
11466  20c5 35070096      	mov	_zone_3_level,#7
11469  20c9 35070097      	mov	_zone_4_level,#7
11470  20cd               L1524:
11471                     ; 2000 		if((bbq_R_time>120)&&(bbq_R_time <=300))  {zone_3_level =6;zone_4_level =6;}
11473  20cd be4a          	ldw	x,_bbq_R_time
11474  20cf a30079        	cpw	x,#121
11475  20d2 250f          	jrult	L3524
11477  20d4 be4a          	ldw	x,_bbq_R_time
11478  20d6 a3012d        	cpw	x,#301
11479  20d9 2408          	jruge	L3524
11482  20db 35060096      	mov	_zone_3_level,#6
11485  20df 35060097      	mov	_zone_4_level,#6
11486  20e3               L3524:
11487                     ; 2001 		if((bbq_R_time>300)&&(bbq_R_time <=600))  {zone_3_level =5;zone_4_level =5;}
11489  20e3 be4a          	ldw	x,_bbq_R_time
11490  20e5 a3012d        	cpw	x,#301
11491  20e8 250f          	jrult	L5524
11493  20ea be4a          	ldw	x,_bbq_R_time
11494  20ec a30259        	cpw	x,#601
11495  20ef 2408          	jruge	L5524
11498  20f1 35050096      	mov	_zone_3_level,#5
11501  20f5 35050097      	mov	_zone_4_level,#5
11502  20f9               L5524:
11503                     ; 2002 		if( bbq_R_time>600)	                  {zone_3_level =4;zone_4_level =4;}
11505  20f9 be4a          	ldw	x,_bbq_R_time
11506  20fb a30259        	cpw	x,#601
11507  20fe 250d          	jrult	L1624
11510  2100 35040096      	mov	_zone_3_level,#4
11513  2104 35040097      	mov	_zone_4_level,#4
11514  2108 2003          	jra	L1624
11515  210a               L5424:
11516                     ; 2004 	else bbq_R_time =0;
11518  210a 5f            	clrw	x
11519  210b bf4a          	ldw	_bbq_R_time,x
11520  210d               L1624:
11521                     ; 2005 }
11524  210d 81            	ret
11557                     ; 2006 void Pow_adj_function_key(void)
11557                     ; 2007 {
11558                     	switch	.text
11559  210e               _Pow_adj_function_key:
11563                     ; 2008     if(key_account == long_press_time)    //3s with power adjust function
11565  210e be86          	ldw	x,_key_account
11566  2110 a30064        	cpw	x,#100
11567  2113 2663          	jrne	L3724
11568                     ; 2010     	if((Power_on_bz == FALSE)&&(lock_bz == FALSE) &&(sys_adj_status))
11570  2115 3d1f          	tnz	_Power_on_bz
11571  2117 265f          	jrne	L3724
11573  2119 3d20          	tnz	_lock_bz
11574  211b 265b          	jrne	L3724
11576  211d 3dcf          	tnz	_sys_adj_status
11577  211f 2757          	jreq	L3724
11578                     ; 2012      		key_account =long_press_time+1;
11580  2121 ae0065        	ldw	x,#101
11581  2124 bf86          	ldw	_key_account,x
11582                     ; 2013      		buzzer_time = buz_200ms;
11584  2126 35140022      	mov	_buzzer_time,#20
11585                     ; 2014      		speed_up();
11587  212a cd110e        	call	_speed_up
11589                     ; 2015      		sys_adj_secjs =30;
11591  212d 351e00ce      	mov	_sys_adj_secjs,#30
11592                     ; 2016      		sys_adj_status++;
11594  2131 3ccf          	inc	_sys_adj_status
11595                     ; 2017      		if(sys_adj_status ==2)  sys_disp_status =sys_pow_status;
11597  2133 b6cf          	ld	a,_sys_adj_status
11598  2135 a102          	cp	a,#2
11599  2137 2605          	jrne	L7724
11602  2139 45cdd0        	mov	_sys_disp_status,_sys_pow_status
11604  213c 203a          	jra	L3724
11605  213e               L7724:
11606                     ; 2018      		else if(sys_disp_status ==0x25)  sys_disp_status =0x30;
11608  213e b6d0          	ld	a,_sys_disp_status
11609  2140 a125          	cp	a,#37
11610  2142 2606          	jrne	L3034
11613  2144 353000d0      	mov	_sys_disp_status,#48
11615  2148 202e          	jra	L3724
11616  214a               L3034:
11617                     ; 2019      		else if(sys_disp_status ==0x30)  sys_disp_status =0x45;
11619  214a b6d0          	ld	a,_sys_disp_status
11620  214c a130          	cp	a,#48
11621  214e 2606          	jrne	L7034
11624  2150 354500d0      	mov	_sys_disp_status,#69
11626  2154 2022          	jra	L3724
11627  2156               L7034:
11628                     ; 2020      		else if(sys_disp_status ==0x45)  sys_disp_status =0x65;
11630  2156 b6d0          	ld	a,_sys_disp_status
11631  2158 a145          	cp	a,#69
11632  215a 2606          	jrne	L3134
11635  215c 356500d0      	mov	_sys_disp_status,#101
11637  2160 2016          	jra	L3724
11638  2162               L3134:
11639                     ; 2021      		else if(sys_disp_status ==0x65)  sys_disp_status =0x74;
11641  2162 b6d0          	ld	a,_sys_disp_status
11642  2164 a165          	cp	a,#101
11643  2166 2606          	jrne	L7134
11646  2168 357400d0      	mov	_sys_disp_status,#116
11648  216c 200a          	jra	L3724
11649  216e               L7134:
11650                     ; 2022      		else if(sys_disp_status ==0x74)  sys_disp_status =0x25;
11652  216e b6d0          	ld	a,_sys_disp_status
11653  2170 a174          	cp	a,#116
11654  2172 2604          	jrne	L3724
11657  2174 352500d0      	mov	_sys_disp_status,#37
11658  2178               L3724:
11659                     ; 2025 }
11662  2178 81            	ret
12001                     ; 2029 void main()
12001                     ; 2030 {  
12002                     	switch	.text
12003  2179               _main:
12005  2179 5219          	subw	sp,#25
12006       00000019      OFST:	set	25
12009                     ; 2031     u8  i =0;
12011  217b 7b19          	ld	a,(OFST+0,sp)
12012  217d 97            	ld	xl,a
12013                     ; 2032     u8  temp_8 =0;
12015  217e 7b18          	ld	a,(OFST-1,sp)
12016  2180 97            	ld	xl,a
12017                     ; 2034     u8  par_1 =0;
12019  2181 7b13          	ld	a,(OFST-6,sp)
12020  2183 97            	ld	xl,a
12021                     ; 2035     u8  par_2 =0;
12023  2184 7b19          	ld	a,(OFST+0,sp)
12024  2186 97            	ld	xl,a
12025                     ; 2036     u8  par_3 =0;
12027  2187 7b08          	ld	a,(OFST-17,sp)
12028  2189 97            	ld	xl,a
12029                     ; 2037     u8  par_4 =0;
12031  218a 7b18          	ld	a,(OFST-1,sp)
12032  218c 97            	ld	xl,a
12033                     ; 2038     u8  par_5 =0;
12035  218d 0f01          	clr	(OFST-24,sp)
12036                     ; 2040     u16 list_counter =0;   
12038  218f 5f            	clrw	x
12039  2190 1f0d          	ldw	(OFST-12,sp),x
12040                     ; 2054     IWDG_Enable();/* Enable the access to the IWDG registers*/        
12042  2192 cd0000        	call	_IWDG_Enable
12044                     ; 2055     IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);/* Fixe IWDG Reset period */
12046  2195 a655          	ld	a,#85
12047  2197 cd0000        	call	_IWDG_WriteAccessCmd
12049                     ; 2057     IWDG_SetPrescaler(IWDG_Prescaler_256);
12051  219a a606          	ld	a,#6
12052  219c cd0000        	call	_IWDG_SetPrescaler
12054                     ; 2058     IWDG_SetReload(0xFF);       
12056  219f a6ff          	ld	a,#255
12057  21a1 cd0000        	call	_IWDG_SetReload
12059                     ; 2059     IWDG_ReloadCounter();/* Refresh IWDG */
12061  21a4 cd0000        	call	_IWDG_ReloadCounter
12063                     ; 2061     disableInterrupts();
12066  21a7 9b            sim
12068                     ; 2065     CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
12071  21a8 721150c1      	bres	20673,#0
12072                     ; 2066     CLK->ICKR |= CLK_ICKR_HSIEN;
12074  21ac 721050c0      	bset	20672,#0
12075                     ; 2067     CLK->ICKR |= CLK_ICKR_LSIEN;  
12077  21b0 721650c0      	bset	20672,#3
12078                     ; 2068     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
12080  21b4 c650c6        	ld	a,20678
12081  21b7 a4e7          	and	a,#231
12082  21b9 c750c6        	ld	20678,a
12083                     ; 2069     CLK->CKDIVR |= (u8)CLK_PRESCALER_HSIDIV1;
12085  21bc c650c6        	ld	a,20678
12086  21bf 97            	ld	xl,a
12087                     ; 2070     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
12089  21c0 c650c6        	ld	a,20678
12090  21c3 a4f8          	and	a,#248
12091  21c5 c750c6        	ld	20678,a
12092                     ; 2071     CLK->CKDIVR |= (u8)((u8)CLK_PRESCALER_CPUDIV1 & (u8)CLK_CKDIVR_CPUDIV);
12094  21c8 c650c6        	ld	a,20678
12095  21cb 97            	ld	xl,a
12096                     ; 2078     TIM4->PSCR = (u8)(TIM4_PRESCALER_128);
12098  21cc 35075345      	mov	21317,#7
12099                     ; 2080     TIM4->ARR = (u8)(123);
12101  21d0 357b5346      	mov	21318,#123
12102                     ; 2083     TIM4->IER |= (u8)(TIM4_IT_UPDATE);
12104  21d4 72105341      	bset	21313,#0
12105                     ; 2085     TIM4->CR1 |= TIM4_CR1_CEN;
12107  21d8 72105340      	bset	21312,#0
12108                     ; 2090     T_SCK_Port->CR1 |=T_SCK_Pin;	
12110  21dc 72125008      	bset	20488,#1
12111                     ; 2091     T_SCK_Port->DDR |=T_SCK_Pin;
12113  21e0 72125007      	bset	20487,#1
12114                     ; 2092     SCL_0;
12116  21e4 72135005      	bres	20485,#1
12117                     ; 2094     T_SDA_Port->CR1 |=T_SDA_Pin;
12119  21e8 72105008      	bset	20488,#0
12120                     ; 2095     T_SDA_Port->CR2 &=~T_SDA_Pin;    
12122  21ec 72115009      	bres	20489,#0
12123                     ; 2096     SDA_OUT;
12125  21f0 72105007      	bset	20487,#0
12126                     ; 2097     SDA_0;
12128  21f4 72115005      	bres	20485,#0
12129                     ; 2099     TX_Port->CR1 |=TX_Pin;
12131  21f8 721a5012      	bset	20498,#5
12132                     ; 2100     TX_OUT;
12134  21fc 721a5011      	bset	20497,#5
12135                     ; 2101     TX_1;
12137  2200 721a500f      	bset	20495,#5
12138                     ; 2103     RX_Port->CR1 |=RX_Pin;
12140  2204 721c5012      	bset	20498,#6
12141                     ; 2104     RX_IN;
12143  2208 721d5011      	bres	20497,#6
12144                     ; 2106     D_SCK_Port->CR1 |=D_SCK_Pin;		
12146  220c 7214500d      	bset	20493,#2
12147                     ; 2107     D_SCK_Port->DDR |=D_SCK_Pin;		
12149  2210 7214500c      	bset	20492,#2
12150                     ; 2108     D_SCK_Port->ODR |=D_SCK_Pin;
12152  2214 7214500a      	bset	20490,#2
12153                     ; 2110     D_SDA_Port->CR1 |=D_SDA_Pin;		
12155  2218 721e500d      	bset	20493,#7
12156                     ; 2111     D_SDA_Port->DDR |=D_SDA_Pin;	
12158  221c 721e500c      	bset	20492,#7
12159                     ; 2112     D_SDA_Port->ODR |=D_SDA_Pin;   
12161  2220 721e500a      	bset	20490,#7
12162                     ; 2114     D_EN_Port->CR1  |=D_EN_Pin;		
12164  2224 721a5017      	bset	20503,#5
12165                     ; 2115     D_EN_Port->DDR  |=D_EN_Pin;	
12167  2228 721a5016      	bset	20502,#5
12168                     ; 2116     D_EN_Port->ODR  |=D_EN_Pin;     
12170  222c 721a5014      	bset	20500,#5
12171                     ; 2118     RELAY_Port->CR1 |=RELAY_Pin;		
12173  2230 721e5012      	bset	20498,#7
12174                     ; 2119     RELAY_Port->DDR |=RELAY_Pin;
12176  2234 721e5011      	bset	20497,#7
12177                     ; 2120     RELAY_OFF;  
12179  2238 721f500f      	bres	20495,#7
12180                     ; 2122     FAN_Port->CR1 |=FAN_Pin;		
12182  223c 72185012      	bset	20498,#4
12183                     ; 2123     FAN_Port->DDR |=FAN_Pin;
12185  2240 72185011      	bset	20497,#4
12186                     ; 2124     FAN_OFF;  	
12188  2244 7219500f      	bres	20495,#4
12189                     ; 2126     GPIOD->CR1 |=GPIO_PIN_2;		//beeper	
12191  2248 72145012      	bset	20498,#2
12192                     ; 2127     GPIOD->DDR |=GPIO_PIN_2;
12194  224c 72145011      	bset	20497,#2
12195                     ; 2128     GPIOD->ODR |=GPIO_PIN_2;  
12197  2250 7214500f      	bset	20495,#2
12198                     ; 2132  TIM1->ARRH = 0x64;
12200  2254 35645262      	mov	21090,#100
12201                     ; 2133  TIM1->ARRL = 0x00;			//0x6400 =25600
12203  2258 725f5263      	clr	21091
12204                     ; 2141  TIM1->IER |= (u8)TIM1_IT_UPDATE;
12206  225c 72105254      	bset	21076,#0
12207                     ; 2142  TIM1->CR1 |= TIM1_CR1_CEN;
12209  2260 72105250      	bset	21072,#0
12210                     ; 2148     enableInterrupts(); 
12213  2264 9a            rim
12215                     ; 2153     TIM2->PSCR = 0;                                                                                                                                                                                                                                                   
12218  2265 725f530c      	clr	21260
12219                     ; 2154     TIM2->ARRH = (u8)(2000 >> 8);                                                                                                                      
12221  2269 3507530d      	mov	21261,#7
12222                     ; 2155     TIM2->ARRL = (u8)(2000);   
12224  226d 35d0530e      	mov	21262,#208
12225                     ; 2157     TIM2->CCMR3 |= (u8)TIM2_CCMR_OCxPE;
12227  2271 72165307      	bset	21255,#3
12228                     ; 2159     TIM2->CR1 |= (u8)TIM2_CR1_CEN;
12230  2275 72105300      	bset	21248,#0
12231                     ; 2160     TIM2->IER |= (u8)TIM2_IT_UPDATE;          
12233  2279 72105301      	bset	21249,#0
12234                     ; 2164 		 match_ok =TRUE;
12236  227d 350100aa      	mov	_match_ok,#1
12237                     ; 2167      temp_8 =(*((PointerAttr u8*) User_eeprom_address_1));
12239  2281 bc004051      	ldf	a,16465
12240  2285 6b18          	ld	(OFST-1,sp),a
12241                     ; 2168      if((temp_8 ==0x25)||(temp_8 ==0x30)||(temp_8 ==0x45)||(temp_8 ==0x65)||(temp_8 ==0x74))   sys_pow_status =temp_8;
12243  2287 7b18          	ld	a,(OFST-1,sp)
12244  2289 a125          	cp	a,#37
12245  228b 2718          	jreq	L5544
12247  228d 7b18          	ld	a,(OFST-1,sp)
12248  228f a130          	cp	a,#48
12249  2291 2712          	jreq	L5544
12251  2293 7b18          	ld	a,(OFST-1,sp)
12252  2295 a145          	cp	a,#69
12253  2297 270c          	jreq	L5544
12255  2299 7b18          	ld	a,(OFST-1,sp)
12256  229b a165          	cp	a,#101
12257  229d 2706          	jreq	L5544
12259  229f 7b18          	ld	a,(OFST-1,sp)
12260  22a1 a174          	cp	a,#116
12261  22a3 261c          	jrne	L3544
12262  22a5               L5544:
12265  22a5 7b18          	ld	a,(OFST-1,sp)
12266  22a7 b7cd          	ld	_sys_pow_status,a
12268  22a9               L7644:
12269                     ; 2177  	if(comm_status == 2) 
12271  22a9 b6c8          	ld	a,_comm_status
12272  22ab a102          	cp	a,#2
12273  22ad 2618          	jrne	L3744
12274                     ; 2179 		comm_status =3;		
12276  22af 350300c8      	mov	_comm_status,#3
12277                     ; 2186         	Get_addr =(u8)(Get_word_1 >>8);		//command address			
12279  22b3 450970        	mov	_Get_addr,_Get_word_1
12280                     ; 2187 		Get_data =(u8)(Get_word_1); 		//command data	
12282  22b6 450a71        	mov	_Get_data,_Get_word_1+1
12283                     ; 2189 		Get_vol =(u8)(Get_word_2 >>8);	
12285  22b9 450b72        	mov	_Get_vol,_Get_word_2
12286                     ; 2190 		Get_cur  =(u8)(Get_word_2);  
12288  22bc 450c73        	mov	_Get_cur,_Get_word_2+1
12289  22bf 2006          	jra	L3744
12290  22c1               L3544:
12291                     ; 2169      else sys_pow_status =0x74;
12293  22c1 357400cd      	mov	_sys_pow_status,#116
12294  22c5 20e2          	jra	L7644
12295  22c7               L3744:
12296                     ; 2192 	if(comm_status ==4)
12298  22c7 b6c8          	ld	a,_comm_status
12299  22c9 a104          	cp	a,#4
12300  22cb 2652          	jrne	L5744
12301                     ; 2194 		comm_status =6;
12303  22cd 350600c8      	mov	_comm_status,#6
12304                     ; 2196 		Get_tigbt =(u8)(Get_word_3 >>8);	
12306  22d1 450d74        	mov	_Get_tigbt,_Get_word_3
12307                     ; 2197 		Get_tmain  =(u8)(Get_word_3);  
12309  22d4 450e75        	mov	_Get_tmain,_Get_word_3+1
12310                     ; 2199 		Get_ppg =(u8)(Get_word_4 >>8);	
12312  22d7 450f76        	mov	_Get_ppg,_Get_word_4
12313                     ; 2200 		Get_cur_no  =(u8)(Get_word_4);
12315  22da 451077        	mov	_Get_cur_no,_Get_word_4+1
12316                     ; 2202 		temp_8 =comm_vertify();
12318  22dd cd0011        	call	_comm_vertify
12320  22e0 6b18          	ld	(OFST-1,sp),a
12321                     ; 2204 		switch(Comm_step)
12323  22e2 b664          	ld	a,_Comm_step
12325                     ; 2221 		  case comm_4_s:if(temp_8)  comm_get_deal(4-1); break;     		  	  			           			           			
12326  22e4 a010          	sub	a,#16
12327  22e6 270e          	jreq	L5234
12328  22e8 a010          	sub	a,#16
12329  22ea 2714          	jreq	L7234
12330  22ec a010          	sub	a,#16
12331  22ee 271b          	jreq	L1334
12332  22f0 a010          	sub	a,#16
12333  22f2 2722          	jreq	L3334
12334  22f4 2029          	jra	L5744
12335  22f6               L5234:
12336                     ; 2206 		  case comm_1_s:if(temp_8)  comm_get_deal(1-1); break;
12338  22f6 0d18          	tnz	(OFST-1,sp)
12339  22f8 2725          	jreq	L5744
12342  22fa 4f            	clr	a
12343  22fb cd0142        	call	_comm_get_deal
12345  22fe 201f          	jra	L5744
12346  2300               L7234:
12347                     ; 2219 		  case comm_2_s:if(temp_8)  comm_get_deal(2-1); break; 		  					         				
12349  2300 0d18          	tnz	(OFST-1,sp)
12350  2302 271b          	jreq	L5744
12353  2304 a601          	ld	a,#1
12354  2306 cd0142        	call	_comm_get_deal
12356  2309 2014          	jra	L5744
12357  230b               L1334:
12358                     ; 2220 		  case comm_3_s:if(temp_8)  comm_get_deal(3-1); break;		  	
12360  230b 0d18          	tnz	(OFST-1,sp)
12361  230d 2710          	jreq	L5744
12364  230f a602          	ld	a,#2
12365  2311 cd0142        	call	_comm_get_deal
12367  2314 2009          	jra	L5744
12368  2316               L3334:
12369                     ; 2221 		  case comm_4_s:if(temp_8)  comm_get_deal(4-1); break;     		  	  			           			           			
12371  2316 0d18          	tnz	(OFST-1,sp)
12372  2318 2705          	jreq	L5744
12375  231a a603          	ld	a,#3
12376  231c cd0142        	call	_comm_get_deal
12378  231f               L1054:
12379  231f               L5744:
12380                     ; 2228         if(Ms10_bz1 == TRUE)
12382  231f b612          	ld	a,_Ms10_bz1
12383  2321 a101          	cp	a,#1
12384  2323 2645          	jrne	L3154
12385                     ; 2230          	Ms10_bz1 =FALSE;   
12387  2325 3f12          	clr	_Ms10_bz1
12388                     ; 2232 	  if(key_initial_count) key_initial_count--; 
12390  2327 3d2b          	tnz	_key_initial_count
12391  2329 2702          	jreq	L5154
12394  232b 3a2b          	dec	_key_initial_count
12395  232d               L5154:
12396                     ; 2233 	  if(key_initial_count ==200) buzzer_time =buz_500ms;    //initial buzzer after power on 0.5s
12398  232d b62b          	ld	a,_key_initial_count
12399  232f a1c8          	cp	a,#200
12400  2331 2604          	jrne	L7154
12403  2333 35140022      	mov	_buzzer_time,#20
12404  2337               L7154:
12405                     ; 2234 	  if(buzzer_time)  buzzer_time--;   
12407  2337 3d22          	tnz	_buzzer_time
12408  2339 2702          	jreq	L1254
12411  233b 3a22          	dec	_buzzer_time
12412  233d               L1254:
12413                     ; 2236 	  if(match_ok == FALSE)  buzzer_time =255;
12415  233d 3daa          	tnz	_match_ok
12416  233f 2606          	jrne	L3254
12419  2341 35ff0022      	mov	_buzzer_time,#255
12421  2345 2012          	jra	L5254
12422  2347               L3254:
12423                     ; 2239 	     	if(key_initial_count==100) APT8L16Init_H(); 
12425  2347 b62b          	ld	a,_key_initial_count
12426  2349 a164          	cp	a,#100
12427  234b 2603          	jrne	L7254
12430  234d cd0a68        	call	_APT8L16Init_H
12432  2350               L7254:
12433                     ; 2240 	     	if(key_initial_count== 60) APT8L16Init_L();	     	 	 
12435  2350 b62b          	ld	a,_key_initial_count
12436  2352 a13c          	cp	a,#60
12437  2354 2603          	jrne	L5254
12440  2356 cd0b15        	call	_APT8L16Init_L
12442  2359               L5254:
12443                     ; 2242 	  if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(1);  	      	
12445  2359 b6aa          	ld	a,_match_ok
12446  235b a101          	cp	a,#1
12447  235d 260b          	jrne	L3154
12449  235f b62b          	ld	a,_key_initial_count
12450  2361 a11e          	cp	a,#30
12451  2363 2405          	jruge	L3154
12454  2365 a601          	ld	a,#1
12455  2367 cd0bc2        	call	_key_scan_I2C
12457  236a               L3154:
12458                     ; 2247         if(Ms10_bz2 == TRUE)
12460  236a b613          	ld	a,_Ms10_bz2
12461  236c a101          	cp	a,#1
12462  236e 2613          	jrne	L5354
12463                     ; 2249          	Ms10_bz2 =FALSE; 
12465  2370 3f13          	clr	_Ms10_bz2
12466                     ; 2250           if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(2);
12468  2372 b6aa          	ld	a,_match_ok
12469  2374 a101          	cp	a,#1
12470  2376 260b          	jrne	L5354
12472  2378 b62b          	ld	a,_key_initial_count
12473  237a a11e          	cp	a,#30
12474  237c 2405          	jruge	L5354
12477  237e a602          	ld	a,#2
12478  2380 cd0bc2        	call	_key_scan_I2C
12480  2383               L5354:
12481                     ; 2255         if(Ms10_bz3 == TRUE)
12483  2383 b614          	ld	a,_Ms10_bz3
12484  2385 a101          	cp	a,#1
12485  2387 2613          	jrne	L1454
12486                     ; 2257          	Ms10_bz3 =FALSE; 
12488  2389 3f14          	clr	_Ms10_bz3
12489                     ; 2258           if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(3); 
12491  238b b6aa          	ld	a,_match_ok
12492  238d a101          	cp	a,#1
12493  238f 260b          	jrne	L1454
12495  2391 b62b          	ld	a,_key_initial_count
12496  2393 a11e          	cp	a,#30
12497  2395 2405          	jruge	L1454
12500  2397 a603          	ld	a,#3
12501  2399 cd0bc2        	call	_key_scan_I2C
12503  239c               L1454:
12504                     ; 2263         if(Ms10_bz4 == TRUE)
12506  239c b615          	ld	a,_Ms10_bz4
12507  239e a101          	cp	a,#1
12508  23a0 2703          	jreq	L434
12509  23a2 cc2544        	jp	L5454
12510  23a5               L434:
12511                     ; 2265          	Ms10_bz4 =FALSE; 
12513  23a5 3f15          	clr	_Ms10_bz4
12514                     ; 2267         	key_next_deal();
12516  23a7 cd0c75        	call	_key_next_deal
12518                     ; 2279           	if(key_ok_bit == KEY_ONOFF)  {on_off_key_deal();speed_up();} 
12520  23aa b685          	ld	a,_key_ok_bit
12521  23ac a101          	cp	a,#1
12522  23ae 2606          	jrne	L7454
12525  23b0 cd1117        	call	_on_off_key_deal
12529  23b3 cd110e        	call	_speed_up
12531  23b6               L7454:
12532                     ; 2281           	if(key_ok_bit == KEY_LOCK)  {lock_key_deal();speed_up();}
12534  23b6 b685          	ld	a,_key_ok_bit
12535  23b8 a102          	cp	a,#2
12536  23ba 2606          	jrne	L1554
12539  23bc cd13de        	call	_lock_key_deal
12543  23bf cd110e        	call	_speed_up
12545  23c2               L1554:
12546                     ; 2282           	if(key_ok_bit == KEY_STOP)	  
12548  23c2 b685          	ld	a,_key_ok_bit
12549  23c4 a105          	cp	a,#5
12550  23c6 2606          	jrne	L3554
12551                     ; 2284           	        Pause_function_key();	
12553  23c8 cd1f1e        	call	_Pause_function_key
12555                     ; 2285           	        speed_up();	
12557  23cb cd110e        	call	_speed_up
12559  23ce               L3554:
12560                     ; 2293           	if((Power_on_bz == TRUE) &&(Pause_bz ==0) && (lock_bz == FALSE)) 
12562  23ce b61f          	ld	a,_Power_on_bz
12563  23d0 a101          	cp	a,#1
12564  23d2 2703          	jreq	L634
12565  23d4 cc2544        	jp	L5454
12566  23d7               L634:
12568  23d7 3dd1          	tnz	_Pause_bz
12569  23d9 2703          	jreq	L044
12570  23db cc2544        	jp	L5454
12571  23de               L044:
12573  23de 3d20          	tnz	_lock_bz
12574  23e0 2703          	jreq	L244
12575  23e2 cc2544        	jp	L5454
12576  23e5               L244:
12577                     ; 2296           	 	if(key_ok_bit == KEY_BOOST)          	
12579  23e5 b685          	ld	a,_key_ok_bit
12580  23e7 a103          	cp	a,#3
12581  23e9 2606          	jrne	L7554
12582                     ; 2298           	       	boost_key_deal();
12584  23eb cd11d1        	call	_boost_key_deal
12586                     ; 2299           	       	speed_up();		
12588  23ee cd110e        	call	_speed_up
12590  23f1               L7554:
12591                     ; 2302           		if(key_ok_bit == KEY_WARM)	  
12593  23f1 b685          	ld	a,_key_ok_bit
12594  23f3 a104          	cp	a,#4
12595  23f5 2608          	jrne	L1654
12596                     ; 2304           	        Warm_func_x_set(key_zone);
12598  23f7 b635          	ld	a,_key_zone
12599  23f9 cd1e17        	call	_Warm_func_x_set
12601                     ; 2305           	        speed_up();	
12603  23fc cd110e        	call	_speed_up
12605  23ff               L1654:
12606                     ; 2308           		if(key_ok_bit == KEY_TIMER)	  
12608  23ff b685          	ld	a,_key_ok_bit
12609  2401 a108          	cp	a,#8
12610  2403 2606          	jrne	L3654
12611                     ; 2310           	        timer_key_deal();
12613  2405 cd1449        	call	_timer_key_deal
12615                     ; 2311           	        speed_up();	
12617  2408 cd110e        	call	_speed_up
12619  240b               L3654:
12620                     ; 2314         		if(key_ok_bit == KEY_FL)
12622  240b b685          	ld	a,_key_ok_bit
12623  240d a106          	cp	a,#6
12624  240f 2617          	jrne	L5654
12625                     ; 2316           	       	if(key_account ==short_press_time)	flex_L_key_deal();
12627  2411 be86          	ldw	x,_key_account
12628  2413 a30002        	cpw	x,#2
12629  2416 2603          	jrne	L7654
12632  2418 cd1304        	call	_flex_L_key_deal
12634  241b               L7654:
12635                     ; 2317           	       	if(key_account ==lock_press_time)       bbq_key_deal(); 	//3S PRESS  
12637  241b be86          	ldw	x,_key_account
12638  241d a300fa        	cpw	x,#250
12639  2420 2603          	jrne	L1754
12642  2422 cd127b        	call	_bbq_key_deal
12644  2425               L1754:
12645                     ; 2318           	       	speed_up();		
12647  2425 cd110e        	call	_speed_up
12649  2428               L5654:
12650                     ; 2321         		if(key_ok_bit == KEY_FR)	
12652  2428 b685          	ld	a,_key_ok_bit
12653  242a a107          	cp	a,#7
12654  242c 2617          	jrne	L3754
12655                     ; 2323           	       	if(key_account ==short_press_time)	flex_R_key_deal();
12657  242e be86          	ldw	x,_key_account
12658  2430 a30002        	cpw	x,#2
12659  2433 2603          	jrne	L5754
12662  2435 cd1371        	call	_flex_R_key_deal
12664  2438               L5754:
12665                     ; 2324           	       	if(key_account ==lock_press_time)       bbq_key_deal();	//3S PRESS            	       	
12667  2438 be86          	ldw	x,_key_account
12668  243a a300fa        	cpw	x,#250
12669  243d 2603          	jrne	L7754
12672  243f cd127b        	call	_bbq_key_deal
12674  2442               L7754:
12675                     ; 2325           	       	speed_up();		
12677  2442 cd110e        	call	_speed_up
12679  2445               L3754:
12680                     ; 2340           		 if(key_ok_bit == KEY_1)
12682  2445 b685          	ld	a,_key_ok_bit
12683  2447 a10a          	cp	a,#10
12684  2449 260f          	jrne	L1064
12685                     ; 2342           	 	if(key_account == short_press_time)  key_x_deal(Select_1_KEY); 
12687  244b be86          	ldw	x,_key_account
12688  244d a30002        	cpw	x,#2
12689  2450 2605          	jrne	L3064
12692  2452 a601          	ld	a,#1
12693  2454 cd14ab        	call	_key_x_deal
12695  2457               L3064:
12696                     ; 2343           	 	speed_up();  
12698  2457 cd110e        	call	_speed_up
12700  245a               L1064:
12701                     ; 2346           		if(key_ok_bit == KEY_2)
12703  245a b685          	ld	a,_key_ok_bit
12704  245c a10b          	cp	a,#11
12705  245e 260f          	jrne	L5064
12706                     ; 2348           	 	if(key_account == short_press_time)  key_x_deal(Select_2_KEY); 
12708  2460 be86          	ldw	x,_key_account
12709  2462 a30002        	cpw	x,#2
12710  2465 2605          	jrne	L7064
12713  2467 a602          	ld	a,#2
12714  2469 cd14ab        	call	_key_x_deal
12716  246c               L7064:
12717                     ; 2349           	 	speed_up();
12719  246c cd110e        	call	_speed_up
12721  246f               L5064:
12722                     ; 2352           		if(key_ok_bit == KEY_3)
12724  246f b685          	ld	a,_key_ok_bit
12725  2471 a10c          	cp	a,#12
12726  2473 260f          	jrne	L1164
12727                     ; 2354           	 	if(key_account == short_press_time)  key_x_deal(Select_3_KEY); 
12729  2475 be86          	ldw	x,_key_account
12730  2477 a30002        	cpw	x,#2
12731  247a 2605          	jrne	L3164
12734  247c a604          	ld	a,#4
12735  247e cd14ab        	call	_key_x_deal
12737  2481               L3164:
12738                     ; 2355           	 	speed_up();
12740  2481 cd110e        	call	_speed_up
12742  2484               L1164:
12743                     ; 2358           		if(key_ok_bit == KEY_4)
12745  2484 b685          	ld	a,_key_ok_bit
12746  2486 a10d          	cp	a,#13
12747  2488 260f          	jrne	L5164
12748                     ; 2360           	 	if(key_account == short_press_time)  key_x_deal(Select_4_KEY); 
12750  248a be86          	ldw	x,_key_account
12751  248c a30002        	cpw	x,#2
12752  248f 2605          	jrne	L7164
12755  2491 a608          	ld	a,#8
12756  2493 cd14ab        	call	_key_x_deal
12758  2496               L7164:
12759                     ; 2361           	 	speed_up();
12761  2496 cd110e        	call	_speed_up
12763  2499               L5164:
12764                     ; 2364           		if(key_ok_bit == KEY_S1)		//KEY_S1 ->DEC
12766  2499 b685          	ld	a,_key_ok_bit
12767  249b a111          	cp	a,#17
12768  249d 2606          	jrne	L1264
12769                     ; 2366           	 	dec_key_deal(); 
12771  249f cd18e4        	call	_dec_key_deal
12773                     ; 2367           	 	speed_up();
12775  24a2 cd110e        	call	_speed_up
12777  24a5               L1264:
12778                     ; 2370           		if(key_ok_bit == KEY_S2)
12780  24a5 b685          	ld	a,_key_ok_bit
12781  24a7 a112          	cp	a,#18
12782  24a9 260f          	jrne	L3264
12783                     ; 2372           	 	if(key_account == short_press_time)  slide_x_deal(2);
12785  24ab be86          	ldw	x,_key_account
12786  24ad a30002        	cpw	x,#2
12787  24b0 2605          	jrne	L5264
12790  24b2 a602          	ld	a,#2
12791  24b4 cd1d48        	call	_slide_x_deal
12793  24b7               L5264:
12794                     ; 2373           	 	speed_up();
12796  24b7 cd110e        	call	_speed_up
12798  24ba               L3264:
12799                     ; 2376           		if(key_ok_bit == KEY_S3)
12801  24ba b685          	ld	a,_key_ok_bit
12802  24bc a113          	cp	a,#19
12803  24be 260f          	jrne	L7264
12804                     ; 2378           	 	if(key_account == short_press_time)  slide_x_deal(3);
12806  24c0 be86          	ldw	x,_key_account
12807  24c2 a30002        	cpw	x,#2
12808  24c5 2605          	jrne	L1364
12811  24c7 a603          	ld	a,#3
12812  24c9 cd1d48        	call	_slide_x_deal
12814  24cc               L1364:
12815                     ; 2379           	 	speed_up();
12817  24cc cd110e        	call	_speed_up
12819  24cf               L7264:
12820                     ; 2382           		if(key_ok_bit == KEY_S4)
12822  24cf b685          	ld	a,_key_ok_bit
12823  24d1 a114          	cp	a,#20
12824  24d3 260f          	jrne	L3364
12825                     ; 2384           	 	if(key_account == short_press_time)  slide_x_deal(4);
12827  24d5 be86          	ldw	x,_key_account
12828  24d7 a30002        	cpw	x,#2
12829  24da 2605          	jrne	L5364
12832  24dc a604          	ld	a,#4
12833  24de cd1d48        	call	_slide_x_deal
12835  24e1               L5364:
12836                     ; 2385           	 	speed_up();
12838  24e1 cd110e        	call	_speed_up
12840  24e4               L3364:
12841                     ; 2388           		if(key_ok_bit == KEY_S5)
12843  24e4 b685          	ld	a,_key_ok_bit
12844  24e6 a115          	cp	a,#21
12845  24e8 260f          	jrne	L7364
12846                     ; 2390           	 	if(key_account == short_press_time)  slide_x_deal(5);
12848  24ea be86          	ldw	x,_key_account
12849  24ec a30002        	cpw	x,#2
12850  24ef 2605          	jrne	L1464
12853  24f1 a605          	ld	a,#5
12854  24f3 cd1d48        	call	_slide_x_deal
12856  24f6               L1464:
12857                     ; 2391           	 	speed_up();
12859  24f6 cd110e        	call	_speed_up
12861  24f9               L7364:
12862                     ; 2394           		if(key_ok_bit == KEY_S6)
12864  24f9 b685          	ld	a,_key_ok_bit
12865  24fb a116          	cp	a,#22
12866  24fd 260f          	jrne	L3464
12867                     ; 2396           	 	if(key_account == short_press_time)  slide_x_deal(6);
12869  24ff be86          	ldw	x,_key_account
12870  2501 a30002        	cpw	x,#2
12871  2504 2605          	jrne	L5464
12874  2506 a606          	ld	a,#6
12875  2508 cd1d48        	call	_slide_x_deal
12877  250b               L5464:
12878                     ; 2397           	 	speed_up();
12880  250b cd110e        	call	_speed_up
12882  250e               L3464:
12883                     ; 2400           		if(key_ok_bit == KEY_S7)
12885  250e b685          	ld	a,_key_ok_bit
12886  2510 a117          	cp	a,#23
12887  2512 260f          	jrne	L7464
12888                     ; 2402           	 	if(key_account == short_press_time)  slide_x_deal(7);
12890  2514 be86          	ldw	x,_key_account
12891  2516 a30002        	cpw	x,#2
12892  2519 2605          	jrne	L1564
12895  251b a607          	ld	a,#7
12896  251d cd1d48        	call	_slide_x_deal
12898  2520               L1564:
12899                     ; 2403           	 	speed_up();
12901  2520 cd110e        	call	_speed_up
12903  2523               L7464:
12904                     ; 2406           		if(key_ok_bit == KEY_S8)
12906  2523 b685          	ld	a,_key_ok_bit
12907  2525 a118          	cp	a,#24
12908  2527 260f          	jrne	L3564
12909                     ; 2408           	 	if(key_account == short_press_time)  slide_x_deal(8);
12911  2529 be86          	ldw	x,_key_account
12912  252b a30002        	cpw	x,#2
12913  252e 2605          	jrne	L5564
12916  2530 a608          	ld	a,#8
12917  2532 cd1d48        	call	_slide_x_deal
12919  2535               L5564:
12920                     ; 2409           	 	speed_up();
12922  2535 cd110e        	call	_speed_up
12924  2538               L3564:
12925                     ; 2412           		if(key_ok_bit == KEY_S9)	//KEY_S9  ->KEY_INC
12927  2538 b685          	ld	a,_key_ok_bit
12928  253a a119          	cp	a,#25
12929  253c 2606          	jrne	L5454
12930                     ; 2414           	 	inc_key_deal();	
12932  253e cd1670        	call	_inc_key_deal
12934                     ; 2415           	 	speed_up();
12936  2541 cd110e        	call	_speed_up
12938  2544               L5454:
12939                     ; 2423         if(Ms10_bz5 == TRUE) 
12941  2544 b616          	ld	a,_Ms10_bz5
12942  2546 a101          	cp	a,#1
12943  2548 2608          	jrne	L1664
12944                     ; 2425           	Ms10_bz5 =FALSE;
12946  254a 3f16          	clr	_Ms10_bz5
12947                     ; 2426           	if(cmd_relay_wait)  cmd_relay_wait--;              	       	         	            	         	   	           	          	          	        	        	       			
12949  254c 3d2e          	tnz	_cmd_relay_wait
12950  254e 2702          	jreq	L1664
12953  2550 3a2e          	dec	_cmd_relay_wait
12954  2552               L1664:
12955                     ; 2431         if(Ms10_bz6 == TRUE)
12957  2552 b617          	ld	a,_Ms10_bz6
12958  2554 a101          	cp	a,#1
12959  2556 264e          	jrne	L5664
12960                     ; 2433 		Ms10_bz6 =FALSE;
12962  2558 3f17          	clr	_Ms10_bz6
12963                     ; 2435 		if(Power_on_bz == TRUE)   
12965  255a b61f          	ld	a,_Power_on_bz
12966  255c a101          	cp	a,#1
12967  255e 2616          	jrne	L7664
12968                     ; 2437 				if((cmd_relay_wait ==0) && (relay_delay_bz ==FALSE)) 
12970  2560 3d2e          	tnz	_cmd_relay_wait
12971  2562 2642          	jrne	L5664
12973  2564 3d11          	tnz	_relay_delay_bz
12974  2566 263e          	jrne	L5664
12975                     ; 2439 				  	RELAY_ON;
12977  2568 721e500f      	bset	20495,#7
12978                     ; 2440 				  	relay_delay_bz =TRUE;
12980  256c 35010011      	mov	_relay_delay_bz,#1
12981                     ; 2441 				  	cmd_relay_wait =200;
12983  2570 35c8002e      	mov	_cmd_relay_wait,#200
12984  2574 2030          	jra	L5664
12985  2576               L7664:
12986                     ; 2446 				if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min) 	RELAY_ON;
12988  2576 b638          	ld	a,_flash_H_1_min
12989  2578 5f            	clrw	x
12990  2579 bb39          	add	a,_flash_H_2_min
12991  257b 2401          	jrnc	L463
12992  257d 5c            	incw	x
12993  257e               L463:
12994  257e bb3a          	add	a,_flash_H_3_min
12995  2580 2401          	jrnc	L663
12996  2582 5c            	incw	x
12997  2583               L663:
12998  2583 bb3b          	add	a,_flash_H_4_min
12999  2585 2401          	jrnc	L073
13000  2587 5c            	incw	x
13001  2588               L073:
13002  2588 02            	rlwa	x,a
13003  2589 5d            	tnzw	x
13004  258a 2706          	jreq	L5764
13007  258c 721e500f      	bset	20495,#7
13009  2590 2014          	jra	L5664
13010  2592               L5764:
13011                     ; 2447 				else if((cmd_relay_wait ==0)&& (relay_delay_bz ==TRUE))
13013  2592 3d2e          	tnz	_cmd_relay_wait
13014  2594 2610          	jrne	L5664
13016  2596 b611          	ld	a,_relay_delay_bz
13017  2598 a101          	cp	a,#1
13018  259a 260a          	jrne	L5664
13019                     ; 2449 					RELAY_OFF;
13021  259c 721f500f      	bres	20495,#7
13022                     ; 2450 					relay_delay_bz =FALSE;					
13024  25a0 3f11          	clr	_relay_delay_bz
13025                     ; 2451 					cmd_relay_wait =200;					
13027  25a2 35c8002e      	mov	_cmd_relay_wait,#200
13028  25a6               L5664:
13029                     ; 2458         if(Ms10_bz7 == TRUE)
13031  25a6 b618          	ld	a,_Ms10_bz7
13032  25a8 a101          	cp	a,#1
13033  25aa 2703          	jreq	L444
13034  25ac cc270d        	jp	L3074
13035  25af               L444:
13036                     ; 2460           	Ms10_bz7 =FALSE; 
13038  25af 3f18          	clr	_Ms10_bz7
13039                     ; 2462 			if((relay_delay_bz ==TRUE) && (cmd_relay_wait ==0)) 	list_counter++;	//communication list begin
13041  25b1 b611          	ld	a,_relay_delay_bz
13042  25b3 a101          	cp	a,#1
13043  25b5 260d          	jrne	L5074
13045  25b7 3d2e          	tnz	_cmd_relay_wait
13046  25b9 2609          	jrne	L5074
13049  25bb 1e0d          	ldw	x,(OFST-12,sp)
13050  25bd 1c0001        	addw	x,#1
13051  25c0 1f0d          	ldw	(OFST-12,sp),x
13053  25c2 2005          	jra	L7074
13054  25c4               L5074:
13055                     ; 2465 					list_counter =0;
13057  25c4 5f            	clrw	x
13058  25c5 1f0d          	ldw	(OFST-12,sp),x
13059                     ; 2466 					Comm_step =0;
13061  25c7 3f64          	clr	_Comm_step
13062  25c9               L7074:
13063                     ; 2468 			if(list_counter == 1) 							//1~18
13065  25c9 1e0d          	ldw	x,(OFST-12,sp)
13066  25cb a30001        	cpw	x,#1
13067  25ce 2646          	jrne	L1174
13068                     ; 2470 					Comm_step =comm_1_s;
13070  25d0 35100064      	mov	_Comm_step,#16
13071                     ; 2471 					if(Pause_bz ==0) 
13073  25d4 3dd1          	tnz	_Pause_bz
13074  25d6 262c          	jrne	L3174
13075                     ; 2473 					if(Warm_status &Select_1_KEY)  temp_8 =Warm_function_deal(tmain_1,Warm_1_timer);
13077  25d8 b6d6          	ld	a,_Warm_status
13078  25da a501          	bcp	a,#1
13079  25dc 270d          	jreq	L5174
13082  25de b6d7          	ld	a,_Warm_1_timer
13083  25e0 97            	ld	xl,a
13084  25e1 b6b7          	ld	a,_tmain_1
13085  25e3 95            	ld	xh,a
13086  25e4 cd1eda        	call	_Warm_function_deal
13088  25e7 6b18          	ld	(OFST-1,sp),a
13090  25e9 2004          	jra	L7174
13091  25eb               L5174:
13092                     ; 2474           				else temp_8 =zone_1_level;														
13094  25eb b694          	ld	a,_zone_1_level
13095  25ed 6b18          	ld	(OFST-1,sp),a
13096  25ef               L7174:
13097                     ; 2475           						comm_deal(0,Add_3,temp_8,time_level_1,Err_1_data);  
13099  25ef 3b0078        	push	_Err_1_data
13100  25f2 3b00bf        	push	_time_level_1
13101  25f5 7b1a          	ld	a,(OFST+1,sp)
13102  25f7 88            	push	a
13103  25f8 ae0060        	ldw	x,#96
13104  25fb 4f            	clr	a
13105  25fc 95            	ld	xh,a
13106  25fd cd039c        	call	_comm_deal
13108  2600 5b03          	addw	sp,#3
13110  2602 2012          	jra	L1174
13111  2604               L3174:
13112                     ; 2477           				else    	comm_deal(0,Add_3,     0,time_level_1,Err_1_data); 				
13114  2604 3b0078        	push	_Err_1_data
13115  2607 3b00bf        	push	_time_level_1
13116  260a 4b00          	push	#0
13117  260c ae0060        	ldw	x,#96
13118  260f 4f            	clr	a
13119  2610 95            	ld	xh,a
13120  2611 cd039c        	call	_comm_deal
13122  2614 5b03          	addw	sp,#3
13123  2616               L1174:
13124                     ; 2479 			if(list_counter ==19)   						//19~36
13126  2616 1e0d          	ldw	x,(OFST-12,sp)
13127  2618 a30013        	cpw	x,#19
13128  261b 2648          	jrne	L3274
13129                     ; 2481 					Comm_step =comm_2_s;
13131  261d 35200064      	mov	_Comm_step,#32
13132                     ; 2482 					if(Pause_bz ==0) 
13134  2621 3dd1          	tnz	_Pause_bz
13135  2623 262d          	jrne	L5274
13136                     ; 2484 					if(Warm_status &Select_2_KEY)  temp_8 =Warm_function_deal(tmain_2,Warm_2_timer);
13138  2625 b6d6          	ld	a,_Warm_status
13139  2627 a502          	bcp	a,#2
13140  2629 270d          	jreq	L7274
13143  262b b6d8          	ld	a,_Warm_2_timer
13144  262d 97            	ld	xl,a
13145  262e b6b8          	ld	a,_tmain_2
13146  2630 95            	ld	xh,a
13147  2631 cd1eda        	call	_Warm_function_deal
13149  2634 6b18          	ld	(OFST-1,sp),a
13151  2636 2004          	jra	L1374
13152  2638               L7274:
13153                     ; 2485           				else temp_8 =zone_2_level;					
13155  2638 b695          	ld	a,_zone_2_level
13156  263a 6b18          	ld	(OFST-1,sp),a
13157  263c               L1374:
13158                     ; 2486           						comm_deal(1,Add_4,temp_8,time_level_2,Err_2_data);  
13160  263c 3b0079        	push	_Err_2_data
13161  263f 3b00c0        	push	_time_level_2
13162  2642 7b1a          	ld	a,(OFST+1,sp)
13163  2644 88            	push	a
13164  2645 ae0080        	ldw	x,#128
13165  2648 a601          	ld	a,#1
13166  264a 95            	ld	xh,a
13167  264b cd039c        	call	_comm_deal
13169  264e 5b03          	addw	sp,#3
13171  2650 2013          	jra	L3274
13172  2652               L5274:
13173                     ; 2488           				else            comm_deal(1,Add_4,     0,time_level_2,Err_2_data); 		 				
13175  2652 3b0079        	push	_Err_2_data
13176  2655 3b00c0        	push	_time_level_2
13177  2658 4b00          	push	#0
13178  265a ae0080        	ldw	x,#128
13179  265d a601          	ld	a,#1
13180  265f 95            	ld	xh,a
13181  2660 cd039c        	call	_comm_deal
13183  2663 5b03          	addw	sp,#3
13184  2665               L3274:
13185                     ; 2490 			if(list_counter ==37)							//37~54
13187  2665 1e0d          	ldw	x,(OFST-12,sp)
13188  2667 a30025        	cpw	x,#37
13189  266a 2648          	jrne	L5374
13190                     ; 2492 					Comm_step =comm_3_s;
13192  266c 35300064      	mov	_Comm_step,#48
13193                     ; 2493 					if(Pause_bz ==0) 
13195  2670 3dd1          	tnz	_Pause_bz
13196  2672 262d          	jrne	L7374
13197                     ; 2495 					if(Warm_status &Select_3_KEY)  temp_8 =Warm_function_deal(tmain_3,Warm_3_timer);
13199  2674 b6d6          	ld	a,_Warm_status
13200  2676 a504          	bcp	a,#4
13201  2678 270d          	jreq	L1474
13204  267a b6d9          	ld	a,_Warm_3_timer
13205  267c 97            	ld	xl,a
13206  267d b6b9          	ld	a,_tmain_3
13207  267f 95            	ld	xh,a
13208  2680 cd1eda        	call	_Warm_function_deal
13210  2683 6b18          	ld	(OFST-1,sp),a
13212  2685 2004          	jra	L3474
13213  2687               L1474:
13214                     ; 2496           				else temp_8 =zone_3_level;	
13216  2687 b696          	ld	a,_zone_3_level
13217  2689 6b18          	ld	(OFST-1,sp),a
13218  268b               L3474:
13219                     ; 2497           						comm_deal(2,Add_1,temp_8,time_level_3,Err_3_data);    
13221  268b 3b007a        	push	_Err_3_data
13222  268e 3b00c1        	push	_time_level_3
13223  2691 7b1a          	ld	a,(OFST+1,sp)
13224  2693 88            	push	a
13225  2694 ae0020        	ldw	x,#32
13226  2697 a602          	ld	a,#2
13227  2699 95            	ld	xh,a
13228  269a cd039c        	call	_comm_deal
13230  269d 5b03          	addw	sp,#3
13232  269f 2013          	jra	L5374
13233  26a1               L7374:
13234                     ; 2499           				else    	comm_deal(2,Add_1,     0,time_level_3,Err_3_data);  				
13236  26a1 3b007a        	push	_Err_3_data
13237  26a4 3b00c1        	push	_time_level_3
13238  26a7 4b00          	push	#0
13239  26a9 ae0020        	ldw	x,#32
13240  26ac a602          	ld	a,#2
13241  26ae 95            	ld	xh,a
13242  26af cd039c        	call	_comm_deal
13244  26b2 5b03          	addw	sp,#3
13245  26b4               L5374:
13246                     ; 2501 			if(list_counter ==55)							//55~72
13248  26b4 1e0d          	ldw	x,(OFST-12,sp)
13249  26b6 a30037        	cpw	x,#55
13250  26b9 2648          	jrne	L7474
13251                     ; 2503 					Comm_step =comm_4_s;
13253  26bb 35400064      	mov	_Comm_step,#64
13254                     ; 2504 					if(Pause_bz ==0) 
13256  26bf 3dd1          	tnz	_Pause_bz
13257  26c1 262d          	jrne	L1574
13258                     ; 2506 					if(Warm_status &Select_4_KEY)  temp_8 =Warm_function_deal(tmain_4,Warm_4_timer);
13260  26c3 b6d6          	ld	a,_Warm_status
13261  26c5 a508          	bcp	a,#8
13262  26c7 270d          	jreq	L3574
13265  26c9 b6da          	ld	a,_Warm_4_timer
13266  26cb 97            	ld	xl,a
13267  26cc b6ba          	ld	a,_tmain_4
13268  26ce 95            	ld	xh,a
13269  26cf cd1eda        	call	_Warm_function_deal
13271  26d2 6b18          	ld	(OFST-1,sp),a
13273  26d4 2004          	jra	L5574
13274  26d6               L3574:
13275                     ; 2507           				else temp_8 =zone_4_level;	
13277  26d6 b697          	ld	a,_zone_4_level
13278  26d8 6b18          	ld	(OFST-1,sp),a
13279  26da               L5574:
13280                     ; 2508           						comm_deal(3,Add_2,temp_8,time_level_4,Err_4_data);       
13282  26da 3b007b        	push	_Err_4_data
13283  26dd 3b00c2        	push	_time_level_4
13284  26e0 7b1a          	ld	a,(OFST+1,sp)
13285  26e2 88            	push	a
13286  26e3 ae0040        	ldw	x,#64
13287  26e6 a603          	ld	a,#3
13288  26e8 95            	ld	xh,a
13289  26e9 cd039c        	call	_comm_deal
13291  26ec 5b03          	addw	sp,#3
13293  26ee 2013          	jra	L7474
13294  26f0               L1574:
13295                     ; 2510           				else    	comm_deal(3,Add_2,     0,time_level_4,Err_4_data); 				
13297  26f0 3b007b        	push	_Err_4_data
13298  26f3 3b00c2        	push	_time_level_4
13299  26f6 4b00          	push	#0
13300  26f8 ae0040        	ldw	x,#64
13301  26fb a603          	ld	a,#3
13302  26fd 95            	ld	xh,a
13303  26fe cd039c        	call	_comm_deal
13305  2701 5b03          	addw	sp,#3
13306  2703               L7474:
13307                     ; 2512 			if(list_counter >=73)				//0.73s one cycle
13309  2703 1e0d          	ldw	x,(OFST-12,sp)
13310  2705 a30049        	cpw	x,#73
13311  2708 2503          	jrult	L3074
13312                     ; 2514 					list_counter=0;
13314  270a 5f            	clrw	x
13315  270b 1f0d          	ldw	(OFST-12,sp),x
13316  270d               L3074:
13317                     ; 2531 	if(Prepare_data_bz ==TRUE)
13319  270d b61e          	ld	a,_Prepare_data_bz
13320  270f a101          	cp	a,#1
13321  2711 2703          	jreq	L644
13322  2713 cc2b44        	jp	L3674
13323  2716               L644:
13324                     ; 2533 	   Prepare_data_bz =FALSE;
13326  2716 3f1e          	clr	_Prepare_data_bz
13327                     ; 2535 	   if(lock_bz) lock_flash_accout++;	
13329  2718 3d20          	tnz	_lock_bz
13330  271a 2704          	jreq	L5674
13333  271c 3c21          	inc	_lock_flash_accout
13335  271e 2002          	jra	L7674
13336  2720               L5674:
13337                     ; 2536 	   else lock_flash_accout =0;   
13339  2720 3f21          	clr	_lock_flash_accout
13340  2722               L7674:
13341                     ; 2537 	   if(lock_flash_accout ==8)  lock_flash_accout =1;
13343  2722 b621          	ld	a,_lock_flash_accout
13344  2724 a108          	cp	a,#8
13345  2726 2604          	jrne	L1774
13348  2728 35010021      	mov	_lock_flash_accout,#1
13349  272c               L1774:
13350                     ; 2539 	   if(Time_dot_bz ==TRUE) Time_dot_bz =FALSE;
13352  272c b61d          	ld	a,_Time_dot_bz
13353  272e a101          	cp	a,#1
13354  2730 2604          	jrne	L3774
13357  2732 3f1d          	clr	_Time_dot_bz
13359  2734 2004          	jra	L5774
13360  2736               L3774:
13361                     ; 2540 	   else Time_dot_bz =TRUE;
13363  2736 3501001d      	mov	_Time_dot_bz,#1
13364  273a               L5774:
13365                     ; 2543             if(Power_on_bz ==FALSE)  				  //off status
13367  273a 3d1f          	tnz	_Power_on_bz
13368  273c 2703          	jreq	L054
13369  273e cc27f3        	jp	L7774
13370  2741               L054:
13371                     ; 2545                	 	if((key_initial_count >99) && (key_initial_count <200)) 
13373  2741 b62b          	ld	a,_key_initial_count
13374  2743 a164          	cp	a,#100
13375  2745 251c          	jrult	L1005
13377  2747 b62b          	ld	a,_key_initial_count
13378  2749 a1c8          	cp	a,#200
13379  274b 2416          	jruge	L1005
13380                     ; 2547                	 	 	for(i=0;i<7;i++)   Disp_buf[i] =SEG_ALL;   //power on full light 1s
13382  274d 0f19          	clr	(OFST+0,sp)
13383  274f               L3005:
13386  274f 7b19          	ld	a,(OFST+0,sp)
13387  2751 5f            	clrw	x
13388  2752 97            	ld	xl,a
13389  2753 a6ff          	ld	a,#255
13390  2755 e724          	ld	(_Disp_buf,x),a
13393  2757 0c19          	inc	(OFST+0,sp)
13396  2759 7b19          	ld	a,(OFST+0,sp)
13397  275b a107          	cp	a,#7
13398  275d 25f0          	jrult	L3005
13400  275f ac442b44      	jpf	L3674
13401  2763               L1005:
13402                     ; 2553                	 			for(i=0;i<7;i++)   Disp_buf[i] =CHR_BLANK;	     	//all blank
13404  2763 0f19          	clr	(OFST+0,sp)
13405  2765               L3105:
13408  2765 7b19          	ld	a,(OFST+0,sp)
13409  2767 5f            	clrw	x
13410  2768 97            	ld	xl,a
13411  2769 6f24          	clr	(_Disp_buf,x)
13414  276b 0c19          	inc	(OFST+0,sp)
13417  276d 7b19          	ld	a,(OFST+0,sp)
13418  276f a107          	cp	a,#7
13419  2771 25f2          	jrult	L3105
13420                     ; 2555                	   			if((idle_count) && (lock_bz == TRUE))  	  //"Lo"			    
13422  2773 3d2c          	tnz	_idle_count
13423  2775 270e          	jreq	L1205
13425  2777 b620          	ld	a,_lock_bz
13426  2779 a101          	cp	a,#1
13427  277b 2608          	jrne	L1205
13428                     ; 2557                	     					Disp_buf[4] = CHR_L;
13430  277d 35380028      	mov	_Disp_buf+4,#56
13431                     ; 2558                	     					Disp_buf[5] = CHR_O;
13433  2781 355c0029      	mov	_Disp_buf+5,#92
13434  2785               L1205:
13435                     ; 2560                	    			if(Time_dot_bz ==TRUE)
13437  2785 b61d          	ld	a,_Time_dot_bz
13438  2787 a101          	cp	a,#1
13439  2789 2620          	jrne	L3205
13440                     ; 2562                	    			if(flash_H_1_min) Disp_buf[0] = CHR_H;  //flash "H"
13442  278b 3d38          	tnz	_flash_H_1_min
13443  278d 2704          	jreq	L5205
13446  278f 35760024      	mov	_Disp_buf,#118
13447  2793               L5205:
13448                     ; 2563                	    			if(flash_H_2_min) Disp_buf[1] = CHR_H;  //flash "H"
13450  2793 3d39          	tnz	_flash_H_2_min
13451  2795 2704          	jreq	L7205
13454  2797 35760025      	mov	_Disp_buf+1,#118
13455  279b               L7205:
13456                     ; 2564                	    			if(flash_H_3_min) Disp_buf[2] = CHR_H;	//flash "H"
13458  279b 3d3a          	tnz	_flash_H_3_min
13459  279d 2704          	jreq	L1305
13462  279f 35760026      	mov	_Disp_buf+2,#118
13463  27a3               L1305:
13464                     ; 2565                	    			if(flash_H_4_min) Disp_buf[3] = CHR_H;  //flash "H"
13466  27a3 3d3b          	tnz	_flash_H_4_min
13467  27a5 2704          	jreq	L3205
13470  27a7 35760027      	mov	_Disp_buf+3,#118
13471  27ab               L3205:
13472                     ; 2567                	    			if(((sys_adj_status >=2)||(buzzer_account >=50))&&(Time_dot_bz ==TRUE)) 
13474  27ab b6cf          	ld	a,_sys_adj_status
13475  27ad a102          	cp	a,#2
13476  27af 2406          	jruge	L7305
13478  27b1 b623          	ld	a,_buzzer_account
13479  27b3 a132          	cp	a,#50
13480  27b5 251b          	jrult	L5305
13481  27b7               L7305:
13483  27b7 b61d          	ld	a,_Time_dot_bz
13484  27b9 a101          	cp	a,#1
13485  27bb 2615          	jrne	L5305
13486                     ; 2569                	    			  Disp_buf[4] =Display_decode(sys_disp_status >>4)|SEG_P;
13488  27bd b6d0          	ld	a,_sys_disp_status
13489  27bf 4e            	swap	a
13490  27c0 a40f          	and	a,#15
13491  27c2 cd08f0        	call	_Display_decode
13493  27c5 aa80          	or	a,#128
13494  27c7 b728          	ld	_Disp_buf+4,a
13495                     ; 2570                	     			  Disp_buf[5] =Display_decode(sys_disp_status &0x0F);       
13497  27c9 b6d0          	ld	a,_sys_disp_status
13498  27cb a40f          	and	a,#15
13499  27cd cd08f0        	call	_Display_decode
13501  27d0 b729          	ld	_Disp_buf+5,a
13502  27d2               L5305:
13503                     ; 2572                	    			 if((SW_disp)&&(time_flash_count%2))  
13505  27d2 3d00          	tnz	_SW_disp
13506  27d4 2603          	jrne	L254
13507  27d6 cc2b44        	jp	L3674
13508  27d9               L254:
13510  27d9 b637          	ld	a,_time_flash_count
13511  27db a501          	bcp	a,#1
13512  27dd 2603          	jrne	L454
13513  27df cc2b44        	jp	L3674
13514  27e2               L454:
13515                     ; 2574                	    			  Disp_buf[4] =CHR_U;
13517  27e2 353e0028      	mov	_Disp_buf+4,#62
13518                     ; 2575                	     			  Disp_buf[5] =Display_decode(SW_disp &0x0F); 
13520  27e6 b600          	ld	a,_SW_disp
13521  27e8 a40f          	and	a,#15
13522  27ea cd08f0        	call	_Display_decode
13524  27ed b729          	ld	_Disp_buf+5,a
13525  27ef ac442b44      	jpf	L3674
13526  27f3               L7774:
13527                     ; 2581                	   	if(time_flash_count %2)  {Disp_buf[4] =CHR_BLANK;Disp_buf[5] =CHR_BLANK;}	//timer flash blank
13529  27f3 b637          	ld	a,_time_flash_count
13530  27f5 a501          	bcp	a,#1
13531  27f7 2708          	jreq	L5405
13534  27f9 3f28          	clr	_Disp_buf+4
13537  27fb 3f29          	clr	_Disp_buf+5
13539  27fd aca329a3      	jpf	L7405
13540  2801               L5405:
13541                     ; 2584                	 		if((time_flash_count) || (zone_flash_count))				//flash on
13543  2801 3d37          	tnz	_time_flash_count
13544  2803 2604          	jrne	L3505
13546  2805 3d2d          	tnz	_zone_flash_count
13547  2807 2774          	jreq	L1505
13548  2809               L3505:
13549                     ; 2586                	 			    temp_8 =0;
13551  2809 7b18          	ld	a,(OFST-1,sp)
13552  280b 97            	ld	xl,a
13553                     ; 2587                	 			    	     if((key_zone ==Select_1_KEY)&&(timer_status & Select_1_KEY))  temp_8 =zone_1_timer;
13555  280c b635          	ld	a,_key_zone
13556  280e a101          	cp	a,#1
13557  2810 260c          	jrne	L5505
13559  2812 b636          	ld	a,_timer_status
13560  2814 a501          	bcp	a,#1
13561  2816 2706          	jreq	L5505
13564  2818 b69b          	ld	a,_zone_1_timer+1
13565  281a 6b18          	ld	(OFST-1,sp),a
13567  281c 203a          	jra	L5705
13568  281e               L5505:
13569                     ; 2588                	 			    	else if((key_zone ==Select_2_KEY)&&(timer_status & Select_2_KEY))  temp_8 =zone_2_timer;
13571  281e b635          	ld	a,_key_zone
13572  2820 a102          	cp	a,#2
13573  2822 260c          	jrne	L1605
13575  2824 b636          	ld	a,_timer_status
13576  2826 a502          	bcp	a,#2
13577  2828 2706          	jreq	L1605
13580  282a b69d          	ld	a,_zone_2_timer+1
13581  282c 6b18          	ld	(OFST-1,sp),a
13583  282e 2028          	jra	L5705
13584  2830               L1605:
13585                     ; 2589                	 			    	else if((key_zone ==Select_3_KEY)&&(timer_status & Select_3_KEY))  temp_8 =zone_3_timer;
13587  2830 b635          	ld	a,_key_zone
13588  2832 a104          	cp	a,#4
13589  2834 260c          	jrne	L5605
13591  2836 b636          	ld	a,_timer_status
13592  2838 a504          	bcp	a,#4
13593  283a 2706          	jreq	L5605
13596  283c b69f          	ld	a,_zone_3_timer+1
13597  283e 6b18          	ld	(OFST-1,sp),a
13599  2840 2016          	jra	L5705
13600  2842               L5605:
13601                     ; 2590                	 			    	else if((key_zone ==Select_4_KEY)&&(timer_status & Select_4_KEY))  temp_8 =zone_4_timer;					
13603  2842 b635          	ld	a,_key_zone
13604  2844 a108          	cp	a,#8
13605  2846 260c          	jrne	L1705
13607  2848 b636          	ld	a,_timer_status
13608  284a a508          	bcp	a,#8
13609  284c 2706          	jreq	L1705
13612  284e b6a1          	ld	a,_zone_4_timer+1
13613  2850 6b18          	ld	(OFST-1,sp),a
13615  2852 2004          	jra	L5705
13616  2854               L1705:
13617                     ; 2591                	 			    	else temp_8 = general_timer;              	 			    	
13619  2854 b698          	ld	a,_general_timer
13620  2856 6b18          	ld	(OFST-1,sp),a
13621  2858               L5705:
13622                     ; 2622                	 	 if(temp_8)      		//if timer value is true	 	              	 	
13624  2858 0d18          	tnz	(OFST-1,sp)
13625  285a 2603          	jrne	L654
13626  285c cc2959        	jp	L7315
13627  285f               L654:
13628                     ; 2624                	 		 	if((lock_bz == TRUE) && (lock_flash_accout <=4)) 		//flash "Lo"and"timer value"
13630  285f b620          	ld	a,_lock_bz
13631  2861 a101          	cp	a,#1
13632  2863 2703          	jreq	L064
13633  2865 cc2938        	jp	L1415
13634  2868               L064:
13636  2868 b621          	ld	a,_lock_flash_accout
13637  286a a105          	cp	a,#5
13638  286c 2503          	jrult	L264
13639  286e cc2938        	jp	L1415
13640  2871               L264:
13641                     ; 2626                	  				Disp_buf[4] = CHR_L;
13643  2871 35380028      	mov	_Disp_buf+4,#56
13644                     ; 2627                	  				Disp_buf[5] = CHR_O;
13646  2875 355c0029      	mov	_Disp_buf+5,#92
13648  2879 ac7f297f      	jpf	L5415
13649  287d               L1505:
13650                     ; 2595                	 		 		if(timer_status) 
13652  287d 3d36          	tnz	_timer_status
13653  287f 2603          	jrne	L464
13654  2881 cc2930        	jp	L7705
13655  2884               L464:
13656                     ; 2597                	 		 		 par_1 =255;//give a biggest value ignore compare
13658  2884 a6ff          	ld	a,#255
13659  2886 6b13          	ld	(OFST-6,sp),a
13660                     ; 2598                	 		 		 par_2 =255;//give a biggest value ignore compare
13662  2888 a6ff          	ld	a,#255
13663  288a 6b19          	ld	(OFST+0,sp),a
13664                     ; 2599                	 		 		 par_3 =255;//give a biggest value ignore compare
13666  288c a6ff          	ld	a,#255
13667  288e 6b08          	ld	(OFST-17,sp),a
13668                     ; 2600                	 		 		 par_4 =255;//give a biggest value ignore compare
13670  2890 a6ff          	ld	a,#255
13671  2892 6b18          	ld	(OFST-1,sp),a
13672                     ; 2601                	 		 		 if(Pause_bz)
13674  2894 3dd1          	tnz	_Pause_bz
13675  2896 272a          	jreq	L1015
13676                     ; 2603                	 				 if(timer_status & Select_1_KEY) par_1 =Pause_save_timer_1;	
13678  2898 b636          	ld	a,_timer_status
13679  289a a501          	bcp	a,#1
13680  289c 2704          	jreq	L3015
13683  289e b6d2          	ld	a,_Pause_save_timer_1
13684  28a0 6b13          	ld	(OFST-6,sp),a
13685  28a2               L3015:
13686                     ; 2604 						 if(timer_status & Select_2_KEY) par_2 =Pause_save_timer_2;					
13688  28a2 b636          	ld	a,_timer_status
13689  28a4 a502          	bcp	a,#2
13690  28a6 2704          	jreq	L5015
13693  28a8 b6d3          	ld	a,_Pause_save_timer_2
13694  28aa 6b19          	ld	(OFST+0,sp),a
13695  28ac               L5015:
13696                     ; 2605 						 if(timer_status & Select_3_KEY) par_3 =Pause_save_timer_3;					
13698  28ac b636          	ld	a,_timer_status
13699  28ae a504          	bcp	a,#4
13700  28b0 2704          	jreq	L7015
13703  28b2 b6d4          	ld	a,_Pause_save_timer_3
13704  28b4 6b08          	ld	(OFST-17,sp),a
13705  28b6               L7015:
13706                     ; 2606 						 if(timer_status & Select_4_KEY) par_4 =Pause_save_timer_4;					
13708  28b6 b636          	ld	a,_timer_status
13709  28b8 a508          	bcp	a,#8
13710  28ba 275e          	jreq	L3115
13713  28bc b6d5          	ld	a,_Pause_save_timer_4
13714  28be 6b18          	ld	(OFST-1,sp),a
13715  28c0 2058          	jra	L3115
13716  28c2               L1015:
13717                     ; 2612 						 if(timer_status & Select_1_KEY) {if(zone_1_timer >99) zone_1_timer =1;par_1 =zone_1_timer;}
13719  28c2 b636          	ld	a,_timer_status
13720  28c4 a501          	bcp	a,#1
13721  28c6 2710          	jreq	L5115
13724  28c8 be9a          	ldw	x,_zone_1_timer
13725  28ca a30064        	cpw	x,#100
13726  28cd 2505          	jrult	L7115
13729  28cf ae0001        	ldw	x,#1
13730  28d2 bf9a          	ldw	_zone_1_timer,x
13731  28d4               L7115:
13734  28d4 b69b          	ld	a,_zone_1_timer+1
13735  28d6 6b13          	ld	(OFST-6,sp),a
13736  28d8               L5115:
13737                     ; 2613 						 if(timer_status & Select_2_KEY) {if(zone_2_timer >99) zone_2_timer =1;par_2 =zone_2_timer;}						 
13739  28d8 b636          	ld	a,_timer_status
13740  28da a502          	bcp	a,#2
13741  28dc 2710          	jreq	L1215
13744  28de be9c          	ldw	x,_zone_2_timer
13745  28e0 a30064        	cpw	x,#100
13746  28e3 2505          	jrult	L3215
13749  28e5 ae0001        	ldw	x,#1
13750  28e8 bf9c          	ldw	_zone_2_timer,x
13751  28ea               L3215:
13754  28ea b69d          	ld	a,_zone_2_timer+1
13755  28ec 6b19          	ld	(OFST+0,sp),a
13756  28ee               L1215:
13757                     ; 2614 						 if(timer_status & Select_3_KEY) {if(zone_3_timer >99) zone_3_timer =1;par_3 =zone_3_timer;}
13759  28ee b636          	ld	a,_timer_status
13760  28f0 a504          	bcp	a,#4
13761  28f2 2710          	jreq	L5215
13764  28f4 be9e          	ldw	x,_zone_3_timer
13765  28f6 a30064        	cpw	x,#100
13766  28f9 2505          	jrult	L7215
13769  28fb ae0001        	ldw	x,#1
13770  28fe bf9e          	ldw	_zone_3_timer,x
13771  2900               L7215:
13774  2900 b69f          	ld	a,_zone_3_timer+1
13775  2902 6b08          	ld	(OFST-17,sp),a
13776  2904               L5215:
13777                     ; 2615 						 if(timer_status & Select_4_KEY) {if(zone_4_timer >99) zone_4_timer =1;par_4 =zone_4_timer;}
13779  2904 b636          	ld	a,_timer_status
13780  2906 a508          	bcp	a,#8
13781  2908 2710          	jreq	L3115
13784  290a bea0          	ldw	x,_zone_4_timer
13785  290c a30064        	cpw	x,#100
13786  290f 2505          	jrult	L3315
13789  2911 ae0001        	ldw	x,#1
13790  2914 bfa0          	ldw	_zone_4_timer,x
13791  2916               L3315:
13794  2916 b6a1          	ld	a,_zone_4_timer+1
13795  2918 6b18          	ld	(OFST-1,sp),a
13796  291a               L3115:
13797                     ; 2617                	 		 		 temp_8 =calculate_min(par_1,par_2,par_3,par_4);
13799  291a 7b18          	ld	a,(OFST-1,sp)
13800  291c 88            	push	a
13801  291d 7b09          	ld	a,(OFST-16,sp)
13802  291f 88            	push	a
13803  2920 7b1b          	ld	a,(OFST+2,sp)
13804  2922 97            	ld	xl,a
13805  2923 7b15          	ld	a,(OFST-4,sp)
13806  2925 95            	ld	xh,a
13807  2926 cd08c2        	call	_calculate_min
13809  2929 85            	popw	x
13810  292a 6b18          	ld	(OFST-1,sp),a
13812  292c ac582858      	jpf	L5705
13813  2930               L7705:
13814                     ; 2619                	 		             	else temp_8 =general_timer; 				//reminder timer
13816  2930 b698          	ld	a,_general_timer
13817  2932 6b18          	ld	(OFST-1,sp),a
13818  2934 ac582858      	jpf	L5705
13819  2938               L1415:
13820                     ; 2631                	 		 		Disp_buf[4] = Display_decode(temp_8 /10);
13822  2938 7b18          	ld	a,(OFST-1,sp)
13823  293a ae000a        	ldw	x,#10
13824  293d 51            	exgw	x,y
13825  293e 5f            	clrw	x
13826  293f 97            	ld	xl,a
13827  2940 65            	divw	x,y
13828  2941 9f            	ld	a,xl
13829  2942 cd08f0        	call	_Display_decode
13831  2945 b728          	ld	_Disp_buf+4,a
13832                     ; 2632                	 		 		Disp_buf[5] = Display_decode(temp_8 %10);
13834  2947 7b18          	ld	a,(OFST-1,sp)
13835  2949 ae000a        	ldw	x,#10
13836  294c 51            	exgw	x,y
13837  294d 5f            	clrw	x
13838  294e 97            	ld	xl,a
13839  294f 65            	divw	x,y
13840  2950 909f          	ld	a,yl
13841  2952 cd08f0        	call	_Display_decode
13843  2955 b729          	ld	_Disp_buf+5,a
13844  2957 2026          	jra	L5415
13845  2959               L7315:
13846                     ; 2637                	 		 	if(lock_bz == TRUE)  			//display "Lo"
13848  2959 b620          	ld	a,_lock_bz
13849  295b a101          	cp	a,#1
13850  295d 260a          	jrne	L7415
13851                     ; 2639                	     				Disp_buf[4] = CHR_L;
13853  295f 35380028      	mov	_Disp_buf+4,#56
13854                     ; 2640                	     				Disp_buf[5] = CHR_O;
13856  2963 355c0029      	mov	_Disp_buf+5,#92
13858  2967 2016          	jra	L5415
13859  2969               L7415:
13860                     ; 2642                	    			else if(time_flash_count) {Disp_buf[4] = NUM_0;Disp_buf[5] = NUM_0; }
13862  2969 3d37          	tnz	_time_flash_count
13863  296b 270a          	jreq	L3515
13866  296d 353f0028      	mov	_Disp_buf+4,#63
13869  2971 353f0029      	mov	_Disp_buf+5,#63
13871  2975 2008          	jra	L5415
13872  2977               L3515:
13873                     ; 2645                	    		 		Disp_buf[4] = SEG_G;
13875  2977 35400028      	mov	_Disp_buf+4,#64
13876                     ; 2646                	 		 	 	Disp_buf[5] = SEG_G;
13878  297b 35400029      	mov	_Disp_buf+5,#64
13879  297f               L5415:
13880                     ; 2650                	 	  if(limit_count) 
13882  297f 3d30          	tnz	_limit_count
13883  2981 270a          	jreq	L7515
13884                     ; 2652                	 	  	 Disp_buf[4] = CHR_P;
13886  2983 35730028      	mov	_Disp_buf+4,#115
13887                     ; 2653                	 		 Disp_buf[5] = CHR_N;	
13889  2987 35370029      	mov	_Disp_buf+5,#55
13890                     ; 2654                	 		 limit_count--;
13892  298b 3a30          	dec	_limit_count
13893  298d               L7515:
13894                     ; 2657                	 	  if(time_flash_count %2)  
13896  298d b637          	ld	a,_time_flash_count
13897  298f a501          	bcp	a,#1
13898  2991 2710          	jreq	L7405
13899                     ; 2659                	 		if(timer_list ==1) Disp_buf[4] =CHR_BLANK;
13901  2993 b6cc          	ld	a,_timer_list
13902  2995 a101          	cp	a,#1
13903  2997 2602          	jrne	L3615
13906  2999 3f28          	clr	_Disp_buf+4
13907  299b               L3615:
13908                     ; 2660                	 		if(timer_list ==2) Disp_buf[5] =CHR_BLANK;
13910  299b b6cc          	ld	a,_timer_list
13911  299d a102          	cp	a,#2
13912  299f 2602          	jrne	L7405
13915  29a1 3f29          	clr	_Disp_buf+5
13916  29a3               L7405:
13917                     ; 2664                	  	Disp_buf[0] =ON_disp_zone_x(0,bbq_L_bz,(Warm_status &Select_1_KEY),zone_1_level,&change_count,flex_L_bz,Select_1_KEY,flash_H_1_min,zone_1_nopan_time,zone_2_nopan_time,Err_1_data);	 //zone1 normal display
13919  29a3 3b0078        	push	_Err_1_data
13920  29a6 3b006d        	push	_zone_2_nopan_time
13921  29a9 3b006c        	push	_zone_1_nopan_time
13922  29ac 3b0038        	push	_flash_H_1_min
13923  29af 4b01          	push	#1
13924  29b1 3b0044        	push	_flex_L_bz
13925  29b4 ae002f        	ldw	x,#_change_count
13926  29b7 89            	pushw	x
13927  29b8 3b0094        	push	_zone_1_level
13928  29bb b6d6          	ld	a,_Warm_status
13929  29bd a401          	and	a,#1
13930  29bf 88            	push	a
13931  29c0 b646          	ld	a,_bbq_L_bz
13932  29c2 97            	ld	xl,a
13933  29c3 4f            	clr	a
13934  29c4 95            	ld	xh,a
13935  29c5 cd0963        	call	_ON_disp_zone_x
13937  29c8 5b0a          	addw	sp,#10
13938  29ca b724          	ld	_Disp_buf,a
13939                     ; 2666               	 	Disp_buf[1] =ON_disp_zone_x(1,bbq_L_bz,(Warm_status &Select_2_KEY),zone_2_level,&change_count,flex_L_bz,Select_2_KEY,flash_H_2_min,zone_2_nopan_time,zone_1_nopan_time,Err_2_data);	 //zone2 normal display               	
13941  29cc 3b0079        	push	_Err_2_data
13942  29cf 3b006c        	push	_zone_1_nopan_time
13943  29d2 3b006d        	push	_zone_2_nopan_time
13944  29d5 3b0039        	push	_flash_H_2_min
13945  29d8 4b02          	push	#2
13946  29da 3b0044        	push	_flex_L_bz
13947  29dd ae002f        	ldw	x,#_change_count
13948  29e0 89            	pushw	x
13949  29e1 3b0095        	push	_zone_2_level
13950  29e4 b6d6          	ld	a,_Warm_status
13951  29e6 a402          	and	a,#2
13952  29e8 88            	push	a
13953  29e9 b646          	ld	a,_bbq_L_bz
13954  29eb 97            	ld	xl,a
13955  29ec a601          	ld	a,#1
13956  29ee 95            	ld	xh,a
13957  29ef cd0963        	call	_ON_disp_zone_x
13959  29f2 5b0a          	addw	sp,#10
13960  29f4 b725          	ld	_Disp_buf+1,a
13961                     ; 2668                	  	Disp_buf[2] =ON_disp_zone_x(2,bbq_R_bz,(Warm_status &Select_3_KEY),zone_3_level,&change_count,flex_R_bz,Select_3_KEY,flash_H_3_min,zone_3_nopan_time,zone_4_nopan_time,Err_3_data);	 //zone3 normal display
13963  29f6 3b007a        	push	_Err_3_data
13964  29f9 3b006f        	push	_zone_4_nopan_time
13965  29fc 3b006e        	push	_zone_3_nopan_time
13966  29ff 3b003a        	push	_flash_H_3_min
13967  2a02 4b04          	push	#4
13968  2a04 3b0045        	push	_flex_R_bz
13969  2a07 ae002f        	ldw	x,#_change_count
13970  2a0a 89            	pushw	x
13971  2a0b 3b0096        	push	_zone_3_level
13972  2a0e b6d6          	ld	a,_Warm_status
13973  2a10 a404          	and	a,#4
13974  2a12 88            	push	a
13975  2a13 b647          	ld	a,_bbq_R_bz
13976  2a15 97            	ld	xl,a
13977  2a16 a602          	ld	a,#2
13978  2a18 95            	ld	xh,a
13979  2a19 cd0963        	call	_ON_disp_zone_x
13981  2a1c 5b0a          	addw	sp,#10
13982  2a1e b726          	ld	_Disp_buf+2,a
13983                     ; 2670                	  	Disp_buf[3] =ON_disp_zone_x(3,bbq_R_bz,(Warm_status &Select_4_KEY),zone_4_level,&change_count,flex_R_bz,Select_4_KEY,flash_H_4_min,zone_4_nopan_time,zone_3_nopan_time,Err_4_data);	 //zone4 normal display
13985  2a20 3b007b        	push	_Err_4_data
13986  2a23 3b006e        	push	_zone_3_nopan_time
13987  2a26 3b006f        	push	_zone_4_nopan_time
13988  2a29 3b003b        	push	_flash_H_4_min
13989  2a2c 4b08          	push	#8
13990  2a2e 3b0045        	push	_flex_R_bz
13991  2a31 ae002f        	ldw	x,#_change_count
13992  2a34 89            	pushw	x
13993  2a35 3b0097        	push	_zone_4_level
13994  2a38 b6d6          	ld	a,_Warm_status
13995  2a3a a408          	and	a,#8
13996  2a3c 88            	push	a
13997  2a3d b647          	ld	a,_bbq_R_bz
13998  2a3f 97            	ld	xl,a
13999  2a40 a603          	ld	a,#3
14000  2a42 95            	ld	xh,a
14001  2a43 cd0963        	call	_ON_disp_zone_x
14003  2a46 5b0a          	addw	sp,#10
14004  2a48 b727          	ld	_Disp_buf+3,a
14005                     ; 2672                	        if(flex_L_bz)	
14007  2a4a 3d44          	tnz	_flex_L_bz
14008  2a4c 2734          	jreq	L7615
14009                     ; 2674                	          	Disp_buf[6] |=SEG_D;
14011  2a4e 7216002a      	bset	_Disp_buf+6,#3
14012                     ; 2675                	          	if(zone_1_level==0)
14014  2a52 3d94          	tnz	_zone_1_level
14015  2a54 2630          	jrne	L5025
14016                     ; 2677                	        		  if((flash_H_1_min)||(flash_H_2_min))
14018  2a56 3d38          	tnz	_flash_H_1_min
14019  2a58 2604          	jrne	L5715
14021  2a5a 3d39          	tnz	_flash_H_2_min
14022  2a5c 271a          	jreq	L3715
14023  2a5e               L5715:
14024                     ; 2679                	        			if(Time_dot_bz ==TRUE)
14026  2a5e b61d          	ld	a,_Time_dot_bz
14027  2a60 a101          	cp	a,#1
14028  2a62 260a          	jrne	L7715
14029                     ; 2681                	        			Disp_buf[1]=CHR_H;
14031  2a64 35760025      	mov	_Disp_buf+1,#118
14032                     ; 2682                	        			Disp_buf[0]=CHR_H;
14034  2a68 35760024      	mov	_Disp_buf,#118
14036  2a6c 2018          	jra	L5025
14037  2a6e               L7715:
14038                     ; 2686                	        	  		Disp_buf[1]=CHR_UL;  
14040  2a6e 351c0025      	mov	_Disp_buf+1,#28
14041                     ; 2687                	        	  		Disp_buf[0]=CHR_NUL;
14043  2a72 35230024      	mov	_Disp_buf,#35
14044  2a76 200e          	jra	L5025
14045  2a78               L3715:
14046                     ; 2692                	        	  		Disp_buf[1]=CHR_UL;  
14048  2a78 351c0025      	mov	_Disp_buf+1,#28
14049                     ; 2693                	        	  		Disp_buf[0]=CHR_NUL;
14051  2a7c 35230024      	mov	_Disp_buf,#35
14052  2a80 2004          	jra	L5025
14053  2a82               L7615:
14054                     ; 2697                	        else         Disp_buf[6] &=~SEG_D;
14056  2a82 7217002a      	bres	_Disp_buf+6,#3
14057  2a86               L5025:
14058                     ; 2699                	        if(flex_R_bz)   
14060  2a86 3d45          	tnz	_flex_R_bz
14061  2a88 2734          	jreq	L7025
14062                     ; 2701                	          	Disp_buf[6] |=SEG_P;
14064  2a8a 721e002a      	bset	_Disp_buf+6,#7
14065                     ; 2702                	          	if(zone_3_level==0)
14067  2a8e 3d96          	tnz	_zone_3_level
14068  2a90 2630          	jrne	L5225
14069                     ; 2704                	        		  if((flash_H_3_min)||(flash_H_4_min))
14071  2a92 3d3a          	tnz	_flash_H_3_min
14072  2a94 2604          	jrne	L5125
14074  2a96 3d3b          	tnz	_flash_H_4_min
14075  2a98 271a          	jreq	L3125
14076  2a9a               L5125:
14077                     ; 2706                	        		   if(Time_dot_bz ==TRUE)
14079  2a9a b61d          	ld	a,_Time_dot_bz
14080  2a9c a101          	cp	a,#1
14081  2a9e 260a          	jrne	L7125
14082                     ; 2708                	        			Disp_buf[3]=CHR_H;
14084  2aa0 35760027      	mov	_Disp_buf+3,#118
14085                     ; 2709                	        			Disp_buf[2]=CHR_H;
14087  2aa4 35760026      	mov	_Disp_buf+2,#118
14089  2aa8 2018          	jra	L5225
14090  2aaa               L7125:
14091                     ; 2713                	        	  		Disp_buf[3]=CHR_UL;  
14093  2aaa 351c0027      	mov	_Disp_buf+3,#28
14094                     ; 2714                	        	  		Disp_buf[2]=CHR_NUL;
14096  2aae 35230026      	mov	_Disp_buf+2,#35
14097  2ab2 200e          	jra	L5225
14098  2ab4               L3125:
14099                     ; 2719                	             	  		Disp_buf[3]=CHR_UL;  
14101  2ab4 351c0027      	mov	_Disp_buf+3,#28
14102                     ; 2720                	             			Disp_buf[2]=CHR_NUL;
14104  2ab8 35230026      	mov	_Disp_buf+2,#35
14105  2abc 2004          	jra	L5225
14106  2abe               L7025:
14107                     ; 2724                	        else         Disp_buf[6] &=~SEG_P;
14109  2abe 721f002a      	bres	_Disp_buf+6,#7
14110  2ac2               L5225:
14111                     ; 2726                	        if(Pause_bz) 
14113  2ac2 3dd1          	tnz	_Pause_bz
14114  2ac4 2712          	jreq	L7225
14115                     ; 2728                	           for(i=0;i<=3;i++) Disp_buf[i] =SEG_B|SEG_C|SEG_E|SEG_F;
14117  2ac6 0f19          	clr	(OFST+0,sp)
14118  2ac8               L1325:
14121  2ac8 7b19          	ld	a,(OFST+0,sp)
14122  2aca 5f            	clrw	x
14123  2acb 97            	ld	xl,a
14124  2acc a636          	ld	a,#54
14125  2ace e724          	ld	(_Disp_buf,x),a
14128  2ad0 0c19          	inc	(OFST+0,sp)
14131  2ad2 7b19          	ld	a,(OFST+0,sp)
14132  2ad4 a104          	cp	a,#4
14133  2ad6 25f0          	jrult	L1325
14134  2ad8               L7225:
14135                     ; 2731                	 	if((zone_flash_count ==0) && (timer_status) && (Time_dot_bz ==TRUE))	//display flash timer indicator "."
14137  2ad8 3d2d          	tnz	_zone_flash_count
14138  2ada 2668          	jrne	L3674
14140  2adc 3d36          	tnz	_timer_status
14141  2ade 2764          	jreq	L3674
14143  2ae0 b61d          	ld	a,_Time_dot_bz
14144  2ae2 a101          	cp	a,#1
14145  2ae4 265e          	jrne	L3674
14146                     ; 2733                	 	  if(Pause_bz)
14148  2ae6 3dd1          	tnz	_Pause_bz
14149  2ae8 272a          	jreq	L1425
14150                     ; 2735                	 	   	if(temp_8 == Pause_save_timer_1)  Disp_buf[0] &=~SEG_P;
14152  2aea 7b18          	ld	a,(OFST-1,sp)
14153  2aec b1d2          	cp	a,_Pause_save_timer_1
14154  2aee 2604          	jrne	L3425
14157  2af0 721f0024      	bres	_Disp_buf,#7
14158  2af4               L3425:
14159                     ; 2736                	 	  	if(temp_8 == Pause_save_timer_2)  Disp_buf[1] &=~SEG_P;
14161  2af4 7b18          	ld	a,(OFST-1,sp)
14162  2af6 b1d3          	cp	a,_Pause_save_timer_2
14163  2af8 2604          	jrne	L5425
14166  2afa 721f0025      	bres	_Disp_buf+1,#7
14167  2afe               L5425:
14168                     ; 2737                	 	  	if(temp_8 == Pause_save_timer_3)  Disp_buf[2] &=~SEG_P;
14170  2afe 7b18          	ld	a,(OFST-1,sp)
14171  2b00 b1d4          	cp	a,_Pause_save_timer_3
14172  2b02 2604          	jrne	L7425
14175  2b04 721f0026      	bres	_Disp_buf+2,#7
14176  2b08               L7425:
14177                     ; 2738                	 	  	if(temp_8 == Pause_save_timer_4)  Disp_buf[3] &=~SEG_P;                	 	  	               	 	  	
14179  2b08 7b18          	ld	a,(OFST-1,sp)
14180  2b0a b1d5          	cp	a,_Pause_save_timer_4
14181  2b0c 2636          	jrne	L3674
14184  2b0e 721f0027      	bres	_Disp_buf+3,#7
14185  2b12 2030          	jra	L3674
14186  2b14               L1425:
14187                     ; 2742                	 	  	if(temp_8 == zone_1_timer)  Disp_buf[0] &=~SEG_P;
14189  2b14 7b18          	ld	a,(OFST-1,sp)
14190  2b16 5f            	clrw	x
14191  2b17 97            	ld	xl,a
14192  2b18 b39a          	cpw	x,_zone_1_timer
14193  2b1a 2604          	jrne	L5525
14196  2b1c 721f0024      	bres	_Disp_buf,#7
14197  2b20               L5525:
14198                     ; 2743                	 	  	if(temp_8 == zone_2_timer)  Disp_buf[1] &=~SEG_P;
14200  2b20 7b18          	ld	a,(OFST-1,sp)
14201  2b22 5f            	clrw	x
14202  2b23 97            	ld	xl,a
14203  2b24 b39c          	cpw	x,_zone_2_timer
14204  2b26 2604          	jrne	L7525
14207  2b28 721f0025      	bres	_Disp_buf+1,#7
14208  2b2c               L7525:
14209                     ; 2744                	 	  	if(temp_8 == zone_3_timer)  Disp_buf[2] &=~SEG_P;
14211  2b2c 7b18          	ld	a,(OFST-1,sp)
14212  2b2e 5f            	clrw	x
14213  2b2f 97            	ld	xl,a
14214  2b30 b39e          	cpw	x,_zone_3_timer
14215  2b32 2604          	jrne	L1625
14218  2b34 721f0026      	bres	_Disp_buf+2,#7
14219  2b38               L1625:
14220                     ; 2745                	 	  	if(temp_8 == zone_4_timer)  Disp_buf[3] &=~SEG_P;
14222  2b38 7b18          	ld	a,(OFST-1,sp)
14223  2b3a 5f            	clrw	x
14224  2b3b 97            	ld	xl,a
14225  2b3c b3a0          	cpw	x,_zone_4_timer
14226  2b3e 2604          	jrne	L3674
14229  2b40 721f0027      	bres	_Disp_buf+3,#7
14230  2b44               L3674:
14231                     ; 2765 	if(Flash_500ms_bz == TRUE)
14233  2b44 b619          	ld	a,_Flash_500ms_bz
14234  2b46 a101          	cp	a,#1
14235  2b48 2703          	jreq	L664
14236  2b4a cc2c7b        	jp	L5625
14237  2b4d               L664:
14238                     ; 2767 	     Flash_500ms_bz =FALSE;				
14240  2b4d 3f19          	clr	_Flash_500ms_bz
14241                     ; 2769             SM1668_SEND_COMMAND(0x03);
14243  2b4f a603          	ld	a,#3
14244  2b51 cd0000        	call	_SM1668_SEND_COMMAND
14246                     ; 2770             SM1668_SEND_COMMAND(0x40);
14248  2b54 a640          	ld	a,#64
14249  2b56 cd0000        	call	_SM1668_SEND_COMMAND
14251                     ; 2771             SM1668_SEND_COMMAND(0xC0);
14253  2b59 a6c0          	ld	a,#192
14254  2b5b cd0000        	call	_SM1668_SEND_COMMAND
14256                     ; 2773              for (i=0;i<7;i++)
14258  2b5e 0f19          	clr	(OFST+0,sp)
14259  2b60               L7625:
14260                     ; 2775               SM1668_SENT_DATA(Disp_buf[i]);
14262  2b60 7b19          	ld	a,(OFST+0,sp)
14263  2b62 5f            	clrw	x
14264  2b63 97            	ld	xl,a
14265  2b64 e624          	ld	a,(_Disp_buf,x)
14266  2b66 cd0000        	call	_SM1668_SENT_DATA
14268                     ; 2776               SM1668_SENT_DATA(0x00);
14270  2b69 4f            	clr	a
14271  2b6a cd0000        	call	_SM1668_SENT_DATA
14273                     ; 2773              for (i=0;i<7;i++)
14275  2b6d 0c19          	inc	(OFST+0,sp)
14278  2b6f 7b19          	ld	a,(OFST+0,sp)
14279  2b71 a107          	cp	a,#7
14280  2b73 25eb          	jrult	L7625
14281                     ; 2778             SM1668_SEND_COMMAND(0x89);           
14283  2b75 a689          	ld	a,#137
14284  2b77 cd0000        	call	_SM1668_SEND_COMMAND
14286                     ; 2779             D_EN_Port->ODR |= D_EN_Pin; //GPIO_WriteHigh(GPIOE,DISPEN); 
14288  2b7a 721a5014      	bset	20500,#5
14289                     ; 2781            if(zone_flash_count) zone_flash_count--;
14291  2b7e 3d2d          	tnz	_zone_flash_count
14292  2b80 2702          	jreq	L5725
14295  2b82 3a2d          	dec	_zone_flash_count
14296  2b84               L5725:
14297                     ; 2782 	   if(zone_flash_count ==0)
14299  2b84 3d2d          	tnz	_zone_flash_count
14300  2b86 2608          	jrne	L7725
14301                     ; 2784            	   	count_1_key =0;
14303  2b88 3f31          	clr	_count_1_key
14304                     ; 2785            	   	count_2_key =0;
14306  2b8a 3f32          	clr	_count_2_key
14307                     ; 2786            	   	count_3_key =0;
14309  2b8c 3f33          	clr	_count_3_key
14310                     ; 2787            	   	count_4_key =0;
14312  2b8e 3f34          	clr	_count_4_key
14313  2b90               L7725:
14314                     ; 2789           if(time_flash_count) 
14316  2b90 3d37          	tnz	_time_flash_count
14317  2b92 2720          	jreq	L1035
14318                     ; 2791               	   time_flash_count--; 
14320  2b94 3a37          	dec	_time_flash_count
14321                     ; 2792               	   if(time_flash_count ==0)      
14323  2b96 3d37          	tnz	_time_flash_count
14324  2b98 261a          	jrne	L1035
14325                     ; 2794               	   	if(timer_list ==1) {timer_list++;time_flash_count =6;}
14327  2b9a b6cc          	ld	a,_timer_list
14328  2b9c a101          	cp	a,#1
14329  2b9e 2608          	jrne	L5035
14332  2ba0 3ccc          	inc	_timer_list
14335  2ba2 35060037      	mov	_time_flash_count,#6
14337  2ba6 2002          	jra	L7035
14338  2ba8               L5035:
14339                     ; 2795               	   	else timer_list =0;
14341  2ba8 3fcc          	clr	_timer_list
14342  2baa               L7035:
14343                     ; 2796               	   	if(timer_precise_bz == TRUE)
14345  2baa b61a          	ld	a,_timer_precise_bz
14346  2bac a101          	cp	a,#1
14347  2bae 2604          	jrne	L1035
14348                     ; 2798               	   	sec_counter =0;    
14350  2bb0 3f01          	clr	_sec_counter
14351                     ; 2799               	   	timer_precise_bz =FALSE;
14353  2bb2 3f1a          	clr	_timer_precise_bz
14354  2bb4               L1035:
14355                     ; 2803            if((zone_flash_count ==0) && (time_flash_count ==0))   key_zone =0; 	 
14357  2bb4 3d2d          	tnz	_zone_flash_count
14358  2bb6 2606          	jrne	L3135
14360  2bb8 3d37          	tnz	_time_flash_count
14361  2bba 2602          	jrne	L3135
14364  2bbc 3f35          	clr	_key_zone
14365  2bbe               L3135:
14366                     ; 2805            if(zone_1_level+zone_2_level+zone_3_level+zone_4_level)     
14368  2bbe b694          	ld	a,_zone_1_level
14369  2bc0 5f            	clrw	x
14370  2bc1 bb95          	add	a,_zone_2_level
14371  2bc3 2401          	jrnc	L273
14372  2bc5 5c            	incw	x
14373  2bc6               L273:
14374  2bc6 bb96          	add	a,_zone_3_level
14375  2bc8 2401          	jrnc	L473
14376  2bca 5c            	incw	x
14377  2bcb               L473:
14378  2bcb bb97          	add	a,_zone_4_level
14379  2bcd 2401          	jrnc	L673
14380  2bcf 5c            	incw	x
14381  2bd0               L673:
14382  2bd0 02            	rlwa	x,a
14383  2bd1 5d            	tnzw	x
14384  2bd2 2603          	jrne	L074
14385  2bd4 cc2c7b        	jp	L5625
14386  2bd7               L074:
14387                     ; 2807           		fan_status =1;				//off
14389  2bd7 350100cb      	mov	_fan_status,#1
14390                     ; 2808           		par_1 =1;
14392  2bdb a601          	ld	a,#1
14393  2bdd 6b13          	ld	(OFST-6,sp),a
14394                     ; 2809           		par_2 =1;
14396  2bdf a601          	ld	a,#1
14397  2be1 6b19          	ld	(OFST+0,sp),a
14398                     ; 2812         		if(tigbt_1 >=tigbt_2) temp_8 =tigbt_1;
14400  2be3 b6b3          	ld	a,_tigbt_1
14401  2be5 b1b4          	cp	a,_tigbt_2
14402  2be7 2506          	jrult	L7135
14405  2be9 b6b3          	ld	a,_tigbt_1
14406  2beb 6b18          	ld	(OFST-1,sp),a
14408  2bed 2004          	jra	L1235
14409  2bef               L7135:
14410                     ; 2813         		else	temp_8 =tigbt_2;		//1# 2# max
14412  2bef b6b4          	ld	a,_tigbt_2
14413  2bf1 6b18          	ld	(OFST-1,sp),a
14414  2bf3               L1235:
14415                     ; 2814         		if(temp_8  <tigbt_3)  temp_8 =tigbt_3;  //1# 2# 3# max
14417  2bf3 7b18          	ld	a,(OFST-1,sp)
14418  2bf5 b1b5          	cp	a,_tigbt_3
14419  2bf7 2404          	jruge	L3235
14422  2bf9 b6b5          	ld	a,_tigbt_3
14423  2bfb 6b18          	ld	(OFST-1,sp),a
14424  2bfd               L3235:
14425                     ; 2815         		if(temp_8  <tigbt_4)  temp_8 =tigbt_4;  //1# 2# 3# 4# max
14427  2bfd 7b18          	ld	a,(OFST-1,sp)
14428  2bff b1b6          	cp	a,_tigbt_4
14429  2c01 2404          	jruge	L5235
14432  2c03 b6b6          	ld	a,_tigbt_4
14433  2c05 6b18          	ld	(OFST-1,sp),a
14434  2c07               L5235:
14435                     ; 2817           		if(temp_8 >=CON_TIGBT_45) par_1 =1;	//1/3
14437  2c07 7b18          	ld	a,(OFST-1,sp)
14438  2c09 a1c5          	cp	a,#197
14439  2c0b 2504          	jrult	L7235
14442  2c0d a601          	ld	a,#1
14443  2c0f 6b13          	ld	(OFST-6,sp),a
14444  2c11               L7235:
14445                     ; 2819           		if(temp_8 >=CON_TIGBT_50) par_1 =3;	//3/1
14447  2c11 7b18          	ld	a,(OFST-1,sp)
14448  2c13 a1cd          	cp	a,#205
14449  2c15 2504          	jrult	L1335
14452  2c17 a603          	ld	a,#3
14453  2c19 6b13          	ld	(OFST-6,sp),a
14454  2c1b               L1335:
14455                     ; 2820           		if(temp_8 >=CON_TIGBT_55) par_1 =4; 	//on
14457  2c1b 7b18          	ld	a,(OFST-1,sp)
14458  2c1d a1d4          	cp	a,#212
14459  2c1f 2504          	jrult	L3335
14462  2c21 a604          	ld	a,#4
14463  2c23 6b13          	ld	(OFST-6,sp),a
14464  2c25               L3335:
14465                     ; 2823         		if(tmain_1 >=tmain_2) temp_8 =tmain_1;
14467  2c25 b6b7          	ld	a,_tmain_1
14468  2c27 b1b8          	cp	a,_tmain_2
14469  2c29 2506          	jrult	L5335
14472  2c2b b6b7          	ld	a,_tmain_1
14473  2c2d 6b18          	ld	(OFST-1,sp),a
14475  2c2f 2004          	jra	L7335
14476  2c31               L5335:
14477                     ; 2824         		else	temp_8 =tmain_2;		//1# 2# max
14479  2c31 b6b8          	ld	a,_tmain_2
14480  2c33 6b18          	ld	(OFST-1,sp),a
14481  2c35               L7335:
14482                     ; 2825         		if(temp_8  <tmain_3)  temp_8 =tmain_3;  //1# 2# 3# max
14484  2c35 7b18          	ld	a,(OFST-1,sp)
14485  2c37 b1b9          	cp	a,_tmain_3
14486  2c39 2404          	jruge	L1435
14489  2c3b b6b9          	ld	a,_tmain_3
14490  2c3d 6b18          	ld	(OFST-1,sp),a
14491  2c3f               L1435:
14492                     ; 2826         		if(temp_8  <tmain_4)  temp_8 =tmain_4;  //1# 2# 3# 4# max
14494  2c3f 7b18          	ld	a,(OFST-1,sp)
14495  2c41 b1ba          	cp	a,_tmain_4
14496  2c43 2404          	jruge	L3435
14499  2c45 b6ba          	ld	a,_tmain_4
14500  2c47 6b18          	ld	(OFST-1,sp),a
14501  2c49               L3435:
14502                     ; 2828         		if(temp_8 >=CON_TMAIN_80)  par_2 =1;	//1/3
14504  2c49 7b18          	ld	a,(OFST-1,sp)
14505  2c4b a18c          	cp	a,#140
14506  2c4d 2504          	jrult	L5435
14509  2c4f a601          	ld	a,#1
14510  2c51 6b19          	ld	(OFST+0,sp),a
14511  2c53               L5435:
14512                     ; 2830           		if(temp_8 >=CON_TMAIN_100) par_2 =3;	//3/1
14514  2c53 7b18          	ld	a,(OFST-1,sp)
14515  2c55 a1b0          	cp	a,#176
14516  2c57 2504          	jrult	L7435
14519  2c59 a603          	ld	a,#3
14520  2c5b 6b19          	ld	(OFST+0,sp),a
14521  2c5d               L7435:
14522                     ; 2831           		if(temp_8 >=CON_TMAIN_110) par_2 =4; 	//on
14524  2c5d 7b18          	ld	a,(OFST-1,sp)
14525  2c5f a1bf          	cp	a,#191
14526  2c61 2504          	jrult	L1535
14529  2c63 a604          	ld	a,#4
14530  2c65 6b19          	ld	(OFST+0,sp),a
14531  2c67               L1535:
14532                     ; 2833         		if(par_1 >par_2)   fan_status =par_1;
14534  2c67 7b13          	ld	a,(OFST-6,sp)
14535  2c69 1119          	cp	a,(OFST+0,sp)
14536  2c6b 2306          	jrule	L3535
14539  2c6d 7b13          	ld	a,(OFST-6,sp)
14540  2c6f b7cb          	ld	_fan_status,a
14542  2c71 2004          	jra	L5535
14543  2c73               L3535:
14544                     ; 2834         		else fan_status =par_2;
14546  2c73 7b19          	ld	a,(OFST+0,sp)
14547  2c75 b7cb          	ld	_fan_status,a
14548  2c77               L5535:
14549                     ; 2836           		fan_count =120;
14551  2c77 357800ca      	mov	_fan_count,#120
14552  2c7b               L5625:
14553                     ; 2845         if(Sec_bz ==TRUE)
14555  2c7b b61b          	ld	a,_Sec_bz
14556  2c7d a101          	cp	a,#1
14557  2c7f 2703          	jreq	L274
14558  2c81 cc2e8e        	jp	L7535
14559  2c84               L274:
14560                     ; 2847            Sec_bz =FALSE; 
14562  2c84 3f1b          	clr	_Sec_bz
14563                     ; 2849            if(Pause_bz ==0)  boost_time_deal(); 
14565  2c86 3dd1          	tnz	_Pause_bz
14566  2c88 2603          	jrne	L1635
14569  2c8a cd0eea        	call	_boost_time_deal
14571  2c8d               L1635:
14572                     ; 2851            if(Pause_bz ==0)
14574  2c8d 3dd1          	tnz	_Pause_bz
14575  2c8f 2703          	jreq	L474
14576  2c91 cc2d8b        	jp	L3635
14577  2c94               L474:
14578                     ; 2853              for(i=0;i<4;i++)
14580  2c94 0f19          	clr	(OFST+0,sp)
14581  2c96               L5635:
14582                     ; 2855            	p  =&zone_1_level+i;
14584  2c96 7b19          	ld	a,(OFST+0,sp)
14585  2c98 ab94          	add	a,#_zone_1_level
14586  2c9a 5f            	clrw	x
14587  2c9b 97            	ld	xl,a
14588  2c9c 1f16          	ldw	(OFST-3,sp),x
14589                     ; 2856            	tz =&zone_1_timer+i;
14591  2c9e 7b19          	ld	a,(OFST+0,sp)
14592  2ca0 5f            	clrw	x
14593  2ca1 97            	ld	xl,a
14594  2ca2 58            	sllw	x
14595  2ca3 01            	rrwa	x,a
14596  2ca4 ab9a          	add	a,#_zone_1_timer
14597  2ca6 2401          	jrnc	L004
14598  2ca8 5c            	incw	x
14599  2ca9               L004:
14600  2ca9 5f            	clrw	x
14601  2caa 97            	ld	xl,a
14602  2cab 1f14          	ldw	(OFST-5,sp),x
14603                     ; 2857            	q  =&zone_1_pan+i;
14605  2cad 7b19          	ld	a,(OFST+0,sp)
14606  2caf ab68          	add	a,#_zone_1_pan
14607  2cb1 5f            	clrw	x
14608  2cb2 97            	ld	xl,a
14609  2cb3 1f0f          	ldw	(OFST-10,sp),x
14610                     ; 2858            	x  =&zone_1_nopan_time+i;
14612  2cb5 7b19          	ld	a,(OFST+0,sp)
14613  2cb7 ab6c          	add	a,#_zone_1_nopan_time
14614  2cb9 5f            	clrw	x
14615  2cba 97            	ld	xl,a
14616  2cbb 1f11          	ldw	(OFST-8,sp),x
14617                     ; 2859            	tw =&work_1_time+i;
14619  2cbd 7b19          	ld	a,(OFST+0,sp)
14620  2cbf 5f            	clrw	x
14621  2cc0 97            	ld	xl,a
14622  2cc1 58            	sllw	x
14623  2cc2 01            	rrwa	x,a
14624  2cc3 ab8a          	add	a,#_work_1_time
14625  2cc5 2401          	jrnc	L204
14626  2cc7 5c            	incw	x
14627  2cc8               L204:
14628  2cc8 5f            	clrw	x
14629  2cc9 97            	ld	xl,a
14630  2cca 1f09          	ldw	(OFST-16,sp),x
14631                     ; 2860            	y  =&time_level_1+i;
14633  2ccc 7b19          	ld	a,(OFST+0,sp)
14634  2cce abbf          	add	a,#_time_level_1
14635  2cd0 5f            	clrw	x
14636  2cd1 97            	ld	xl,a
14637  2cd2 1f02          	ldw	(OFST-23,sp),x
14638                     ; 2861            	b  =&boost_1_save+i;
14640  2cd4 7b19          	ld	a,(OFST+0,sp)
14641  2cd6 ab4c          	add	a,#_boost_1_save
14642  2cd8 5f            	clrw	x
14643  2cd9 97            	ld	xl,a
14644  2cda 1f06          	ldw	(OFST-19,sp),x
14645                     ; 2862            	tb =&boost_time_1+i;
14647  2cdc 7b19          	ld	a,(OFST+0,sp)
14648  2cde 5f            	clrw	x
14649  2cdf 97            	ld	xl,a
14650  2ce0 58            	sllw	x
14651  2ce1 01            	rrwa	x,a
14652  2ce2 ab3c          	add	a,#_boost_time_1
14653  2ce4 2401          	jrnc	L404
14654  2ce6 5c            	incw	x
14655  2ce7               L404:
14656  2ce7 5f            	clrw	x
14657  2ce8 97            	ld	xl,a
14658  2ce9 1f04          	ldw	(OFST-21,sp),x
14659                     ; 2863            	c  =&zone_1_nopan_wait +i;
14661  2ceb a610          	ld	a,#high(_zone_1_nopan_wait)
14662  2ced 97            	ld	xl,a
14663  2cee a610          	ld	a,#low(_zone_1_nopan_wait)
14664  2cf0 1b19          	add	a,(OFST+0,sp)
14665  2cf2 2401          	jrnc	L604
14666  2cf4 5c            	incw	x
14667  2cf5               L604:
14668  2cf5 02            	rlwa	x,a
14669  2cf6 1f0b          	ldw	(OFST-14,sp),x
14670  2cf8 01            	rrwa	x,a
14671                     ; 2865                 if((*x)>2)  
14673  2cf9 1e11          	ldw	x,(OFST-8,sp)
14674  2cfb f6            	ld	a,(x)
14675  2cfc a103          	cp	a,#3
14676  2cfe 254c          	jrult	L3735
14677                     ; 2867                    (*x)++;
14679  2d00 1e11          	ldw	x,(OFST-8,sp)
14680  2d02 7c            	inc	(x)
14681                     ; 2868                    if((*x) >=59) 
14683  2d03 1e11          	ldw	x,(OFST-8,sp)
14684  2d05 f6            	ld	a,(x)
14685  2d06 a13b          	cp	a,#59
14686  2d08 2542          	jrult	L3735
14687                     ; 2870                    	if(i==0)  {if(flex_L_bz ==0) {(*p) =0;Warm_status &=~Select_1_KEY;}}
14689  2d0a 0d19          	tnz	(OFST+0,sp)
14690  2d0c 260b          	jrne	L7735
14693  2d0e 3d44          	tnz	_flex_L_bz
14694  2d10 2607          	jrne	L7735
14697  2d12 1e16          	ldw	x,(OFST-3,sp)
14698  2d14 7f            	clr	(x)
14701  2d15 721100d6      	bres	_Warm_status,#0
14702  2d19               L7735:
14703                     ; 2871                    	if(i==1)  {if(flex_L_bz ==0) {(*p) =0;Warm_status &=~Select_2_KEY;}}
14705  2d19 7b19          	ld	a,(OFST+0,sp)
14706  2d1b a101          	cp	a,#1
14707  2d1d 260b          	jrne	L3045
14710  2d1f 3d44          	tnz	_flex_L_bz
14711  2d21 2607          	jrne	L3045
14714  2d23 1e16          	ldw	x,(OFST-3,sp)
14715  2d25 7f            	clr	(x)
14718  2d26 721300d6      	bres	_Warm_status,#1
14719  2d2a               L3045:
14720                     ; 2872                    	if(i==2)  {if(flex_R_bz ==0) {(*p) =0;Warm_status &=~Select_3_KEY;}}
14722  2d2a 7b19          	ld	a,(OFST+0,sp)
14723  2d2c a102          	cp	a,#2
14724  2d2e 260b          	jrne	L7045
14727  2d30 3d45          	tnz	_flex_R_bz
14728  2d32 2607          	jrne	L7045
14731  2d34 1e16          	ldw	x,(OFST-3,sp)
14732  2d36 7f            	clr	(x)
14735  2d37 721500d6      	bres	_Warm_status,#2
14736  2d3b               L7045:
14737                     ; 2873                    	if(i==3)  {if(flex_R_bz ==0) {(*p) =0;Warm_status &=~Select_4_KEY;}}
14739  2d3b 7b19          	ld	a,(OFST+0,sp)
14740  2d3d a103          	cp	a,#3
14741  2d3f 260b          	jrne	L3735
14744  2d41 3d45          	tnz	_flex_R_bz
14745  2d43 2607          	jrne	L3735
14748  2d45 1e16          	ldw	x,(OFST-3,sp)
14749  2d47 7f            	clr	(x)
14752  2d48 721700d6      	bres	_Warm_status,#3
14753  2d4c               L3735:
14754                     ; 2876                 if(*c) (*c)--;
14756  2d4c 1e0b          	ldw	x,(OFST-14,sp)
14757  2d4e 7d            	tnz	(x)
14758  2d4f 2703          	jreq	L7145
14761  2d51 1e0b          	ldw	x,(OFST-14,sp)
14762  2d53 7a            	dec	(x)
14763  2d54               L7145:
14764                     ; 2878 	      if((*p) ==0)  {(*tz) =0;(*q) =0;(*x) =0;(*tw) =0;(*tb) =0;(*y) =0;(*b)=0;}
14766  2d54 1e16          	ldw	x,(OFST-3,sp)
14767  2d56 7d            	tnz	(x)
14768  2d57 261d          	jrne	L1245
14771  2d59 1e14          	ldw	x,(OFST-5,sp)
14772  2d5b 905f          	clrw	y
14773  2d5d ff            	ldw	(x),y
14776  2d5e 1e0f          	ldw	x,(OFST-10,sp)
14777  2d60 7f            	clr	(x)
14780  2d61 1e11          	ldw	x,(OFST-8,sp)
14781  2d63 7f            	clr	(x)
14784  2d64 1e09          	ldw	x,(OFST-16,sp)
14785  2d66 905f          	clrw	y
14786  2d68 ff            	ldw	(x),y
14789  2d69 1e04          	ldw	x,(OFST-21,sp)
14790  2d6b 905f          	clrw	y
14791  2d6d ff            	ldw	(x),y
14794  2d6e 1e02          	ldw	x,(OFST-23,sp)
14795  2d70 7f            	clr	(x)
14798  2d71 1e06          	ldw	x,(OFST-19,sp)
14799  2d73 7f            	clr	(x)
14801  2d74 200a          	jra	L3245
14802  2d76               L1245:
14803                     ; 2879 	      else	(*tw)++;  
14805  2d76 1e09          	ldw	x,(OFST-16,sp)
14806  2d78 9093          	ldw	y,x
14807  2d7a fe            	ldw	x,(x)
14808  2d7b 1c0001        	addw	x,#1
14809  2d7e 90ff          	ldw	(y),x
14810  2d80               L3245:
14811                     ; 2853              for(i=0;i<4;i++)
14813  2d80 0c19          	inc	(OFST+0,sp)
14816  2d82 7b19          	ld	a,(OFST+0,sp)
14817  2d84 a104          	cp	a,#4
14818  2d86 2403          	jruge	L674
14819  2d88 cc2c96        	jp	L5635
14820  2d8b               L674:
14821  2d8b               L3635:
14822                     ; 2883 	 if((zone_1_level ==0)&&(bbq_L_bz))  bbq_L_bz =0;
14824  2d8b 3d94          	tnz	_zone_1_level
14825  2d8d 2606          	jrne	L5245
14827  2d8f 3d46          	tnz	_bbq_L_bz
14828  2d91 2702          	jreq	L5245
14831  2d93 3f46          	clr	_bbq_L_bz
14832  2d95               L5245:
14833                     ; 2884 	 if((zone_3_level ==0)&&(bbq_R_bz))  bbq_R_bz =0;
14835  2d95 3d96          	tnz	_zone_3_level
14836  2d97 2606          	jrne	L7245
14838  2d99 3d47          	tnz	_bbq_R_bz
14839  2d9b 2702          	jreq	L7245
14842  2d9d 3f47          	clr	_bbq_R_bz
14843  2d9f               L7245:
14844                     ; 2889 	 if((time_flash_count ==0)&&(Pause_bz ==0))
14846  2d9f 3d37          	tnz	_time_flash_count
14847  2da1 2624          	jrne	L1345
14849  2da3 3dd1          	tnz	_Pause_bz
14850  2da5 2620          	jrne	L1345
14851                     ; 2891 	 if(zone_1_timer ==0) timer_status &=~Select_1_KEY;                  
14853  2da7 be9a          	ldw	x,_zone_1_timer
14854  2da9 2604          	jrne	L3345
14857  2dab 72110036      	bres	_timer_status,#0
14858  2daf               L3345:
14859                     ; 2892 	 if(zone_2_timer ==0) timer_status &=~Select_2_KEY;
14861  2daf be9c          	ldw	x,_zone_2_timer
14862  2db1 2604          	jrne	L5345
14865  2db3 72130036      	bres	_timer_status,#1
14866  2db7               L5345:
14867                     ; 2893 	 if(zone_3_timer ==0) timer_status &=~Select_3_KEY;
14869  2db7 be9e          	ldw	x,_zone_3_timer
14870  2db9 2604          	jrne	L7345
14873  2dbb 72150036      	bres	_timer_status,#2
14874  2dbf               L7345:
14875                     ; 2894 	 if(zone_4_timer ==0) timer_status &=~Select_4_KEY;
14877  2dbf bea0          	ldw	x,_zone_4_timer
14878  2dc1 2604          	jrne	L1345
14881  2dc3 72170036      	bres	_timer_status,#3
14882  2dc7               L1345:
14883                     ; 2897 	 if(zone_1_level +zone_2_level +zone_3_level +zone_4_level)    	idle_count =60;   
14885  2dc7 b694          	ld	a,_zone_1_level
14886  2dc9 5f            	clrw	x
14887  2dca bb95          	add	a,_zone_2_level
14888  2dcc 2401          	jrnc	L014
14889  2dce 5c            	incw	x
14890  2dcf               L014:
14891  2dcf bb96          	add	a,_zone_3_level
14892  2dd1 2401          	jrnc	L214
14893  2dd3 5c            	incw	x
14894  2dd4               L214:
14895  2dd4 bb97          	add	a,_zone_4_level
14896  2dd6 2401          	jrnc	L414
14897  2dd8 5c            	incw	x
14898  2dd9               L414:
14899  2dd9 02            	rlwa	x,a
14900  2dda 5d            	tnzw	x
14901  2ddb 2704          	jreq	L3445
14904  2ddd 353c002c      	mov	_idle_count,#60
14905  2de1               L3445:
14906                     ; 2898 	 if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min)  idle_count =60; 
14908  2de1 b638          	ld	a,_flash_H_1_min
14909  2de3 5f            	clrw	x
14910  2de4 bb39          	add	a,_flash_H_2_min
14911  2de6 2401          	jrnc	L614
14912  2de8 5c            	incw	x
14913  2de9               L614:
14914  2de9 bb3a          	add	a,_flash_H_3_min
14915  2deb 2401          	jrnc	L024
14916  2ded 5c            	incw	x
14917  2dee               L024:
14918  2dee bb3b          	add	a,_flash_H_4_min
14919  2df0 2401          	jrnc	L224
14920  2df2 5c            	incw	x
14921  2df3               L224:
14922  2df3 02            	rlwa	x,a
14923  2df4 5d            	tnzw	x
14924  2df5 2704          	jreq	L5445
14927  2df7 353c002c      	mov	_idle_count,#60
14928  2dfb               L5445:
14929                     ; 2899 	 if(Err_1_data+Err_2_data +Err_3_data +Err_4_data) 	idle_count =60; 
14931  2dfb b678          	ld	a,_Err_1_data
14932  2dfd 5f            	clrw	x
14933  2dfe bb79          	add	a,_Err_2_data
14934  2e00 2401          	jrnc	L424
14935  2e02 5c            	incw	x
14936  2e03               L424:
14937  2e03 bb7a          	add	a,_Err_3_data
14938  2e05 2401          	jrnc	L624
14939  2e07 5c            	incw	x
14940  2e08               L624:
14941  2e08 bb7b          	add	a,_Err_4_data
14942  2e0a 2401          	jrnc	L034
14943  2e0c 5c            	incw	x
14944  2e0d               L034:
14945  2e0d 02            	rlwa	x,a
14946  2e0e 5d            	tnzw	x
14947  2e0f 2704          	jreq	L7445
14950  2e11 353c002c      	mov	_idle_count,#60
14951  2e15               L7445:
14952                     ; 2901          if(idle_count)
14954  2e15 3d2c          	tnz	_idle_count
14955  2e17 270d          	jreq	L1545
14956                     ; 2903            	idle_count--;
14958  2e19 3a2c          	dec	_idle_count
14959                     ; 2904            	if(idle_count ==0)       {buzzer_time = buz_500ms;Power_off_deal();} 
14961  2e1b 3d2c          	tnz	_idle_count
14962  2e1d 2607          	jrne	L1545
14965  2e1f 35140022      	mov	_buzzer_time,#20
14968  2e23 cd0861        	call	_Power_off_deal
14970  2e26               L1545:
14971                     ; 2907          if(buzzer_account) 
14973  2e26 3d23          	tnz	_buzzer_account
14974  2e28 270e          	jreq	L5545
14975                     ; 2909            	buzzer_account--;
14977  2e2a 3a23          	dec	_buzzer_account
14978                     ; 2910            	buzzer_time =buz_200ms;
14980  2e2c 35140022      	mov	_buzzer_time,#20
14981                     ; 2911            	if(buzzer_account ==50) buzzer_account =0;
14983  2e30 b623          	ld	a,_buzzer_account
14984  2e32 a132          	cp	a,#50
14985  2e34 2602          	jrne	L5545
14988  2e36 3f23          	clr	_buzzer_account
14989  2e38               L5545:
14990                     ; 2913          time_power_deal(); 		//140614 
14992  2e38 cd1020        	call	_time_power_deal
14994                     ; 2914          bbq_power_deal();		//171111
14996  2e3b cd2015        	call	_bbq_power_deal
14998                     ; 2916 	for(i=0;i<4;i++)
15000  2e3e 0f19          	clr	(OFST+0,sp)
15001  2e40               L1645:
15002                     ; 2918 	  	p =&tmain_1 +i;
15004  2e40 7b19          	ld	a,(OFST+0,sp)
15005  2e42 abb7          	add	a,#_tmain_1
15006  2e44 5f            	clrw	x
15007  2e45 97            	ld	xl,a
15008  2e46 1f16          	ldw	(OFST-3,sp),x
15009                     ; 2919 	  	q =&flash_H_1_min +i;
15011  2e48 7b19          	ld	a,(OFST+0,sp)
15012  2e4a ab38          	add	a,#_flash_H_1_min
15013  2e4c 5f            	clrw	x
15014  2e4d 97            	ld	xl,a
15015  2e4e 1f0f          	ldw	(OFST-10,sp),x
15016                     ; 2920 	  	if((*p) >CON_TMAIN_45)  (*q)=1;
15018  2e50 1e16          	ldw	x,(OFST-3,sp)
15019  2e52 f6            	ld	a,(x)
15020  2e53 a142          	cp	a,#66
15021  2e55 2507          	jrult	L7645
15024  2e57 1e0f          	ldw	x,(OFST-10,sp)
15025  2e59 a601          	ld	a,#1
15026  2e5b f7            	ld	(x),a
15028  2e5c 2003          	jra	L1745
15029  2e5e               L7645:
15030                     ; 2921 		else (*q) =0; 
15032  2e5e 1e0f          	ldw	x,(OFST-10,sp)
15033  2e60 7f            	clr	(x)
15034  2e61               L1745:
15035                     ; 2916 	for(i=0;i<4;i++)
15037  2e61 0c19          	inc	(OFST+0,sp)
15040  2e63 7b19          	ld	a,(OFST+0,sp)
15041  2e65 a104          	cp	a,#4
15042  2e67 25d7          	jrult	L1645
15043                     ; 2923 	  if(fan_count) 
15045  2e69 3dca          	tnz	_fan_count
15046  2e6b 2708          	jreq	L3745
15047                     ; 2925 	  	fan_count--;
15049  2e6d 3aca          	dec	_fan_count
15050                     ; 2926           	if(fan_count ==0) fan_status =0;//FAN_OFF;   
15052  2e6f 3dca          	tnz	_fan_count
15053  2e71 2602          	jrne	L3745
15056  2e73 3fcb          	clr	_fan_status
15057  2e75               L3745:
15058                     ; 2929           if(sys_adj_secjs) sys_adj_secjs--;            
15060  2e75 3dce          	tnz	_sys_adj_secjs
15061  2e77 2702          	jreq	L7745
15064  2e79 3ace          	dec	_sys_adj_secjs
15065  2e7b               L7745:
15066                     ; 2930           if(sys_adj_secjs ==0)	
15068  2e7b 3dce          	tnz	_sys_adj_secjs
15069  2e7d 260f          	jrne	L7535
15070                     ; 2932           	sys_adj_status =0; 
15072  2e7f 3fcf          	clr	_sys_adj_status
15073                     ; 2933                 if((*((PointerAttr u8*) User_eeprom_address_1)) !=sys_pow_status)	Write_Data_to_EEPROM(sys_pow_status); 
15075  2e81 bc004051      	ldf	a,16465
15076  2e85 b1cd          	cp	a,_sys_pow_status
15077  2e87 2705          	jreq	L7535
15080  2e89 b6cd          	ld	a,_sys_pow_status
15081  2e8b cd0000        	call	_Write_Data_to_EEPROM
15083  2e8e               L7535:
15084                     ; 2940         if(Min_bz ==TRUE)
15086  2e8e b61c          	ld	a,_Min_bz
15087  2e90 a101          	cp	a,#1
15088  2e92 2703          	jreq	L005
15089  2e94 cc2fb8        	jp	L5055
15090  2e97               L005:
15091                     ; 2942           Min_bz =FALSE;
15093  2e97 3f1c          	clr	_Min_bz
15094                     ; 2943           apt_min_reset++;
15096  2e99 725c0024      	inc	_apt_min_reset
15097                     ; 2944 	  if(apt_min_reset >=20) {apt_min_reset =0;APT8L16Init_H();APT8L16Init_L();}
15099  2e9d c60024        	ld	a,_apt_min_reset
15100  2ea0 a114          	cp	a,#20
15101  2ea2 250a          	jrult	L7055
15104  2ea4 725f0024      	clr	_apt_min_reset
15107  2ea8 cd0a68        	call	_APT8L16Init_H
15111  2eab cd0b15        	call	_APT8L16Init_L
15113  2eae               L7055:
15114                     ; 2946 	   if((general_timer)&&(Pause_bz ==0))
15116  2eae 3d98          	tnz	_general_timer
15117  2eb0 2712          	jreq	L1155
15119  2eb2 3dd1          	tnz	_Pause_bz
15120  2eb4 260e          	jrne	L1155
15121                     ; 2948        		general_timer--;	
15123  2eb6 3a98          	dec	_general_timer
15124                     ; 2949        		if(general_timer ==0)   {buzzer_time = buz_200ms; buzzer_account =29;}
15126  2eb8 3d98          	tnz	_general_timer
15127  2eba 2608          	jrne	L1155
15130  2ebc 35140022      	mov	_buzzer_time,#20
15133  2ec0 351d0023      	mov	_buzzer_account,#29
15134  2ec4               L1155:
15135                     ; 2951        	   for(i=0;i<4;i++)
15137  2ec4 0f19          	clr	(OFST+0,sp)
15138  2ec6               L5155:
15139                     ; 2953        	   	tz =&zone_1_timer+i;
15141  2ec6 7b19          	ld	a,(OFST+0,sp)
15142  2ec8 5f            	clrw	x
15143  2ec9 97            	ld	xl,a
15144  2eca 58            	sllw	x
15145  2ecb 01            	rrwa	x,a
15146  2ecc ab9a          	add	a,#_zone_1_timer
15147  2ece 2401          	jrnc	L234
15148  2ed0 5c            	incw	x
15149  2ed1               L234:
15150  2ed1 5f            	clrw	x
15151  2ed2 97            	ld	xl,a
15152  2ed3 1f14          	ldw	(OFST-5,sp),x
15153                     ; 2954        	   	p  =&zone_1_level+i;
15155  2ed5 7b19          	ld	a,(OFST+0,sp)
15156  2ed7 ab94          	add	a,#_zone_1_level
15157  2ed9 5f            	clrw	x
15158  2eda 97            	ld	xl,a
15159  2edb 1f16          	ldw	(OFST-3,sp),x
15160                     ; 2955     	   	if(*tz) 
15162  2edd 1e14          	ldw	x,(OFST-5,sp)
15163  2edf e601          	ld	a,(1,x)
15164  2ee1 fa            	or	a,(x)
15165  2ee2 2760          	jreq	L3255
15166                     ; 2957        		(*tz)--;
15168  2ee4 1e14          	ldw	x,(OFST-5,sp)
15169  2ee6 9093          	ldw	y,x
15170  2ee8 fe            	ldw	x,(x)
15171  2ee9 1d0001        	subw	x,#1
15172  2eec 90ff          	ldw	(y),x
15173                     ; 2958        		if((*tz) ==0)       	
15175  2eee 1e14          	ldw	x,(OFST-5,sp)
15176  2ef0 e601          	ld	a,(1,x)
15177  2ef2 fa            	or	a,(x)
15178  2ef3 265b          	jrne	L7355
15179                     ; 2960        		  	buzzer_time = buz_200ms;
15181  2ef5 35140022      	mov	_buzzer_time,#20
15182                     ; 2961        		  	(*p) =0;
15184  2ef9 1e16          	ldw	x,(OFST-3,sp)
15185  2efb 7f            	clr	(x)
15186                     ; 2963        		  	if((i==0)&&(Warm_status &Select_1_KEY))  {Warm_1_timer =0;Warm_status &=~Select_1_KEY;}
15188  2efc 0d19          	tnz	(OFST+0,sp)
15189  2efe 260c          	jrne	L7255
15191  2f00 b6d6          	ld	a,_Warm_status
15192  2f02 a501          	bcp	a,#1
15193  2f04 2706          	jreq	L7255
15196  2f06 3fd7          	clr	_Warm_1_timer
15199  2f08 721100d6      	bres	_Warm_status,#0
15200  2f0c               L7255:
15201                     ; 2964        		   	if((i==1)&&(Warm_status &Select_2_KEY))  {Warm_2_timer =0;Warm_status &=~Select_2_KEY;}
15203  2f0c 7b19          	ld	a,(OFST+0,sp)
15204  2f0e a101          	cp	a,#1
15205  2f10 260c          	jrne	L1355
15207  2f12 b6d6          	ld	a,_Warm_status
15208  2f14 a502          	bcp	a,#2
15209  2f16 2706          	jreq	L1355
15212  2f18 3fd8          	clr	_Warm_2_timer
15215  2f1a 721300d6      	bres	_Warm_status,#1
15216  2f1e               L1355:
15217                     ; 2965        		   	if((i==2)&&(Warm_status &Select_3_KEY))  {Warm_3_timer =0;Warm_status &=~Select_3_KEY;}
15219  2f1e 7b19          	ld	a,(OFST+0,sp)
15220  2f20 a102          	cp	a,#2
15221  2f22 260c          	jrne	L3355
15223  2f24 b6d6          	ld	a,_Warm_status
15224  2f26 a504          	bcp	a,#4
15225  2f28 2706          	jreq	L3355
15228  2f2a 3fd9          	clr	_Warm_3_timer
15231  2f2c 721500d6      	bres	_Warm_status,#2
15232  2f30               L3355:
15233                     ; 2966        		   	if((i==3)&&(Warm_status &Select_4_KEY))  {Warm_4_timer =0;Warm_status &=~Select_4_KEY;}
15235  2f30 7b19          	ld	a,(OFST+0,sp)
15236  2f32 a103          	cp	a,#3
15237  2f34 261a          	jrne	L7355
15239  2f36 b6d6          	ld	a,_Warm_status
15240  2f38 a508          	bcp	a,#8
15241  2f3a 2714          	jreq	L7355
15244  2f3c 3fda          	clr	_Warm_4_timer
15247  2f3e 721700d6      	bres	_Warm_status,#3
15248  2f42 200c          	jra	L7355
15249  2f44               L3255:
15250                     ; 2969        	   	else if(*p) (*tz)= 120;		//no timer key,canceal timer function ,give 2h setting
15252  2f44 1e16          	ldw	x,(OFST-3,sp)
15253  2f46 7d            	tnz	(x)
15254  2f47 2707          	jreq	L7355
15257  2f49 1e14          	ldw	x,(OFST-5,sp)
15258  2f4b 90ae0078      	ldw	y,#120
15259  2f4f ff            	ldw	(x),y
15260  2f50               L7355:
15261                     ; 2951        	   for(i=0;i<4;i++)
15263  2f50 0c19          	inc	(OFST+0,sp)
15266  2f52 7b19          	ld	a,(OFST+0,sp)
15267  2f54 a104          	cp	a,#4
15268  2f56 2403          	jruge	L205
15269  2f58 cc2ec6        	jp	L5155
15270  2f5b               L205:
15271                     ; 2971        	   if(Warm_1_timer)  {Warm_1_timer--;if(Warm_1_timer ==0) {Warm_status &=~Select_1_KEY;zone_1_level =0;buzzer_time = buz_200ms;}}	
15273  2f5b 3dd7          	tnz	_Warm_1_timer
15274  2f5d 2710          	jreq	L3455
15277  2f5f 3ad7          	dec	_Warm_1_timer
15280  2f61 3dd7          	tnz	_Warm_1_timer
15281  2f63 260a          	jrne	L3455
15284  2f65 721100d6      	bres	_Warm_status,#0
15287  2f69 3f94          	clr	_zone_1_level
15290  2f6b 35140022      	mov	_buzzer_time,#20
15291  2f6f               L3455:
15292                     ; 2972        	   if(Warm_2_timer)  {Warm_2_timer--;if(Warm_2_timer ==0) {Warm_status &=~Select_2_KEY;zone_2_level =0;buzzer_time = buz_200ms;}}	 
15294  2f6f 3dd8          	tnz	_Warm_2_timer
15295  2f71 2710          	jreq	L7455
15298  2f73 3ad8          	dec	_Warm_2_timer
15301  2f75 3dd8          	tnz	_Warm_2_timer
15302  2f77 260a          	jrne	L7455
15305  2f79 721300d6      	bres	_Warm_status,#1
15308  2f7d 3f95          	clr	_zone_2_level
15311  2f7f 35140022      	mov	_buzzer_time,#20
15312  2f83               L7455:
15313                     ; 2973        	   if(Warm_3_timer)  {Warm_3_timer--;if(Warm_3_timer ==0) {Warm_status &=~Select_3_KEY;zone_3_level =0;buzzer_time = buz_200ms;}}	 
15315  2f83 3dd9          	tnz	_Warm_3_timer
15316  2f85 2710          	jreq	L3555
15319  2f87 3ad9          	dec	_Warm_3_timer
15322  2f89 3dd9          	tnz	_Warm_3_timer
15323  2f8b 260a          	jrne	L3555
15326  2f8d 721500d6      	bres	_Warm_status,#2
15329  2f91 3f96          	clr	_zone_3_level
15332  2f93 35140022      	mov	_buzzer_time,#20
15333  2f97               L3555:
15334                     ; 2974        	   if(Warm_4_timer)  {Warm_4_timer--;if(Warm_4_timer ==0) {Warm_status &=~Select_4_KEY;zone_4_level =0;buzzer_time = buz_200ms;}}
15336  2f97 3dda          	tnz	_Warm_4_timer
15337  2f99 2710          	jreq	L7555
15340  2f9b 3ada          	dec	_Warm_4_timer
15343  2f9d 3dda          	tnz	_Warm_4_timer
15344  2f9f 260a          	jrne	L7555
15347  2fa1 721700d6      	bres	_Warm_status,#3
15350  2fa5 3f97          	clr	_zone_4_level
15353  2fa7 35140022      	mov	_buzzer_time,#20
15354  2fab               L7555:
15355                     ; 2975        	   if(pause_x_timer) 
15357  2fab 3d99          	tnz	_pause_x_timer
15358  2fad 2709          	jreq	L5055
15359                     ; 2977        	     	pause_x_timer--;
15361  2faf 3a99          	dec	_pause_x_timer
15362                     ; 2978        	     	if(pause_x_timer ==0)  Power_off_deal();
15364  2fb1 3d99          	tnz	_pause_x_timer
15365  2fb3 2603          	jrne	L5055
15368  2fb5 cd0861        	call	_Power_off_deal
15370  2fb8               L5055:
15371                     ; 2983     IWDG_ReloadCounter();    /* Refresh IWDG */   
15373  2fb8 cd0000        	call	_IWDG_ReloadCounter
15376  2fbb aca922a9      	jpf	L7644
17227                     	xdef	_main
17228                     	xdef	_Pow_adj_function_key
17229                     	xdef	_bbq_power_deal
17230                     	xdef	_Pause_function_key
17231                     	xdef	_Warm_function_deal
17232                     	xdef	_Warm_func_x_set
17233                     	xdef	_slide_x_deal
17234                     	xdef	_slide_x_setting
17235                     	xdef	_slide_x_timer
17236                     	xdef	_Sdec_key_deal
17237                     	xdef	_dec_key_deal
17238                     	xdef	_Sinc_key_deal
17239                     	xdef	_inc_key_deal
17240                     	xdef	_dec_x_timer
17241                     	xdef	_dec_x_key_level
17242                     	xdef	_inc_x_timer
17243                     	xdef	_inc_x_key_level
17244                     	xdef	_key_x_deal
17245                     	xdef	_timer_key_deal
17246                     	xdef	_ktimer_x_deal
17247                     	xdef	_lock_key_deal
17248                     	xdef	_flex_R_key_deal
17249                     	xdef	_flex_L_key_deal
17250                     	xdef	_bbq_key_deal
17251                     	xdef	_cancel_boost_x_deal
17252                     	xdef	_boost_key_deal
17253                     	xdef	_boost_x_deal
17254                     	xdef	_on_off_key_deal
17255                     	xdef	_speed_up
17256                     	xdef	_inc_dec_deal
17257                     	xdef	_short_key_buzzer
17258                     	xdef	_limit_power
17259                     	xdef	_time_power_deal
17260                     	xdef	_Zone_Small_Set
17261                     	xdef	_Zone_Big_Set
17262                     	xdef	_time_s_power
17263                     	xdef	_time_b_power
17264                     	xdef	_boost_time_deal
17265                     	xdef	_boost_x_time
17266                     	xdef	_key_next_deal
17267                     	xdef	_key_scan_I2C
17268                     	xdef	_APT8L16Init_L
17269                     	xdef	_APT8L16Init_H
17270                     	xdef	_ON_disp_zone_x
17271                     	xdef	_Display_decode
17272                     	xdef	_calculate_min
17273                     	xdef	_minium_value
17274                     	xdef	_Power_off_deal
17275                     	xdef	_comm_deal
17276                     	xdef	_syn_deal
17277                     	xdef	_zone_x_t_status
17278                     	xdef	_set_off_power
17279                     	xdef	_comm_get_deal
17280                     	xdef	_comm_asm_deal
17281                     	xdef	_flex_deal
17282                     	xdef	_comm_vertify
17283                     	xdef	_Write_Data_to_EEPROM
17284                     	xdef	_arr_1500
17285                     	xdef	_arr_2000
17286                     	xdef	_arr_flex_s
17287                     	xdef	_arr_flex_b
17288                     	xdef	_arr_T_Sens_L
17289                     	xdef	_arr_APTRegData_L
17290                     	xdef	_arr_T_Sens_H
17291                     	xdef	_arr_APTRegData_H
17292                     	xdef	_arr_flex_pwm
17293                     	xdef	_arr_4_pow
17294                     	xdef	_arr_2_pow
17295                     	xdef	_arr_3_pow
17296                     	xdef	_arr_1_pow
17297                     	xref	_APTTouchWrOneData
17298                     	xref	_APTTouchRdOneData
17299                     	xref	_SM1668_SEND_COMMAND
17300                     	xref	_SM1668_SENT_DATA
17301                     	xref	_zone_x_cur_no_set
17302                     	xdef	_apt_min_reset
17303                     	xdef	_erp_pwm
17304                     	xdef	_arr_tiao_180_pwm
17305                     	xdef	_arr_tiao_on
17306                     	xdef	_zone_4_nopan_wait
17307                     	xdef	_zone_3_nopan_wait
17308                     	xdef	_zone_2_nopan_wait
17309                     	xdef	_zone_1_nopan_wait
17310                     	xdef	_boost_4_count
17311                     	xdef	_boost_3_count
17312                     	xdef	_boost_2_count
17313                     	xdef	_boost_1_count
17314                     	xdef	_igbt_high_4
17315                     	xdef	_igbt_high_3
17316                     	xdef	_igbt_high_2
17317                     	xdef	_igbt_high_1
17318                     	xdef	_oil_high_4
17319                     	xdef	_oil_high_3
17320                     	xdef	_oil_high_2
17321                     	xdef	_oil_high_1
17322                     	xdef	_tiao_on_4
17323                     	xdef	_tiao_on_3
17324                     	xdef	_tiao_on_2
17325                     	xdef	_tiao_on_1
17326                     	xdef	_Warm_4_timer
17327                     	xdef	_Warm_3_timer
17328                     	xdef	_Warm_2_timer
17329                     	xdef	_Warm_1_timer
17330                     	xdef	_Warm_status
17331                     	xdef	_Pause_save_timer_4
17332                     	xdef	_Pause_save_timer_3
17333                     	xdef	_Pause_save_timer_2
17334                     	xdef	_Pause_save_timer_1
17335                     	xdef	_Pause_bz
17336                     	xdef	_sys_disp_status
17337                     	xdef	_sys_adj_status
17338                     	xdef	_sys_adj_secjs
17339                     	xdef	_sys_pow_status
17340                     	xdef	_timer_list
17341                     	xdef	_fan_status
17342                     	xdef	_fan_count
17343                     	xdef	_comm_list
17344                     	xdef	_comm_status
17345                     	xdef	_com_count
17346                     	xdef	_pwm_temp_4
17347                     	xdef	_pwm_temp_3
17348                     	xdef	_pwm_temp_2
17349                     	xdef	_pwm_temp_1
17350                     	xdef	_time_level_4
17351                     	xdef	_time_level_3
17352                     	xdef	_time_level_2
17353                     	xdef	_time_level_1
17354                     	xdef	_ppg_4
17355                     	xdef	_ppg_3
17356                     	xdef	_ppg_2
17357                     	xdef	_ppg_1
17358                     	xdef	_tmain_4
17359                     	xdef	_tmain_3
17360                     	xdef	_tmain_2
17361                     	xdef	_tmain_1
17362                     	xdef	_tigbt_4
17363                     	xdef	_tigbt_3
17364                     	xdef	_tigbt_2
17365                     	xdef	_tigbt_1
17366                     	xdef	_cur_4
17367                     	xdef	_cur_3
17368                     	xdef	_cur_2
17369                     	xdef	_cur_1
17370                     	xdef	_vol_4
17371                     	xdef	_vol_3
17372                     	xdef	_vol_2
17373                     	xdef	_vol_1
17374                     	xdef	_match_ok
17375                     	xdef	_I2C_GET_DATA
17376                     	xdef	_I2C_GET_DATA_L
17377                     	xdef	_I2C_GET_DATA_H
17378                     	xdef	_zone_4_timer
17379                     	xdef	_zone_3_timer
17380                     	xdef	_zone_2_timer
17381                     	xdef	_zone_1_timer
17382                     	xdef	_pause_x_timer
17383                     	xdef	_general_timer
17384                     	xdef	_zone_4_level
17385                     	xdef	_zone_3_level
17386                     	xdef	_zone_2_level
17387                     	xdef	_zone_1_level
17388                     	xdef	_limit_time
17389                     	xdef	_work_4_time
17390                     	xdef	_work_3_time
17391                     	xdef	_work_2_time
17392                     	xdef	_work_1_time
17393                     	xdef	_key_err_account
17394                     	xdef	_key_account
17395                     	xdef	_key_ok_bit
17396                     	xdef	_key_scan_value
17397                     	xdef	_boost_status
17398                     	xdef	_Err_4_count
17399                     	xdef	_Err_3_count
17400                     	xdef	_Err_2_count
17401                     	xdef	_Err_1_count
17402                     	xdef	_Err_4_data
17403                     	xdef	_Err_3_data
17404                     	xdef	_Err_2_data
17405                     	xdef	_Err_1_data
17406                     	xdef	_Get_cur_no
17407                     	xdef	_Get_ppg
17408                     	xdef	_Get_tmain
17409                     	xdef	_Get_tigbt
17410                     	xdef	_Get_cur
17411                     	xdef	_Get_vol
17412                     	xdef	_Get_data
17413                     	xdef	_Get_addr
17414                     	xdef	_zone_4_nopan_time
17415                     	xdef	_zone_3_nopan_time
17416                     	xdef	_zone_2_nopan_time
17417                     	xdef	_zone_1_nopan_time
17418                     	xdef	_zone_4_pan
17419                     	xdef	_zone_3_pan
17420                     	xdef	_zone_2_pan
17421                     	xdef	_zone_1_pan
17422                     	xdef	_debug_list
17423                     	xdef	_disp_debug2
17424                     	xdef	_disp_debug1
17425                     	xdef	_Comm_step
17426                     	xdef	_arr_default_timer
17427                     	xdef	_boost_4_save
17428                     	xdef	_boost_3_save
17429                     	xdef	_boost_2_save
17430                     	xdef	_boost_1_save
17431                     	xdef	_bbq_R_time
17432                     	xdef	_bbq_L_time
17433                     	xdef	_bbq_R_bz
17434                     	xdef	_bbq_L_bz
17435                     	xdef	_flex_R_bz
17436                     	xdef	_flex_L_bz
17437                     	xdef	_boost_time_4
17438                     	xdef	_boost_time_3
17439                     	xdef	_boost_time_2
17440                     	xdef	_boost_time_1
17441                     	xdef	_flash_H_4_min
17442                     	xdef	_flash_H_3_min
17443                     	xdef	_flash_H_2_min
17444                     	xdef	_flash_H_1_min
17445                     	xdef	_time_flash_count
17446                     	xdef	_timer_status
17447                     	xdef	_key_zone
17448                     	xdef	_count_4_key
17449                     	xdef	_count_3_key
17450                     	xdef	_count_2_key
17451                     	xdef	_count_1_key
17452                     	xdef	_limit_count
17453                     	xdef	_change_count
17454                     	xdef	_cmd_relay_wait
17455                     	xdef	_zone_flash_count
17456                     	xdef	_idle_count
17457                     	xdef	_key_initial_count
17458                     	xdef	_Disp_buf
17459                     	xdef	_buzzer_account
17460                     	xdef	_buzzer_time
17461                     	xdef	_lock_flash_accout
17462                     	xdef	_lock_bz
17463                     	xdef	_Power_on_bz
17464                     	xdef	_Prepare_data_bz
17465                     	xdef	_Time_dot_bz
17466                     	xdef	_Min_bz
17467                     	xdef	_Sec_bz
17468                     	xdef	_timer_precise_bz
17469                     	switch	.ubsct
17470  0000               _min_counter:
17471  0000 00            	ds.b	1
17472                     	xdef	_min_counter
17473  0001               _sec_counter:
17474  0001 00            	ds.b	1
17475                     	xdef	_sec_counter
17476  0002               _ms10_counter:
17477  0002 00            	ds.b	1
17478                     	xdef	_ms10_counter
17479                     	xdef	_Flash_500ms_bz
17480                     	xdef	_Ms10_bz7
17481                     	xdef	_Ms10_bz6
17482                     	xdef	_Ms10_bz5
17483                     	xdef	_Ms10_bz4
17484                     	xdef	_Ms10_bz3
17485                     	xdef	_Ms10_bz2
17486                     	xdef	_Ms10_bz1
17487                     	xdef	_relay_delay_bz
17488                     	xdef	_Get_word_4
17489                     	xdef	_Get_word_3
17490                     	xdef	_Get_word_2
17491                     	xdef	_Get_word_1
17492                     	xdef	_max_pwm
17493                     	xdef	_cur_no
17494                     	xdef	_syn_delay
17495                     	xdef	_Add_Status
17496                     	xdef	_bit_comm
17497                     	xdef	_SW_disp
17498                     	xref	_IWDG_Enable
17499                     	xref	_IWDG_ReloadCounter
17500                     	xref	_IWDG_SetReload
17501                     	xref	_IWDG_SetPrescaler
17502                     	xref	_IWDG_WriteAccessCmd
17522                     	xref	c_lcmp
17523                     	xref	c_ltor
17524                     	xref	c_lzmp
17525                     	xref	c_lgor
17526                     	xref	c_lglsh
17527                     	xref	c_rtol
17528                     	xref	c_uitolx
17529                     	end
