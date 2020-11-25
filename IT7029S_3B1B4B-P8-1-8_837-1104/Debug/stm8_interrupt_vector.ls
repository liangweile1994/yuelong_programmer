   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _Led_counter:
   6  0000 00            	dc.b	0
  37                     ; 75 @far @interrupt void NonHandledInterrupt (void)
  37                     ; 76 {
  38                     	switch	.text
  39  0000               f_NonHandledInterrupt:
  43                     ; 80 	return;
  46  0000 80            	iret
  70                     ; 83 @far @interrupt void TIM1_UPD_OVF_IRQHandler(void)	//1.6ms  fan motor VF deal
  70                     ; 84 {
  71                     	switch	.text
  72  0001               f_TIM1_UPD_OVF_IRQHandler:
  74  0001 3b0002        	push	c_x+2
  75  0004 be00          	ldw	x,c_x
  76  0006 89            	pushw	x
  77  0007 3b0002        	push	c_y+2
  78  000a be00          	ldw	x,c_y
  79  000c 89            	pushw	x
  82                     ; 85 	vf_fan_deal();
  84  000d cd0000        	call	_vf_fan_deal
  86                     ; 87 	TIM1->SR1 = 0;
  88  0010 725f5255      	clr	21077
  89                     ; 88 	return;
  92  0014 85            	popw	x
  93  0015 bf00          	ldw	c_y,x
  94  0017 320002        	pop	c_y+2
  95  001a 85            	popw	x
  96  001b bf00          	ldw	c_x,x
  97  001d 320002        	pop	c_x+2
  98  0020 80            	iret
 122                     ; 90 @far @interrupt void TIM2_UPD_OVF_IRQHandler(void)	//125us  TX & RX deal
 122                     ; 91 {  
 123                     	switch	.text
 124  0021               f_TIM2_UPD_OVF_IRQHandler:
 126  0021 3b0002        	push	c_x+2
 127  0024 be00          	ldw	x,c_x
 128  0026 89            	pushw	x
 129  0027 3b0002        	push	c_y+2
 130  002a be00          	ldw	x,c_y
 131  002c 89            	pushw	x
 134                     ; 92 	tx_rx_beep_io_deal();
 136  002d cd0000        	call	_tx_rx_beep_io_deal
 138                     ; 99      	TIM2->SR1 = (u8)(~TIM2_IT_UPDATE);
 140  0030 35fe5302      	mov	21250,#254
 141                     ; 100     return;
 144  0034 85            	popw	x
 145  0035 bf00          	ldw	c_y,x
 146  0037 320002        	pop	c_y+2
 147  003a 85            	popw	x
 148  003b bf00          	ldw	c_x,x
 149  003d 320002        	pop	c_x+2
 150  0040 80            	iret
 202                     ; 102 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
 202                     ; 103 {
 203                     	switch	.text
 204  0041               f_TIM4_UPD_OVF_IRQHandler:
 208                     ; 106      Timer4_counter++;
 210  0041 3c00          	inc	_Timer4_counter
 211                     ; 107      switch (Timer4_counter)
 213  0043 b600          	ld	a,_Timer4_counter
 215                     ; 158 					sec_counter=0;
 216  0045 4a            	dec	a
 217  0046 271a          	jreq	L14
 218  0048 4a            	dec	a
 219  0049 271f          	jreq	L34
 220  004b 4a            	dec	a
 221  004c 2724          	jreq	L54
 222  004e 4a            	dec	a
 223  004f 2729          	jreq	L74
 224  0051 4a            	dec	a
 225  0052 272e          	jreq	L15
 226  0054 4a            	dec	a
 227  0055 2733          	jreq	L35
 228  0057 4a            	dec	a
 229  0058 2738          	jreq	L55
 230  005a a003          	sub	a,#3
 231  005c 273c          	jreq	L75
 232  005e ac5c015c      	jpf	L37
 233  0062               L14:
 234                     ; 109      	case 1 :  Ms10_bz1 =TRUE; break;
 236  0062 35010000      	mov	_Ms10_bz1,#1
 239  0066 ac5c015c      	jpf	L37
 240  006a               L34:
 241                     ; 110      	case 2 :  Ms10_bz2 =TRUE; break;
 243  006a 35010000      	mov	_Ms10_bz2,#1
 246  006e ac5c015c      	jpf	L37
 247  0072               L54:
 248                     ; 111      	case 3 :  Ms10_bz3 =TRUE; break;
 250  0072 35010000      	mov	_Ms10_bz3,#1
 253  0076 ac5c015c      	jpf	L37
 254  007a               L74:
 255                     ; 112      	case 4 :  Ms10_bz4 =TRUE; break;
 257  007a 35010000      	mov	_Ms10_bz4,#1
 260  007e ac5c015c      	jpf	L37
 261  0082               L15:
 262                     ; 113      	case 5 :  Ms10_bz5 =TRUE; break;
 264  0082 35010000      	mov	_Ms10_bz5,#1
 267  0086 ac5c015c      	jpf	L37
 268  008a               L35:
 269                     ; 114      	case 6 :  Ms10_bz6 =TRUE; break;
 271  008a 35010000      	mov	_Ms10_bz6,#1
 274  008e ac5c015c      	jpf	L37
 275  0092               L55:
 276                     ; 115      	case 7 :  Ms10_bz7 =TRUE; break;
 278  0092 35010000      	mov	_Ms10_bz7,#1
 281  0096 ac5c015c      	jpf	L37
 282  009a               L75:
 283                     ; 118      	case 10: 
 283                     ; 119   //   		Ms10_bz10 =TRUE;
 283                     ; 120      		Timer4_counter =0;
 285  009a 3f00          	clr	_Timer4_counter
 286                     ; 121 				if(++_10ms_cnt >= 100)
 288  009c 3c00          	inc	__10ms_cnt
 289  009e b600          	ld	a,__10ms_cnt
 290  00a0 a164          	cp	a,#100
 291  00a2 2516          	jrult	L57
 292                     ; 123 					_10ms_cnt = 0;
 294  00a4 3f00          	clr	__10ms_cnt
 295                     ; 124 					if(lock_dis_cnt)      lock_dis_cnt--;
 297  00a6 725d0000      	tnz	_lock_dis_cnt
 298  00aa 2704          	jreq	L77
 301  00ac 725a0000      	dec	_lock_dis_cnt
 302  00b0               L77:
 303                     ; 125 					if(version_dis_cnt)   version_dis_cnt--;
 305  00b0 725d0000      	tnz	_version_dis_cnt
 306  00b4 2704          	jreq	L57
 309  00b6 725a0000      	dec	_version_dis_cnt
 310  00ba               L57:
 311                     ; 128      		ms10_counter++;      
 313  00ba 3c00          	inc	_ms10_counter
 314                     ; 129     		if(ms10_counter ==49) Prepare_data_bz =TRUE;
 316  00bc b600          	ld	a,_ms10_counter
 317  00be a131          	cp	a,#49
 318  00c0 2604          	jrne	L301
 321  00c2 35010000      	mov	_Prepare_data_bz,#1
 322  00c6               L301:
 323                     ; 130      		if(ms10_counter ==50) Flash_500ms_bz =TRUE;
 325  00c6 b600          	ld	a,_ms10_counter
 326  00c8 a132          	cp	a,#50
 327  00ca 2604          	jrne	L501
 330  00cc 35010000      	mov	_Flash_500ms_bz,#1
 331  00d0               L501:
 332                     ; 131      		if(ms10_counter ==99) Prepare_data_bz =TRUE;
 334  00d0 b600          	ld	a,_ms10_counter
 335  00d2 a163          	cp	a,#99
 336  00d4 2604          	jrne	L701
 339  00d6 35010000      	mov	_Prepare_data_bz,#1
 340  00da               L701:
 341                     ; 132      		if(ms10_counter ==100)//1Ãë
 343  00da b600          	ld	a,_ms10_counter
 344  00dc a164          	cp	a,#100
 345  00de 2670          	jrne	L111
 346                     ; 134 					Sec_bz =TRUE;
 348  00e0 35010000      	mov	_Sec_bz,#1
 349                     ; 135 					Flash_500ms_bz =TRUE;
 351  00e4 35010000      	mov	_Flash_500ms_bz,#1
 352                     ; 136 					ms10_counter =0;
 354  00e8 3f00          	clr	_ms10_counter
 355                     ; 137 					sec_counter++;
 357  00ea 3c00          	inc	_sec_counter
 358                     ; 138 					if(zone_1_nopan_flg == FALSE)
 360  00ec 725d0000      	tnz	_zone_1_nopan_flg
 361  00f0 2613          	jrne	L311
 362                     ; 140 						if(++timer1_1min_cnt >= 60) timer1_1min_cnt = 0, timer1_min_flg = TRUE;
 364  00f2 725c0000      	inc	_timer1_1min_cnt
 365  00f6 c60000        	ld	a,_timer1_1min_cnt
 366  00f9 a13c          	cp	a,#60
 367  00fb 2508          	jrult	L311
 370  00fd 725f0000      	clr	_timer1_1min_cnt
 371  0101 35010000      	mov	_timer1_min_flg,#1
 372  0105               L311:
 373                     ; 142 					if(zone_2_nopan_flg == FALSE)
 375  0105 725d0000      	tnz	_zone_2_nopan_flg
 376  0109 2613          	jrne	L711
 377                     ; 144 						if(++timer2_1min_cnt >= 60) timer2_1min_cnt = 0, timer2_min_flg = TRUE;
 379  010b 725c0000      	inc	_timer2_1min_cnt
 380  010f c60000        	ld	a,_timer2_1min_cnt
 381  0112 a13c          	cp	a,#60
 382  0114 2508          	jrult	L711
 385  0116 725f0000      	clr	_timer2_1min_cnt
 386  011a 35010000      	mov	_timer2_min_flg,#1
 387  011e               L711:
 388                     ; 146 					if(zone_3_nopan_flg == FALSE)
 390  011e 725d0000      	tnz	_zone_3_nopan_flg
 391  0122 2613          	jrne	L321
 392                     ; 148 						if(++timer3_1min_cnt >= 60) timer3_1min_cnt = 0, timer3_min_flg = TRUE;
 394  0124 725c0000      	inc	_timer3_1min_cnt
 395  0128 c60000        	ld	a,_timer3_1min_cnt
 396  012b a13c          	cp	a,#60
 397  012d 2508          	jrult	L321
 400  012f 725f0000      	clr	_timer3_1min_cnt
 401  0133 35010000      	mov	_timer3_min_flg,#1
 402  0137               L321:
 403                     ; 150 					if(zone_4_nopan_flg == FALSE)
 405  0137 725d0000      	tnz	_zone_4_nopan_flg
 406  013b 2613          	jrne	L111
 407                     ; 152 						if(++timer4_1min_cnt >= 60) timer4_1min_cnt = 0, timer4_min_flg = TRUE;
 409  013d 725c0000      	inc	_timer4_1min_cnt
 410  0141 c60000        	ld	a,_timer4_1min_cnt
 411  0144 a13c          	cp	a,#60
 412  0146 2508          	jrult	L111
 415  0148 725f0000      	clr	_timer4_1min_cnt
 416  014c 35010000      	mov	_timer4_min_flg,#1
 417  0150               L111:
 418                     ; 155      		if(sec_counter ==60)
 420  0150 b600          	ld	a,_sec_counter
 421  0152 a13c          	cp	a,#60
 422  0154 2606          	jrne	L37
 423                     ; 157 					Min_bz =TRUE;
 425  0156 35010000      	mov	_Min_bz,#1
 426                     ; 158 					sec_counter=0;
 428  015a 3f00          	clr	_sec_counter
 429  015c               L37:
 430                     ; 161     TIM4->SR1 = (u8)(~TIM4_IT_UPDATE);
 432  015c 35fe5342      	mov	21314,#254
 433                     ; 162     return;
 436  0160 80            	iret
 438                     .const:	section	.text
 439  0000               __vectab:
 440  0000 82            	dc.b	130
 442  0001 00            	dc.b	page(__stext)
 443  0002 0000          	dc.w	__stext
 444  0004 82            	dc.b	130
 446  0005 00            	dc.b	page(f_NonHandledInterrupt)
 447  0006 0000          	dc.w	f_NonHandledInterrupt
 448  0008 82            	dc.b	130
 450  0009 00            	dc.b	page(f_NonHandledInterrupt)
 451  000a 0000          	dc.w	f_NonHandledInterrupt
 452  000c 82            	dc.b	130
 454  000d 00            	dc.b	page(f_NonHandledInterrupt)
 455  000e 0000          	dc.w	f_NonHandledInterrupt
 456  0010 82            	dc.b	130
 458  0011 00            	dc.b	page(f_NonHandledInterrupt)
 459  0012 0000          	dc.w	f_NonHandledInterrupt
 460  0014 82            	dc.b	130
 462  0015 00            	dc.b	page(f_NonHandledInterrupt)
 463  0016 0000          	dc.w	f_NonHandledInterrupt
 464  0018 82            	dc.b	130
 466  0019 00            	dc.b	page(f_NonHandledInterrupt)
 467  001a 0000          	dc.w	f_NonHandledInterrupt
 468  001c 82            	dc.b	130
 470  001d 00            	dc.b	page(f_NonHandledInterrupt)
 471  001e 0000          	dc.w	f_NonHandledInterrupt
 472  0020 82            	dc.b	130
 474  0021 00            	dc.b	page(f_NonHandledInterrupt)
 475  0022 0000          	dc.w	f_NonHandledInterrupt
 476  0024 82            	dc.b	130
 478  0025 00            	dc.b	page(f_NonHandledInterrupt)
 479  0026 0000          	dc.w	f_NonHandledInterrupt
 480  0028 82            	dc.b	130
 482  0029 00            	dc.b	page(f_NonHandledInterrupt)
 483  002a 0000          	dc.w	f_NonHandledInterrupt
 484  002c 82            	dc.b	130
 486  002d 00            	dc.b	page(f_NonHandledInterrupt)
 487  002e 0000          	dc.w	f_NonHandledInterrupt
 488  0030 82            	dc.b	130
 490  0031 00            	dc.b	page(f_NonHandledInterrupt)
 491  0032 0000          	dc.w	f_NonHandledInterrupt
 492  0034 82            	dc.b	130
 494  0035 01            	dc.b	page(f_TIM1_UPD_OVF_IRQHandler)
 495  0036 0001          	dc.w	f_TIM1_UPD_OVF_IRQHandler
 496  0038 82            	dc.b	130
 498  0039 00            	dc.b	page(f_NonHandledInterrupt)
 499  003a 0000          	dc.w	f_NonHandledInterrupt
 500  003c 82            	dc.b	130
 502  003d 21            	dc.b	page(f_TIM2_UPD_OVF_IRQHandler)
 503  003e 0021          	dc.w	f_TIM2_UPD_OVF_IRQHandler
 504  0040 82            	dc.b	130
 506  0041 00            	dc.b	page(f_NonHandledInterrupt)
 507  0042 0000          	dc.w	f_NonHandledInterrupt
 508  0044 82            	dc.b	130
 510  0045 00            	dc.b	page(f_NonHandledInterrupt)
 511  0046 0000          	dc.w	f_NonHandledInterrupt
 512  0048 82            	dc.b	130
 514  0049 00            	dc.b	page(f_NonHandledInterrupt)
 515  004a 0000          	dc.w	f_NonHandledInterrupt
 516  004c 82            	dc.b	130
 518  004d 00            	dc.b	page(f_NonHandledInterrupt)
 519  004e 0000          	dc.w	f_NonHandledInterrupt
 520  0050 82            	dc.b	130
 522  0051 00            	dc.b	page(f_NonHandledInterrupt)
 523  0052 0000          	dc.w	f_NonHandledInterrupt
 524  0054 82            	dc.b	130
 526  0055 00            	dc.b	page(f_NonHandledInterrupt)
 527  0056 0000          	dc.w	f_NonHandledInterrupt
 528  0058 82            	dc.b	130
 530  0059 00            	dc.b	page(f_NonHandledInterrupt)
 531  005a 0000          	dc.w	f_NonHandledInterrupt
 532  005c 82            	dc.b	130
 534  005d 00            	dc.b	page(f_NonHandledInterrupt)
 535  005e 0000          	dc.w	f_NonHandledInterrupt
 536  0060 82            	dc.b	130
 538  0061 00            	dc.b	page(f_NonHandledInterrupt)
 539  0062 0000          	dc.w	f_NonHandledInterrupt
 540  0064 82            	dc.b	130
 542  0065 41            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 543  0066 0041          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 544  0068 82            	dc.b	130
 546  0069 00            	dc.b	page(f_NonHandledInterrupt)
 547  006a 0000          	dc.w	f_NonHandledInterrupt
 548  006c 82            	dc.b	130
 550  006d 00            	dc.b	page(f_NonHandledInterrupt)
 551  006e 0000          	dc.w	f_NonHandledInterrupt
 552  0070 82            	dc.b	130
 554  0071 00            	dc.b	page(f_NonHandledInterrupt)
 555  0072 0000          	dc.w	f_NonHandledInterrupt
 556  0074 82            	dc.b	130
 558  0075 00            	dc.b	page(f_NonHandledInterrupt)
 559  0076 0000          	dc.w	f_NonHandledInterrupt
 560  0078 82            	dc.b	130
 562  0079 00            	dc.b	page(f_NonHandledInterrupt)
 563  007a 0000          	dc.w	f_NonHandledInterrupt
 564  007c 82            	dc.b	130
 566  007d 00            	dc.b	page(f_NonHandledInterrupt)
 567  007e 0000          	dc.w	f_NonHandledInterrupt
 636                     	xdef	__vectab
 637                     	xref	__stext
 638                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 639                     	xdef	f_TIM2_UPD_OVF_IRQHandler
 640                     	xdef	f_TIM1_UPD_OVF_IRQHandler
 641                     	xdef	f_NonHandledInterrupt
 642                     	xref	_tx_rx_beep_io_deal
 643                     	xref	_vf_fan_deal
 644                     	xdef	_Led_counter
 645                     	switch	.ubsct
 646  0000               _Timer4_counter:
 647  0000 00            	ds.b	1
 648                     	xdef	_Timer4_counter
 649                     	xref	_zone_4_nopan_flg
 650                     	xref	_zone_3_nopan_flg
 651                     	xref	_zone_2_nopan_flg
 652                     	xref	_zone_1_nopan_flg
 653                     	xref	_timer4_min_flg
 654                     	xref	_timer4_1min_cnt
 655                     	xref	_timer3_min_flg
 656                     	xref	_timer3_1min_cnt
 657                     	xref	_timer2_min_flg
 658                     	xref	_timer2_1min_cnt
 659                     	xref	_timer1_min_flg
 660                     	xref	_timer1_1min_cnt
 661                     	xref	_lock_dis_cnt
 662                     	xref	_version_dis_cnt
 663                     	xref.b	_sec_counter
 664                     	xref.b	_ms10_counter
 665                     	xref.b	_Prepare_data_bz
 666                     	xref.b	__10ms_cnt
 667                     	xref.b	_Min_bz
 668                     	xref.b	_Sec_bz
 669                     	xref.b	_Flash_500ms_bz
 670                     	xref.b	_Ms10_bz7
 671                     	xref.b	_Ms10_bz6
 672                     	xref.b	_Ms10_bz5
 673                     	xref.b	_Ms10_bz4
 674                     	xref.b	_Ms10_bz3
 675                     	xref.b	_Ms10_bz2
 676                     	xref.b	_Ms10_bz1
 677                     	xref.b	c_x
 678                     	xref.b	c_y
 698                     	end
