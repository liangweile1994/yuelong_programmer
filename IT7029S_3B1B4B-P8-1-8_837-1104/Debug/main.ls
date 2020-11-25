   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _bit_comm:
   6  0000 00000000      	dc.l	0
   7  0004               _Add_Status:
   8  0004 00            	dc.b	0
   9  0005               _syn_delay:
  10  0005 04            	dc.b	4
  11  0006               _cur_no:
  12  0006 38            	dc.b	56
  13  0007               _max_pwm:
  14  0007 0a            	dc.b	10
  15  0008               _Get_word_1:
  16  0008 0000          	dc.w	0
  17  000a               _Get_word_2:
  18  000a 0000          	dc.w	0
  19  000c               _Get_word_3:
  20  000c 0000          	dc.w	0
  21  000e               _Get_word_4:
  22  000e 0000          	dc.w	0
  23  0010               _relay_delay_bz:
  24  0010 00            	dc.b	0
  25  0011               _Ms10_bz1:
  26  0011 00            	dc.b	0
  27  0012               _Ms10_bz2:
  28  0012 00            	dc.b	0
  29  0013               _Ms10_bz3:
  30  0013 00            	dc.b	0
  31  0014               _Ms10_bz4:
  32  0014 00            	dc.b	0
  33  0015               _Ms10_bz5:
  34  0015 00            	dc.b	0
  35  0016               _Ms10_bz6:
  36  0016 00            	dc.b	0
  37  0017               _Ms10_bz7:
  38  0017 00            	dc.b	0
  39  0018               _Flash_500ms_bz:
  40  0018 00            	dc.b	0
  41  0019               _timer_precise_bz:
  42  0019 00            	dc.b	0
  43  001a               _Sec_bz:
  44  001a 00            	dc.b	0
  45  001b               _Min_bz:
  46  001b 00            	dc.b	0
  47  001c               _Time_dot_bz:
  48  001c 00            	dc.b	0
  49  001d               _sec_LockFlag:
  50  001d 00            	dc.b	0
  51  001e               __10ms_cnt:
  52  001e 00            	dc.b	0
  53                     	switch	.data
  54  0000               _timer1_1min_cnt:
  55  0000 00            	dc.b	0
  56  0001               _timer1_min_flg:
  57  0001 00            	dc.b	0
  58  0002               _timer2_1min_cnt:
  59  0002 00            	dc.b	0
  60  0003               _timer2_min_flg:
  61  0003 00            	dc.b	0
  62  0004               _timer3_1min_cnt:
  63  0004 00            	dc.b	0
  64  0005               _timer3_min_flg:
  65  0005 00            	dc.b	0
  66  0006               _timer4_1min_cnt:
  67  0006 00            	dc.b	0
  68  0007               _timer4_min_flg:
  69  0007 00            	dc.b	0
  70                     	bsct
  71  001f               _Prepare_data_bz:
  72  001f 00            	dc.b	0
  73  0020               _Power_on_bz:
  74  0020 00            	dc.b	0
  75  0021               _on1_bz:
  76  0021 00            	dc.b	0
  77  0022               _on2_bz:
  78  0022 00            	dc.b	0
  79  0023               _on3_bz:
  80  0023 00            	dc.b	0
  81  0024               _on4_bz:
  82  0024 00            	dc.b	0
  83  0025               _lock_bz:
  84  0025 00            	dc.b	0
  85  0026               _lock_flash_accout:
  86  0026 00            	dc.b	0
  87  0027               _buzzer_time:
  88  0027 00            	dc.b	0
  89  0028               _buzzer_account:
  90  0028 00            	dc.b	0
  91                     	switch	.data
  92  0008               _buzzer_200ms_times:
  93  0008 00            	dc.b	0
  94  0009               _buzzer_cnt_200ms:
  95  0009 00            	dc.b	0
  96  000a               _buzzer_2s_times:
  97  000a 00            	dc.b	0
  98  000b               _buzzer_cnt_2s:
  99  000b 00            	dc.b	0
 100  000c               _buzzer_5s_times:
 101  000c 00            	dc.b	0
 102  000d               _buzzer_cnt_5s:
 103  000d 0000          	dc.w	0
 104                     	bsct
 105  0029               _Disp_buf:
 106  0029 00            	dc.b	0
 107  002a 00            	dc.b	0
 108  002b 00            	dc.b	0
 109  002c 00            	dc.b	0
 110  002d 00            	dc.b	0
 111  002e 00            	dc.b	0
 112  002f 00            	dc.b	0
 113  0030 00            	dc.b	0
 114  0031 00            	dc.b	0
 115  0032 00            	dc.b	0
 116  0033 00            	dc.b	0
 117  0034 00            	dc.b	0
 118  0035 00            	dc.b	0
 119  0036 00            	dc.b	0
 120  0037 00            	dc.b	0
 121  0038 00            	dc.b	0
 122                     	switch	.data
 123  000f               _version_dis_cnt:
 124  000f 1e            	dc.b	30
 125  0010               _lock_dis_cnt:
 126  0010 00            	dc.b	0
 127                     	bsct
 128  0039               _key_initial_count:
 129  0039 fa            	dc.b	250
 130  003a               _idle_count:
 131  003a 00            	dc.b	0
 132  003b               _zone_flash_count1:
 133  003b 00            	dc.b	0
 134  003c               _zone_flash_count2:
 135  003c 00            	dc.b	0
 136  003d               _zone_flash_count3:
 137  003d 00            	dc.b	0
 138  003e               _zone_flash_count4:
 139  003e 00            	dc.b	0
 140  003f               _cmd_relay_wait:
 141  003f c8            	dc.b	200
 142  0040               _change_count:
 143  0040 00            	dc.b	0
 144  0041               _count_1_key:
 145  0041 00            	dc.b	0
 146  0042               _count_2_key:
 147  0042 00            	dc.b	0
 148  0043               _count_3_key:
 149  0043 00            	dc.b	0
 150  0044               _count_4_key:
 151  0044 00            	dc.b	0
 152  0045               _zone1_step:
 153  0045 00            	dc.b	0
 154  0046               _zone2_step:
 155  0046 00            	dc.b	0
 156  0047               _zone3_step:
 157  0047 00            	dc.b	0
 158  0048               _zone4_step:
 159  0048 00            	dc.b	0
 160  0049               _timer_status:
 161  0049 00            	dc.b	0
 162  004a               _time_flash_count1:
 163  004a 00            	dc.b	0
 164  004b               _time_flash_count2:
 165  004b 00            	dc.b	0
 166  004c               _time_flash_count3:
 167  004c 00            	dc.b	0
 168  004d               _time_flash_count4:
 169  004d 00            	dc.b	0
 170  004e               _flash_H_1_min:
 171  004e 00            	dc.b	0
 172  004f               _flash_H_2_min:
 173  004f 00            	dc.b	0
 174  0050               _flash_H_3_min:
 175  0050 00            	dc.b	0
 176  0051               _flash_H_4_min:
 177  0051 00            	dc.b	0
 178  0052               _boost_time_1:
 179  0052 0000          	dc.w	0
 180  0054               _boost_time_2:
 181  0054 0000          	dc.w	0
 182  0056               _boost_time_3:
 183  0056 0000          	dc.w	0
 184  0058               _boost_time_4:
 185  0058 0000          	dc.w	0
 186  005a               _auto_time_1:
 187  005a 0000          	dc.w	0
 188  005c               _auto_time_2:
 189  005c 0000          	dc.w	0
 190  005e               _auto_time_3:
 191  005e 0000          	dc.w	0
 192  0060               _auto_time_4:
 193  0060 0000          	dc.w	0
 194  0062               _auto_limit_pow_1:
 195  0062 00            	dc.b	0
 196  0063               _auto_limit_pow_2:
 197  0063 00            	dc.b	0
 198  0064               _auto_limit_pow_3:
 199  0064 00            	dc.b	0
 200  0065               _auto_limit_pow_4:
 201  0065 00            	dc.b	0
 202  0066               _flex_L_bz:
 203  0066 00            	dc.b	0
 204  0067               _flex_R_bz:
 205  0067 00            	dc.b	0
 206  0068               _bbq_L_bz:
 207  0068 00            	dc.b	0
 208  0069               _bbq_R_bz:
 209  0069 00            	dc.b	0
 210  006a               _bbq_L_time:
 211  006a 0000          	dc.w	0
 212  006c               _bbq_R_time:
 213  006c 0000          	dc.w	0
 214  006e               _boost_1_save:
 215  006e 00            	dc.b	0
 216  006f               _boost_2_save:
 217  006f 00            	dc.b	0
 218  0070               _boost_3_save:
 219  0070 00            	dc.b	0
 220  0071               _boost_4_save:
 221  0071 00            	dc.b	0
 222  0072               _Comm_step:
 223  0072 00            	dc.b	0
 224  0073               _zone_1_pan:
 225  0073 00            	dc.b	0
 226  0074               _zone_2_pan:
 227  0074 00            	dc.b	0
 228  0075               _zone_3_pan:
 229  0075 00            	dc.b	0
 230  0076               _zone_4_pan:
 231  0076 00            	dc.b	0
 232  0077               _zone_1_nopan_time:
 233  0077 00            	dc.b	0
 234  0078               _zone_2_nopan_time:
 235  0078 00            	dc.b	0
 236  0079               _zone_3_nopan_time:
 237  0079 00            	dc.b	0
 238  007a               _zone_4_nopan_time:
 239  007a 00            	dc.b	0
 240  007b               _Get_addr:
 241  007b 00            	dc.b	0
 242  007c               _Get_data:
 243  007c 00            	dc.b	0
 244  007d               _Get_vol:
 245  007d 00            	dc.b	0
 246  007e               _Get_cur:
 247  007e 00            	dc.b	0
 248  007f               _Get_tigbt:
 249  007f 00            	dc.b	0
 250  0080               _Get_tmain:
 251  0080 00            	dc.b	0
 252  0081               _Get_ppg:
 253  0081 00            	dc.b	0
 254  0082               _Get_cur_no:
 255  0082 00            	dc.b	0
 256  0083               _Err_1_data:
 257  0083 00            	dc.b	0
 258  0084               _Err_2_data:
 259  0084 00            	dc.b	0
 260  0085               _Err_3_data:
 261  0085 00            	dc.b	0
 262  0086               _Err_4_data:
 263  0086 00            	dc.b	0
 264  0087               _Err_1_count:
 265  0087 00            	dc.b	0
 266  0088               _Err_2_count:
 267  0088 00            	dc.b	0
 268  0089               _Err_3_count:
 269  0089 00            	dc.b	0
 270  008a               _Err_4_count:
 271  008a 00            	dc.b	0
 272  008b               _boost_status:
 273  008b 00            	dc.b	0
 274  008c               _key_scan_value_H:
 275  008c 0000          	dc.w	0
 276  008e               _key_scan_value_L:
 277  008e 0000          	dc.w	0
 278  0090               _key_scan_value_AH:
 279  0090 0000          	dc.w	0
 280  0092               _key_ok_bit:
 281  0092 00            	dc.b	0
 282  0093               _key_account:
 283  0093 0000          	dc.w	0
 284  0095               _arr_save_scan:
 285  0095 0000          	dc.w	0
 286  0097 0000          	dc.w	0
 287  0099 0000          	dc.w	0
 288  009b               _key_err_account:
 289  009b 0000          	dc.w	0
 290                     	switch	.data
 291  0011               _key_ReleaseFlag:
 292  0011 01            	dc.b	1
 293  0012               _key_longPressRecord:
 294  0012 00            	dc.b	0
 295                     	bsct
 296  009d               _work_1_time:
 297  009d 0000          	dc.w	0
 298  009f               _work_2_time:
 299  009f 0000          	dc.w	0
 300  00a1               _work_3_time:
 301  00a1 0000          	dc.w	0
 302  00a3               _work_4_time:
 303  00a3 0000          	dc.w	0
 304  00a5               _limit_time:
 305  00a5 0000          	dc.w	0
 306  00a7               _zone_1_level:
 307  00a7 00            	dc.b	0
 308  00a8               _zone_2_level:
 309  00a8 00            	dc.b	0
 310  00a9               _zone_3_level:
 311  00a9 00            	dc.b	0
 312  00aa               _zone_4_level:
 313  00aa 00            	dc.b	0
 314  00ab               _general_timer:
 315  00ab 00            	dc.b	0
 316  00ac               _pause_x_timer:
 317  00ac 00            	dc.b	0
 318  00ad               _zone_1_timer:
 319  00ad 0000          	dc.w	0
 320  00af               _zone_2_timer:
 321  00af 0000          	dc.w	0
 322  00b1               _zone_3_timer:
 323  00b1 0000          	dc.w	0
 324  00b3               _zone_4_timer:
 325  00b3 0000          	dc.w	0
 326  00b5               _I2C_GET_DATA_H:
 327  00b5 0000          	dc.w	0
 328  00b7               _I2C_GET_DATA_L:
 329  00b7 0000          	dc.w	0
 330  00b9               _I2C_GET_DATA_AH:
 331  00b9 0000          	dc.w	0
 332  00bb               _match_ok:
 333  00bb 00            	dc.b	0
 334  00bc               _vol_1:
 335  00bc 00            	dc.b	0
 336  00bd               _vol_2:
 337  00bd 00            	dc.b	0
 338  00be               _vol_3:
 339  00be 00            	dc.b	0
 340  00bf               _vol_4:
 341  00bf 00            	dc.b	0
 342  00c0               _cur_1:
 343  00c0 00            	dc.b	0
 344  00c1               _cur_2:
 345  00c1 00            	dc.b	0
 346  00c2               _cur_3:
 347  00c2 00            	dc.b	0
 348  00c3               _cur_4:
 349  00c3 00            	dc.b	0
 350  00c4               _tigbt_1:
 351  00c4 00            	dc.b	0
 352  00c5               _tigbt_2:
 353  00c5 00            	dc.b	0
 354  00c6               _tigbt_3:
 355  00c6 00            	dc.b	0
 356  00c7               _tigbt_4:
 357  00c7 00            	dc.b	0
 358  00c8               _tmain_1:
 359  00c8 00            	dc.b	0
 360  00c9               _tmain_2:
 361  00c9 00            	dc.b	0
 362  00ca               _tmain_3:
 363  00ca 00            	dc.b	0
 364  00cb               _tmain_4:
 365  00cb 00            	dc.b	0
 366  00cc               _ppg_1:
 367  00cc 00            	dc.b	0
 368  00cd               _ppg_2:
 369  00cd 00            	dc.b	0
 370  00ce               _ppg_3:
 371  00ce 00            	dc.b	0
 372  00cf               _ppg_4:
 373  00cf 00            	dc.b	0
 374  00d0               _time_level_1:
 375  00d0 00            	dc.b	0
 376  00d1               _time_level_2:
 377  00d1 00            	dc.b	0
 378  00d2               _time_level_3:
 379  00d2 00            	dc.b	0
 380  00d3               _time_level_4:
 381  00d3 00            	dc.b	0
 382  00d4               _pwm_temp_1:
 383  00d4 00            	dc.b	0
 384  00d5               _pwm_temp_2:
 385  00d5 00            	dc.b	0
 386  00d6               _pwm_temp_3:
 387  00d6 00            	dc.b	0
 388  00d7               _pwm_temp_4:
 389  00d7 00            	dc.b	0
 390  00d8               _com_count:
 391  00d8 00            	dc.b	0
 392  00d9               _comm_status:
 393  00d9 00            	dc.b	0
 394  00da               _comm_list:
 395  00da 00            	dc.b	0
 396  00db               _fan_count:
 397  00db 00            	dc.b	0
 398  00dc               _fan_status:
 399  00dc 00            	dc.b	0
 400  00dd               _Pause_bz:
 401  00dd 00            	dc.b	0
 402  00de               _Pause_save_timer_1:
 403  00de 00            	dc.b	0
 404  00df               _Pause_save_timer_2:
 405  00df 00            	dc.b	0
 406  00e0               _Pause_save_timer_3:
 407  00e0 00            	dc.b	0
 408  00e1               _Pause_save_timer_4:
 409  00e1 00            	dc.b	0
 410                     	switch	.data
 411  0013               _Warm_status:
 412  0013 00            	dc.b	0
 413  0014               _Warm_1_timer:
 414  0014 00            	dc.b	0
 415  0015               _Warm_2_timer:
 416  0015 00            	dc.b	0
 417  0016               _Warm_3_timer:
 418  0016 00            	dc.b	0
 419  0017               _Warm_4_timer:
 420  0017 00            	dc.b	0
 421                     	bsct
 422  00e2               _tiao_on_1:
 423  00e2 00            	dc.b	0
 424  00e3               _tiao_on_2:
 425  00e3 00            	dc.b	0
 426  00e4               _tiao_on_3:
 427  00e4 00            	dc.b	0
 428  00e5               _tiao_on_4:
 429  00e5 00            	dc.b	0
 430                     	switch	.data
 431  0018               _oil_high_1:
 432  0018 00            	dc.b	0
 433  0019               _oil_high_2:
 434  0019 00            	dc.b	0
 435  001a               _oil_high_3:
 436  001a 00            	dc.b	0
 437  001b               _oil_high_4:
 438  001b 00            	dc.b	0
 439  001c               _igbt_high_1:
 440  001c 00            	dc.b	0
 441  001d               _igbt_high_2:
 442  001d 00            	dc.b	0
 443  001e               _igbt_high_3:
 444  001e 00            	dc.b	0
 445  001f               _igbt_high_4:
 446  001f 00            	dc.b	0
 447  0020               _boost_1_count:
 448  0020 00            	dc.b	0
 449  0021               _boost_2_count:
 450  0021 00            	dc.b	0
 451  0022               _boost_3_count:
 452  0022 00            	dc.b	0
 453  0023               _boost_4_count:
 454  0023 00            	dc.b	0
 455  0024               _zone_1_nopan_wait:
 456  0024 00            	dc.b	0
 457  0025               _zone_2_nopan_wait:
 458  0025 00            	dc.b	0
 459  0026               _zone_3_nopan_wait:
 460  0026 00            	dc.b	0
 461  0027               _zone_4_nopan_wait:
 462  0027 00            	dc.b	0
 463  0028               _zone_1_timeout_cnt:
 464  0028 00            	dc.b	0
 465  0029               _zone_2_timeout_cnt:
 466  0029 00            	dc.b	0
 467  002a               _zone_3_timeout_cnt:
 468  002a 00            	dc.b	0
 469  002b               _zone_4_timeout_cnt:
 470  002b 00            	dc.b	0
 471  002c               _zone_1_nopan_flg:
 472  002c 00            	dc.b	0
 473  002d               _zone_2_nopan_flg:
 474  002d 00            	dc.b	0
 475  002e               _zone_3_nopan_flg:
 476  002e 00            	dc.b	0
 477  002f               _zone_4_nopan_flg:
 478  002f 00            	dc.b	0
 479  0030               _set_default_timer1_cnt:
 480  0030 00            	dc.b	0
 481  0031               _set_default_timer2_cnt:
 482  0031 00            	dc.b	0
 483  0032               _set_default_timer3_cnt:
 484  0032 00            	dc.b	0
 485  0033               _set_default_timer4_cnt:
 486  0033 00            	dc.b	0
 487  0034               _min_hold_flg:
 488  0034 00            	dc.b	0
 489  0035               _lock_release_flg:
 490  0035 01            	dc.b	1
 491                     	bsct
 492  00e6               _apt_min_reset:
 493  00e6 00            	dc.b	0
 494                     .user:	section	.text
 495  0000               _arr_default_timer:
 496  0000 0000          	dc.w	0
 497  0002 01e0          	dc.w	480
 498  0004 01e0          	dc.w	480
 499  0006 01e0          	dc.w	480
 500  0008 01e0          	dc.w	480
 501  000a 00f0          	dc.w	240
 502  000c 00f0          	dc.w	240
 503  000e 00f0          	dc.w	240
 504  0010 00f0          	dc.w	240
 505  0012 0078          	dc.w	120
 506  0014 0078          	dc.w	120
 507  0016 0078          	dc.w	120
 508  0018 003c          	dc.w	60
 509  001a 003c          	dc.w	60
 510  001c 003c          	dc.w	60
 511  001e               _arr_tiao_on:
 512  001e 04            	dc.b	4
 513  001f 05            	dc.b	5
 514  0020 06            	dc.b	6
 515  0021 07            	dc.b	7
 516  0022 08            	dc.b	8
 517  0023 09            	dc.b	9
 518  0024 0a            	dc.b	10
 519  0025 0b            	dc.b	11
 520  0026               _arr_tiao_180_pwm:
 521  0026 c0            	dc.b	192
 522  0027 c0            	dc.b	192
 523  0028 c0            	dc.b	192
 524  0029 b8            	dc.b	184
 525  002a b8            	dc.b	184
 526  002b b0            	dc.b	176
 527  002c b0            	dc.b	176
 528  002d b0            	dc.b	176
 529  002e               _erp_pwm:
 530  002e c0            	dc.b	192
 531  002f b7            	dc.b	183
 532  0030 b0            	dc.b	176
 533  0031 b7            	dc.b	183
 534  0032               _arr_1_pow:
 535  0032 56            	dc.b	86
 536  0033 5c            	dc.b	92
 537  0034 62            	dc.b	98
 538  0035 68            	dc.b	104
 539  0036 6d            	dc.b	109
 540  0037 71            	dc.b	113
 541  0038 9e            	dc.b	158
 542  0039               _arr_3_pow:
 543  0039 56            	dc.b	86
 544  003a 62            	dc.b	98
 545  003b 68            	dc.b	104
 546  003c 6d            	dc.b	109
 547  003d 71            	dc.b	113
 548  003e 91            	dc.b	145
 549  003f d2            	dc.b	210
 550  0040               _arr_2_pow:
 551  0040 71            	dc.b	113
 552  0041 7d            	dc.b	125
 553  0042 88            	dc.b	136
 554  0043 93            	dc.b	147
 555  0044 9f            	dc.b	159
 556  0045 aa            	dc.b	170
 557  0046 e6            	dc.b	230
 558  0047               _arr_4_pow:
 559  0047 71            	dc.b	113
 560  0048 7d            	dc.b	125
 561  0049 88            	dc.b	136
 562  004a 93            	dc.b	147
 563  004b 9f            	dc.b	159
 564  004c aa            	dc.b	170
 565  004d e6            	dc.b	230
 566  004e               _arr_flex_b:
 567  004e 37            	dc.b	55
 568  004f 3b            	dc.b	59
 569  0050 3e            	dc.b	62
 570  0051 41            	dc.b	65
 571  0052 44            	dc.b	68
 572  0053 47            	dc.b	71
 573  0054 50            	dc.b	80
 574  0055               _arr_flex_s:
 575  0055 6e            	dc.b	110
 576  0056 76            	dc.b	118
 577  0057 7c            	dc.b	124
 578  0058 82            	dc.b	130
 579  0059 88            	dc.b	136
 580  005a 8e            	dc.b	142
 581  005b 99            	dc.b	153
 582  005c               _arr_APTRegData_AH:
 583  005c 03            	dc.b	3
 584  005d 05            	dc.b	5
 585  005e 10            	dc.b	16
 586  005f 00            	dc.b	0
 587  0060 10            	dc.b	16
 588  0061 20            	dc.b	32
 589  0062 08            	dc.b	8
 590  0063 02            	dc.b	2
 591  0064 02            	dc.b	2
 592  0065 80            	dc.b	128
 593  0066 10            	dc.b	16
 594  0067 00            	dc.b	0
 595  0068 40            	dc.b	64
 596  0069 00            	dc.b	0
 597  006a               _arr_T_Sens_AH:
 598  006a 0e            	dc.b	14
 599  006b 0e            	dc.b	14
 600  006c 0e            	dc.b	14
 601  006d 12            	dc.b	18
 602  006e 12            	dc.b	18
 603  006f 0e            	dc.b	14
 604  0070 0e            	dc.b	14
 605  0071 0e            	dc.b	14
 606  0072 0e            	dc.b	14
 607  0073 0e            	dc.b	14
 608  0074 0e            	dc.b	14
 609  0075 12            	dc.b	18
 610  0076 ff            	dc.b	255
 611  0077 0c            	dc.b	12
 612  0078 0c            	dc.b	12
 613  0079 12            	dc.b	18
 614  007a               _arr_APTRegData_H:
 615  007a 03            	dc.b	3
 616  007b 05            	dc.b	5
 617  007c 10            	dc.b	16
 618  007d 08            	dc.b	8
 619  007e 00            	dc.b	0
 620  007f 20            	dc.b	32
 621  0080 08            	dc.b	8
 622  0081 02            	dc.b	2
 623  0082 02            	dc.b	2
 624  0083 80            	dc.b	128
 625  0084 10            	dc.b	16
 626  0085 00            	dc.b	0
 627  0086 40            	dc.b	64
 628  0087 00            	dc.b	0
 629  0088               _arr_T_Sens_H:
 630  0088 ff            	dc.b	255
 631  0089 0e            	dc.b	14
 632  008a 12            	dc.b	18
 633  008b 12            	dc.b	18
 634  008c 12            	dc.b	18
 635  008d 12            	dc.b	18
 636  008e 06            	dc.b	6
 637  008f 10            	dc.b	16
 638  0090 10            	dc.b	16
 639  0091 10            	dc.b	16
 640  0092 10            	dc.b	16
 641  0093 06            	dc.b	6
 642  0094 06            	dc.b	6
 643  0095 0e            	dc.b	14
 644  0096 12            	dc.b	18
 645  0097 0e            	dc.b	14
 646  0098               _arr_APTRegData_L:
 647  0098 03            	dc.b	3
 648  0099 05            	dc.b	5
 649  009a 10            	dc.b	16
 650  009b 0f            	dc.b	15
 651  009c f0            	dc.b	240
 652  009d 20            	dc.b	32
 653  009e 08            	dc.b	8
 654  009f 02            	dc.b	2
 655  00a0 02            	dc.b	2
 656  00a1 80            	dc.b	128
 657  00a2 10            	dc.b	16
 658  00a3 00            	dc.b	0
 659  00a4 40            	dc.b	64
 660  00a5 00            	dc.b	0
 661  00a6               _arr_T_Sens_L:
 662  00a6 ff            	dc.b	255
 663  00a7 ff            	dc.b	255
 664  00a8 ff            	dc.b	255
 665  00a9 ff            	dc.b	255
 666  00aa 10            	dc.b	16
 667  00ab 10            	dc.b	16
 668  00ac 0c            	dc.b	12
 669  00ad 0e            	dc.b	14
 670  00ae 0c            	dc.b	12
 671  00af 0e            	dc.b	14
 672  00b0 10            	dc.b	16
 673  00b1 10            	dc.b	16
 674  00b2 ff            	dc.b	255
 675  00b3 ff            	dc.b	255
 676  00b4 ff            	dc.b	255
 677  00b5 ff            	dc.b	255
 726                     ; 423 void  writeEEPROM(u32 addr, u8 data)
 726                     ; 424 {              	
 728                     	switch	.text
 729  0000               _writeEEPROM:
 731       00000000      OFST:	set	0
 734                     ; 425 	FLASH->CR1 &= (u8)(~FLASH_CR1_FIX);
 736  0000 7211505a      	bres	20570,#0
 737                     ; 426 	FLASH->DUKR = FLASH_RASS_KEY2; 
 739  0004 35ae5064      	mov	20580,#174
 740                     ; 427 	FLASH->DUKR = FLASH_RASS_KEY1; 	
 742  0008 35565064      	mov	20580,#86
 743                     ; 428 	*((PointerAttr u8*)addr) =data;
 745  000c 7b07          	ld	a,(OFST+7,sp)
 746  000e 88            	push	a
 747  000f 7b05          	ld	a,(OFST+5,sp)
 748  0011 b700          	ld	c_x,a
 749  0013 1e06          	ldw	x,(OFST+6,sp)
 750  0015 84            	pop	a
 751  0016 bf01          	ldw	c_x+1,x
 752  0018 92bd0000      	ldf	[c_x.e],a
 753                     ; 429 } 
 756  001c 81            	ret
 799                     ; 431 u8 readEEPROM(u32 addr)
 799                     ; 432 {
 800                     	switch	.text
 801  001d               _readEEPROM:
 803  001d 88            	push	a
 804       00000001      OFST:	set	1
 807                     ; 433 	u8 val = 0;
 809  001e 0f01          	clr	(OFST+0,sp)
 810                     ; 434 	val =(*((PointerAttr u8*) addr));
 812  0020 7b05          	ld	a,(OFST+4,sp)
 813  0022 b700          	ld	c_x,a
 814  0024 1e06          	ldw	x,(OFST+5,sp)
 815  0026 bf01          	ldw	c_x+1,x
 816  0028 92bc0000      	ldf	a,[c_x.e]
 817  002c 6b01          	ld	(OFST+0,sp),a
 818                     ; 435 	return val;
 820  002e 7b01          	ld	a,(OFST+0,sp)
 823  0030 5b01          	addw	sp,#1
 824  0032 81            	ret
 863                     ; 440 u8 comm_vertify(void)
 863                     ; 441 {
 864                     	switch	.text
 865  0033               _comm_vertify:
 867  0033 88            	push	a
 868       00000001      OFST:	set	1
 871                     ; 442    u8 status =0;
 873  0034 0f01          	clr	(OFST+0,sp)
 874                     ; 443    	if(Get_addr ==Add_Status)						status++;
 876  0036 b67b          	ld	a,_Get_addr
 877  0038 b104          	cp	a,_Add_Status
 878  003a 2602          	jrne	L37
 881  003c 0c01          	inc	(OFST+0,sp)
 882  003e               L37:
 883                     ; 444 	if(Get_cur_no == cur_no)		   	        		status++;  
 885  003e b682          	ld	a,_Get_cur_no
 886  0040 b106          	cp	a,_cur_no
 887  0042 2602          	jrne	L57
 890  0044 0c01          	inc	(OFST+0,sp)
 891  0046               L57:
 892                     ; 445 	if((Get_data ==0)||(Get_data ==DATA_PAN_NO)||(Get_data ==DATA_PAN_OK))  status++;	
 894  0046 3d7c          	tnz	_Get_data
 895  0048 270c          	jreq	L101
 897  004a b67c          	ld	a,_Get_data
 898  004c a165          	cp	a,#101
 899  004e 2706          	jreq	L101
 901  0050 b67c          	ld	a,_Get_data
 902  0052 a156          	cp	a,#86
 903  0054 2602          	jrne	L77
 904  0056               L101:
 907  0056 0c01          	inc	(OFST+0,sp)
 908  0058               L77:
 909                     ; 446         if(status ==3) return(1);
 911  0058 7b01          	ld	a,(OFST+0,sp)
 912  005a a103          	cp	a,#3
 913  005c 2605          	jrne	L501
 916  005e a601          	ld	a,#1
 919  0060 5b01          	addw	sp,#1
 920  0062 81            	ret
 921  0063               L501:
 922                     ; 447    else return(0);
 924  0063 4f            	clr	a
 927  0064 5b01          	addw	sp,#1
 928  0066 81            	ret
 966                     ; 451 void  sme_x_clr_power(u8 select)
 966                     ; 452 {
 967                     	switch	.text
 968  0067               _sme_x_clr_power:
 972                     ; 453 	switch(select)
 975                     ; 458 		case Select_4_KEY:auto_limit_pow_3 =0;break;
 976  0067 4a            	dec	a
 977  0068 270d          	jreq	L111
 978  006a 4a            	dec	a
 979  006b 270e          	jreq	L311
 980  006d a002          	sub	a,#2
 981  006f 270e          	jreq	L511
 982  0071 a004          	sub	a,#4
 983  0073 270e          	jreq	L711
 984  0075 200e          	jra	L141
 985  0077               L111:
 986                     ; 455 		case Select_1_KEY:auto_limit_pow_2 =0;break;
 988  0077 3f63          	clr	_auto_limit_pow_2
 991  0079 200a          	jra	L141
 992  007b               L311:
 993                     ; 456 		case Select_2_KEY:auto_limit_pow_1 =0;break;
 995  007b 3f62          	clr	_auto_limit_pow_1
 998  007d 2006          	jra	L141
 999  007f               L511:
1000                     ; 457 		case Select_3_KEY:auto_limit_pow_4 =0;break;
1002  007f 3f65          	clr	_auto_limit_pow_4
1005  0081 2002          	jra	L141
1006  0083               L711:
1007                     ; 458 		case Select_4_KEY:auto_limit_pow_3 =0;break;
1009  0083 3f64          	clr	_auto_limit_pow_3
1012  0085               L141:
1013                     ; 460 }
1016  0085 81            	ret
1054                     ; 461 void  sme_x_share_power(u8 select)
1054                     ; 462 {
1055                     	switch	.text
1056  0086               _sme_x_share_power:
1060                     ; 463 	switch(select)		
1063                     ; 476 			break;
1064  0086 4a            	dec	a
1065  0087 270d          	jreq	L341
1066  0089 4a            	dec	a
1067  008a 2710          	jreq	L541
1068  008c a002          	sub	a,#2
1069  008e 2712          	jreq	L741
1070  0090 a004          	sub	a,#4
1071  0092 2714          	jreq	L151
1072  0094 2016          	jra	L371
1073  0096               L341:
1074                     ; 465 		case Select_1_KEY:	//big  210mm 2000w 2600w
1074                     ; 466 			auto_limit_pow_2 =123; //1000w
1076  0096 357b0063      	mov	_auto_limit_pow_2,#123
1077                     ; 467 			break;
1079  009a 2010          	jra	L371
1080  009c               L541:
1081                     ; 468 		case Select_2_KEY: 	//small 160mm 1400w 1800w
1081                     ; 469 			auto_limit_pow_1 =101; //1700w
1083  009c 35650062      	mov	_auto_limit_pow_1,#101
1084                     ; 470 			break;
1086  00a0 200a          	jra	L371
1087  00a2               L741:
1088                     ; 471 		case Select_3_KEY: 	//big  210mm 2000w 2600w
1088                     ; 472 			auto_limit_pow_4 =123; //1000w
1090  00a2 357b0065      	mov	_auto_limit_pow_4,#123
1091                     ; 473 			break;
1093  00a6 2004          	jra	L371
1094  00a8               L151:
1095                     ; 474 		case Select_4_KEY: 	//small 160mm 1400w 1800w
1095                     ; 475 			auto_limit_pow_3 =101; //1700w
1097  00a8 35650064      	mov	_auto_limit_pow_3,#101
1098                     ; 476 			break;
1100  00ac               L371:
1101                     ; 478 }
1104  00ac 81            	ret
1166                     ; 480 void flex_deal(u8 index)
1166                     ; 481 {	
1167                     	switch	.text
1168  00ad               _flex_deal:
1170  00ad 88            	push	a
1171  00ae 89            	pushw	x
1172       00000002      OFST:	set	2
1175                     ; 482 	u8 ds =0;
1177  00af 0f01          	clr	(OFST-1,sp)
1178                     ; 483 	u8 dr =0;
1180  00b1 0f02          	clr	(OFST+0,sp)
1181                     ; 485 	if((index ==1)||(index ==0x11))
1183  00b3 a101          	cp	a,#1
1184  00b5 2704          	jreq	L522
1186  00b7 a111          	cp	a,#17
1187  00b9 261c          	jrne	L322
1188  00bb               L522:
1189                     ; 487 		if(flex_L_bz)  	
1191  00bb 3d66          	tnz	_flex_L_bz
1192  00bd 2718          	jreq	L322
1193                     ; 489 		  ds =0;	
1195  00bf 0f01          	clr	(OFST-1,sp)
1196                     ; 490 	  	dr =1;
1198  00c1 a601          	ld	a,#1
1199  00c3 6b02          	ld	(OFST+0,sp),a
1200                     ; 491 	  	count_2_key =0;
1202  00c5 3f42          	clr	_count_2_key
1203                     ; 492 	  	if(timer_status &0x01)  timer_status |=0x02;
1205  00c7 b649          	ld	a,_timer_status
1206  00c9 a501          	bcp	a,#1
1207  00cb 2706          	jreq	L132
1210  00cd 72120049      	bset	_timer_status,#1
1212  00d1 2004          	jra	L322
1213  00d3               L132:
1214                     ; 493 		  else timer_status &=~0x02;
1216  00d3 72130049      	bres	_timer_status,#1
1217  00d7               L322:
1218                     ; 497 	if((index ==2)||(index ==0x12))
1220  00d7 7b03          	ld	a,(OFST+1,sp)
1221  00d9 a102          	cp	a,#2
1222  00db 2706          	jreq	L732
1224  00dd 7b03          	ld	a,(OFST+1,sp)
1225  00df a112          	cp	a,#18
1226  00e1 261c          	jrne	L532
1227  00e3               L732:
1228                     ; 499 		if(flex_L_bz)  	
1230  00e3 3d66          	tnz	_flex_L_bz
1231  00e5 2718          	jreq	L532
1232                     ; 501 	   	ds =1;	
1234  00e7 a601          	ld	a,#1
1235  00e9 6b01          	ld	(OFST-1,sp),a
1236                     ; 502 	  	dr =0;
1238  00eb 0f02          	clr	(OFST+0,sp)
1239                     ; 503 		  count_1_key =0;
1241  00ed 3f41          	clr	_count_1_key
1242                     ; 504 	    if(timer_status &0x02)  timer_status |=0x01;
1244  00ef b649          	ld	a,_timer_status
1245  00f1 a502          	bcp	a,#2
1246  00f3 2706          	jreq	L342
1249  00f5 72100049      	bset	_timer_status,#0
1251  00f9 2004          	jra	L532
1252  00fb               L342:
1253                     ; 505 	  	else timer_status &=~0x01;
1255  00fb 72110049      	bres	_timer_status,#0
1256  00ff               L532:
1257                     ; 509 	if((index ==3)||(index ==0x14))
1259  00ff 7b03          	ld	a,(OFST+1,sp)
1260  0101 a103          	cp	a,#3
1261  0103 2706          	jreq	L152
1263  0105 7b03          	ld	a,(OFST+1,sp)
1264  0107 a114          	cp	a,#20
1265  0109 261e          	jrne	L742
1266  010b               L152:
1267                     ; 511 		if(flex_R_bz)  	
1269  010b 3d67          	tnz	_flex_R_bz
1270  010d 271a          	jreq	L742
1271                     ; 513 	  	ds =2;	
1273  010f a602          	ld	a,#2
1274  0111 6b01          	ld	(OFST-1,sp),a
1275                     ; 514 	  	dr =3;
1277  0113 a603          	ld	a,#3
1278  0115 6b02          	ld	(OFST+0,sp),a
1279                     ; 515 	  	count_4_key =0;
1281  0117 3f44          	clr	_count_4_key
1282                     ; 516 	  	if(timer_status &0x04)  timer_status |=0x08;
1284  0119 b649          	ld	a,_timer_status
1285  011b a504          	bcp	a,#4
1286  011d 2706          	jreq	L552
1289  011f 72160049      	bset	_timer_status,#3
1291  0123 2004          	jra	L742
1292  0125               L552:
1293                     ; 517 	  	else timer_status &=~0x08;
1295  0125 72170049      	bres	_timer_status,#3
1296  0129               L742:
1297                     ; 521 	if((index ==4)||(index ==0x18))
1299  0129 7b03          	ld	a,(OFST+1,sp)
1300  012b a104          	cp	a,#4
1301  012d 2706          	jreq	L362
1303  012f 7b03          	ld	a,(OFST+1,sp)
1304  0131 a118          	cp	a,#24
1305  0133 261e          	jrne	L162
1306  0135               L362:
1307                     ; 523 		if(flex_R_bz)  
1309  0135 3d67          	tnz	_flex_R_bz
1310  0137 271a          	jreq	L162
1311                     ; 525 	  	ds =3;	
1313  0139 a603          	ld	a,#3
1314  013b 6b01          	ld	(OFST-1,sp),a
1315                     ; 526 	  	dr =2;
1317  013d a602          	ld	a,#2
1318  013f 6b02          	ld	(OFST+0,sp),a
1319                     ; 527 	  	count_3_key =0;
1321  0141 3f43          	clr	_count_3_key
1322                     ; 528 	  	if(timer_status &0x08)  timer_status |=0x04;
1324  0143 b649          	ld	a,_timer_status
1325  0145 a508          	bcp	a,#8
1326  0147 2706          	jreq	L762
1329  0149 72140049      	bset	_timer_status,#2
1331  014d 2004          	jra	L162
1332  014f               L762:
1333                     ; 529 	  	else timer_status &=~0x04;
1335  014f 72150049      	bres	_timer_status,#2
1336  0153               L162:
1337                     ; 532 	if(ds+dr)    
1339  0153 7b01          	ld	a,(OFST-1,sp)
1340  0155 5f            	clrw	x
1341  0156 1b02          	add	a,(OFST+0,sp)
1342  0158 2401          	jrnc	L02
1343  015a 5c            	incw	x
1344  015b               L02:
1345  015b 02            	rlwa	x,a
1346  015c 5d            	tnzw	x
1347  015d 2737          	jreq	L372
1348                     ; 534 		*((u8*)(&zone_1_level+dr)) =*((u8*)(&zone_1_level+ds));
1350  015f 7b02          	ld	a,(OFST+0,sp)
1351  0161 5f            	clrw	x
1352  0162 97            	ld	xl,a
1353  0163 7b01          	ld	a,(OFST-1,sp)
1354  0165 905f          	clrw	y
1355  0167 9097          	ld	yl,a
1356  0169 90e6a7        	ld	a,(_zone_1_level,y)
1357  016c e7a7          	ld	(_zone_1_level,x),a
1358                     ; 535 		*((u16*)(&boost_time_1)+dr)  =*((u16*)(&boost_time_1)+ds);
1360  016e 7b01          	ld	a,(OFST-1,sp)
1361  0170 5f            	clrw	x
1362  0171 97            	ld	xl,a
1363  0172 58            	sllw	x
1364  0173 7b02          	ld	a,(OFST+0,sp)
1365  0175 905f          	clrw	y
1366  0177 9097          	ld	yl,a
1367  0179 9058          	sllw	y
1368  017b 89            	pushw	x
1369  017c ee52          	ldw	x,(_boost_time_1,x)
1370  017e 90ef52        	ldw	(_boost_time_1,y),x
1371  0181 85            	popw	x
1372                     ; 536 		*((u16*)(&zone_1_timer)+dr)  =*((u16*)(&zone_1_timer)+ds);    		
1374  0182 7b01          	ld	a,(OFST-1,sp)
1375  0184 5f            	clrw	x
1376  0185 97            	ld	xl,a
1377  0186 58            	sllw	x
1378  0187 7b02          	ld	a,(OFST+0,sp)
1379  0189 905f          	clrw	y
1380  018b 9097          	ld	yl,a
1381  018d 9058          	sllw	y
1382  018f 89            	pushw	x
1383  0190 eead          	ldw	x,(_zone_1_timer,x)
1384  0192 90efad        	ldw	(_zone_1_timer,y),x
1385  0195 85            	popw	x
1386  0196               L372:
1387                     ; 538 }
1390  0196 5b03          	addw	sp,#3
1391  0198 81            	ret
1416                     ; 540 void comm_asm_deal(void)
1416                     ; 541 {
1417                     	switch	.text
1418  0199               _comm_asm_deal:
1422                     ; 543      		mov _bit_comm+0,_Add_Status
1425  0199 450400        mov _bit_comm+0,_Add_Status
1427                     ; 544      		mov _bit_comm+1,_syn_delay
1430  019c 450501        mov _bit_comm+1,_syn_delay
1432                     ; 545      		mov _bit_comm+2,_cur_no
1435  019f 450602        mov _bit_comm+2,_cur_no
1437                     ; 546      		mov _bit_comm+3,_max_pwm
1440  01a2 450703        mov _bit_comm+3,_max_pwm
1442                     ; 548      	comm_status =0;  
1444  01a5 3fd9          	clr	_comm_status
1445                     ; 549         comm_list =0; 
1447  01a7 3fda          	clr	_comm_list
1448                     ; 550 }
1451  01a9 81            	ret
1650                     ; 552 void comm_get_deal(u8 index)
1650                     ; 553 {
1651                     	switch	.text
1652  01aa               _comm_get_deal:
1654  01aa 88            	push	a
1655  01ab 521b          	subw	sp,#27
1656       0000001b      OFST:	set	27
1659                     ; 554 		u8 result =0;
1661  01ad 0f1b          	clr	(OFST+0,sp)
1662                     ; 555     u8 *v =&vol_1 +index;   
1664  01af abbc          	add	a,#_vol_1
1665  01b1 5f            	clrw	x
1666  01b2 97            	ld	xl,a
1667  01b3 1f03          	ldw	(OFST-24,sp),x
1668                     ; 556 	u8 *c =&cur_1 +index;   
1670  01b5 7b1c          	ld	a,(OFST+1,sp)
1671  01b7 abc0          	add	a,#_cur_1
1672  01b9 5f            	clrw	x
1673  01ba 97            	ld	xl,a
1674  01bb 1f05          	ldw	(OFST-22,sp),x
1675                     ; 557 	  u8 *i =&tigbt_1 +index; 
1677  01bd 7b1c          	ld	a,(OFST+1,sp)
1678  01bf abc4          	add	a,#_tigbt_1
1679  01c1 5f            	clrw	x
1680  01c2 97            	ld	xl,a
1681  01c3 1f07          	ldw	(OFST-20,sp),x
1682                     ; 558   	u8 *m =&tmain_1 +index; 
1684  01c5 7b1c          	ld	a,(OFST+1,sp)
1685  01c7 abc8          	add	a,#_tmain_1
1686  01c9 5f            	clrw	x
1687  01ca 97            	ld	xl,a
1688  01cb 1f09          	ldw	(OFST-18,sp),x
1689                     ; 559   	u8 *p =&ppg_1 +index;   
1691  01cd 7b1c          	ld	a,(OFST+1,sp)
1692  01cf abcc          	add	a,#_ppg_1
1693  01d1 5f            	clrw	x
1694  01d2 97            	ld	xl,a
1695  01d3 1f0b          	ldw	(OFST-16,sp),x
1696                     ; 560   	u8 *z =&zone_1_pan +index;  
1698  01d5 7b1c          	ld	a,(OFST+1,sp)
1699  01d7 ab73          	add	a,#_zone_1_pan
1700  01d9 5f            	clrw	x
1701  01da 97            	ld	xl,a
1702  01db 1f0d          	ldw	(OFST-14,sp),x
1703                     ; 561   	u8 *so =&oil_high_1 +index;
1705  01dd a618          	ld	a,#high(_oil_high_1)
1706  01df 97            	ld	xl,a
1707  01e0 a618          	ld	a,#low(_oil_high_1)
1708  01e2 1b1c          	add	a,(OFST+1,sp)
1709  01e4 2401          	jrnc	L62
1710  01e6 5c            	incw	x
1711  01e7               L62:
1712  01e7 02            	rlwa	x,a
1713  01e8 1f19          	ldw	(OFST-2,sp),x
1714  01ea 01            	rrwa	x,a
1715                     ; 562   	u8 *si =&igbt_high_1 +index;
1717  01eb a61c          	ld	a,#high(_igbt_high_1)
1718  01ed 97            	ld	xl,a
1719  01ee a61c          	ld	a,#low(_igbt_high_1)
1720  01f0 1b1c          	add	a,(OFST+1,sp)
1721  01f2 2401          	jrnc	L03
1722  01f4 5c            	incw	x
1723  01f5               L03:
1724  01f5 02            	rlwa	x,a
1725  01f6 1f13          	ldw	(OFST-8,sp),x
1726  01f8 01            	rrwa	x,a
1727                     ; 563   	u8 *time =&zone_1_nopan_time +index; 
1729  01f9 7b1c          	ld	a,(OFST+1,sp)
1730  01fb ab77          	add	a,#_zone_1_nopan_time
1731  01fd 5f            	clrw	x
1732  01fe 97            	ld	xl,a
1733  01ff 1f17          	ldw	(OFST-4,sp),x
1734                     ; 564   	u8 *npan =&zone_1_nopan_wait +index;
1736  0201 a624          	ld	a,#high(_zone_1_nopan_wait)
1737  0203 97            	ld	xl,a
1738  0204 a624          	ld	a,#low(_zone_1_nopan_wait)
1739  0206 1b1c          	add	a,(OFST+1,sp)
1740  0208 2401          	jrnc	L23
1741  020a 5c            	incw	x
1742  020b               L23:
1743  020b 02            	rlwa	x,a
1744  020c 1f0f          	ldw	(OFST-12,sp),x
1745  020e 01            	rrwa	x,a
1746                     ; 565   	u8 *level =&zone_1_level +index; 
1748  020f 7b1c          	ld	a,(OFST+1,sp)
1749  0211 aba7          	add	a,#_zone_1_level
1750  0213 5f            	clrw	x
1751  0214 97            	ld	xl,a
1752  0215 1f01          	ldw	(OFST-26,sp),x
1753                     ; 566   	u8 *count =&Err_1_count +index; 
1755  0217 7b1c          	ld	a,(OFST+1,sp)
1756  0219 ab87          	add	a,#_Err_1_count
1757  021b 5f            	clrw	x
1758  021c 97            	ld	xl,a
1759  021d 1f15          	ldw	(OFST-6,sp),x
1760                     ; 567   	u8 *err =&Err_1_data +index; 
1762  021f 7b1c          	ld	a,(OFST+1,sp)
1763  0221 ab83          	add	a,#_Err_1_data
1764  0223 5f            	clrw	x
1765  0224 97            	ld	xl,a
1766  0225 1f11          	ldw	(OFST-10,sp),x
1767                     ; 569 		(*v) =Get_vol;
1769  0227 1e03          	ldw	x,(OFST-24,sp)
1770  0229 b67d          	ld	a,_Get_vol
1771  022b f7            	ld	(x),a
1772                     ; 570 		(*c) =Get_cur;  
1774  022c 1e05          	ldw	x,(OFST-22,sp)
1775  022e b67e          	ld	a,_Get_cur
1776  0230 f7            	ld	(x),a
1777                     ; 571 		(*i) =Get_tigbt;
1779  0231 1e07          	ldw	x,(OFST-20,sp)
1780  0233 b67f          	ld	a,_Get_tigbt
1781  0235 f7            	ld	(x),a
1782                     ; 572 		(*m) =Get_tmain;  
1784  0236 1e09          	ldw	x,(OFST-18,sp)
1785  0238 b680          	ld	a,_Get_tmain
1786  023a f7            	ld	(x),a
1787                     ; 573 		(*p) =Get_ppg;
1789  023b 1e0b          	ldw	x,(OFST-16,sp)
1790  023d b681          	ld	a,_Get_ppg
1791  023f f7            	ld	(x),a
1792                     ; 574 		(*z) =Get_data;
1794  0240 1e0d          	ldw	x,(OFST-14,sp)
1795  0242 b67c          	ld	a,_Get_data
1796  0244 f7            	ld	(x),a
1797                     ; 577 		if((index ==1)||(index ==3))	 //2# 3# 4#special deal temperature  ((index ==1)||(index==3))
1799  0245 7b1c          	ld	a,(OFST+1,sp)
1800  0247 a101          	cp	a,#1
1801  0249 2706          	jreq	L514
1803  024b 7b1c          	ld	a,(OFST+1,sp)
1804  024d a103          	cp	a,#3
1805  024f 262f          	jrne	L314
1806  0251               L514:
1807                     ; 579 			if(Get_tmain >CON_TMAIN_190)  (*so) =4;		//180  0xF1
1809  0251 b680          	ld	a,_Get_tmain
1810  0253 a1f4          	cp	a,#244
1811  0255 2505          	jrult	L714
1814  0257 1e19          	ldw	x,(OFST-2,sp)
1815  0259 a604          	ld	a,#4
1816  025b f7            	ld	(x),a
1817  025c               L714:
1818                     ; 580 			if(Get_tmain >CON_TMAIN_200)  (*so) =1;   	//190  0xF3
1820  025c b680          	ld	a,_Get_tmain
1821  025e a1f6          	cp	a,#246
1822  0260 2505          	jrult	L124
1825  0262 1e19          	ldw	x,(OFST-2,sp)
1826  0264 a601          	ld	a,#1
1827  0266 f7            	ld	(x),a
1828  0267               L124:
1829                     ; 581 			if(*so)
1831  0267 1e19          	ldw	x,(OFST-2,sp)
1832  0269 7d            	tnz	(x)
1833  026a 2714          	jreq	L314
1834                     ; 583        	if(Get_tmain <CON_TMAIN_170)  (*so) =4;		//170  0xED
1836  026c b680          	ld	a,_Get_tmain
1837  026e a1ed          	cp	a,#237
1838  0270 2405          	jruge	L524
1841  0272 1e19          	ldw	x,(OFST-2,sp)
1842  0274 a604          	ld	a,#4
1843  0276 f7            	ld	(x),a
1844  0277               L524:
1845                     ; 584        	if(Get_tmain <CON_TMAIN_160)  (*so) =0;		//160  0xE9
1847  0277 b680          	ld	a,_Get_tmain
1848  0279 a1e9          	cp	a,#233
1849  027b 2403          	jruge	L314
1852  027d 1e19          	ldw	x,(OFST-2,sp)
1853  027f 7f            	clr	(x)
1854  0280               L314:
1855                     ; 587 		if((index ==0)||(index ==2))	 //2# 3# 4#special deal temperature  ((index ==1)||(index==3))
1857  0280 0d1c          	tnz	(OFST+1,sp)
1858  0282 2706          	jreq	L334
1860  0284 7b1c          	ld	a,(OFST+1,sp)
1861  0286 a102          	cp	a,#2
1862  0288 262f          	jrne	L134
1863  028a               L334:
1864                     ; 589 			if(Get_tmain >CON_TMAIN_180)  (*so) =3;		//180  0xF1
1866  028a b680          	ld	a,_Get_tmain
1867  028c a1f2          	cp	a,#242
1868  028e 2505          	jrult	L534
1871  0290 1e19          	ldw	x,(OFST-2,sp)
1872  0292 a603          	ld	a,#3
1873  0294 f7            	ld	(x),a
1874  0295               L534:
1875                     ; 590 			if(Get_tmain >CON_TMAIN_190)  (*so) =1;       	//190  0xF3
1877  0295 b680          	ld	a,_Get_tmain
1878  0297 a1f4          	cp	a,#244
1879  0299 2505          	jrult	L734
1882  029b 1e19          	ldw	x,(OFST-2,sp)
1883  029d a601          	ld	a,#1
1884  029f f7            	ld	(x),a
1885  02a0               L734:
1886                     ; 591 			if(*so)
1888  02a0 1e19          	ldw	x,(OFST-2,sp)
1889  02a2 7d            	tnz	(x)
1890  02a3 2714          	jreq	L134
1891                     ; 593        	if(Get_tmain <CON_TMAIN_170)  (*so) =4;		//170  0xED
1893  02a5 b680          	ld	a,_Get_tmain
1894  02a7 a1ed          	cp	a,#237
1895  02a9 2405          	jruge	L344
1898  02ab 1e19          	ldw	x,(OFST-2,sp)
1899  02ad a604          	ld	a,#4
1900  02af f7            	ld	(x),a
1901  02b0               L344:
1902                     ; 594        	if(Get_tmain <CON_TMAIN_160)  (*so) =0;		//160  0xE9
1904  02b0 b680          	ld	a,_Get_tmain
1905  02b2 a1e9          	cp	a,#233
1906  02b4 2403          	jruge	L134
1909  02b6 1e19          	ldw	x,(OFST-2,sp)
1910  02b8 7f            	clr	(x)
1911  02b9               L134:
1912                     ; 610 		if(Get_tigbt >CON_TIGBT_105)   (*si) =1;
1914  02b9 b67f          	ld	a,_Get_tigbt
1915  02bb a1f6          	cp	a,#246
1916  02bd 2507          	jrult	L744
1919  02bf 1e13          	ldw	x,(OFST-8,sp)
1920  02c1 a601          	ld	a,#1
1921  02c3 f7            	ld	(x),a
1923  02c4 200e          	jra	L154
1924  02c6               L744:
1925                     ; 611 		else  if((*si)&&(Get_tigbt <CON_TIGBT_90))  (*si) =0;
1927  02c6 1e13          	ldw	x,(OFST-8,sp)
1928  02c8 7d            	tnz	(x)
1929  02c9 2709          	jreq	L154
1931  02cb b67f          	ld	a,_Get_tigbt
1932  02cd a1f0          	cp	a,#240
1933  02cf 2403          	jruge	L154
1936  02d1 1e13          	ldw	x,(OFST-8,sp)
1937  02d3 7f            	clr	(x)
1938  02d4               L154:
1939                     ; 613 		if(Get_data ==DATA_PAN_NO)  
1941  02d4 b67c          	ld	a,_Get_data
1942  02d6 a165          	cp	a,#101
1943  02d8 265b          	jrne	L554
1944                     ; 615 			(*npan) =5;
1946  02da 1e0f          	ldw	x,(OFST-12,sp)
1947  02dc a605          	ld	a,#5
1948  02de f7            	ld	(x),a
1949                     ; 616 			if((*time)<3)  (*time)++;
1951  02df 1e17          	ldw	x,(OFST-4,sp)
1952  02e1 f6            	ld	a,(x)
1953  02e2 a103          	cp	a,#3
1954  02e4 2403          	jruge	L754
1957  02e6 1e17          	ldw	x,(OFST-4,sp)
1958  02e8 7c            	inc	(x)
1959  02e9               L754:
1960                     ; 617      	if((*time) >=60)  	
1962  02e9 1e17          	ldw	x,(OFST-4,sp)
1963  02eb f6            	ld	a,(x)
1964  02ec a13c          	cp	a,#60
1965  02ee 2545          	jrult	L554
1966                     ; 619      		(*time) =60;    	    
1968  02f0 1e17          	ldw	x,(OFST-4,sp)
1969  02f2 a63c          	ld	a,#60
1970  02f4 f7            	ld	(x),a
1971                     ; 620 				if(index <=1)
1973  02f5 7b1c          	ld	a,(OFST+1,sp)
1974  02f7 a102          	cp	a,#2
1975  02f9 2416          	jruge	L364
1976                     ; 622 					if(flex_L_bz) {if((zone_1_nopan_time >=60)&&(zone_2_nopan_time >=60)) result=1;}
1978  02fb 3d66          	tnz	_flex_L_bz
1979  02fd 2726          	jreq	L174
1982  02ff b677          	ld	a,_zone_1_nopan_time
1983  0301 a13c          	cp	a,#60
1984  0303 2520          	jrult	L174
1986  0305 b678          	ld	a,_zone_2_nopan_time
1987  0307 a13c          	cp	a,#60
1988  0309 251a          	jrult	L174
1991  030b a601          	ld	a,#1
1992  030d 6b1b          	ld	(OFST+0,sp),a
1993  030f 2014          	jra	L174
1994  0311               L364:
1995                     ; 626 					if(flex_R_bz) {if((zone_3_nopan_time >=60)&&(zone_4_nopan_time >=60)) result =1;} 
1997  0311 3d67          	tnz	_flex_R_bz
1998  0313 2710          	jreq	L174
2001  0315 b679          	ld	a,_zone_3_nopan_time
2002  0317 a13c          	cp	a,#60
2003  0319 250a          	jrult	L174
2005  031b b67a          	ld	a,_zone_4_nopan_time
2006  031d a13c          	cp	a,#60
2007  031f 2504          	jrult	L174
2010  0321 a601          	ld	a,#1
2011  0323 6b1b          	ld	(OFST+0,sp),a
2012  0325               L174:
2013                     ; 629 				if(result)  (*((u8*)(&zone_1_level +index))) =0;
2015  0325 0d1b          	tnz	(OFST+0,sp)
2016  0327 2706          	jreq	L774
2019  0329 7b1c          	ld	a,(OFST+1,sp)
2020  032b 5f            	clrw	x
2021  032c 97            	ld	xl,a
2022  032d 6fa7          	clr	(_zone_1_level,x)
2023  032f               L774:
2024                     ; 630 				flex_deal(index+1);	
2026  032f 7b1c          	ld	a,(OFST+1,sp)
2027  0331 4c            	inc	a
2028  0332 cd00ad        	call	_flex_deal
2030  0335               L554:
2031                     ; 633 		if(Get_data ==DATA_PAN_OK) (*time) =0;
2033  0335 b67c          	ld	a,_Get_data
2034  0337 a156          	cp	a,#86
2035  0339 2603          	jrne	L105
2038  033b 1e17          	ldw	x,(OFST-4,sp)
2039  033d 7f            	clr	(x)
2040  033e               L105:
2041                     ; 634 		if(Pause_bz) 	(*time) =0;			
2043  033e 3ddd          	tnz	_Pause_bz
2044  0340 2703          	jreq	L305
2047  0342 1e17          	ldw	x,(OFST-4,sp)
2048  0344 7f            	clr	(x)
2049  0345               L305:
2050                     ; 636 		if(Get_vol >CON_VOL_270V)    result=0xE1;
2052  0345 b67d          	ld	a,_Get_vol
2053  0347 a1b3          	cp	a,#179
2054  0349 2504          	jrult	L505
2057  034b a6e1          	ld	a,#225
2058  034d 6b1b          	ld	(OFST+0,sp),a
2059  034f               L505:
2060                     ; 637 		if(Get_vol <CON_VOL_160V)    result=0xE2;
2062  034f b67d          	ld	a,_Get_vol
2063  0351 a169          	cp	a,#105
2064  0353 2404          	jruge	L705
2067  0355 a6e2          	ld	a,#226
2068  0357 6b1b          	ld	(OFST+0,sp),a
2069  0359               L705:
2070                     ; 639 		if(Get_tigbt >CON_TIGBT_120) result=0xE5;       
2072  0359 b67f          	ld	a,_Get_tigbt
2073  035b a1f9          	cp	a,#249
2074  035d 2504          	jrult	L115
2077  035f a6e5          	ld	a,#229
2078  0361 6b1b          	ld	(OFST+0,sp),a
2079  0363               L115:
2080                     ; 640 		if(Get_tigbt >CON_NTC_SHORT) result=0xF9;       
2082  0363 b67f          	ld	a,_Get_tigbt
2083  0365 a1fb          	cp	a,#251
2084  0367 2504          	jrult	L315
2087  0369 a6f9          	ld	a,#249
2088  036b 6b1b          	ld	(OFST+0,sp),a
2089  036d               L315:
2090                     ; 641 		if(Get_tigbt <CON_NTC_OPEN)  result=0xFA; 
2092  036d b67f          	ld	a,_Get_tigbt
2093  036f a104          	cp	a,#4
2094  0371 2404          	jruge	L515
2097  0373 a6fa          	ld	a,#250
2098  0375 6b1b          	ld	(OFST+0,sp),a
2099  0377               L515:
2100                     ; 643 		if(Get_tmain >CON_TMAIN_220) result=0xE3;       
2102  0377 b680          	ld	a,_Get_tmain
2103  0379 a1f9          	cp	a,#249
2104  037b 2504          	jrult	L715
2107  037d a6e3          	ld	a,#227
2108  037f 6b1b          	ld	(OFST+0,sp),a
2109  0381               L715:
2110                     ; 644 		if(Get_tmain >CON_NTC_SHORT) result=0xF3;       
2112  0381 b680          	ld	a,_Get_tmain
2113  0383 a1fb          	cp	a,#251
2114  0385 2504          	jrult	L125
2117  0387 a6f3          	ld	a,#243
2118  0389 6b1b          	ld	(OFST+0,sp),a
2119  038b               L125:
2120                     ; 645 		if(Get_tmain <CON_NTC_OPEN)  result=0xF4; 
2122  038b b680          	ld	a,_Get_tmain
2123  038d a104          	cp	a,#4
2124  038f 2404          	jruge	L325
2127  0391 a6f4          	ld	a,#244
2128  0393 6b1b          	ld	(OFST+0,sp),a
2129  0395               L325:
2130                     ; 647 		if(result)  
2132  0395 0d1b          	tnz	(OFST+0,sp)
2133  0397 2713          	jreq	L525
2134                     ; 649 			if((*count)>3) (*err) =result;
2136  0399 1e15          	ldw	x,(OFST-6,sp)
2137  039b f6            	ld	a,(x)
2138  039c a104          	cp	a,#4
2139  039e 2507          	jrult	L725
2142  03a0 7b1b          	ld	a,(OFST+0,sp)
2143  03a2 1e11          	ldw	x,(OFST-10,sp)
2144  03a4 f7            	ld	(x),a
2146  03a5 200b          	jra	L335
2147  03a7               L725:
2148                     ; 650 			else (*count)++;
2150  03a7 1e15          	ldw	x,(OFST-6,sp)
2151  03a9 7c            	inc	(x)
2152  03aa 2006          	jra	L335
2153  03ac               L525:
2154                     ; 654 			(*count) =0;
2156  03ac 1e15          	ldw	x,(OFST-6,sp)
2157  03ae 7f            	clr	(x)
2158                     ; 655 			(*err) =0;
2160  03af 1e11          	ldw	x,(OFST-10,sp)
2161  03b1 7f            	clr	(x)
2162  03b2               L335:
2163                     ; 657 }
2166  03b2 5b1c          	addw	sp,#28
2167  03b4 81            	ret
2206                     ; 658 void set_off_power(u8 ADD)
2206                     ; 659 {
2207                     	switch	.text
2208  03b5               _set_off_power:
2212                     ; 660 	Add_Status =ADD|DATA_TURN_OFF;		
2214  03b5 b704          	ld	_Add_Status,a
2215                     ; 661 	cur_no =0x0A;				
2217  03b7 350a0006      	mov	_cur_no,#10
2218                     ; 662 	syn_delay =CON_0500;			
2220  03bb 35040005      	mov	_syn_delay,#4
2221                     ; 663 	max_pwm =CON_PWM_10us;	
2223  03bf 35b00007      	mov	_max_pwm,#176
2224                     ; 665 	comm_asm_deal(); 		
2226  03c3 cd0199        	call	_comm_asm_deal
2228                     ; 666 }
2231  03c6 81            	ret
2275                     ; 667 u8  zone_x_t_status(u8 level,u8 ton_js)
2275                     ; 668 {
2276                     	switch	.text
2277  03c7               _zone_x_t_status:
2279  03c7 89            	pushw	x
2280       00000000      OFST:	set	0
2283                     ; 669 	if(ton_js >= arr_tiao_on[level-1]) return(0);
2285  03c8 9e            	ld	a,xh
2286  03c9 5f            	clrw	x
2287  03ca 97            	ld	xl,a
2288  03cb 5a            	decw	x
2289  03cc d6001e        	ld	a,(_arr_tiao_on,x)
2290  03cf 1102          	cp	a,(OFST+2,sp)
2291  03d1 2203          	jrugt	L575
2294  03d3 4f            	clr	a
2296  03d4 2002          	jra	L04
2297  03d6               L575:
2298                     ; 670 	else  return(1);
2300  03d6 a601          	ld	a,#1
2302  03d8               L04:
2304  03d8 85            	popw	x
2305  03d9 81            	ret
2357                     ; 672 u8  syn_deal(u8 par,u8 pwm)
2357                     ; 673 {
2358                     	switch	.text
2359  03da               _syn_deal:
2361  03da 89            	pushw	x
2362  03db 88            	push	a
2363       00000001      OFST:	set	1
2366                     ; 674 	u8 data =CON_0750;				
2368  03dc a606          	ld	a,#6
2369  03de 6b01          	ld	(OFST+0,sp),a
2370                     ; 675 	if(pwm >CON_PWM_23us)  data =CON_0250;	//23us(72)
2372  03e0 9f            	ld	a,xl
2373  03e1 a149          	cp	a,#73
2374  03e3 2504          	jrult	L726
2377  03e5 a602          	ld	a,#2
2378  03e7 6b01          	ld	(OFST+0,sp),a
2379  03e9               L726:
2380                     ; 676 	if(pwm >CON_PWM_21us)  data =CON_0375;	//21us(88)
2382  03e9 7b03          	ld	a,(OFST+2,sp)
2383  03eb a159          	cp	a,#89
2384  03ed 2504          	jrult	L136
2387  03ef a603          	ld	a,#3
2388  03f1 6b01          	ld	(OFST+0,sp),a
2389  03f3               L136:
2390                     ; 677 	if(pwm >CON_PWM_19us)  data =CON_0500;	//19us(104)
2392  03f3 7b03          	ld	a,(OFST+2,sp)
2393  03f5 a169          	cp	a,#105
2394  03f7 2504          	jrult	L336
2397  03f9 a604          	ld	a,#4
2398  03fb 6b01          	ld	(OFST+0,sp),a
2399  03fd               L336:
2400                     ; 678 	if(pwm >CON_PWM_17us)  data =CON_0625;	//17us(120)
2402  03fd 7b03          	ld	a,(OFST+2,sp)
2403  03ff a179          	cp	a,#121
2404  0401 2504          	jrult	L536
2407  0403 a605          	ld	a,#5
2408  0405 6b01          	ld	(OFST+0,sp),a
2409  0407               L536:
2410                     ; 680 	if(data >0x30)   data =0x30;     				//00xx xxxx  low 6bits is active
2412  0407 7b01          	ld	a,(OFST+0,sp)
2413  0409 a131          	cp	a,#49
2414  040b 2504          	jrult	L736
2417  040d a630          	ld	a,#48
2418  040f 6b01          	ld	(OFST+0,sp),a
2419  0411               L736:
2420                     ; 681 	return(data);
2422  0411 7b01          	ld	a,(OFST+0,sp)
2425  0413 5b03          	addw	sp,#3
2426  0415 81            	ret
2615                     ; 683 void comm_deal(u8 index,u8 add,u8 level,u8 limit_t,u8 limit_a,u8 err)
2615                     ; 684 {
2616                     	switch	.text
2617  0416               _comm_deal:
2619  0416 89            	pushw	x
2620  0417 5210          	subw	sp,#16
2621       00000010      OFST:	set	16
2624                     ; 685   u8 temp_pwm =0;
2626  0419 0f0c          	clr	(OFST-4,sp)
2627                     ; 686   u8 heat_status =0;
2629  041b 7b0b          	ld	a,(OFST-5,sp)
2630  041d 97            	ld	xl,a
2631                     ; 688 	u8 *o =&oil_high_1 +index;
2633  041e a618          	ld	a,#high(_oil_high_1)
2634  0420 97            	ld	xl,a
2635  0421 a618          	ld	a,#low(_oil_high_1)
2636  0423 1b11          	add	a,(OFST+1,sp)
2637  0425 2401          	jrnc	L64
2638  0427 5c            	incw	x
2639  0428               L64:
2640  0428 02            	rlwa	x,a
2641  0429 1f07          	ldw	(OFST-9,sp),x
2642  042b 01            	rrwa	x,a
2643                     ; 689 	u8 *i =&igbt_high_1+index;
2645  042c a61c          	ld	a,#high(_igbt_high_1)
2646  042e 97            	ld	xl,a
2647  042f a61c          	ld	a,#low(_igbt_high_1)
2648  0431 1b11          	add	a,(OFST+1,sp)
2649  0433 2401          	jrnc	L05
2650  0435 5c            	incw	x
2651  0436               L05:
2652  0436 02            	rlwa	x,a
2653  0437 1f01          	ldw	(OFST-15,sp),x
2654  0439 01            	rrwa	x,a
2655                     ; 690 	u8 *t =&tiao_on_1+index;
2657  043a 7b11          	ld	a,(OFST+1,sp)
2658  043c abe2          	add	a,#_tiao_on_1
2659  043e 5f            	clrw	x
2660  043f 97            	ld	xl,a
2661  0440 1f0f          	ldw	(OFST-1,sp),x
2662                     ; 691 	u8 *pwm =&pwm_temp_1+index;
2664  0442 7b11          	ld	a,(OFST+1,sp)
2665  0444 abd4          	add	a,#_pwm_temp_1
2666  0446 5f            	clrw	x
2667  0447 97            	ld	xl,a
2668  0448 1f0d          	ldw	(OFST-3,sp),x
2669                     ; 692 	u8 *g =&ppg_1+index;
2671  044a 7b11          	ld	a,(OFST+1,sp)
2672  044c abcc          	add	a,#_ppg_1
2673  044e 5f            	clrw	x
2674  044f 97            	ld	xl,a
2675  0450 1f09          	ldw	(OFST-7,sp),x
2676                     ; 693 	u16 *tw =&work_1_time+index;
2678  0452 7b11          	ld	a,(OFST+1,sp)
2679  0454 5f            	clrw	x
2680  0455 97            	ld	xl,a
2681  0456 58            	sllw	x
2682  0457 01            	rrwa	x,a
2683  0458 ab9d          	add	a,#_work_1_time
2684  045a 2401          	jrnc	L25
2685  045c 5c            	incw	x
2686  045d               L25:
2687  045d 5f            	clrw	x
2688  045e 97            	ld	xl,a
2689  045f 1f03          	ldw	(OFST-13,sp),x
2690                     ; 694 	u8 *npan =&zone_1_nopan_wait+index;
2692  0461 a624          	ld	a,#high(_zone_1_nopan_wait)
2693  0463 97            	ld	xl,a
2694  0464 a624          	ld	a,#low(_zone_1_nopan_wait)
2695  0466 1b11          	add	a,(OFST+1,sp)
2696  0468 2401          	jrnc	L45
2697  046a 5c            	incw	x
2698  046b               L45:
2699  046b 02            	rlwa	x,a
2700  046c 1f05          	ldw	(OFST-11,sp),x
2701  046e 01            	rrwa	x,a
2702                     ; 696 	if((limit_time >2400)&&(level >7)&&(level <15)) level =7;  // if(limit_time >2400) level =5;
2704  046f bea5          	ldw	x,_limit_time
2705  0471 a30961        	cpw	x,#2401
2706  0474 2510          	jrult	L747
2708  0476 7b15          	ld	a,(OFST+5,sp)
2709  0478 a108          	cp	a,#8
2710  047a 250a          	jrult	L747
2712  047c 7b15          	ld	a,(OFST+5,sp)
2713  047e a10f          	cp	a,#15
2714  0480 2404          	jruge	L747
2717  0482 a607          	ld	a,#7
2718  0484 6b15          	ld	(OFST+5,sp),a
2719  0486               L747:
2720                     ; 698   if(err)  {set_off_power(add);(*t) =0;}	//issue of "E5->U->9"
2722  0486 0d18          	tnz	(OFST+8,sp)
2723  0488 270c          	jreq	L157
2726  048a 7b12          	ld	a,(OFST+2,sp)
2727  048c cd03b5        	call	_set_off_power
2731  048f 1e0f          	ldw	x,(OFST-1,sp)
2732  0491 7f            	clr	(x)
2734  0492 ac150815      	jpf	L357
2735  0496               L157:
2736                     ; 701 	if(level ==0)  set_off_power(add);
2738  0496 0d15          	tnz	(OFST+5,sp)
2739  0498 2609          	jrne	L557
2742  049a 7b12          	ld	a,(OFST+2,sp)
2743  049c cd03b5        	call	_set_off_power
2746  049f ac150815      	jpf	L357
2747  04a3               L557:
2748                     ; 704 	    Add_Status =add|DATA_TURN_ON|DATA_PULSE;	
2750  04a3 7b12          	ld	a,(OFST+2,sp)
2751  04a5 aa10          	or	a,#16
2752  04a7 aa07          	or	a,#7
2753  04a9 b704          	ld	_Add_Status,a
2754                     ; 707 	  	if(*o) level =(*o);
2756  04ab 1e07          	ldw	x,(OFST-9,sp)
2757  04ad 7d            	tnz	(x)
2758  04ae 2705          	jreq	L167
2761  04b0 1e07          	ldw	x,(OFST-9,sp)
2762  04b2 f6            	ld	a,(x)
2763  04b3 6b15          	ld	(OFST+5,sp),a
2764  04b5               L167:
2765                     ; 708 	  	if(*i) level =3;
2767  04b5 1e01          	ldw	x,(OFST-15,sp)
2768  04b7 7d            	tnz	(x)
2769  04b8 2704          	jreq	L367
2772  04ba a603          	ld	a,#3
2773  04bc 6b15          	ld	(OFST+5,sp),a
2774  04be               L367:
2775                     ; 710 	    heat_status =1;
2777  04be a601          	ld	a,#1
2778  04c0 6b0b          	ld	(OFST-5,sp),a
2779                     ; 711 	  	if(level <9)      
2781  04c2 7b15          	ld	a,(OFST+5,sp)
2782  04c4 a109          	cp	a,#9
2783  04c6 2503          	jrult	L65
2784  04c8 cc06fe        	jp	L567
2785  04cb               L65:
2786                     ; 713 		   	(*t)++;  
2788  04cb 1e0f          	ldw	x,(OFST-1,sp)
2789  04cd 7c            	inc	(x)
2790                     ; 714 		  	heat_status =zone_x_t_status(level,(*t)); 
2792  04ce 1e0f          	ldw	x,(OFST-1,sp)
2793  04d0 f6            	ld	a,(x)
2794  04d1 97            	ld	xl,a
2795  04d2 7b15          	ld	a,(OFST+5,sp)
2796  04d4 95            	ld	xh,a
2797  04d5 cd03c7        	call	_zone_x_t_status
2799  04d8 6b0b          	ld	(OFST-5,sp),a
2800                     ; 715 		  	if(index ==0) 	//180mm Fang big   67uH+11mm distance
2802  04da 0d11          	tnz	(OFST+1,sp)
2803  04dc 2703          	jreq	L06
2804  04de cc0561        	jp	L767
2805  04e1               L06:
2806                     ; 717 				if(level ==1)  {if((*t)>=44) (*t) =0;}    //  50w
2808  04e1 7b15          	ld	a,(OFST+5,sp)
2809  04e3 a101          	cp	a,#1
2810  04e5 260a          	jrne	L177
2813  04e7 1e0f          	ldw	x,(OFST-1,sp)
2814  04e9 f6            	ld	a,(x)
2815  04ea a12c          	cp	a,#44
2816  04ec 2503          	jrult	L177
2819  04ee 1e0f          	ldw	x,(OFST-1,sp)
2820  04f0 7f            	clr	(x)
2821  04f1               L177:
2822                     ; 718 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
2824  04f1 7b15          	ld	a,(OFST+5,sp)
2825  04f3 a102          	cp	a,#2
2826  04f5 260a          	jrne	L577
2829  04f7 1e0f          	ldw	x,(OFST-1,sp)
2830  04f9 f6            	ld	a,(x)
2831  04fa a11e          	cp	a,#30
2832  04fc 2503          	jrult	L577
2835  04fe 1e0f          	ldw	x,(OFST-1,sp)
2836  0500 7f            	clr	(x)
2837  0501               L577:
2838                     ; 719 				if(level ==3)  {if((*t)>=25) (*t) =0;}    // 200w
2840  0501 7b15          	ld	a,(OFST+5,sp)
2841  0503 a103          	cp	a,#3
2842  0505 260a          	jrne	L1001
2845  0507 1e0f          	ldw	x,(OFST-1,sp)
2846  0509 f6            	ld	a,(x)
2847  050a a119          	cp	a,#25
2848  050c 2503          	jrult	L1001
2851  050e 1e0f          	ldw	x,(OFST-1,sp)
2852  0510 7f            	clr	(x)
2853  0511               L1001:
2854                     ; 720 				if(level ==4)  {if((*t)>=18) (*t) =0;}    // 300w
2856  0511 7b15          	ld	a,(OFST+5,sp)
2857  0513 a104          	cp	a,#4
2858  0515 260a          	jrne	L5001
2861  0517 1e0f          	ldw	x,(OFST-1,sp)
2862  0519 f6            	ld	a,(x)
2863  051a a112          	cp	a,#18
2864  051c 2503          	jrult	L5001
2867  051e 1e0f          	ldw	x,(OFST-1,sp)
2868  0520 7f            	clr	(x)
2869  0521               L5001:
2870                     ; 721 				if(level ==5)  {if((*t)>=13) (*t) =0;}    // 600w
2872  0521 7b15          	ld	a,(OFST+5,sp)
2873  0523 a105          	cp	a,#5
2874  0525 260a          	jrne	L1101
2877  0527 1e0f          	ldw	x,(OFST-1,sp)
2878  0529 f6            	ld	a,(x)
2879  052a a10d          	cp	a,#13
2880  052c 2503          	jrult	L1101
2883  052e 1e0f          	ldw	x,(OFST-1,sp)
2884  0530 7f            	clr	(x)
2885  0531               L1101:
2886                     ; 722 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
2888  0531 7b15          	ld	a,(OFST+5,sp)
2889  0533 a106          	cp	a,#6
2890  0535 260a          	jrne	L5101
2893  0537 1e0f          	ldw	x,(OFST-1,sp)
2894  0539 f6            	ld	a,(x)
2895  053a a10b          	cp	a,#11
2896  053c 2503          	jrult	L5101
2899  053e 1e0f          	ldw	x,(OFST-1,sp)
2900  0540 7f            	clr	(x)
2901  0541               L5101:
2902                     ; 723 				if(level ==7)  {if((*t)>=11) (*t) =0;}
2904  0541 7b15          	ld	a,(OFST+5,sp)
2905  0543 a107          	cp	a,#7
2906  0545 260a          	jrne	L1201
2909  0547 1e0f          	ldw	x,(OFST-1,sp)
2910  0549 f6            	ld	a,(x)
2911  054a a10b          	cp	a,#11
2912  054c 2503          	jrult	L1201
2915  054e 1e0f          	ldw	x,(OFST-1,sp)
2916  0550 7f            	clr	(x)
2917  0551               L1201:
2918                     ; 724 				if(level ==8)  {if((*t)>=11) (*t) =0;}
2920  0551 7b15          	ld	a,(OFST+5,sp)
2921  0553 a108          	cp	a,#8
2922  0555 260a          	jrne	L767
2925  0557 1e0f          	ldw	x,(OFST-1,sp)
2926  0559 f6            	ld	a,(x)
2927  055a a10b          	cp	a,#11
2928  055c 2503          	jrult	L767
2931  055e 1e0f          	ldw	x,(OFST-1,sp)
2932  0560 7f            	clr	(x)
2933  0561               L767:
2934                     ; 726 			if(index ==1)	//180mm Fang small 90uH+11mm distance
2936  0561 7b11          	ld	a,(OFST+1,sp)
2937  0563 a101          	cp	a,#1
2938  0565 2703          	jreq	L26
2939  0567 cc05ea        	jp	L1301
2940  056a               L26:
2941                     ; 728 				if(level ==1)  {if((*t)>=46) (*t) =0;}    //  50w
2943  056a 7b15          	ld	a,(OFST+5,sp)
2944  056c a101          	cp	a,#1
2945  056e 260a          	jrne	L3301
2948  0570 1e0f          	ldw	x,(OFST-1,sp)
2949  0572 f6            	ld	a,(x)
2950  0573 a12e          	cp	a,#46
2951  0575 2503          	jrult	L3301
2954  0577 1e0f          	ldw	x,(OFST-1,sp)
2955  0579 7f            	clr	(x)
2956  057a               L3301:
2957                     ; 729 				if(level ==2)  {if((*t)>=26) (*t) =0;}    // 100w
2959  057a 7b15          	ld	a,(OFST+5,sp)
2960  057c a102          	cp	a,#2
2961  057e 260a          	jrne	L7301
2964  0580 1e0f          	ldw	x,(OFST-1,sp)
2965  0582 f6            	ld	a,(x)
2966  0583 a11a          	cp	a,#26
2967  0585 2503          	jrult	L7301
2970  0587 1e0f          	ldw	x,(OFST-1,sp)
2971  0589 7f            	clr	(x)
2972  058a               L7301:
2973                     ; 730 				if(level ==3)  {if((*t)>=17) (*t) =0;}    // 200w
2975  058a 7b15          	ld	a,(OFST+5,sp)
2976  058c a103          	cp	a,#3
2977  058e 260a          	jrne	L3401
2980  0590 1e0f          	ldw	x,(OFST-1,sp)
2981  0592 f6            	ld	a,(x)
2982  0593 a111          	cp	a,#17
2983  0595 2503          	jrult	L3401
2986  0597 1e0f          	ldw	x,(OFST-1,sp)
2987  0599 7f            	clr	(x)
2988  059a               L3401:
2989                     ; 731 				if(level ==4)  {if((*t)>=17) (*t) =0;}    // 300w
2991  059a 7b15          	ld	a,(OFST+5,sp)
2992  059c a104          	cp	a,#4
2993  059e 260a          	jrne	L7401
2996  05a0 1e0f          	ldw	x,(OFST-1,sp)
2997  05a2 f6            	ld	a,(x)
2998  05a3 a111          	cp	a,#17
2999  05a5 2503          	jrult	L7401
3002  05a7 1e0f          	ldw	x,(OFST-1,sp)
3003  05a9 7f            	clr	(x)
3004  05aa               L7401:
3005                     ; 732 				if(level ==5)  {if((*t)>=10) (*t) =0;}    // 600w
3007  05aa 7b15          	ld	a,(OFST+5,sp)
3008  05ac a105          	cp	a,#5
3009  05ae 260a          	jrne	L3501
3012  05b0 1e0f          	ldw	x,(OFST-1,sp)
3013  05b2 f6            	ld	a,(x)
3014  05b3 a10a          	cp	a,#10
3015  05b5 2503          	jrult	L3501
3018  05b7 1e0f          	ldw	x,(OFST-1,sp)
3019  05b9 7f            	clr	(x)
3020  05ba               L3501:
3021                     ; 733 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
3023  05ba 7b15          	ld	a,(OFST+5,sp)
3024  05bc a106          	cp	a,#6
3025  05be 260a          	jrne	L7501
3028  05c0 1e0f          	ldw	x,(OFST-1,sp)
3029  05c2 f6            	ld	a,(x)
3030  05c3 a10b          	cp	a,#11
3031  05c5 2503          	jrult	L7501
3034  05c7 1e0f          	ldw	x,(OFST-1,sp)
3035  05c9 7f            	clr	(x)
3036  05ca               L7501:
3037                     ; 734 				if(level ==7)  {if((*t)>=11) (*t) =0;}
3039  05ca 7b15          	ld	a,(OFST+5,sp)
3040  05cc a107          	cp	a,#7
3041  05ce 260a          	jrne	L3601
3044  05d0 1e0f          	ldw	x,(OFST-1,sp)
3045  05d2 f6            	ld	a,(x)
3046  05d3 a10b          	cp	a,#11
3047  05d5 2503          	jrult	L3601
3050  05d7 1e0f          	ldw	x,(OFST-1,sp)
3051  05d9 7f            	clr	(x)
3052  05da               L3601:
3053                     ; 735 				if(level ==8)  {if((*t)>=11) (*t) =0;}
3055  05da 7b15          	ld	a,(OFST+5,sp)
3056  05dc a108          	cp	a,#8
3057  05de 260a          	jrne	L1301
3060  05e0 1e0f          	ldw	x,(OFST-1,sp)
3061  05e2 f6            	ld	a,(x)
3062  05e3 a10b          	cp	a,#11
3063  05e5 2503          	jrult	L1301
3066  05e7 1e0f          	ldw	x,(OFST-1,sp)
3067  05e9 7f            	clr	(x)
3068  05ea               L1301:
3069                     ; 737 			if(index ==2)	//180mm
3071  05ea 7b11          	ld	a,(OFST+1,sp)
3072  05ec a102          	cp	a,#2
3073  05ee 2703          	jreq	L46
3074  05f0 cc0673        	jp	L3701
3075  05f3               L46:
3076                     ; 739 				if(level ==1)  {if((*t)>=42) (*t) =0;}    //  50w
3078  05f3 7b15          	ld	a,(OFST+5,sp)
3079  05f5 a101          	cp	a,#1
3080  05f7 260a          	jrne	L5701
3083  05f9 1e0f          	ldw	x,(OFST-1,sp)
3084  05fb f6            	ld	a,(x)
3085  05fc a12a          	cp	a,#42
3086  05fe 2503          	jrult	L5701
3089  0600 1e0f          	ldw	x,(OFST-1,sp)
3090  0602 7f            	clr	(x)
3091  0603               L5701:
3092                     ; 740 				if(level ==2)  {if((*t)>=35) (*t) =0;}    // 100w
3094  0603 7b15          	ld	a,(OFST+5,sp)
3095  0605 a102          	cp	a,#2
3096  0607 260a          	jrne	L1011
3099  0609 1e0f          	ldw	x,(OFST-1,sp)
3100  060b f6            	ld	a,(x)
3101  060c a123          	cp	a,#35
3102  060e 2503          	jrult	L1011
3105  0610 1e0f          	ldw	x,(OFST-1,sp)
3106  0612 7f            	clr	(x)
3107  0613               L1011:
3108                     ; 741 				if(level ==3)  {if((*t)>=26) (*t) =0;}    // 200w
3110  0613 7b15          	ld	a,(OFST+5,sp)
3111  0615 a103          	cp	a,#3
3112  0617 260a          	jrne	L5011
3115  0619 1e0f          	ldw	x,(OFST-1,sp)
3116  061b f6            	ld	a,(x)
3117  061c a11a          	cp	a,#26
3118  061e 2503          	jrult	L5011
3121  0620 1e0f          	ldw	x,(OFST-1,sp)
3122  0622 7f            	clr	(x)
3123  0623               L5011:
3124                     ; 742 				if(level ==4)  {if((*t)>=23) (*t) =0;}    // 300w
3126  0623 7b15          	ld	a,(OFST+5,sp)
3127  0625 a104          	cp	a,#4
3128  0627 260a          	jrne	L1111
3131  0629 1e0f          	ldw	x,(OFST-1,sp)
3132  062b f6            	ld	a,(x)
3133  062c a117          	cp	a,#23
3134  062e 2503          	jrult	L1111
3137  0630 1e0f          	ldw	x,(OFST-1,sp)
3138  0632 7f            	clr	(x)
3139  0633               L1111:
3140                     ; 743 				if(level ==5)  {if((*t)>=13) (*t) =0;}    // 600w
3142  0633 7b15          	ld	a,(OFST+5,sp)
3143  0635 a105          	cp	a,#5
3144  0637 260a          	jrne	L5111
3147  0639 1e0f          	ldw	x,(OFST-1,sp)
3148  063b f6            	ld	a,(x)
3149  063c a10d          	cp	a,#13
3150  063e 2503          	jrult	L5111
3153  0640 1e0f          	ldw	x,(OFST-1,sp)
3154  0642 7f            	clr	(x)
3155  0643               L5111:
3156                     ; 744 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
3158  0643 7b15          	ld	a,(OFST+5,sp)
3159  0645 a106          	cp	a,#6
3160  0647 260a          	jrne	L1211
3163  0649 1e0f          	ldw	x,(OFST-1,sp)
3164  064b f6            	ld	a,(x)
3165  064c a10b          	cp	a,#11
3166  064e 2503          	jrult	L1211
3169  0650 1e0f          	ldw	x,(OFST-1,sp)
3170  0652 7f            	clr	(x)
3171  0653               L1211:
3172                     ; 745 				if(level ==7)  {if((*t)>=11) (*t) =0;}
3174  0653 7b15          	ld	a,(OFST+5,sp)
3175  0655 a107          	cp	a,#7
3176  0657 260a          	jrne	L5211
3179  0659 1e0f          	ldw	x,(OFST-1,sp)
3180  065b f6            	ld	a,(x)
3181  065c a10b          	cp	a,#11
3182  065e 2503          	jrult	L5211
3185  0660 1e0f          	ldw	x,(OFST-1,sp)
3186  0662 7f            	clr	(x)
3187  0663               L5211:
3188                     ; 746 				if(level ==8)  {if((*t)>=11) (*t) =0;}
3190  0663 7b15          	ld	a,(OFST+5,sp)
3191  0665 a108          	cp	a,#8
3192  0667 260a          	jrne	L3701
3195  0669 1e0f          	ldw	x,(OFST-1,sp)
3196  066b f6            	ld	a,(x)
3197  066c a10b          	cp	a,#11
3198  066e 2503          	jrult	L3701
3201  0670 1e0f          	ldw	x,(OFST-1,sp)
3202  0672 7f            	clr	(x)
3203  0673               L3701:
3204                     ; 748 			if(index ==3)	//180mm small
3206  0673 7b11          	ld	a,(OFST+1,sp)
3207  0675 a103          	cp	a,#3
3208  0677 2703          	jreq	L66
3209  0679 cc0701        	jp	L7711
3210  067c               L66:
3211                     ; 750 				if(level ==1)  {if((*t)>=46) (*t) =0;}    //  50w
3213  067c 7b15          	ld	a,(OFST+5,sp)
3214  067e a101          	cp	a,#1
3215  0680 260a          	jrne	L7311
3218  0682 1e0f          	ldw	x,(OFST-1,sp)
3219  0684 f6            	ld	a,(x)
3220  0685 a12e          	cp	a,#46
3221  0687 2503          	jrult	L7311
3224  0689 1e0f          	ldw	x,(OFST-1,sp)
3225  068b 7f            	clr	(x)
3226  068c               L7311:
3227                     ; 751 				if(level ==2)  {if((*t)>=30) (*t) =0;}    // 100w
3229  068c 7b15          	ld	a,(OFST+5,sp)
3230  068e a102          	cp	a,#2
3231  0690 260a          	jrne	L3411
3234  0692 1e0f          	ldw	x,(OFST-1,sp)
3235  0694 f6            	ld	a,(x)
3236  0695 a11e          	cp	a,#30
3237  0697 2503          	jrult	L3411
3240  0699 1e0f          	ldw	x,(OFST-1,sp)
3241  069b 7f            	clr	(x)
3242  069c               L3411:
3243                     ; 752 				if(level ==3)  {if((*t)>=22) (*t) =0;}    // 200w
3245  069c 7b15          	ld	a,(OFST+5,sp)
3246  069e a103          	cp	a,#3
3247  06a0 260a          	jrne	L7411
3250  06a2 1e0f          	ldw	x,(OFST-1,sp)
3251  06a4 f6            	ld	a,(x)
3252  06a5 a116          	cp	a,#22
3253  06a7 2503          	jrult	L7411
3256  06a9 1e0f          	ldw	x,(OFST-1,sp)
3257  06ab 7f            	clr	(x)
3258  06ac               L7411:
3259                     ; 753 				if(level ==4)  {if((*t)>=24) (*t) =0;}    // 300w
3261  06ac 7b15          	ld	a,(OFST+5,sp)
3262  06ae a104          	cp	a,#4
3263  06b0 260a          	jrne	L3511
3266  06b2 1e0f          	ldw	x,(OFST-1,sp)
3267  06b4 f6            	ld	a,(x)
3268  06b5 a118          	cp	a,#24
3269  06b7 2503          	jrult	L3511
3272  06b9 1e0f          	ldw	x,(OFST-1,sp)
3273  06bb 7f            	clr	(x)
3274  06bc               L3511:
3275                     ; 754 				if(level ==5)  {if((*t)>=14) (*t) =0;}    // 600w
3277  06bc 7b15          	ld	a,(OFST+5,sp)
3278  06be a105          	cp	a,#5
3279  06c0 260a          	jrne	L7511
3282  06c2 1e0f          	ldw	x,(OFST-1,sp)
3283  06c4 f6            	ld	a,(x)
3284  06c5 a10e          	cp	a,#14
3285  06c7 2503          	jrult	L7511
3288  06c9 1e0f          	ldw	x,(OFST-1,sp)
3289  06cb 7f            	clr	(x)
3290  06cc               L7511:
3291                     ; 755 				if(level ==6)  {if((*t)>=11) (*t) =0;}    //1000w
3293  06cc 7b15          	ld	a,(OFST+5,sp)
3294  06ce a106          	cp	a,#6
3295  06d0 260a          	jrne	L3611
3298  06d2 1e0f          	ldw	x,(OFST-1,sp)
3299  06d4 f6            	ld	a,(x)
3300  06d5 a10b          	cp	a,#11
3301  06d7 2503          	jrult	L3611
3304  06d9 1e0f          	ldw	x,(OFST-1,sp)
3305  06db 7f            	clr	(x)
3306  06dc               L3611:
3307                     ; 756 				if(level ==7)  {if((*t)>=11) (*t) =0;}
3309  06dc 7b15          	ld	a,(OFST+5,sp)
3310  06de a107          	cp	a,#7
3311  06e0 260a          	jrne	L7611
3314  06e2 1e0f          	ldw	x,(OFST-1,sp)
3315  06e4 f6            	ld	a,(x)
3316  06e5 a10b          	cp	a,#11
3317  06e7 2503          	jrult	L7611
3320  06e9 1e0f          	ldw	x,(OFST-1,sp)
3321  06eb 7f            	clr	(x)
3322  06ec               L7611:
3323                     ; 757 				if(level ==8)  {if((*t)>=11) (*t) =0;}
3325  06ec 7b15          	ld	a,(OFST+5,sp)
3326  06ee a108          	cp	a,#8
3327  06f0 260f          	jrne	L7711
3330  06f2 1e0f          	ldw	x,(OFST-1,sp)
3331  06f4 f6            	ld	a,(x)
3332  06f5 a10b          	cp	a,#11
3333  06f7 2508          	jrult	L7711
3336  06f9 1e0f          	ldw	x,(OFST-1,sp)
3337  06fb 7f            	clr	(x)
3338  06fc 2003          	jra	L7711
3339  06fe               L567:
3340                     ; 760 	  	else  (*t) =0;
3342  06fe 1e0f          	ldw	x,(OFST-1,sp)
3343  0700 7f            	clr	(x)
3344  0701               L7711:
3345                     ; 762 	    if(heat_status ==0) set_off_power(add);
3347  0701 0d0b          	tnz	(OFST-5,sp)
3348  0703 2609          	jrne	L1021
3351  0705 7b12          	ld	a,(OFST+2,sp)
3352  0707 cd03b5        	call	_set_off_power
3355  070a ac150815      	jpf	L357
3356  070e               L1021:
3357                     ; 765 		    index++;
3359  070e 0c11          	inc	(OFST+1,sp)
3360                     ; 767 		    if(level >=9)
3362  0710 7b15          	ld	a,(OFST+5,sp)
3363  0712 a109          	cp	a,#9
3364  0714 2403          	jruge	L07
3365  0716 cc07a5        	jp	L5021
3366  0719               L07:
3367                     ; 769 		      	if(index ==1)		
3369  0719 7b11          	ld	a,(OFST+1,sp)
3370  071b a101          	cp	a,#1
3371  071d 260c          	jrne	L7021
3372                     ; 771 		     		temp_pwm =arr_1_pow[level-9];  
3374  071f 7b15          	ld	a,(OFST+5,sp)
3375  0721 5f            	clrw	x
3376  0722 97            	ld	xl,a
3377  0723 1d0009        	subw	x,#9
3378  0726 d60032        	ld	a,(_arr_1_pow,x)
3379  0729 6b0c          	ld	(OFST-4,sp),a
3380  072b               L7021:
3381                     ; 774 			  	if(index ==2)		
3383  072b 7b11          	ld	a,(OFST+1,sp)
3384  072d a102          	cp	a,#2
3385  072f 260c          	jrne	L1121
3386                     ; 776 						temp_pwm =arr_2_pow[level-9];
3388  0731 7b15          	ld	a,(OFST+5,sp)
3389  0733 5f            	clrw	x
3390  0734 97            	ld	xl,a
3391  0735 1d0009        	subw	x,#9
3392  0738 d60040        	ld	a,(_arr_2_pow,x)
3393  073b 6b0c          	ld	(OFST-4,sp),a
3394  073d               L1121:
3395                     ; 779 			  	if(index ==3)		
3397  073d 7b11          	ld	a,(OFST+1,sp)
3398  073f a103          	cp	a,#3
3399  0741 260c          	jrne	L3121
3400                     ; 781 						temp_pwm =arr_3_pow[level-9];
3402  0743 7b15          	ld	a,(OFST+5,sp)
3403  0745 5f            	clrw	x
3404  0746 97            	ld	xl,a
3405  0747 1d0009        	subw	x,#9
3406  074a d60039        	ld	a,(_arr_3_pow,x)
3407  074d 6b0c          	ld	(OFST-4,sp),a
3408  074f               L3121:
3409                     ; 790 		      	if((limit_t)&&(temp_pwm > limit_t))      temp_pwm =limit_t;
3411  074f 0d16          	tnz	(OFST+6,sp)
3412  0751 270a          	jreq	L5121
3414  0753 7b0c          	ld	a,(OFST-4,sp)
3415  0755 1116          	cp	a,(OFST+6,sp)
3416  0757 2304          	jrule	L5121
3419  0759 7b16          	ld	a,(OFST+6,sp)
3420  075b 6b0c          	ld	(OFST-4,sp),a
3421  075d               L5121:
3422                     ; 791 				if((limit_a)&&(temp_pwm > limit_a))	     temp_pwm =limit_a;
3424  075d 0d17          	tnz	(OFST+7,sp)
3425  075f 270a          	jreq	L7121
3427  0761 7b0c          	ld	a,(OFST-4,sp)
3428  0763 1117          	cp	a,(OFST+7,sp)
3429  0765 2304          	jrule	L7121
3432  0767 7b17          	ld	a,(OFST+7,sp)
3433  0769 6b0c          	ld	(OFST-4,sp),a
3434  076b               L7121:
3435                     ; 792 				(*pwm) =temp_pwm;
3437  076b 7b0c          	ld	a,(OFST-4,sp)
3438  076d 1e0d          	ldw	x,(OFST-3,sp)
3439  076f f7            	ld	(x),a
3440                     ; 793 				cur_no =zone_x_cur_no_set(index,(*g));
3442  0770 1e09          	ldw	x,(OFST-7,sp)
3443  0772 f6            	ld	a,(x)
3444  0773 97            	ld	xl,a
3445  0774 7b11          	ld	a,(OFST+1,sp)
3446  0776 95            	ld	xh,a
3447  0777 cd0000        	call	_zone_x_cur_no_set
3449  077a b706          	ld	_cur_no,a
3450                     ; 798 				if(((*tw)<5)||(*npan))  
3452  077c 1e03          	ldw	x,(OFST-13,sp)
3453  077e 9093          	ldw	y,x
3454  0780 90fe          	ldw	y,(y)
3455  0782 90a30005      	cpw	y,#5
3456  0786 2505          	jrult	L3221
3458  0788 1e05          	ldw	x,(OFST-11,sp)
3459  078a 7d            	tnz	(x)
3460  078b 275c          	jreq	L1321
3461  078d               L3221:
3462                     ; 800 		      	cur_no =0x10;
3464  078d 35100006      	mov	_cur_no,#16
3465                     ; 801 			      if(index%2)  (*pwm) =70;				
3467  0791 7b11          	ld	a,(OFST+1,sp)
3468  0793 a501          	bcp	a,#1
3469  0795 2707          	jreq	L5221
3472  0797 1e0d          	ldw	x,(OFST-3,sp)
3473  0799 a646          	ld	a,#70
3474  079b f7            	ld	(x),a
3476  079c 204b          	jra	L1321
3477  079e               L5221:
3478                     ; 802 			      else   (*pwm) =115;
3480  079e 1e0d          	ldw	x,(OFST-3,sp)
3481  07a0 a673          	ld	a,#115
3482  07a2 f7            	ld	(x),a
3483  07a3 2044          	jra	L1321
3484  07a5               L5021:
3485                     ; 811 		    	(*pwm) =arr_tiao_180_pwm[level-1];
3487  07a5 7b15          	ld	a,(OFST+5,sp)
3488  07a7 5f            	clrw	x
3489  07a8 97            	ld	xl,a
3490  07a9 5a            	decw	x
3491  07aa d60026        	ld	a,(_arr_tiao_180_pwm,x)
3492  07ad 1e0d          	ldw	x,(OFST-3,sp)
3493  07af f7            	ld	(x),a
3494                     ; 813 		    	if(index<3)
3496  07b0 7b11          	ld	a,(OFST+1,sp)
3497  07b2 a103          	cp	a,#3
3498  07b4 241e          	jruge	L3321
3499                     ; 815 		    			if(level ==2)  (*pwm) =erp_pwm[index-1];
3501  07b6 7b15          	ld	a,(OFST+5,sp)
3502  07b8 a102          	cp	a,#2
3503  07ba 260b          	jrne	L5321
3506  07bc 7b11          	ld	a,(OFST+1,sp)
3507  07be 5f            	clrw	x
3508  07bf 97            	ld	xl,a
3509  07c0 5a            	decw	x
3510  07c1 d6002e        	ld	a,(_erp_pwm,x)
3511  07c4 1e0d          	ldw	x,(OFST-3,sp)
3512  07c6 f7            	ld	(x),a
3513  07c7               L5321:
3514                     ; 816 		    			if(level ==8)  (*pwm) =erp_pwm[0];
3516  07c7 7b15          	ld	a,(OFST+5,sp)
3517  07c9 a108          	cp	a,#8
3518  07cb 2618          	jrne	L1421
3521  07cd 1e0d          	ldw	x,(OFST-3,sp)
3522  07cf a6c0          	ld	a,#192
3523  07d1 f7            	ld	(x),a
3524  07d2 2011          	jra	L1421
3525  07d4               L3321:
3526                     ; 820 						if(level ==4)  (*pwm) =erp_pwm[index-1];
3528  07d4 7b15          	ld	a,(OFST+5,sp)
3529  07d6 a104          	cp	a,#4
3530  07d8 260b          	jrne	L1421
3533  07da 7b11          	ld	a,(OFST+1,sp)
3534  07dc 5f            	clrw	x
3535  07dd 97            	ld	xl,a
3536  07de 5a            	decw	x
3537  07df d6002e        	ld	a,(_erp_pwm,x)
3538  07e2 1e0d          	ldw	x,(OFST-3,sp)
3539  07e4 f7            	ld	(x),a
3540  07e5               L1421:
3541                     ; 823 		    	cur_no =0x10;
3543  07e5 35100006      	mov	_cur_no,#16
3544  07e9               L1321:
3545                     ; 825 		    if((index ==1)||(index ==3))  cur_no =cur_no/2;		//1# 3# boost double igbt & current
3547  07e9 7b11          	ld	a,(OFST+1,sp)
3548  07eb a101          	cp	a,#1
3549  07ed 2706          	jreq	L7421
3551  07ef 7b11          	ld	a,(OFST+1,sp)
3552  07f1 a103          	cp	a,#3
3553  07f3 2602          	jrne	L5421
3554  07f5               L7421:
3557  07f5 3406          	srl	_cur_no
3558  07f7               L5421:
3559                     ; 844 			  max_pwm =(*pwm);
3561  07f7 1e0d          	ldw	x,(OFST-3,sp)
3562  07f9 f6            	ld	a,(x)
3563  07fa b707          	ld	_max_pwm,a
3564                     ; 847 				syn_delay=syn_deal(index,(*g));
3566  07fc 1e09          	ldw	x,(OFST-7,sp)
3567  07fe f6            	ld	a,(x)
3568  07ff 97            	ld	xl,a
3569  0800 7b11          	ld	a,(OFST+1,sp)
3570  0802 95            	ld	xh,a
3571  0803 cd03da        	call	_syn_deal
3573  0806 b705          	ld	_syn_delay,a
3574                     ; 850 				if(level <9)  syn_delay |=0x40;			//bit7 ->1 -> PWM direct setting mode
3576  0808 7b15          	ld	a,(OFST+5,sp)
3577  080a a109          	cp	a,#9
3578  080c 2404          	jruge	L1521
3581  080e 721c0005      	bset	_syn_delay,#6
3582  0812               L1521:
3583                     ; 852 				comm_asm_deal();		
3585  0812 cd0199        	call	_comm_asm_deal
3587  0815               L357:
3588                     ; 856 } 
3591  0815 5b12          	addw	sp,#18
3592  0817 81            	ret
3667                     ; 857 void Power_off_deal(void)
3667                     ; 858 {
3668                     	switch	.text
3669  0818               _Power_off_deal:
3673                     ; 859  	Power_on_bz =FALSE;
3675  0818 3f20          	clr	_Power_on_bz
3676                     ; 861 	on1_bz =FALSE;
3678  081a 3f21          	clr	_on1_bz
3679                     ; 862 	on2_bz =FALSE;
3681  081c 3f22          	clr	_on2_bz
3682                     ; 863 	on3_bz =FALSE;
3684  081e 3f23          	clr	_on3_bz
3685                     ; 864 	on4_bz =FALSE;
3687  0820 3f24          	clr	_on4_bz
3688                     ; 866 	zone1_step =0;
3690  0822 3f45          	clr	_zone1_step
3691                     ; 867 	zone2_step =0;
3693  0824 3f46          	clr	_zone2_step
3694                     ; 868 	zone3_step =0;
3696  0826 3f47          	clr	_zone3_step
3697                     ; 869 	zone4_step =0;
3699  0828 3f48          	clr	_zone4_step
3700                     ; 872  	timer_status =0;
3702  082a 3f49          	clr	_timer_status
3703                     ; 873  	time_flash_count1 =0;
3705  082c 3f4a          	clr	_time_flash_count1
3706                     ; 874  	time_flash_count2 =0;
3708  082e 3f4b          	clr	_time_flash_count2
3709                     ; 875  	time_flash_count3 =0;
3711  0830 3f4c          	clr	_time_flash_count3
3712                     ; 876  	time_flash_count4 =0;
3714  0832 3f4d          	clr	_time_flash_count4
3715                     ; 878  	zone_flash_count1 =0;
3717  0834 3f3b          	clr	_zone_flash_count1
3718                     ; 879  	zone_flash_count2 =0;
3720  0836 3f3c          	clr	_zone_flash_count2
3721                     ; 880  	zone_flash_count3 =0;
3723  0838 3f3d          	clr	_zone_flash_count3
3724                     ; 881  	zone_flash_count4 =0;
3726  083a 3f3e          	clr	_zone_flash_count4
3727                     ; 883  	boost_status =0;
3729  083c 3f8b          	clr	_boost_status
3730                     ; 884  	boost_time_1 =0;
3732  083e 5f            	clrw	x
3733  083f bf52          	ldw	_boost_time_1,x
3734                     ; 885  	boost_time_2 =0;
3736  0841 5f            	clrw	x
3737  0842 bf54          	ldw	_boost_time_2,x
3738                     ; 886  	boost_time_3 =0;
3740  0844 5f            	clrw	x
3741  0845 bf56          	ldw	_boost_time_3,x
3742                     ; 887  	boost_time_4 =0;
3744  0847 5f            	clrw	x
3745  0848 bf58          	ldw	_boost_time_4,x
3746                     ; 889  	auto_limit_pow_1 =0;
3748  084a 3f62          	clr	_auto_limit_pow_1
3749                     ; 890  	auto_limit_pow_2 =0;
3751  084c 3f63          	clr	_auto_limit_pow_2
3752                     ; 891  	auto_limit_pow_3 =0;
3754  084e 3f64          	clr	_auto_limit_pow_3
3755                     ; 892  	auto_limit_pow_4 =0;
3757  0850 3f65          	clr	_auto_limit_pow_4
3758                     ; 894  	boost_1_count =0;
3760  0852 725f0020      	clr	_boost_1_count
3761                     ; 895  	boost_2_count =0;
3763  0856 725f0021      	clr	_boost_2_count
3764                     ; 896  	boost_3_count =0;
3766  085a 725f0022      	clr	_boost_3_count
3767                     ; 897  	boost_4_count =0;
3769  085e 725f0023      	clr	_boost_4_count
3770                     ; 899  	zone_1_level =0;
3772  0862 3fa7          	clr	_zone_1_level
3773                     ; 900  	zone_2_level =0;
3775  0864 3fa8          	clr	_zone_2_level
3776                     ; 901  	zone_3_level =0;
3778  0866 3fa9          	clr	_zone_3_level
3779                     ; 902  	zone_4_level =0; 
3781  0868 3faa          	clr	_zone_4_level
3782                     ; 904 	zone_1_timer = 0;
3784  086a 5f            	clrw	x
3785  086b bfad          	ldw	_zone_1_timer,x
3786                     ; 905  	zone_2_timer = 0;
3788  086d 5f            	clrw	x
3789  086e bfaf          	ldw	_zone_2_timer,x
3790                     ; 906 	zone_3_timer = 0;
3792  0870 5f            	clrw	x
3793  0871 bfb1          	ldw	_zone_3_timer,x
3794                     ; 907 	zone_4_timer = 0;
3796  0873 5f            	clrw	x
3797  0874 bfb3          	ldw	_zone_4_timer,x
3798                     ; 909  	general_timer =0;
3800  0876 3fab          	clr	_general_timer
3801                     ; 910  	flex_L_bz =0;	
3803  0878 3f66          	clr	_flex_L_bz
3804                     ; 911  	flex_R_bz =0;	
3806  087a 3f67          	clr	_flex_R_bz
3807                     ; 912  	bbq_L_bz =0;
3809  087c 3f68          	clr	_bbq_L_bz
3810                     ; 913  	bbq_R_bz =0; 	
3812  087e 3f69          	clr	_bbq_R_bz
3813                     ; 915  	Warm_status =0;
3815  0880 725f0013      	clr	_Warm_status
3816                     ; 916  	Warm_1_timer =0;
3818  0884 725f0014      	clr	_Warm_1_timer
3819                     ; 917  	Warm_2_timer =0;
3821  0888 725f0015      	clr	_Warm_2_timer
3822                     ; 918  	Warm_3_timer =0;
3824  088c 725f0016      	clr	_Warm_3_timer
3825                     ; 919  	Warm_4_timer =0;
3827  0890 725f0017      	clr	_Warm_4_timer
3828                     ; 921  	Pause_bz =0;	
3830  0894 3fdd          	clr	_Pause_bz
3831                     ; 922  	pause_x_timer =0; 
3833  0896 3fac          	clr	_pause_x_timer
3834                     ; 924 	buzzer_5s_times = 0;
3836  0898 725f000c      	clr	_buzzer_5s_times
3837                     ; 925 }
3840  089c 81            	ret
3892                     ; 926 u8 minium_value(u8 a,u8 b)
3892                     ; 927 {
3893                     	switch	.text
3894  089d               _minium_value:
3896  089d 89            	pushw	x
3897  089e 88            	push	a
3898       00000001      OFST:	set	1
3901                     ; 928 	u8 data =0;
3903  089f 0f01          	clr	(OFST+0,sp)
3904                     ; 929 	return(Compare_min(a,b,data));
3906  08a1 9e            	ld	a,xh
3907  08a2 1103          	cp	a,(OFST+2,sp)
3908  08a4 2207          	jrugt	L67
3909  08a6 9e            	ld	a,xh
3910  08a7 6b01          	ld	(OFST+0,sp),a
3911  08a9 7b01          	ld	a,(OFST+0,sp)
3912  08ab 2005          	jra	L001
3913  08ad               L67:
3914  08ad 9f            	ld	a,xl
3915  08ae 6b01          	ld	(OFST+0,sp),a
3916  08b0 7b01          	ld	a,(OFST+0,sp)
3917  08b2               L001:
3920  08b2 5b03          	addw	sp,#3
3921  08b4 81            	ret
3992                     ; 931 u8 calculate_min(u8 d1,u8 d2,u8 d3,u8 d4)
3992                     ; 932 {
3993                     	switch	.text
3994  08b5               _calculate_min:
3996  08b5 89            	pushw	x
3997  08b6 88            	push	a
3998       00000001      OFST:	set	1
4001                     ; 933    u8 result =0;
4003  08b7 0f01          	clr	(OFST+0,sp)
4004                     ; 935    result =minium_value(d1,d2);
4006  08b9 9f            	ld	a,xl
4007  08ba 97            	ld	xl,a
4008  08bb 7b02          	ld	a,(OFST+1,sp)
4009  08bd 95            	ld	xh,a
4010  08be addd          	call	_minium_value
4012  08c0 6b01          	ld	(OFST+0,sp),a
4013                     ; 936    result =minium_value(d3,result);
4015  08c2 7b01          	ld	a,(OFST+0,sp)
4016  08c4 97            	ld	xl,a
4017  08c5 7b06          	ld	a,(OFST+5,sp)
4018  08c7 95            	ld	xh,a
4019  08c8 add3          	call	_minium_value
4021  08ca 6b01          	ld	(OFST+0,sp),a
4022                     ; 937    result =minium_value(d4,result);   
4024  08cc 7b01          	ld	a,(OFST+0,sp)
4025  08ce 97            	ld	xl,a
4026  08cf 7b07          	ld	a,(OFST+6,sp)
4027  08d1 95            	ld	xh,a
4028  08d2 adc9          	call	_minium_value
4030  08d4 6b01          	ld	(OFST+0,sp),a
4031                     ; 939    if(result ==255) result =0;
4033  08d6 7b01          	ld	a,(OFST+0,sp)
4034  08d8 a1ff          	cp	a,#255
4035  08da 2602          	jrne	L7431
4038  08dc 0f01          	clr	(OFST+0,sp)
4039  08de               L7431:
4040                     ; 940    return(result);
4042  08de 7b01          	ld	a,(OFST+0,sp)
4045  08e0 5b03          	addw	sp,#3
4046  08e2 81            	ret
4089                     	switch	.user
4090  00b6               L011:
4091  00b6 08f3          	dc.w	L1531
4092  00b8 08f9          	dc.w	L3531
4093  00ba 08ff          	dc.w	L5531
4094  00bc 0905          	dc.w	L7531
4095  00be 090b          	dc.w	L1631
4096  00c0 0911          	dc.w	L3631
4097  00c2 0917          	dc.w	L5631
4098  00c4 091d          	dc.w	L7631
4099  00c6 0923          	dc.w	L1731
4100  00c8 0929          	dc.w	L3731
4101  00ca 092f          	dc.w	L5731
4102  00cc 0935          	dc.w	L7731
4103  00ce 093b          	dc.w	L1041
4104  00d0 0941          	dc.w	L3041
4105  00d2 0947          	dc.w	L5041
4106  00d4 094d          	dc.w	L7041
4107                     ; 943 u8 Display_decode(u8 In_data)
4107                     ; 944 {
4108                     	switch	.text
4109  08e3               _Display_decode:
4111  08e3 88            	push	a
4112       00000001      OFST:	set	1
4115                     ; 945 	u8 code_data = 0;
4117  08e4 0f01          	clr	(OFST+0,sp)
4118                     ; 946 	switch(In_data)
4121                     ; 963 		case 15: code_data = CHR_F;break;
4122  08e6 a110          	cp	a,#16
4123  08e8 2407          	jruge	L601
4124  08ea 5f            	clrw	x
4125  08eb 97            	ld	xl,a
4126  08ec 58            	sllw	x
4127  08ed de00b6        	ldw	x,(L011,x)
4128  08f0 fc            	jp	(x)
4129  08f1               L601:
4130  08f1 205e          	jra	L5341
4131  08f3               L1531:
4132                     ; 948 		case 0: code_data  = NUM_0;break;
4134  08f3 a6eb          	ld	a,#235
4135  08f5 6b01          	ld	(OFST+0,sp),a
4138  08f7 2058          	jra	L5341
4139  08f9               L3531:
4140                     ; 949 		case 1: code_data  = NUM_1;break;
4142  08f9 a621          	ld	a,#33
4143  08fb 6b01          	ld	(OFST+0,sp),a
4146  08fd 2052          	jra	L5341
4147  08ff               L5531:
4148                     ; 950 		case 2: code_data  = NUM_2;break;
4150  08ff a67a          	ld	a,#122
4151  0901 6b01          	ld	(OFST+0,sp),a
4154  0903 204c          	jra	L5341
4155  0905               L7531:
4156                     ; 951 		case 3: code_data  = NUM_3;break;
4158  0905 a679          	ld	a,#121
4159  0907 6b01          	ld	(OFST+0,sp),a
4162  0909 2046          	jra	L5341
4163  090b               L1631:
4164                     ; 952 		case 4: code_data  = NUM_4;break;
4166  090b a6b1          	ld	a,#177
4167  090d 6b01          	ld	(OFST+0,sp),a
4170  090f 2040          	jra	L5341
4171  0911               L3631:
4172                     ; 953 		case 5: code_data  = NUM_5;break;
4174  0911 a6d9          	ld	a,#217
4175  0913 6b01          	ld	(OFST+0,sp),a
4178  0915 203a          	jra	L5341
4179  0917               L5631:
4180                     ; 954 		case 6: code_data  = NUM_6;break;
4182  0917 a6db          	ld	a,#219
4183  0919 6b01          	ld	(OFST+0,sp),a
4186  091b 2034          	jra	L5341
4187  091d               L7631:
4188                     ; 955 		case 7: code_data  = NUM_7;break;
4190  091d a6e1          	ld	a,#225
4191  091f 6b01          	ld	(OFST+0,sp),a
4194  0921 202e          	jra	L5341
4195  0923               L1731:
4196                     ; 956 		case 8: code_data  = NUM_8;break;
4198  0923 a6fb          	ld	a,#251
4199  0925 6b01          	ld	(OFST+0,sp),a
4202  0927 2028          	jra	L5341
4203  0929               L3731:
4204                     ; 957 		case 9: code_data  = NUM_9;break;
4206  0929 a6f9          	ld	a,#249
4207  092b 6b01          	ld	(OFST+0,sp),a
4210  092d 2022          	jra	L5341
4211  092f               L5731:
4212                     ; 958 		case 10: code_data = CHR_A;break;
4214  092f a6f3          	ld	a,#243
4215  0931 6b01          	ld	(OFST+0,sp),a
4218  0933 201c          	jra	L5341
4219  0935               L7731:
4220                     ; 959 		case 11: code_data = CHR_B;break;
4222  0935 a69b          	ld	a,#155
4223  0937 6b01          	ld	(OFST+0,sp),a
4226  0939 2016          	jra	L5341
4227  093b               L1041:
4228                     ; 960 		case 12: code_data = CHR_C;break;
4230  093b a61a          	ld	a,#26
4231  093d 6b01          	ld	(OFST+0,sp),a
4234  093f 2010          	jra	L5341
4235  0941               L3041:
4236                     ; 961 		case 13: code_data = CHR_D;break;
4238  0941 a63b          	ld	a,#59
4239  0943 6b01          	ld	(OFST+0,sp),a
4242  0945 200a          	jra	L5341
4243  0947               L5041:
4244                     ; 962 		case 14: code_data = CHR_E;break;
4246  0947 a6da          	ld	a,#218
4247  0949 6b01          	ld	(OFST+0,sp),a
4250  094b 2004          	jra	L5341
4251  094d               L7041:
4252                     ; 963 		case 15: code_data = CHR_F;break;
4254  094d a6d2          	ld	a,#210
4255  094f 6b01          	ld	(OFST+0,sp),a
4258  0951               L5341:
4259                     ; 965 	 return ((u8)code_data);
4261  0951 7b01          	ld	a,(OFST+0,sp)
4264  0953 5b01          	addw	sp,#1
4265  0955 81            	ret
4429                     ; 967 u16 ON_disp_zone_x(u8 onoff,u8 warm_disp,u8 index,u8 zone_x_flash,u8 timer,u8 level,u8 *change,u8 index_f,u8 select,u8 flash,u8 pan,u8 other_pan,u8 err,u8 *zone_x_nopan_flg, u8 timeout)
4429                     ; 968 {
4430                     	switch	.text
4431  0956               _ON_disp_zone_x:
4433  0956 89            	pushw	x
4434  0957 5203          	subw	sp,#3
4435       00000003      OFST:	set	3
4438                     ; 969 	u16 dis_buf =CHR_BLANK;
4440  0959 5f            	clrw	x
4441  095a 1f02          	ldw	(OFST-1,sp),x
4442                     ; 971 	*zone_x_nopan_flg = FALSE;
4444  095c 1e14          	ldw	x,(OFST+17,sp)
4445  095e 7f            	clr	(x)
4446                     ; 972 	if((*change) &select)
4448  095f 1e0c          	ldw	x,(OFST+9,sp)
4449  0961 f6            	ld	a,(x)
4450  0962 150f          	bcp	a,(OFST+12,sp)
4451  0964 2714          	jreq	L5451
4452                     ; 974    	if(zone_x_flash %2) dis_buf =CHR_B*256 + CHR_O; 
4454  0966 7b09          	ld	a,(OFST+6,sp)
4455  0968 a501          	bcp	a,#1
4456  096a 2705          	jreq	L7451
4459  096c ae9b1b        	ldw	x,#39707
4460  096f 1f02          	ldw	(OFST-1,sp),x
4461  0971               L7451:
4462                     ; 975    	if(zone_x_flash <6) (*change) =0;
4464  0971 7b09          	ld	a,(OFST+6,sp)
4465  0973 a106          	cp	a,#6
4466  0975 2403          	jruge	L5451
4469  0977 1e0c          	ldw	x,(OFST+9,sp)
4470  0979 7f            	clr	(x)
4471  097a               L5451:
4472                     ; 977 	if((zone_x_flash ==0)||((zone_x_flash %2)==0)) 
4474  097a 0d09          	tnz	(OFST+6,sp)
4475  097c 2709          	jreq	L5551
4477  097e 7b09          	ld	a,(OFST+6,sp)
4478  0980 a501          	bcp	a,#1
4479  0982 2703          	jreq	L421
4480  0984 cc0a93        	jp	L3551
4481  0987               L421:
4482  0987               L5551:
4483                     ; 979 	  if((level)||(warm_disp))   
4485  0987 0d0b          	tnz	(OFST+8,sp)
4486  0989 2607          	jrne	L1651
4488  098b 0d05          	tnz	(OFST+2,sp)
4489  098d 2603          	jrne	L621
4490  098f cc0a28        	jp	L7551
4491  0992               L621:
4492  0992               L1651:
4493                     ; 981 			if(level ==15)  dis_buf =CHR_B*256 + CHR_O;
4495  0992 7b0b          	ld	a,(OFST+8,sp)
4496  0994 a10f          	cp	a,#15
4497  0996 2607          	jrne	L3651
4500  0998 ae9b1b        	ldw	x,#39707
4501  099b 1f02          	ldw	(OFST-1,sp),x
4503  099d 2032          	jra	L5651
4504  099f               L3651:
4505                     ; 984 				if(level >=10)  dis_buf = Display_decode(level/10)<<8;
4507  099f 7b0b          	ld	a,(OFST+8,sp)
4508  09a1 a10a          	cp	a,#10
4509  09a3 2513          	jrult	L7651
4512  09a5 7b0b          	ld	a,(OFST+8,sp)
4513  09a7 ae000a        	ldw	x,#10
4514  09aa 51            	exgw	x,y
4515  09ab 5f            	clrw	x
4516  09ac 97            	ld	xl,a
4517  09ad 65            	divw	x,y
4518  09ae 9f            	ld	a,xl
4519  09af cd08e3        	call	_Display_decode
4521  09b2 5f            	clrw	x
4522  09b3 97            	ld	xl,a
4523  09b4 4f            	clr	a
4524  09b5 02            	rlwa	x,a
4525  09b6 1f02          	ldw	(OFST-1,sp),x
4526  09b8               L7651:
4527                     ; 985 				dis_buf |= Display_decode(level%10);  
4529  09b8 7b0b          	ld	a,(OFST+8,sp)
4530  09ba ae000a        	ldw	x,#10
4531  09bd 51            	exgw	x,y
4532  09be 5f            	clrw	x
4533  09bf 97            	ld	xl,a
4534  09c0 65            	divw	x,y
4535  09c1 909f          	ld	a,yl
4536  09c3 cd08e3        	call	_Display_decode
4538  09c6 5f            	clrw	x
4539  09c7 97            	ld	xl,a
4540  09c8 01            	rrwa	x,a
4541  09c9 1a03          	or	a,(OFST+0,sp)
4542  09cb 01            	rrwa	x,a
4543  09cc 1a02          	or	a,(OFST-1,sp)
4544  09ce 01            	rrwa	x,a
4545  09cf 1f02          	ldw	(OFST-1,sp),x
4546  09d1               L5651:
4547                     ; 995 			if(warm_disp) dis_buf =CHR_A;      	
4549  09d1 0d05          	tnz	(OFST+2,sp)
4550  09d3 2705          	jreq	L1751
4553  09d5 ae00f3        	ldw	x,#243
4554  09d8 1f02          	ldw	(OFST-1,sp),x
4555  09da               L1751:
4556                     ; 998 	  	if(zone_x_flash ==0)
4558  09da 0d09          	tnz	(OFST+6,sp)
4559  09dc 2703          	jreq	L031
4560  09de cc0a6e        	jp	L5161
4561  09e1               L031:
4562                     ; 1000 				if(index_f ==0) 
4564  09e1 0d0e          	tnz	(OFST+11,sp)
4565  09e3 2620          	jrne	L5751
4566                     ; 1002 					if(pan >4)    //normal status            	
4568  09e5 7b11          	ld	a,(OFST+14,sp)
4569  09e7 a105          	cp	a,#5
4570  09e9 2403          	jruge	L231
4571  09eb cc0a6e        	jp	L5161
4572  09ee               L231:
4573                     ; 1004 						*zone_x_nopan_flg = TRUE;
4575  09ee 1e14          	ldw	x,(OFST+17,sp)
4576  09f0 a601          	ld	a,#1
4577  09f2 f7            	ld	(x),a
4578                     ; 1005 						if(Time_dot_bz ==TRUE)
4580  09f3 b61c          	ld	a,_Time_dot_bz
4581  09f5 a101          	cp	a,#1
4582  09f7 2607          	jrne	L1061
4583                     ; 1007 							dis_buf = NUM_0;
4585  09f9 ae00eb        	ldw	x,#235
4586  09fc 1f02          	ldw	(OFST-1,sp),x
4588  09fe 206e          	jra	L5161
4589  0a00               L1061:
4590                     ; 1009 					  else dis_buf =CHR_BLANK;
4592  0a00 5f            	clrw	x
4593  0a01 1f02          	ldw	(OFST-1,sp),x
4594  0a03 2069          	jra	L5161
4595  0a05               L5751:
4596                     ; 1012 				else if((pan>4)&&(other_pan>4))   
4598  0a05 7b11          	ld	a,(OFST+14,sp)
4599  0a07 a105          	cp	a,#5
4600  0a09 2563          	jrult	L5161
4602  0a0b 7b12          	ld	a,(OFST+15,sp)
4603  0a0d a105          	cp	a,#5
4604  0a0f 255d          	jrult	L5161
4605                     ; 1014 					*zone_x_nopan_flg = TRUE;
4607  0a11 1e14          	ldw	x,(OFST+17,sp)
4608  0a13 a601          	ld	a,#1
4609  0a15 f7            	ld	(x),a
4610                     ; 1015 					if(Time_dot_bz ==TRUE)
4612  0a16 b61c          	ld	a,_Time_dot_bz
4613  0a18 a101          	cp	a,#1
4614  0a1a 2607          	jrne	L1161
4615                     ; 1017 						dis_buf = NUM_0;
4617  0a1c ae00eb        	ldw	x,#235
4618  0a1f 1f02          	ldw	(OFST-1,sp),x
4620  0a21 204b          	jra	L5161
4621  0a23               L1161:
4622                     ; 1019 					else dis_buf =CHR_BLANK;
4624  0a23 5f            	clrw	x
4625  0a24 1f02          	ldw	(OFST-1,sp),x
4626  0a26 2046          	jra	L5161
4627  0a28               L7551:
4628                     ; 1025 			if((zone_x_flash+timeout ==0)&&(flash)&&(Time_dot_bz ==TRUE)) dis_buf = CHR_H<<8;
4630  0a28 7b09          	ld	a,(OFST+6,sp)
4631  0a2a 5f            	clrw	x
4632  0a2b 1b16          	add	a,(OFST+19,sp)
4633  0a2d 2401          	jrnc	L411
4634  0a2f 5c            	incw	x
4635  0a30               L411:
4636  0a30 02            	rlwa	x,a
4637  0a31 5d            	tnzw	x
4638  0a32 2611          	jrne	L7161
4640  0a34 0d10          	tnz	(OFST+13,sp)
4641  0a36 270d          	jreq	L7161
4643  0a38 b61c          	ld	a,_Time_dot_bz
4644  0a3a a101          	cp	a,#1
4645  0a3c 2607          	jrne	L7161
4648  0a3e aeb300        	ldw	x,#45824
4649  0a41 1f02          	ldw	(OFST-1,sp),x
4651  0a43 2029          	jra	L5161
4652  0a45               L7161:
4653                     ; 1028 				if(zone_x_flash)  dis_buf = NUM_0;            	
4655  0a45 0d09          	tnz	(OFST+6,sp)
4656  0a47 2707          	jreq	L3261
4659  0a49 ae00eb        	ldw	x,#235
4660  0a4c 1f02          	ldw	(OFST-1,sp),x
4662  0a4e 201e          	jra	L5161
4663  0a50               L3261:
4664                     ; 1029 				else if(onoff)    dis_buf = NUM_0;//(SEG_G<<8)|SEG_G;
4666  0a50 0d04          	tnz	(OFST+1,sp)
4667  0a52 2707          	jreq	L7261
4670  0a54 ae00eb        	ldw	x,#235
4671  0a57 1f02          	ldw	(OFST-1,sp),x
4673  0a59 2013          	jra	L5161
4674  0a5b               L7261:
4675                     ; 1030 				else if(!onoff)
4677  0a5b 0d04          	tnz	(OFST+1,sp)
4678  0a5d 260f          	jrne	L5161
4679                     ; 1032 					dis_buf = (timer)?CHR_T:CHR_BLANK;
4681  0a5f 0d0a          	tnz	(OFST+7,sp)
4682  0a61 2705          	jreq	L611
4683  0a63 ae009a        	ldw	x,#154
4684  0a66 2004          	jra	L021
4685  0a68               L611:
4686  0a68 5f            	clrw	x
4687  0a69 9f            	ld	a,xl
4688  0a6a 5f            	clrw	x
4689  0a6b 97            	ld	xl,a
4690  0a6c               L021:
4691  0a6c 1f02          	ldw	(OFST-1,sp),x
4692  0a6e               L5161:
4693                     ; 1036 	  if(err)
4695  0a6e 0d13          	tnz	(OFST+16,sp)
4696  0a70 2721          	jreq	L3551
4697                     ; 1040 			dis_buf = Display_decode((err & 0xF0) >>4)*256 + Display_decode(err & 0x0F);
4699  0a72 7b13          	ld	a,(OFST+16,sp)
4700  0a74 a40f          	and	a,#15
4701  0a76 cd08e3        	call	_Display_decode
4703  0a79 6b01          	ld	(OFST-2,sp),a
4704  0a7b 7b13          	ld	a,(OFST+16,sp)
4705  0a7d a4f0          	and	a,#240
4706  0a7f 4e            	swap	a
4707  0a80 a40f          	and	a,#15
4708  0a82 cd08e3        	call	_Display_decode
4710  0a85 5f            	clrw	x
4711  0a86 97            	ld	xl,a
4712  0a87 4f            	clr	a
4713  0a88 02            	rlwa	x,a
4714  0a89 01            	rrwa	x,a
4715  0a8a 1b01          	add	a,(OFST-2,sp)
4716  0a8c 2401          	jrnc	L221
4717  0a8e 5c            	incw	x
4718  0a8f               L221:
4719  0a8f 02            	rlwa	x,a
4720  0a90 1f02          	ldw	(OFST-1,sp),x
4721  0a92 01            	rrwa	x,a
4722  0a93               L3551:
4723                     ; 1046   return(dis_buf);
4725  0a93 1e02          	ldw	x,(OFST-1,sp)
4728  0a95 5b05          	addw	sp,#5
4729  0a97 81            	ret
4776                     ; 1048 void APT8L16Init_H(void)
4776                     ; 1049 {
4777                     	switch	.text
4778  0a98               _APT8L16Init_H:
4780  0a98 89            	pushw	x
4781       00000002      OFST:	set	2
4784                     ; 1050 	u8 i=0;
4786  0a99 7b02          	ld	a,(OFST+0,sp)
4787  0a9b 97            	ld	xl,a
4788                     ; 1051 	u8 j=0;
4790  0a9c 7b02          	ld	a,(OFST+0,sp)
4791  0a9e 97            	ld	xl,a
4792  0a9f               L1661:
4793                     ; 1054 		APTTouchWrOneData(APT_ADD_H,0x3A,0x5A);    //setting mode  
4795  0a9f 4b5a          	push	#90
4796  0aa1 ae003a        	ldw	x,#58
4797  0aa4 a656          	ld	a,#86
4798  0aa6 95            	ld	xh,a
4799  0aa7 cd0000        	call	_APTTouchWrOneData
4801  0aaa 84            	pop	a
4802                     ; 1055 		j =APTTouchRdOneData(APT_ADD_H,0x3A); 
4804  0aab ae003a        	ldw	x,#58
4805  0aae a656          	ld	a,#86
4806  0ab0 95            	ld	xh,a
4807  0ab1 cd0000        	call	_APTTouchRdOneData
4809  0ab4 6b02          	ld	(OFST+0,sp),a
4810                     ; 1056 	}while (j!=0x5A);
4812  0ab6 7b02          	ld	a,(OFST+0,sp)
4813  0ab8 a15a          	cp	a,#90
4814  0aba 26e3          	jrne	L1661
4815                     ; 1058 	for(i=0x20;i<=0x2D;)   
4817  0abc a620          	ld	a,#32
4818  0abe 6b02          	ld	(OFST+0,sp),a
4819  0ac0               L7661:
4820                     ; 1060 	  APTTouchWrOneData(APT_ADD_H,i,arr_APTRegData_H[i-0x20]);
4822  0ac0 7b02          	ld	a,(OFST+0,sp)
4823  0ac2 5f            	clrw	x
4824  0ac3 97            	ld	xl,a
4825  0ac4 1d0020        	subw	x,#32
4826  0ac7 d6007a        	ld	a,(_arr_APTRegData_H,x)
4827  0aca 88            	push	a
4828  0acb 7b03          	ld	a,(OFST+1,sp)
4829  0acd 97            	ld	xl,a
4830  0ace a656          	ld	a,#86
4831  0ad0 95            	ld	xh,a
4832  0ad1 cd0000        	call	_APTTouchWrOneData
4834  0ad4 84            	pop	a
4835                     ; 1061 	  if(APTTouchRdOneData(APT_ADD_H,i)==arr_APTRegData_H[i-0x20]) i++;
4837  0ad5 7b02          	ld	a,(OFST+0,sp)
4838  0ad7 5f            	clrw	x
4839  0ad8 97            	ld	xl,a
4840  0ad9 1d0020        	subw	x,#32
4841  0adc d6007a        	ld	a,(_arr_APTRegData_H,x)
4842  0adf 6b01          	ld	(OFST-1,sp),a
4843  0ae1 7b02          	ld	a,(OFST+0,sp)
4844  0ae3 97            	ld	xl,a
4845  0ae4 a656          	ld	a,#86
4846  0ae6 95            	ld	xh,a
4847  0ae7 cd0000        	call	_APTTouchRdOneData
4849  0aea 1101          	cp	a,(OFST-1,sp)
4850  0aec 2602          	jrne	L5761
4853  0aee 0c02          	inc	(OFST+0,sp)
4854  0af0               L5761:
4855                     ; 1058 	for(i=0x20;i<=0x2D;)   
4857  0af0 7b02          	ld	a,(OFST+0,sp)
4858  0af2 a12e          	cp	a,#46
4859  0af4 25ca          	jrult	L7661
4860                     ; 1063 	for(i=0;i<=0x0F;)   
4862  0af6 0f02          	clr	(OFST+0,sp)
4863  0af8               L7761:
4864                     ; 1065 		APTTouchWrOneData(APT_ADD_H,i,arr_T_Sens_H[i]);            //Set sensing K00~K17
4866  0af8 7b02          	ld	a,(OFST+0,sp)
4867  0afa 5f            	clrw	x
4868  0afb 97            	ld	xl,a
4869  0afc d60088        	ld	a,(_arr_T_Sens_H,x)
4870  0aff 88            	push	a
4871  0b00 7b03          	ld	a,(OFST+1,sp)
4872  0b02 97            	ld	xl,a
4873  0b03 a656          	ld	a,#86
4874  0b05 95            	ld	xh,a
4875  0b06 cd0000        	call	_APTTouchWrOneData
4877  0b09 84            	pop	a
4878                     ; 1066 		if(APTTouchRdOneData(APT_ADD_H,i)==arr_T_Sens_H[i]) i++;   //vertify K00~K17
4880  0b0a 7b02          	ld	a,(OFST+0,sp)
4881  0b0c 5f            	clrw	x
4882  0b0d 97            	ld	xl,a
4883  0b0e d60088        	ld	a,(_arr_T_Sens_H,x)
4884  0b11 6b01          	ld	(OFST-1,sp),a
4885  0b13 7b02          	ld	a,(OFST+0,sp)
4886  0b15 97            	ld	xl,a
4887  0b16 a656          	ld	a,#86
4888  0b18 95            	ld	xh,a
4889  0b19 cd0000        	call	_APTTouchRdOneData
4891  0b1c 1101          	cp	a,(OFST-1,sp)
4892  0b1e 2602          	jrne	L5071
4895  0b20 0c02          	inc	(OFST+0,sp)
4896  0b22               L5071:
4897                     ; 1063 	for(i=0;i<=0x0F;)   
4899  0b22 7b02          	ld	a,(OFST+0,sp)
4900  0b24 a110          	cp	a,#16
4901  0b26 25d0          	jrult	L7761
4902  0b28               L7071:
4903                     ; 1070     APTTouchWrOneData(APT_ADD_H,0x3A,0x00);    //working mode
4905  0b28 4b00          	push	#0
4906  0b2a ae003a        	ldw	x,#58
4907  0b2d a656          	ld	a,#86
4908  0b2f 95            	ld	xh,a
4909  0b30 cd0000        	call	_APTTouchWrOneData
4911  0b33 84            	pop	a
4912                     ; 1071     j =APTTouchRdOneData(APT_ADD_H,0x3A); 
4914  0b34 ae003a        	ldw	x,#58
4915  0b37 a656          	ld	a,#86
4916  0b39 95            	ld	xh,a
4917  0b3a cd0000        	call	_APTTouchRdOneData
4919  0b3d 6b02          	ld	(OFST+0,sp),a
4920                     ; 1072 	}while (j !=0x00);
4922  0b3f 0d02          	tnz	(OFST+0,sp)
4923  0b41 26e5          	jrne	L7071
4924                     ; 1073 }
4927  0b43 85            	popw	x
4928  0b44 81            	ret
4975                     ; 1074 void APT8L16Init_L(void)
4975                     ; 1075 {
4976                     	switch	.text
4977  0b45               _APT8L16Init_L:
4979  0b45 89            	pushw	x
4980       00000002      OFST:	set	2
4983                     ; 1076 	u8 i=0;
4985  0b46 7b02          	ld	a,(OFST+0,sp)
4986  0b48 97            	ld	xl,a
4987                     ; 1077 	u8 j=0;
4989  0b49 7b02          	ld	a,(OFST+0,sp)
4990  0b4b 97            	ld	xl,a
4991  0b4c               L7371:
4992                     ; 1080     APTTouchWrOneData(APT_ADD_L,0x3A,0x5A);    //setting mode  
4994  0b4c 4b5a          	push	#90
4995  0b4e ae003a        	ldw	x,#58
4996  0b51 a657          	ld	a,#87
4997  0b53 95            	ld	xh,a
4998  0b54 cd0000        	call	_APTTouchWrOneData
5000  0b57 84            	pop	a
5001                     ; 1081     j =APTTouchRdOneData(APT_ADD_L,0x3A); 
5003  0b58 ae003a        	ldw	x,#58
5004  0b5b a657          	ld	a,#87
5005  0b5d 95            	ld	xh,a
5006  0b5e cd0000        	call	_APTTouchRdOneData
5008  0b61 6b02          	ld	(OFST+0,sp),a
5009                     ; 1082 	}while (j!=0x5A);
5011  0b63 7b02          	ld	a,(OFST+0,sp)
5012  0b65 a15a          	cp	a,#90
5013  0b67 26e3          	jrne	L7371
5014                     ; 1084 	for(i=0x20;i<=0x2D;)   
5016  0b69 a620          	ld	a,#32
5017  0b6b 6b02          	ld	(OFST+0,sp),a
5018  0b6d               L5471:
5019                     ; 1086 	  APTTouchWrOneData(APT_ADD_L,i,arr_APTRegData_L[i-0x20]);
5021  0b6d 7b02          	ld	a,(OFST+0,sp)
5022  0b6f 5f            	clrw	x
5023  0b70 97            	ld	xl,a
5024  0b71 1d0020        	subw	x,#32
5025  0b74 d60098        	ld	a,(_arr_APTRegData_L,x)
5026  0b77 88            	push	a
5027  0b78 7b03          	ld	a,(OFST+1,sp)
5028  0b7a 97            	ld	xl,a
5029  0b7b a657          	ld	a,#87
5030  0b7d 95            	ld	xh,a
5031  0b7e cd0000        	call	_APTTouchWrOneData
5033  0b81 84            	pop	a
5034                     ; 1087 	  if(APTTouchRdOneData(APT_ADD_L,i)==arr_APTRegData_L[i-0x20]) i++;
5036  0b82 7b02          	ld	a,(OFST+0,sp)
5037  0b84 5f            	clrw	x
5038  0b85 97            	ld	xl,a
5039  0b86 1d0020        	subw	x,#32
5040  0b89 d60098        	ld	a,(_arr_APTRegData_L,x)
5041  0b8c 6b01          	ld	(OFST-1,sp),a
5042  0b8e 7b02          	ld	a,(OFST+0,sp)
5043  0b90 97            	ld	xl,a
5044  0b91 a657          	ld	a,#87
5045  0b93 95            	ld	xh,a
5046  0b94 cd0000        	call	_APTTouchRdOneData
5048  0b97 1101          	cp	a,(OFST-1,sp)
5049  0b99 2602          	jrne	L3571
5052  0b9b 0c02          	inc	(OFST+0,sp)
5053  0b9d               L3571:
5054                     ; 1084 	for(i=0x20;i<=0x2D;)   
5056  0b9d 7b02          	ld	a,(OFST+0,sp)
5057  0b9f a12e          	cp	a,#46
5058  0ba1 25ca          	jrult	L5471
5059                     ; 1089 	for(i=0;i<=0x0F;)   
5061  0ba3 0f02          	clr	(OFST+0,sp)
5062  0ba5               L5571:
5063                     ; 1091 		APTTouchWrOneData(APT_ADD_L,i,arr_T_Sens_L[i]);            //Set sensing K00~K17
5065  0ba5 7b02          	ld	a,(OFST+0,sp)
5066  0ba7 5f            	clrw	x
5067  0ba8 97            	ld	xl,a
5068  0ba9 d600a6        	ld	a,(_arr_T_Sens_L,x)
5069  0bac 88            	push	a
5070  0bad 7b03          	ld	a,(OFST+1,sp)
5071  0baf 97            	ld	xl,a
5072  0bb0 a657          	ld	a,#87
5073  0bb2 95            	ld	xh,a
5074  0bb3 cd0000        	call	_APTTouchWrOneData
5076  0bb6 84            	pop	a
5077                     ; 1092 		if(APTTouchRdOneData(APT_ADD_L,i)==arr_T_Sens_L[i]) i++;   //vertify K00~K17
5079  0bb7 7b02          	ld	a,(OFST+0,sp)
5080  0bb9 5f            	clrw	x
5081  0bba 97            	ld	xl,a
5082  0bbb d600a6        	ld	a,(_arr_T_Sens_L,x)
5083  0bbe 6b01          	ld	(OFST-1,sp),a
5084  0bc0 7b02          	ld	a,(OFST+0,sp)
5085  0bc2 97            	ld	xl,a
5086  0bc3 a657          	ld	a,#87
5087  0bc5 95            	ld	xh,a
5088  0bc6 cd0000        	call	_APTTouchRdOneData
5090  0bc9 1101          	cp	a,(OFST-1,sp)
5091  0bcb 2602          	jrne	L3671
5094  0bcd 0c02          	inc	(OFST+0,sp)
5095  0bcf               L3671:
5096                     ; 1089 	for(i=0;i<=0x0F;)   
5098  0bcf 7b02          	ld	a,(OFST+0,sp)
5099  0bd1 a110          	cp	a,#16
5100  0bd3 25d0          	jrult	L5571
5101  0bd5               L5671:
5102                     ; 1096     APTTouchWrOneData(APT_ADD_L,0x3A,0x00);    //working mode
5104  0bd5 4b00          	push	#0
5105  0bd7 ae003a        	ldw	x,#58
5106  0bda a657          	ld	a,#87
5107  0bdc 95            	ld	xh,a
5108  0bdd cd0000        	call	_APTTouchWrOneData
5110  0be0 84            	pop	a
5111                     ; 1097     j =APTTouchRdOneData(APT_ADD_L,0x3A); 
5113  0be1 ae003a        	ldw	x,#58
5114  0be4 a657          	ld	a,#87
5115  0be6 95            	ld	xh,a
5116  0be7 cd0000        	call	_APTTouchRdOneData
5118  0bea 6b02          	ld	(OFST+0,sp),a
5119                     ; 1098 	}while (j !=0x00);
5121  0bec 0d02          	tnz	(OFST+0,sp)
5122  0bee 26e5          	jrne	L5671
5123                     ; 1099 }
5126  0bf0 85            	popw	x
5127  0bf1 81            	ret
5174                     ; 1100 void APT8L16Init_AH(void)
5174                     ; 1101 {
5175                     	switch	.text
5176  0bf2               _APT8L16Init_AH:
5178  0bf2 89            	pushw	x
5179       00000002      OFST:	set	2
5182                     ; 1102 	u8 i=0;
5184  0bf3 7b02          	ld	a,(OFST+0,sp)
5185  0bf5 97            	ld	xl,a
5186                     ; 1103 	u8 j=0;
5188  0bf6 7b02          	ld	a,(OFST+0,sp)
5189  0bf8 97            	ld	xl,a
5190  0bf9               L5102:
5191                     ; 1106 		APTTouchWrOneData1(APT_ADD_H,0x3A,0x5A);    //setting mode  
5193  0bf9 4b5a          	push	#90
5194  0bfb ae003a        	ldw	x,#58
5195  0bfe a656          	ld	a,#86
5196  0c00 95            	ld	xh,a
5197  0c01 cd0000        	call	_APTTouchWrOneData1
5199  0c04 84            	pop	a
5200                     ; 1107     j =APTTouchRdOneData1(APT_ADD_H,0x3A); 
5202  0c05 ae003a        	ldw	x,#58
5203  0c08 a656          	ld	a,#86
5204  0c0a 95            	ld	xh,a
5205  0c0b cd0000        	call	_APTTouchRdOneData1
5207  0c0e 6b02          	ld	(OFST+0,sp),a
5208                     ; 1108 	}while (j!=0x5A);
5210  0c10 7b02          	ld	a,(OFST+0,sp)
5211  0c12 a15a          	cp	a,#90
5212  0c14 26e3          	jrne	L5102
5213                     ; 1110 	for(i=0x20;i<=0x2D;)   
5215  0c16 a620          	ld	a,#32
5216  0c18 6b02          	ld	(OFST+0,sp),a
5217  0c1a               L3202:
5218                     ; 1112 	  APTTouchWrOneData1(APT_ADD_H,i,arr_APTRegData_AH[i-0x20]);
5220  0c1a 7b02          	ld	a,(OFST+0,sp)
5221  0c1c 5f            	clrw	x
5222  0c1d 97            	ld	xl,a
5223  0c1e 1d0020        	subw	x,#32
5224  0c21 d6005c        	ld	a,(_arr_APTRegData_AH,x)
5225  0c24 88            	push	a
5226  0c25 7b03          	ld	a,(OFST+1,sp)
5227  0c27 97            	ld	xl,a
5228  0c28 a656          	ld	a,#86
5229  0c2a 95            	ld	xh,a
5230  0c2b cd0000        	call	_APTTouchWrOneData1
5232  0c2e 84            	pop	a
5233                     ; 1113 	  if(APTTouchRdOneData1(APT_ADD_H,i)==arr_APTRegData_AH[i-0x20]) i++;
5235  0c2f 7b02          	ld	a,(OFST+0,sp)
5236  0c31 5f            	clrw	x
5237  0c32 97            	ld	xl,a
5238  0c33 1d0020        	subw	x,#32
5239  0c36 d6005c        	ld	a,(_arr_APTRegData_AH,x)
5240  0c39 6b01          	ld	(OFST-1,sp),a
5241  0c3b 7b02          	ld	a,(OFST+0,sp)
5242  0c3d 97            	ld	xl,a
5243  0c3e a656          	ld	a,#86
5244  0c40 95            	ld	xh,a
5245  0c41 cd0000        	call	_APTTouchRdOneData1
5247  0c44 1101          	cp	a,(OFST-1,sp)
5248  0c46 2602          	jrne	L1302
5251  0c48 0c02          	inc	(OFST+0,sp)
5252  0c4a               L1302:
5253                     ; 1110 	for(i=0x20;i<=0x2D;)   
5255  0c4a 7b02          	ld	a,(OFST+0,sp)
5256  0c4c a12e          	cp	a,#46
5257  0c4e 25ca          	jrult	L3202
5258                     ; 1115 	for(i=0;i<=0x0F;)   
5260  0c50 0f02          	clr	(OFST+0,sp)
5261  0c52               L3302:
5262                     ; 1117 		APTTouchWrOneData1(APT_ADD_H,i,arr_T_Sens_AH[i]);            //Set sensing K00~K17
5264  0c52 7b02          	ld	a,(OFST+0,sp)
5265  0c54 5f            	clrw	x
5266  0c55 97            	ld	xl,a
5267  0c56 d6006a        	ld	a,(_arr_T_Sens_AH,x)
5268  0c59 88            	push	a
5269  0c5a 7b03          	ld	a,(OFST+1,sp)
5270  0c5c 97            	ld	xl,a
5271  0c5d a656          	ld	a,#86
5272  0c5f 95            	ld	xh,a
5273  0c60 cd0000        	call	_APTTouchWrOneData1
5275  0c63 84            	pop	a
5276                     ; 1118 		if(APTTouchRdOneData1(APT_ADD_H,i)==arr_T_Sens_AH[i]) i++;   //vertify K00~K17
5278  0c64 7b02          	ld	a,(OFST+0,sp)
5279  0c66 5f            	clrw	x
5280  0c67 97            	ld	xl,a
5281  0c68 d6006a        	ld	a,(_arr_T_Sens_AH,x)
5282  0c6b 6b01          	ld	(OFST-1,sp),a
5283  0c6d 7b02          	ld	a,(OFST+0,sp)
5284  0c6f 97            	ld	xl,a
5285  0c70 a656          	ld	a,#86
5286  0c72 95            	ld	xh,a
5287  0c73 cd0000        	call	_APTTouchRdOneData1
5289  0c76 1101          	cp	a,(OFST-1,sp)
5290  0c78 2602          	jrne	L1402
5293  0c7a 0c02          	inc	(OFST+0,sp)
5294  0c7c               L1402:
5295                     ; 1115 	for(i=0;i<=0x0F;)   
5297  0c7c 7b02          	ld	a,(OFST+0,sp)
5298  0c7e a110          	cp	a,#16
5299  0c80 25d0          	jrult	L3302
5300  0c82               L3402:
5301                     ; 1122     APTTouchWrOneData1(APT_ADD_H,0x3A,0x00);    //working mode
5303  0c82 4b00          	push	#0
5304  0c84 ae003a        	ldw	x,#58
5305  0c87 a656          	ld	a,#86
5306  0c89 95            	ld	xh,a
5307  0c8a cd0000        	call	_APTTouchWrOneData1
5309  0c8d 84            	pop	a
5310                     ; 1123     j =APTTouchRdOneData1(APT_ADD_H,0x3A); 
5312  0c8e ae003a        	ldw	x,#58
5313  0c91 a656          	ld	a,#86
5314  0c93 95            	ld	xh,a
5315  0c94 cd0000        	call	_APTTouchRdOneData1
5317  0c97 6b02          	ld	(OFST+0,sp),a
5318                     ; 1124 	}while (j !=0x00);
5320  0c99 0d02          	tnz	(OFST+0,sp)
5321  0c9b 26e5          	jrne	L3402
5322                     ; 1125 } 
5325  0c9d 85            	popw	x
5326  0c9e 81            	ret
5329                     	switch	.user
5330  00d6               L1502_now_scan:
5331  00d6 0000          	dc.w	0
5332  00d8 0000          	dc.w	0
5333  00da 0000          	dc.w	0
5426                     ; 1126 void key_scan_I2C(u8 list)
5426                     ; 1127 {
5427                     	switch	.text
5428  0c9f               _key_scan_I2C:
5430  0c9f 88            	push	a
5431  0ca0 520b          	subw	sp,#11
5432       0000000b      OFST:	set	11
5435                     ; 1128   u16 now_scan[3] ={0,0,0};
5437  0ca2 96            	ldw	x,sp
5438  0ca3 1c0005        	addw	x,#OFST-6
5439  0ca6 90ae00d6      	ldw	y,#L1502_now_scan
5440  0caa a606          	ld	a,#6
5441  0cac cd0000        	call	c_xymvx
5443                     ; 1129   u8 i =0;
5445  0caf 7b0b          	ld	a,(OFST+0,sp)
5446  0cb1 97            	ld	xl,a
5447                     ; 1130   u8 result =0;
5449  0cb2 0f03          	clr	(OFST-8,sp)
5450                     ; 1132   if(list ==1)
5452  0cb4 7b0c          	ld	a,(OFST+1,sp)
5453  0cb6 a101          	cp	a,#1
5454  0cb8 2628          	jrne	L5112
5455                     ; 1134     APTTouchKeyValueA =APTTouchRdOneData1(APT_ADD_H,0x34);
5457  0cba ae0034        	ldw	x,#52
5458  0cbd a656          	ld	a,#86
5459  0cbf 95            	ld	xh,a
5460  0cc0 cd0000        	call	_APTTouchRdOneData1
5462  0cc3 6b04          	ld	(OFST-7,sp),a
5463                     ; 1135     APTTouchKeyValueB =APTTouchRdOneData1(APT_ADD_H,0x35);
5465  0cc5 ae0035        	ldw	x,#53
5466  0cc8 a656          	ld	a,#86
5467  0cca 95            	ld	xh,a
5468  0ccb cd0000        	call	_APTTouchRdOneData1
5470  0cce 6b0b          	ld	(OFST+0,sp),a
5471                     ; 1136     I2C_GET_DATA_AH =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
5473  0cd0 7b0b          	ld	a,(OFST+0,sp)
5474  0cd2 5f            	clrw	x
5475  0cd3 97            	ld	xl,a
5476  0cd4 4f            	clr	a
5477  0cd5 02            	rlwa	x,a
5478  0cd6 01            	rrwa	x,a
5479  0cd7 1a04          	or	a,(OFST-7,sp)
5480  0cd9 b7ba          	ld	_I2C_GET_DATA_AH+1,a
5481  0cdb 9f            	ld	a,xl
5482  0cdc b7b9          	ld	_I2C_GET_DATA_AH,a
5483                     ; 1137     key_scan_value_AH =I2C_GET_DATA_AH;
5485  0cde beb9          	ldw	x,_I2C_GET_DATA_AH
5486  0ce0 bf90          	ldw	_key_scan_value_AH,x
5487  0ce2               L5112:
5488                     ; 1139   if(list ==2)
5490  0ce2 7b0c          	ld	a,(OFST+1,sp)
5491  0ce4 a102          	cp	a,#2
5492  0ce6 2650          	jrne	L7112
5493                     ; 1141     APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_H,0x34);
5495  0ce8 ae0034        	ldw	x,#52
5496  0ceb a656          	ld	a,#86
5497  0ced 95            	ld	xh,a
5498  0cee cd0000        	call	_APTTouchRdOneData
5500  0cf1 6b04          	ld	(OFST-7,sp),a
5501                     ; 1142     APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_H,0x35);
5503  0cf3 ae0035        	ldw	x,#53
5504  0cf6 a656          	ld	a,#86
5505  0cf8 95            	ld	xh,a
5506  0cf9 cd0000        	call	_APTTouchRdOneData
5508  0cfc 6b0b          	ld	(OFST+0,sp),a
5509                     ; 1143     I2C_GET_DATA_H =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
5511  0cfe 7b0b          	ld	a,(OFST+0,sp)
5512  0d00 5f            	clrw	x
5513  0d01 97            	ld	xl,a
5514  0d02 4f            	clr	a
5515  0d03 02            	rlwa	x,a
5516  0d04 01            	rrwa	x,a
5517  0d05 1a04          	or	a,(OFST-7,sp)
5518  0d07 b7b6          	ld	_I2C_GET_DATA_H+1,a
5519  0d09 9f            	ld	a,xl
5520  0d0a b7b5          	ld	_I2C_GET_DATA_H,a
5521                     ; 1144     key_scan_value_H =I2C_GET_DATA_H;
5523  0d0c beb5          	ldw	x,_I2C_GET_DATA_H
5524  0d0e bf8c          	ldw	_key_scan_value_H,x
5525                     ; 1146 		APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_L,0x34);
5527  0d10 ae0034        	ldw	x,#52
5528  0d13 a657          	ld	a,#87
5529  0d15 95            	ld	xh,a
5530  0d16 cd0000        	call	_APTTouchRdOneData
5532  0d19 6b04          	ld	(OFST-7,sp),a
5533                     ; 1147 		APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_L,0x35);
5535  0d1b ae0035        	ldw	x,#53
5536  0d1e a657          	ld	a,#87
5537  0d20 95            	ld	xh,a
5538  0d21 cd0000        	call	_APTTouchRdOneData
5540  0d24 6b0b          	ld	(OFST+0,sp),a
5541                     ; 1148     I2C_GET_DATA_L =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;  
5543  0d26 7b0b          	ld	a,(OFST+0,sp)
5544  0d28 5f            	clrw	x
5545  0d29 97            	ld	xl,a
5546  0d2a 4f            	clr	a
5547  0d2b 02            	rlwa	x,a
5548  0d2c 01            	rrwa	x,a
5549  0d2d 1a04          	or	a,(OFST-7,sp)
5550  0d2f b7b8          	ld	_I2C_GET_DATA_L+1,a
5551  0d31 9f            	ld	a,xl
5552  0d32 b7b7          	ld	_I2C_GET_DATA_L,a
5553                     ; 1149     key_scan_value_L =I2C_GET_DATA_L;  
5555  0d34 beb7          	ldw	x,_I2C_GET_DATA_L
5556  0d36 bf8e          	ldw	_key_scan_value_L,x
5557  0d38               L7112:
5558                     ; 1151   if(list ==3)
5560  0d38 7b0c          	ld	a,(OFST+1,sp)
5561  0d3a a103          	cp	a,#3
5562  0d3c 2676          	jrne	L1212
5563                     ; 1153     if((I2C_GET_DATA_H ==0)&&(I2C_GET_DATA_L ==0)&&(I2C_GET_DATA_AH ==0))
5565  0d3e beb5          	ldw	x,_I2C_GET_DATA_H
5566  0d40 261a          	jrne	L3212
5568  0d42 beb7          	ldw	x,_I2C_GET_DATA_L
5569  0d44 2616          	jrne	L3212
5571  0d46 beb9          	ldw	x,_I2C_GET_DATA_AH
5572  0d48 2612          	jrne	L3212
5573                     ; 1155      		key_account =0;
5575  0d4a 5f            	clrw	x
5576  0d4b bf93          	ldw	_key_account,x
5577                     ; 1156      		key_ok_bit =0;
5579  0d4d 3f92          	clr	_key_ok_bit
5580                     ; 1157      		key_err_account =0;	
5582  0d4f 5f            	clrw	x
5583  0d50 bf9b          	ldw	_key_err_account,x
5584                     ; 1158 				key_ReleaseFlag = TRUE; 
5586  0d52 35010011      	mov	_key_ReleaseFlag,#1
5587                     ; 1159 				lock_release_flg = TRUE;
5589  0d56 35010035      	mov	_lock_release_flg,#1
5591  0d5a 2058          	jra	L1212
5592  0d5c               L3212:
5593                     ; 1163        apt_min_reset =0;
5595  0d5c 3fe6          	clr	_apt_min_reset
5596                     ; 1164         key_ReleaseFlag = FALSE;
5598  0d5e 725f0011      	clr	_key_ReleaseFlag
5599                     ; 1165         now_scan[0]=I2C_GET_DATA_H;
5601  0d62 beb5          	ldw	x,_I2C_GET_DATA_H
5602  0d64 1f05          	ldw	(OFST-6,sp),x
5603                     ; 1166         now_scan[1]=I2C_GET_DATA_L;
5605  0d66 beb7          	ldw	x,_I2C_GET_DATA_L
5606  0d68 1f07          	ldw	(OFST-4,sp),x
5607                     ; 1167         now_scan[2]=I2C_GET_DATA_AH;
5609  0d6a beb9          	ldw	x,_I2C_GET_DATA_AH
5610  0d6c 1f09          	ldw	(OFST-2,sp),x
5611                     ; 1169         for(i=0;i<=2;i++)
5613  0d6e 0f0b          	clr	(OFST+0,sp)
5614  0d70               L7212:
5615                     ; 1171         	if(now_scan[i] !=arr_save_scan[i])  result =1;
5617  0d70 96            	ldw	x,sp
5618  0d71 1c0005        	addw	x,#OFST-6
5619  0d74 1f01          	ldw	(OFST-10,sp),x
5620  0d76 7b0b          	ld	a,(OFST+0,sp)
5621  0d78 5f            	clrw	x
5622  0d79 97            	ld	xl,a
5623  0d7a 58            	sllw	x
5624  0d7b 72fb01        	addw	x,(OFST-10,sp)
5625  0d7e 7b0b          	ld	a,(OFST+0,sp)
5626  0d80 905f          	clrw	y
5627  0d82 9097          	ld	yl,a
5628  0d84 9058          	sllw	y
5629  0d86 fe            	ldw	x,(x)
5630  0d87 90e395        	cpw	x,(_arr_save_scan,y)
5631  0d8a 2704          	jreq	L5312
5634  0d8c a601          	ld	a,#1
5635  0d8e 6b03          	ld	(OFST-8,sp),a
5636  0d90               L5312:
5637                     ; 1169         for(i=0;i<=2;i++)
5639  0d90 0c0b          	inc	(OFST+0,sp)
5642  0d92 7b0b          	ld	a,(OFST+0,sp)
5643  0d94 a103          	cp	a,#3
5644  0d96 25d8          	jrult	L7212
5645                     ; 1173         if(result) 
5647  0d98 0d03          	tnz	(OFST-8,sp)
5648  0d9a 2711          	jreq	L7312
5649                     ; 1175         	key_account =0;
5651  0d9c 5f            	clrw	x
5652  0d9d bf93          	ldw	_key_account,x
5653                     ; 1176         	arr_save_scan[0]=now_scan[0];
5655  0d9f 1e05          	ldw	x,(OFST-6,sp)
5656  0da1 bf95          	ldw	_arr_save_scan,x
5657                     ; 1177         	arr_save_scan[1]=now_scan[1];
5659  0da3 1e07          	ldw	x,(OFST-4,sp)
5660  0da5 bf97          	ldw	_arr_save_scan+2,x
5661                     ; 1178         	arr_save_scan[2]=now_scan[2];       	                	
5663  0da7 1e09          	ldw	x,(OFST-2,sp)
5664  0da9 bf99          	ldw	_arr_save_scan+4,x
5666  0dab 2007          	jra	L1212
5667  0dad               L7312:
5668                     ; 1180         else key_account++;
5670  0dad be93          	ldw	x,_key_account
5671  0daf 1c0001        	addw	x,#1
5672  0db2 bf93          	ldw	_key_account,x
5673  0db4               L1212:
5674                     ; 1183 }
5677  0db4 5b0c          	addw	sp,#12
5678  0db6 81            	ret
5721                     ; 1184 void key_next_deal(void)
5721                     ; 1185 { 
5722                     	switch	.text
5723  0db7               _key_next_deal:
5725  0db7 88            	push	a
5726       00000001      OFST:	set	1
5729                     ; 1186   u8  key_effective =0;
5731  0db8 0f01          	clr	(OFST+0,sp)
5732                     ; 1187               if((key_account == short_press_time) ||(key_account == lock_press_time)|| (key_account == long_press_time))   key_effective =1;
5734  0dba be93          	ldw	x,_key_account
5735  0dbc a30002        	cpw	x,#2
5736  0dbf 270e          	jreq	L3612
5738  0dc1 be93          	ldw	x,_key_account
5739  0dc3 a300fa        	cpw	x,#250
5740  0dc6 2707          	jreq	L3612
5742  0dc8 be93          	ldw	x,_key_account
5743  0dca a30064        	cpw	x,#100
5744  0dcd 2604          	jrne	L1612
5745  0dcf               L3612:
5748  0dcf a601          	ld	a,#1
5749  0dd1 6b01          	ld	(OFST+0,sp),a
5750  0dd3               L1612:
5751                     ; 1188               if((key_account > long_press_time)  && (((key_account - press_300ms_time) %30) ==0))   key_effective =1;//speed up 0827
5753  0dd3 be93          	ldw	x,_key_account
5754  0dd5 a30065        	cpw	x,#101
5755  0dd8 2513          	jrult	L7612
5757  0dda be93          	ldw	x,_key_account
5758  0ddc 1d001e        	subw	x,#30
5759  0ddf a61e          	ld	a,#30
5760  0de1 62            	div	x,a
5761  0de2 5f            	clrw	x
5762  0de3 97            	ld	xl,a
5763  0de4 a30000        	cpw	x,#0
5764  0de7 2604          	jrne	L7612
5767  0de9 a601          	ld	a,#1
5768  0deb 6b01          	ld	(OFST+0,sp),a
5769  0ded               L7612:
5770                     ; 1189               if(key_effective)
5772  0ded 0d01          	tnz	(OFST+0,sp)
5773  0def 2603          	jrne	L641
5774  0df1 cc1167        	jp	L1712
5775  0df4               L641:
5776                     ; 1191 								if((key_scan_value_AH == VALUE_VIF2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))    	key_ok_bit =KEY_VIF2; 
5778  0df4 be90          	ldw	x,_key_scan_value_AH
5779  0df6 a32000        	cpw	x,#8192
5780  0df9 2610          	jrne	L3712
5782  0dfb be8c          	ldw	x,_key_scan_value_H
5783  0dfd 260c          	jrne	L3712
5785  0dff be8e          	ldw	x,_key_scan_value_L
5786  0e01 2608          	jrne	L3712
5789  0e03 35250092      	mov	_key_ok_bit,#37
5791  0e07 ac691169      	jpf	L7242
5792  0e0b               L3712:
5793                     ; 1192 		          	else	if((key_scan_value_AH == VALUE_BOOST2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_BOOST2; 
5795  0e0b be90          	ldw	x,_key_scan_value_AH
5796  0e0d a38000        	cpw	x,#32768
5797  0e10 2610          	jrne	L7712
5799  0e12 be8c          	ldw	x,_key_scan_value_H
5800  0e14 260c          	jrne	L7712
5802  0e16 be8e          	ldw	x,_key_scan_value_L
5803  0e18 2608          	jrne	L7712
5806  0e1a 35260092      	mov	_key_ok_bit,#38
5808  0e1e ac691169      	jpf	L7242
5809  0e22               L7712:
5810                     ; 1193 		          	else	if((key_scan_value_AH == VALUE_TDEC2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))     	key_ok_bit =KEY_TDEC2; 		          	
5812  0e22 be90          	ldw	x,_key_scan_value_AH
5813  0e24 a30001        	cpw	x,#1
5814  0e27 2610          	jrne	L3022
5816  0e29 be8c          	ldw	x,_key_scan_value_H
5817  0e2b 260c          	jrne	L3022
5819  0e2d be8e          	ldw	x,_key_scan_value_L
5820  0e2f 2608          	jrne	L3022
5823  0e31 35280092      	mov	_key_ok_bit,#40
5825  0e35 ac691169      	jpf	L7242
5826  0e39               L3022:
5827                     ; 1194 		            else	if((key_scan_value_AH == VALUE_ON2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_ON2;  
5829  0e39 be90          	ldw	x,_key_scan_value_AH
5830  0e3b a30100        	cpw	x,#256
5831  0e3e 2610          	jrne	L7022
5833  0e40 be8c          	ldw	x,_key_scan_value_H
5834  0e42 260c          	jrne	L7022
5836  0e44 be8e          	ldw	x,_key_scan_value_L
5837  0e46 2608          	jrne	L7022
5840  0e48 35210092      	mov	_key_ok_bit,#33
5842  0e4c ac691169      	jpf	L7242
5843  0e50               L7022:
5844                     ; 1195 		          	else	if((key_scan_value_AH == VALUE_DEC2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_DEC2; 
5846  0e50 be90          	ldw	x,_key_scan_value_AH
5847  0e52 a30200        	cpw	x,#512
5848  0e55 2610          	jrne	L3122
5850  0e57 be8c          	ldw	x,_key_scan_value_H
5851  0e59 260c          	jrne	L3122
5853  0e5b be8e          	ldw	x,_key_scan_value_L
5854  0e5d 2608          	jrne	L3122
5857  0e5f 35220092      	mov	_key_ok_bit,#34
5859  0e63 ac691169      	jpf	L7242
5860  0e67               L3122:
5861                     ; 1196 		          	else	if((key_scan_value_AH == VALUE_INC2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_INC2;  
5863  0e67 be90          	ldw	x,_key_scan_value_AH
5864  0e69 a30400        	cpw	x,#1024
5865  0e6c 2610          	jrne	L7122
5867  0e6e be8c          	ldw	x,_key_scan_value_H
5868  0e70 260c          	jrne	L7122
5870  0e72 be8e          	ldw	x,_key_scan_value_L
5871  0e74 2608          	jrne	L7122
5874  0e76 35230092      	mov	_key_ok_bit,#35
5876  0e7a ac691169      	jpf	L7242
5877  0e7e               L7122:
5878                     ; 1197 		   	        else	if((key_scan_value_AH == VALUE_DOUX2)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_DOUX2;  
5880  0e7e be90          	ldw	x,_key_scan_value_AH
5881  0e80 a30800        	cpw	x,#2048
5882  0e83 2610          	jrne	L3222
5884  0e85 be8c          	ldw	x,_key_scan_value_H
5885  0e87 260c          	jrne	L3222
5887  0e89 be8e          	ldw	x,_key_scan_value_L
5888  0e8b 2608          	jrne	L3222
5891  0e8d 35240092      	mov	_key_ok_bit,#36
5893  0e91 ac691169      	jpf	L7242
5894  0e95               L3222:
5895                     ; 1198 								else	if((key_scan_value_AH == VALUE_DOUX1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))   	key_ok_bit =KEY_DOUX1; 
5897  0e95 be90          	ldw	x,_key_scan_value_AH
5898  0e97 a30010        	cpw	x,#16
5899  0e9a 2610          	jrne	L7222
5901  0e9c be8c          	ldw	x,_key_scan_value_H
5902  0e9e 260c          	jrne	L7222
5904  0ea0 be8e          	ldw	x,_key_scan_value_L
5905  0ea2 2608          	jrne	L7222
5908  0ea4 35140092      	mov	_key_ok_bit,#20
5910  0ea8 ac691169      	jpf	L7242
5911  0eac               L7222:
5912                     ; 1199 								else	if((key_scan_value_AH == VALUE_INC1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))    	key_ok_bit =KEY_INC1;  
5914  0eac be90          	ldw	x,_key_scan_value_AH
5915  0eae a30020        	cpw	x,#32
5916  0eb1 2610          	jrne	L3322
5918  0eb3 be8c          	ldw	x,_key_scan_value_H
5919  0eb5 260c          	jrne	L3322
5921  0eb7 be8e          	ldw	x,_key_scan_value_L
5922  0eb9 2608          	jrne	L3322
5925  0ebb 35130092      	mov	_key_ok_bit,#19
5927  0ebf ac691169      	jpf	L7242
5928  0ec3               L3322:
5929                     ; 1200 								else	if((key_scan_value_AH == VALUE_DEC1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_DEC1; 
5931  0ec3 be90          	ldw	x,_key_scan_value_AH
5932  0ec5 a30080        	cpw	x,#128
5933  0ec8 2610          	jrne	L7322
5935  0eca be8c          	ldw	x,_key_scan_value_H
5936  0ecc 260c          	jrne	L7322
5938  0ece be8e          	ldw	x,_key_scan_value_L
5939  0ed0 2608          	jrne	L7322
5942  0ed2 35120092      	mov	_key_ok_bit,#18
5944  0ed6 ac691169      	jpf	L7242
5945  0eda               L7322:
5946                     ; 1201 		   	        else	if((key_scan_value_AH == VALUE_ON1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_ON1; 
5948  0eda be90          	ldw	x,_key_scan_value_AH
5949  0edc a30040        	cpw	x,#64
5950  0edf 2610          	jrne	L3422
5952  0ee1 be8c          	ldw	x,_key_scan_value_H
5953  0ee3 260c          	jrne	L3422
5955  0ee5 be8e          	ldw	x,_key_scan_value_L
5956  0ee7 2608          	jrne	L3422
5959  0ee9 35110092      	mov	_key_ok_bit,#17
5961  0eed ac691169      	jpf	L7242
5962  0ef1               L3422:
5963                     ; 1202 		          	else	if((key_scan_value_AH == VALUE_TIMER1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_TIMER1;  
5965  0ef1 be90          	ldw	x,_key_scan_value_AH
5966  0ef3 a30004        	cpw	x,#4
5967  0ef6 2610          	jrne	L7422
5969  0ef8 be8c          	ldw	x,_key_scan_value_H
5970  0efa 260c          	jrne	L7422
5972  0efc be8e          	ldw	x,_key_scan_value_L
5973  0efe 2608          	jrne	L7422
5976  0f00 35190092      	mov	_key_ok_bit,#25
5978  0f04 ac691169      	jpf	L7242
5979  0f08               L7422:
5980                     ; 1203 		          	else	if((key_scan_value_AH == VALUE_TDEC1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_TDEC1;  
5982  0f08 be90          	ldw	x,_key_scan_value_AH
5983  0f0a a30002        	cpw	x,#2
5984  0f0d 2610          	jrne	L3522
5986  0f0f be8c          	ldw	x,_key_scan_value_H
5987  0f11 260c          	jrne	L3522
5989  0f13 be8e          	ldw	x,_key_scan_value_L
5990  0f15 2608          	jrne	L3522
5993  0f17 35180092      	mov	_key_ok_bit,#24
5995  0f1b ac691169      	jpf	L7242
5996  0f1f               L3522:
5997                     ; 1204 		          	else	if((key_scan_value_AH == VALUE_BOOST1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_BOOST1;  
5999  0f1f be90          	ldw	x,_key_scan_value_AH
6000  0f21 a30008        	cpw	x,#8
6001  0f24 2610          	jrne	L7522
6003  0f26 be8c          	ldw	x,_key_scan_value_H
6004  0f28 260c          	jrne	L7522
6006  0f2a be8e          	ldw	x,_key_scan_value_L
6007  0f2c 2608          	jrne	L7522
6010  0f2e 35160092      	mov	_key_ok_bit,#22
6012  0f32 ac691169      	jpf	L7242
6013  0f36               L7522:
6014                     ; 1205 		          	else	if((key_scan_value_AH == VALUE_VIF1)&&(key_scan_value_H == 0x0000)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_VIF1;  
6016  0f36 be90          	ldw	x,_key_scan_value_AH
6017  0f38 a34000        	cpw	x,#16384
6018  0f3b 2610          	jrne	L3622
6020  0f3d be8c          	ldw	x,_key_scan_value_H
6021  0f3f 260c          	jrne	L3622
6023  0f41 be8e          	ldw	x,_key_scan_value_L
6024  0f43 2608          	jrne	L3622
6027  0f45 35150092      	mov	_key_ok_bit,#21
6029  0f49 ac691169      	jpf	L7242
6030  0f4d               L3622:
6031                     ; 1207 		   	        else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_INC4)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_INC4; 
6033  0f4d be90          	ldw	x,_key_scan_value_AH
6034  0f4f 2613          	jrne	L7622
6036  0f51 be8c          	ldw	x,_key_scan_value_H
6037  0f53 a30010        	cpw	x,#16
6038  0f56 260c          	jrne	L7622
6040  0f58 be8e          	ldw	x,_key_scan_value_L
6041  0f5a 2608          	jrne	L7622
6044  0f5c 35430092      	mov	_key_ok_bit,#67
6046  0f60 ac691169      	jpf	L7242
6047  0f64               L7622:
6048                     ; 1208                 else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_VIF4)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_VIF4;			
6050  0f64 be90          	ldw	x,_key_scan_value_AH
6051  0f66 2613          	jrne	L3722
6053  0f68 be8c          	ldw	x,_key_scan_value_H
6054  0f6a a30004        	cpw	x,#4
6055  0f6d 260c          	jrne	L3722
6057  0f6f be8e          	ldw	x,_key_scan_value_L
6058  0f71 2608          	jrne	L3722
6061  0f73 35450092      	mov	_key_ok_bit,#69
6063  0f77 ac691169      	jpf	L7242
6064  0f7b               L3722:
6065                     ; 1209 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_DOUX4)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_DOUX4;
6067  0f7b be90          	ldw	x,_key_scan_value_AH
6068  0f7d 2613          	jrne	L7722
6070  0f7f be8c          	ldw	x,_key_scan_value_H
6071  0f81 a30008        	cpw	x,#8
6072  0f84 260c          	jrne	L7722
6074  0f86 be8e          	ldw	x,_key_scan_value_L
6075  0f88 2608          	jrne	L7722
6078  0f8a 35440092      	mov	_key_ok_bit,#68
6080  0f8e ac691169      	jpf	L7242
6081  0f92               L7722:
6082                     ; 1210 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_DOUX3)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_DOUX3;
6084  0f92 be90          	ldw	x,_key_scan_value_AH
6085  0f94 2613          	jrne	L3032
6087  0f96 be8c          	ldw	x,_key_scan_value_H
6088  0f98 a32000        	cpw	x,#8192
6089  0f9b 260c          	jrne	L3032
6091  0f9d be8e          	ldw	x,_key_scan_value_L
6092  0f9f 2608          	jrne	L3032
6095  0fa1 35340092      	mov	_key_ok_bit,#52
6097  0fa5 ac691169      	jpf	L7242
6098  0fa9               L3032:
6099                     ; 1211 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_VIF3)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_VIF3;	
6101  0fa9 be90          	ldw	x,_key_scan_value_AH
6102  0fab 2613          	jrne	L7032
6104  0fad be8c          	ldw	x,_key_scan_value_H
6105  0faf a30100        	cpw	x,#256
6106  0fb2 260c          	jrne	L7032
6108  0fb4 be8e          	ldw	x,_key_scan_value_L
6109  0fb6 2608          	jrne	L7032
6112  0fb8 35350092      	mov	_key_ok_bit,#53
6114  0fbc ac691169      	jpf	L7242
6115  0fc0               L7032:
6116                     ; 1212 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_BOOST3)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_BOOST3;	
6118  0fc0 be90          	ldw	x,_key_scan_value_AH
6119  0fc2 2613          	jrne	L3132
6121  0fc4 be8c          	ldw	x,_key_scan_value_H
6122  0fc6 a38000        	cpw	x,#32768
6123  0fc9 260c          	jrne	L3132
6125  0fcb be8e          	ldw	x,_key_scan_value_L
6126  0fcd 2608          	jrne	L3132
6129  0fcf 35360092      	mov	_key_ok_bit,#54
6131  0fd3 ac691169      	jpf	L7242
6132  0fd7               L3132:
6133                     ; 1213 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_BOOST4)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_BOOST4;	
6135  0fd7 be90          	ldw	x,_key_scan_value_AH
6136  0fd9 2613          	jrne	L7132
6138  0fdb be8c          	ldw	x,_key_scan_value_H
6139  0fdd a30002        	cpw	x,#2
6140  0fe0 260c          	jrne	L7132
6142  0fe2 be8e          	ldw	x,_key_scan_value_L
6143  0fe4 2608          	jrne	L7132
6146  0fe6 35460092      	mov	_key_ok_bit,#70
6148  0fea ac691169      	jpf	L7242
6149  0fee               L7132:
6150                     ; 1214 						    else	if((key_scan_value_AH == 0x0000)&&(key_scan_value_H == VALUE_INC3)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_INC3;  
6152  0fee be90          	ldw	x,_key_scan_value_AH
6153  0ff0 2613          	jrne	L3232
6155  0ff2 be8c          	ldw	x,_key_scan_value_H
6156  0ff4 a34000        	cpw	x,#16384
6157  0ff7 260c          	jrne	L3232
6159  0ff9 be8e          	ldw	x,_key_scan_value_L
6160  0ffb 2608          	jrne	L3232
6163  0ffd 35330092      	mov	_key_ok_bit,#51
6165  1001 ac691169      	jpf	L7242
6166  1005               L3232:
6167                     ; 1215 								else	if((key_scan_value_AH == 0x0000)&&(key_scan_value_H == VALUE_TINC2)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_TINC2;  
6169  1005 be90          	ldw	x,_key_scan_value_AH
6170  1007 2613          	jrne	L7232
6172  1009 be8c          	ldw	x,_key_scan_value_H
6173  100b a31000        	cpw	x,#4096
6174  100e 260c          	jrne	L7232
6176  1010 be8e          	ldw	x,_key_scan_value_L
6177  1012 2608          	jrne	L7232
6180  1014 35270092      	mov	_key_ok_bit,#39
6182  1018 ac691169      	jpf	L7242
6183  101c               L7232:
6184                     ; 1216 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_ON3)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_ON3;
6186  101c be90          	ldw	x,_key_scan_value_AH
6187  101e 2613          	jrne	L3332
6189  1020 be8c          	ldw	x,_key_scan_value_H
6190  1022 a30200        	cpw	x,#512
6191  1025 260c          	jrne	L3332
6193  1027 be8e          	ldw	x,_key_scan_value_L
6194  1029 2608          	jrne	L3332
6197  102b 35310092      	mov	_key_ok_bit,#49
6199  102f ac691169      	jpf	L7242
6200  1033               L3332:
6201                     ; 1217 								else  if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_ON4)&&(key_scan_value_L ==0x0000))      	key_ok_bit =KEY_ON4;
6203  1033 be90          	ldw	x,_key_scan_value_AH
6204  1035 2613          	jrne	L7332
6206  1037 be8c          	ldw	x,_key_scan_value_H
6207  1039 a30080        	cpw	x,#128
6208  103c 260c          	jrne	L7332
6210  103e be8e          	ldw	x,_key_scan_value_L
6211  1040 2608          	jrne	L7332
6214  1042 35410092      	mov	_key_ok_bit,#65
6216  1046 ac691169      	jpf	L7242
6217  104a               L7332:
6218                     ; 1218 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_TIMER2)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_TIMER2; 
6220  104a be90          	ldw	x,_key_scan_value_AH
6221  104c 2613          	jrne	L3432
6223  104e be8c          	ldw	x,_key_scan_value_H
6224  1050 a30800        	cpw	x,#2048
6225  1053 260c          	jrne	L3432
6227  1055 be8e          	ldw	x,_key_scan_value_L
6228  1057 2608          	jrne	L3432
6231  1059 35290092      	mov	_key_ok_bit,#41
6233  105d ac691169      	jpf	L7242
6234  1061               L3432:
6235                     ; 1219 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_TINC1)&&(key_scan_value_L ==0x0000))	key_ok_bit =KEY_TINC1; 
6237  1061 be90          	ldw	x,_key_scan_value_AH
6238  1063 2613          	jrne	L7432
6240  1065 be8c          	ldw	x,_key_scan_value_H
6241  1067 a30040        	cpw	x,#64
6242  106a 260c          	jrne	L7432
6244  106c be8e          	ldw	x,_key_scan_value_L
6245  106e 2608          	jrne	L7432
6248  1070 35170092      	mov	_key_ok_bit,#23
6250  1074 ac691169      	jpf	L7242
6251  1078               L7432:
6252                     ; 1220 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H == VALUE_DEC3)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_DEC3;   
6254  1078 be90          	ldw	x,_key_scan_value_AH
6255  107a 2613          	jrne	L3532
6257  107c be8c          	ldw	x,_key_scan_value_H
6258  107e a30400        	cpw	x,#1024
6259  1081 260c          	jrne	L3532
6261  1083 be8e          	ldw	x,_key_scan_value_L
6262  1085 2608          	jrne	L3532
6265  1087 35320092      	mov	_key_ok_bit,#50
6267  108b ac691169      	jpf	L7242
6268  108f               L3532:
6269                     ; 1221 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H== VALUE_DEC4)&&(key_scan_value_L ==0x0000))	    	key_ok_bit =KEY_DEC4;
6271  108f be90          	ldw	x,_key_scan_value_AH
6272  1091 2613          	jrne	L7532
6274  1093 be8c          	ldw	x,_key_scan_value_H
6275  1095 a30020        	cpw	x,#32
6276  1098 260c          	jrne	L7532
6278  109a be8e          	ldw	x,_key_scan_value_L
6279  109c 2608          	jrne	L7532
6282  109e 35420092      	mov	_key_ok_bit,#66
6284  10a2 ac691169      	jpf	L7242
6285  10a6               L7532:
6286                     ; 1223 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TDEC4))	key_ok_bit =KEY_TDEC4;
6288  10a6 be90          	ldw	x,_key_scan_value_AH
6289  10a8 2613          	jrne	L3632
6291  10aa be8c          	ldw	x,_key_scan_value_H
6292  10ac 260f          	jrne	L3632
6294  10ae be8e          	ldw	x,_key_scan_value_L
6295  10b0 a30800        	cpw	x,#2048
6296  10b3 2608          	jrne	L3632
6299  10b5 35480092      	mov	_key_ok_bit,#72
6301  10b9 ac691169      	jpf	L7242
6302  10bd               L3632:
6303                     ; 1224 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TIMER4))	key_ok_bit =KEY_TIMER4;  
6305  10bd be90          	ldw	x,_key_scan_value_AH
6306  10bf 2613          	jrne	L7632
6308  10c1 be8c          	ldw	x,_key_scan_value_H
6309  10c3 260f          	jrne	L7632
6311  10c5 be8e          	ldw	x,_key_scan_value_L
6312  10c7 a30200        	cpw	x,#512
6313  10ca 2608          	jrne	L7632
6316  10cc 35490092      	mov	_key_ok_bit,#73
6318  10d0 ac691169      	jpf	L7242
6319  10d4               L7632:
6320                     ; 1225 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TINC4))	key_ok_bit =KEY_TINC4;
6322  10d4 be90          	ldw	x,_key_scan_value_AH
6323  10d6 2612          	jrne	L3732
6325  10d8 be8c          	ldw	x,_key_scan_value_H
6326  10da 260e          	jrne	L3732
6328  10dc be8e          	ldw	x,_key_scan_value_L
6329  10de a30400        	cpw	x,#1024
6330  10e1 2607          	jrne	L3732
6333  10e3 35470092      	mov	_key_ok_bit,#71
6335  10e7 cc1169        	jra	L7242
6336  10ea               L3732:
6337                     ; 1226 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TINC3))	key_ok_bit =KEY_TINC3;
6339  10ea be90          	ldw	x,_key_scan_value_AH
6340  10ec 2611          	jrne	L7732
6342  10ee be8c          	ldw	x,_key_scan_value_H
6343  10f0 260d          	jrne	L7732
6345  10f2 be8e          	ldw	x,_key_scan_value_L
6346  10f4 a30080        	cpw	x,#128
6347  10f7 2606          	jrne	L7732
6350  10f9 35370092      	mov	_key_ok_bit,#55
6352  10fd 206a          	jra	L7242
6353  10ff               L7732:
6354                     ; 1227 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TIMER3))	key_ok_bit =KEY_TIMER3; 
6356  10ff be90          	ldw	x,_key_scan_value_AH
6357  1101 2611          	jrne	L3042
6359  1103 be8c          	ldw	x,_key_scan_value_H
6360  1105 260d          	jrne	L3042
6362  1107 be8e          	ldw	x,_key_scan_value_L
6363  1109 a30020        	cpw	x,#32
6364  110c 2606          	jrne	L3042
6367  110e 35390092      	mov	_key_ok_bit,#57
6369  1112 2055          	jra	L7242
6370  1114               L3042:
6371                     ; 1228 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_LOCK))	  key_ok_bit =KEY_LOCK;
6373  1114 be90          	ldw	x,_key_scan_value_AH
6374  1116 2611          	jrne	L7042
6376  1118 be8c          	ldw	x,_key_scan_value_H
6377  111a 260d          	jrne	L7042
6379  111c be8e          	ldw	x,_key_scan_value_L
6380  111e a30100        	cpw	x,#256
6381  1121 2606          	jrne	L7042
6384  1123 35a30092      	mov	_key_ok_bit,#163
6386  1127 2040          	jra	L7242
6387  1129               L7042:
6388                     ; 1229 								else	if((key_scan_value_AH ==0x0000)&&(key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_TDEC3))	key_ok_bit =KEY_TDEC3; 																		
6390  1129 be90          	ldw	x,_key_scan_value_AH
6391  112b 2611          	jrne	L3142
6393  112d be8c          	ldw	x,_key_scan_value_H
6394  112f 260d          	jrne	L3142
6396  1131 be8e          	ldw	x,_key_scan_value_L
6397  1133 a30010        	cpw	x,#16
6398  1136 2606          	jrne	L3142
6401  1138 35380092      	mov	_key_ok_bit,#56
6403  113c 202b          	jra	L7242
6404  113e               L3142:
6405                     ; 1232 									if(key_scan_value_L &VALUE_ONOFF)  	    key_ok_bit =KEY_ONOFF;   //first deal for multi-apt solution
6407  113e b68f          	ld	a,_key_scan_value_L+1
6408  1140 a540          	bcp	a,#64
6409  1142 2706          	jreq	L7142
6412  1144 35a20092      	mov	_key_ok_bit,#162
6414  1148 201f          	jra	L7242
6415  114a               L7142:
6416                     ; 1235 										key_err_account++;
6418  114a be9b          	ldw	x,_key_err_account
6419  114c 1c0001        	addw	x,#1
6420  114f bf9b          	ldw	_key_err_account,x
6421                     ; 1236 										if(key_err_account == 10)   
6423  1151 be9b          	ldw	x,_key_err_account
6424  1153 a3000a        	cpw	x,#10
6425  1156 2611          	jrne	L7242
6426                     ; 1238 											if(Power_on_bz == TRUE)  
6428  1158 b620          	ld	a,_Power_on_bz
6429  115a a101          	cp	a,#1
6430  115c 260b          	jrne	L7242
6431                     ; 1239 											{Power_off_deal();buzzer_time = buz_1000ms;} //8s
6433  115e cd0818        	call	_Power_off_deal
6437  1161 35640027      	mov	_buzzer_time,#100
6438  1165 2002          	jra	L7242
6439  1167               L1712:
6440                     ; 1244               else key_ok_bit =0;                                                                            
6442  1167 3f92          	clr	_key_ok_bit
6443  1169               L7242:
6444                     ; 1245 }
6447  1169 84            	pop	a
6448  116a 81            	ret
6543                     ; 1246 void boost_x_time(u8 index,u16 *time_x,u8 *save_x,u8 *level_x,u8 select,u8 *count,u16 *zone_timer)
6543                     ; 1247 {
6544                     	switch	.text
6545  116b               _boost_x_time:
6547  116b 88            	push	a
6548       00000000      OFST:	set	0
6551                     ; 1248 	if((*time_x) ==300)
6553  116c 1e04          	ldw	x,(OFST+4,sp)
6554  116e 9093          	ldw	y,x
6555  1170 90fe          	ldw	y,(y)
6556  1172 90a3012c      	cpw	y,#300
6557  1176 260b          	jrne	L7742
6558                     ; 1250 		(*save_x) =(*level_x);	
6560  1178 1e08          	ldw	x,(OFST+8,sp)
6561  117a f6            	ld	a,(x)
6562  117b 1e06          	ldw	x,(OFST+6,sp)
6563  117d f7            	ld	(x),a
6564                     ; 1251 		(*level_x) =15;
6566  117e 1e08          	ldw	x,(OFST+8,sp)
6567  1180 a60f          	ld	a,#15
6568  1182 f7            	ld	(x),a
6569  1183               L7742:
6570                     ; 1253 	if(*time_x)  
6572  1183 1e04          	ldw	x,(OFST+4,sp)
6573  1185 e601          	ld	a,(1,x)
6574  1187 fa            	or	a,(x)
6575  1188 2733          	jreq	L1052
6576                     ; 1255 		(*time_x)--;
6578  118a 1e04          	ldw	x,(OFST+4,sp)
6579  118c 9093          	ldw	y,x
6580  118e fe            	ldw	x,(x)
6581  118f 1d0001        	subw	x,#1
6582  1192 90ff          	ldw	(y),x
6583                     ; 1256 		if((*time_x) ==0) 
6585  1194 1e04          	ldw	x,(OFST+4,sp)
6586  1196 e601          	ld	a,(1,x)
6587  1198 fa            	or	a,(x)
6588  1199 2622          	jrne	L1052
6589                     ; 1259 				(*level_x) =14;
6591  119b 1e08          	ldw	x,(OFST+8,sp)
6592  119d a60e          	ld	a,#14
6593  119f f7            	ld	(x),a
6594                     ; 1261 				if((*zone_timer)==0)  (*zone_timer) =120;	//setting 2h defult timer
6596  11a0 1e0d          	ldw	x,(OFST+13,sp)
6597  11a2 e601          	ld	a,(1,x)
6598  11a4 fa            	or	a,(x)
6599  11a5 2607          	jrne	L5052
6602  11a7 1e0d          	ldw	x,(OFST+13,sp)
6603  11a9 90ae0078      	ldw	y,#120
6604  11ad ff            	ldw	(x),y
6605  11ae               L5052:
6606                     ; 1263 				(*count)++;
6608  11ae 1e0b          	ldw	x,(OFST+11,sp)
6609  11b0 7c            	inc	(x)
6610                     ; 1264 				flex_deal(index);
6612  11b1 7b01          	ld	a,(OFST+1,sp)
6613  11b3 cd00ad        	call	_flex_deal
6615                     ; 1265 				boost_status &=~select;
6617  11b6 7b0a          	ld	a,(OFST+10,sp)
6618  11b8 43            	cpl	a
6619  11b9 b48b          	and	a,_boost_status
6620  11bb b78b          	ld	_boost_status,a
6621  11bd               L1052:
6622                     ; 1268 }
6625  11bd 84            	pop	a
6626  11be 81            	ret
6670                     ; 1269 void boost_time_deal(void)
6670                     ; 1270 {
6671                     	switch	.text
6672  11bf               _boost_time_deal:
6676                     ; 1271 	boost_x_time(1,&boost_time_1,&boost_1_save,&zone_1_level,Select_1_KEY,&boost_1_count,&zone_1_timer);
6678  11bf ae00ad        	ldw	x,#_zone_1_timer
6679  11c2 89            	pushw	x
6680  11c3 ae0020        	ldw	x,#_boost_1_count
6681  11c6 89            	pushw	x
6682  11c7 4b01          	push	#1
6683  11c9 ae00a7        	ldw	x,#_zone_1_level
6684  11cc 89            	pushw	x
6685  11cd ae006e        	ldw	x,#_boost_1_save
6686  11d0 89            	pushw	x
6687  11d1 ae0052        	ldw	x,#_boost_time_1
6688  11d4 89            	pushw	x
6689  11d5 a601          	ld	a,#1
6690  11d7 ad92          	call	_boost_x_time
6692  11d9 5b0b          	addw	sp,#11
6693                     ; 1272 	boost_x_time(2,&boost_time_2,&boost_2_save,&zone_2_level,Select_2_KEY,&boost_2_count,&zone_2_timer);
6695  11db ae00af        	ldw	x,#_zone_2_timer
6696  11de 89            	pushw	x
6697  11df ae0021        	ldw	x,#_boost_2_count
6698  11e2 89            	pushw	x
6699  11e3 4b02          	push	#2
6700  11e5 ae00a8        	ldw	x,#_zone_2_level
6701  11e8 89            	pushw	x
6702  11e9 ae006f        	ldw	x,#_boost_2_save
6703  11ec 89            	pushw	x
6704  11ed ae0054        	ldw	x,#_boost_time_2
6705  11f0 89            	pushw	x
6706  11f1 a602          	ld	a,#2
6707  11f3 cd116b        	call	_boost_x_time
6709  11f6 5b0b          	addw	sp,#11
6710                     ; 1273 	boost_x_time(3,&boost_time_3,&boost_3_save,&zone_3_level,Select_3_KEY,&boost_3_count,&zone_3_timer);
6712  11f8 ae00b1        	ldw	x,#_zone_3_timer
6713  11fb 89            	pushw	x
6714  11fc ae0022        	ldw	x,#_boost_3_count
6715  11ff 89            	pushw	x
6716  1200 4b04          	push	#4
6717  1202 ae00a9        	ldw	x,#_zone_3_level
6718  1205 89            	pushw	x
6719  1206 ae0070        	ldw	x,#_boost_3_save
6720  1209 89            	pushw	x
6721  120a ae0056        	ldw	x,#_boost_time_3
6722  120d 89            	pushw	x
6723  120e a603          	ld	a,#3
6724  1210 cd116b        	call	_boost_x_time
6726  1213 5b0b          	addw	sp,#11
6727                     ; 1274 	boost_x_time(4,&boost_time_4,&boost_4_save,&zone_4_level,Select_4_KEY,&boost_4_count,&zone_4_timer);
6729  1215 ae00b3        	ldw	x,#_zone_4_timer
6730  1218 89            	pushw	x
6731  1219 ae0023        	ldw	x,#_boost_4_count
6732  121c 89            	pushw	x
6733  121d 4b08          	push	#8
6734  121f ae00aa        	ldw	x,#_zone_4_level
6735  1222 89            	pushw	x
6736  1223 ae0071        	ldw	x,#_boost_4_save
6737  1226 89            	pushw	x
6738  1227 ae0058        	ldw	x,#_boost_time_4
6739  122a 89            	pushw	x
6740  122b a604          	ld	a,#4
6741  122d cd116b        	call	_boost_x_time
6743  1230 5b0b          	addw	sp,#11
6744                     ; 1275 } 
6747  1232 81            	ret
6821                     ; 1276 void auto_x_time_deal(u8 select,u16 *time1,u8 *save1,u8 *level1)
6821                     ; 1277 {
6822                     	switch	.text
6823  1233               _auto_x_time_deal:
6825  1233 88            	push	a
6826  1234 89            	pushw	x
6827       00000002      OFST:	set	2
6830                     ; 1278    u16 temp =(*time1);
6832  1235 1e06          	ldw	x,(OFST+4,sp)
6833  1237 fe            	ldw	x,(x)
6834  1238 1f01          	ldw	(OFST-1,sp),x
6835                     ; 1279 	 if(temp)  
6837  123a 1e01          	ldw	x,(OFST-1,sp)
6838  123c 271b          	jreq	L5552
6839                     ; 1281 			temp--;
6841  123e 1e01          	ldw	x,(OFST-1,sp)
6842  1240 1d0001        	subw	x,#1
6843  1243 1f01          	ldw	(OFST-1,sp),x
6844                     ; 1282 			if(temp ==0) {(*level1) =(*save1);sme_x_clr_power(select);}
6846  1245 1e01          	ldw	x,(OFST-1,sp)
6847  1247 260b          	jrne	L7552
6850  1249 1e08          	ldw	x,(OFST+6,sp)
6851  124b f6            	ld	a,(x)
6852  124c 1e0a          	ldw	x,(OFST+8,sp)
6853  124e f7            	ld	(x),a
6856  124f 7b03          	ld	a,(OFST+1,sp)
6857  1251 cd0067        	call	_sme_x_clr_power
6859  1254               L7552:
6860                     ; 1283 			(*time1) =temp;
6862  1254 1e06          	ldw	x,(OFST+4,sp)
6863  1256 1601          	ldw	y,(OFST-1,sp)
6864  1258 ff            	ldw	(x),y
6865  1259               L5552:
6866                     ; 1285 }
6869  1259 5b03          	addw	sp,#3
6870  125b 81            	ret
6906                     ; 1286 void auto_time_deal(void)
6906                     ; 1287 {
6907                     	switch	.text
6908  125c               _auto_time_deal:
6912                     ; 1288 	auto_x_time_deal(Select_1_KEY,&auto_time_1,&boost_1_save,&zone_1_level);
6914  125c ae00a7        	ldw	x,#_zone_1_level
6915  125f 89            	pushw	x
6916  1260 ae006e        	ldw	x,#_boost_1_save
6917  1263 89            	pushw	x
6918  1264 ae005a        	ldw	x,#_auto_time_1
6919  1267 89            	pushw	x
6920  1268 a601          	ld	a,#1
6921  126a adc7          	call	_auto_x_time_deal
6923  126c 5b06          	addw	sp,#6
6924                     ; 1289 	auto_x_time_deal(Select_2_KEY,&auto_time_2,&boost_2_save,&zone_2_level);
6926  126e ae00a8        	ldw	x,#_zone_2_level
6927  1271 89            	pushw	x
6928  1272 ae006f        	ldw	x,#_boost_2_save
6929  1275 89            	pushw	x
6930  1276 ae005c        	ldw	x,#_auto_time_2
6931  1279 89            	pushw	x
6932  127a a602          	ld	a,#2
6933  127c adb5          	call	_auto_x_time_deal
6935  127e 5b06          	addw	sp,#6
6936                     ; 1290 	auto_x_time_deal(Select_3_KEY,&auto_time_3,&boost_3_save,&zone_3_level);
6938  1280 ae00a9        	ldw	x,#_zone_3_level
6939  1283 89            	pushw	x
6940  1284 ae0070        	ldw	x,#_boost_3_save
6941  1287 89            	pushw	x
6942  1288 ae005e        	ldw	x,#_auto_time_3
6943  128b 89            	pushw	x
6944  128c a604          	ld	a,#4
6945  128e ada3          	call	_auto_x_time_deal
6947  1290 5b06          	addw	sp,#6
6948                     ; 1291 	auto_x_time_deal(Select_4_KEY,&auto_time_4,&boost_4_save,&zone_4_level);
6950  1292 ae00aa        	ldw	x,#_zone_4_level
6951  1295 89            	pushw	x
6952  1296 ae0071        	ldw	x,#_boost_4_save
6953  1299 89            	pushw	x
6954  129a ae0060        	ldw	x,#_auto_time_4
6955  129d 89            	pushw	x
6956  129e a608          	ld	a,#8
6957  12a0 ad91          	call	_auto_x_time_deal
6959  12a2 5b06          	addw	sp,#6
6960                     ; 1292 }	
6963  12a4 81            	ret
7034                     ; 1305 u8  Zone_Big_Set(u8 index,u8 level,u8 count,u8 data,u16 tw)  
7034                     ; 1306 {
7035                     	switch	.text
7036  12a5               _Zone_Big_Set:
7038  12a5 89            	pushw	x
7039       00000000      OFST:	set	0
7042                     ; 1307 	  if(level ==15)
7044  12a6 9f            	ld	a,xl
7045  12a7 a10f          	cp	a,#15
7046  12a9 264f          	jrne	L7262
7047                     ; 1309 	    if(index ==3)
7049  12ab 9e            	ld	a,xh
7050  12ac a103          	cp	a,#3
7051  12ae 262b          	jrne	L1362
7052                     ; 1311 	      if(count ==1)  data -=15;		//dec 300w 
7054  12b0 7b05          	ld	a,(OFST+5,sp)
7055  12b2 a101          	cp	a,#1
7056  12b4 2606          	jrne	L3362
7059  12b6 7b06          	ld	a,(OFST+6,sp)
7060  12b8 a00f          	sub	a,#15
7061  12ba 6b06          	ld	(OFST+6,sp),a
7062  12bc               L3362:
7063                     ; 1312 	      if(count ==2)  data -=30;		//dec 600w 
7065  12bc 7b05          	ld	a,(OFST+5,sp)
7066  12be a102          	cp	a,#2
7067  12c0 2606          	jrne	L5362
7070  12c2 7b06          	ld	a,(OFST+6,sp)
7071  12c4 a01e          	sub	a,#30
7072  12c6 6b06          	ld	(OFST+6,sp),a
7073  12c8               L5362:
7074                     ; 1313 	      if(count >2)   data -=50;		//dec 1000w 
7076  12c8 7b05          	ld	a,(OFST+5,sp)
7077  12ca a103          	cp	a,#3
7078  12cc 2403          	jruge	L261
7079  12ce cc138c        	jp	L7462
7080  12d1               L261:
7083  12d1 7b06          	ld	a,(OFST+6,sp)
7084  12d3 a032          	sub	a,#50
7085  12d5 6b06          	ld	(OFST+6,sp),a
7086  12d7 ac8c138c      	jpf	L7462
7087  12db               L1362:
7088                     ; 1317 	      if(count ==1)  data -=15;		//dec 300w 2300w
7090  12db 7b05          	ld	a,(OFST+5,sp)
7091  12dd a101          	cp	a,#1
7092  12df 2606          	jrne	L3462
7095  12e1 7b06          	ld	a,(OFST+6,sp)
7096  12e3 a00f          	sub	a,#15
7097  12e5 6b06          	ld	(OFST+6,sp),a
7098  12e7               L3462:
7099                     ; 1318 	      if(count >1)   data -=30;		//dec 600w 2000w
7101  12e7 7b05          	ld	a,(OFST+5,sp)
7102  12e9 a102          	cp	a,#2
7103  12eb 2403          	jruge	L461
7104  12ed cc138c        	jp	L7462
7105  12f0               L461:
7108  12f0 7b06          	ld	a,(OFST+6,sp)
7109  12f2 a01e          	sub	a,#30
7110  12f4 6b06          	ld	(OFST+6,sp),a
7111  12f6 ac8c138c      	jpf	L7462
7112  12fa               L7262:
7113                     ; 1323 			if(index ==1)		//1#
7115  12fa 7b01          	ld	a,(OFST+1,sp)
7116  12fc a101          	cp	a,#1
7117  12fe 2660          	jrne	L1562
7118                     ; 1325         if(limit_time ==0)
7120  1300 bea5          	ldw	x,_limit_time
7121  1302 262e          	jrne	L3562
7122                     ; 1327           if(tw >720)	  data =102;	//12min  1800w
7124  1304 1e07          	ldw	x,(OFST+7,sp)
7125  1306 a302d1        	cpw	x,#721
7126  1309 2504          	jrult	L5562
7129  130b a666          	ld	a,#102
7130  130d 6b06          	ld	(OFST+6,sp),a
7131  130f               L5562:
7132                     ; 1328    	      if(tw >900)	  data =97;	//15min  1700w
7134  130f 1e07          	ldw	x,(OFST+7,sp)
7135  1311 a30385        	cpw	x,#901
7136  1314 2504          	jrult	L7562
7139  1316 a661          	ld	a,#97
7140  1318 6b06          	ld	(OFST+6,sp),a
7141  131a               L7562:
7142                     ; 1329    	      if(tw >1200)	  data =85;	//20min  1500w
7144  131a 1e07          	ldw	x,(OFST+7,sp)
7145  131c a304b1        	cpw	x,#1201
7146  131f 2504          	jrult	L1662
7149  1321 a655          	ld	a,#85
7150  1323 6b06          	ld	(OFST+6,sp),a
7151  1325               L1662:
7152                     ; 1330    	      if(tw >1800)	  data =74;	//30min  1300w
7154  1325 1e07          	ldw	x,(OFST+7,sp)
7155  1327 a30709        	cpw	x,#1801
7156  132a 2560          	jrult	L7462
7159  132c a64a          	ld	a,#74
7160  132e 6b06          	ld	(OFST+6,sp),a
7161  1330 205a          	jra	L7462
7162  1332               L3562:
7163                     ; 1334           if(tw >420)	  data =102;	//7min  1800w
7165  1332 1e07          	ldw	x,(OFST+7,sp)
7166  1334 a301a5        	cpw	x,#421
7167  1337 2504          	jrult	L7662
7170  1339 a666          	ld	a,#102
7171  133b 6b06          	ld	(OFST+6,sp),a
7172  133d               L7662:
7173                     ; 1335    	      if(tw >600)	  data =97;	//10min  1700w
7175  133d 1e07          	ldw	x,(OFST+7,sp)
7176  133f a30259        	cpw	x,#601
7177  1342 2504          	jrult	L1762
7180  1344 a661          	ld	a,#97
7181  1346 6b06          	ld	(OFST+6,sp),a
7182  1348               L1762:
7183                     ; 1336    	      if(tw >780)	  data =85;	//13min  1500w
7185  1348 1e07          	ldw	x,(OFST+7,sp)
7186  134a a3030d        	cpw	x,#781
7187  134d 2504          	jrult	L3762
7190  134f a655          	ld	a,#85
7191  1351 6b06          	ld	(OFST+6,sp),a
7192  1353               L3762:
7193                     ; 1337    	      if(tw >1080)	  data =74;	//18min  1300w        	
7195  1353 1e07          	ldw	x,(OFST+7,sp)
7196  1355 a30439        	cpw	x,#1081
7197  1358 2532          	jrult	L7462
7200  135a a64a          	ld	a,#74
7201  135c 6b06          	ld	(OFST+6,sp),a
7202  135e 202c          	jra	L7462
7203  1360               L1562:
7204                     ; 1342 				if(tw >600)	  data =113;	//10min  2000w
7206  1360 1e07          	ldw	x,(OFST+7,sp)
7207  1362 a30259        	cpw	x,#601
7208  1365 2504          	jrult	L1072
7211  1367 a671          	ld	a,#113
7212  1369 6b06          	ld	(OFST+6,sp),a
7213  136b               L1072:
7214                     ; 1343 				if(tw >900)	  data =102;	//15min  1800w
7216  136b 1e07          	ldw	x,(OFST+7,sp)
7217  136d a30385        	cpw	x,#901
7218  1370 2504          	jrult	L3072
7221  1372 a666          	ld	a,#102
7222  1374 6b06          	ld	(OFST+6,sp),a
7223  1376               L3072:
7224                     ; 1344    	    if(tw >1200)	  data =90;	//20min  1500w
7226  1376 1e07          	ldw	x,(OFST+7,sp)
7227  1378 a304b1        	cpw	x,#1201
7228  137b 2504          	jrult	L5072
7231  137d a65a          	ld	a,#90
7232  137f 6b06          	ld	(OFST+6,sp),a
7233  1381               L5072:
7234                     ; 1345    	    if(tw >1800)	  data =85;	//30min  1400w       	
7236  1381 1e07          	ldw	x,(OFST+7,sp)
7237  1383 a30709        	cpw	x,#1801
7238  1386 2504          	jrult	L7462
7241  1388 a655          	ld	a,#85
7242  138a 6b06          	ld	(OFST+6,sp),a
7243  138c               L7462:
7244                     ; 1348     return(data);
7246  138c 7b06          	ld	a,(OFST+6,sp)
7249  138e 85            	popw	x
7250  138f 81            	ret
7312                     ; 1350 u8  Zone_Small_Set(u8 level,u8 count,u8 data,u16 tw) 
7312                     ; 1351 {
7313                     	switch	.text
7314  1390               _Zone_Small_Set:
7316  1390 89            	pushw	x
7317       00000000      OFST:	set	0
7320                     ; 1352       if(level ==15)
7322  1391 9e            	ld	a,xh
7323  1392 a10f          	cp	a,#15
7324  1394 2619          	jrne	L3472
7325                     ; 1354 	       if(count ==1)  data -=20;	//dec 200w  1600w
7327  1396 9f            	ld	a,xl
7328  1397 a101          	cp	a,#1
7329  1399 2606          	jrne	L5472
7332  139b 7b05          	ld	a,(OFST+5,sp)
7333  139d a014          	sub	a,#20
7334  139f 6b05          	ld	(OFST+5,sp),a
7335  13a1               L5472:
7336                     ; 1355 	       if(count >1)   data -=40;	//dec 400w  1500w
7338  13a1 7b02          	ld	a,(OFST+2,sp)
7339  13a3 a102          	cp	a,#2
7340  13a5 2552          	jrult	L1572
7343  13a7 7b05          	ld	a,(OFST+5,sp)
7344  13a9 a028          	sub	a,#40
7345  13ab 6b05          	ld	(OFST+5,sp),a
7346  13ad 204a          	jra	L1572
7347  13af               L3472:
7348                     ; 1359        if(zone_1_level <=6)	//same side 1# low power
7350  13af b6a7          	ld	a,_zone_1_level
7351  13b1 a107          	cp	a,#7
7352  13b3 2423          	jruge	L3572
7353                     ; 1361            if(tw >900)	  data =175;	//15min  1350w
7355  13b5 1e06          	ldw	x,(OFST+6,sp)
7356  13b7 a30385        	cpw	x,#901
7357  13ba 2504          	jrult	L5572
7360  13bc a6af          	ld	a,#175
7361  13be 6b05          	ld	(OFST+5,sp),a
7362  13c0               L5572:
7363                     ; 1362    	       if(tw >1200)	  data =162;	//20min  1250w
7365  13c0 1e06          	ldw	x,(OFST+6,sp)
7366  13c2 a304b1        	cpw	x,#1201
7367  13c5 2504          	jrult	L7572
7370  13c7 a6a2          	ld	a,#162
7371  13c9 6b05          	ld	(OFST+5,sp),a
7372  13cb               L7572:
7373                     ; 1363    	       if(tw >1800)	  data =133;	//30min	 1150w
7375  13cb 1e06          	ldw	x,(OFST+6,sp)
7376  13cd a30709        	cpw	x,#1801
7377  13d0 2527          	jrult	L1572
7380  13d2 a685          	ld	a,#133
7381  13d4 6b05          	ld	(OFST+5,sp),a
7382  13d6 2021          	jra	L1572
7383  13d8               L3572:
7384                     ; 1367            if(tw >420)	  data =175;	// 7min  1350w
7386  13d8 1e06          	ldw	x,(OFST+6,sp)
7387  13da a301a5        	cpw	x,#421
7388  13dd 2504          	jrult	L5672
7391  13df a6af          	ld	a,#175
7392  13e1 6b05          	ld	(OFST+5,sp),a
7393  13e3               L5672:
7394                     ; 1368    	       if(tw >540)	  data =162;	//9min  1250w
7396  13e3 1e06          	ldw	x,(OFST+6,sp)
7397  13e5 a3021d        	cpw	x,#541
7398  13e8 2504          	jrult	L7672
7401  13ea a6a2          	ld	a,#162
7402  13ec 6b05          	ld	(OFST+5,sp),a
7403  13ee               L7672:
7404                     ; 1369    	       if(tw >720)	  data =133;	//12min	 1150w        	
7406  13ee 1e06          	ldw	x,(OFST+6,sp)
7407  13f0 a302d1        	cpw	x,#721
7408  13f3 2504          	jrult	L1572
7411  13f5 a685          	ld	a,#133
7412  13f7 6b05          	ld	(OFST+5,sp),a
7413  13f9               L1572:
7414                     ; 1372      return(data);
7416  13f9 7b05          	ld	a,(OFST+5,sp)
7419  13fb 85            	popw	x
7420  13fc 81            	ret
7466                     ; 1374 void time_power_deal(void)
7466                     ; 1375 {
7467                     	switch	.text
7468  13fd               _time_power_deal:
7472                     ; 1376    	if(zone_1_level >8)  	//1#  
7474  13fd b6a7          	ld	a,_zone_1_level
7475  13ff a109          	cp	a,#9
7476  1401 2515          	jrult	L3003
7477                     ; 1378    			time_level_1  = Zone_Big_Set(1,zone_1_level,boost_1_count,arr_1_pow[6],work_1_time);
7479  1403 be9d          	ldw	x,_work_1_time
7480  1405 89            	pushw	x
7481  1406 4b9e          	push	#158
7482  1408 3b0020        	push	_boost_1_count
7483  140b b6a7          	ld	a,_zone_1_level
7484  140d 97            	ld	xl,a
7485  140e a601          	ld	a,#1
7486  1410 95            	ld	xh,a
7487  1411 cd12a5        	call	_Zone_Big_Set
7489  1414 5b04          	addw	sp,#4
7490  1416 b7d0          	ld	_time_level_1,a
7491  1418               L3003:
7492                     ; 1380    	if(zone_2_level >8)	//2#
7494  1418 b6a8          	ld	a,_zone_2_level
7495  141a a109          	cp	a,#9
7496  141c 2513          	jrult	L5003
7497                     ; 1382    			time_level_2 =Zone_Small_Set(zone_2_level,boost_2_count,arr_2_pow[6],work_2_time);
7499  141e be9f          	ldw	x,_work_2_time
7500  1420 89            	pushw	x
7501  1421 4be6          	push	#230
7502  1423 c60021        	ld	a,_boost_2_count
7503  1426 97            	ld	xl,a
7504  1427 b6a8          	ld	a,_zone_2_level
7505  1429 95            	ld	xh,a
7506  142a cd1390        	call	_Zone_Small_Set
7508  142d 5b03          	addw	sp,#3
7509  142f b7d1          	ld	_time_level_2,a
7510  1431               L5003:
7511                     ; 1384    	if(zone_3_level >8) 	//3#   
7513  1431 b6a9          	ld	a,_zone_3_level
7514  1433 a109          	cp	a,#9
7515  1435 2515          	jrult	L7003
7516                     ; 1386    			time_level_3  = Zone_Big_Set(3,zone_3_level,boost_3_count,arr_3_pow[6],work_3_time);
7518  1437 bea1          	ldw	x,_work_3_time
7519  1439 89            	pushw	x
7520  143a 4bd2          	push	#210
7521  143c 3b0022        	push	_boost_3_count
7522  143f b6a9          	ld	a,_zone_3_level
7523  1441 97            	ld	xl,a
7524  1442 a603          	ld	a,#3
7525  1444 95            	ld	xh,a
7526  1445 cd12a5        	call	_Zone_Big_Set
7528  1448 5b04          	addw	sp,#4
7529  144a b7d2          	ld	_time_level_3,a
7530  144c               L7003:
7531                     ; 1388    	if(zone_4_level >8)	//4#
7533  144c b6aa          	ld	a,_zone_4_level
7534  144e a109          	cp	a,#9
7535  1450 2513          	jrult	L1103
7536                     ; 1390    			time_level_4 =Zone_Small_Set(zone_4_level,boost_4_count,arr_4_pow[6],work_4_time);
7538  1452 bea3          	ldw	x,_work_4_time
7539  1454 89            	pushw	x
7540  1455 4be6          	push	#230
7541  1457 c60023        	ld	a,_boost_4_count
7542  145a 97            	ld	xl,a
7543  145b b6aa          	ld	a,_zone_4_level
7544  145d 95            	ld	xh,a
7545  145e cd1390        	call	_Zone_Small_Set
7547  1461 5b03          	addw	sp,#3
7548  1463 b7d3          	ld	_time_level_4,a
7549  1465               L1103:
7550                     ; 1392    	if((zone_1_level)&&(zone_2_level)&&(zone_3_level))  //1# 2# 3#
7552  1465 3da7          	tnz	_zone_1_level
7553  1467 271a          	jreq	L3103
7555  1469 3da8          	tnz	_zone_2_level
7556  146b 2716          	jreq	L3103
7558  146d 3da9          	tnz	_zone_3_level
7559  146f 2712          	jreq	L3103
7560                     ; 1394    			if(limit_time  ==0)  limit_time =1;
7562  1471 bea5          	ldw	x,_limit_time
7563  1473 2605          	jrne	L5103
7566  1475 ae0001        	ldw	x,#1
7567  1478 bfa5          	ldw	_limit_time,x
7568  147a               L5103:
7569                     ; 1400 			  limit_time++;
7571  147a bea5          	ldw	x,_limit_time
7572  147c 1c0001        	addw	x,#1
7573  147f bfa5          	ldw	_limit_time,x
7575  1481 2003          	jra	L7103
7576  1483               L3103:
7577                     ; 1402    	else  limit_time =0;
7579  1483 5f            	clrw	x
7580  1484 bfa5          	ldw	_limit_time,x
7581  1486               L7103:
7582                     ; 1403 }                                                   
7585  1486 81            	ret
7610                     ; 1404 void  short_key_buzzer(void)
7610                     ; 1405 {
7611                     	switch	.text
7612  1487               _short_key_buzzer:
7616                     ; 1406 	if(key_account == short_press_time)  buzzer_time = buz_120ms; 
7618  1487 be93          	ldw	x,_key_account
7619  1489 a30002        	cpw	x,#2
7620  148c 2604          	jrne	L1303
7623  148e 350c0027      	mov	_buzzer_time,#12
7624  1492               L1303:
7625                     ; 1407 }
7628  1492 81            	ret
7653                     ; 1408 void  inc_dec_deal(void)
7653                     ; 1409 {
7654                     	switch	.text
7655  1493               _inc_dec_deal:
7659                     ; 1410 	short_key_buzzer();
7661  1493 adf2          	call	_short_key_buzzer
7663                     ; 1412 	timer_precise_bz =TRUE;	 
7665  1495 35010019      	mov	_timer_precise_bz,#1
7666                     ; 1413 }
7669  1499 81            	ret
7694                     ; 1414 void  speed_up(void)
7694                     ; 1415 {
7695                     	switch	.text
7696  149a               _speed_up:
7700                     ; 1417 	Prepare_data_bz =TRUE;
7702  149a 3501001f      	mov	_Prepare_data_bz,#1
7703                     ; 1418 	Flash_500ms_bz =TRUE;
7705  149e 35010018      	mov	_Flash_500ms_bz,#1
7706                     ; 1420 }
7709  14a2 81            	ret
7739                     ; 1421 void  on_off_key_deal(void)
7739                     ; 1422 {
7740                     	switch	.text
7741  14a3               _on_off_key_deal:
7745                     ; 1423    if(key_account == short_press_time)
7747  14a3 be93          	ldw	x,_key_account
7748  14a5 a30002        	cpw	x,#2
7749  14a8 261f          	jrne	L3603
7750                     ; 1425         buzzer_time = buz_120ms;
7752  14aa 350c0027      	mov	_buzzer_time,#12
7753                     ; 1426 				version_dis_cnt = 0;
7755  14ae 725f000f      	clr	_version_dis_cnt
7756                     ; 1427         if(Power_on_bz == TRUE)  Power_off_deal();
7758  14b2 b620          	ld	a,_Power_on_bz
7759  14b4 a101          	cp	a,#1
7760  14b6 2605          	jrne	L5603
7763  14b8 cd0818        	call	_Power_off_deal
7766  14bb 200c          	jra	L3603
7767  14bd               L5603:
7768                     ; 1428         else         {Power_on_bz=TRUE; idle_count=60;lock_dis_cnt = LOCK_DIS_2S;}	
7770  14bd 35010020      	mov	_Power_on_bz,#1
7773  14c1 353c003a      	mov	_idle_count,#60
7776  14c5 35020010      	mov	_lock_dis_cnt,#2
7777  14c9               L3603:
7778                     ; 1430 }
7781  14c9 81            	ret
7805                     ; 1473 void  flex_L_key_deal(void)
7805                     ; 1474 {
7806                     	switch	.text
7807  14ca               _flex_L_key_deal:
7811                     ; 1476      	 	buzzer_time = buz_200ms;
7813  14ca 35140027      	mov	_buzzer_time,#20
7814                     ; 1494 } 
7817  14ce 81            	ret
7841                     ; 1495 void  flex_R_key_deal(void)
7841                     ; 1496 {
7842                     	switch	.text
7843  14cf               _flex_R_key_deal:
7847                     ; 1498      	 	buzzer_time = buz_200ms;
7849  14cf 35140027      	mov	_buzzer_time,#20
7850                     ; 1516 }  
7853  14d3 81            	ret
7885                     ; 1517 void  lock_key_deal(void)
7885                     ; 1518 {
7886                     	switch	.text
7887  14d4               _lock_key_deal:
7891                     ; 1519 	 if(lock_bz == FALSE) 
7893  14d4 3d25          	tnz	_lock_bz
7894  14d6 2631          	jrne	L1213
7895                     ; 1521 			if(key_account == lock_press_time)
7897  14d8 be93          	ldw	x,_key_account
7898  14da a300fa        	cpw	x,#250
7899  14dd 2668          	jrne	L5213
7900                     ; 1523 				buzzer_200ms_times = 2;//短响2声
7902  14df 35020008      	mov	_buzzer_200ms_times,#2
7903                     ; 1524 				lock_release_flg = FALSE;//按下
7905  14e3 725f0035      	clr	_lock_release_flg
7906                     ; 1525 				version_dis_cnt = 0;
7908  14e7 725f000f      	clr	_version_dis_cnt
7909                     ; 1526 				lock_bz =TRUE;
7911  14eb 35010025      	mov	_lock_bz,#1
7912                     ; 1527 				lock_dis_cnt = 5;
7914  14ef 35050010      	mov	_lock_dis_cnt,#5
7915                     ; 1528 				writeEEPROM(E2PROM_LOCK_ADDR, lock_bz);
7917  14f3 4b01          	push	#1
7918  14f5 ae4000        	ldw	x,#16384
7919  14f8 89            	pushw	x
7920  14f9 ae0000        	ldw	x,#0
7921  14fc 89            	pushw	x
7922  14fd cd0000        	call	_writeEEPROM
7924  1500 5b05          	addw	sp,#5
7925                     ; 1529 				key_account =lock_press_time+1;
7927  1502 ae00fb        	ldw	x,#251
7928  1505 bf93          	ldw	_key_account,x
7929  1507 203e          	jra	L5213
7930  1509               L1213:
7931                     ; 1534 			if( (key_account >= short_press_time)&&(lock_release_flg == TRUE) )
7933  1509 be93          	ldw	x,_key_account
7934  150b a30002        	cpw	x,#2
7935  150e 2513          	jrult	L7213
7937  1510 c60035        	ld	a,_lock_release_flg
7938  1513 a101          	cp	a,#1
7939  1515 260c          	jrne	L7213
7940                     ; 1536 				_10ms_cnt = 0;
7942  1517 3f1e          	clr	__10ms_cnt
7943                     ; 1537 				version_dis_cnt = 0;
7945  1519 725f000f      	clr	_version_dis_cnt
7946                     ; 1538 				lock_dis_cnt = 1;
7948  151d 35010010      	mov	_lock_dis_cnt,#1
7949                     ; 1539 				sec_LockFlag = FALSE;
7951  1521 3f1d          	clr	_sec_LockFlag
7952  1523               L7213:
7953                     ; 1541 			if(key_account == lock_press_time)
7955  1523 be93          	ldw	x,_key_account
7956  1525 a300fa        	cpw	x,#250
7957  1528 261d          	jrne	L5213
7958                     ; 1544 				buzzer_200ms_times = 2;//短响2声
7960  152a 35020008      	mov	_buzzer_200ms_times,#2
7961                     ; 1545 				version_dis_cnt = 0;
7963  152e 725f000f      	clr	_version_dis_cnt
7964                     ; 1546 				lock_bz =FALSE;
7966  1532 3f25          	clr	_lock_bz
7967                     ; 1547 				lock_dis_cnt = 0;
7969  1534 725f0010      	clr	_lock_dis_cnt
7970                     ; 1548 				writeEEPROM(E2PROM_LOCK_ADDR, lock_bz);
7972  1538 4b00          	push	#0
7973  153a ae4000        	ldw	x,#16384
7974  153d 89            	pushw	x
7975  153e ae0000        	ldw	x,#0
7976  1541 89            	pushw	x
7977  1542 cd0000        	call	_writeEEPROM
7979  1545 5b05          	addw	sp,#5
7980  1547               L5213:
7981                     ; 1551 }
7984  1547 81            	ret
8019                     ; 1588 void  key_x_deal(u8 select)
8019                     ; 1589 {
8020                     	switch	.text
8021  1548               _key_x_deal:
8025                     ; 1590 	buzzer_time = buz_200ms; 	 //0.5s continue increase one time 
8027  1548 35140027      	mov	_buzzer_time,#20
8028                     ; 1595 }
8031  154c 81            	ret
8143                     ; 1596 void  inc_x_key_level(u8 limit,u8 *count,u8 *zone_flash,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select,u16 *tim1,u16 *tim2,u8 *status)
8143                     ; 1597 {	
8144                     	switch	.text
8145  154d               _inc_x_key_level:
8147  154d 88            	push	a
8148       00000000      OFST:	set	0
8151                     ; 1598 	buzzer_5s_times = 0;
8153  154e 725f000c      	clr	_buzzer_5s_times
8154                     ; 1599 	if(key_account == short_press_time)
8156  1552 be93          	ldw	x,_key_account
8157  1554 a30002        	cpw	x,#2
8158  1557 2664          	jrne	L3223
8159                     ; 1601 	if(lock_bz == TRUE)
8161  1559 b625          	ld	a,_lock_bz
8162  155b a101          	cp	a,#1
8163  155d 260e          	jrne	L5223
8164                     ; 1603 		sec_LockFlag = FALSE;
8166  155f 3f1d          	clr	_sec_LockFlag
8167                     ; 1604 		_10ms_cnt = 0;
8169  1561 3f1e          	clr	__10ms_cnt
8170                     ; 1605 		lock_dis_cnt = LOCK_DIS_2S;
8172  1563 35020010      	mov	_lock_dis_cnt,#2
8173                     ; 1606 		buzzer_time = buz_120ms;
8175  1567 350c0027      	mov	_buzzer_time,#12
8177  156b 2050          	jra	L3223
8178  156d               L5223:
8179                     ; 1608 	else if(*status)
8181  156d 1e15          	ldw	x,(OFST+21,sp)
8182  156f 7d            	tnz	(x)
8183  1570 274b          	jreq	L3223
8184                     ; 1610 		if(time1 ==0)
8186  1572 1e0c          	ldw	x,(OFST+12,sp)
8187  1574 263f          	jrne	L3323
8188                     ; 1612 			if((*count) ==0)		(*count) =1;  
8190  1576 1e04          	ldw	x,(OFST+4,sp)
8191  1578 7d            	tnz	(x)
8192  1579 2607          	jrne	L5323
8195  157b 1e04          	ldw	x,(OFST+4,sp)
8196  157d a601          	ld	a,#1
8197  157f f7            	ld	(x),a
8199  1580 2033          	jra	L3323
8200  1582               L5323:
8201                     ; 1617 				if(limit<2)
8203  1582 7b01          	ld	a,(OFST+1,sp)
8204  1584 a102          	cp	a,#2
8205  1586 2413          	jruge	L1423
8206                     ; 1619 					(*level)++;
8208  1588 1e08          	ldw	x,(OFST+8,sp)
8209  158a 7c            	inc	(x)
8210                     ; 1620 					if((limit ==0)&&((*level)>14))   (*level) =14;
8212  158b 0d01          	tnz	(OFST+1,sp)
8213  158d 260c          	jrne	L1423
8215  158f 1e08          	ldw	x,(OFST+8,sp)
8216  1591 f6            	ld	a,(x)
8217  1592 a10f          	cp	a,#15
8218  1594 2505          	jrult	L1423
8221  1596 1e08          	ldw	x,(OFST+8,sp)
8222  1598 a60e          	ld	a,#14
8223  159a f7            	ld	(x),a
8224  159b               L1423:
8225                     ; 1629 				(*count) =2;	
8227  159b 1e04          	ldw	x,(OFST+4,sp)
8228  159d a602          	ld	a,#2
8229  159f f7            	ld	(x),a
8230                     ; 1637 				if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
8232  15a0 b649          	ld	a,_timer_status
8233  15a2 1510          	bcp	a,(OFST+16,sp)
8234  15a4 260f          	jrne	L3323
8237  15a6 1e08          	ldw	x,(OFST+8,sp)
8238  15a8 f6            	ld	a,(x)
8239  15a9 5f            	clrw	x
8240  15aa 97            	ld	xl,a
8241  15ab 58            	sllw	x
8242  15ac 1611          	ldw	y,(OFST+17,sp)
8243  15ae 89            	pushw	x
8244  15af de0000        	ldw	x,(_arr_default_timer,x)
8245  15b2 90ff          	ldw	(y),x
8246  15b4 85            	popw	x
8247  15b5               L3323:
8248                     ; 1640 		(*zone_flash) =10; 	
8250  15b5 1e06          	ldw	x,(OFST+6,sp)
8251  15b7 a60a          	ld	a,#10
8252  15b9 f7            	ld	(x),a
8253                     ; 1641 		short_key_buzzer();	
8255  15ba cd1487        	call	_short_key_buzzer
8257  15bd               L3223:
8258                     ; 1644 }
8261  15bd 84            	pop	a
8262  15be 81            	ret
8265                     	bsct
8266  00e7               L7423_local_inc_cnt:
8267  00e7 00            	dc.b	0
8343                     ; 1645 void  inc_x_timer(u8 select,u16 *timer,u8 *count,u8 *timer_1min_cnt)
8343                     ; 1646 {
8344                     	switch	.text
8345  15bf               _inc_x_timer:
8347  15bf 88            	push	a
8348       00000000      OFST:	set	0
8351                     ; 1649 	buzzer_5s_times = 0;
8353  15c0 725f000c      	clr	_buzzer_5s_times
8354                     ; 1650 	if(timer_status & select) 
8356  15c4 b449          	and	a,_timer_status
8357  15c6 274b          	jreq	L7033
8358                     ; 1652 		if(key_account == short_press_time) 
8360  15c8 be93          	ldw	x,_key_account
8361  15ca a30002        	cpw	x,#2
8362  15cd 2612          	jrne	L1133
8363                     ; 1654 			buzzer_time = buz_120ms; 
8365  15cf 350c0027      	mov	_buzzer_time,#12
8366                     ; 1655 			local_inc_cnt = 0;
8368  15d3 3fe7          	clr	L7423_local_inc_cnt
8369                     ; 1656 			(*timer)++;
8371  15d5 1e04          	ldw	x,(OFST+4,sp)
8372  15d7 9093          	ldw	y,x
8373  15d9 fe            	ldw	x,(x)
8374  15da 1c0001        	addw	x,#1
8375  15dd 90ff          	ldw	(y),x
8377  15df 202a          	jra	L3133
8378  15e1               L1133:
8379                     ; 1658 		else if(*timer < 95)
8381  15e1 1e04          	ldw	x,(OFST+4,sp)
8382  15e3 9093          	ldw	y,x
8383  15e5 90fe          	ldw	y,(y)
8384  15e7 90a3005f      	cpw	y,#95
8385  15eb 241e          	jruge	L3133
8386                     ; 1660 			local_inc_cnt++;
8388  15ed 3ce7          	inc	L7423_local_inc_cnt
8389                     ; 1661 			if(local_inc_cnt < 15)
8391  15ef b6e7          	ld	a,L7423_local_inc_cnt
8392  15f1 a10f          	cp	a,#15
8393  15f3 240c          	jruge	L7133
8394                     ; 1662 			(*timer)++;
8396  15f5 1e04          	ldw	x,(OFST+4,sp)
8397  15f7 9093          	ldw	y,x
8398  15f9 fe            	ldw	x,(x)
8399  15fa 1c0001        	addw	x,#1
8400  15fd 90ff          	ldw	(y),x
8402  15ff 200a          	jra	L3133
8403  1601               L7133:
8404                     ; 1664 			(*timer) +=5;
8406  1601 1e04          	ldw	x,(OFST+4,sp)
8407  1603 9093          	ldw	y,x
8408  1605 fe            	ldw	x,(x)
8409  1606 1c0005        	addw	x,#5
8410  1609 90ff          	ldw	(y),x
8411  160b               L3133:
8412                     ; 1666 		(*count) =10;
8414  160b 1e06          	ldw	x,(OFST+6,sp)
8415  160d a60a          	ld	a,#10
8416  160f f7            	ld	(x),a
8417                     ; 1667 		*timer_1min_cnt = 0;
8419  1610 1e08          	ldw	x,(OFST+8,sp)
8420  1612 7f            	clr	(x)
8421  1613               L7033:
8422                     ; 1670 	if((*timer) >99)  (*timer)  =0; 
8424  1613 1e04          	ldw	x,(OFST+4,sp)
8425  1615 9093          	ldw	y,x
8426  1617 90fe          	ldw	y,(y)
8427  1619 90a30064      	cpw	y,#100
8428  161d 2505          	jrult	L3233
8431  161f 1e04          	ldw	x,(OFST+4,sp)
8432  1621 905f          	clrw	y
8433  1623 ff            	ldw	(x),y
8434  1624               L3233:
8435                     ; 1671 	general_timer =0;   //if setting to timer function ,clear counter function
8437  1624 3fab          	clr	_general_timer
8438                     ; 1672 }
8441  1626 84            	pop	a
8442  1627 81            	ret
8545                     ; 1673 void  dec_x_key_level(u8 limit,u8 *count,u8 *zone_flash,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2,u8 *status)
8545                     ; 1674 {
8546                     	switch	.text
8547  1628               _dec_x_key_level:
8549  1628 88            	push	a
8550       00000000      OFST:	set	0
8553                     ; 1675 	buzzer_5s_times = 0;
8555  1629 725f000c      	clr	_buzzer_5s_times
8556                     ; 1676 	if(key_account == short_press_time)
8558  162d be93          	ldw	x,_key_account
8559  162f a30002        	cpw	x,#2
8560  1632 2702          	jreq	L022
8561  1634 2078          	jp	L3733
8562  1636               L022:
8563                     ; 1678 	if(lock_bz == TRUE)
8565  1636 b625          	ld	a,_lock_bz
8566  1638 a101          	cp	a,#1
8567  163a 260e          	jrne	L5733
8568                     ; 1680 		sec_LockFlag = FALSE;
8570  163c 3f1d          	clr	_sec_LockFlag
8571                     ; 1681 		_10ms_cnt = 0;
8573  163e 3f1e          	clr	__10ms_cnt
8574                     ; 1682 		lock_dis_cnt = LOCK_DIS_2S;
8576  1640 35020010      	mov	_lock_dis_cnt,#2
8577                     ; 1683 		buzzer_time = buz_120ms;
8579  1644 350c0027      	mov	_buzzer_time,#12
8581  1648 2064          	jra	L3733
8582  164a               L5733:
8583                     ; 1685 	else if(*status)
8585  164a 1e15          	ldw	x,(OFST+21,sp)
8586  164c 7d            	tnz	(x)
8587  164d 275f          	jreq	L3733
8588                     ; 1689   	  if((*count) ==0)		(*count) =1;  
8590  164f 1e04          	ldw	x,(OFST+4,sp)
8591  1651 7d            	tnz	(x)
8592  1652 2607          	jrne	L3043
8595  1654 1e04          	ldw	x,(OFST+4,sp)
8596  1656 a601          	ld	a,#1
8597  1658 f7            	ld	(x),a
8599  1659 203b          	jra	L5043
8600  165b               L3043:
8601                     ; 1692     		if(((*count) ==1) && ((*level) ==0))  	(*level) = default_level;
8603  165b 1e04          	ldw	x,(OFST+4,sp)
8604  165d f6            	ld	a,(x)
8605  165e a101          	cp	a,#1
8606  1660 260c          	jrne	L7043
8608  1662 1e08          	ldw	x,(OFST+8,sp)
8609  1664 7d            	tnz	(x)
8610  1665 2607          	jrne	L7043
8613  1667 1e08          	ldw	x,(OFST+8,sp)
8614  1669 a60e          	ld	a,#14
8615  166b f7            	ld	(x),a
8617  166c 200e          	jra	L1143
8618  166e               L7043:
8619                     ; 1693 	     	else if(limit <=2)	
8621  166e 7b01          	ld	a,(OFST+1,sp)
8622  1670 a103          	cp	a,#3
8623  1672 2408          	jruge	L1143
8624                     ; 1698 					if(--(*level) ==0)
8626  1674 1e08          	ldw	x,(OFST+8,sp)
8627  1676 7a            	dec	(x)
8628  1677 2603          	jrne	L1143
8629                     ; 1700 						*status = FALSE;
8631  1679 1e15          	ldw	x,(OFST+21,sp)
8632  167b 7f            	clr	(x)
8633  167c               L1143:
8634                     ; 1704     		(*count) =2;
8636  167c 1e04          	ldw	x,(OFST+4,sp)
8637  167e a602          	ld	a,#2
8638  1680 f7            	ld	(x),a
8639                     ; 1713 				if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
8641  1681 b649          	ld	a,_timer_status
8642  1683 1510          	bcp	a,(OFST+16,sp)
8643  1685 260f          	jrne	L5043
8646  1687 1e08          	ldw	x,(OFST+8,sp)
8647  1689 f6            	ld	a,(x)
8648  168a 5f            	clrw	x
8649  168b 97            	ld	xl,a
8650  168c 58            	sllw	x
8651  168d 1611          	ldw	y,(OFST+17,sp)
8652  168f 89            	pushw	x
8653  1690 de0000        	ldw	x,(_arr_default_timer,x)
8654  1693 90ff          	ldw	(y),x
8655  1695 85            	popw	x
8656  1696               L5043:
8657                     ; 1716 		if(*status)
8659  1696 1e15          	ldw	x,(OFST+21,sp)
8660  1698 7d            	tnz	(x)
8661  1699 270a          	jreq	L1243
8662                     ; 1718 			(*zone_flash) = 10;
8664  169b 1e06          	ldw	x,(OFST+6,sp)
8665  169d a60a          	ld	a,#10
8666  169f f7            	ld	(x),a
8667                     ; 1719 			short_key_buzzer();
8669  16a0 cd1487        	call	_short_key_buzzer
8672  16a3 2009          	jra	L3733
8673  16a5               L1243:
8674                     ; 1723 			buzzer_time = buz_1000ms;
8676  16a5 35640027      	mov	_buzzer_time,#100
8677                     ; 1724 			(*zone_flash) = 3;
8679  16a9 1e06          	ldw	x,(OFST+6,sp)
8680  16ab a603          	ld	a,#3
8681  16ad f7            	ld	(x),a
8682  16ae               L3733:
8683                     ; 1728 }
8686  16ae 84            	pop	a
8687  16af 81            	ret
8690                     	bsct
8691  00e8               L5243_local_dec_cnt:
8692  00e8 00            	dc.b	0
8769                     ; 1729 void  dec_x_timer(u8 select,u16 *timer,u8 *count,u8 *timer_1min_cnt)
8769                     ; 1730 {
8770                     	switch	.text
8771  16b0               _dec_x_timer:
8773  16b0 88            	push	a
8774       00000000      OFST:	set	0
8777                     ; 1732 	buzzer_5s_times = 0;
8779  16b1 725f000c      	clr	_buzzer_5s_times
8780                     ; 1733 	if((timer_status & select)&&(min_hold_flg == 0)) 
8782  16b5 b449          	and	a,_timer_status
8783  16b7 2603cc1742    	jreq	L5643
8785  16bc 725d0034      	tnz	_min_hold_flg
8786  16c0 26f7          	jrne	L5643
8787                     ; 1735 		if(key_account == short_press_time)
8789  16c2 be93          	ldw	x,_key_account
8790  16c4 a30002        	cpw	x,#2
8791  16c7 2632          	jrne	L7643
8792                     ; 1737 			buzzer_time = buz_120ms; 
8794  16c9 350c0027      	mov	_buzzer_time,#12
8795                     ; 1738 			local_dec_cnt = 0;
8797  16cd 3fe8          	clr	L5243_local_dec_cnt
8798                     ; 1739 			if((*timer)) (*timer)--;
8800  16cf 1e04          	ldw	x,(OFST+4,sp)
8801  16d1 e601          	ld	a,(1,x)
8802  16d3 fa            	or	a,(x)
8803  16d4 270c          	jreq	L1743
8806  16d6 1e04          	ldw	x,(OFST+4,sp)
8807  16d8 9093          	ldw	y,x
8808  16da fe            	ldw	x,(x)
8809  16db 1d0001        	subw	x,#1
8810  16de 90ff          	ldw	(y),x
8812  16e0 2007          	jra	L3743
8813  16e2               L1743:
8814                     ; 1740 			else (*timer) =99;
8816  16e2 1e04          	ldw	x,(OFST+4,sp)
8817  16e4 90ae0063      	ldw	y,#99
8818  16e8 ff            	ldw	(x),y
8819  16e9               L3743:
8820                     ; 1741 			if(*timer == 1) min_hold_flg = 2;
8822  16e9 1e04          	ldw	x,(OFST+4,sp)
8823  16eb 9093          	ldw	y,x
8824  16ed 90fe          	ldw	y,(y)
8825  16ef 90a30001      	cpw	y,#1
8826  16f3 2645          	jrne	L7743
8829  16f5 35020034      	mov	_min_hold_flg,#2
8830  16f9 203f          	jra	L7743
8831  16fb               L7643:
8832                     ; 1745 			local_dec_cnt++;
8834  16fb 3ce8          	inc	L5243_local_dec_cnt
8835                     ; 1746 			if((*timer) >5)
8837  16fd 1e04          	ldw	x,(OFST+4,sp)
8838  16ff 9093          	ldw	y,x
8839  1701 90fe          	ldw	y,(y)
8840  1703 90a30006      	cpw	y,#6
8841  1707 2531          	jrult	L7743
8842                     ; 1748 				if(local_dec_cnt < 15)
8844  1709 b6e8          	ld	a,L5243_local_dec_cnt
8845  170b a10f          	cp	a,#15
8846  170d 240c          	jruge	L3053
8847                     ; 1750 					(*timer)--;
8849  170f 1e04          	ldw	x,(OFST+4,sp)
8850  1711 9093          	ldw	y,x
8851  1713 fe            	ldw	x,(x)
8852  1714 1d0001        	subw	x,#1
8853  1717 90ff          	ldw	(y),x
8855  1719 201f          	jra	L7743
8856  171b               L3053:
8857                     ; 1752 				else if(*timer <= 9)
8859  171b 1e04          	ldw	x,(OFST+4,sp)
8860  171d 9093          	ldw	y,x
8861  171f 90fe          	ldw	y,(y)
8862  1721 90a3000a      	cpw	y,#10
8863  1725 2409          	jruge	L7053
8864                     ; 1754 					(*timer) = 5;
8866  1727 1e04          	ldw	x,(OFST+4,sp)
8867  1729 90ae0005      	ldw	y,#5
8868  172d ff            	ldw	(x),y
8870  172e 200a          	jra	L7743
8871  1730               L7053:
8872                     ; 1758 					(*timer) -=5;
8874  1730 1e04          	ldw	x,(OFST+4,sp)
8875  1732 9093          	ldw	y,x
8876  1734 fe            	ldw	x,(x)
8877  1735 1d0005        	subw	x,#5
8878  1738 90ff          	ldw	(y),x
8879  173a               L7743:
8880                     ; 1762 		(*count) =10;
8882  173a 1e06          	ldw	x,(OFST+6,sp)
8883  173c a60a          	ld	a,#10
8884  173e f7            	ld	(x),a
8885                     ; 1763 		*timer_1min_cnt = 0;
8887  173f 1e08          	ldw	x,(OFST+8,sp)
8888  1741 7f            	clr	(x)
8889  1742               L5643:
8890                     ; 1766   general_timer =0;   //if setting to timer function ,clear counter function
8892  1742 3fab          	clr	_general_timer
8893                     ; 1767 }
8896  1744 84            	pop	a
8897  1745 81            	ret
8949                     ; 2159 u8 Warm_function_deal(u8 T_temp,u8 work_time)
8949                     ; 2160 {
8950                     	switch	.text
8951  1746               _Warm_function_deal:
8953  1746 89            	pushw	x
8954  1747 88            	push	a
8955       00000001      OFST:	set	1
8958                     ; 2161 	u8 warm_level =1;
8960  1748 a601          	ld	a,#1
8961  174a 6b01          	ld	(OFST+0,sp),a
8962                     ; 2162 	if(work_time <=60)
8964  174c 9f            	ld	a,xl
8965  174d a13d          	cp	a,#61
8966  174f 241a          	jruge	L1453
8967                     ; 2164 		if((T_temp >CON_TMAIN_50)&&(T_temp <CON_TMAIN_55)) warm_level =2;
8969  1751 9e            	ld	a,xh
8970  1752 a14c          	cp	a,#76
8971  1754 2509          	jrult	L3453
8973  1756 9e            	ld	a,xh
8974  1757 a155          	cp	a,#85
8975  1759 2404          	jruge	L3453
8978  175b a602          	ld	a,#2
8979  175d 6b01          	ld	(OFST+0,sp),a
8980  175f               L3453:
8981                     ; 2165 		if(T_temp <=CON_TMAIN_50)  warm_level =4;
8983  175f 7b02          	ld	a,(OFST+1,sp)
8984  1761 a14c          	cp	a,#76
8985  1763 2420          	jruge	L7453
8988  1765 a604          	ld	a,#4
8989  1767 6b01          	ld	(OFST+0,sp),a
8990  1769 201a          	jra	L7453
8991  176b               L1453:
8992                     ; 2169 		if((T_temp >CON_TMAIN_45)&&(T_temp <CON_TMAIN_50)) warm_level =2;
8994  176b 7b02          	ld	a,(OFST+1,sp)
8995  176d a142          	cp	a,#66
8996  176f 250a          	jrult	L1553
8998  1771 7b02          	ld	a,(OFST+1,sp)
8999  1773 a14b          	cp	a,#75
9000  1775 2404          	jruge	L1553
9003  1777 a602          	ld	a,#2
9004  1779 6b01          	ld	(OFST+0,sp),a
9005  177b               L1553:
9006                     ; 2170 		if(T_temp <=CON_TMAIN_45)  warm_level =4;
9008  177b 7b02          	ld	a,(OFST+1,sp)
9009  177d a142          	cp	a,#66
9010  177f 2404          	jruge	L7453
9013  1781 a604          	ld	a,#4
9014  1783 6b01          	ld	(OFST+0,sp),a
9015  1785               L7453:
9016                     ; 2172 	return(warm_level);
9018  1785 7b01          	ld	a,(OFST+0,sp)
9021  1787 5b03          	addw	sp,#3
9022  1789 81            	ret
9122                     ; 2174 void on_x_set(u8 *status,u16 *timer,u8 *level,u8 *timeout,u8 *flash_cnt,u8 level_2,u8 level_3)
9122                     ; 2175 {
9123                     	switch	.text
9124  178a               _on_x_set:
9126  178a 89            	pushw	x
9127       00000000      OFST:	set	0
9130                     ; 2176 	buzzer_5s_times = 0;
9132  178b 725f000c      	clr	_buzzer_5s_times
9133                     ; 2177 	if(*status)
9135  178f 7d            	tnz	(x)
9136  1790 2727          	jreq	L3263
9137                     ; 2179 		(*status)=FALSE;
9139  1792 7f            	clr	(x)
9140                     ; 2181 		buzzer_time = buz_1000ms;
9142  1793 35640027      	mov	_buzzer_time,#100
9143                     ; 2182 		(*level) =0;
9145  1797 1e07          	ldw	x,(OFST+7,sp)
9146  1799 7f            	clr	(x)
9147                     ; 2183 		*timer = 0;
9149  179a 1e05          	ldw	x,(OFST+5,sp)
9150  179c 905f          	clrw	y
9151  179e ff            	ldw	(x),y
9152                     ; 2184 		*flash_cnt = 0;
9154  179f 1e0b          	ldw	x,(OFST+11,sp)
9155  17a1 7f            	clr	(x)
9156                     ; 2185 		if( ((level_2 + level_3) == 0)&&(lock_bz == TRUE) )
9158  17a2 7b0d          	ld	a,(OFST+13,sp)
9159  17a4 5f            	clrw	x
9160  17a5 1b0e          	add	a,(OFST+14,sp)
9161  17a7 2401          	jrnc	L032
9162  17a9 5c            	incw	x
9163  17aa               L032:
9164  17aa 02            	rlwa	x,a
9165  17ab 5d            	tnzw	x
9166  17ac 2637          	jrne	L7263
9168  17ae b625          	ld	a,_lock_bz
9169  17b0 a101          	cp	a,#1
9170  17b2 2631          	jrne	L7263
9171                     ; 2187 			Power_off_deal();
9173  17b4 cd0818        	call	_Power_off_deal
9175  17b7 202c          	jra	L7263
9176  17b9               L3263:
9177                     ; 2192 		if(lock_bz == TRUE)
9179  17b9 b625          	ld	a,_lock_bz
9180  17bb a101          	cp	a,#1
9181  17bd 260e          	jrne	L1363
9182                     ; 2194 			sec_LockFlag = FALSE;
9184  17bf 3f1d          	clr	_sec_LockFlag
9185                     ; 2195 			_10ms_cnt = 0;
9187  17c1 3f1e          	clr	__10ms_cnt
9188                     ; 2196 			lock_dis_cnt = LOCK_DIS_2S;
9190  17c3 35020010      	mov	_lock_dis_cnt,#2
9191                     ; 2197 			buzzer_time = buz_120ms;
9193  17c7 350c0027      	mov	_buzzer_time,#12
9195  17cb 2018          	jra	L7263
9196  17cd               L1363:
9197                     ; 2199 		else if((*timer) == 0)//没有计时的情况下才可以开炉头
9199  17cd 1e05          	ldw	x,(OFST+5,sp)
9200  17cf e601          	ld	a,(1,x)
9201  17d1 fa            	or	a,(x)
9202  17d2 2611          	jrne	L7263
9203                     ; 2201 			*timeout = Zone_TurnOff_Time;
9205  17d4 1e09          	ldw	x,(OFST+9,sp)
9206  17d6 a608          	ld	a,#8
9207  17d8 f7            	ld	(x),a
9208                     ; 2202 			(*status) =TRUE;
9210  17d9 1e01          	ldw	x,(OFST+1,sp)
9211  17db a601          	ld	a,#1
9212  17dd f7            	ld	(x),a
9213                     ; 2203 			buzzer_time = buz_120ms;
9215  17de 350c0027      	mov	_buzzer_time,#12
9216                     ; 2204 			(*level) =0;
9218  17e2 1e07          	ldw	x,(OFST+7,sp)
9219  17e4 7f            	clr	(x)
9220  17e5               L7263:
9221                     ; 2209 }
9224  17e5 85            	popw	x
9225  17e6 81            	ret
9350                     ; 2210 void boost_x_set(u8 status,u8 select,u8 *limit,u8 *count,u8 *level1,u8 *level2,u16 *time,u16 *o_time,u16 *tim1)
9350                     ; 2211 {   
9351                     	switch	.text
9352  17e7               _boost_x_set:
9354  17e7 89            	pushw	x
9355       00000000      OFST:	set	0
9358                     ; 2212 	buzzer_5s_times = 0;
9360  17e8 725f000c      	clr	_buzzer_5s_times
9361                     ; 2213 	if(lock_bz == TRUE)
9363  17ec b625          	ld	a,_lock_bz
9364  17ee a101          	cp	a,#1
9365  17f0 260e          	jrne	L5173
9366                     ; 2215 		sec_LockFlag = FALSE;
9368  17f2 3f1d          	clr	_sec_LockFlag
9369                     ; 2216 		_10ms_cnt = 0;
9371  17f4 3f1e          	clr	__10ms_cnt
9372                     ; 2217 		lock_dis_cnt = LOCK_DIS_2S;
9374  17f6 35020010      	mov	_lock_dis_cnt,#2
9375                     ; 2218 		buzzer_time = buz_120ms;
9377  17fa 350c0027      	mov	_buzzer_time,#12
9379  17fe 2072          	jra	L7173
9380  1800               L5173:
9381                     ; 2222 		if((status)&&((Warm_status &select)==0))
9383  1800 0d01          	tnz	(OFST+1,sp)
9384  1802 276e          	jreq	L7173
9386  1804 c60013        	ld	a,_Warm_status
9387  1807 1502          	bcp	a,(OFST+2,sp)
9388  1809 2667          	jrne	L7173
9389                     ; 2224 			buzzer_time = buz_200ms;
9391  180b 35140027      	mov	_buzzer_time,#20
9392                     ; 2225 			if((*level2)<=8)
9394  180f 1e0b          	ldw	x,(OFST+11,sp)
9395  1811 f6            	ld	a,(x)
9396  1812 a109          	cp	a,#9
9397  1814 242a          	jruge	L3273
9398                     ; 2227 				if(*time)    {(*time) =1;(*limit) =1;} 
9400  1816 1e0d          	ldw	x,(OFST+13,sp)
9401  1818 e601          	ld	a,(1,x)
9402  181a fa            	or	a,(x)
9403  181b 270e          	jreq	L5273
9406  181d 1e0d          	ldw	x,(OFST+13,sp)
9407  181f 90ae0001      	ldw	y,#1
9408  1823 ff            	ldw	(x),y
9411  1824 1e05          	ldw	x,(OFST+5,sp)
9412  1826 a601          	ld	a,#1
9413  1828 f7            	ld	(x),a
9415  1829 200c          	jra	L7273
9416  182b               L5273:
9417                     ; 2228 				else      {(*time) =300; (*limit) =2;}
9419  182b 1e0d          	ldw	x,(OFST+13,sp)
9420  182d 90ae012c      	ldw	y,#300
9421  1831 ff            	ldw	(x),y
9424  1832 1e05          	ldw	x,(OFST+5,sp)
9425  1834 a602          	ld	a,#2
9426  1836 f7            	ld	(x),a
9427  1837               L7273:
9428                     ; 2229 				flex_deal(select+0x10);
9430  1837 7b02          	ld	a,(OFST+2,sp)
9431  1839 ab10          	add	a,#16
9432  183b cd00ad        	call	_flex_deal
9435  183e 2029          	jra	L1373
9436  1840               L3273:
9437                     ; 2233 				change_count =select;	         	
9439  1840 7b02          	ld	a,(OFST+2,sp)
9440  1842 b740          	ld	_change_count,a
9441                     ; 2234 				if(*o_time) (*level1) =8;
9443  1844 1e0f          	ldw	x,(OFST+15,sp)
9444  1846 e601          	ld	a,(1,x)
9445  1848 fa            	or	a,(x)
9446  1849 2707          	jreq	L3373
9449  184b 1e09          	ldw	x,(OFST+9,sp)
9450  184d a608          	ld	a,#8
9451  184f f7            	ld	(x),a
9453  1850 2005          	jra	L5373
9454  1852               L3373:
9455                     ; 2235 				else (*level1) =14;
9457  1852 1e09          	ldw	x,(OFST+9,sp)
9458  1854 a60e          	ld	a,#14
9459  1856 f7            	ld	(x),a
9460  1857               L5373:
9461                     ; 2236 				(*limit) =1;
9463  1857 1e05          	ldw	x,(OFST+5,sp)
9464  1859 a601          	ld	a,#1
9465  185b f7            	ld	(x),a
9466                     ; 2237 				if((timer_status & select)==0) (*tim1)  =arr_default_timer[9];
9468  185c b649          	ld	a,_timer_status
9469  185e 1502          	bcp	a,(OFST+2,sp)
9470  1860 2607          	jrne	L1373
9473  1862 1e11          	ldw	x,(OFST+17,sp)
9474  1864 90ae0078      	ldw	y,#120
9475  1868 ff            	ldw	(x),y
9476  1869               L1373:
9477                     ; 2239 			(*count) =10;	
9479  1869 1e07          	ldw	x,(OFST+7,sp)
9480  186b a60a          	ld	a,#10
9481  186d f7            	ld	(x),a
9482                     ; 2240 			Sec_bz =TRUE;	    		           
9484  186e 3501001a      	mov	_Sec_bz,#1
9485  1872               L7173:
9486                     ; 2243 }
9489  1872 85            	popw	x
9490  1873 81            	ret
9598                     ; 2244 void vif_x_set(u8 status,u8 select,u8 *zone_flash,u8 *limit,u8 *level1,u16 *time,u16 *o_time,u16 *tim1)
9598                     ; 2245 {
9599                     	switch	.text
9600  1874               _vif_x_set:
9602  1874 89            	pushw	x
9603       00000000      OFST:	set	0
9606                     ; 2246     if(status)
9608  1875 9e            	ld	a,xh
9609  1876 4d            	tnz	a
9610  1877 274a          	jreq	L3104
9611                     ; 2248 			(*limit) =1;
9613  1879 1e07          	ldw	x,(OFST+7,sp)
9614  187b a601          	ld	a,#1
9615  187d f7            	ld	(x),a
9616                     ; 2249       if(*time) (*time) =1;
9618  187e 1e0b          	ldw	x,(OFST+11,sp)
9619  1880 e601          	ld	a,(1,x)
9620  1882 fa            	or	a,(x)
9621  1883 2707          	jreq	L5104
9624  1885 1e0b          	ldw	x,(OFST+11,sp)
9625  1887 90ae0001      	ldw	y,#1
9626  188b ff            	ldw	(x),y
9627  188c               L5104:
9628                     ; 2250 			Sec_bz =TRUE;	
9630  188c 3501001a      	mov	_Sec_bz,#1
9631                     ; 2251 			buzzer_time = buz_200ms;
9633  1890 35140027      	mov	_buzzer_time,#20
9634                     ; 2252 			(*zone_flash) =10; 
9636  1894 1e05          	ldw	x,(OFST+5,sp)
9637  1896 a60a          	ld	a,#10
9638  1898 f7            	ld	(x),a
9639                     ; 2253 			change_count =0;
9641  1899 3f40          	clr	_change_count
9642                     ; 2255 			if((*o_time)==0) (*level1) =10; 
9644  189b 1e0d          	ldw	x,(OFST+13,sp)
9645  189d e601          	ld	a,(1,x)
9646  189f fa            	or	a,(x)
9647  18a0 2607          	jrne	L7104
9650  18a2 1e09          	ldw	x,(OFST+9,sp)
9651  18a4 a60a          	ld	a,#10
9652  18a6 f7            	ld	(x),a
9654  18a7 2005          	jra	L1204
9655  18a9               L7104:
9656                     ; 2256 			else (*level1) =8; 
9658  18a9 1e09          	ldw	x,(OFST+9,sp)
9659  18ab a608          	ld	a,#8
9660  18ad f7            	ld	(x),a
9661  18ae               L1204:
9662                     ; 2258       if((timer_status & select)==0) (*tim1)  =arr_default_timer[(*level1)];
9664  18ae b649          	ld	a,_timer_status
9665  18b0 1502          	bcp	a,(OFST+2,sp)
9666  18b2 260f          	jrne	L3104
9669  18b4 1e09          	ldw	x,(OFST+9,sp)
9670  18b6 f6            	ld	a,(x)
9671  18b7 5f            	clrw	x
9672  18b8 97            	ld	xl,a
9673  18b9 58            	sllw	x
9674  18ba 160f          	ldw	y,(OFST+15,sp)
9675  18bc 89            	pushw	x
9676  18bd de0000        	ldw	x,(_arr_default_timer,x)
9677  18c0 90ff          	ldw	(y),x
9678  18c2 85            	popw	x
9679  18c3               L3104:
9680                     ; 2260 }
9683  18c3 85            	popw	x
9684  18c4 81            	ret
9746                     	switch	.user
9747  00dc               L042:
9748  00dc 00004000      	dc.l	16384
9749                     ; 2265 void favor_x_save(u8 zoneIndex, u8 level, u8 *zone_flash)
9749                     ; 2266 {
9750                     	switch	.text
9751  18c5               _favor_x_save:
9753  18c5 89            	pushw	x
9754       00000000      OFST:	set	0
9757                     ; 2267 	if(key_account == lock_press_time)
9759  18c6 be93          	ldw	x,_key_account
9760  18c8 a300fa        	cpw	x,#250
9761  18cb 263f          	jrne	L3504
9762                     ; 2269 		if(lock_bz == TRUE)
9764  18cd b625          	ld	a,_lock_bz
9765  18cf a101          	cp	a,#1
9766  18d1 260e          	jrne	L5504
9767                     ; 2271 			sec_LockFlag = FALSE;
9769  18d3 3f1d          	clr	_sec_LockFlag
9770                     ; 2272 			_10ms_cnt = 0;
9772  18d5 3f1e          	clr	__10ms_cnt
9773                     ; 2273 			lock_dis_cnt = LOCK_DIS_2S;
9775  18d7 35020010      	mov	_lock_dis_cnt,#2
9776                     ; 2274 			buzzer_time = buz_120ms;
9778  18db 350c0027      	mov	_buzzer_time,#12
9780  18df 2027          	jra	L7504
9781  18e1               L5504:
9782                     ; 2278 			writeEEPROM(E2PROM_BASE_ADDR+zoneIndex, level);
9784  18e1 7b02          	ld	a,(OFST+2,sp)
9785  18e3 88            	push	a
9786  18e4 7b02          	ld	a,(OFST+2,sp)
9787  18e6 b703          	ld	c_lreg+3,a
9788  18e8 3f02          	clr	c_lreg+2
9789  18ea 3f01          	clr	c_lreg+1
9790  18ec 3f00          	clr	c_lreg
9791  18ee ae00dc        	ldw	x,#L042
9792  18f1 cd0000        	call	c_ladd
9794  18f4 be02          	ldw	x,c_lreg+2
9795  18f6 89            	pushw	x
9796  18f7 be00          	ldw	x,c_lreg
9797  18f9 89            	pushw	x
9798  18fa cd0000        	call	_writeEEPROM
9800  18fd 5b05          	addw	sp,#5
9801                     ; 2279 			buzzer_200ms_times = 2;//短响2声
9803  18ff 35020008      	mov	_buzzer_200ms_times,#2
9804                     ; 2280 			*zone_flash = 4;//闪烁2秒
9806  1903 1e05          	ldw	x,(OFST+5,sp)
9807  1905 a604          	ld	a,#4
9808  1907 f7            	ld	(x),a
9809  1908               L7504:
9810                     ; 2282 		key_longPressRecord = TRUE;
9812  1908 35010012      	mov	_key_longPressRecord,#1
9813  190c               L3504:
9814                     ; 2285 }
9817  190c 85            	popw	x
9818  190d 81            	ret
9932                     ; 2290 void favor_x_set(u8 status,u8 select,u8 *zone_flash,u8 *limit,u8 *level1,u16 *time,u8 zoneIndex,u16 *tim1)
9932                     ; 2291 {
9933                     	switch	.text
9934  190e               _favor_x_set:
9936  190e 89            	pushw	x
9937       00000000      OFST:	set	0
9940                     ; 2292 	buzzer_5s_times = 0;
9942  190f 725f000c      	clr	_buzzer_5s_times
9943                     ; 2293 	if(lock_bz == TRUE)
9945  1913 b625          	ld	a,_lock_bz
9946  1915 a101          	cp	a,#1
9947  1917 260e          	jrne	L3314
9948                     ; 2295 		sec_LockFlag = FALSE;
9950  1919 3f1d          	clr	_sec_LockFlag
9951                     ; 2296 		_10ms_cnt = 0;
9953  191b 3f1e          	clr	__10ms_cnt
9954                     ; 2297 		lock_dis_cnt = LOCK_DIS_2S;
9956  191d 35020010      	mov	_lock_dis_cnt,#2
9957                     ; 2298 		buzzer_time = buz_120ms;
9959  1921 350c0027      	mov	_buzzer_time,#12
9961  1925 205b          	jra	L5314
9962  1927               L3314:
9963                     ; 2302 		if(key_longPressRecord == FALSE)
9965  1927 725d0012      	tnz	_key_longPressRecord
9966  192b 2655          	jrne	L5314
9967                     ; 2304 			if(status)
9969  192d 0d01          	tnz	(OFST+1,sp)
9970  192f 2751          	jreq	L5314
9971                     ; 2306 				(*limit) =0;
9973  1931 1e07          	ldw	x,(OFST+7,sp)
9974  1933 7f            	clr	(x)
9975                     ; 2307 				if(*time) (*time) =0;
9977  1934 1e0b          	ldw	x,(OFST+11,sp)
9978  1936 e601          	ld	a,(1,x)
9979  1938 fa            	or	a,(x)
9980  1939 2705          	jreq	L3414
9983  193b 1e0b          	ldw	x,(OFST+11,sp)
9984  193d 905f          	clrw	y
9985  193f ff            	ldw	(x),y
9986  1940               L3414:
9987                     ; 2308 				Sec_bz =TRUE;
9989  1940 3501001a      	mov	_Sec_bz,#1
9990                     ; 2309 				buzzer_time = buz_120ms;
9992  1944 350c0027      	mov	_buzzer_time,#12
9993                     ; 2310 				(*zone_flash) =10; 
9995  1948 1e05          	ldw	x,(OFST+5,sp)
9996  194a a60a          	ld	a,#10
9997  194c f7            	ld	(x),a
9998                     ; 2311 				change_count =0;
10000  194d 3f40          	clr	_change_count
10001                     ; 2313 				(*level1) =readEEPROM(E2PROM_BASE_ADDR+zoneIndex);
10003  194f 7b0d          	ld	a,(OFST+13,sp)
10004  1951 b703          	ld	c_lreg+3,a
10005  1953 3f02          	clr	c_lreg+2
10006  1955 3f01          	clr	c_lreg+1
10007  1957 3f00          	clr	c_lreg
10008  1959 ae00dc        	ldw	x,#L042
10009  195c cd0000        	call	c_ladd
10011  195f be02          	ldw	x,c_lreg+2
10012  1961 89            	pushw	x
10013  1962 be00          	ldw	x,c_lreg
10014  1964 89            	pushw	x
10015  1965 cd001d        	call	_readEEPROM
10017  1968 5b04          	addw	sp,#4
10018  196a 1e09          	ldw	x,(OFST+9,sp)
10019  196c f7            	ld	(x),a
10020                     ; 2314 				if((timer_status & select)==0) (*tim1)  =arr_default_timer[(*level1)];
10022  196d b649          	ld	a,_timer_status
10023  196f 1502          	bcp	a,(OFST+2,sp)
10024  1971 260f          	jrne	L5314
10027  1973 1e09          	ldw	x,(OFST+9,sp)
10028  1975 f6            	ld	a,(x)
10029  1976 5f            	clrw	x
10030  1977 97            	ld	xl,a
10031  1978 58            	sllw	x
10032  1979 160e          	ldw	y,(OFST+14,sp)
10033  197b 89            	pushw	x
10034  197c de0000        	ldw	x,(_arr_default_timer,x)
10035  197f 90ff          	ldw	(y),x
10036  1981 85            	popw	x
10037  1982               L5314:
10038                     ; 2318 }
10041  1982 85            	popw	x
10042  1983 81            	ret
10143                     ; 2319 void timer_x_set(u8 *status,u8 select,u8 *count_timer,u16 *p,u8 level,u8 *count_level,u8 *cnt_time)
10143                     ; 2320 {
10144                     	switch	.text
10145  1984               _timer_x_set:
10147  1984 89            	pushw	x
10148       00000000      OFST:	set	0
10151                     ; 2321 	buzzer_5s_times = 0;
10153  1985 725f000c      	clr	_buzzer_5s_times
10154                     ; 2322 	if(lock_bz == TRUE)
10156  1989 b625          	ld	a,_lock_bz
10157  198b a101          	cp	a,#1
10158  198d 260e          	jrne	L5124
10159                     ; 2324 		sec_LockFlag = FALSE;
10161  198f 3f1d          	clr	_sec_LockFlag
10162                     ; 2325 		_10ms_cnt = 0;
10164  1991 3f1e          	clr	__10ms_cnt
10165                     ; 2326 		lock_dis_cnt = LOCK_DIS_2S;
10167  1993 35020010      	mov	_lock_dis_cnt,#2
10168                     ; 2327 		buzzer_time = buz_120ms;
10170  1997 350c0027      	mov	_buzzer_time,#12
10172  199b 2033          	jra	L7124
10173  199d               L5124:
10174                     ; 2331 		buzzer_time = buz_120ms;  
10176  199d 350c0027      	mov	_buzzer_time,#12
10177                     ; 2332 		if(timer_status & select)
10179  19a1 b649          	ld	a,_timer_status
10180  19a3 1505          	bcp	a,(OFST+5,sp)
10181  19a5 2612          	jrne	L3224
10183                     ; 2339 			timer_status |= select;
10185  19a7 b649          	ld	a,_timer_status
10186  19a9 1a05          	or	a,(OFST+5,sp)
10187  19ab b749          	ld	_timer_status,a
10188                     ; 2340 			(*p) =default_timer;
10190  19ad 1e08          	ldw	x,(OFST+8,sp)
10191  19af 905f          	clrw	y
10192  19b1 ff            	ldw	(x),y
10193                     ; 2341 			if(level==0)
10195  19b2 0d0a          	tnz	(OFST+10,sp)
10196  19b4 2603          	jrne	L3224
10197                     ; 2342 				*status = FALSE;
10199  19b6 1e01          	ldw	x,(OFST+1,sp)
10200  19b8 7f            	clr	(x)
10201  19b9               L3224:
10202                     ; 2344 		(*count_timer) =10;
10204  19b9 1e06          	ldw	x,(OFST+6,sp)
10205  19bb a60a          	ld	a,#10
10206  19bd f7            	ld	(x),a
10207                     ; 2345 		*cnt_time = *count_timer + 2;
10209  19be 1e06          	ldw	x,(OFST+6,sp)
10210  19c0 f6            	ld	a,(x)
10211  19c1 ab02          	add	a,#2
10212  19c3 1e0d          	ldw	x,(OFST+13,sp)
10213  19c5 f7            	ld	(x),a
10214                     ; 2346 		*count_level = 0;
10216  19c6 1e0b          	ldw	x,(OFST+11,sp)
10217  19c8 7f            	clr	(x)
10218                     ; 2347 		flex_deal(select+0x10);
10220  19c9 7b05          	ld	a,(OFST+5,sp)
10221  19cb ab10          	add	a,#16
10222  19cd cd00ad        	call	_flex_deal
10224  19d0               L7124:
10225                     ; 2349 }
10228  19d0 85            	popw	x
10229  19d1 81            	ret
10293                     ; 2350 u16 disp_timer_x(u8 select,u8 flash,u16 timer,u8 lock_count)
10293                     ; 2351 {
10294                     	switch	.text
10295  19d2               _disp_timer_x:
10297  19d2 89            	pushw	x
10298  19d3 89            	pushw	x
10299       00000002      OFST:	set	2
10302                     ; 2352   u16 buf =(SEG_G <<8)|SEG_G;
10304  19d4 ae1010        	ldw	x,#4112
10305  19d7 1f01          	ldw	(OFST-1,sp),x
10306                     ; 2353 	if(timer_status & select)
10308  19d9 b649          	ld	a,_timer_status
10309  19db 1503          	bcp	a,(OFST+1,sp)
10310  19dd 2738          	jreq	L1624
10311                     ; 2355 	   if((flash%2)&&(min_hold_flg == 0))  buf =(CHR_BLANK<<8)|CHR_BLANK;
10313  19df 7b04          	ld	a,(OFST+2,sp)
10314  19e1 a501          	bcp	a,#1
10315  19e3 270b          	jreq	L3624
10317  19e5 725d0034      	tnz	_min_hold_flg
10318  19e9 2605          	jrne	L3624
10321  19eb 5f            	clrw	x
10322  19ec 1f01          	ldw	(OFST-1,sp),x
10324  19ee 202c          	jra	L7624
10325  19f0               L3624:
10326                     ; 2358 	   	  buf =Display_decode(timer/10)<<8;
10328  19f0 1e07          	ldw	x,(OFST+5,sp)
10329  19f2 a60a          	ld	a,#10
10330  19f4 62            	div	x,a
10331  19f5 9f            	ld	a,xl
10332  19f6 cd08e3        	call	_Display_decode
10334  19f9 5f            	clrw	x
10335  19fa 97            	ld	xl,a
10336  19fb 4f            	clr	a
10337  19fc 02            	rlwa	x,a
10338  19fd 1f01          	ldw	(OFST-1,sp),x
10339                     ; 2359 	    	buf|=Display_decode(timer%10);
10341  19ff 1e07          	ldw	x,(OFST+5,sp)
10342  1a01 a60a          	ld	a,#10
10343  1a03 62            	div	x,a
10344  1a04 5f            	clrw	x
10345  1a05 97            	ld	xl,a
10346  1a06 9f            	ld	a,xl
10347  1a07 cd08e3        	call	_Display_decode
10349  1a0a 5f            	clrw	x
10350  1a0b 97            	ld	xl,a
10351  1a0c 01            	rrwa	x,a
10352  1a0d 1a02          	or	a,(OFST+0,sp)
10353  1a0f 01            	rrwa	x,a
10354  1a10 1a01          	or	a,(OFST-1,sp)
10355  1a12 01            	rrwa	x,a
10356  1a13 1f01          	ldw	(OFST-1,sp),x
10357  1a15 2005          	jra	L7624
10358  1a17               L1624:
10359                     ; 2365 		buf =(SEG_G <<8)|SEG_G;
10361  1a17 ae1010        	ldw	x,#4112
10362  1a1a 1f01          	ldw	(OFST-1,sp),x
10363  1a1c               L7624:
10364                     ; 2368   return(buf);
10366  1a1c 1e01          	ldw	x,(OFST-1,sp)
10369  1a1e 5b04          	addw	sp,#4
10370  1a20 81            	ret
10396                     ; 2371 void blockDisplay(void)
10396                     ; 2372 {
10397                     	switch	.text
10398  1a21               _blockDisplay:
10402                     ; 2373 	if((lock_dis_cnt) && (lock_bz == TRUE))  	  //"Lo"
10404  1a21 725d0010      	tnz	_lock_dis_cnt
10405  1a25 2736          	jreq	L1034
10407  1a27 b625          	ld	a,_lock_bz
10408  1a29 a101          	cp	a,#1
10409  1a2b 2630          	jrne	L1034
10410                     ; 2375 		Disp_buf[Zone1Gear_H]  = CHR_B;
10412  1a2d 359b0036      	mov	_Disp_buf+13,#155
10413                     ; 2376 		Disp_buf[Zone1Gear_L]  = NUM_1;
10415  1a31 35210035      	mov	_Disp_buf+12,#33
10416                     ; 2377 		Disp_buf[Zone1Timer_H] = CHR_O;	
10418  1a35 351b0029      	mov	_Disp_buf,#27
10419                     ; 2378 		Disp_buf[Zone1Timer_L] = CHR_C;
10421  1a39 351a002c      	mov	_Disp_buf+3,#26
10422                     ; 2380 		Disp_buf[Zone2Gear_H]  = CHR_B;
10424  1a3d 359b0038      	mov	_Disp_buf+15,#155
10425                     ; 2381 		Disp_buf[Zone2Gear_L]  = NUM_1;
10427  1a41 35210037      	mov	_Disp_buf+14,#33
10428                     ; 2382 		Disp_buf[Zone2Timer_H] = CHR_O;	
10430  1a45 351b002b      	mov	_Disp_buf+2,#27
10431                     ; 2383 		Disp_buf[Zone2Timer_L] = CHR_C;
10433  1a49 351a002a      	mov	_Disp_buf+1,#26
10434                     ; 2385 		Disp_buf[Zone3Gear_H]  = CHR_B;
10436  1a4d 359b0030      	mov	_Disp_buf+7,#155
10437                     ; 2386 		Disp_buf[Zone3Gear_L]  = NUM_1;
10439  1a51 3521002f      	mov	_Disp_buf+6,#33
10440                     ; 2387 		Disp_buf[Zone3Timer_H] = CHR_O;	
10442  1a55 351b0034      	mov	_Disp_buf+11,#27
10443                     ; 2388 		Disp_buf[Zone3Timer_L] = CHR_C;
10445  1a59 351a0031      	mov	_Disp_buf+8,#26
10446  1a5d               L1034:
10447                     ; 2392 }
10450  1a5d 81            	ret
10485                     ; 2394 void zone_timeout_deal(void)
10485                     ; 2395 {
10486                     	switch	.text
10487  1a5e               _zone_timeout_deal:
10491                     ; 2396 	if((zone_1_level == 0)&&(zone_1_timeout_cnt))  zone_1_timeout_cnt--;
10493  1a5e 3da7          	tnz	_zone_1_level
10494  1a60 260a          	jrne	L3134
10496  1a62 725d0028      	tnz	_zone_1_timeout_cnt
10497  1a66 2704          	jreq	L3134
10500  1a68 725a0028      	dec	_zone_1_timeout_cnt
10501  1a6c               L3134:
10502                     ; 2397 	if(zone_1_timeout_cnt == 0)  on1_bz = FALSE, zone_1_level = 0;
10504  1a6c 725d0028      	tnz	_zone_1_timeout_cnt
10505  1a70 2604          	jrne	L5134
10508  1a72 3f21          	clr	_on1_bz
10509  1a74 3fa7          	clr	_zone_1_level
10510  1a76               L5134:
10511                     ; 2399 	if((zone_2_level == 0)&&(zone_2_timeout_cnt))  zone_2_timeout_cnt--;
10513  1a76 3da8          	tnz	_zone_2_level
10514  1a78 260a          	jrne	L7134
10516  1a7a 725d0029      	tnz	_zone_2_timeout_cnt
10517  1a7e 2704          	jreq	L7134
10520  1a80 725a0029      	dec	_zone_2_timeout_cnt
10521  1a84               L7134:
10522                     ; 2400 	if(zone_2_timeout_cnt == 0)  on2_bz = FALSE, zone_2_level = 0;
10524  1a84 725d0029      	tnz	_zone_2_timeout_cnt
10525  1a88 2604          	jrne	L1234
10528  1a8a 3f22          	clr	_on2_bz
10529  1a8c 3fa8          	clr	_zone_2_level
10530  1a8e               L1234:
10531                     ; 2402 	if((zone_3_level == 0)&&(zone_3_timeout_cnt))  zone_3_timeout_cnt--;
10533  1a8e 3da9          	tnz	_zone_3_level
10534  1a90 260a          	jrne	L3234
10536  1a92 725d002a      	tnz	_zone_3_timeout_cnt
10537  1a96 2704          	jreq	L3234
10540  1a98 725a002a      	dec	_zone_3_timeout_cnt
10541  1a9c               L3234:
10542                     ; 2403 	if(zone_3_timeout_cnt == 0)  on3_bz = FALSE, zone_3_level = 0;
10544  1a9c 725d002a      	tnz	_zone_3_timeout_cnt
10545  1aa0 2604          	jrne	L5234
10548  1aa2 3f23          	clr	_on3_bz
10549  1aa4 3fa9          	clr	_zone_3_level
10550  1aa6               L5234:
10551                     ; 2405 	if((zone_4_level == 0)&&(zone_4_timeout_cnt))  zone_4_timeout_cnt--;
10553  1aa6 3daa          	tnz	_zone_4_level
10554  1aa8 260a          	jrne	L7234
10556  1aaa 725d002b      	tnz	_zone_4_timeout_cnt
10557  1aae 2704          	jreq	L7234
10560  1ab0 725a002b      	dec	_zone_4_timeout_cnt
10561  1ab4               L7234:
10562                     ; 2406 	if(zone_4_timeout_cnt == 0)  on4_bz = FALSE, zone_4_level = 0;
10564  1ab4 725d002b      	tnz	_zone_4_timeout_cnt
10565  1ab8 2604          	jrne	L1334
10568  1aba 3f24          	clr	_on4_bz
10569  1abc 3faa          	clr	_zone_4_level
10570  1abe               L1334:
10571                     ; 2407 }
10574  1abe 81            	ret
10620                     ; 2409 void E2PROM_InitCheck(void)
10620                     ; 2410 {
10621                     	switch	.text
10622  1abf               _E2PROM_InitCheck:
10624  1abf 89            	pushw	x
10625       00000002      OFST:	set	2
10628                     ; 2411 	u8 check1 = 0;
10630  1ac0 7b01          	ld	a,(OFST-1,sp)
10631  1ac2 97            	ld	xl,a
10632                     ; 2412 	u8 check2 = 0;
10634  1ac3 7b02          	ld	a,(OFST+0,sp)
10635  1ac5 97            	ld	xl,a
10636                     ; 2414 	check1 = readEEPROM(E2PROM_CHE_BLACK_L_ADDR);
10638  1ac6 ae4080        	ldw	x,#16512
10639  1ac9 89            	pushw	x
10640  1aca ae0000        	ldw	x,#0
10641  1acd 89            	pushw	x
10642  1ace cd001d        	call	_readEEPROM
10644  1ad1 5b04          	addw	sp,#4
10645  1ad3 6b01          	ld	(OFST-1,sp),a
10646                     ; 2415 	check2 = readEEPROM(E2PROM_CHE_BLACK_H_ADDR);
10648  1ad5 ae4081        	ldw	x,#16513
10649  1ad8 89            	pushw	x
10650  1ad9 ae0000        	ldw	x,#0
10651  1adc 89            	pushw	x
10652  1add cd001d        	call	_readEEPROM
10654  1ae0 5b04          	addw	sp,#4
10655  1ae2 6b02          	ld	(OFST+0,sp),a
10656                     ; 2416 	if((check1^check2) != 0xFF)
10658  1ae4 7b01          	ld	a,(OFST-1,sp)
10659  1ae6 1802          	xor	a,(OFST+0,sp)
10660  1ae8 a1ff          	cp	a,#255
10661  1aea 275a          	jreq	L5534
10662                     ; 2418 		writeEEPROM(E2PROM_CHE_BLACK_L_ADDR,0x55);
10664  1aec 4b55          	push	#85
10665  1aee ae4080        	ldw	x,#16512
10666  1af1 89            	pushw	x
10667  1af2 ae0000        	ldw	x,#0
10668  1af5 89            	pushw	x
10669  1af6 cd0000        	call	_writeEEPROM
10671  1af9 5b05          	addw	sp,#5
10672                     ; 2419 		writeEEPROM(E2PROM_CHE_BLACK_H_ADDR,0xAA);
10674  1afb 4baa          	push	#170
10675  1afd ae4081        	ldw	x,#16513
10676  1b00 89            	pushw	x
10677  1b01 ae0000        	ldw	x,#0
10678  1b04 89            	pushw	x
10679  1b05 cd0000        	call	_writeEEPROM
10681  1b08 5b05          	addw	sp,#5
10682                     ; 2420 		writeEEPROM(E2PROM_ZONE1_FAVOR_ADDR,4);
10684  1b0a 4b04          	push	#4
10685  1b0c ae4001        	ldw	x,#16385
10686  1b0f 89            	pushw	x
10687  1b10 ae0000        	ldw	x,#0
10688  1b13 89            	pushw	x
10689  1b14 cd0000        	call	_writeEEPROM
10691  1b17 5b05          	addw	sp,#5
10692                     ; 2421 		writeEEPROM(E2PROM_ZONE2_FAVOR_ADDR,4);
10694  1b19 4b04          	push	#4
10695  1b1b ae4002        	ldw	x,#16386
10696  1b1e 89            	pushw	x
10697  1b1f ae0000        	ldw	x,#0
10698  1b22 89            	pushw	x
10699  1b23 cd0000        	call	_writeEEPROM
10701  1b26 5b05          	addw	sp,#5
10702                     ; 2422 		writeEEPROM(E2PROM_ZONE3_FAVOR_ADDR,4);
10704  1b28 4b04          	push	#4
10705  1b2a ae4003        	ldw	x,#16387
10706  1b2d 89            	pushw	x
10707  1b2e ae0000        	ldw	x,#0
10708  1b31 89            	pushw	x
10709  1b32 cd0000        	call	_writeEEPROM
10711  1b35 5b05          	addw	sp,#5
10712                     ; 2423 		writeEEPROM(E2PROM_LOCK_ADDR, 0);
10714  1b37 4b00          	push	#0
10715  1b39 ae4000        	ldw	x,#16384
10716  1b3c 89            	pushw	x
10717  1b3d ae0000        	ldw	x,#0
10718  1b40 89            	pushw	x
10719  1b41 cd0000        	call	_writeEEPROM
10721  1b44 5b05          	addw	sp,#5
10722  1b46               L5534:
10723                     ; 2425 	lock_bz = readEEPROM(E2PROM_LOCK_ADDR);
10725  1b46 ae4000        	ldw	x,#16384
10726  1b49 89            	pushw	x
10727  1b4a ae0000        	ldw	x,#0
10728  1b4d 89            	pushw	x
10729  1b4e cd001d        	call	_readEEPROM
10731  1b51 5b04          	addw	sp,#4
10732  1b53 b725          	ld	_lock_bz,a
10733                     ; 2426 }
10736  1b55 85            	popw	x
10737  1b56 81            	ret
10767                     ; 2428 void key_OverflowCheck(void)
10767                     ; 2429 {
10768                     	switch	.text
10769  1b57               _key_OverflowCheck:
10773                     ; 2430 	if(key_account >= 1000)
10775  1b57 be93          	ldw	x,_key_account
10776  1b59 a303e8        	cpw	x,#1000
10777  1b5c 2516          	jrult	L7634
10778                     ; 2432 		buzzer_2s_times = 2;
10780  1b5e 3502000a      	mov	_buzzer_2s_times,#2
10781                     ; 2433 		Err_1_data = 0xE9;
10783  1b62 35e90083      	mov	_Err_1_data,#233
10784                     ; 2434 		Err_2_data = 0xE9;
10786  1b66 35e90084      	mov	_Err_2_data,#233
10787                     ; 2435 		Err_3_data = 0xE9;
10789  1b6a 35e90085      	mov	_Err_3_data,#233
10790                     ; 2436 		Err_4_data = 0xE9;
10792  1b6e 35e90086      	mov	_Err_4_data,#233
10794  1b72 200c          	jra	L1734
10795  1b74               L7634:
10796                     ; 2440 		buzzer_2s_times = 0;
10798  1b74 725f000a      	clr	_buzzer_2s_times
10799                     ; 2441 		Err_1_data = 0;
10801  1b78 3f83          	clr	_Err_1_data
10802                     ; 2442 		Err_2_data = 0;
10804  1b7a 3f84          	clr	_Err_2_data
10805                     ; 2443 		Err_3_data = 0;
10807  1b7c 3f85          	clr	_Err_3_data
10808                     ; 2444 		Err_4_data = 0;
10810  1b7e 3f86          	clr	_Err_4_data
10811  1b80               L1734:
10812                     ; 2446 	if(key_account >= 2000) Power_off_deal();
10814  1b80 be93          	ldw	x,_key_account
10815  1b82 a307d0        	cpw	x,#2000
10816  1b85 2503          	jrult	L3734
10819  1b87 cd0818        	call	_Power_off_deal
10821  1b8a               L3734:
10822                     ; 2447 }
10825  1b8a 81            	ret
11192                     ; 2451 void main()
11192                     ; 2452 {  
11193                     	switch	.text
11194  1b8b               _main:
11196  1b8b 5219          	subw	sp,#25
11197       00000019      OFST:	set	25
11200                     ; 2453     u8  i =0;
11202  1b8d 7b19          	ld	a,(OFST+0,sp)
11203  1b8f 97            	ld	xl,a
11204                     ; 2454     u8  temp_8 =0;
11206  1b90 7b19          	ld	a,(OFST+0,sp)
11207  1b92 97            	ld	xl,a
11208                     ; 2456     u8  par_1 =0;
11210  1b93 7b0b          	ld	a,(OFST-14,sp)
11211  1b95 97            	ld	xl,a
11212                     ; 2457     u8  par_2 =0;
11214  1b96 7b0c          	ld	a,(OFST-13,sp)
11215  1b98 97            	ld	xl,a
11216                     ; 2458     u16 temp_16 =0;
11218  1b99 1e17          	ldw	x,(OFST-2,sp)
11219                     ; 2460     u16 list_counter =0;   
11221  1b9b 5f            	clrw	x
11222  1b9c 1f11          	ldw	(OFST-8,sp),x
11223                     ; 2475     IWDG_Enable();/* Enable the access to the IWDG registers*/        
11225  1b9e cd0000        	call	_IWDG_Enable
11227                     ; 2476     IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);/* Fixe IWDG Reset period */
11229  1ba1 a655          	ld	a,#85
11230  1ba3 cd0000        	call	_IWDG_WriteAccessCmd
11232                     ; 2478     IWDG_SetPrescaler(IWDG_Prescaler_256);
11234  1ba6 a606          	ld	a,#6
11235  1ba8 cd0000        	call	_IWDG_SetPrescaler
11237                     ; 2479     IWDG_SetReload(0xFF);       
11239  1bab a6ff          	ld	a,#255
11240  1bad cd0000        	call	_IWDG_SetReload
11242                     ; 2480     IWDG_ReloadCounter();/* Refresh IWDG */
11244  1bb0 cd0000        	call	_IWDG_ReloadCounter
11246                     ; 2482     disableInterrupts();
11249  1bb3 9b            sim
11251                     ; 2486     CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
11254  1bb4 721150c1      	bres	20673,#0
11255                     ; 2487     CLK->ICKR |= CLK_ICKR_HSIEN;
11257  1bb8 721050c0      	bset	20672,#0
11258                     ; 2488     CLK->ICKR |= CLK_ICKR_LSIEN;  
11260  1bbc 721650c0      	bset	20672,#3
11261                     ; 2489     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
11263  1bc0 c650c6        	ld	a,20678
11264  1bc3 a4e7          	and	a,#231
11265  1bc5 c750c6        	ld	20678,a
11266                     ; 2490     CLK->CKDIVR |= (u8)CLK_PRESCALER_HSIDIV1;
11268  1bc8 c650c6        	ld	a,20678
11269  1bcb 97            	ld	xl,a
11270                     ; 2491     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
11272  1bcc c650c6        	ld	a,20678
11273  1bcf a4f8          	and	a,#248
11274  1bd1 c750c6        	ld	20678,a
11275                     ; 2492     CLK->CKDIVR |= (u8)((u8)CLK_PRESCALER_CPUDIV1 & (u8)CLK_CKDIVR_CPUDIV);
11277  1bd4 c650c6        	ld	a,20678
11278  1bd7 97            	ld	xl,a
11279                     ; 2499     TIM4->PSCR = (u8)(TIM4_PRESCALER_128);
11281  1bd8 35075345      	mov	21317,#7
11282                     ; 2501     TIM4->ARR = (u8)(123);
11284  1bdc 357b5346      	mov	21318,#123
11285                     ; 2504     TIM4->IER |= (u8)(TIM4_IT_UPDATE);
11287  1be0 72105341      	bset	21313,#0
11288                     ; 2506     TIM4->CR1 |= TIM4_CR1_CEN;
11290  1be4 72105340      	bset	21312,#0
11291                     ; 2511     T_SCK_Port->CR1 |=T_SCK_Pin;	
11293  1be8 72165008      	bset	20488,#3
11294                     ; 2512     T_SCK_Port->DDR |=T_SCK_Pin;
11296  1bec 72165007      	bset	20487,#3
11297                     ; 2513     SCL_0;
11299  1bf0 72175005      	bres	20485,#3
11300                     ; 2515     T_SDA_Port->CR1 |=T_SDA_Pin;
11302  1bf4 72145008      	bset	20488,#2
11303                     ; 2516     T_SDA_Port->CR2 &=~T_SDA_Pin;    
11305  1bf8 72155009      	bres	20489,#2
11306                     ; 2517     SDA_OUT;
11308  1bfc 72145007      	bset	20487,#2
11309                     ; 2518     SDA_0;
11311  1c00 72155005      	bres	20485,#2
11312                     ; 2520     T1_SCK_Port->CR1 |=T1_SCK_Pin;	
11314  1c04 721e500d      	bset	20493,#7
11315                     ; 2521     T1_SCK_Port->DDR |=T1_SCK_Pin;
11317  1c08 721e500c      	bset	20492,#7
11318                     ; 2522     SCL1_0;
11320  1c0c 721f500a      	bres	20490,#7
11321                     ; 2524     T1_SDA_Port->CR1 |=T1_SDA_Pin;
11323  1c10 72105012      	bset	20498,#0
11324                     ; 2525     T1_SDA_Port->CR2 &=~T1_SDA_Pin;    
11326  1c14 72115013      	bres	20499,#0
11327                     ; 2526     SDA1_OUT;
11329  1c18 72105011      	bset	20497,#0
11330                     ; 2527     SDA1_0;
11332  1c1c 7211500f      	bres	20495,#0
11333                     ; 2529     TX_Port->CR1 |=TX_Pin;
11335  1c20 721e5012      	bset	20498,#7
11336                     ; 2530     TX_OUT;
11338  1c24 721e5011      	bset	20497,#7
11339                     ; 2531     TX_1;
11341  1c28 721e500f      	bset	20495,#7
11342                     ; 2533     RX_Port->CR1 |=RX_Pin;
11344  1c2c 721c5012      	bset	20498,#6
11345                     ; 2534     RX_IN;
11347  1c30 721d5011      	bres	20497,#6
11348                     ; 2536     D_SCL_Port->CR1 |=D_SCL_Pin;		
11350  1c34 721a5017      	bset	20503,#5
11351                     ; 2537     D_SCL_Port->DDR |=D_SCL_Pin;		
11353  1c38 721a5016      	bset	20502,#5
11354                     ; 2538     D_SCL_0;
11356  1c3c 721b5014      	bres	20500,#5
11357                     ; 2540     D_SDA_Port->CR1 |=D_SDA_Pin;		
11359  1c40 7214500d      	bset	20493,#2
11360                     ; 2541     D_SDA_OUT;
11362  1c44 7214500c      	bset	20492,#2
11363                     ; 2542     D_SDA_0;  
11365  1c48 7215500a      	bres	20490,#2
11366                     ; 2544     RELAY_Port->CR1 |=RELAY_Pin;		
11368  1c4c 721a5012      	bset	20498,#5
11369                     ; 2545     RELAY_Port->DDR |=RELAY_Pin;
11371  1c50 721a5011      	bset	20497,#5
11372                     ; 2546     RELAY_OFF;  
11374  1c54 721b500f      	bres	20495,#5
11375                     ; 2548     FAN_Port->CR1 |=FAN_Pin;		
11377  1c58 72185012      	bset	20498,#4
11378                     ; 2549     FAN_Port->DDR |=FAN_Pin;
11380  1c5c 72185011      	bset	20497,#4
11381                     ; 2550     FAN_OFF;  	
11383  1c60 7219500f      	bres	20495,#4
11384                     ; 2552     BEEP_Port->CR1 |=BEEP_Pin;		//beeper	
11386  1c64 72105008      	bset	20488,#0
11387                     ; 2553     BEEP_Port->DDR |=BEEP_Pin;
11389  1c68 72105007      	bset	20487,#0
11390                     ; 2554     BEEP_OFF;			       //BEEP OFF
11392  1c6c 72115005      	bres	20485,#0
11393                     ; 2562  TIM1->ARRH = 0x64;
11395  1c70 35645262      	mov	21090,#100
11396                     ; 2563  TIM1->ARRL = 0x00;			//0x6400 =25600
11398  1c74 725f5263      	clr	21091
11399                     ; 2571  TIM1->IER |= (u8)TIM1_IT_UPDATE;
11401  1c78 72105254      	bset	21076,#0
11402                     ; 2572  TIM1->CR1 |= TIM1_CR1_CEN;
11404  1c7c 72105250      	bset	21072,#0
11405                     ; 2578     enableInterrupts(); 
11408  1c80 9a            rim
11410                     ; 2583     TIM2->PSCR = 0;                                                                                                                                                                                                                                                   
11413  1c81 725f530c      	clr	21260
11414                     ; 2584     TIM2->ARRH = (u8)(2000 >> 8);                                                                                                                      
11416  1c85 3507530d      	mov	21261,#7
11417                     ; 2585     TIM2->ARRL = (u8)(2000);   
11419  1c89 35d0530e      	mov	21262,#208
11420                     ; 2587     TIM2->CCMR3 |= (u8)TIM2_CCMR_OCxPE;
11422  1c8d 72165307      	bset	21255,#3
11423                     ; 2589     TIM2->CR1 |= (u8)TIM2_CR1_CEN;
11425  1c91 72105300      	bset	21248,#0
11426                     ; 2590     TIM2->IER |= (u8)TIM2_IT_UPDATE;          
11428  1c95 72105301      	bset	21249,#0
11429                     ; 2594 		 match_ok =TRUE;
11431  1c99 350100bb      	mov	_match_ok,#1
11432                     ; 2596 		E2PROM_InitCheck();
11434  1c9d cd1abf        	call	_E2PROM_InitCheck
11436  1ca0               L5154:
11437                     ; 2602 		key_OverflowCheck();
11439  1ca0 cd1b57        	call	_key_OverflowCheck
11441                     ; 2604  	  if(comm_status == 2) 
11443  1ca3 b6d9          	ld	a,_comm_status
11444  1ca5 a102          	cp	a,#2
11445  1ca7 2610          	jrne	L1254
11446                     ; 2606 	   	comm_status =3;		
11448  1ca9 350300d9      	mov	_comm_status,#3
11449                     ; 2613 			Get_addr =(u8)(Get_word_1 >>8);		//command address			
11451  1cad 45087b        	mov	_Get_addr,_Get_word_1
11452                     ; 2614 	  	Get_data =(u8)(Get_word_1); 		//command data	
11454  1cb0 45097c        	mov	_Get_data,_Get_word_1+1
11455                     ; 2616 		  Get_vol =(u8)(Get_word_2 >>8);	
11457  1cb3 450a7d        	mov	_Get_vol,_Get_word_2
11458                     ; 2617 	  	Get_cur  =(u8)(Get_word_2);  
11460  1cb6 450b7e        	mov	_Get_cur,_Get_word_2+1
11461  1cb9               L1254:
11462                     ; 2619 	  if(comm_status ==4)
11464  1cb9 b6d9          	ld	a,_comm_status
11465  1cbb a104          	cp	a,#4
11466  1cbd 2643          	jrne	L3254
11467                     ; 2621 	  	comm_status =6;
11469  1cbf 350600d9      	mov	_comm_status,#6
11470                     ; 2623 	  	Get_tigbt =(u8)(Get_word_3 >>8);	
11472  1cc3 450c7f        	mov	_Get_tigbt,_Get_word_3
11473                     ; 2624 		  Get_tmain  =(u8)(Get_word_3);  
11475  1cc6 450d80        	mov	_Get_tmain,_Get_word_3+1
11476                     ; 2626 	  	Get_ppg =(u8)(Get_word_4 >>8);	
11478  1cc9 450e81        	mov	_Get_ppg,_Get_word_4
11479                     ; 2627 	  	Get_cur_no  =(u8)(Get_word_4);
11481  1ccc 450f82        	mov	_Get_cur_no,_Get_word_4+1
11482                     ; 2629 	  	temp_8 =comm_vertify();
11484  1ccf cd0033        	call	_comm_vertify
11486  1cd2 6b19          	ld	(OFST+0,sp),a
11487                     ; 2631 		  switch(Comm_step)
11489  1cd4 b672          	ld	a,_Comm_step
11491                     ; 2647 		    case comm_3_s:if(temp_8)  comm_get_deal(3-1); break;		  	
11492  1cd6 a010          	sub	a,#16
11493  1cd8 270a          	jreq	L5734
11494  1cda a010          	sub	a,#16
11495  1cdc 2710          	jreq	L7734
11496  1cde a010          	sub	a,#16
11497  1ce0 2717          	jreq	L1044
11498  1ce2 201e          	jra	L3254
11499  1ce4               L5734:
11500                     ; 2633 		    case comm_1_s:if(temp_8)  comm_get_deal(1-1); break;
11502  1ce4 0d19          	tnz	(OFST+0,sp)
11503  1ce6 271a          	jreq	L3254
11506  1ce8 4f            	clr	a
11507  1ce9 cd01aa        	call	_comm_get_deal
11509  1cec 2014          	jra	L3254
11510  1cee               L7734:
11511                     ; 2646 		    case comm_2_s:if(temp_8)  comm_get_deal(2-1); break; 		  					         				
11513  1cee 0d19          	tnz	(OFST+0,sp)
11514  1cf0 2710          	jreq	L3254
11517  1cf2 a601          	ld	a,#1
11518  1cf4 cd01aa        	call	_comm_get_deal
11520  1cf7 2009          	jra	L3254
11521  1cf9               L1044:
11522                     ; 2647 		    case comm_3_s:if(temp_8)  comm_get_deal(3-1); break;		  	
11524  1cf9 0d19          	tnz	(OFST+0,sp)
11525  1cfb 2705          	jreq	L3254
11528  1cfd a602          	ld	a,#2
11529  1cff cd01aa        	call	_comm_get_deal
11531  1d02               L7254:
11532  1d02               L3254:
11533                     ; 2655 		  if(Ms10_bz1 == TRUE)
11535  1d02 b611          	ld	a,_Ms10_bz1
11536  1d04 a101          	cp	a,#1
11537  1d06 264e          	jrne	L7354
11538                     ; 2657        	Ms10_bz1 =FALSE;   
11540  1d08 3f11          	clr	_Ms10_bz1
11541                     ; 2659 			  if(key_initial_count) key_initial_count--; 
11543  1d0a 3d39          	tnz	_key_initial_count
11544  1d0c 2702          	jreq	L1454
11547  1d0e 3a39          	dec	_key_initial_count
11548  1d10               L1454:
11549                     ; 2660 	      if(key_initial_count ==200) buzzer_time =buz_500ms;    //initial buzzer after power on 0.5s
11551  1d10 b639          	ld	a,_key_initial_count
11552  1d12 a1c8          	cp	a,#200
11553  1d14 2604          	jrne	L3454
11556  1d16 35320027      	mov	_buzzer_time,#50
11557  1d1a               L3454:
11558                     ; 2661 	      if(buzzer_time)  buzzer_time--;   
11560  1d1a 3d27          	tnz	_buzzer_time
11561  1d1c 2702          	jreq	L5454
11564  1d1e 3a27          	dec	_buzzer_time
11565  1d20               L5454:
11566                     ; 2663 	      if(match_ok == FALSE)  buzzer_time =255;
11568  1d20 3dbb          	tnz	_match_ok
11569  1d22 2606          	jrne	L7454
11572  1d24 35ff0027      	mov	_buzzer_time,#255
11574  1d28 201b          	jra	L1554
11575  1d2a               L7454:
11576                     ; 2666 	       	if(key_initial_count==100) APT8L16Init_AH(); 
11578  1d2a b639          	ld	a,_key_initial_count
11579  1d2c a164          	cp	a,#100
11580  1d2e 2603          	jrne	L3554
11583  1d30 cd0bf2        	call	_APT8L16Init_AH
11585  1d33               L3554:
11586                     ; 2667 	       	if(key_initial_count== 80) APT8L16Init_H();
11588  1d33 b639          	ld	a,_key_initial_count
11589  1d35 a150          	cp	a,#80
11590  1d37 2603          	jrne	L5554
11593  1d39 cd0a98        	call	_APT8L16Init_H
11595  1d3c               L5554:
11596                     ; 2668 	       	if(key_initial_count== 60) APT8L16Init_L();		     	 	 
11598  1d3c b639          	ld	a,_key_initial_count
11599  1d3e a13c          	cp	a,#60
11600  1d40 2603          	jrne	L1554
11603  1d42 cd0b45        	call	_APT8L16Init_L
11605  1d45               L1554:
11606                     ; 2670 	      if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(1);  	      	
11608  1d45 b6bb          	ld	a,_match_ok
11609  1d47 a101          	cp	a,#1
11610  1d49 260b          	jrne	L7354
11612  1d4b b639          	ld	a,_key_initial_count
11613  1d4d a11e          	cp	a,#30
11614  1d4f 2405          	jruge	L7354
11617  1d51 a601          	ld	a,#1
11618  1d53 cd0c9f        	call	_key_scan_I2C
11620  1d56               L7354:
11621                     ; 2675 			if(Ms10_bz2 == TRUE)
11623  1d56 b612          	ld	a,_Ms10_bz2
11624  1d58 a101          	cp	a,#1
11625  1d5a 2613          	jrne	L3654
11626                     ; 2677          	Ms10_bz2 =FALSE; 
11628  1d5c 3f12          	clr	_Ms10_bz2
11629                     ; 2678 				  if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(2);
11631  1d5e b6bb          	ld	a,_match_ok
11632  1d60 a101          	cp	a,#1
11633  1d62 260b          	jrne	L3654
11635  1d64 b639          	ld	a,_key_initial_count
11636  1d66 a11e          	cp	a,#30
11637  1d68 2405          	jruge	L3654
11640  1d6a a602          	ld	a,#2
11641  1d6c cd0c9f        	call	_key_scan_I2C
11643  1d6f               L3654:
11644                     ; 2683 			if(Ms10_bz3 == TRUE)
11646  1d6f b613          	ld	a,_Ms10_bz3
11647  1d71 a101          	cp	a,#1
11648  1d73 2613          	jrne	L7654
11649                     ; 2685          	Ms10_bz3 =FALSE; 
11651  1d75 3f13          	clr	_Ms10_bz3
11652                     ; 2686           if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(3); 
11654  1d77 b6bb          	ld	a,_match_ok
11655  1d79 a101          	cp	a,#1
11656  1d7b 260b          	jrne	L7654
11658  1d7d b639          	ld	a,_key_initial_count
11659  1d7f a11e          	cp	a,#30
11660  1d81 2405          	jruge	L7654
11663  1d83 a603          	ld	a,#3
11664  1d85 cd0c9f        	call	_key_scan_I2C
11666  1d88               L7654:
11667                     ; 2691         if(Ms10_bz4 == TRUE)
11669  1d88 b614          	ld	a,_Ms10_bz4
11670  1d8a a101          	cp	a,#1
11671  1d8c 2703          	jreq	L043
11672  1d8e cc233e        	jp	L3754
11673  1d91               L043:
11674                     ; 2693 				  Ms10_bz4 =FALSE; 
11676  1d91 3f14          	clr	_Ms10_bz4
11677                     ; 2695         	key_next_deal();
11679  1d93 cd0db7        	call	_key_next_deal
11681                     ; 2697 					if(key_ReleaseFlag == TRUE)	// 无按键，松手
11683  1d96 c60011        	ld	a,_key_ReleaseFlag
11684  1d99 a101          	cp	a,#1
11685  1d9b 2703          	jreq	L243
11686  1d9d cc1e2b        	jp	L5754
11687  1da0               L243:
11688                     ; 2699 							if(key_longPressRecord == TRUE)
11690  1da0 c60012        	ld	a,_key_longPressRecord
11691  1da3 a101          	cp	a,#1
11692  1da5 2608          	jrne	L7754
11693                     ; 2701 								key_buf = 0;
11695  1da7 725f0000      	clr	_key_buf
11696                     ; 2702 								key_longPressRecord = FALSE;
11698  1dab 725f0012      	clr	_key_longPressRecord
11699  1daf               L7754:
11700                     ; 2704 							if(key_buf == KEY_DOUX1)
11702  1daf c60000        	ld	a,_key_buf
11703  1db2 a114          	cp	a,#20
11704  1db4 2621          	jrne	L1064
11705                     ; 2706 								favor_x_set(on1_bz,Select_1_KEY,&zone_flash_count1,&zone1_step,&zone_1_level,&boost_time_1,1,&zone_1_timer);
11707  1db6 ae00ad        	ldw	x,#_zone_1_timer
11708  1db9 89            	pushw	x
11709  1dba 4b01          	push	#1
11710  1dbc ae0052        	ldw	x,#_boost_time_1
11711  1dbf 89            	pushw	x
11712  1dc0 ae00a7        	ldw	x,#_zone_1_level
11713  1dc3 89            	pushw	x
11714  1dc4 ae0045        	ldw	x,#_zone1_step
11715  1dc7 89            	pushw	x
11716  1dc8 ae003b        	ldw	x,#_zone_flash_count1
11717  1dcb 89            	pushw	x
11718  1dcc ae0001        	ldw	x,#1
11719  1dcf b621          	ld	a,_on1_bz
11720  1dd1 95            	ld	xh,a
11721  1dd2 cd190e        	call	_favor_x_set
11723  1dd5 5b0b          	addw	sp,#11
11724  1dd7               L1064:
11725                     ; 2708 							if(key_buf == KEY_DOUX2)
11727  1dd7 c60000        	ld	a,_key_buf
11728  1dda a124          	cp	a,#36
11729  1ddc 2621          	jrne	L3064
11730                     ; 2710 								favor_x_set(on2_bz,Select_2_KEY,&zone_flash_count2,&zone2_step,&zone_2_level,&boost_time_2,2,&zone_2_timer);
11732  1dde ae00af        	ldw	x,#_zone_2_timer
11733  1de1 89            	pushw	x
11734  1de2 4b02          	push	#2
11735  1de4 ae0054        	ldw	x,#_boost_time_2
11736  1de7 89            	pushw	x
11737  1de8 ae00a8        	ldw	x,#_zone_2_level
11738  1deb 89            	pushw	x
11739  1dec ae0046        	ldw	x,#_zone2_step
11740  1def 89            	pushw	x
11741  1df0 ae003c        	ldw	x,#_zone_flash_count2
11742  1df3 89            	pushw	x
11743  1df4 ae0002        	ldw	x,#2
11744  1df7 b622          	ld	a,_on2_bz
11745  1df9 95            	ld	xh,a
11746  1dfa cd190e        	call	_favor_x_set
11748  1dfd 5b0b          	addw	sp,#11
11749  1dff               L3064:
11750                     ; 2712 							if(key_buf == KEY_DOUX3)
11752  1dff c60000        	ld	a,_key_buf
11753  1e02 a134          	cp	a,#52
11754  1e04 2621          	jrne	L5064
11755                     ; 2714 								favor_x_set(on3_bz,Select_3_KEY,&zone_flash_count3,&zone3_step,&zone_3_level,&boost_time_3,3,&zone_3_timer);
11757  1e06 ae00b1        	ldw	x,#_zone_3_timer
11758  1e09 89            	pushw	x
11759  1e0a 4b03          	push	#3
11760  1e0c ae0056        	ldw	x,#_boost_time_3
11761  1e0f 89            	pushw	x
11762  1e10 ae00a9        	ldw	x,#_zone_3_level
11763  1e13 89            	pushw	x
11764  1e14 ae0047        	ldw	x,#_zone3_step
11765  1e17 89            	pushw	x
11766  1e18 ae003d        	ldw	x,#_zone_flash_count3
11767  1e1b 89            	pushw	x
11768  1e1c ae0004        	ldw	x,#4
11769  1e1f b623          	ld	a,_on3_bz
11770  1e21 95            	ld	xh,a
11771  1e22 cd190e        	call	_favor_x_set
11773  1e25 5b0b          	addw	sp,#11
11774  1e27               L5064:
11775                     ; 2716 							key_buf = 0;
11777  1e27 725f0000      	clr	_key_buf
11778  1e2b               L5754:
11779                     ; 2719 				if(key_ok_bit == KEY_ONOFF)  {lock_key_deal();if(lock_bz == TRUE) {speed_up();}} 
11781  1e2b b692          	ld	a,_key_ok_bit
11782  1e2d a1a2          	cp	a,#162
11783  1e2f 260c          	jrne	L7064
11786  1e31 cd14d4        	call	_lock_key_deal
11790  1e34 b625          	ld	a,_lock_bz
11791  1e36 a101          	cp	a,#1
11792  1e38 2603          	jrne	L7064
11795  1e3a cd149a        	call	_speed_up
11797  1e3d               L7064:
11798                     ; 2721          	if(key_ok_bit == KEY_LOCK)  {on_off_key_deal();speed_up();}
11800  1e3d b692          	ld	a,_key_ok_bit
11801  1e3f a1a3          	cp	a,#163
11802  1e41 2606          	jrne	L3164
11805  1e43 cd14a3        	call	_on_off_key_deal
11809  1e46 cd149a        	call	_speed_up
11811  1e49               L3164:
11812                     ; 2725          	if((Power_on_bz == TRUE) && (key_account == short_press_time) &&(Pause_bz ==0)) 
11814  1e49 b620          	ld	a,_Power_on_bz
11815  1e4b a101          	cp	a,#1
11816  1e4d 2703          	jreq	L443
11817  1e4f cc205e        	jp	L5164
11818  1e52               L443:
11820  1e52 be93          	ldw	x,_key_account
11821  1e54 a30002        	cpw	x,#2
11822  1e57 2703          	jreq	L643
11823  1e59 cc205e        	jp	L5164
11824  1e5c               L643:
11826  1e5c 3ddd          	tnz	_Pause_bz
11827  1e5e 2703          	jreq	L053
11828  1e60 cc205e        	jp	L5164
11829  1e63               L053:
11830                     ; 2731            	if(key_ok_bit == KEY_ON1) {on_x_set(&on1_bz,&zone_1_timer,&zone_1_level,&zone_1_timeout_cnt,&zone_flash_count1,zone_2_level,zone_3_level);speed_up();} 
11832  1e63 b692          	ld	a,_key_ok_bit
11833  1e65 a111          	cp	a,#17
11834  1e67 2621          	jrne	L7164
11837  1e69 3b00a9        	push	_zone_3_level
11838  1e6c 3b00a8        	push	_zone_2_level
11839  1e6f ae003b        	ldw	x,#_zone_flash_count1
11840  1e72 89            	pushw	x
11841  1e73 ae0028        	ldw	x,#_zone_1_timeout_cnt
11842  1e76 89            	pushw	x
11843  1e77 ae00a7        	ldw	x,#_zone_1_level
11844  1e7a 89            	pushw	x
11845  1e7b ae00ad        	ldw	x,#_zone_1_timer
11846  1e7e 89            	pushw	x
11847  1e7f ae0021        	ldw	x,#_on1_bz
11848  1e82 cd178a        	call	_on_x_set
11850  1e85 5b0a          	addw	sp,#10
11853  1e87 cd149a        	call	_speed_up
11855  1e8a               L7164:
11856                     ; 2732            	if(key_ok_bit == KEY_ON2) {on_x_set(&on2_bz,&zone_2_timer,&zone_2_level,&zone_2_timeout_cnt,&zone_flash_count2,zone_1_level,zone_3_level);speed_up();}  
11858  1e8a b692          	ld	a,_key_ok_bit
11859  1e8c a121          	cp	a,#33
11860  1e8e 2621          	jrne	L1264
11863  1e90 3b00a9        	push	_zone_3_level
11864  1e93 3b00a7        	push	_zone_1_level
11865  1e96 ae003c        	ldw	x,#_zone_flash_count2
11866  1e99 89            	pushw	x
11867  1e9a ae0029        	ldw	x,#_zone_2_timeout_cnt
11868  1e9d 89            	pushw	x
11869  1e9e ae00a8        	ldw	x,#_zone_2_level
11870  1ea1 89            	pushw	x
11871  1ea2 ae00af        	ldw	x,#_zone_2_timer
11872  1ea5 89            	pushw	x
11873  1ea6 ae0022        	ldw	x,#_on2_bz
11874  1ea9 cd178a        	call	_on_x_set
11876  1eac 5b0a          	addw	sp,#10
11879  1eae cd149a        	call	_speed_up
11881  1eb1               L1264:
11882                     ; 2733            	if(key_ok_bit == KEY_ON3) {on_x_set(&on3_bz,&zone_3_timer,&zone_3_level,&zone_3_timeout_cnt,&zone_flash_count3,zone_1_level,zone_2_level);speed_up();} 
11884  1eb1 b692          	ld	a,_key_ok_bit
11885  1eb3 a131          	cp	a,#49
11886  1eb5 2621          	jrne	L3264
11889  1eb7 3b00a8        	push	_zone_2_level
11890  1eba 3b00a7        	push	_zone_1_level
11891  1ebd ae003d        	ldw	x,#_zone_flash_count3
11892  1ec0 89            	pushw	x
11893  1ec1 ae002a        	ldw	x,#_zone_3_timeout_cnt
11894  1ec4 89            	pushw	x
11895  1ec5 ae00a9        	ldw	x,#_zone_3_level
11896  1ec8 89            	pushw	x
11897  1ec9 ae00b1        	ldw	x,#_zone_3_timer
11898  1ecc 89            	pushw	x
11899  1ecd ae0023        	ldw	x,#_on3_bz
11900  1ed0 cd178a        	call	_on_x_set
11902  1ed3 5b0a          	addw	sp,#10
11905  1ed5 cd149a        	call	_speed_up
11907  1ed8               L3264:
11908                     ; 2743           	if(key_ok_bit == KEY_VIF1)   {vif_x_set(on1_bz,Select_1_KEY,&zone_flash_count1,&zone1_step,&zone_1_level,&boost_time_1,&boost_time_2,&zone_1_timer);speed_up();} 
11910  1ed8 b692          	ld	a,_key_ok_bit
11911  1eda a115          	cp	a,#21
11912  1edc 2626          	jrne	L5264
11915  1ede ae00ad        	ldw	x,#_zone_1_timer
11916  1ee1 89            	pushw	x
11917  1ee2 ae0054        	ldw	x,#_boost_time_2
11918  1ee5 89            	pushw	x
11919  1ee6 ae0052        	ldw	x,#_boost_time_1
11920  1ee9 89            	pushw	x
11921  1eea ae00a7        	ldw	x,#_zone_1_level
11922  1eed 89            	pushw	x
11923  1eee ae0045        	ldw	x,#_zone1_step
11924  1ef1 89            	pushw	x
11925  1ef2 ae003b        	ldw	x,#_zone_flash_count1
11926  1ef5 89            	pushw	x
11927  1ef6 ae0001        	ldw	x,#1
11928  1ef9 b621          	ld	a,_on1_bz
11929  1efb 95            	ld	xh,a
11930  1efc cd1874        	call	_vif_x_set
11932  1eff 5b0c          	addw	sp,#12
11935  1f01 cd149a        	call	_speed_up
11937  1f04               L5264:
11938                     ; 2744           	if(key_ok_bit == KEY_VIF2)   {vif_x_set(on2_bz,Select_2_KEY,&zone_flash_count2,&zone2_step,&zone_2_level,&boost_time_2,&boost_time_1,&zone_2_timer);speed_up();} 
11940  1f04 b692          	ld	a,_key_ok_bit
11941  1f06 a125          	cp	a,#37
11942  1f08 2626          	jrne	L7264
11945  1f0a ae00af        	ldw	x,#_zone_2_timer
11946  1f0d 89            	pushw	x
11947  1f0e ae0052        	ldw	x,#_boost_time_1
11948  1f11 89            	pushw	x
11949  1f12 ae0054        	ldw	x,#_boost_time_2
11950  1f15 89            	pushw	x
11951  1f16 ae00a8        	ldw	x,#_zone_2_level
11952  1f19 89            	pushw	x
11953  1f1a ae0046        	ldw	x,#_zone2_step
11954  1f1d 89            	pushw	x
11955  1f1e ae003c        	ldw	x,#_zone_flash_count2
11956  1f21 89            	pushw	x
11957  1f22 ae0002        	ldw	x,#2
11958  1f25 b622          	ld	a,_on2_bz
11959  1f27 95            	ld	xh,a
11960  1f28 cd1874        	call	_vif_x_set
11962  1f2b 5b0c          	addw	sp,#12
11965  1f2d cd149a        	call	_speed_up
11967  1f30               L7264:
11968                     ; 2745           	if(key_ok_bit == KEY_VIF3)   {vif_x_set(on3_bz,Select_3_KEY,&zone_flash_count3,&zone3_step,&zone_3_level,&boost_time_3,&boost_time_4,&zone_3_timer);speed_up();} 
11970  1f30 b692          	ld	a,_key_ok_bit
11971  1f32 a135          	cp	a,#53
11972  1f34 2626          	jrne	L1364
11975  1f36 ae00b1        	ldw	x,#_zone_3_timer
11976  1f39 89            	pushw	x
11977  1f3a ae0058        	ldw	x,#_boost_time_4
11978  1f3d 89            	pushw	x
11979  1f3e ae0056        	ldw	x,#_boost_time_3
11980  1f41 89            	pushw	x
11981  1f42 ae00a9        	ldw	x,#_zone_3_level
11982  1f45 89            	pushw	x
11983  1f46 ae0047        	ldw	x,#_zone3_step
11984  1f49 89            	pushw	x
11985  1f4a ae003d        	ldw	x,#_zone_flash_count3
11986  1f4d 89            	pushw	x
11987  1f4e ae0004        	ldw	x,#4
11988  1f51 b623          	ld	a,_on3_bz
11989  1f53 95            	ld	xh,a
11990  1f54 cd1874        	call	_vif_x_set
11992  1f57 5b0c          	addw	sp,#12
11995  1f59 cd149a        	call	_speed_up
11997  1f5c               L1364:
11998                     ; 2748           	if(key_ok_bit == KEY_BOOST1) {boost_x_set(on1_bz,Select_1_KEY,&zone1_step,&zone_flash_count1,&zone_1_level,&zone_2_level,&boost_time_1,&boost_time_2,&zone_1_timer);speed_up();} 
12000  1f5c b692          	ld	a,_key_ok_bit
12001  1f5e a116          	cp	a,#22
12002  1f60 262a          	jrne	L3364
12005  1f62 ae00ad        	ldw	x,#_zone_1_timer
12006  1f65 89            	pushw	x
12007  1f66 ae0054        	ldw	x,#_boost_time_2
12008  1f69 89            	pushw	x
12009  1f6a ae0052        	ldw	x,#_boost_time_1
12010  1f6d 89            	pushw	x
12011  1f6e ae00a8        	ldw	x,#_zone_2_level
12012  1f71 89            	pushw	x
12013  1f72 ae00a7        	ldw	x,#_zone_1_level
12014  1f75 89            	pushw	x
12015  1f76 ae003b        	ldw	x,#_zone_flash_count1
12016  1f79 89            	pushw	x
12017  1f7a ae0045        	ldw	x,#_zone1_step
12018  1f7d 89            	pushw	x
12019  1f7e ae0001        	ldw	x,#1
12020  1f81 b621          	ld	a,_on1_bz
12021  1f83 95            	ld	xh,a
12022  1f84 cd17e7        	call	_boost_x_set
12024  1f87 5b0e          	addw	sp,#14
12027  1f89 cd149a        	call	_speed_up
12029  1f8c               L3364:
12030                     ; 2749           	if(key_ok_bit == KEY_BOOST2) {boost_x_set(on2_bz,Select_2_KEY,&zone2_step,&zone_flash_count2,&zone_2_level,&zone_1_level,&boost_time_2,&boost_time_1,&zone_2_timer);speed_up();} 
12032  1f8c b692          	ld	a,_key_ok_bit
12033  1f8e a126          	cp	a,#38
12034  1f90 262a          	jrne	L5364
12037  1f92 ae00af        	ldw	x,#_zone_2_timer
12038  1f95 89            	pushw	x
12039  1f96 ae0052        	ldw	x,#_boost_time_1
12040  1f99 89            	pushw	x
12041  1f9a ae0054        	ldw	x,#_boost_time_2
12042  1f9d 89            	pushw	x
12043  1f9e ae00a7        	ldw	x,#_zone_1_level
12044  1fa1 89            	pushw	x
12045  1fa2 ae00a8        	ldw	x,#_zone_2_level
12046  1fa5 89            	pushw	x
12047  1fa6 ae003c        	ldw	x,#_zone_flash_count2
12048  1fa9 89            	pushw	x
12049  1faa ae0046        	ldw	x,#_zone2_step
12050  1fad 89            	pushw	x
12051  1fae ae0002        	ldw	x,#2
12052  1fb1 b622          	ld	a,_on2_bz
12053  1fb3 95            	ld	xh,a
12054  1fb4 cd17e7        	call	_boost_x_set
12056  1fb7 5b0e          	addw	sp,#14
12059  1fb9 cd149a        	call	_speed_up
12061  1fbc               L5364:
12062                     ; 2750           	if(key_ok_bit == KEY_BOOST3) {boost_x_set(on3_bz,Select_3_KEY,&zone3_step,&zone_flash_count3,&zone_3_level,&zone_4_level,&boost_time_3,&boost_time_4,&zone_3_timer);speed_up();} 
12064  1fbc b692          	ld	a,_key_ok_bit
12065  1fbe a136          	cp	a,#54
12066  1fc0 262a          	jrne	L7364
12069  1fc2 ae00b1        	ldw	x,#_zone_3_timer
12070  1fc5 89            	pushw	x
12071  1fc6 ae0058        	ldw	x,#_boost_time_4
12072  1fc9 89            	pushw	x
12073  1fca ae0056        	ldw	x,#_boost_time_3
12074  1fcd 89            	pushw	x
12075  1fce ae00aa        	ldw	x,#_zone_4_level
12076  1fd1 89            	pushw	x
12077  1fd2 ae00a9        	ldw	x,#_zone_3_level
12078  1fd5 89            	pushw	x
12079  1fd6 ae003d        	ldw	x,#_zone_flash_count3
12080  1fd9 89            	pushw	x
12081  1fda ae0047        	ldw	x,#_zone3_step
12082  1fdd 89            	pushw	x
12083  1fde ae0004        	ldw	x,#4
12084  1fe1 b623          	ld	a,_on3_bz
12085  1fe3 95            	ld	xh,a
12086  1fe4 cd17e7        	call	_boost_x_set
12088  1fe7 5b0e          	addw	sp,#14
12091  1fe9 cd149a        	call	_speed_up
12093  1fec               L7364:
12094                     ; 2753           	if(key_ok_bit == KEY_TIMER1)  {timer_x_set(&on1_bz,Select_1_KEY,&time_flash_count1,&zone_1_timer,zone_1_level,&zone_flash_count1,&set_default_timer1_cnt);speed_up();}   
12096  1fec b692          	ld	a,_key_ok_bit
12097  1fee a119          	cp	a,#25
12098  1ff0 2620          	jrne	L1464
12101  1ff2 ae0030        	ldw	x,#_set_default_timer1_cnt
12102  1ff5 89            	pushw	x
12103  1ff6 ae003b        	ldw	x,#_zone_flash_count1
12104  1ff9 89            	pushw	x
12105  1ffa 3b00a7        	push	_zone_1_level
12106  1ffd ae00ad        	ldw	x,#_zone_1_timer
12107  2000 89            	pushw	x
12108  2001 ae004a        	ldw	x,#_time_flash_count1
12109  2004 89            	pushw	x
12110  2005 4b01          	push	#1
12111  2007 ae0021        	ldw	x,#_on1_bz
12112  200a cd1984        	call	_timer_x_set
12114  200d 5b0a          	addw	sp,#10
12117  200f cd149a        	call	_speed_up
12119  2012               L1464:
12120                     ; 2754           	if(key_ok_bit == KEY_TIMER2)  {timer_x_set(&on2_bz,Select_2_KEY,&time_flash_count2,&zone_2_timer,zone_2_level,&zone_flash_count2,&set_default_timer2_cnt);speed_up();}
12122  2012 b692          	ld	a,_key_ok_bit
12123  2014 a129          	cp	a,#41
12124  2016 2620          	jrne	L3464
12127  2018 ae0031        	ldw	x,#_set_default_timer2_cnt
12128  201b 89            	pushw	x
12129  201c ae003c        	ldw	x,#_zone_flash_count2
12130  201f 89            	pushw	x
12131  2020 3b00a8        	push	_zone_2_level
12132  2023 ae00af        	ldw	x,#_zone_2_timer
12133  2026 89            	pushw	x
12134  2027 ae004b        	ldw	x,#_time_flash_count2
12135  202a 89            	pushw	x
12136  202b 4b02          	push	#2
12137  202d ae0022        	ldw	x,#_on2_bz
12138  2030 cd1984        	call	_timer_x_set
12140  2033 5b0a          	addw	sp,#10
12143  2035 cd149a        	call	_speed_up
12145  2038               L3464:
12146                     ; 2755           	if(key_ok_bit == KEY_TIMER3)  {timer_x_set(&on3_bz,Select_3_KEY,&time_flash_count3,&zone_3_timer,zone_3_level,&zone_flash_count3,&set_default_timer3_cnt);speed_up();}
12148  2038 b692          	ld	a,_key_ok_bit
12149  203a a139          	cp	a,#57
12150  203c 2620          	jrne	L5164
12153  203e ae0032        	ldw	x,#_set_default_timer3_cnt
12154  2041 89            	pushw	x
12155  2042 ae003d        	ldw	x,#_zone_flash_count3
12156  2045 89            	pushw	x
12157  2046 3b00a9        	push	_zone_3_level
12158  2049 ae00b1        	ldw	x,#_zone_3_timer
12159  204c 89            	pushw	x
12160  204d ae004c        	ldw	x,#_time_flash_count3
12161  2050 89            	pushw	x
12162  2051 4b04          	push	#4
12163  2053 ae0023        	ldw	x,#_on3_bz
12164  2056 cd1984        	call	_timer_x_set
12166  2059 5b0a          	addw	sp,#10
12169  205b cd149a        	call	_speed_up
12171  205e               L5164:
12172                     ; 2759 					if((Power_on_bz == TRUE) && (Pause_bz ==0)) 
12174  205e b620          	ld	a,_Power_on_bz
12175  2060 a101          	cp	a,#1
12176  2062 2703          	jreq	L253
12177  2064 cc233e        	jp	L3754
12178  2067               L253:
12180  2067 3ddd          	tnz	_Pause_bz
12181  2069 2703          	jreq	L453
12182  206b cc233e        	jp	L3754
12183  206e               L453:
12184                     ; 2762            	if(key_ok_bit == KEY_DEC1)
12186  206e b692          	ld	a,_key_ok_bit
12187  2070 a112          	cp	a,#18
12188  2072 264a          	jrne	L1564
12189                     ; 2764 							if(time_flash_count1 > zone_flash_count1)
12191  2074 b64a          	ld	a,_time_flash_count1
12192  2076 b13b          	cp	a,_zone_flash_count1
12193  2078 2315          	jrule	L3564
12194                     ; 2766 								dec_x_timer(Select_1_KEY,&zone_1_timer,&time_flash_count1,&timer1_1min_cnt);
12196  207a ae0000        	ldw	x,#_timer1_1min_cnt
12197  207d 89            	pushw	x
12198  207e ae004a        	ldw	x,#_time_flash_count1
12199  2081 89            	pushw	x
12200  2082 ae00ad        	ldw	x,#_zone_1_timer
12201  2085 89            	pushw	x
12202  2086 a601          	ld	a,#1
12203  2088 cd16b0        	call	_dec_x_timer
12205  208b 5b06          	addw	sp,#6
12207  208d 202c          	jra	L5564
12208  208f               L3564:
12209                     ; 2770 								dec_x_key_level(zone1_step,&count_1_key,&zone_flash_count1,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&on1_bz);
12211  208f ae0021        	ldw	x,#_on1_bz
12212  2092 89            	pushw	x
12213  2093 ae00af        	ldw	x,#_zone_2_timer
12214  2096 89            	pushw	x
12215  2097 ae00ad        	ldw	x,#_zone_1_timer
12216  209a 89            	pushw	x
12217  209b 4b01          	push	#1
12218  209d ae0054        	ldw	x,#_boost_time_2
12219  20a0 89            	pushw	x
12220  20a1 be52          	ldw	x,_boost_time_1
12221  20a3 89            	pushw	x
12222  20a4 ae00a8        	ldw	x,#_zone_2_level
12223  20a7 89            	pushw	x
12224  20a8 ae00a7        	ldw	x,#_zone_1_level
12225  20ab 89            	pushw	x
12226  20ac ae003b        	ldw	x,#_zone_flash_count1
12227  20af 89            	pushw	x
12228  20b0 ae0041        	ldw	x,#_count_1_key
12229  20b3 89            	pushw	x
12230  20b4 b645          	ld	a,_zone1_step
12231  20b6 cd1628        	call	_dec_x_key_level
12233  20b9 5b13          	addw	sp,#19
12234  20bb               L5564:
12235                     ; 2772 							speed_up();
12237  20bb cd149a        	call	_speed_up
12239  20be               L1564:
12240                     ; 2774            	if(key_ok_bit == KEY_DEC2)
12242  20be b692          	ld	a,_key_ok_bit
12243  20c0 a122          	cp	a,#34
12244  20c2 264a          	jrne	L7564
12245                     ; 2776 							if(time_flash_count2 > zone_flash_count2)
12247  20c4 b64b          	ld	a,_time_flash_count2
12248  20c6 b13c          	cp	a,_zone_flash_count2
12249  20c8 2315          	jrule	L1664
12250                     ; 2778 								dec_x_timer(Select_2_KEY,&zone_2_timer,&time_flash_count2,&timer2_1min_cnt);
12252  20ca ae0002        	ldw	x,#_timer2_1min_cnt
12253  20cd 89            	pushw	x
12254  20ce ae004b        	ldw	x,#_time_flash_count2
12255  20d1 89            	pushw	x
12256  20d2 ae00af        	ldw	x,#_zone_2_timer
12257  20d5 89            	pushw	x
12258  20d6 a602          	ld	a,#2
12259  20d8 cd16b0        	call	_dec_x_timer
12261  20db 5b06          	addw	sp,#6
12263  20dd 202c          	jra	L3664
12264  20df               L1664:
12265                     ; 2782 								dec_x_key_level(zone2_step,&count_2_key,&zone_flash_count2,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&on2_bz);
12267  20df ae0022        	ldw	x,#_on2_bz
12268  20e2 89            	pushw	x
12269  20e3 ae00ad        	ldw	x,#_zone_1_timer
12270  20e6 89            	pushw	x
12271  20e7 ae00af        	ldw	x,#_zone_2_timer
12272  20ea 89            	pushw	x
12273  20eb 4b02          	push	#2
12274  20ed ae0052        	ldw	x,#_boost_time_1
12275  20f0 89            	pushw	x
12276  20f1 be54          	ldw	x,_boost_time_2
12277  20f3 89            	pushw	x
12278  20f4 ae00a7        	ldw	x,#_zone_1_level
12279  20f7 89            	pushw	x
12280  20f8 ae00a8        	ldw	x,#_zone_2_level
12281  20fb 89            	pushw	x
12282  20fc ae003c        	ldw	x,#_zone_flash_count2
12283  20ff 89            	pushw	x
12284  2100 ae0042        	ldw	x,#_count_2_key
12285  2103 89            	pushw	x
12286  2104 b646          	ld	a,_zone2_step
12287  2106 cd1628        	call	_dec_x_key_level
12289  2109 5b13          	addw	sp,#19
12290  210b               L3664:
12291                     ; 2784 							speed_up();
12293  210b cd149a        	call	_speed_up
12295  210e               L7564:
12296                     ; 2786           	if(key_ok_bit == KEY_DEC3)
12298  210e b692          	ld	a,_key_ok_bit
12299  2110 a132          	cp	a,#50
12300  2112 264a          	jrne	L5664
12301                     ; 2788 							if(time_flash_count3 > zone_flash_count3)
12303  2114 b64c          	ld	a,_time_flash_count3
12304  2116 b13d          	cp	a,_zone_flash_count3
12305  2118 2315          	jrule	L7664
12306                     ; 2790 								dec_x_timer(Select_3_KEY,&zone_3_timer,&time_flash_count3,&timer3_1min_cnt);
12308  211a ae0004        	ldw	x,#_timer3_1min_cnt
12309  211d 89            	pushw	x
12310  211e ae004c        	ldw	x,#_time_flash_count3
12311  2121 89            	pushw	x
12312  2122 ae00b1        	ldw	x,#_zone_3_timer
12313  2125 89            	pushw	x
12314  2126 a604          	ld	a,#4
12315  2128 cd16b0        	call	_dec_x_timer
12317  212b 5b06          	addw	sp,#6
12319  212d 202c          	jra	L1764
12320  212f               L7664:
12321                     ; 2794 								dec_x_key_level(zone3_step,&count_3_key,&zone_flash_count3,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&on3_bz);
12323  212f ae0023        	ldw	x,#_on3_bz
12324  2132 89            	pushw	x
12325  2133 ae00b3        	ldw	x,#_zone_4_timer
12326  2136 89            	pushw	x
12327  2137 ae00b1        	ldw	x,#_zone_3_timer
12328  213a 89            	pushw	x
12329  213b 4b04          	push	#4
12330  213d ae0058        	ldw	x,#_boost_time_4
12331  2140 89            	pushw	x
12332  2141 be56          	ldw	x,_boost_time_3
12333  2143 89            	pushw	x
12334  2144 ae00aa        	ldw	x,#_zone_4_level
12335  2147 89            	pushw	x
12336  2148 ae00a9        	ldw	x,#_zone_3_level
12337  214b 89            	pushw	x
12338  214c ae003d        	ldw	x,#_zone_flash_count3
12339  214f 89            	pushw	x
12340  2150 ae0043        	ldw	x,#_count_3_key
12341  2153 89            	pushw	x
12342  2154 b647          	ld	a,_zone3_step
12343  2156 cd1628        	call	_dec_x_key_level
12345  2159 5b13          	addw	sp,#19
12346  215b               L1764:
12347                     ; 2796 							speed_up();
12349  215b cd149a        	call	_speed_up
12351  215e               L5664:
12352                     ; 2800            	if(key_ok_bit == KEY_INC1)
12354  215e b692          	ld	a,_key_ok_bit
12355  2160 a113          	cp	a,#19
12356  2162 264a          	jrne	L3764
12357                     ; 2802 							if(time_flash_count1 > zone_flash_count1)
12359  2164 b64a          	ld	a,_time_flash_count1
12360  2166 b13b          	cp	a,_zone_flash_count1
12361  2168 2315          	jrule	L5764
12362                     ; 2804 								inc_x_timer(Select_1_KEY,&zone_1_timer,&time_flash_count1,&timer1_1min_cnt);
12364  216a ae0000        	ldw	x,#_timer1_1min_cnt
12365  216d 89            	pushw	x
12366  216e ae004a        	ldw	x,#_time_flash_count1
12367  2171 89            	pushw	x
12368  2172 ae00ad        	ldw	x,#_zone_1_timer
12369  2175 89            	pushw	x
12370  2176 a601          	ld	a,#1
12371  2178 cd15bf        	call	_inc_x_timer
12373  217b 5b06          	addw	sp,#6
12375  217d 202c          	jra	L7764
12376  217f               L5764:
12377                     ; 2808 								inc_x_key_level(zone1_step,&count_1_key,&zone_flash_count1,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer,&on1_bz);
12379  217f ae0021        	ldw	x,#_on1_bz
12380  2182 89            	pushw	x
12381  2183 ae00af        	ldw	x,#_zone_2_timer
12382  2186 89            	pushw	x
12383  2187 ae00ad        	ldw	x,#_zone_1_timer
12384  218a 89            	pushw	x
12385  218b 4b01          	push	#1
12386  218d ae0054        	ldw	x,#_boost_time_2
12387  2190 89            	pushw	x
12388  2191 be52          	ldw	x,_boost_time_1
12389  2193 89            	pushw	x
12390  2194 ae00a8        	ldw	x,#_zone_2_level
12391  2197 89            	pushw	x
12392  2198 ae00a7        	ldw	x,#_zone_1_level
12393  219b 89            	pushw	x
12394  219c ae003b        	ldw	x,#_zone_flash_count1
12395  219f 89            	pushw	x
12396  21a0 ae0041        	ldw	x,#_count_1_key
12397  21a3 89            	pushw	x
12398  21a4 b645          	ld	a,_zone1_step
12399  21a6 cd154d        	call	_inc_x_key_level
12401  21a9 5b13          	addw	sp,#19
12402  21ab               L7764:
12403                     ; 2810 							speed_up();
12405  21ab cd149a        	call	_speed_up
12407  21ae               L3764:
12408                     ; 2812           	if(key_ok_bit == KEY_INC2)
12410  21ae b692          	ld	a,_key_ok_bit
12411  21b0 a123          	cp	a,#35
12412  21b2 264a          	jrne	L1074
12413                     ; 2814 							if(time_flash_count2 > zone_flash_count2)
12415  21b4 b64b          	ld	a,_time_flash_count2
12416  21b6 b13c          	cp	a,_zone_flash_count2
12417  21b8 2315          	jrule	L3074
12418                     ; 2816 								inc_x_timer(Select_2_KEY,&zone_2_timer,&time_flash_count2,&timer2_1min_cnt);
12420  21ba ae0002        	ldw	x,#_timer2_1min_cnt
12421  21bd 89            	pushw	x
12422  21be ae004b        	ldw	x,#_time_flash_count2
12423  21c1 89            	pushw	x
12424  21c2 ae00af        	ldw	x,#_zone_2_timer
12425  21c5 89            	pushw	x
12426  21c6 a602          	ld	a,#2
12427  21c8 cd15bf        	call	_inc_x_timer
12429  21cb 5b06          	addw	sp,#6
12431  21cd 202c          	jra	L5074
12432  21cf               L3074:
12433                     ; 2820 								inc_x_key_level(zone2_step,&count_2_key,&zone_flash_count2,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer,&on2_bz);
12435  21cf ae0022        	ldw	x,#_on2_bz
12436  21d2 89            	pushw	x
12437  21d3 ae00ad        	ldw	x,#_zone_1_timer
12438  21d6 89            	pushw	x
12439  21d7 ae00af        	ldw	x,#_zone_2_timer
12440  21da 89            	pushw	x
12441  21db 4b02          	push	#2
12442  21dd ae0052        	ldw	x,#_boost_time_1
12443  21e0 89            	pushw	x
12444  21e1 be54          	ldw	x,_boost_time_2
12445  21e3 89            	pushw	x
12446  21e4 ae00a7        	ldw	x,#_zone_1_level
12447  21e7 89            	pushw	x
12448  21e8 ae00a8        	ldw	x,#_zone_2_level
12449  21eb 89            	pushw	x
12450  21ec ae003c        	ldw	x,#_zone_flash_count2
12451  21ef 89            	pushw	x
12452  21f0 ae0042        	ldw	x,#_count_2_key
12453  21f3 89            	pushw	x
12454  21f4 b646          	ld	a,_zone2_step
12455  21f6 cd154d        	call	_inc_x_key_level
12457  21f9 5b13          	addw	sp,#19
12458  21fb               L5074:
12459                     ; 2822 							speed_up();
12461  21fb cd149a        	call	_speed_up
12463  21fe               L1074:
12464                     ; 2824           	if(key_ok_bit == KEY_INC3)
12466  21fe b692          	ld	a,_key_ok_bit
12467  2200 a133          	cp	a,#51
12468  2202 264a          	jrne	L7074
12469                     ; 2826 							if(time_flash_count3 > zone_flash_count3)
12471  2204 b64c          	ld	a,_time_flash_count3
12472  2206 b13d          	cp	a,_zone_flash_count3
12473  2208 2315          	jrule	L1174
12474                     ; 2828 								inc_x_timer(Select_3_KEY,&zone_3_timer,&time_flash_count3,&timer3_1min_cnt);
12476  220a ae0004        	ldw	x,#_timer3_1min_cnt
12477  220d 89            	pushw	x
12478  220e ae004c        	ldw	x,#_time_flash_count3
12479  2211 89            	pushw	x
12480  2212 ae00b1        	ldw	x,#_zone_3_timer
12481  2215 89            	pushw	x
12482  2216 a604          	ld	a,#4
12483  2218 cd15bf        	call	_inc_x_timer
12485  221b 5b06          	addw	sp,#6
12487  221d 202c          	jra	L3174
12488  221f               L1174:
12489                     ; 2832 								inc_x_key_level(zone3_step,&count_3_key,&zone_flash_count3,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer,&on3_bz);
12491  221f ae0023        	ldw	x,#_on3_bz
12492  2222 89            	pushw	x
12493  2223 ae00b3        	ldw	x,#_zone_4_timer
12494  2226 89            	pushw	x
12495  2227 ae00b1        	ldw	x,#_zone_3_timer
12496  222a 89            	pushw	x
12497  222b 4b04          	push	#4
12498  222d ae0058        	ldw	x,#_boost_time_4
12499  2230 89            	pushw	x
12500  2231 be56          	ldw	x,_boost_time_3
12501  2233 89            	pushw	x
12502  2234 ae00aa        	ldw	x,#_zone_4_level
12503  2237 89            	pushw	x
12504  2238 ae00a9        	ldw	x,#_zone_3_level
12505  223b 89            	pushw	x
12506  223c ae003d        	ldw	x,#_zone_flash_count3
12507  223f 89            	pushw	x
12508  2240 ae0043        	ldw	x,#_count_3_key
12509  2243 89            	pushw	x
12510  2244 b647          	ld	a,_zone3_step
12511  2246 cd154d        	call	_inc_x_key_level
12513  2249 5b13          	addw	sp,#19
12514  224b               L3174:
12515                     ; 2834 							speed_up();
12517  224b cd149a        	call	_speed_up
12519  224e               L7074:
12520                     ; 2839         		if(key_ok_bit == KEY_TDEC1) {dec_x_timer(Select_1_KEY,&zone_1_timer,&time_flash_count1,&timer1_1min_cnt);speed_up();}
12522  224e b692          	ld	a,_key_ok_bit
12523  2250 a118          	cp	a,#24
12524  2252 2616          	jrne	L5174
12527  2254 ae0000        	ldw	x,#_timer1_1min_cnt
12528  2257 89            	pushw	x
12529  2258 ae004a        	ldw	x,#_time_flash_count1
12530  225b 89            	pushw	x
12531  225c ae00ad        	ldw	x,#_zone_1_timer
12532  225f 89            	pushw	x
12533  2260 a601          	ld	a,#1
12534  2262 cd16b0        	call	_dec_x_timer
12536  2265 5b06          	addw	sp,#6
12539  2267 cd149a        	call	_speed_up
12541  226a               L5174:
12542                     ; 2840         		if(key_ok_bit == KEY_TDEC2) {dec_x_timer(Select_2_KEY,&zone_2_timer,&time_flash_count2,&timer2_1min_cnt);speed_up();}
12544  226a b692          	ld	a,_key_ok_bit
12545  226c a128          	cp	a,#40
12546  226e 2616          	jrne	L7174
12549  2270 ae0002        	ldw	x,#_timer2_1min_cnt
12550  2273 89            	pushw	x
12551  2274 ae004b        	ldw	x,#_time_flash_count2
12552  2277 89            	pushw	x
12553  2278 ae00af        	ldw	x,#_zone_2_timer
12554  227b 89            	pushw	x
12555  227c a602          	ld	a,#2
12556  227e cd16b0        	call	_dec_x_timer
12558  2281 5b06          	addw	sp,#6
12561  2283 cd149a        	call	_speed_up
12563  2286               L7174:
12564                     ; 2841         		if(key_ok_bit == KEY_TDEC3) {dec_x_timer(Select_3_KEY,&zone_3_timer,&time_flash_count3,&timer3_1min_cnt);speed_up();}
12566  2286 b692          	ld	a,_key_ok_bit
12567  2288 a138          	cp	a,#56
12568  228a 2616          	jrne	L1274
12571  228c ae0004        	ldw	x,#_timer3_1min_cnt
12572  228f 89            	pushw	x
12573  2290 ae004c        	ldw	x,#_time_flash_count3
12574  2293 89            	pushw	x
12575  2294 ae00b1        	ldw	x,#_zone_3_timer
12576  2297 89            	pushw	x
12577  2298 a604          	ld	a,#4
12578  229a cd16b0        	call	_dec_x_timer
12580  229d 5b06          	addw	sp,#6
12583  229f cd149a        	call	_speed_up
12585  22a2               L1274:
12586                     ; 2844         		if(key_ok_bit == KEY_TINC1) {inc_x_timer(Select_1_KEY,&zone_1_timer,&time_flash_count1,&timer1_1min_cnt);speed_up();}	
12588  22a2 b692          	ld	a,_key_ok_bit
12589  22a4 a117          	cp	a,#23
12590  22a6 2616          	jrne	L3274
12593  22a8 ae0000        	ldw	x,#_timer1_1min_cnt
12594  22ab 89            	pushw	x
12595  22ac ae004a        	ldw	x,#_time_flash_count1
12596  22af 89            	pushw	x
12597  22b0 ae00ad        	ldw	x,#_zone_1_timer
12598  22b3 89            	pushw	x
12599  22b4 a601          	ld	a,#1
12600  22b6 cd15bf        	call	_inc_x_timer
12602  22b9 5b06          	addw	sp,#6
12605  22bb cd149a        	call	_speed_up
12607  22be               L3274:
12608                     ; 2845         		if(key_ok_bit == KEY_TINC2) {inc_x_timer(Select_2_KEY,&zone_2_timer,&time_flash_count2,&timer2_1min_cnt);speed_up();}
12610  22be b692          	ld	a,_key_ok_bit
12611  22c0 a127          	cp	a,#39
12612  22c2 2616          	jrne	L5274
12615  22c4 ae0002        	ldw	x,#_timer2_1min_cnt
12616  22c7 89            	pushw	x
12617  22c8 ae004b        	ldw	x,#_time_flash_count2
12618  22cb 89            	pushw	x
12619  22cc ae00af        	ldw	x,#_zone_2_timer
12620  22cf 89            	pushw	x
12621  22d0 a602          	ld	a,#2
12622  22d2 cd15bf        	call	_inc_x_timer
12624  22d5 5b06          	addw	sp,#6
12627  22d7 cd149a        	call	_speed_up
12629  22da               L5274:
12630                     ; 2846         		if(key_ok_bit == KEY_TINC3) {inc_x_timer(Select_3_KEY,&zone_3_timer,&time_flash_count3,&timer3_1min_cnt);speed_up();}
12632  22da b692          	ld	a,_key_ok_bit
12633  22dc a137          	cp	a,#55
12634  22de 2616          	jrne	L7274
12637  22e0 ae0004        	ldw	x,#_timer3_1min_cnt
12638  22e3 89            	pushw	x
12639  22e4 ae004c        	ldw	x,#_time_flash_count3
12640  22e7 89            	pushw	x
12641  22e8 ae00b1        	ldw	x,#_zone_3_timer
12642  22eb 89            	pushw	x
12643  22ec a604          	ld	a,#4
12644  22ee cd15bf        	call	_inc_x_timer
12646  22f1 5b06          	addw	sp,#6
12649  22f3 cd149a        	call	_speed_up
12651  22f6               L7274:
12652                     ; 2849           	if(key_ok_bit == KEY_DOUX1)  {key_buf = KEY_DOUX1;favor_x_save(1,zone_1_level,&zone_flash_count1);} 
12654  22f6 b692          	ld	a,_key_ok_bit
12655  22f8 a114          	cp	a,#20
12656  22fa 2612          	jrne	L1374
12659  22fc 35140000      	mov	_key_buf,#20
12662  2300 ae003b        	ldw	x,#_zone_flash_count1
12663  2303 89            	pushw	x
12664  2304 b6a7          	ld	a,_zone_1_level
12665  2306 97            	ld	xl,a
12666  2307 a601          	ld	a,#1
12667  2309 95            	ld	xh,a
12668  230a cd18c5        	call	_favor_x_save
12670  230d 85            	popw	x
12671  230e               L1374:
12672                     ; 2850           	if(key_ok_bit == KEY_DOUX2)  {key_buf = KEY_DOUX2;favor_x_save(2,zone_2_level,&zone_flash_count2);} 
12674  230e b692          	ld	a,_key_ok_bit
12675  2310 a124          	cp	a,#36
12676  2312 2612          	jrne	L3374
12679  2314 35240000      	mov	_key_buf,#36
12682  2318 ae003c        	ldw	x,#_zone_flash_count2
12683  231b 89            	pushw	x
12684  231c b6a8          	ld	a,_zone_2_level
12685  231e 97            	ld	xl,a
12686  231f a602          	ld	a,#2
12687  2321 95            	ld	xh,a
12688  2322 cd18c5        	call	_favor_x_save
12690  2325 85            	popw	x
12691  2326               L3374:
12692                     ; 2851           	if(key_ok_bit == KEY_DOUX3)  {key_buf = KEY_DOUX3;favor_x_save(3,zone_3_level,&zone_flash_count3);} 
12694  2326 b692          	ld	a,_key_ok_bit
12695  2328 a134          	cp	a,#52
12696  232a 2612          	jrne	L3754
12699  232c 35340000      	mov	_key_buf,#52
12702  2330 ae003d        	ldw	x,#_zone_flash_count3
12703  2333 89            	pushw	x
12704  2334 b6a9          	ld	a,_zone_3_level
12705  2336 97            	ld	xl,a
12706  2337 a603          	ld	a,#3
12707  2339 95            	ld	xh,a
12708  233a cd18c5        	call	_favor_x_save
12710  233d 85            	popw	x
12711  233e               L3754:
12712                     ; 2858         if(Ms10_bz5 == TRUE) 
12714  233e b615          	ld	a,_Ms10_bz5
12715  2340 a101          	cp	a,#1
12716  2342 2665          	jrne	L7374
12717                     ; 2860           	Ms10_bz5 =FALSE;
12719  2344 3f15          	clr	_Ms10_bz5
12720                     ; 2861           	if(cmd_relay_wait)  cmd_relay_wait--;    
12722  2346 3d3f          	tnz	_cmd_relay_wait
12723  2348 2702          	jreq	L1474
12726  234a 3a3f          	dec	_cmd_relay_wait
12727  234c               L1474:
12728                     ; 2862           	if(buzzer_cnt_200ms++ >= 20)//200ms
12730  234c c60009        	ld	a,_buzzer_cnt_200ms
12731  234f 725c0009      	inc	_buzzer_cnt_200ms
12732  2353 a114          	cp	a,#20
12733  2355 2512          	jrult	L3474
12734                     ; 2864 							if(buzzer_200ms_times) {buzzer_200ms_times--;buzzer_time =buz_120ms;}
12736  2357 725d0008      	tnz	_buzzer_200ms_times
12737  235b 2708          	jreq	L5474
12740  235d 725a0008      	dec	_buzzer_200ms_times
12743  2361 350c0027      	mov	_buzzer_time,#12
12744  2365               L5474:
12745                     ; 2865 							buzzer_cnt_200ms = 0;
12747  2365 725f0009      	clr	_buzzer_cnt_200ms
12748  2369               L3474:
12749                     ; 2867           	if(buzzer_cnt_2s++ >= 200)//2s
12751  2369 c6000b        	ld	a,_buzzer_cnt_2s
12752  236c 725c000b      	inc	_buzzer_cnt_2s
12753  2370 a1c8          	cp	a,#200
12754  2372 2512          	jrult	L7474
12755                     ; 2869 							if(buzzer_2s_times) {buzzer_2s_times--;buzzer_time =buz_1000ms;}
12757  2374 725d000a      	tnz	_buzzer_2s_times
12758  2378 2708          	jreq	L1574
12761  237a 725a000a      	dec	_buzzer_2s_times
12764  237e 35640027      	mov	_buzzer_time,#100
12765  2382               L1574:
12766                     ; 2870 							buzzer_cnt_2s = 0;
12768  2382 725f000b      	clr	_buzzer_cnt_2s
12769  2386               L7474:
12770                     ; 2872           	if(buzzer_cnt_5s++ >= 500)//5s
12772  2386 ce000d        	ldw	x,_buzzer_cnt_5s
12773  2389 1c0001        	addw	x,#1
12774  238c cf000d        	ldw	_buzzer_cnt_5s,x
12775  238f 1d0001        	subw	x,#1
12776  2392 a301f4        	cpw	x,#500
12777  2395 2512          	jrult	L7374
12778                     ; 2874 							if(buzzer_5s_times) {buzzer_5s_times--;buzzer_time =buz_500ms;}
12780  2397 725d000c      	tnz	_buzzer_5s_times
12781  239b 2708          	jreq	L5574
12784  239d 725a000c      	dec	_buzzer_5s_times
12787  23a1 35320027      	mov	_buzzer_time,#50
12788  23a5               L5574:
12789                     ; 2875 							buzzer_cnt_5s = 0;
12791  23a5 5f            	clrw	x
12792  23a6 cf000d        	ldw	_buzzer_cnt_5s,x
12793  23a9               L7374:
12794                     ; 2897 		  if(Ms10_bz6 == TRUE)
12796  23a9 b616          	ld	a,_Ms10_bz6
12797  23ab a101          	cp	a,#1
12798  23ad 264e          	jrne	L7574
12799                     ; 2899 		     Ms10_bz6 =FALSE;
12801  23af 3f16          	clr	_Ms10_bz6
12802                     ; 2901 		     if(Power_on_bz == TRUE)   
12804  23b1 b620          	ld	a,_Power_on_bz
12805  23b3 a101          	cp	a,#1
12806  23b5 2616          	jrne	L1674
12807                     ; 2903 				    if((cmd_relay_wait ==0) && (relay_delay_bz ==FALSE)) 
12809  23b7 3d3f          	tnz	_cmd_relay_wait
12810  23b9 2642          	jrne	L7574
12812  23bb 3d10          	tnz	_relay_delay_bz
12813  23bd 263e          	jrne	L7574
12814                     ; 2905 				     	RELAY_ON;
12816  23bf 721a500f      	bset	20495,#5
12817                     ; 2906 				     	relay_delay_bz =TRUE;
12819  23c3 35010010      	mov	_relay_delay_bz,#1
12820                     ; 2907 				    	cmd_relay_wait =200;
12822  23c7 35c8003f      	mov	_cmd_relay_wait,#200
12823  23cb 2030          	jra	L7574
12824  23cd               L1674:
12825                     ; 2912 			    	if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min) 	RELAY_ON;
12827  23cd b64e          	ld	a,_flash_H_1_min
12828  23cf 5f            	clrw	x
12829  23d0 bb4f          	add	a,_flash_H_2_min
12830  23d2 2401          	jrnc	L262
12831  23d4 5c            	incw	x
12832  23d5               L262:
12833  23d5 bb50          	add	a,_flash_H_3_min
12834  23d7 2401          	jrnc	L462
12835  23d9 5c            	incw	x
12836  23da               L462:
12837  23da bb51          	add	a,_flash_H_4_min
12838  23dc 2401          	jrnc	L662
12839  23de 5c            	incw	x
12840  23df               L662:
12841  23df 02            	rlwa	x,a
12842  23e0 5d            	tnzw	x
12843  23e1 2706          	jreq	L7674
12846  23e3 721a500f      	bset	20495,#5
12848  23e7 2014          	jra	L7574
12849  23e9               L7674:
12850                     ; 2913 			    	else if((cmd_relay_wait ==0)&& (relay_delay_bz ==TRUE))
12852  23e9 3d3f          	tnz	_cmd_relay_wait
12853  23eb 2610          	jrne	L7574
12855  23ed b610          	ld	a,_relay_delay_bz
12856  23ef a101          	cp	a,#1
12857  23f1 260a          	jrne	L7574
12858                     ; 2915 				     	RELAY_OFF;
12860  23f3 721b500f      	bres	20495,#5
12861                     ; 2916 				    	relay_delay_bz =FALSE;					
12863  23f7 3f10          	clr	_relay_delay_bz
12864                     ; 2917 				    	cmd_relay_wait =200;					
12866  23f9 35c8003f      	mov	_cmd_relay_wait,#200
12867  23fd               L7574:
12868                     ; 2924 			if(Ms10_bz7 == TRUE)
12870  23fd b617          	ld	a,_Ms10_bz7
12871  23ff a101          	cp	a,#1
12872  2401 2703          	jreq	L653
12873  2403 cc252d        	jp	L5774
12874  2406               L653:
12875                     ; 2926 				  Ms10_bz7 =FALSE; 
12877  2406 3f17          	clr	_Ms10_bz7
12878                     ; 2928 		    	if((relay_delay_bz ==TRUE) && (cmd_relay_wait ==0)) 	list_counter++;	//communication list begin
12880  2408 b610          	ld	a,_relay_delay_bz
12881  240a a101          	cp	a,#1
12882  240c 260d          	jrne	L7774
12884  240e 3d3f          	tnz	_cmd_relay_wait
12885  2410 2609          	jrne	L7774
12888  2412 1e11          	ldw	x,(OFST-8,sp)
12889  2414 1c0001        	addw	x,#1
12890  2417 1f11          	ldw	(OFST-8,sp),x
12892  2419 2005          	jra	L1005
12893  241b               L7774:
12894                     ; 2931 				   	list_counter =0;
12896  241b 5f            	clrw	x
12897  241c 1f11          	ldw	(OFST-8,sp),x
12898                     ; 2932 				   	Comm_step =0;
12900  241e 3f72          	clr	_Comm_step
12901  2420               L1005:
12902                     ; 2934 				  if(list_counter == 1) 							//1~18
12904  2420 1e11          	ldw	x,(OFST-8,sp)
12905  2422 a30001        	cpw	x,#1
12906  2425 264e          	jrne	L3005
12907                     ; 2936 				    	Comm_step =comm_1_s;
12909  2427 35100072      	mov	_Comm_step,#16
12910                     ; 2937 				    	if(Pause_bz ==0) 
12912  242b 3ddd          	tnz	_Pause_bz
12913  242d 2631          	jrne	L5005
12914                     ; 2939 		            if(Warm_status &Select_1_KEY)  temp_8 =Warm_function_deal(tmain_1,Warm_1_timer);
12916  242f c60013        	ld	a,_Warm_status
12917  2432 a501          	bcp	a,#1
12918  2434 270e          	jreq	L7005
12921  2436 c60014        	ld	a,_Warm_1_timer
12922  2439 97            	ld	xl,a
12923  243a b6c8          	ld	a,_tmain_1
12924  243c 95            	ld	xh,a
12925  243d cd1746        	call	_Warm_function_deal
12927  2440 6b19          	ld	(OFST+0,sp),a
12929  2442 2004          	jra	L1105
12930  2444               L7005:
12931                     ; 2940 								else temp_8 =zone_1_level;														
12933  2444 b6a7          	ld	a,_zone_1_level
12934  2446 6b19          	ld	(OFST+0,sp),a
12935  2448               L1105:
12936                     ; 2941 								comm_deal(0,Add_1,temp_8,time_level_1,auto_limit_pow_1,Err_1_data);  
12938  2448 3b0083        	push	_Err_1_data
12939  244b 3b0062        	push	_auto_limit_pow_1
12940  244e 3b00d0        	push	_time_level_1
12941  2451 7b1c          	ld	a,(OFST+3,sp)
12942  2453 88            	push	a
12943  2454 ae0020        	ldw	x,#32
12944  2457 4f            	clr	a
12945  2458 95            	ld	xh,a
12946  2459 cd0416        	call	_comm_deal
12948  245c 5b04          	addw	sp,#4
12950  245e 2015          	jra	L3005
12951  2460               L5005:
12952                     ; 2943 							else    	comm_deal(0,Add_1,     0,time_level_1,auto_limit_pow_1,Err_1_data); 				
12954  2460 3b0083        	push	_Err_1_data
12955  2463 3b0062        	push	_auto_limit_pow_1
12956  2466 3b00d0        	push	_time_level_1
12957  2469 4b00          	push	#0
12958  246b ae0020        	ldw	x,#32
12959  246e 4f            	clr	a
12960  246f 95            	ld	xh,a
12961  2470 cd0416        	call	_comm_deal
12963  2473 5b04          	addw	sp,#4
12964  2475               L3005:
12965                     ; 2945 				  if(list_counter ==19)   						//19~36
12967  2475 1e11          	ldw	x,(OFST-8,sp)
12968  2477 a30013        	cpw	x,#19
12969  247a 2650          	jrne	L5105
12970                     ; 2947 				  	Comm_step =comm_2_s;
12972  247c 35200072      	mov	_Comm_step,#32
12973                     ; 2948 				  	if(Pause_bz ==0) 
12975  2480 3ddd          	tnz	_Pause_bz
12976  2482 2632          	jrne	L7105
12977                     ; 2950 				    	if(Warm_status &Select_2_KEY)  temp_8 =Warm_function_deal(tmain_2,Warm_2_timer);
12979  2484 c60013        	ld	a,_Warm_status
12980  2487 a502          	bcp	a,#2
12981  2489 270e          	jreq	L1205
12984  248b c60015        	ld	a,_Warm_2_timer
12985  248e 97            	ld	xl,a
12986  248f b6c9          	ld	a,_tmain_2
12987  2491 95            	ld	xh,a
12988  2492 cd1746        	call	_Warm_function_deal
12990  2495 6b19          	ld	(OFST+0,sp),a
12992  2497 2004          	jra	L3205
12993  2499               L1205:
12994                     ; 2951 							else temp_8 =zone_2_level;					
12996  2499 b6a8          	ld	a,_zone_2_level
12997  249b 6b19          	ld	(OFST+0,sp),a
12998  249d               L3205:
12999                     ; 2952 							comm_deal(1,Add_2,temp_8,time_level_2,auto_limit_pow_2,Err_2_data);  
13001  249d 3b0084        	push	_Err_2_data
13002  24a0 3b0063        	push	_auto_limit_pow_2
13003  24a3 3b00d1        	push	_time_level_2
13004  24a6 7b1c          	ld	a,(OFST+3,sp)
13005  24a8 88            	push	a
13006  24a9 ae0040        	ldw	x,#64
13007  24ac a601          	ld	a,#1
13008  24ae 95            	ld	xh,a
13009  24af cd0416        	call	_comm_deal
13011  24b2 5b04          	addw	sp,#4
13013  24b4 2016          	jra	L5105
13014  24b6               L7105:
13015                     ; 2954 						else        comm_deal(1,Add_2,     0,time_level_2,auto_limit_pow_2,Err_2_data); 		 				
13017  24b6 3b0084        	push	_Err_2_data
13018  24b9 3b0063        	push	_auto_limit_pow_2
13019  24bc 3b00d1        	push	_time_level_2
13020  24bf 4b00          	push	#0
13021  24c1 ae0040        	ldw	x,#64
13022  24c4 a601          	ld	a,#1
13023  24c6 95            	ld	xh,a
13024  24c7 cd0416        	call	_comm_deal
13026  24ca 5b04          	addw	sp,#4
13027  24cc               L5105:
13028                     ; 2956 			    if(list_counter ==37)							//37~54
13030  24cc 1e11          	ldw	x,(OFST-8,sp)
13031  24ce a30025        	cpw	x,#37
13032  24d1 2650          	jrne	L7205
13033                     ; 2958 						Comm_step =comm_3_s;
13035  24d3 35300072      	mov	_Comm_step,#48
13036                     ; 2959 				    if(Pause_bz ==0) 
13038  24d7 3ddd          	tnz	_Pause_bz
13039  24d9 2632          	jrne	L1305
13040                     ; 2961 				     	if(Warm_status &Select_3_KEY)  temp_8 =Warm_function_deal(tmain_3,Warm_3_timer);
13042  24db c60013        	ld	a,_Warm_status
13043  24de a504          	bcp	a,#4
13044  24e0 270e          	jreq	L3305
13047  24e2 c60016        	ld	a,_Warm_3_timer
13048  24e5 97            	ld	xl,a
13049  24e6 b6ca          	ld	a,_tmain_3
13050  24e8 95            	ld	xh,a
13051  24e9 cd1746        	call	_Warm_function_deal
13053  24ec 6b19          	ld	(OFST+0,sp),a
13055  24ee 2004          	jra	L5305
13056  24f0               L3305:
13057                     ; 2962 							else temp_8 =zone_3_level;	
13059  24f0 b6a9          	ld	a,_zone_3_level
13060  24f2 6b19          	ld	(OFST+0,sp),a
13061  24f4               L5305:
13062                     ; 2963 							comm_deal(2,Add_3,temp_8,time_level_3,auto_limit_pow_3,Err_3_data);    
13064  24f4 3b0085        	push	_Err_3_data
13065  24f7 3b0064        	push	_auto_limit_pow_3
13066  24fa 3b00d2        	push	_time_level_3
13067  24fd 7b1c          	ld	a,(OFST+3,sp)
13068  24ff 88            	push	a
13069  2500 ae0060        	ldw	x,#96
13070  2503 a602          	ld	a,#2
13071  2505 95            	ld	xh,a
13072  2506 cd0416        	call	_comm_deal
13074  2509 5b04          	addw	sp,#4
13076  250b 2016          	jra	L7205
13077  250d               L1305:
13078                     ; 2965 						else    	comm_deal(2,Add_3,     0,time_level_3,auto_limit_pow_3,Err_3_data);  				
13080  250d 3b0085        	push	_Err_3_data
13081  2510 3b0064        	push	_auto_limit_pow_3
13082  2513 3b00d2        	push	_time_level_3
13083  2516 4b00          	push	#0
13084  2518 ae0060        	ldw	x,#96
13085  251b a602          	ld	a,#2
13086  251d 95            	ld	xh,a
13087  251e cd0416        	call	_comm_deal
13089  2521 5b04          	addw	sp,#4
13090  2523               L7205:
13091                     ; 2978 		    	if(list_counter >=73)				//0.73s one cycle
13093  2523 1e11          	ldw	x,(OFST-8,sp)
13094  2525 a30049        	cpw	x,#73
13095  2528 2503          	jrult	L5774
13096                     ; 2980 				   	list_counter=0;
13098  252a 5f            	clrw	x
13099  252b 1f11          	ldw	(OFST-8,sp),x
13100  252d               L5774:
13101                     ; 2997 	if(Prepare_data_bz ==TRUE)
13103  252d b61f          	ld	a,_Prepare_data_bz
13104  252f a101          	cp	a,#1
13105  2531 2703          	jreq	L063
13106  2533 cc2713        	jp	L3405
13107  2536               L063:
13108                     ; 2999 	   Prepare_data_bz =FALSE;
13110  2536 3f1f          	clr	_Prepare_data_bz
13111                     ; 3001 	   if(lock_bz) lock_flash_accout++;	
13113  2538 3d25          	tnz	_lock_bz
13114  253a 2704          	jreq	L5405
13117  253c 3c26          	inc	_lock_flash_accout
13119  253e 2002          	jra	L7405
13120  2540               L5405:
13121                     ; 3002 	   else lock_flash_accout =0;   
13123  2540 3f26          	clr	_lock_flash_accout
13124  2542               L7405:
13125                     ; 3003 	   if(lock_flash_accout ==8)  lock_flash_accout =1;
13127  2542 b626          	ld	a,_lock_flash_accout
13128  2544 a108          	cp	a,#8
13129  2546 2604          	jrne	L1505
13132  2548 35010026      	mov	_lock_flash_accout,#1
13133  254c               L1505:
13134                     ; 3005 	   if(Time_dot_bz ==TRUE) Time_dot_bz =FALSE;
13136  254c b61c          	ld	a,_Time_dot_bz
13137  254e a101          	cp	a,#1
13138  2550 2604          	jrne	L3505
13141  2552 3f1c          	clr	_Time_dot_bz
13143  2554 2004          	jra	L5505
13144  2556               L3505:
13145                     ; 3006 	   else Time_dot_bz =TRUE;
13147  2556 3501001c      	mov	_Time_dot_bz,#1
13148  255a               L5505:
13149                     ; 3009             if(Power_on_bz ==FALSE)  				  //off status
13151  255a 3d20          	tnz	_Power_on_bz
13152  255c 2703          	jreq	L263
13153  255e cc25f6        	jp	L7505
13154  2561               L263:
13155                     ; 3011 							for(i=0;i<16;i++)   Disp_buf[i] =CHR_BLANK;  	//all blank
13157  2561 0f19          	clr	(OFST+0,sp)
13158  2563               L1605:
13161  2563 7b19          	ld	a,(OFST+0,sp)
13162  2565 5f            	clrw	x
13163  2566 97            	ld	xl,a
13164  2567 6f29          	clr	(_Disp_buf,x)
13167  2569 0c19          	inc	(OFST+0,sp)
13170  256b 7b19          	ld	a,(OFST+0,sp)
13171  256d a110          	cp	a,#16
13172  256f 25f2          	jrult	L1605
13173                     ; 3012 							blockDisplay();
13175  2571 cd1a21        	call	_blockDisplay
13177                     ; 3013 							if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min)
13179  2574 b64e          	ld	a,_flash_H_1_min
13180  2576 5f            	clrw	x
13181  2577 bb4f          	add	a,_flash_H_2_min
13182  2579 2401          	jrnc	L072
13183  257b 5c            	incw	x
13184  257c               L072:
13185  257c bb50          	add	a,_flash_H_3_min
13186  257e 2401          	jrnc	L272
13187  2580 5c            	incw	x
13188  2581               L272:
13189  2581 bb51          	add	a,_flash_H_4_min
13190  2583 2401          	jrnc	L472
13191  2585 5c            	incw	x
13192  2586               L472:
13193  2586 02            	rlwa	x,a
13194  2587 5d            	tnzw	x
13195  2588 2738          	jreq	L7605
13196                     ; 3015 								for(i=0;i<16;i++)   Disp_buf[i] =CHR_BLANK;  	//all blank
13198  258a 0f19          	clr	(OFST+0,sp)
13199  258c               L1705:
13202  258c 7b19          	ld	a,(OFST+0,sp)
13203  258e 5f            	clrw	x
13204  258f 97            	ld	xl,a
13205  2590 6f29          	clr	(_Disp_buf,x)
13208  2592 0c19          	inc	(OFST+0,sp)
13211  2594 7b19          	ld	a,(OFST+0,sp)
13212  2596 a110          	cp	a,#16
13213  2598 25f2          	jrult	L1705
13214                     ; 3016 								if(Time_dot_bz ==TRUE)
13216  259a b61c          	ld	a,_Time_dot_bz
13217  259c a101          	cp	a,#1
13218  259e 2703          	jreq	L463
13219  25a0 cc2713        	jp	L3405
13220  25a3               L463:
13221                     ; 3018 									if(flash_H_1_min) Disp_buf[Zone1Gear_H] = CHR_H;  //flash "H"
13223  25a3 3d4e          	tnz	_flash_H_1_min
13224  25a5 2704          	jreq	L1015
13227  25a7 35b30036      	mov	_Disp_buf+13,#179
13228  25ab               L1015:
13229                     ; 3019 									if(flash_H_2_min) Disp_buf[Zone2Gear_H] = CHR_H;  //flash "H"
13231  25ab 3d4f          	tnz	_flash_H_2_min
13232  25ad 2704          	jreq	L3015
13235  25af 35b30038      	mov	_Disp_buf+15,#179
13236  25b3               L3015:
13237                     ; 3020 									if(flash_H_3_min) Disp_buf[Zone3Gear_H] = CHR_H;	//flash "H"
13239  25b3 3d50          	tnz	_flash_H_3_min
13240  25b5 2603          	jrne	L663
13241  25b7 cc2713        	jp	L3405
13242  25ba               L663:
13245  25ba 35b30030      	mov	_Disp_buf+7,#179
13246  25be ac132713      	jpf	L3405
13247  25c2               L7605:
13248                     ; 3024 							else if(version_dis_cnt)
13250  25c2 725d000f      	tnz	_version_dis_cnt
13251  25c6 2603          	jrne	L073
13252  25c8 cc2713        	jp	L3405
13253  25cb               L073:
13254                     ; 3026 								for(i=0;i<16;i++)   Disp_buf[i] =CHR_BLANK;  	//all blank
13256  25cb 0f19          	clr	(OFST+0,sp)
13257  25cd               L3115:
13260  25cd 7b19          	ld	a,(OFST+0,sp)
13261  25cf 5f            	clrw	x
13262  25d0 97            	ld	xl,a
13263  25d1 6f29          	clr	(_Disp_buf,x)
13266  25d3 0c19          	inc	(OFST+0,sp)
13269  25d5 7b19          	ld	a,(OFST+0,sp)
13270  25d7 a110          	cp	a,#16
13271  25d9 25f2          	jrult	L3115
13272                     ; 3027 								Disp_buf[Zone2Gear_H] = CHR_S;
13274  25db 35d90038      	mov	_Disp_buf+15,#217
13275                     ; 3028 								Disp_buf[Zone2Gear_L] = CHR_O;
13277  25df 351b0037      	mov	_Disp_buf+14,#27
13278                     ; 3029 								Disp_buf[Zone2Timer_H] = Display_decode(SW_VERSION/10)|CHR_DOT;
13280  25e3 4f            	clr	a
13281  25e4 cd08e3        	call	_Display_decode
13283  25e7 aa04          	or	a,#4
13284  25e9 b72b          	ld	_Disp_buf+2,a
13285                     ; 3030 								Disp_buf[Zone2Timer_L] = Display_decode(SW_VERSION%10);
13287  25eb a601          	ld	a,#1
13288  25ed cd08e3        	call	_Display_decode
13290  25f0 b72a          	ld	_Disp_buf+1,a
13291  25f2 ac132713      	jpf	L3405
13292  25f6               L7505:
13293                     ; 3036      	 		        temp_16 =disp_timer_x(Select_1_KEY,time_flash_count1,zone_1_timer,lock_flash_accout);
13295  25f6 3b0026        	push	_lock_flash_accout
13296  25f9 bead          	ldw	x,_zone_1_timer
13297  25fb 89            	pushw	x
13298  25fc b64a          	ld	a,_time_flash_count1
13299  25fe 97            	ld	xl,a
13300  25ff a601          	ld	a,#1
13301  2601 95            	ld	xh,a
13302  2602 cd19d2        	call	_disp_timer_x
13304  2605 5b03          	addw	sp,#3
13305  2607 1f17          	ldw	(OFST-2,sp),x
13306                     ; 3037      	 	        	Disp_buf[Zone1Timer_H] =temp_16>>8;
13308  2609 7b17          	ld	a,(OFST-2,sp)
13309  260b b729          	ld	_Disp_buf,a
13310                     ; 3038                		Disp_buf[Zone1Timer_L] =temp_16&0x00FF;
13312  260d 7b18          	ld	a,(OFST-1,sp)
13313  260f a4ff          	and	a,#255
13314  2611 b72c          	ld	_Disp_buf+3,a
13315                     ; 3039      	 		        temp_16 =disp_timer_x(Select_2_KEY,time_flash_count2,zone_2_timer,lock_flash_accout);
13317  2613 3b0026        	push	_lock_flash_accout
13318  2616 beaf          	ldw	x,_zone_2_timer
13319  2618 89            	pushw	x
13320  2619 b64b          	ld	a,_time_flash_count2
13321  261b 97            	ld	xl,a
13322  261c a602          	ld	a,#2
13323  261e 95            	ld	xh,a
13324  261f cd19d2        	call	_disp_timer_x
13326  2622 5b03          	addw	sp,#3
13327  2624 1f17          	ldw	(OFST-2,sp),x
13328                     ; 3040      	 	        	Disp_buf[Zone2Timer_H] =temp_16>>8;
13330  2626 7b17          	ld	a,(OFST-2,sp)
13331  2628 b72b          	ld	_Disp_buf+2,a
13332                     ; 3041                		Disp_buf[Zone2Timer_L] =temp_16&0x00FF;
13334  262a 7b18          	ld	a,(OFST-1,sp)
13335  262c a4ff          	and	a,#255
13336  262e b72a          	ld	_Disp_buf+1,a
13337                     ; 3042      	        		temp_16 =disp_timer_x(Select_3_KEY,time_flash_count3,zone_3_timer,lock_flash_accout);
13339  2630 3b0026        	push	_lock_flash_accout
13340  2633 beb1          	ldw	x,_zone_3_timer
13341  2635 89            	pushw	x
13342  2636 b64c          	ld	a,_time_flash_count3
13343  2638 97            	ld	xl,a
13344  2639 a604          	ld	a,#4
13345  263b 95            	ld	xh,a
13346  263c cd19d2        	call	_disp_timer_x
13348  263f 5b03          	addw	sp,#3
13349  2641 1f17          	ldw	(OFST-2,sp),x
13350                     ; 3043      	        		Disp_buf[Zone3Timer_H] =temp_16>>8;
13352  2643 7b17          	ld	a,(OFST-2,sp)
13353  2645 b734          	ld	_Disp_buf+11,a
13354                     ; 3044                		Disp_buf[Zone3Timer_L] =temp_16&0x00FF;
13356  2647 7b18          	ld	a,(OFST-1,sp)
13357  2649 a4ff          	and	a,#255
13358  264b b731          	ld	_Disp_buf+8,a
13359                     ; 3049 									temp_16=ON_disp_zone_x(on1_bz,(Warm_status &Select_1_KEY),0,zone_flash_count1,zone_1_timer,zone_1_level,&change_count,flex_L_bz,Select_1_KEY,flash_H_1_min,zone_1_nopan_time,zone_2_nopan_time,Err_1_data,&zone_1_nopan_flg,zone_1_timeout_cnt);	 //zone1 normal display
13361  264d 3b0028        	push	_zone_1_timeout_cnt
13362  2650 ae002c        	ldw	x,#_zone_1_nopan_flg
13363  2653 89            	pushw	x
13364  2654 3b0083        	push	_Err_1_data
13365  2657 3b0078        	push	_zone_2_nopan_time
13366  265a 3b0077        	push	_zone_1_nopan_time
13367  265d 3b004e        	push	_flash_H_1_min
13368  2660 4b01          	push	#1
13369  2662 3b0066        	push	_flex_L_bz
13370  2665 ae0040        	ldw	x,#_change_count
13371  2668 89            	pushw	x
13372  2669 3b00a7        	push	_zone_1_level
13373  266c 3b00ae        	push	_zone_1_timer+1
13374  266f 3b003b        	push	_zone_flash_count1
13375  2672 4b00          	push	#0
13376  2674 c60013        	ld	a,_Warm_status
13377  2677 a401          	and	a,#1
13378  2679 97            	ld	xl,a
13379  267a b621          	ld	a,_on1_bz
13380  267c 95            	ld	xh,a
13381  267d cd0956        	call	_ON_disp_zone_x
13383  2680 5b0f          	addw	sp,#15
13384  2682 1f17          	ldw	(OFST-2,sp),x
13385                     ; 3050                		Disp_buf[Zone1Gear_H] =temp_16>>8;
13387  2684 7b17          	ld	a,(OFST-2,sp)
13388  2686 b736          	ld	_Disp_buf+13,a
13389                     ; 3051                		Disp_buf[Zone1Gear_L] =temp_16&0x00FF;
13391  2688 7b18          	ld	a,(OFST-1,sp)
13392  268a a4ff          	and	a,#255
13393  268c b735          	ld	_Disp_buf+12,a
13394                     ; 3053 									temp_16=ON_disp_zone_x(on2_bz,(Warm_status &Select_2_KEY),1,zone_flash_count2,zone_2_timer,zone_2_level,&change_count,flex_L_bz,Select_2_KEY,flash_H_2_min,zone_2_nopan_time,zone_1_nopan_time,Err_2_data,&zone_2_nopan_flg,zone_2_timeout_cnt);	 //zone2 normal display               	
13396  268e 3b0029        	push	_zone_2_timeout_cnt
13397  2691 ae002d        	ldw	x,#_zone_2_nopan_flg
13398  2694 89            	pushw	x
13399  2695 3b0084        	push	_Err_2_data
13400  2698 3b0077        	push	_zone_1_nopan_time
13401  269b 3b0078        	push	_zone_2_nopan_time
13402  269e 3b004f        	push	_flash_H_2_min
13403  26a1 4b02          	push	#2
13404  26a3 3b0066        	push	_flex_L_bz
13405  26a6 ae0040        	ldw	x,#_change_count
13406  26a9 89            	pushw	x
13407  26aa 3b00a8        	push	_zone_2_level
13408  26ad 3b00b0        	push	_zone_2_timer+1
13409  26b0 3b003c        	push	_zone_flash_count2
13410  26b3 4b01          	push	#1
13411  26b5 c60013        	ld	a,_Warm_status
13412  26b8 a402          	and	a,#2
13413  26ba 97            	ld	xl,a
13414  26bb b622          	ld	a,_on2_bz
13415  26bd 95            	ld	xh,a
13416  26be cd0956        	call	_ON_disp_zone_x
13418  26c1 5b0f          	addw	sp,#15
13419  26c3 1f17          	ldw	(OFST-2,sp),x
13420                     ; 3054                		Disp_buf[Zone2Gear_H] =temp_16>>8;
13422  26c5 7b17          	ld	a,(OFST-2,sp)
13423  26c7 b738          	ld	_Disp_buf+15,a
13424                     ; 3055               	 	Disp_buf[Zone2Gear_L] =temp_16&0x00FF;
13426  26c9 7b18          	ld	a,(OFST-1,sp)
13427  26cb a4ff          	and	a,#255
13428  26cd b737          	ld	_Disp_buf+14,a
13429                     ; 3057                		temp_16=ON_disp_zone_x(on3_bz,(Warm_status &Select_3_KEY),2,zone_flash_count3,zone_3_timer,zone_3_level,&change_count,flex_R_bz,Select_3_KEY,flash_H_3_min,zone_3_nopan_time,zone_4_nopan_time,Err_3_data,&zone_3_nopan_flg,zone_3_timeout_cnt);	 //zone3 normal display               		
13431  26cf 3b002a        	push	_zone_3_timeout_cnt
13432  26d2 ae002e        	ldw	x,#_zone_3_nopan_flg
13433  26d5 89            	pushw	x
13434  26d6 3b0085        	push	_Err_3_data
13435  26d9 3b007a        	push	_zone_4_nopan_time
13436  26dc 3b0079        	push	_zone_3_nopan_time
13437  26df 3b0050        	push	_flash_H_3_min
13438  26e2 4b04          	push	#4
13439  26e4 3b0067        	push	_flex_R_bz
13440  26e7 ae0040        	ldw	x,#_change_count
13441  26ea 89            	pushw	x
13442  26eb 3b00a9        	push	_zone_3_level
13443  26ee 3b00b2        	push	_zone_3_timer+1
13444  26f1 3b003d        	push	_zone_flash_count3
13445  26f4 4b02          	push	#2
13446  26f6 c60013        	ld	a,_Warm_status
13447  26f9 a404          	and	a,#4
13448  26fb 97            	ld	xl,a
13449  26fc b623          	ld	a,_on3_bz
13450  26fe 95            	ld	xh,a
13451  26ff cd0956        	call	_ON_disp_zone_x
13453  2702 5b0f          	addw	sp,#15
13454  2704 1f17          	ldw	(OFST-2,sp),x
13455                     ; 3058 									Disp_buf[Zone3Gear_H] =temp_16>>8;
13457  2706 7b17          	ld	a,(OFST-2,sp)
13458  2708 b730          	ld	_Disp_buf+7,a
13459                     ; 3059 									Disp_buf[Zone3Gear_L] =temp_16&0x00FF;
13461  270a 7b18          	ld	a,(OFST-1,sp)
13462  270c a4ff          	and	a,#255
13463  270e b72f          	ld	_Disp_buf+6,a
13464                     ; 3060                		blockDisplay();
13466  2710 cd1a21        	call	_blockDisplay
13468  2713               L3405:
13469                     ; 3149 	if(Flash_500ms_bz == TRUE)
13471  2713 b618          	ld	a,_Flash_500ms_bz
13472  2715 a101          	cp	a,#1
13473  2717 2703          	jreq	L273
13474  2719 cc28a3        	jp	L3215
13475  271c               L273:
13476                     ; 3151 					Flash_500ms_bz =FALSE;				
13478  271c 3f18          	clr	_Flash_500ms_bz
13479                     ; 3153 					IIC1_initial();
13481  271e cd0000        	call	_IIC1_initial
13483                     ; 3154 					Start1();
13485  2721 cd0000        	call	_Start1
13487                     ; 3155 					TX1_Byte(0x60);  	//address: 011 b4b3b2b1 0  || 0x00H
13489  2724 a660          	ld	a,#96
13490  2726 cd0000        	call	_TX1_Byte
13492                     ; 3156 					ReceiveAck1();
13494  2729 cd0000        	call	_ReceiveAck1
13496                     ; 3157 					for(i=0;i<16;i++)  		
13498  272c 0f19          	clr	(OFST+0,sp)
13499  272e               L5215:
13500                     ; 3159 						TX1_Byte(Disp_buf[i]);
13502  272e 7b19          	ld	a,(OFST+0,sp)
13503  2730 5f            	clrw	x
13504  2731 97            	ld	xl,a
13505  2732 e629          	ld	a,(_Disp_buf,x)
13506  2734 cd0000        	call	_TX1_Byte
13508                     ; 3160 						ReceiveAck1();
13510  2737 cd0000        	call	_ReceiveAck1
13512                     ; 3157 					for(i=0;i<16;i++)  		
13514  273a 0c19          	inc	(OFST+0,sp)
13517  273c 7b19          	ld	a,(OFST+0,sp)
13518  273e a110          	cp	a,#16
13519  2740 25ec          	jrult	L5215
13520                     ; 3162 					Stop1();
13522  2742 cd0000        	call	_Stop1
13524                     ; 3163 					Start1();
13526  2745 cd0000        	call	_Start1
13528                     ; 3164 					TX1_Byte(0x48);		//command1
13530  2748 a648          	ld	a,#72
13531  274a cd0000        	call	_TX1_Byte
13533                     ; 3165 					ReceiveAck1();
13535  274d cd0000        	call	_ReceiveAck1
13537                     ; 3166    	     	TX1_Byte(0x09);		//command2
13539  2750 a609          	ld	a,#9
13540  2752 cd0000        	call	_TX1_Byte
13542                     ; 3167    	    	ReceiveAck1();
13544  2755 cd0000        	call	_ReceiveAck1
13546                     ; 3168    	      Stop1();
13548  2758 cd0000        	call	_Stop1
13550                     ; 3171 					if(zone_flash_count1)     zone_flash_count1--;
13552  275b 3d3b          	tnz	_zone_flash_count1
13553  275d 2702          	jreq	L3315
13556  275f 3a3b          	dec	_zone_flash_count1
13557  2761               L3315:
13558                     ; 3172 	        if(zone_flash_count1 ==0) count_1_key =0;
13560  2761 3d3b          	tnz	_zone_flash_count1
13561  2763 2602          	jrne	L5315
13564  2765 3f41          	clr	_count_1_key
13565  2767               L5315:
13566                     ; 3173 	        if(zone_flash_count2)     zone_flash_count2--;
13568  2767 3d3c          	tnz	_zone_flash_count2
13569  2769 2702          	jreq	L7315
13572  276b 3a3c          	dec	_zone_flash_count2
13573  276d               L7315:
13574                     ; 3174 	        if(zone_flash_count2 ==0) count_2_key =0;
13576  276d 3d3c          	tnz	_zone_flash_count2
13577  276f 2602          	jrne	L1415
13580  2771 3f42          	clr	_count_2_key
13581  2773               L1415:
13582                     ; 3175 	        if(zone_flash_count3)     zone_flash_count3--;
13584  2773 3d3d          	tnz	_zone_flash_count3
13585  2775 2702          	jreq	L3415
13588  2777 3a3d          	dec	_zone_flash_count3
13589  2779               L3415:
13590                     ; 3176 	        if(zone_flash_count3 ==0) count_3_key =0;
13592  2779 3d3d          	tnz	_zone_flash_count3
13593  277b 2602          	jrne	L5415
13596  277d 3f43          	clr	_count_3_key
13597  277f               L5415:
13598                     ; 3177 	        if(zone_flash_count4)     zone_flash_count4--;
13600  277f 3d3e          	tnz	_zone_flash_count4
13601  2781 2702          	jreq	L7415
13604  2783 3a3e          	dec	_zone_flash_count4
13605  2785               L7415:
13606                     ; 3178 	        if(zone_flash_count4 ==0) count_4_key =0;
13608  2785 3d3e          	tnz	_zone_flash_count4
13609  2787 2602          	jrne	L1515
13612  2789 3f44          	clr	_count_4_key
13613  278b               L1515:
13614                     ; 3180 					if(time_flash_count1)  time_flash_count1--; 
13616  278b 3d4a          	tnz	_time_flash_count1
13617  278d 2702          	jreq	L3515
13620  278f 3a4a          	dec	_time_flash_count1
13621  2791               L3515:
13622                     ; 3181 					if(set_default_timer1_cnt-- == 1)
13624  2791 c60030        	ld	a,_set_default_timer1_cnt
13625  2794 725a0030      	dec	_set_default_timer1_cnt
13626  2798 a101          	cp	a,#1
13627  279a 2612          	jrne	L5515
13628                     ; 3183 						 set_default_timer1_cnt = 0;
13630  279c 725f0030      	clr	_set_default_timer1_cnt
13631                     ; 3184 						 if(zone_1_timer == 0)
13633  27a0 bead          	ldw	x,_zone_1_timer
13634  27a2 260a          	jrne	L5515
13635                     ; 3185 							zone_1_timer = arr_default_timer[zone_1_level];
13637  27a4 b6a7          	ld	a,_zone_1_level
13638  27a6 5f            	clrw	x
13639  27a7 97            	ld	xl,a
13640  27a8 58            	sllw	x
13641  27a9 de0000        	ldw	x,(_arr_default_timer,x)
13642  27ac bfad          	ldw	_zone_1_timer,x
13643  27ae               L5515:
13644                     ; 3187 					if(time_flash_count2)  time_flash_count2--; 
13646  27ae 3d4b          	tnz	_time_flash_count2
13647  27b0 2702          	jreq	L1615
13650  27b2 3a4b          	dec	_time_flash_count2
13651  27b4               L1615:
13652                     ; 3188 					if(set_default_timer2_cnt-- == 1)
13654  27b4 c60031        	ld	a,_set_default_timer2_cnt
13655  27b7 725a0031      	dec	_set_default_timer2_cnt
13656  27bb a101          	cp	a,#1
13657  27bd 2612          	jrne	L3615
13658                     ; 3190 						 set_default_timer2_cnt = 0;
13660  27bf 725f0031      	clr	_set_default_timer2_cnt
13661                     ; 3191 						 if(zone_2_timer == 0)
13663  27c3 beaf          	ldw	x,_zone_2_timer
13664  27c5 260a          	jrne	L3615
13665                     ; 3192 						 zone_2_timer = arr_default_timer[zone_2_level];
13667  27c7 b6a8          	ld	a,_zone_2_level
13668  27c9 5f            	clrw	x
13669  27ca 97            	ld	xl,a
13670  27cb 58            	sllw	x
13671  27cc de0000        	ldw	x,(_arr_default_timer,x)
13672  27cf bfaf          	ldw	_zone_2_timer,x
13673  27d1               L3615:
13674                     ; 3194 					if(time_flash_count3)  time_flash_count3--;
13676  27d1 3d4c          	tnz	_time_flash_count3
13677  27d3 2702          	jreq	L7615
13680  27d5 3a4c          	dec	_time_flash_count3
13681  27d7               L7615:
13682                     ; 3195 					if(set_default_timer3_cnt-- == 1)
13684  27d7 c60032        	ld	a,_set_default_timer3_cnt
13685  27da 725a0032      	dec	_set_default_timer3_cnt
13686  27de a101          	cp	a,#1
13687  27e0 2612          	jrne	L1715
13688                     ; 3197 						 set_default_timer3_cnt = 0;
13690  27e2 725f0032      	clr	_set_default_timer3_cnt
13691                     ; 3198 						 if(zone_3_timer == 0)
13693  27e6 beb1          	ldw	x,_zone_3_timer
13694  27e8 260a          	jrne	L1715
13695                     ; 3199 						 zone_3_timer = arr_default_timer[zone_3_level];
13697  27ea b6a9          	ld	a,_zone_3_level
13698  27ec 5f            	clrw	x
13699  27ed 97            	ld	xl,a
13700  27ee 58            	sllw	x
13701  27ef de0000        	ldw	x,(_arr_default_timer,x)
13702  27f2 bfb1          	ldw	_zone_3_timer,x
13703  27f4               L1715:
13704                     ; 3201 					if(time_flash_count4)  time_flash_count4--; 	 
13706  27f4 3d4d          	tnz	_time_flash_count4
13707  27f6 2702          	jreq	L5715
13710  27f8 3a4d          	dec	_time_flash_count4
13711  27fa               L5715:
13712                     ; 3203 					if(zone_1_level+zone_2_level+zone_3_level+zone_4_level)     
13714  27fa b6a7          	ld	a,_zone_1_level
13715  27fc 5f            	clrw	x
13716  27fd bba8          	add	a,_zone_2_level
13717  27ff 2401          	jrnc	L672
13718  2801 5c            	incw	x
13719  2802               L672:
13720  2802 bba9          	add	a,_zone_3_level
13721  2804 2401          	jrnc	L003
13722  2806 5c            	incw	x
13723  2807               L003:
13724  2807 bbaa          	add	a,_zone_4_level
13725  2809 2401          	jrnc	L203
13726  280b 5c            	incw	x
13727  280c               L203:
13728  280c 02            	rlwa	x,a
13729  280d 5d            	tnzw	x
13730  280e 2603          	jrne	L473
13731  2810 cc28a3        	jp	L3215
13732  2813               L473:
13733                     ; 3205 						fan_status =2;				//2
13735  2813 350200dc      	mov	_fan_status,#2
13736                     ; 3206 						par_1 =2;
13738  2817 a602          	ld	a,#2
13739  2819 6b0b          	ld	(OFST-14,sp),a
13740                     ; 3207 						par_2 =2;
13742  281b a602          	ld	a,#2
13743  281d 6b0c          	ld	(OFST-13,sp),a
13744                     ; 3210         		if(tigbt_1 >=tigbt_2) temp_8 =tigbt_1;
13746  281f b6c4          	ld	a,_tigbt_1
13747  2821 b1c5          	cp	a,_tigbt_2
13748  2823 2506          	jrult	L1025
13751  2825 b6c4          	ld	a,_tigbt_1
13752  2827 6b19          	ld	(OFST+0,sp),a
13754  2829 2004          	jra	L3025
13755  282b               L1025:
13756                     ; 3211         		else	temp_8 =tigbt_2;		//1# 2# max
13758  282b b6c5          	ld	a,_tigbt_2
13759  282d 6b19          	ld	(OFST+0,sp),a
13760  282f               L3025:
13761                     ; 3212         		if(temp_8  <tigbt_3)  temp_8 =tigbt_3;  //1# 2# 3# max
13763  282f 7b19          	ld	a,(OFST+0,sp)
13764  2831 b1c6          	cp	a,_tigbt_3
13765  2833 2404          	jruge	L5025
13768  2835 b6c6          	ld	a,_tigbt_3
13769  2837 6b19          	ld	(OFST+0,sp),a
13770  2839               L5025:
13771                     ; 3213         		if(temp_8  <tigbt_4)  temp_8 =tigbt_4;  //1# 2# 3# 4# max
13773  2839 7b19          	ld	a,(OFST+0,sp)
13774  283b b1c7          	cp	a,_tigbt_4
13775  283d 2404          	jruge	L7025
13778  283f b6c7          	ld	a,_tigbt_4
13779  2841 6b19          	ld	(OFST+0,sp),a
13780  2843               L7025:
13781                     ; 3218 						if(temp_8 >=CON_TIGBT_45) par_1 =3;	//3/1
13783  2843 7b19          	ld	a,(OFST+0,sp)
13784  2845 a1c5          	cp	a,#197
13785  2847 2504          	jrult	L1125
13788  2849 a603          	ld	a,#3
13789  284b 6b0b          	ld	(OFST-14,sp),a
13790  284d               L1125:
13791                     ; 3219 						if(temp_8 >=CON_TIGBT_60) par_1 =4; 	//on
13793  284d 7b19          	ld	a,(OFST+0,sp)
13794  284f a1da          	cp	a,#218
13795  2851 2504          	jrult	L3125
13798  2853 a604          	ld	a,#4
13799  2855 6b0b          	ld	(OFST-14,sp),a
13800  2857               L3125:
13801                     ; 3222         		if(tmain_1 >=tmain_2) temp_8 =tmain_1;
13803  2857 b6c8          	ld	a,_tmain_1
13804  2859 b1c9          	cp	a,_tmain_2
13805  285b 2506          	jrult	L5125
13808  285d b6c8          	ld	a,_tmain_1
13809  285f 6b19          	ld	(OFST+0,sp),a
13811  2861 2004          	jra	L7125
13812  2863               L5125:
13813                     ; 3223         		else	temp_8 =tmain_2;		//1# 2# max
13815  2863 b6c9          	ld	a,_tmain_2
13816  2865 6b19          	ld	(OFST+0,sp),a
13817  2867               L7125:
13818                     ; 3224         		if(temp_8  <tmain_3)  temp_8 =tmain_3;  //1# 2# 3# max
13820  2867 7b19          	ld	a,(OFST+0,sp)
13821  2869 b1ca          	cp	a,_tmain_3
13822  286b 2404          	jruge	L1225
13825  286d b6ca          	ld	a,_tmain_3
13826  286f 6b19          	ld	(OFST+0,sp),a
13827  2871               L1225:
13828                     ; 3225         		if(temp_8  <tmain_4)  temp_8 =tmain_4;  //1# 2# 3# 4# max
13830  2871 7b19          	ld	a,(OFST+0,sp)
13831  2873 b1cb          	cp	a,_tmain_4
13832  2875 2404          	jruge	L3225
13835  2877 b6cb          	ld	a,_tmain_4
13836  2879 6b19          	ld	(OFST+0,sp),a
13837  287b               L3225:
13838                     ; 3230 						if(temp_8 >=CON_TMAIN_80)  par_2 =3;	//3/1
13840  287b 7b19          	ld	a,(OFST+0,sp)
13841  287d a18c          	cp	a,#140
13842  287f 2504          	jrult	L5225
13845  2881 a603          	ld	a,#3
13846  2883 6b0c          	ld	(OFST-13,sp),a
13847  2885               L5225:
13848                     ; 3231 						if(temp_8 >=CON_TMAIN_120) par_2 =4; 	//on
13850  2885 7b19          	ld	a,(OFST+0,sp)
13851  2887 a1cb          	cp	a,#203
13852  2889 2504          	jrult	L7225
13855  288b a604          	ld	a,#4
13856  288d 6b0c          	ld	(OFST-13,sp),a
13857  288f               L7225:
13858                     ; 3233         		if(par_1 >par_2)   fan_status =par_1;
13860  288f 7b0b          	ld	a,(OFST-14,sp)
13861  2891 110c          	cp	a,(OFST-13,sp)
13862  2893 2306          	jrule	L1325
13865  2895 7b0b          	ld	a,(OFST-14,sp)
13866  2897 b7dc          	ld	_fan_status,a
13868  2899 2004          	jra	L3325
13869  289b               L1325:
13870                     ; 3234         		else fan_status =par_2;
13872  289b 7b0c          	ld	a,(OFST-13,sp)
13873  289d b7dc          	ld	_fan_status,a
13874  289f               L3325:
13875                     ; 3236 						fan_count =120;
13877  289f 357800db      	mov	_fan_count,#120
13878  28a3               L3215:
13879                     ; 3248 			if(Sec_bz ==TRUE)
13881  28a3 b61a          	ld	a,_Sec_bz
13882  28a5 a101          	cp	a,#1
13883  28a7 2703          	jreq	L673
13884  28a9 cc2adf        	jp	L5325
13885  28ac               L673:
13886                     ; 3250 					Sec_bz =FALSE; 
13888  28ac 3f1a          	clr	_Sec_bz
13889                     ; 3252 					if(min_hold_flg) min_hold_flg--;
13891  28ae 725d0034      	tnz	_min_hold_flg
13892  28b2 2704          	jreq	L7325
13895  28b4 725a0034      	dec	_min_hold_flg
13896  28b8               L7325:
13897                     ; 3253 					zone_timeout_deal();
13899  28b8 cd1a5e        	call	_zone_timeout_deal
13901                     ; 3255 					if(Pause_bz ==0)  {boost_time_deal();auto_time_deal();}
13903  28bb 3ddd          	tnz	_Pause_bz
13904  28bd 2606          	jrne	L1425
13907  28bf cd11bf        	call	_boost_time_deal
13911  28c2 cd125c        	call	_auto_time_deal
13913  28c5               L1425:
13914                     ; 3256 					if(Pause_bz ==0)
13916  28c5 3ddd          	tnz	_Pause_bz
13917  28c7 2703          	jreq	L004
13918  28c9 cc29d0        	jp	L3425
13919  28cc               L004:
13920                     ; 3258               for(i=0;i<4;i++)
13922  28cc 0f19          	clr	(OFST+0,sp)
13923  28ce               L5425:
13924                     ; 3260               	p  =&zone_1_level+i;
13926  28ce 7b19          	ld	a,(OFST+0,sp)
13927  28d0 aba7          	add	a,#_zone_1_level
13928  28d2 5f            	clrw	x
13929  28d3 97            	ld	xl,a
13930  28d4 1f17          	ldw	(OFST-2,sp),x
13931                     ; 3261               	tz =&zone_1_timer+i;
13933  28d6 1e01          	ldw	x,(OFST-24,sp)
13934  28d8 7b19          	ld	a,(OFST+0,sp)
13935  28da 5f            	clrw	x
13936  28db 97            	ld	xl,a
13937  28dc 58            	sllw	x
13938  28dd 01            	rrwa	x,a
13939  28de abad          	add	a,#_zone_1_timer
13940  28e0 2401          	jrnc	L403
13941  28e2 5c            	incw	x
13942  28e3               L403:
13943                     ; 3262               	q  =&zone_1_pan+i;
13945  28e3 7b19          	ld	a,(OFST+0,sp)
13946  28e5 ab73          	add	a,#_zone_1_pan
13947  28e7 5f            	clrw	x
13948  28e8 97            	ld	xl,a
13949  28e9 1f13          	ldw	(OFST-6,sp),x
13950                     ; 3263               	x  =&zone_1_nopan_time+i;
13952  28eb 7b19          	ld	a,(OFST+0,sp)
13953  28ed ab77          	add	a,#_zone_1_nopan_time
13954  28ef 5f            	clrw	x
13955  28f0 97            	ld	xl,a
13956  28f1 1f15          	ldw	(OFST-4,sp),x
13957                     ; 3264               	tw =&work_1_time+i;
13959  28f3 7b19          	ld	a,(OFST+0,sp)
13960  28f5 5f            	clrw	x
13961  28f6 97            	ld	xl,a
13962  28f7 58            	sllw	x
13963  28f8 01            	rrwa	x,a
13964  28f9 ab9d          	add	a,#_work_1_time
13965  28fb 2401          	jrnc	L603
13966  28fd 5c            	incw	x
13967  28fe               L603:
13968  28fe 5f            	clrw	x
13969  28ff 97            	ld	xl,a
13970  2900 1f0d          	ldw	(OFST-12,sp),x
13971                     ; 3265               	y  =&time_level_1+i;
13973  2902 7b19          	ld	a,(OFST+0,sp)
13974  2904 abd0          	add	a,#_time_level_1
13975  2906 5f            	clrw	x
13976  2907 97            	ld	xl,a
13977  2908 1f03          	ldw	(OFST-22,sp),x
13978                     ; 3266               	b  =&boost_1_save+i;
13980  290a 7b19          	ld	a,(OFST+0,sp)
13981  290c ab6e          	add	a,#_boost_1_save
13982  290e 5f            	clrw	x
13983  290f 97            	ld	xl,a
13984  2910 1f09          	ldw	(OFST-16,sp),x
13985                     ; 3267               	tb =&boost_time_1+i;
13987  2912 7b19          	ld	a,(OFST+0,sp)
13988  2914 5f            	clrw	x
13989  2915 97            	ld	xl,a
13990  2916 58            	sllw	x
13991  2917 01            	rrwa	x,a
13992  2918 ab52          	add	a,#_boost_time_1
13993  291a 2401          	jrnc	L013
13994  291c 5c            	incw	x
13995  291d               L013:
13996  291d 5f            	clrw	x
13997  291e 97            	ld	xl,a
13998  291f 1f05          	ldw	(OFST-20,sp),x
13999                     ; 3268                	c  =&zone_1_nopan_wait +i;
14001  2921 a624          	ld	a,#high(_zone_1_nopan_wait)
14002  2923 97            	ld	xl,a
14003  2924 a624          	ld	a,#low(_zone_1_nopan_wait)
14004  2926 1b19          	add	a,(OFST+0,sp)
14005  2928 2401          	jrnc	L213
14006  292a 5c            	incw	x
14007  292b               L213:
14008  292b 02            	rlwa	x,a
14009  292c 1f0f          	ldw	(OFST-10,sp),x
14010  292e 01            	rrwa	x,a
14011                     ; 3269               	ta =&auto_time_1+i;
14013  292f 7b19          	ld	a,(OFST+0,sp)
14014  2931 5f            	clrw	x
14015  2932 97            	ld	xl,a
14016  2933 58            	sllw	x
14017  2934 01            	rrwa	x,a
14018  2935 ab5a          	add	a,#_auto_time_1
14019  2937 2401          	jrnc	L413
14020  2939 5c            	incw	x
14021  293a               L413:
14022  293a 5f            	clrw	x
14023  293b 97            	ld	xl,a
14024  293c 1f07          	ldw	(OFST-18,sp),x
14025                     ; 3271                 if((*x)>2)  
14027  293e 1e15          	ldw	x,(OFST-4,sp)
14028  2940 f6            	ld	a,(x)
14029  2941 a103          	cp	a,#3
14030  2943 254c          	jrult	L3525
14031                     ; 3273                    (*x)++;
14033  2945 1e15          	ldw	x,(OFST-4,sp)
14034  2947 7c            	inc	(x)
14035                     ; 3274                    if((*x) >=59) 
14037  2948 1e15          	ldw	x,(OFST-4,sp)
14038  294a f6            	ld	a,(x)
14039  294b a13b          	cp	a,#59
14040  294d 2542          	jrult	L3525
14041                     ; 3276                     	if(i==0)  {if(flex_L_bz ==0) {(*p) =0;Warm_status &=~Select_1_KEY;}}
14043  294f 0d19          	tnz	(OFST+0,sp)
14044  2951 260b          	jrne	L7525
14047  2953 3d66          	tnz	_flex_L_bz
14048  2955 2607          	jrne	L7525
14051  2957 1e17          	ldw	x,(OFST-2,sp)
14052  2959 7f            	clr	(x)
14055  295a 72110013      	bres	_Warm_status,#0
14056  295e               L7525:
14057                     ; 3277                     	if(i==1)  {if(flex_L_bz ==0) {(*p) =0;Warm_status &=~Select_2_KEY;}}
14059  295e 7b19          	ld	a,(OFST+0,sp)
14060  2960 a101          	cp	a,#1
14061  2962 260b          	jrne	L3625
14064  2964 3d66          	tnz	_flex_L_bz
14065  2966 2607          	jrne	L3625
14068  2968 1e17          	ldw	x,(OFST-2,sp)
14069  296a 7f            	clr	(x)
14072  296b 72130013      	bres	_Warm_status,#1
14073  296f               L3625:
14074                     ; 3278                     	if(i==2)  {if(flex_R_bz ==0) {(*p) =0;Warm_status &=~Select_3_KEY;}}
14076  296f 7b19          	ld	a,(OFST+0,sp)
14077  2971 a102          	cp	a,#2
14078  2973 260b          	jrne	L7625
14081  2975 3d67          	tnz	_flex_R_bz
14082  2977 2607          	jrne	L7625
14085  2979 1e17          	ldw	x,(OFST-2,sp)
14086  297b 7f            	clr	(x)
14089  297c 72150013      	bres	_Warm_status,#2
14090  2980               L7625:
14091                     ; 3279                     	if(i==3)  {if(flex_R_bz ==0) {(*p) =0;Warm_status &=~Select_4_KEY;}}
14093  2980 7b19          	ld	a,(OFST+0,sp)
14094  2982 a103          	cp	a,#3
14095  2984 260b          	jrne	L3525
14098  2986 3d67          	tnz	_flex_R_bz
14099  2988 2607          	jrne	L3525
14102  298a 1e17          	ldw	x,(OFST-2,sp)
14103  298c 7f            	clr	(x)
14106  298d 72170013      	bres	_Warm_status,#3
14107  2991               L3525:
14108                     ; 3282                 if(*c) (*c)--;
14110  2991 1e0f          	ldw	x,(OFST-10,sp)
14111  2993 7d            	tnz	(x)
14112  2994 2703          	jreq	L7725
14115  2996 1e0f          	ldw	x,(OFST-10,sp)
14116  2998 7a            	dec	(x)
14117  2999               L7725:
14118                     ; 3284 	              if((*p) ==0)  {(*q) =0;(*x) =0;(*tw) =0;(*tb) =0;(*y) =0;(*b)=0;(*ta) =0;}
14120  2999 1e17          	ldw	x,(OFST-2,sp)
14121  299b 7d            	tnz	(x)
14122  299c 261d          	jrne	L1035
14125  299e 1e13          	ldw	x,(OFST-6,sp)
14126  29a0 7f            	clr	(x)
14129  29a1 1e15          	ldw	x,(OFST-4,sp)
14130  29a3 7f            	clr	(x)
14133  29a4 1e0d          	ldw	x,(OFST-12,sp)
14134  29a6 905f          	clrw	y
14135  29a8 ff            	ldw	(x),y
14138  29a9 1e05          	ldw	x,(OFST-20,sp)
14139  29ab 905f          	clrw	y
14140  29ad ff            	ldw	(x),y
14143  29ae 1e03          	ldw	x,(OFST-22,sp)
14144  29b0 7f            	clr	(x)
14147  29b1 1e09          	ldw	x,(OFST-16,sp)
14148  29b3 7f            	clr	(x)
14151  29b4 1e07          	ldw	x,(OFST-18,sp)
14152  29b6 905f          	clrw	y
14153  29b8 ff            	ldw	(x),y
14155  29b9 200a          	jra	L3035
14156  29bb               L1035:
14157                     ; 3285 	              else	(*tw)++; 
14159  29bb 1e0d          	ldw	x,(OFST-12,sp)
14160  29bd 9093          	ldw	y,x
14161  29bf fe            	ldw	x,(x)
14162  29c0 1c0001        	addw	x,#1
14163  29c3 90ff          	ldw	(y),x
14164  29c5               L3035:
14165                     ; 3258               for(i=0;i<4;i++)
14167  29c5 0c19          	inc	(OFST+0,sp)
14170  29c7 7b19          	ld	a,(OFST+0,sp)
14171  29c9 a104          	cp	a,#4
14172  29cb 2403          	jruge	L204
14173  29cd cc28ce        	jp	L5425
14174  29d0               L204:
14175  29d0               L3425:
14176                     ; 3289           if((zone_1_level ==0)&&(bbq_L_bz))  bbq_L_bz =0;
14178  29d0 3da7          	tnz	_zone_1_level
14179  29d2 2606          	jrne	L5035
14181  29d4 3d68          	tnz	_bbq_L_bz
14182  29d6 2702          	jreq	L5035
14185  29d8 3f68          	clr	_bbq_L_bz
14186  29da               L5035:
14187                     ; 3290 	        if((zone_3_level ==0)&&(bbq_R_bz))  bbq_R_bz =0;
14189  29da 3da9          	tnz	_zone_3_level
14190  29dc 2606          	jrne	L7035
14192  29de 3d69          	tnz	_bbq_R_bz
14193  29e0 2702          	jreq	L7035
14196  29e2 3f69          	clr	_bbq_R_bz
14197  29e4               L7035:
14198                     ; 3294 	        if((time_flash_count1 ==0)&&(Pause_bz ==0)&&(zone_1_timer ==0)) timer_status &=~Select_1_KEY; 
14200  29e4 3d4a          	tnz	_time_flash_count1
14201  29e6 260c          	jrne	L1135
14203  29e8 3ddd          	tnz	_Pause_bz
14204  29ea 2608          	jrne	L1135
14206  29ec bead          	ldw	x,_zone_1_timer
14207  29ee 2604          	jrne	L1135
14210  29f0 72110049      	bres	_timer_status,#0
14211  29f4               L1135:
14212                     ; 3295 	        if((time_flash_count2 ==0)&&(Pause_bz ==0)&&(zone_2_timer ==0)) timer_status &=~Select_2_KEY; 
14214  29f4 3d4b          	tnz	_time_flash_count2
14215  29f6 260c          	jrne	L3135
14217  29f8 3ddd          	tnz	_Pause_bz
14218  29fa 2608          	jrne	L3135
14220  29fc beaf          	ldw	x,_zone_2_timer
14221  29fe 2604          	jrne	L3135
14224  2a00 72130049      	bres	_timer_status,#1
14225  2a04               L3135:
14226                     ; 3296 	        if((time_flash_count3 ==0)&&(Pause_bz ==0)&&(zone_3_timer ==0)) timer_status &=~Select_3_KEY; 
14228  2a04 3d4c          	tnz	_time_flash_count3
14229  2a06 260c          	jrne	L5135
14231  2a08 3ddd          	tnz	_Pause_bz
14232  2a0a 2608          	jrne	L5135
14234  2a0c beb1          	ldw	x,_zone_3_timer
14235  2a0e 2604          	jrne	L5135
14238  2a10 72150049      	bres	_timer_status,#2
14239  2a14               L5135:
14240                     ; 3297 	        if((time_flash_count4 ==0)&&(Pause_bz ==0)&&(zone_4_timer ==0)) timer_status &=~Select_4_KEY; 
14242  2a14 3d4d          	tnz	_time_flash_count4
14243  2a16 260c          	jrne	L7135
14245  2a18 3ddd          	tnz	_Pause_bz
14246  2a1a 2608          	jrne	L7135
14248  2a1c beb3          	ldw	x,_zone_4_timer
14249  2a1e 2604          	jrne	L7135
14252  2a20 72170049      	bres	_timer_status,#3
14253  2a24               L7135:
14254                     ; 3299 			    if(zone_1_level +zone_2_level +zone_3_level +zone_4_level)    	 idle_count =60;   
14256  2a24 b6a7          	ld	a,_zone_1_level
14257  2a26 5f            	clrw	x
14258  2a27 bba8          	add	a,_zone_2_level
14259  2a29 2401          	jrnc	L613
14260  2a2b 5c            	incw	x
14261  2a2c               L613:
14262  2a2c bba9          	add	a,_zone_3_level
14263  2a2e 2401          	jrnc	L023
14264  2a30 5c            	incw	x
14265  2a31               L023:
14266  2a31 bbaa          	add	a,_zone_4_level
14267  2a33 2401          	jrnc	L223
14268  2a35 5c            	incw	x
14269  2a36               L223:
14270  2a36 02            	rlwa	x,a
14271  2a37 5d            	tnzw	x
14272  2a38 2704          	jreq	L1235
14275  2a3a 353c003a      	mov	_idle_count,#60
14276  2a3e               L1235:
14277                     ; 3300 	        if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min)  idle_count =60; 
14279  2a3e b64e          	ld	a,_flash_H_1_min
14280  2a40 5f            	clrw	x
14281  2a41 bb4f          	add	a,_flash_H_2_min
14282  2a43 2401          	jrnc	L423
14283  2a45 5c            	incw	x
14284  2a46               L423:
14285  2a46 bb50          	add	a,_flash_H_3_min
14286  2a48 2401          	jrnc	L623
14287  2a4a 5c            	incw	x
14288  2a4b               L623:
14289  2a4b bb51          	add	a,_flash_H_4_min
14290  2a4d 2401          	jrnc	L033
14291  2a4f 5c            	incw	x
14292  2a50               L033:
14293  2a50 02            	rlwa	x,a
14294  2a51 5d            	tnzw	x
14295  2a52 2704          	jreq	L3235
14298  2a54 353c003a      	mov	_idle_count,#60
14299  2a58               L3235:
14300                     ; 3301 	        if(Err_1_data+Err_2_data +Err_3_data +Err_4_data) 	idle_count =60; 
14302  2a58 b683          	ld	a,_Err_1_data
14303  2a5a 5f            	clrw	x
14304  2a5b bb84          	add	a,_Err_2_data
14305  2a5d 2401          	jrnc	L233
14306  2a5f 5c            	incw	x
14307  2a60               L233:
14308  2a60 bb85          	add	a,_Err_3_data
14309  2a62 2401          	jrnc	L433
14310  2a64 5c            	incw	x
14311  2a65               L433:
14312  2a65 bb86          	add	a,_Err_4_data
14313  2a67 2401          	jrnc	L633
14314  2a69 5c            	incw	x
14315  2a6a               L633:
14316  2a6a 02            	rlwa	x,a
14317  2a6b 5d            	tnzw	x
14318  2a6c 2704          	jreq	L5235
14321  2a6e 353c003a      	mov	_idle_count,#60
14322  2a72               L5235:
14323                     ; 3302 					if(zone_1_timer+zone_2_timer+zone_3_timer+zone_4_timer) idle_count =60;
14325  2a72 bead          	ldw	x,_zone_1_timer
14326  2a74 72bb00af      	addw	x,_zone_2_timer
14327  2a78 72bb00b1      	addw	x,_zone_3_timer
14328  2a7c 72bb00b3      	addw	x,_zone_4_timer
14329  2a80 2704          	jreq	L7235
14332  2a82 353c003a      	mov	_idle_count,#60
14333  2a86               L7235:
14334                     ; 3304           if(idle_count)
14336  2a86 3d3a          	tnz	_idle_count
14337  2a88 270d          	jreq	L1335
14338                     ; 3306            	idle_count--;
14340  2a8a 3a3a          	dec	_idle_count
14341                     ; 3307            	if(idle_count ==0)       {buzzer_time = buz_500ms;Power_off_deal();} 
14343  2a8c 3d3a          	tnz	_idle_count
14344  2a8e 2607          	jrne	L1335
14347  2a90 35320027      	mov	_buzzer_time,#50
14350  2a94 cd0818        	call	_Power_off_deal
14352  2a97               L1335:
14353                     ; 3310           if(buzzer_account) {buzzer_account--;buzzer_time =buz_120ms;}
14355  2a97 3d28          	tnz	_buzzer_account
14356  2a99 2706          	jreq	L5335
14359  2a9b 3a28          	dec	_buzzer_account
14362  2a9d 350c0027      	mov	_buzzer_time,#12
14363  2aa1               L5335:
14364                     ; 3312           if(Pause_bz ==0)
14366  2aa1 3ddd          	tnz	_Pause_bz
14367  2aa3 2603          	jrne	L7335
14368                     ; 3314             time_power_deal(); 		//140614 
14370  2aa5 cd13fd        	call	_time_power_deal
14372  2aa8               L7335:
14373                     ; 3318 			  	for(i=0;i<4;i++)
14375  2aa8 0f19          	clr	(OFST+0,sp)
14376  2aaa               L1435:
14377                     ; 3320 	        	p =&tmain_1 +i;
14379  2aaa 7b19          	ld	a,(OFST+0,sp)
14380  2aac abc8          	add	a,#_tmain_1
14381  2aae 5f            	clrw	x
14382  2aaf 97            	ld	xl,a
14383  2ab0 1f17          	ldw	(OFST-2,sp),x
14384                     ; 3321 	  	      q =&flash_H_1_min +i;
14386  2ab2 7b19          	ld	a,(OFST+0,sp)
14387  2ab4 ab4e          	add	a,#_flash_H_1_min
14388  2ab6 5f            	clrw	x
14389  2ab7 97            	ld	xl,a
14390  2ab8 1f13          	ldw	(OFST-6,sp),x
14391                     ; 3322 	        	if((*p) >CON_TMAIN_45)  (*q)=1;
14393  2aba 1e17          	ldw	x,(OFST-2,sp)
14394  2abc f6            	ld	a,(x)
14395  2abd a142          	cp	a,#66
14396  2abf 2507          	jrult	L7435
14399  2ac1 1e13          	ldw	x,(OFST-6,sp)
14400  2ac3 a601          	ld	a,#1
14401  2ac5 f7            	ld	(x),a
14403  2ac6 2003          	jra	L1535
14404  2ac8               L7435:
14405                     ; 3323 	         	else (*q) =0;
14407  2ac8 1e13          	ldw	x,(OFST-6,sp)
14408  2aca 7f            	clr	(x)
14409  2acb               L1535:
14410                     ; 3318 			  	for(i=0;i<4;i++)
14412  2acb 0c19          	inc	(OFST+0,sp)
14415  2acd 7b19          	ld	a,(OFST+0,sp)
14416  2acf a104          	cp	a,#4
14417  2ad1 25d7          	jrult	L1435
14418                     ; 3325 	        if(fan_count) 
14420  2ad3 3ddb          	tnz	_fan_count
14421  2ad5 2708          	jreq	L5325
14422                     ; 3327 	        	fan_count--;
14424  2ad7 3adb          	dec	_fan_count
14425                     ; 3328 				  	if(fan_count ==0) fan_status =0;//FAN_OFF;   
14427  2ad9 3ddb          	tnz	_fan_count
14428  2adb 2602          	jrne	L5325
14431  2add 3fdc          	clr	_fan_status
14432  2adf               L5325:
14433                     ; 3334 			if(Min_bz ==TRUE)
14435  2adf b61b          	ld	a,_Min_bz
14436  2ae1 a101          	cp	a,#1
14437  2ae3 2638          	jrne	L7535
14438                     ; 3336 				Min_bz =FALSE;
14440  2ae5 3f1b          	clr	_Min_bz
14441                     ; 3337 				apt_min_reset++;
14443  2ae7 3ce6          	inc	_apt_min_reset
14444                     ; 3338 	      if(apt_min_reset >=20) {apt_min_reset =0;APT8L16Init_H();APT8L16Init_L();APT8L16Init_AH();}
14446  2ae9 b6e6          	ld	a,_apt_min_reset
14447  2aeb a114          	cp	a,#20
14448  2aed 250b          	jrult	L1635
14451  2aef 3fe6          	clr	_apt_min_reset
14454  2af1 cd0a98        	call	_APT8L16Init_H
14458  2af4 cd0b45        	call	_APT8L16Init_L
14462  2af7 cd0bf2        	call	_APT8L16Init_AH
14464  2afa               L1635:
14465                     ; 3340 	      if((general_timer)&&(Pause_bz ==0))
14467  2afa 3dab          	tnz	_general_timer
14468  2afc 2712          	jreq	L3635
14470  2afe 3ddd          	tnz	_Pause_bz
14471  2b00 260e          	jrne	L3635
14472                     ; 3342        		general_timer--;	
14474  2b02 3aab          	dec	_general_timer
14475                     ; 3343        		if(general_timer ==0)   {buzzer_time = buz_200ms; buzzer_account =29;}
14477  2b04 3dab          	tnz	_general_timer
14478  2b06 2608          	jrne	L3635
14481  2b08 35140027      	mov	_buzzer_time,#20
14484  2b0c 351d0028      	mov	_buzzer_account,#29
14485  2b10               L3635:
14486                     ; 3374 				if(pause_x_timer)
14488  2b10 3dac          	tnz	_pause_x_timer
14489  2b12 2709          	jreq	L7535
14490                     ; 3376 					pause_x_timer--;
14492  2b14 3aac          	dec	_pause_x_timer
14493                     ; 3377 					if(pause_x_timer ==0)  Power_off_deal();
14495  2b16 3dac          	tnz	_pause_x_timer
14496  2b18 2603          	jrne	L7535
14499  2b1a cd0818        	call	_Power_off_deal
14501  2b1d               L7535:
14502                     ; 3381 			if(timer1_min_flg == TRUE)
14504  2b1d c60001        	ld	a,_timer1_min_flg
14505  2b20 a101          	cp	a,#1
14506  2b22 264e          	jrne	L3735
14507                     ; 3383 				timer1_min_flg = FALSE;
14509  2b24 725f0001      	clr	_timer1_min_flg
14510                     ; 3384 				if(zone_1_timer)
14512  2b28 bead          	ldw	x,_zone_1_timer
14513  2b2a 2746          	jreq	L3735
14514                     ; 3386 					if(--zone_1_timer == 0)
14516  2b2c bead          	ldw	x,_zone_1_timer
14517  2b2e 1d0001        	subw	x,#1
14518  2b31 bfad          	ldw	_zone_1_timer,x
14519  2b33 263d          	jrne	L3735
14520                     ; 3388 						buzzer_cnt_5s = 500;//10*500MS响一次，这里立即响
14522  2b35 ae01f4        	ldw	x,#500
14523  2b38 cf000d        	ldw	_buzzer_cnt_5s,x
14524                     ; 3389 						buzzer_5s_times = 4;//响4声
14526  2b3b 3504000c      	mov	_buzzer_5s_times,#4
14527                     ; 3390 						on1_bz = FALSE;//关闭炉头
14529  2b3f 3f21          	clr	_on1_bz
14530                     ; 3391 						zone_1_level = 0;
14532  2b41 3fa7          	clr	_zone_1_level
14533                     ; 3392 						zone_flash_count1 = 0;//档位停止闪烁
14535  2b43 3f3b          	clr	_zone_flash_count1
14536                     ; 3393 						time_flash_count1 = 40;//时间闪烁20s
14538  2b45 3528004a      	mov	_time_flash_count1,#40
14539                     ; 3394 						if(Warm_status &Select_1_KEY)  {Warm_1_timer =0;Warm_status &=~Select_1_KEY;}
14541  2b49 c60013        	ld	a,_Warm_status
14542  2b4c a501          	bcp	a,#1
14543  2b4e 2708          	jreq	L1045
14546  2b50 725f0014      	clr	_Warm_1_timer
14549  2b54 72110013      	bres	_Warm_status,#0
14550  2b58               L1045:
14551                     ; 3395 						if(Warm_1_timer)  {Warm_1_timer--;if(Warm_1_timer ==0) {Warm_status &=~Select_1_KEY;zone_1_level =0;buzzer_time = buz_200ms;}}
14553  2b58 725d0014      	tnz	_Warm_1_timer
14554  2b5c 2714          	jreq	L3735
14557  2b5e 725a0014      	dec	_Warm_1_timer
14560  2b62 725d0014      	tnz	_Warm_1_timer
14561  2b66 260a          	jrne	L3735
14564  2b68 72110013      	bres	_Warm_status,#0
14567  2b6c 3fa7          	clr	_zone_1_level
14570  2b6e 35140027      	mov	_buzzer_time,#20
14571  2b72               L3735:
14572                     ; 3399 			if(timer2_min_flg == TRUE)
14574  2b72 c60003        	ld	a,_timer2_min_flg
14575  2b75 a101          	cp	a,#1
14576  2b77 264e          	jrne	L7045
14577                     ; 3401 				timer2_min_flg = FALSE;
14579  2b79 725f0003      	clr	_timer2_min_flg
14580                     ; 3402 				if(zone_2_timer)
14582  2b7d beaf          	ldw	x,_zone_2_timer
14583  2b7f 2746          	jreq	L7045
14584                     ; 3404 					if(--zone_2_timer == 0)
14586  2b81 beaf          	ldw	x,_zone_2_timer
14587  2b83 1d0001        	subw	x,#1
14588  2b86 bfaf          	ldw	_zone_2_timer,x
14589  2b88 263d          	jrne	L7045
14590                     ; 3406 						buzzer_cnt_5s = 500;//10*500MS响一次，这里立即响
14592  2b8a ae01f4        	ldw	x,#500
14593  2b8d cf000d        	ldw	_buzzer_cnt_5s,x
14594                     ; 3407 						buzzer_5s_times = 4;//响4声
14596  2b90 3504000c      	mov	_buzzer_5s_times,#4
14597                     ; 3408 						on2_bz = FALSE;//关闭炉头
14599  2b94 3f22          	clr	_on2_bz
14600                     ; 3409 						zone_2_level = 0;
14602  2b96 3fa8          	clr	_zone_2_level
14603                     ; 3410 						zone_flash_count2 = 0;//档位停止闪烁
14605  2b98 3f3c          	clr	_zone_flash_count2
14606                     ; 3411 						time_flash_count2 = 40;//时间闪烁20s
14608  2b9a 3528004b      	mov	_time_flash_count2,#40
14609                     ; 3412 						if(Warm_status &Select_2_KEY)  {Warm_2_timer =0;Warm_status &=~Select_2_KEY;}
14611  2b9e c60013        	ld	a,_Warm_status
14612  2ba1 a502          	bcp	a,#2
14613  2ba3 2708          	jreq	L5145
14616  2ba5 725f0015      	clr	_Warm_2_timer
14619  2ba9 72130013      	bres	_Warm_status,#1
14620  2bad               L5145:
14621                     ; 3413 						if(Warm_2_timer)  {Warm_2_timer--;if(Warm_2_timer ==0) {Warm_status &=~Select_2_KEY;zone_2_level =0;buzzer_time = buz_200ms;}}
14623  2bad 725d0015      	tnz	_Warm_2_timer
14624  2bb1 2714          	jreq	L7045
14627  2bb3 725a0015      	dec	_Warm_2_timer
14630  2bb7 725d0015      	tnz	_Warm_2_timer
14631  2bbb 260a          	jrne	L7045
14634  2bbd 72130013      	bres	_Warm_status,#1
14637  2bc1 3fa8          	clr	_zone_2_level
14640  2bc3 35140027      	mov	_buzzer_time,#20
14641  2bc7               L7045:
14642                     ; 3417 			if(timer3_min_flg == TRUE)
14644  2bc7 c60005        	ld	a,_timer3_min_flg
14645  2bca a101          	cp	a,#1
14646  2bcc 264e          	jrne	L3245
14647                     ; 3419 				timer3_min_flg = FALSE;
14649  2bce 725f0005      	clr	_timer3_min_flg
14650                     ; 3420 				if(zone_3_timer)
14652  2bd2 beb1          	ldw	x,_zone_3_timer
14653  2bd4 2746          	jreq	L3245
14654                     ; 3422 					if(--zone_3_timer == 0)
14656  2bd6 beb1          	ldw	x,_zone_3_timer
14657  2bd8 1d0001        	subw	x,#1
14658  2bdb bfb1          	ldw	_zone_3_timer,x
14659  2bdd 263d          	jrne	L3245
14660                     ; 3424 						buzzer_cnt_5s = 500;//10*500MS响一次，这里立即响
14662  2bdf ae01f4        	ldw	x,#500
14663  2be2 cf000d        	ldw	_buzzer_cnt_5s,x
14664                     ; 3425 						buzzer_5s_times = 4;//响4声
14666  2be5 3504000c      	mov	_buzzer_5s_times,#4
14667                     ; 3426 						on3_bz = FALSE;//关闭炉头
14669  2be9 3f23          	clr	_on3_bz
14670                     ; 3427 						zone_3_level = 0;
14672  2beb 3fa9          	clr	_zone_3_level
14673                     ; 3428 						zone_flash_count3 = 0;//档位停止闪烁
14675  2bed 3f3d          	clr	_zone_flash_count3
14676                     ; 3429 						time_flash_count3 = 40;//时间闪烁20s
14678  2bef 3528004c      	mov	_time_flash_count3,#40
14679                     ; 3430 						if(Warm_status &Select_3_KEY)  {Warm_3_timer =0;Warm_status &=~Select_3_KEY;}
14681  2bf3 c60013        	ld	a,_Warm_status
14682  2bf6 a504          	bcp	a,#4
14683  2bf8 2708          	jreq	L1345
14686  2bfa 725f0016      	clr	_Warm_3_timer
14689  2bfe 72150013      	bres	_Warm_status,#2
14690  2c02               L1345:
14691                     ; 3431 						if(Warm_3_timer)  {Warm_3_timer--;if(Warm_3_timer ==0) {Warm_status &=~Select_3_KEY;zone_3_level =0;buzzer_time = buz_200ms;}}
14693  2c02 725d0016      	tnz	_Warm_3_timer
14694  2c06 2714          	jreq	L3245
14697  2c08 725a0016      	dec	_Warm_3_timer
14700  2c0c 725d0016      	tnz	_Warm_3_timer
14701  2c10 260a          	jrne	L3245
14704  2c12 72150013      	bres	_Warm_status,#2
14707  2c16 3fa9          	clr	_zone_3_level
14710  2c18 35140027      	mov	_buzzer_time,#20
14711  2c1c               L3245:
14712                     ; 3437     IWDG_ReloadCounter();    /* Refresh IWDG */   
14714  2c1c cd0000        	call	_IWDG_ReloadCounter
14717  2c1f aca01ca0      	jpf	L5154
17005                     	xdef	_main
17006                     	xdef	_E2PROM_InitCheck
17007                     	xdef	_zone_timeout_deal
17008                     	xdef	_blockDisplay
17009                     	xdef	_disp_timer_x
17010                     	xdef	_timer_x_set
17011                     	xdef	_favor_x_set
17012                     	xdef	_favor_x_save
17013                     	xdef	_vif_x_set
17014                     	xdef	_boost_x_set
17015                     	xdef	_on_x_set
17016                     	xdef	_Warm_function_deal
17017                     	xdef	_dec_x_timer
17018                     	xdef	_dec_x_key_level
17019                     	xdef	_inc_x_timer
17020                     	xdef	_inc_x_key_level
17021                     	xdef	_key_x_deal
17022                     	xdef	_lock_key_deal
17023                     	xdef	_flex_R_key_deal
17024                     	xdef	_flex_L_key_deal
17025                     	xdef	_on_off_key_deal
17026                     	xdef	_speed_up
17027                     	xdef	_inc_dec_deal
17028                     	xdef	_short_key_buzzer
17029                     	xdef	_time_power_deal
17030                     	xdef	_Zone_Small_Set
17031                     	xdef	_Zone_Big_Set
17032                     	xdef	_auto_time_deal
17033                     	xdef	_auto_x_time_deal
17034                     	xdef	_boost_time_deal
17035                     	xdef	_boost_x_time
17036                     	xdef	_key_next_deal
17037                     	xdef	_key_scan_I2C
17038                     	xdef	_APT8L16Init_AH
17039                     	xdef	_APT8L16Init_L
17040                     	xdef	_APT8L16Init_H
17041                     	xdef	_ON_disp_zone_x
17042                     	xdef	_Display_decode
17043                     	xdef	_calculate_min
17044                     	xdef	_minium_value
17045                     	xdef	_Power_off_deal
17046                     	xdef	_comm_deal
17047                     	xdef	_syn_deal
17048                     	xdef	_zone_x_t_status
17049                     	xdef	_set_off_power
17050                     	xdef	_comm_get_deal
17051                     	xdef	_comm_asm_deal
17052                     	xdef	_flex_deal
17053                     	xdef	_sme_x_share_power
17054                     	xdef	_sme_x_clr_power
17055                     	xdef	_comm_vertify
17056                     	xdef	_readEEPROM
17057                     	xdef	_writeEEPROM
17058                     	xdef	_arr_T_Sens_L
17059                     	xdef	_arr_APTRegData_L
17060                     	xdef	_arr_T_Sens_H
17061                     	xdef	_arr_APTRegData_H
17062                     	xdef	_arr_T_Sens_AH
17063                     	xdef	_arr_APTRegData_AH
17064                     	xdef	_arr_flex_s
17065                     	xdef	_arr_flex_b
17066                     	xdef	_arr_4_pow
17067                     	xdef	_arr_2_pow
17068                     	xdef	_arr_3_pow
17069                     	xdef	_arr_1_pow
17070                     	xdef	_erp_pwm
17071                     	xdef	_arr_tiao_180_pwm
17072                     	xdef	_arr_tiao_on
17073                     	xdef	_arr_default_timer
17074                     	xdef	_key_OverflowCheck
17075                     	xref	_APTTouchWrOneData1
17076                     	xref	_APTTouchRdOneData1
17077                     	xref	_APTTouchWrOneData
17078                     	xref	_APTTouchRdOneData
17079                     	xref	_ReceiveAck1
17080                     	xref	_TX1_Byte
17081                     	xref	_Stop1
17082                     	xref	_Start1
17083                     	xref	_IIC1_initial
17084                     	xref	_zone_x_cur_no_set
17085                     	xdef	_apt_min_reset
17086                     	xdef	_lock_release_flg
17087                     	xdef	_min_hold_flg
17088                     	xdef	_set_default_timer4_cnt
17089                     	xdef	_set_default_timer3_cnt
17090                     	xdef	_set_default_timer2_cnt
17091                     	xdef	_set_default_timer1_cnt
17092                     	xdef	_zone_4_nopan_flg
17093                     	xdef	_zone_3_nopan_flg
17094                     	xdef	_zone_2_nopan_flg
17095                     	xdef	_zone_1_nopan_flg
17096                     	xdef	_zone_4_timeout_cnt
17097                     	xdef	_zone_3_timeout_cnt
17098                     	xdef	_zone_2_timeout_cnt
17099                     	xdef	_zone_1_timeout_cnt
17100                     	xdef	_zone_4_nopan_wait
17101                     	xdef	_zone_3_nopan_wait
17102                     	xdef	_zone_2_nopan_wait
17103                     	xdef	_zone_1_nopan_wait
17104                     	xdef	_boost_4_count
17105                     	xdef	_boost_3_count
17106                     	xdef	_boost_2_count
17107                     	xdef	_boost_1_count
17108                     	xdef	_igbt_high_4
17109                     	xdef	_igbt_high_3
17110                     	xdef	_igbt_high_2
17111                     	xdef	_igbt_high_1
17112                     	xdef	_oil_high_4
17113                     	xdef	_oil_high_3
17114                     	xdef	_oil_high_2
17115                     	xdef	_oil_high_1
17116                     	xdef	_tiao_on_4
17117                     	xdef	_tiao_on_3
17118                     	xdef	_tiao_on_2
17119                     	xdef	_tiao_on_1
17120                     	xdef	_Warm_4_timer
17121                     	xdef	_Warm_3_timer
17122                     	xdef	_Warm_2_timer
17123                     	xdef	_Warm_1_timer
17124                     	xdef	_Warm_status
17125                     	xdef	_Pause_save_timer_4
17126                     	xdef	_Pause_save_timer_3
17127                     	xdef	_Pause_save_timer_2
17128                     	xdef	_Pause_save_timer_1
17129                     	xdef	_Pause_bz
17130                     	xdef	_fan_status
17131                     	xdef	_fan_count
17132                     	xdef	_comm_list
17133                     	xdef	_comm_status
17134                     	xdef	_com_count
17135                     	xdef	_pwm_temp_4
17136                     	xdef	_pwm_temp_3
17137                     	xdef	_pwm_temp_2
17138                     	xdef	_pwm_temp_1
17139                     	xdef	_time_level_4
17140                     	xdef	_time_level_3
17141                     	xdef	_time_level_2
17142                     	xdef	_time_level_1
17143                     	xdef	_ppg_4
17144                     	xdef	_ppg_3
17145                     	xdef	_ppg_2
17146                     	xdef	_ppg_1
17147                     	xdef	_tmain_4
17148                     	xdef	_tmain_3
17149                     	xdef	_tmain_2
17150                     	xdef	_tmain_1
17151                     	xdef	_tigbt_4
17152                     	xdef	_tigbt_3
17153                     	xdef	_tigbt_2
17154                     	xdef	_tigbt_1
17155                     	xdef	_cur_4
17156                     	xdef	_cur_3
17157                     	xdef	_cur_2
17158                     	xdef	_cur_1
17159                     	xdef	_vol_4
17160                     	xdef	_vol_3
17161                     	xdef	_vol_2
17162                     	xdef	_vol_1
17163                     	xdef	_match_ok
17164                     	xdef	_I2C_GET_DATA_AH
17165                     	xdef	_I2C_GET_DATA_L
17166                     	xdef	_I2C_GET_DATA_H
17167                     	xdef	_zone_4_timer
17168                     	xdef	_zone_3_timer
17169                     	xdef	_zone_2_timer
17170                     	xdef	_zone_1_timer
17171                     	xdef	_pause_x_timer
17172                     	xdef	_general_timer
17173                     	xdef	_zone_4_level
17174                     	xdef	_zone_3_level
17175                     	xdef	_zone_2_level
17176                     	xdef	_zone_1_level
17177                     	xdef	_limit_time
17178                     	xdef	_work_4_time
17179                     	xdef	_work_3_time
17180                     	xdef	_work_2_time
17181                     	xdef	_work_1_time
17182                     	xdef	_key_longPressRecord
17183                     	switch	.bss
17184  0000               _key_buf:
17185  0000 00            	ds.b	1
17186                     	xdef	_key_buf
17187                     	xdef	_key_ReleaseFlag
17188                     	xdef	_key_err_account
17189                     	xdef	_arr_save_scan
17190                     	xdef	_key_account
17191                     	xdef	_key_ok_bit
17192                     	xdef	_key_scan_value_AH
17193                     	xdef	_key_scan_value_L
17194                     	xdef	_key_scan_value_H
17195                     	xdef	_boost_status
17196                     	xdef	_Err_4_count
17197                     	xdef	_Err_3_count
17198                     	xdef	_Err_2_count
17199                     	xdef	_Err_1_count
17200                     	xdef	_Err_4_data
17201                     	xdef	_Err_3_data
17202                     	xdef	_Err_2_data
17203                     	xdef	_Err_1_data
17204                     	xdef	_Get_cur_no
17205                     	xdef	_Get_ppg
17206                     	xdef	_Get_tmain
17207                     	xdef	_Get_tigbt
17208                     	xdef	_Get_cur
17209                     	xdef	_Get_vol
17210                     	xdef	_Get_data
17211                     	xdef	_Get_addr
17212                     	xdef	_zone_4_nopan_time
17213                     	xdef	_zone_3_nopan_time
17214                     	xdef	_zone_2_nopan_time
17215                     	xdef	_zone_1_nopan_time
17216                     	xdef	_zone_4_pan
17217                     	xdef	_zone_3_pan
17218                     	xdef	_zone_2_pan
17219                     	xdef	_zone_1_pan
17220                     	xdef	_Comm_step
17221                     	xdef	_boost_4_save
17222                     	xdef	_boost_3_save
17223                     	xdef	_boost_2_save
17224                     	xdef	_boost_1_save
17225                     	xdef	_bbq_R_time
17226                     	xdef	_bbq_L_time
17227                     	xdef	_bbq_R_bz
17228                     	xdef	_bbq_L_bz
17229                     	xdef	_flex_R_bz
17230                     	xdef	_flex_L_bz
17231                     	xdef	_auto_limit_pow_4
17232                     	xdef	_auto_limit_pow_3
17233                     	xdef	_auto_limit_pow_2
17234                     	xdef	_auto_limit_pow_1
17235                     	xdef	_auto_time_4
17236                     	xdef	_auto_time_3
17237                     	xdef	_auto_time_2
17238                     	xdef	_auto_time_1
17239                     	xdef	_boost_time_4
17240                     	xdef	_boost_time_3
17241                     	xdef	_boost_time_2
17242                     	xdef	_boost_time_1
17243                     	xdef	_flash_H_4_min
17244                     	xdef	_flash_H_3_min
17245                     	xdef	_flash_H_2_min
17246                     	xdef	_flash_H_1_min
17247                     	xdef	_time_flash_count4
17248                     	xdef	_time_flash_count3
17249                     	xdef	_time_flash_count2
17250                     	xdef	_time_flash_count1
17251                     	xdef	_timer_status
17252                     	xdef	_zone4_step
17253                     	xdef	_zone3_step
17254                     	xdef	_zone2_step
17255                     	xdef	_zone1_step
17256                     	xdef	_count_4_key
17257                     	xdef	_count_3_key
17258                     	xdef	_count_2_key
17259                     	xdef	_count_1_key
17260                     	xdef	_change_count
17261                     	xdef	_cmd_relay_wait
17262                     	xdef	_zone_flash_count4
17263                     	xdef	_zone_flash_count3
17264                     	xdef	_zone_flash_count2
17265                     	xdef	_zone_flash_count1
17266                     	xdef	_idle_count
17267                     	xdef	_key_initial_count
17268                     	xdef	_lock_dis_cnt
17269                     	xdef	_version_dis_cnt
17270                     	xdef	_Disp_buf
17271                     	xdef	_buzzer_cnt_5s
17272                     	xdef	_buzzer_5s_times
17273                     	xdef	_buzzer_cnt_2s
17274                     	xdef	_buzzer_2s_times
17275                     	xdef	_buzzer_cnt_200ms
17276                     	xdef	_buzzer_200ms_times
17277                     	xdef	_buzzer_account
17278                     	xdef	_buzzer_time
17279                     	xdef	_lock_flash_accout
17280                     	xdef	_lock_bz
17281                     	xdef	_on4_bz
17282                     	xdef	_on3_bz
17283                     	xdef	_on2_bz
17284                     	xdef	_on1_bz
17285                     	xdef	_Power_on_bz
17286                     	xdef	_Prepare_data_bz
17287                     	xdef	_timer4_min_flg
17288                     	xdef	_timer4_1min_cnt
17289                     	xdef	_timer3_min_flg
17290                     	xdef	_timer3_1min_cnt
17291                     	xdef	_timer2_min_flg
17292                     	xdef	_timer2_1min_cnt
17293                     	xdef	_timer1_min_flg
17294                     	xdef	_timer1_1min_cnt
17295                     	xdef	__10ms_cnt
17296                     	xdef	_sec_LockFlag
17297                     	xdef	_Time_dot_bz
17298                     	xdef	_Min_bz
17299                     	xdef	_Sec_bz
17300                     	xdef	_timer_precise_bz
17301                     	switch	.ubsct
17302  0000               _min_counter:
17303  0000 00            	ds.b	1
17304                     	xdef	_min_counter
17305  0001               _sec_counter:
17306  0001 00            	ds.b	1
17307                     	xdef	_sec_counter
17308  0002               _ms10_counter:
17309  0002 00            	ds.b	1
17310                     	xdef	_ms10_counter
17311                     	xdef	_Flash_500ms_bz
17312                     	xdef	_Ms10_bz7
17313                     	xdef	_Ms10_bz6
17314                     	xdef	_Ms10_bz5
17315                     	xdef	_Ms10_bz4
17316                     	xdef	_Ms10_bz3
17317                     	xdef	_Ms10_bz2
17318                     	xdef	_Ms10_bz1
17319                     	xdef	_relay_delay_bz
17320                     	xdef	_Get_word_4
17321                     	xdef	_Get_word_3
17322                     	xdef	_Get_word_2
17323                     	xdef	_Get_word_1
17324                     	xdef	_max_pwm
17325                     	xdef	_cur_no
17326                     	xdef	_syn_delay
17327                     	xdef	_Add_Status
17328                     	xdef	_bit_comm
17329                     	xref	_IWDG_Enable
17330                     	xref	_IWDG_ReloadCounter
17331                     	xref	_IWDG_SetReload
17332                     	xref	_IWDG_SetPrescaler
17333                     	xref	_IWDG_WriteAccessCmd
17334                     	xref.b	c_lreg
17335                     	xref.b	c_x
17355                     	xref	c_ladd
17356                     	xref	c_xymvx
17357                     	end
