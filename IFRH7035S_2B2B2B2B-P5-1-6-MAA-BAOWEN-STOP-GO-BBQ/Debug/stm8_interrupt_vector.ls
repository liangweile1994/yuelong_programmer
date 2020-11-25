   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  34                     ; 55 @far @interrupt void NonHandledInterrupt (void)
  34                     ; 56 {
  35                     	switch	.text
  36  0000               f_NonHandledInterrupt:
  40                     ; 60 	return;
  43  0000 80            	iret
  67                     ; 63 @far @interrupt void TIM1_UPD_OVF_IRQHandler(void)	//25us  fan motor VF deal
  67                     ; 64 {
  68                     	switch	.text
  69  0001               f_TIM1_UPD_OVF_IRQHandler:
  71  0001 3b0002        	push	c_x+2
  72  0004 be00          	ldw	x,c_x
  73  0006 89            	pushw	x
  74  0007 3b0002        	push	c_y+2
  75  000a be00          	ldw	x,c_y
  76  000c 89            	pushw	x
  79                     ; 65 	vf_fan_deal();
  81  000d cd0000        	call	_vf_fan_deal
  83                     ; 67 	TIM1->SR1 = 0;
  85  0010 725f5255      	clr	21077
  86                     ; 68 	return;
  89  0014 85            	popw	x
  90  0015 bf00          	ldw	c_y,x
  91  0017 320002        	pop	c_y+2
  92  001a 85            	popw	x
  93  001b bf00          	ldw	c_x,x
  94  001d 320002        	pop	c_x+2
  95  0020 80            	iret
 119                     ; 70 @far @interrupt void TIM2_UPD_OVF_IRQHandler(void)	//125us  TX & RX deal
 119                     ; 71 {  
 120                     	switch	.text
 121  0021               f_TIM2_UPD_OVF_IRQHandler:
 123  0021 3b0002        	push	c_x+2
 124  0024 be00          	ldw	x,c_x
 125  0026 89            	pushw	x
 126  0027 3b0002        	push	c_y+2
 127  002a be00          	ldw	x,c_y
 128  002c 89            	pushw	x
 131                     ; 72 	tx_rx_beep_io_deal();
 133  002d cd0000        	call	_tx_rx_beep_io_deal
 135                     ; 73      	TIM2->SR1 = (u8)(~TIM2_IT_UPDATE);
 137  0030 35fe5302      	mov	21250,#254
 138                     ; 74     return;
 141  0034 85            	popw	x
 142  0035 bf00          	ldw	c_y,x
 143  0037 320002        	pop	c_y+2
 144  003a 85            	popw	x
 145  003b bf00          	ldw	c_x,x
 146  003d 320002        	pop	c_x+2
 147  0040 80            	iret
 184                     ; 76 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
 184                     ; 77 {
 185                     	switch	.text
 186  0041               f_TIM4_UPD_OVF_IRQHandler:
 190                     ; 78      Timer4_counter++;
 192  0041 3c00          	inc	_Timer4_counter
 193                     ; 79      switch (Timer4_counter)
 195  0043 b600          	ld	a,_Timer4_counter
 197                     ; 98      		if(sec_counter ==60)   {Min_bz =TRUE;sec_counter=0;}
 198  0045 4a            	dec	a
 199  0046 2718          	jreq	L14
 200  0048 4a            	dec	a
 201  0049 271b          	jreq	L34
 202  004b 4a            	dec	a
 203  004c 271e          	jreq	L54
 204  004e 4a            	dec	a
 205  004f 2721          	jreq	L74
 206  0051 4a            	dec	a
 207  0052 2724          	jreq	L15
 208  0054 4a            	dec	a
 209  0055 2727          	jreq	L35
 210  0057 4a            	dec	a
 211  0058 272a          	jreq	L55
 212  005a a003          	sub	a,#3
 213  005c 272c          	jreq	L75
 214  005e 206a          	jra	L37
 215  0060               L14:
 216                     ; 81      	case 1 :  Ms10_bz1 =TRUE; break;
 218  0060 35010000      	mov	_Ms10_bz1,#1
 221  0064 2064          	jra	L37
 222  0066               L34:
 223                     ; 82      	case 2 :  Ms10_bz2 =TRUE; break;
 225  0066 35010000      	mov	_Ms10_bz2,#1
 228  006a 205e          	jra	L37
 229  006c               L54:
 230                     ; 83      	case 3 :  Ms10_bz3 =TRUE; break;
 232  006c 35010000      	mov	_Ms10_bz3,#1
 235  0070 2058          	jra	L37
 236  0072               L74:
 237                     ; 84      	case 4 :  Ms10_bz4 =TRUE; break;
 239  0072 35010000      	mov	_Ms10_bz4,#1
 242  0076 2052          	jra	L37
 243  0078               L15:
 244                     ; 85      	case 5 :  Ms10_bz5 =TRUE; break;
 246  0078 35010000      	mov	_Ms10_bz5,#1
 249  007c 204c          	jra	L37
 250  007e               L35:
 251                     ; 86      	case 6 :  Ms10_bz6 =TRUE; break;
 253  007e 35010000      	mov	_Ms10_bz6,#1
 256  0082 2046          	jra	L37
 257  0084               L55:
 258                     ; 87      	case 7 :  Ms10_bz7 =TRUE; break;
 260  0084 35010000      	mov	_Ms10_bz7,#1
 263  0088 2040          	jra	L37
 264  008a               L75:
 265                     ; 90      	case 10: 
 265                     ; 91   //   		Ms10_bz10 =TRUE;
 265                     ; 92      		Timer4_counter =0;
 267  008a 3f00          	clr	_Timer4_counter
 268                     ; 93      		ms10_counter++;      
 270  008c 3c00          	inc	_ms10_counter
 271                     ; 94     		if(ms10_counter ==49) Prepare_data_bz =TRUE;
 273  008e b600          	ld	a,_ms10_counter
 274  0090 a131          	cp	a,#49
 275  0092 2604          	jrne	L57
 278  0094 35010000      	mov	_Prepare_data_bz,#1
 279  0098               L57:
 280                     ; 95      		if(ms10_counter ==50) Flash_500ms_bz =TRUE;
 282  0098 b600          	ld	a,_ms10_counter
 283  009a a132          	cp	a,#50
 284  009c 2604          	jrne	L77
 287  009e 35010000      	mov	_Flash_500ms_bz,#1
 288  00a2               L77:
 289                     ; 96      		if(ms10_counter ==99) Prepare_data_bz =TRUE;
 291  00a2 b600          	ld	a,_ms10_counter
 292  00a4 a163          	cp	a,#99
 293  00a6 2604          	jrne	L101
 296  00a8 35010000      	mov	_Prepare_data_bz,#1
 297  00ac               L101:
 298                     ; 97      		if(ms10_counter ==100) {Sec_bz =TRUE;Flash_500ms_bz =TRUE;ms10_counter =0;sec_counter++;}
 300  00ac b600          	ld	a,_ms10_counter
 301  00ae a164          	cp	a,#100
 302  00b0 260c          	jrne	L301
 305  00b2 35010000      	mov	_Sec_bz,#1
 308  00b6 35010000      	mov	_Flash_500ms_bz,#1
 311  00ba 3f00          	clr	_ms10_counter
 314  00bc 3c00          	inc	_sec_counter
 315  00be               L301:
 316                     ; 98      		if(sec_counter ==60)   {Min_bz =TRUE;sec_counter=0;}
 318  00be b600          	ld	a,_sec_counter
 319  00c0 a13c          	cp	a,#60
 320  00c2 2606          	jrne	L37
 323  00c4 35010000      	mov	_Min_bz,#1
 326  00c8 3f00          	clr	_sec_counter
 327  00ca               L37:
 328                     ; 100     TIM4->SR1 = (u8)(~TIM4_IT_UPDATE);
 330  00ca 35fe5342      	mov	21314,#254
 331                     ; 101     return;
 334  00ce 80            	iret
 336                     .const:	section	.text
 337  0000               __vectab:
 338  0000 82            	dc.b	130
 340  0001 00            	dc.b	page(__stext)
 341  0002 0000          	dc.w	__stext
 342  0004 82            	dc.b	130
 344  0005 00            	dc.b	page(f_NonHandledInterrupt)
 345  0006 0000          	dc.w	f_NonHandledInterrupt
 346  0008 82            	dc.b	130
 348  0009 00            	dc.b	page(f_NonHandledInterrupt)
 349  000a 0000          	dc.w	f_NonHandledInterrupt
 350  000c 82            	dc.b	130
 352  000d 00            	dc.b	page(f_NonHandledInterrupt)
 353  000e 0000          	dc.w	f_NonHandledInterrupt
 354  0010 82            	dc.b	130
 356  0011 00            	dc.b	page(f_NonHandledInterrupt)
 357  0012 0000          	dc.w	f_NonHandledInterrupt
 358  0014 82            	dc.b	130
 360  0015 00            	dc.b	page(f_NonHandledInterrupt)
 361  0016 0000          	dc.w	f_NonHandledInterrupt
 362  0018 82            	dc.b	130
 364  0019 00            	dc.b	page(f_NonHandledInterrupt)
 365  001a 0000          	dc.w	f_NonHandledInterrupt
 366  001c 82            	dc.b	130
 368  001d 00            	dc.b	page(f_NonHandledInterrupt)
 369  001e 0000          	dc.w	f_NonHandledInterrupt
 370  0020 82            	dc.b	130
 372  0021 00            	dc.b	page(f_NonHandledInterrupt)
 373  0022 0000          	dc.w	f_NonHandledInterrupt
 374  0024 82            	dc.b	130
 376  0025 00            	dc.b	page(f_NonHandledInterrupt)
 377  0026 0000          	dc.w	f_NonHandledInterrupt
 378  0028 82            	dc.b	130
 380  0029 00            	dc.b	page(f_NonHandledInterrupt)
 381  002a 0000          	dc.w	f_NonHandledInterrupt
 382  002c 82            	dc.b	130
 384  002d 00            	dc.b	page(f_NonHandledInterrupt)
 385  002e 0000          	dc.w	f_NonHandledInterrupt
 386  0030 82            	dc.b	130
 388  0031 00            	dc.b	page(f_NonHandledInterrupt)
 389  0032 0000          	dc.w	f_NonHandledInterrupt
 390  0034 82            	dc.b	130
 392  0035 01            	dc.b	page(f_TIM1_UPD_OVF_IRQHandler)
 393  0036 0001          	dc.w	f_TIM1_UPD_OVF_IRQHandler
 394  0038 82            	dc.b	130
 396  0039 00            	dc.b	page(f_NonHandledInterrupt)
 397  003a 0000          	dc.w	f_NonHandledInterrupt
 398  003c 82            	dc.b	130
 400  003d 21            	dc.b	page(f_TIM2_UPD_OVF_IRQHandler)
 401  003e 0021          	dc.w	f_TIM2_UPD_OVF_IRQHandler
 402  0040 82            	dc.b	130
 404  0041 00            	dc.b	page(f_NonHandledInterrupt)
 405  0042 0000          	dc.w	f_NonHandledInterrupt
 406  0044 82            	dc.b	130
 408  0045 00            	dc.b	page(f_NonHandledInterrupt)
 409  0046 0000          	dc.w	f_NonHandledInterrupt
 410  0048 82            	dc.b	130
 412  0049 00            	dc.b	page(f_NonHandledInterrupt)
 413  004a 0000          	dc.w	f_NonHandledInterrupt
 414  004c 82            	dc.b	130
 416  004d 00            	dc.b	page(f_NonHandledInterrupt)
 417  004e 0000          	dc.w	f_NonHandledInterrupt
 418  0050 82            	dc.b	130
 420  0051 00            	dc.b	page(f_NonHandledInterrupt)
 421  0052 0000          	dc.w	f_NonHandledInterrupt
 422  0054 82            	dc.b	130
 424  0055 00            	dc.b	page(f_NonHandledInterrupt)
 425  0056 0000          	dc.w	f_NonHandledInterrupt
 426  0058 82            	dc.b	130
 428  0059 00            	dc.b	page(f_NonHandledInterrupt)
 429  005a 0000          	dc.w	f_NonHandledInterrupt
 430  005c 82            	dc.b	130
 432  005d 00            	dc.b	page(f_NonHandledInterrupt)
 433  005e 0000          	dc.w	f_NonHandledInterrupt
 434  0060 82            	dc.b	130
 436  0061 00            	dc.b	page(f_NonHandledInterrupt)
 437  0062 0000          	dc.w	f_NonHandledInterrupt
 438  0064 82            	dc.b	130
 440  0065 41            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 441  0066 0041          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 442  0068 82            	dc.b	130
 444  0069 00            	dc.b	page(f_NonHandledInterrupt)
 445  006a 0000          	dc.w	f_NonHandledInterrupt
 446  006c 82            	dc.b	130
 448  006d 00            	dc.b	page(f_NonHandledInterrupt)
 449  006e 0000          	dc.w	f_NonHandledInterrupt
 450  0070 82            	dc.b	130
 452  0071 00            	dc.b	page(f_NonHandledInterrupt)
 453  0072 0000          	dc.w	f_NonHandledInterrupt
 454  0074 82            	dc.b	130
 456  0075 00            	dc.b	page(f_NonHandledInterrupt)
 457  0076 0000          	dc.w	f_NonHandledInterrupt
 458  0078 82            	dc.b	130
 460  0079 00            	dc.b	page(f_NonHandledInterrupt)
 461  007a 0000          	dc.w	f_NonHandledInterrupt
 462  007c 82            	dc.b	130
 464  007d 00            	dc.b	page(f_NonHandledInterrupt)
 465  007e 0000          	dc.w	f_NonHandledInterrupt
 525                     	xdef	__vectab
 526                     	xref	__stext
 527                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 528                     	xdef	f_TIM2_UPD_OVF_IRQHandler
 529                     	xdef	f_TIM1_UPD_OVF_IRQHandler
 530                     	xdef	f_NonHandledInterrupt
 531                     	xref	_tx_rx_beep_io_deal
 532                     	xref	_vf_fan_deal
 533                     	switch	.ubsct
 534  0000               _Timer4_counter:
 535  0000 00            	ds.b	1
 536                     	xdef	_Timer4_counter
 537                     	xref.b	_sec_counter
 538                     	xref.b	_ms10_counter
 539                     	xref.b	_Prepare_data_bz
 540                     	xref.b	_Min_bz
 541                     	xref.b	_Sec_bz
 542                     	xref.b	_Flash_500ms_bz
 543                     	xref.b	_Ms10_bz7
 544                     	xref.b	_Ms10_bz6
 545                     	xref.b	_Ms10_bz5
 546                     	xref.b	_Ms10_bz4
 547                     	xref.b	_Ms10_bz3
 548                     	xref.b	_Ms10_bz2
 549                     	xref.b	_Ms10_bz1
 550                     	xref.b	c_x
 551                     	xref.b	c_y
 571                     	end
