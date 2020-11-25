   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _High_time:
   6  0000 00            	dc.b	0
   7  0001               _Low_time:
   8  0001 00            	dc.b	0
   9  0002               _comm_bit_count:
  10  0002 00            	dc.b	0
  11  0003               _fan_on:
  12  0003 00            	dc.b	0
  53                     ; 39 void tx_rx_beep_io_deal(void)
  53                     ; 40 {
  55                     	switch	.text
  56  0000               _tx_rx_beep_io_deal:
  60                     ; 41 	if(buzzer_time) BEEP_ON; 
  62  0000 3d00          	tnz	_buzzer_time
  63  0002 270a          	jreq	L12
  66  0004 c6500f        	ld	a,20495
  67  0007 a804          	xor	a,	#4
  68  0009 c7500f        	ld	20495,a
  70  000c 2004          	jra	L32
  71  000e               L12:
  72                     ; 42 	else BEEP_OFF;
  74  000e 7215500f      	bres	20495,#2
  75  0012               L32:
  76                     ; 43      	if(comm_status ==0)
  78  0012 3d00          	tnz	_comm_status
  79  0014 2703          	jreq	L01
  80  0016 cc00a5        	jp	L52
  81  0019               L01:
  82                     ; 45      	  comm_list++;    		
  84  0019 3c00          	inc	_comm_list
  85                     ; 47      	  if(comm_list <50) 				TX_1;//start high 50(*125 =6.25ms)
  87  001b b600          	ld	a,_comm_list
  88  001d a132          	cp	a,#50
  89  001f 2404          	jruge	L72
  92  0021 721a500f      	bset	20495,#5
  93  0025               L72:
  94                     ; 48      	  if((comm_list >=50) &&(comm_list <66)) 	TX_0;//start low 16(*125 =2ms)
  96  0025 b600          	ld	a,_comm_list
  97  0027 a132          	cp	a,#50
  98  0029 250a          	jrult	L13
 100  002b b600          	ld	a,_comm_list
 101  002d a142          	cp	a,#66
 102  002f 2404          	jruge	L13
 105  0031 721b500f      	bres	20495,#5
 106  0035               L13:
 107                     ; 49      	  if(comm_list ==66)  
 109  0035 b600          	ld	a,_comm_list
 110  0037 a142          	cp	a,#66
 111  0039 2606          	jrne	L33
 112                     ; 51      		High_time =0;
 114  003b 3f00          	clr	_High_time
 115                     ; 52      		Low_time =0;
 117  003d 3f01          	clr	_Low_time
 118                     ; 53      		comm_bit_count =0;     		
 120  003f 3f02          	clr	_comm_bit_count
 121  0041               L33:
 122                     ; 55      	  if(comm_list >=66)
 124  0041 b600          	ld	a,_comm_list
 125  0043 a142          	cp	a,#66
 126  0045 2403          	jruge	L21
 127  0047 cc0146        	jp	L75
 128  004a               L21:
 129                     ; 57      	  	comm_list =66; 		
 131  004a 35420000      	mov	_comm_list,#66
 132                     ; 58 		if(High_time) {TX_1;High_time--;Low_time =4;} //low 0.5ms
 134  004e 3d00          	tnz	_High_time
 135  0050 270c          	jreq	L73
 138  0052 721a500f      	bset	20495,#5
 141  0056 3a00          	dec	_High_time
 144  0058 35040001      	mov	_Low_time,#4
 146  005c 2032          	jra	L14
 147  005e               L73:
 148                     ; 61 			if(Low_time) {TX_0;Low_time--;}
 150  005e 3d01          	tnz	_Low_time
 151  0060 2708          	jreq	L34
 154  0062 721b500f      	bres	20495,#5
 157  0066 3a01          	dec	_Low_time
 159  0068 2026          	jra	L14
 160  006a               L34:
 161                     ; 64 				if((High_time+Low_time) ==0)
 163  006a b600          	ld	a,_High_time
 164  006c 5f            	clrw	x
 165  006d bb01          	add	a,_Low_time
 166  006f 2401          	jrnc	L6
 167  0071 5c            	incw	x
 168  0072               L6:
 169  0072 02            	rlwa	x,a
 170  0073 5d            	tnzw	x
 171  0074 2610          	jrne	L74
 172                     ; 66 					if(bit_comm &0x80000000) High_time =8;	//high 1.0ms
 174  0076 b600          	ld	a,_bit_comm
 175  0078 a580          	bcp	a,#128
 176  007a 2706          	jreq	L15
 179  007c 35080000      	mov	_High_time,#8
 181  0080 2004          	jra	L74
 182  0082               L15:
 183                     ; 67 			    	    	    		    else High_time =4;	//high 0.5ms
 185  0082 35040000      	mov	_High_time,#4
 186  0086               L74:
 187                     ; 69 				bit_comm<<=1;
 189  0086 3803          	sll	_bit_comm+3
 190  0088 3902          	rlc	_bit_comm+2
 191  008a 3901          	rlc	_bit_comm+1
 192  008c 3900          	rlc	_bit_comm
 193                     ; 70 				comm_bit_count++;
 195  008e 3c02          	inc	_comm_bit_count
 196  0090               L14:
 197                     ; 73 		if(comm_bit_count >=33) {TX_1;comm_status =1;}
 199  0090 b602          	ld	a,_comm_bit_count
 200  0092 a121          	cp	a,#33
 201  0094 2403          	jruge	L41
 202  0096 cc0146        	jp	L75
 203  0099               L41:
 206  0099 721a500f      	bset	20495,#5
 209  009d 35010000      	mov	_comm_status,#1
 210  00a1 ac460146      	jpf	L75
 211  00a5               L52:
 212                     ; 77 	else if((comm_status)&&(comm_status <4))
 214  00a5 3d00          	tnz	_comm_status
 215  00a7 2603          	jrne	L61
 216  00a9 cc0146        	jp	L75
 217  00ac               L61:
 219  00ac b600          	ld	a,_comm_status
 220  00ae a104          	cp	a,#4
 221  00b0 2503          	jrult	L02
 222  00b2 cc0146        	jp	L75
 223  00b5               L02:
 224                     ; 80 	  if(J_RX_1_or_0)   {High_time++;Low_time =0;if(High_time >50) High_time =50;}
 226  00b5 c65010        	ld	a,20496
 227  00b8 a540          	bcp	a,#64
 228  00ba 2710          	jreq	L36
 231  00bc 3c00          	inc	_High_time
 234  00be 3f01          	clr	_Low_time
 237  00c0 b600          	ld	a,_High_time
 238  00c2 a133          	cp	a,#51
 239  00c4 25ec          	jrult	L75
 242  00c6 35320000      	mov	_High_time,#50
 243  00ca 207a          	jra	L75
 244  00cc               L36:
 245                     ; 83 		Low_time++;
 247  00cc 3c01          	inc	_Low_time
 248                     ; 84 			if(Low_time >50) Low_time =50;
 250  00ce b601          	ld	a,_Low_time
 251  00d0 a133          	cp	a,#51
 252  00d2 2504          	jrult	L17
 255  00d4 35320001      	mov	_Low_time,#50
 256  00d8               L17:
 257                     ; 85 			if(Low_time ==2)  
 259  00d8 b601          	ld	a,_Low_time
 260  00da a102          	cp	a,#2
 261  00dc 2668          	jrne	L75
 262                     ; 87 				   if(High_time >30) {comm_bit_count =0;bit_comm =0;} //for start
 264  00de b600          	ld	a,_High_time
 265  00e0 a11f          	cp	a,#31
 266  00e2 250e          	jrult	L57
 269  00e4 3f02          	clr	_comm_bit_count
 272  00e6 ae0000        	ldw	x,#0
 273  00e9 bf02          	ldw	_bit_comm+2,x
 274  00eb ae0000        	ldw	x,#0
 275  00ee bf00          	ldw	_bit_comm,x
 277  00f0 2052          	jra	L77
 278  00f2               L57:
 279                     ; 90 					  if(High_time <6) bit_comm &=0xFFFFFFFE;	//2~4  bit0
 281  00f2 b600          	ld	a,_High_time
 282  00f4 a106          	cp	a,#6
 283  00f6 2406          	jruge	L101
 286  00f8 72110003      	bres	_bit_comm+3,#0
 288  00fc 2004          	jra	L301
 289  00fe               L101:
 290                     ; 91 					              else bit_comm |=0x00000001;	//6~8  bit1		  
 292  00fe 72100003      	bset	_bit_comm+3,#0
 293  0102               L301:
 294                     ; 93 					  if(comm_bit_count <31)  bit_comm<<=1;	
 296  0102 b602          	ld	a,_comm_bit_count
 297  0104 a11f          	cp	a,#31
 298  0106 2408          	jruge	L501
 301  0108 3803          	sll	_bit_comm+3
 302  010a 3902          	rlc	_bit_comm+2
 303  010c 3901          	rlc	_bit_comm+1
 304  010e 3900          	rlc	_bit_comm
 305  0110               L501:
 306                     ; 94 					  comm_bit_count++;					
 308  0110 3c02          	inc	_comm_bit_count
 309                     ; 95 					  if(comm_bit_count ==32) 	
 311  0112 b602          	ld	a,_comm_bit_count
 312  0114 a120          	cp	a,#32
 313  0116 262c          	jrne	L77
 314                     ; 97 						  if(comm_status ==1)
 316  0118 b600          	ld	a,_comm_status
 317  011a a101          	cp	a,#1
 318  011c 260e          	jrne	L111
 319                     ; 99 							Get_word_1 =(u16)(bit_comm>>16);
 321  011e be00          	ldw	x,_bit_comm
 322  0120 bf00          	ldw	_Get_word_1,x
 323                     ; 100 							Get_word_2 =(u16)bit_comm;							
 325  0122 be02          	ldw	x,_bit_comm+2
 326  0124 bf00          	ldw	_Get_word_2,x
 327                     ; 101 							comm_status =2;	
 329  0126 35020000      	mov	_comm_status,#2
 331  012a 200c          	jra	L311
 332  012c               L111:
 333                     ; 105 						  	Get_word_3 =(u16)(bit_comm>>16);
 335  012c be00          	ldw	x,_bit_comm
 336  012e bf00          	ldw	_Get_word_3,x
 337                     ; 106 							Get_word_4 =(u16)bit_comm;
 339  0130 be02          	ldw	x,_bit_comm+2
 340  0132 bf00          	ldw	_Get_word_4,x
 341                     ; 107 							comm_status =4;
 343  0134 35040000      	mov	_comm_status,#4
 344  0138               L311:
 345                     ; 109 						  	comm_bit_count =0;
 347  0138 3f02          	clr	_comm_bit_count
 348                     ; 110 						  	bit_comm =0;					
 350  013a ae0000        	ldw	x,#0
 351  013d bf02          	ldw	_bit_comm+2,x
 352  013f ae0000        	ldw	x,#0
 353  0142 bf00          	ldw	_bit_comm,x
 354  0144               L77:
 355                     ; 113 				  High_time =0;
 357  0144 3f00          	clr	_High_time
 358  0146               L75:
 359                     ; 119 }
 362  0146 81            	ret
 396                     ; 124 void delay(u8 cnt)
 396                     ; 125 {   
 397                     	switch	.text
 398  0147               _delay:
 400  0147 88            	push	a
 401       00000000      OFST:	set	0
 404  0148 2002          	jra	L531
 405  014a               L331:
 406                     ; 127      cnt--;  			/* Decrement counter until it is zero */
 408  014a 0a01          	dec	(OFST+1,sp)
 409  014c               L531:
 410                     ; 126     while (cnt) 
 412  014c 0d01          	tnz	(OFST+1,sp)
 413  014e 26fa          	jrne	L331
 414                     ; 128 }
 417  0150 84            	pop	a
 418  0151 81            	ret
 441                     ; 130 void IIC_initial(void)
 441                     ; 131 {
 442                     	switch	.text
 443  0152               _IIC_initial:
 447                     ; 132   SDA_OUT;
 449  0152 72105007      	bset	20487,#0
 450                     ; 133   SDA_1;
 452  0156 72105005      	bset	20485,#0
 453                     ; 134   SCL_1;
 455  015a 72125005      	bset	20485,#1
 456                     ; 135 }
 459  015e 81            	ret
 482                     ; 137 void IIC1_initial(void)
 482                     ; 138 {
 483                     	switch	.text
 484  015f               _IIC1_initial:
 488                     ; 139   SDA1_OUT;
 490  015f 721c500c      	bset	20492,#6
 491                     ; 140   SDA1_1;
 493  0163 721c500a      	bset	20490,#6
 494                     ; 141   SCL1_1;
 496  0167 721a500a      	bset	20490,#5
 497                     ; 142 }
 500  016b 81            	ret
 524                     ; 143 void Start(void)
 524                     ; 144 {
 525                     	switch	.text
 526  016c               _Start:
 530                     ; 145   SDA_OUT;
 532  016c 72105007      	bset	20487,#0
 533                     ; 146   SDA_1;
 535  0170 72105005      	bset	20485,#0
 536                     ; 147   delay(IIC_DELAY);
 538  0174 a628          	ld	a,#40
 539  0176 adcf          	call	_delay
 541                     ; 148   SCL_1;
 543  0178 72125005      	bset	20485,#1
 544                     ; 149   delay(IIC_DELAY);
 546  017c a628          	ld	a,#40
 547  017e adc7          	call	_delay
 549                     ; 150   SDA_0;
 551  0180 72115005      	bres	20485,#0
 552                     ; 151   delay(IIC_DELAY);
 554  0184 a628          	ld	a,#40
 555  0186 adbf          	call	_delay
 557                     ; 152   SCL_0;
 559  0188 72135005      	bres	20485,#1
 560                     ; 153   delay(IIC_DELAY);
 562  018c a628          	ld	a,#40
 563  018e adb7          	call	_delay
 565                     ; 154 }
 568  0190 81            	ret
 592                     ; 156 void Start1(void)
 592                     ; 157 {
 593                     	switch	.text
 594  0191               _Start1:
 598                     ; 158   SDA1_OUT;
 600  0191 721c500c      	bset	20492,#6
 601                     ; 159   SDA1_1;
 603  0195 721c500a      	bset	20490,#6
 604                     ; 160   delay(IIC_DELAY);
 606  0199 a628          	ld	a,#40
 607  019b adaa          	call	_delay
 609                     ; 161   SCL1_1;
 611  019d 721a500a      	bset	20490,#5
 612                     ; 162   delay(IIC_DELAY);
 614  01a1 a628          	ld	a,#40
 615  01a3 ada2          	call	_delay
 617                     ; 163   SDA1_0;
 619  01a5 721d500a      	bres	20490,#6
 620                     ; 164   delay(IIC_DELAY);
 622  01a9 a628          	ld	a,#40
 623  01ab ad9a          	call	_delay
 625                     ; 165   SCL1_0;
 627  01ad 721b500a      	bres	20490,#5
 628                     ; 166   delay(IIC_DELAY);
 630  01b1 a628          	ld	a,#40
 631  01b3 ad92          	call	_delay
 633                     ; 167 }
 636  01b5 81            	ret
 660                     ; 168 void Stop(void)
 660                     ; 169 {
 661                     	switch	.text
 662  01b6               _Stop:
 666                     ; 170   SDA_0;
 668  01b6 72115005      	bres	20485,#0
 669                     ; 171   delay(IIC_DELAY);
 671  01ba a628          	ld	a,#40
 672  01bc ad89          	call	_delay
 674                     ; 172   SCL_1;
 676  01be 72125005      	bset	20485,#1
 677                     ; 173   delay(IIC_DELAY);
 679  01c2 a628          	ld	a,#40
 680  01c4 ad81          	call	_delay
 682                     ; 174   SDA_1;
 684  01c6 72105005      	bset	20485,#0
 685                     ; 175   delay(IIC_DELAY);
 687  01ca a628          	ld	a,#40
 688  01cc cd0147        	call	_delay
 690                     ; 176 }
 693  01cf 81            	ret
 717                     ; 177 void Stop1(void)
 717                     ; 178 {
 718                     	switch	.text
 719  01d0               _Stop1:
 723                     ; 179   SDA1_0;
 725  01d0 721d500a      	bres	20490,#6
 726                     ; 180   delay(IIC_DELAY);
 728  01d4 a628          	ld	a,#40
 729  01d6 cd0147        	call	_delay
 731                     ; 181   SCL1_1;
 733  01d9 721a500a      	bset	20490,#5
 734                     ; 182   delay(IIC_DELAY);
 736  01dd a628          	ld	a,#40
 737  01df cd0147        	call	_delay
 739                     ; 183   SDA1_1;
 741  01e2 721c500a      	bset	20490,#6
 742                     ; 184   delay(IIC_DELAY);
 744  01e6 a628          	ld	a,#40
 745  01e8 cd0147        	call	_delay
 747                     ; 185 }
 750  01eb 81            	ret
 803                     ; 186 void TX_Byte(u8  WriteData)
 803                     ; 187 {
 804                     	switch	.text
 805  01ec               _TX_Byte:
 807  01ec 89            	pushw	x
 808       00000002      OFST:	set	2
 811                     ; 189   j=WriteData;
 813  01ed 6b02          	ld	(OFST+0,sp),a
 814                     ; 190   SDA_OUT;
 816  01ef 72105007      	bset	20487,#0
 817                     ; 191   for (i=0; i<8; i++)
 819  01f3 0f01          	clr	(OFST-1,sp)
 820  01f5               L742:
 821                     ; 193     if ((j&0x80)==0)
 823  01f5 7b02          	ld	a,(OFST+0,sp)
 824  01f7 a580          	bcp	a,#128
 825  01f9 2606          	jrne	L552
 826                     ; 194     { SDA_0;}
 828  01fb 72115005      	bres	20485,#0
 830  01ff 2004          	jra	L752
 831  0201               L552:
 832                     ; 196     { SDA_1;}
 834  0201 72105005      	bset	20485,#0
 835  0205               L752:
 836                     ; 197     j <<=1;
 838  0205 0802          	sll	(OFST+0,sp)
 839                     ; 198     delay(IIC_DELAY);
 841  0207 a628          	ld	a,#40
 842  0209 cd0147        	call	_delay
 844                     ; 199     SCL_1;
 846  020c 72125005      	bset	20485,#1
 847                     ; 200     delay(IIC_DELAY);
 849  0210 a628          	ld	a,#40
 850  0212 cd0147        	call	_delay
 852                     ; 201     SCL_0;
 854  0215 72135005      	bres	20485,#1
 855                     ; 202     delay(IIC_DELAY);
 857  0219 a628          	ld	a,#40
 858  021b cd0147        	call	_delay
 860                     ; 191   for (i=0; i<8; i++)
 862  021e 0c01          	inc	(OFST-1,sp)
 865  0220 7b01          	ld	a,(OFST-1,sp)
 866  0222 a108          	cp	a,#8
 867  0224 25cf          	jrult	L742
 868                     ; 204 }
 871  0226 85            	popw	x
 872  0227 81            	ret
 925                     ; 206 void TX1_Byte(u8  WriteData)
 925                     ; 207 {
 926                     	switch	.text
 927  0228               _TX1_Byte:
 929  0228 89            	pushw	x
 930       00000002      OFST:	set	2
 933                     ; 209   j=WriteData;
 935  0229 6b02          	ld	(OFST+0,sp),a
 936                     ; 210   SDA1_OUT;
 938  022b 721c500c      	bset	20492,#6
 939                     ; 211   for (i=0; i<8; i++)
 941  022f 0f01          	clr	(OFST-1,sp)
 942  0231               L703:
 943                     ; 213     if ((j&0x80)==0)
 945  0231 7b02          	ld	a,(OFST+0,sp)
 946  0233 a580          	bcp	a,#128
 947  0235 2606          	jrne	L513
 948                     ; 214     { SDA1_0;}
 950  0237 721d500a      	bres	20490,#6
 952  023b 2004          	jra	L713
 953  023d               L513:
 954                     ; 216     { SDA1_1;}
 956  023d 721c500a      	bset	20490,#6
 957  0241               L713:
 958                     ; 217     j <<=1;
 960  0241 0802          	sll	(OFST+0,sp)
 961                     ; 218     delay(IIC_DELAY);
 963  0243 a628          	ld	a,#40
 964  0245 cd0147        	call	_delay
 966                     ; 219     SCL1_1;
 968  0248 721a500a      	bset	20490,#5
 969                     ; 220     delay(IIC_DELAY);
 971  024c a628          	ld	a,#40
 972  024e cd0147        	call	_delay
 974                     ; 221     SCL1_0;
 976  0251 721b500a      	bres	20490,#5
 977                     ; 222     delay(IIC_DELAY);
 979  0255 a628          	ld	a,#40
 980  0257 cd0147        	call	_delay
 982                     ; 211   for (i=0; i<8; i++)
 984  025a 0c01          	inc	(OFST-1,sp)
 987  025c 7b01          	ld	a,(OFST-1,sp)
 988  025e a108          	cp	a,#8
 989  0260 25cf          	jrult	L703
 990                     ; 224 }
 993  0262 85            	popw	x
 994  0263 81            	ret
1038                     ; 225 u8 RX_Byte(void)
1038                     ; 226 {
1039                     	switch	.text
1040  0264               _RX_Byte:
1042  0264 89            	pushw	x
1043       00000002      OFST:	set	2
1046                     ; 228   u8 TempData = 0;
1048  0265 0f02          	clr	(OFST+0,sp)
1049                     ; 229   SDA_IN;
1051  0267 72115007      	bres	20487,#0
1052                     ; 230   for (i=0; i<8; i++)
1054  026b 0f01          	clr	(OFST-1,sp)
1055  026d               L343:
1056                     ; 232     delay(IIC_DELAY);
1058  026d a628          	ld	a,#40
1059  026f cd0147        	call	_delay
1061                     ; 233     SCL_1;
1063  0272 72125005      	bset	20485,#1
1064                     ; 234     delay(IIC_DELAY);
1066  0276 a628          	ld	a,#40
1067  0278 cd0147        	call	_delay
1069                     ; 235     TempData <<= 1;
1071  027b 0802          	sll	(OFST+0,sp)
1072                     ; 236     if(J_SDA_1_or_0)
1074  027d c65006        	ld	a,20486
1075  0280 a501          	bcp	a,#1
1076  0282 2702          	jreq	L153
1077                     ; 237     { TempData++; }
1079  0284 0c02          	inc	(OFST+0,sp)
1080  0286               L153:
1081                     ; 238     SCL_0;
1083  0286 72135005      	bres	20485,#1
1084                     ; 239     delay(IIC_DELAY);
1086  028a a628          	ld	a,#40
1087  028c cd0147        	call	_delay
1089                     ; 230   for (i=0; i<8; i++)
1091  028f 0c01          	inc	(OFST-1,sp)
1094  0291 7b01          	ld	a,(OFST-1,sp)
1095  0293 a108          	cp	a,#8
1096  0295 25d6          	jrult	L343
1097                     ; 241   SDA_OUT;
1099  0297 72105007      	bset	20487,#0
1100                     ; 242   return(TempData);
1102  029b 7b02          	ld	a,(OFST+0,sp)
1105  029d 85            	popw	x
1106  029e 81            	ret
1150                     ; 245 u8 RX1_Byte(void)
1150                     ; 246 {
1151                     	switch	.text
1152  029f               _RX1_Byte:
1154  029f 89            	pushw	x
1155       00000002      OFST:	set	2
1158                     ; 248   u8 TempData = 0;
1160  02a0 0f02          	clr	(OFST+0,sp)
1161                     ; 249   SDA1_IN;
1163  02a2 721d500c      	bres	20492,#6
1164                     ; 250   for (i=0; i<8; i++)
1166  02a6 0f01          	clr	(OFST-1,sp)
1167  02a8               L573:
1168                     ; 252     delay(IIC_DELAY);
1170  02a8 a628          	ld	a,#40
1171  02aa cd0147        	call	_delay
1173                     ; 253     SCL1_1;
1175  02ad 721a500a      	bset	20490,#5
1176                     ; 254     delay(IIC_DELAY);
1178  02b1 a628          	ld	a,#40
1179  02b3 cd0147        	call	_delay
1181                     ; 255     TempData <<= 1;
1183  02b6 0802          	sll	(OFST+0,sp)
1184                     ; 256     if(J_SDA1_1_or_0)
1186  02b8 c6500b        	ld	a,20491
1187  02bb a540          	bcp	a,#64
1188  02bd 2702          	jreq	L304
1189                     ; 257     { TempData++; }
1191  02bf 0c02          	inc	(OFST+0,sp)
1192  02c1               L304:
1193                     ; 258     SCL1_0;
1195  02c1 721b500a      	bres	20490,#5
1196                     ; 259     delay(IIC_DELAY);
1198  02c5 a628          	ld	a,#40
1199  02c7 cd0147        	call	_delay
1201                     ; 250   for (i=0; i<8; i++)
1203  02ca 0c01          	inc	(OFST-1,sp)
1206  02cc 7b01          	ld	a,(OFST-1,sp)
1207  02ce a108          	cp	a,#8
1208  02d0 25d6          	jrult	L573
1209                     ; 261   SDA1_OUT;
1211  02d2 721c500c      	bset	20492,#6
1212                     ; 262   return(TempData);
1214  02d6 7b02          	ld	a,(OFST+0,sp)
1217  02d8 85            	popw	x
1218  02d9 81            	ret
1253                     ; 264 void  ReceiveAck(void)
1253                     ; 265 {
1254                     	switch	.text
1255  02da               _ReceiveAck:
1257  02da 88            	push	a
1258       00000001      OFST:	set	1
1261                     ; 266   u8  k1=0;
1263  02db 0f01          	clr	(OFST+0,sp)
1264                     ; 267   SDA_IN;
1266  02dd 72115007      	bres	20487,#0
1267                     ; 268   SCL_1;
1269  02e1 72125005      	bset	20485,#1
1270                     ; 269   delay(IIC_DELAY);
1272  02e5 a628          	ld	a,#40
1273  02e7 cd0147        	call	_delay
1276  02ea 2017          	jra	L524
1277  02ec               L324:
1278                     ; 272     k1++;
1280  02ec 0c01          	inc	(OFST+0,sp)
1281                     ; 273     if(k1>=250)
1283  02ee 7b01          	ld	a,(OFST+0,sp)
1284  02f0 a1fa          	cp	a,#250
1285  02f2 250f          	jrult	L524
1286                     ; 275       break;
1287  02f4               L724:
1288                     ; 278   SCL_0;
1290  02f4 72135005      	bres	20485,#1
1291                     ; 279   SDA_OUT;
1293  02f8 72105007      	bset	20487,#0
1294                     ; 280   delay(IIC_DELAY);
1296  02fc a628          	ld	a,#40
1297  02fe cd0147        	call	_delay
1299                     ; 286 }
1302  0301 84            	pop	a
1303  0302 81            	ret
1304  0303               L524:
1305                     ; 270   while(J_SDA_1_or_0)
1307  0303 c65006        	ld	a,20486
1308  0306 a501          	bcp	a,#1
1309  0308 26e2          	jrne	L324
1310  030a 20e8          	jra	L724
1345                     ; 288 void  ReceiveAck1(void)
1345                     ; 289 {
1346                     	switch	.text
1347  030c               _ReceiveAck1:
1349  030c 88            	push	a
1350       00000001      OFST:	set	1
1353                     ; 290   u8  k1=0;
1355  030d 0f01          	clr	(OFST+0,sp)
1356                     ; 291   SDA1_IN;
1358  030f 721d500c      	bres	20492,#6
1359                     ; 292   SCL1_1;
1361  0313 721a500a      	bset	20490,#5
1362                     ; 293   delay(IIC_DELAY);
1364  0317 a628          	ld	a,#40
1365  0319 cd0147        	call	_delay
1368  031c 2017          	jra	L354
1369  031e               L154:
1370                     ; 296     k1++;
1372  031e 0c01          	inc	(OFST+0,sp)
1373                     ; 297     if(k1>=250)
1375  0320 7b01          	ld	a,(OFST+0,sp)
1376  0322 a1fa          	cp	a,#250
1377  0324 250f          	jrult	L354
1378                     ; 299       break;
1379  0326               L554:
1380                     ; 302   SCL1_0;
1382  0326 721b500a      	bres	20490,#5
1383                     ; 303   SDA1_OUT;
1385  032a 721c500c      	bset	20492,#6
1386                     ; 304   delay(IIC_DELAY);
1388  032e a628          	ld	a,#40
1389  0330 cd0147        	call	_delay
1391                     ; 310 }
1394  0333 84            	pop	a
1395  0334 81            	ret
1396  0335               L354:
1397                     ; 294   while(J_SDA1_1_or_0)
1399  0335 c6500b        	ld	a,20491
1400  0338 a540          	bcp	a,#64
1401  033a 26e2          	jrne	L154
1402  033c 20e8          	jra	L554
1459                     ; 312 void  APTTouchWrOneData(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
1459                     ; 313 {
1460                     	switch	.text
1461  033e               _APTTouchWrOneData:
1463  033e 89            	pushw	x
1464       00000000      OFST:	set	0
1467                     ; 314    IIC_initial();
1469  033f cd0152        	call	_IIC_initial
1471                     ; 315    Start();
1473  0342 cd016c        	call	_Start
1475                     ; 316    TX_Byte((apt_add<<1)|0x00);
1477  0345 7b01          	ld	a,(OFST+1,sp)
1478  0347 48            	sll	a
1479  0348 cd01ec        	call	_TX_Byte
1481                     ; 317    ReceiveAck();
1483  034b ad8d          	call	_ReceiveAck
1485                     ; 318    TX_Byte(APTWrAdd);
1487  034d 7b02          	ld	a,(OFST+2,sp)
1488  034f cd01ec        	call	_TX_Byte
1490                     ; 319    ReceiveAck();
1492  0352 ad86          	call	_ReceiveAck
1494                     ; 320    TX_Byte(APTWrData);
1496  0354 7b05          	ld	a,(OFST+5,sp)
1497  0356 cd01ec        	call	_TX_Byte
1499                     ; 321    ReceiveAck();
1501  0359 cd02da        	call	_ReceiveAck
1503                     ; 322    Stop();
1505  035c cd01b6        	call	_Stop
1507                     ; 323 }
1510  035f 85            	popw	x
1511  0360 81            	ret
1568                     ; 325 void  APTTouchWrOneData1(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
1568                     ; 326 {
1569                     	switch	.text
1570  0361               _APTTouchWrOneData1:
1572  0361 89            	pushw	x
1573       00000000      OFST:	set	0
1576                     ; 327    IIC1_initial();
1578  0362 cd015f        	call	_IIC1_initial
1580                     ; 328    Start1();
1582  0365 cd0191        	call	_Start1
1584                     ; 329    TX1_Byte((apt_add<<1)|0x00);
1586  0368 7b01          	ld	a,(OFST+1,sp)
1587  036a 48            	sll	a
1588  036b cd0228        	call	_TX1_Byte
1590                     ; 330    ReceiveAck1();
1592  036e ad9c          	call	_ReceiveAck1
1594                     ; 331    TX1_Byte(APTWrAdd);
1596  0370 7b02          	ld	a,(OFST+2,sp)
1597  0372 cd0228        	call	_TX1_Byte
1599                     ; 332    ReceiveAck1();
1601  0375 ad95          	call	_ReceiveAck1
1603                     ; 333    TX1_Byte(APTWrData);
1605  0377 7b05          	ld	a,(OFST+5,sp)
1606  0379 cd0228        	call	_TX1_Byte
1608                     ; 334    ReceiveAck1();
1610  037c ad8e          	call	_ReceiveAck1
1612                     ; 335    Stop1();
1614  037e cd01d0        	call	_Stop1
1616                     ; 336 }
1619  0381 85            	popw	x
1620  0382 81            	ret
1678                     ; 340 u8  APTTouchRdOneData(u8 apt_add,u8 APTRdAdd)
1678                     ; 341 {
1679                     	switch	.text
1680  0383               _APTTouchRdOneData:
1682  0383 89            	pushw	x
1683  0384 88            	push	a
1684       00000001      OFST:	set	1
1687                     ; 342    u8 APTRdData=0;
1689  0385 0f01          	clr	(OFST+0,sp)
1690                     ; 344    IIC_initial();
1692  0387 cd0152        	call	_IIC_initial
1694                     ; 345    Start();
1696  038a cd016c        	call	_Start
1698                     ; 346    TX_Byte((apt_add<<1)|0x00);
1700  038d 7b02          	ld	a,(OFST+1,sp)
1701  038f 48            	sll	a
1702  0390 cd01ec        	call	_TX_Byte
1704                     ; 347    ReceiveAck();
1706  0393 cd02da        	call	_ReceiveAck
1708                     ; 348    TX_Byte(APTRdAdd);
1710  0396 7b03          	ld	a,(OFST+2,sp)
1711  0398 cd01ec        	call	_TX_Byte
1713                     ; 349    ReceiveAck();
1715  039b cd02da        	call	_ReceiveAck
1717                     ; 350    Stop();
1719  039e cd01b6        	call	_Stop
1721                     ; 351    Start();
1723  03a1 cd016c        	call	_Start
1725                     ; 352    TX_Byte((apt_add<<1)|0x01);
1727  03a4 7b02          	ld	a,(OFST+1,sp)
1728  03a6 48            	sll	a
1729  03a7 aa01          	or	a,#1
1730  03a9 cd01ec        	call	_TX_Byte
1732                     ; 353    ReceiveAck();
1734  03ac cd02da        	call	_ReceiveAck
1736                     ; 354    APTRdData=RX_Byte();
1738  03af cd0264        	call	_RX_Byte
1740  03b2 6b01          	ld	(OFST+0,sp),a
1741                     ; 355    Stop();
1743  03b4 cd01b6        	call	_Stop
1745                     ; 356    return(APTRdData);
1747  03b7 7b01          	ld	a,(OFST+0,sp)
1750  03b9 5b03          	addw	sp,#3
1751  03bb 81            	ret
1809                     ; 359 u8  APTTouchRdOneData1(u8 apt_add,u8 APTRdAdd)
1809                     ; 360 {
1810                     	switch	.text
1811  03bc               _APTTouchRdOneData1:
1813  03bc 89            	pushw	x
1814  03bd 88            	push	a
1815       00000001      OFST:	set	1
1818                     ; 361    u8 APTRdData=0;
1820  03be 0f01          	clr	(OFST+0,sp)
1821                     ; 363    IIC1_initial();
1823  03c0 cd015f        	call	_IIC1_initial
1825                     ; 364    Start1();
1827  03c3 cd0191        	call	_Start1
1829                     ; 365    TX1_Byte((apt_add<<1)|0x00);
1831  03c6 7b02          	ld	a,(OFST+1,sp)
1832  03c8 48            	sll	a
1833  03c9 cd0228        	call	_TX1_Byte
1835                     ; 366    ReceiveAck1();
1837  03cc cd030c        	call	_ReceiveAck1
1839                     ; 367    TX1_Byte(APTRdAdd);
1841  03cf 7b03          	ld	a,(OFST+2,sp)
1842  03d1 cd0228        	call	_TX1_Byte
1844                     ; 368    ReceiveAck1();
1846  03d4 cd030c        	call	_ReceiveAck1
1848                     ; 369    Stop1();
1850  03d7 cd01d0        	call	_Stop1
1852                     ; 370    Start1();
1854  03da cd0191        	call	_Start1
1856                     ; 371    TX1_Byte((apt_add<<1)|0x01);
1858  03dd 7b02          	ld	a,(OFST+1,sp)
1859  03df 48            	sll	a
1860  03e0 aa01          	or	a,#1
1861  03e2 cd0228        	call	_TX1_Byte
1863                     ; 372    ReceiveAck1();
1865  03e5 cd030c        	call	_ReceiveAck1
1867                     ; 373    APTRdData=RX1_Byte();
1869  03e8 cd029f        	call	_RX1_Byte
1871  03eb 6b01          	ld	(OFST+0,sp),a
1872                     ; 374    Stop1();
1874  03ed cd01d0        	call	_Stop1
1876                     ; 375    return(APTRdData);
1878  03f0 7b01          	ld	a,(OFST+0,sp)
1881  03f2 5b03          	addw	sp,#3
1882  03f4 81            	ret
1940                     ; 378 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)                
1940                     ; 379 {                                                                                                                                                                                                                         
1941                     	switch	.text
1942  03f5               _IWDG_WriteAccessCmd:
1946                     ; 380     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));                   
1948                     ; 382     IWDG->KR = (u8)IWDG_WriteAccess;                                                                                                               
1950  03f5 c750e0        	ld	20704,a
1951                     ; 383 }                                                                                                                                                                
1954  03f8 81            	ret
2044                     ; 384 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)                      
2044                     ; 385 {                                                                                                                                     
2045                     	switch	.text
2046  03f9               _IWDG_SetPrescaler:
2050                     ; 386     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));                            
2052                     ; 388     IWDG->PR = (u8)IWDG_Prescaler;                                                 
2054  03f9 c750e1        	ld	20705,a
2055                     ; 389 }                                                                                                                                                                
2058  03fc 81            	ret
2092                     ; 390 void IWDG_SetReload(u8 IWDG_Reload)                                                
2092                     ; 391 {                                                                                  
2093                     	switch	.text
2094  03fd               _IWDG_SetReload:
2098                     ; 392     IWDG->RLR = IWDG_Reload;                                                       
2100  03fd c750e2        	ld	20706,a
2101                     ; 393 }                                                                                                                                                                 
2104  0400 81            	ret
2127                     ; 394 void IWDG_ReloadCounter(void)                                                      
2127                     ; 395 {                                                                                  
2128                     	switch	.text
2129  0401               _IWDG_ReloadCounter:
2133                     ; 396     IWDG->KR = IWDG_KEY_REFRESH;                                                   
2135  0401 35aa50e0      	mov	20704,#170
2136                     ; 397 }                                                                                  
2139  0405 81            	ret
2162                     ; 399 void IWDG_Enable(void)                                                             
2162                     ; 400 {                                                                                  
2163                     	switch	.text
2164  0406               _IWDG_Enable:
2168                     ; 401     IWDG->KR = IWDG_KEY_ENABLE;                                                    
2170  0406 35cc50e0      	mov	20704,#204
2171                     ; 402 } 
2174  040a 81            	ret
2219                     ; 404 u8 Check_Unique_ID(void)
2219                     ; 405 {
2220                     	switch	.text
2221  040b               _Check_Unique_ID:
2223  040b 5208          	subw	sp,#8
2224       00000008      OFST:	set	8
2227                     ; 409   UID[0] =*(u8*)(User_option_address+0);
2229  040d c648cd        	ld	a,18637
2230  0410 6b01          	ld	(OFST-7,sp),a
2231                     ; 410   UID[1] =*(u8*)(User_option_address+1);
2233  0412 c648ce        	ld	a,18638
2234  0415 6b02          	ld	(OFST-6,sp),a
2235                     ; 411   UID[2] =*(u8*)(User_option_address+2);
2237  0417 c648cf        	ld	a,18639
2238  041a 6b03          	ld	(OFST-5,sp),a
2239                     ; 412   UID[3] =*(u8*)(User_option_address+3);
2241  041c c648d0        	ld	a,18640
2242  041f 6b04          	ld	(OFST-4,sp),a
2243                     ; 414   Result[0] =0x82&UID[0];
2245  0421 7b01          	ld	a,(OFST-7,sp)
2246  0423 a482          	and	a,#130
2247  0425 6b05          	ld	(OFST-3,sp),a
2248                     ; 415   Result[1] =0x19&UID[1];
2250  0427 7b02          	ld	a,(OFST-6,sp)
2251  0429 a419          	and	a,#25
2252  042b 6b06          	ld	(OFST-2,sp),a
2253                     ; 416   Result[2] =0xAA&UID[2];
2255  042d 7b03          	ld	a,(OFST-5,sp)
2256  042f a4aa          	and	a,#170
2257  0431 6b07          	ld	(OFST-1,sp),a
2258                     ; 417   Result[3] =0x55&UID[3];
2260  0433 7b04          	ld	a,(OFST-4,sp)
2261  0435 a455          	and	a,#85
2262  0437 6b08          	ld	(OFST+0,sp),a
2263                     ; 419   if(((*(u8*)(0xFF00+0))==Result[0])&&((*(u8*)(0xFF00+1))==Result[1])&&((*(u8*)(0xFF00+2))==Result[2])&&((*(u8*)(0xFF00+3))==Result[3]))  return(0);
2265  0439 c6ff00        	ld	a,65280
2266  043c 1105          	cp	a,(OFST-3,sp)
2267  043e 2618          	jrne	L757
2269  0440 c6ff01        	ld	a,65281
2270  0443 1106          	cp	a,(OFST-2,sp)
2271  0445 2611          	jrne	L757
2273  0447 c6ff02        	ld	a,65282
2274  044a 1107          	cp	a,(OFST-1,sp)
2275  044c 260a          	jrne	L757
2277  044e c6ff03        	ld	a,65283
2278  0451 1108          	cp	a,(OFST+0,sp)
2279  0453 2603          	jrne	L757
2282  0455 4f            	clr	a
2284  0456 2002          	jra	L001
2285  0458               L757:
2286                     ; 420   else return(1); 	
2288  0458 a601          	ld	a,#1
2290  045a               L001:
2292  045a 5b08          	addw	sp,#8
2293  045c 81            	ret
2318                     ; 423 void vf_fan_deal(void)
2318                     ; 424 {
2319                     	switch	.text
2320  045d               _vf_fan_deal:
2324                     ; 425 	fan_on++;
2326  045d 3c03          	inc	_fan_on
2327                     ; 426 	if(fan_on >=4) fan_on =0;
2329  045f b603          	ld	a,_fan_on
2330  0461 a104          	cp	a,#4
2331  0463 2502          	jrult	L377
2334  0465 3f03          	clr	_fan_on
2335  0467               L377:
2336                     ; 427 	if(fan_on >=fan_status)  FAN_OFF;
2338  0467 b603          	ld	a,_fan_on
2339  0469 b100          	cp	a,_fan_status
2340  046b 2506          	jrult	L577
2343  046d 7219500f      	bres	20495,#4
2345  0471 2004          	jra	L777
2346  0473               L577:
2347                     ; 428 	else 	FAN_ON;
2349  0473 7218500f      	bset	20495,#4
2350  0477               L777:
2351                     ; 429 }
2354  0477 81            	ret
2397                     ; 431 u8 flex_ntc_deal(u8 par,u8 data)
2397                     ; 432 {
2398                     	switch	.text
2399  0478               _flex_ntc_deal:
2401  0478 89            	pushw	x
2402       00000000      OFST:	set	0
2405                     ; 433 	if((par ==2)||(par ==4))  data |=0x80;			//bit8 ->1 -> flex NTC
2407  0479 9e            	ld	a,xh
2408  047a a102          	cp	a,#2
2409  047c 2705          	jreq	L5201
2411  047e 9e            	ld	a,xh
2412  047f a104          	cp	a,#4
2413  0481 2606          	jrne	L3201
2414  0483               L5201:
2417  0483 7b02          	ld	a,(OFST+2,sp)
2418  0485 aa80          	or	a,#128
2419  0487 6b02          	ld	(OFST+2,sp),a
2420  0489               L3201:
2421                     ; 434 				  data |=0x40;			//bit7 ->1 -> PWM direct setting mode
2423  0489 7b02          	ld	a,(OFST+2,sp)
2424  048b aa40          	or	a,#64
2425  048d 6b02          	ld	(OFST+2,sp),a
2426                     ; 435 	return(data);
2428  048f 7b02          	ld	a,(OFST+2,sp)
2431  0491 85            	popw	x
2432  0492 81            	ret
2484                     ; 438 u8 zone_x_cur_no_set(u8 par,u8 count_ppg)
2484                     ; 439 {
2485                     	switch	.text
2486  0493               _zone_x_cur_no_set:
2488  0493 89            	pushw	x
2489  0494 88            	push	a
2490       00000001      OFST:	set	1
2493                     ; 440   u8 result =0;
2495  0495 0f01          	clr	(OFST+0,sp)
2496                     ; 441   if(par %2)		//1# 3#
2498  0497 9e            	ld	a,xh
2499  0498 a501          	bcp	a,#1
2500  049a 2730          	jreq	L5501
2501                     ; 443   result =CON_NO_CUR1_MIN;
2503  049c a620          	ld	a,#32
2504  049e 6b01          	ld	(OFST+0,sp),a
2505                     ; 444   if((count_ppg >=CON_PWM_20us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR1_LOW;	//17US<PPG<20US 
2507  04a0 7b03          	ld	a,(OFST+2,sp)
2508  04a2 a160          	cp	a,#96
2509  04a4 250a          	jrult	L7501
2511  04a6 7b03          	ld	a,(OFST+2,sp)
2512  04a8 a178          	cp	a,#120
2513  04aa 2404          	jruge	L7501
2516  04ac a630          	ld	a,#48
2517  04ae 6b01          	ld	(OFST+0,sp),a
2518  04b0               L7501:
2519                     ; 445   if((count_ppg >=CON_PWM_23us)&&(count_ppg <CON_PWM_20us)) 	result =CON_NO_CUR1_MID;	//20US<PPG<23US 
2521  04b0 7b03          	ld	a,(OFST+2,sp)
2522  04b2 a148          	cp	a,#72
2523  04b4 250a          	jrult	L1601
2525  04b6 7b03          	ld	a,(OFST+2,sp)
2526  04b8 a160          	cp	a,#96
2527  04ba 2404          	jruge	L1601
2530  04bc a638          	ld	a,#56
2531  04be 6b01          	ld	(OFST+0,sp),a
2532  04c0               L1601:
2533                     ; 446   if(count_ppg <CON_PWM_23us)		 			result =CON_NO_CUR1_HIG;	//23US<PPG
2535  04c0 7b03          	ld	a,(OFST+2,sp)
2536  04c2 a148          	cp	a,#72
2537  04c4 2434          	jruge	L5601
2540  04c6 a648          	ld	a,#72
2541  04c8 6b01          	ld	(OFST+0,sp),a
2542  04ca 202e          	jra	L5601
2543  04cc               L5501:
2544                     ; 450   result =CON_NO_CUR2_MIN;
2546  04cc a628          	ld	a,#40
2547  04ce 6b01          	ld	(OFST+0,sp),a
2548                     ; 451   if((count_ppg >=CON_PWM_17us)&&(count_ppg <CON_PWM_15us)) 	result =CON_NO_CUR2_LOW;	//15US<PPG<17US 
2550  04d0 7b03          	ld	a,(OFST+2,sp)
2551  04d2 a178          	cp	a,#120
2552  04d4 250a          	jrult	L7601
2554  04d6 7b03          	ld	a,(OFST+2,sp)
2555  04d8 a188          	cp	a,#136
2556  04da 2404          	jruge	L7601
2559  04dc a638          	ld	a,#56
2560  04de 6b01          	ld	(OFST+0,sp),a
2561  04e0               L7601:
2562                     ; 452   if((count_ppg >=CON_PWM_19us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR2_MID;	//17US<PPG<19US 
2564  04e0 7b03          	ld	a,(OFST+2,sp)
2565  04e2 a168          	cp	a,#104
2566  04e4 250a          	jrult	L1701
2568  04e6 7b03          	ld	a,(OFST+2,sp)
2569  04e8 a178          	cp	a,#120
2570  04ea 2404          	jruge	L1701
2573  04ec a648          	ld	a,#72
2574  04ee 6b01          	ld	(OFST+0,sp),a
2575  04f0               L1701:
2576                     ; 453   if(count_ppg <CON_PWM_19us)		 			result =CON_NO_CUR2_HIG;	//19US<PPG
2578  04f0 7b03          	ld	a,(OFST+2,sp)
2579  04f2 a168          	cp	a,#104
2580  04f4 2404          	jruge	L5601
2583  04f6 a650          	ld	a,#80
2584  04f8 6b01          	ld	(OFST+0,sp),a
2585  04fa               L5601:
2586                     ; 456   return(result);
2588  04fa 7b01          	ld	a,(OFST+0,sp)
2591  04fc 5b03          	addw	sp,#3
2592  04fe 81            	ret
2636                     ; 460 void SM1668_SENT_DATA(u8 send_data)
2636                     ; 461 {
2637                     	switch	.text
2638  04ff               _SM1668_SENT_DATA:
2640  04ff 88            	push	a
2641  0500 88            	push	a
2642       00000001      OFST:	set	1
2645                     ; 463      for (i =0;i<8;i++)
2647  0501 0f01          	clr	(OFST+0,sp)
2648  0503               L7111:
2649                     ; 465 	D_SCK_Port->ODR &= ~D_SCK_Pin;  //GPIO_WriteLow(GPIOC,SCLK);
2651  0503 7215500a      	bres	20490,#2
2652                     ; 466         delay(8);
2654  0507 a608          	ld	a,#8
2655  0509 cd0147        	call	_delay
2657                     ; 467 	if ((send_data &  0x01)== 1)  D_SDA_Port->ODR |= D_SDA_Pin; //GPIO_WriteHigh(GPIOC,SDATA); 
2659  050c 7b02          	ld	a,(OFST+1,sp)
2660  050e a401          	and	a,#1
2661  0510 a101          	cp	a,#1
2662  0512 2606          	jrne	L5211
2665  0514 721e500a      	bset	20490,#7
2667  0518 2004          	jra	L7211
2668  051a               L5211:
2669                     ; 468 	 else      D_SDA_Port->ODR &= ~D_SDA_Pin;//       GPIO_WriteLow(GPIOC,SDATA);
2671  051a 721f500a      	bres	20490,#7
2672  051e               L7211:
2673                     ; 469         delay(8);
2675  051e a608          	ld	a,#8
2676  0520 cd0147        	call	_delay
2678                     ; 470 	D_SCK_Port->ODR |= D_SCK_Pin; //GPIO_WriteHigh(GPIOC,SCLK);
2680  0523 7214500a      	bset	20490,#2
2681                     ; 471         delay(8);
2683  0527 a608          	ld	a,#8
2684  0529 cd0147        	call	_delay
2686                     ; 472 	send_data >>= 1;
2688  052c 0402          	srl	(OFST+1,sp)
2689                     ; 463      for (i =0;i<8;i++)
2691  052e 0c01          	inc	(OFST+0,sp)
2694  0530 7b01          	ld	a,(OFST+0,sp)
2695  0532 a108          	cp	a,#8
2696  0534 25cd          	jrult	L7111
2697                     ; 474 }
2700  0536 85            	popw	x
2701  0537 81            	ret
2746                     ; 475 void SM1668_SEND_COMMAND(u8 send_command)
2746                     ; 476 {
2747                     	switch	.text
2748  0538               _SM1668_SEND_COMMAND:
2750  0538 88            	push	a
2751  0539 88            	push	a
2752       00000001      OFST:	set	1
2755                     ; 478 	D_EN_Port->ODR |= D_EN_Pin; //GPIO_WriteHigh(GPIOE,DISPEN);
2757  053a 721a5014      	bset	20500,#5
2758                     ; 479         delay(8);
2760  053e a608          	ld	a,#8
2761  0540 cd0147        	call	_delay
2763                     ; 480 	D_EN_Port->ODR &= ~D_EN_Pin; //GPIO_WriteLow(GPIOE,DISPEN);
2765  0543 721b5014      	bres	20500,#5
2766                     ; 481         delay(8);
2768  0547 a608          	ld	a,#8
2769  0549 cd0147        	call	_delay
2771                     ; 482 	 for(i =0;i<8;i++)
2773  054c 0f01          	clr	(OFST+0,sp)
2774  054e               L3511:
2775                     ; 484 	  D_SCK_Port->ODR &= ~D_SCK_Pin; //GPIO_WriteLow(GPIOC,SCLK);
2777  054e 7215500a      	bres	20490,#2
2778                     ; 485         delay(8);
2780  0552 a608          	ld	a,#8
2781  0554 cd0147        	call	_delay
2783                     ; 486 	  if((send_command & 0x01)== 1) D_SDA_Port->ODR |= D_SDA_Pin; //GPIO_WriteHigh(GPIOC,SDATA); 
2785  0557 7b02          	ld	a,(OFST+1,sp)
2786  0559 a401          	and	a,#1
2787  055b a101          	cp	a,#1
2788  055d 2606          	jrne	L1611
2791  055f 721e500a      	bset	20490,#7
2793  0563 2004          	jra	L3611
2794  0565               L1611:
2795                     ; 487 	   else             D_SDA_Port->ODR &= ~D_SDA_Pin; //       GPIO_WriteLow(GPIOC,SDATA);
2797  0565 721f500a      	bres	20490,#7
2798  0569               L3611:
2799                     ; 488         delay(8);
2801  0569 a608          	ld	a,#8
2802  056b cd0147        	call	_delay
2804                     ; 489 	  D_SCK_Port->ODR |= D_SCK_Pin; //GPIO_WriteHigh(GPIOC,SCLK);
2806  056e 7214500a      	bset	20490,#2
2807                     ; 490         delay(8);
2809  0572 a608          	ld	a,#8
2810  0574 cd0147        	call	_delay
2812                     ; 491 	  send_command >>= 1;
2814  0577 0402          	srl	(OFST+1,sp)
2815                     ; 482 	 for(i =0;i<8;i++)
2817  0579 0c01          	inc	(OFST+0,sp)
2820  057b 7b01          	ld	a,(OFST+0,sp)
2821  057d a108          	cp	a,#8
2822  057f 25cd          	jrult	L3511
2823                     ; 493 }
2826  0581 85            	popw	x
2827  0582 81            	ret
2861                     ; 494 void UART2_DeInit(void)                                                                                                                                                                   
2861                     ; 495 {                                                                                                                                                                                         
2862                     	switch	.text
2863  0583               _UART2_DeInit:
2865  0583 88            	push	a
2866       00000001      OFST:	set	1
2869                     ; 496     u8 dummy = 0;                                                                                                                                                                                                                                                                                   
2871  0584 0f01          	clr	(OFST+0,sp)
2872                     ; 497     dummy = UART2->SR;                                                                                                                                                                    
2874  0586 c65240        	ld	a,21056
2875  0589 6b01          	ld	(OFST+0,sp),a
2876                     ; 498     dummy = UART2->DR;                                                                                                                                                                    
2878  058b c65241        	ld	a,21057
2879  058e 6b01          	ld	(OFST+0,sp),a
2880                     ; 500     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */                                                                                                      
2882  0590 725f5243      	clr	21059
2883                     ; 501     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */                                                                                                      
2885  0594 725f5242      	clr	21058
2886                     ; 503     UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */                                                                                                         
2888  0598 725f5244      	clr	21060
2889                     ; 504     UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */                                                                                                         
2891  059c 725f5245      	clr	21061
2892                     ; 505     UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */                                                                                                        
2894  05a0 725f5246      	clr	21062
2895                     ; 506     UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */                                                                                                        
2897  05a4 725f5247      	clr	21063
2898                     ; 507     UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */                                                                                                         
2900  05a8 725f5248      	clr	21064
2901                     ; 508     UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */                                                                                                                                                                                                                                                                                                  
2903  05ac 725f5249      	clr	21065
2904                     ; 509 } 
2907  05b0 84            	pop	a
2908  05b1 81            	ret
3228                     .const:	section	.text
3229  0000               L021:
3230  0000 00000064      	dc.l	100
3231                     ; 523 void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
3231                     ; 524 {                                                                                                                                                                                         
3232                     	switch	.text
3233  05b2               _UART2_Init:
3235  05b2 520e          	subw	sp,#14
3236       0000000e      OFST:	set	14
3239                     ; 525     u8 BRR2_1, BRR2_2 = 0;                                                                                                                                                                
3241  05b4 7b06          	ld	a,(OFST-8,sp)
3242  05b6 97            	ld	xl,a
3243                     ; 526     u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;                                                                                                                                      
3245  05b7 96            	ldw	x,sp
3246  05b8 1c0007        	addw	x,#OFST-7
3247  05bb cd0000        	call	c_ltor
3249                     ; 529     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));                                                                                                                                         
3251                     ; 531     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));                                                                                                                                     
3253                     ; 533     assert_param(IS_UART2_STOPBITS_OK(StopBits));                                                                                                                                         
3255                     ; 535     assert_param(IS_UART2_PARITY_OK(Parity));                                                                                                                                             
3257                     ; 538     assert_param(IS_UART2_MODE_OK((u8)Mode));                                                                                                                                             
3259                     ; 542     assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));                                                                                                                                     
3261                     ; 544     UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */                                                                                                                  
3263  05be 72195244      	bres	21060,#4
3264                     ; 545     UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */                                                                                     
3266  05c2 c65244        	ld	a,21060
3267  05c5 1a15          	or	a,(OFST+7,sp)
3268  05c7 c75244        	ld	21060,a
3269                     ; 547     UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */                                                                                                                     
3271  05ca c65246        	ld	a,21062
3272  05cd a4cf          	and	a,#207
3273  05cf c75246        	ld	21062,a
3274                     ; 548     UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */                                                                                      
3276  05d2 c65246        	ld	a,21062
3277  05d5 1a16          	or	a,(OFST+8,sp)
3278  05d7 c75246        	ld	21062,a
3279                     ; 550     UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */                                                                                         
3281  05da c65244        	ld	a,21060
3282  05dd a4f9          	and	a,#249
3283  05df c75244        	ld	21060,a
3284                     ; 551     UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */                                                                                                   
3286  05e2 c65244        	ld	a,21060
3287  05e5 1a17          	or	a,(OFST+9,sp)
3288  05e7 c75244        	ld	21060,a
3289                     ; 553     UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */                                                                                                    
3291  05ea 725f5242      	clr	21058
3292                     ; 554     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */                                                                                                    
3294  05ee c65243        	ld	a,21059
3295  05f1 a40f          	and	a,#15
3296  05f3 c75243        	ld	21059,a
3297                     ; 555     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */                                                                                                    
3299  05f6 c65243        	ld	a,21059
3300  05f9 a4f0          	and	a,#240
3301  05fb c75243        	ld	21059,a
3302                     ; 558     BaudRate_Mantissa    = ((u32)16000000 / (BaudRate << 4));                                                                                                                   
3304  05fe 96            	ldw	x,sp
3305  05ff 1c0011        	addw	x,#OFST+3
3306  0602 cd0000        	call	c_ltor
3308  0605 a604          	ld	a,#4
3309  0607 cd0000        	call	c_llsh
3311  060a 96            	ldw	x,sp
3312  060b 1c0001        	addw	x,#OFST-13
3313  060e cd0000        	call	c_rtol
3315  0611 ae2400        	ldw	x,#9216
3316  0614 bf02          	ldw	c_lreg+2,x
3317  0616 ae00f4        	ldw	x,#244
3318  0619 bf00          	ldw	c_lreg,x
3319  061b 96            	ldw	x,sp
3320  061c 1c0001        	addw	x,#OFST-13
3321  061f cd0000        	call	c_ludv
3323  0622 96            	ldw	x,sp
3324  0623 1c000b        	addw	x,#OFST-3
3325  0626 cd0000        	call	c_rtol
3327                     ; 559     BaudRate_Mantissa100 = (((u32)16000000 * 100) / (BaudRate << 4));                                                                                                           
3329  0629 96            	ldw	x,sp
3330  062a 1c0011        	addw	x,#OFST+3
3331  062d cd0000        	call	c_ltor
3333  0630 a604          	ld	a,#4
3334  0632 cd0000        	call	c_llsh
3336  0635 96            	ldw	x,sp
3337  0636 1c0001        	addw	x,#OFST-13
3338  0639 cd0000        	call	c_rtol
3340  063c ae1000        	ldw	x,#4096
3341  063f bf02          	ldw	c_lreg+2,x
3342  0641 ae5f5e        	ldw	x,#24414
3343  0644 bf00          	ldw	c_lreg,x
3344  0646 96            	ldw	x,sp
3345  0647 1c0001        	addw	x,#OFST-13
3346  064a cd0000        	call	c_ludv
3348  064d 96            	ldw	x,sp
3349  064e 1c0007        	addw	x,#OFST-7
3350  0651 cd0000        	call	c_rtol
3352                     ; 561     BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */                                                                                                    
3354  0654 96            	ldw	x,sp
3355  0655 1c000b        	addw	x,#OFST-3
3356  0658 cd0000        	call	c_ltor
3358  065b a664          	ld	a,#100
3359  065d cd0000        	call	c_smul
3361  0660 96            	ldw	x,sp
3362  0661 1c0001        	addw	x,#OFST-13
3363  0664 cd0000        	call	c_rtol
3365  0667 96            	ldw	x,sp
3366  0668 1c0007        	addw	x,#OFST-7
3367  066b cd0000        	call	c_ltor
3369  066e 96            	ldw	x,sp
3370  066f 1c0001        	addw	x,#OFST-13
3371  0672 cd0000        	call	c_lsub
3373  0675 a604          	ld	a,#4
3374  0677 cd0000        	call	c_llsh
3376  067a ae0000        	ldw	x,#L021
3377  067d cd0000        	call	c_ludv
3379  0680 b603          	ld	a,c_lreg+3
3380  0682 a40f          	and	a,#15
3381  0684 6b05          	ld	(OFST-9,sp),a
3382                     ; 562     BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);                                                                                                                                   
3384  0686 96            	ldw	x,sp
3385  0687 1c000b        	addw	x,#OFST-3
3386  068a cd0000        	call	c_ltor
3388  068d a604          	ld	a,#4
3389  068f cd0000        	call	c_lursh
3391  0692 b603          	ld	a,c_lreg+3
3392  0694 a4f0          	and	a,#240
3393  0696 b703          	ld	c_lreg+3,a
3394  0698 3f02          	clr	c_lreg+2
3395  069a 3f01          	clr	c_lreg+1
3396  069c 3f00          	clr	c_lreg
3397  069e b603          	ld	a,c_lreg+3
3398  06a0 6b06          	ld	(OFST-8,sp),a
3399                     ; 564     UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);                                                                                                                                                  
3401  06a2 7b05          	ld	a,(OFST-9,sp)
3402  06a4 1a06          	or	a,(OFST-8,sp)
3403  06a6 c75243        	ld	21059,a
3404                     ; 565     UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */                                                                                               
3406  06a9 7b0e          	ld	a,(OFST+0,sp)
3407  06ab c75242        	ld	21058,a
3408                     ; 567     UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */                                           
3410  06ae c65245        	ld	a,21061
3411  06b1 a4f3          	and	a,#243
3412  06b3 c75245        	ld	21061,a
3413                     ; 568     UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */                                             
3415  06b6 c65246        	ld	a,21062
3416  06b9 a4f8          	and	a,#248
3417  06bb c75246        	ld	21062,a
3418                     ; 569     UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */                          
3420  06be 7b18          	ld	a,(OFST+10,sp)
3421  06c0 a407          	and	a,#7
3422  06c2 ca5246        	or	a,21062
3423  06c5 c75246        	ld	21062,a
3424                     ; 571     if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)                                                                                                                                              
3426  06c8 7b19          	ld	a,(OFST+11,sp)
3427  06ca a504          	bcp	a,#4
3428  06cc 2706          	jreq	L5631
3429                     ; 573         UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */                                                                                                          
3431  06ce 72165245      	bset	21061,#3
3433  06d2 2004          	jra	L7631
3434  06d4               L5631:
3435                     ; 577         UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */                                                                                                    
3437  06d4 72175245      	bres	21061,#3
3438  06d8               L7631:
3439                     ; 579     if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)                                                                                                                                              
3441  06d8 7b19          	ld	a,(OFST+11,sp)
3442  06da a508          	bcp	a,#8
3443  06dc 2706          	jreq	L1731
3444                     ; 581         UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */                                                                                                             
3446  06de 72145245      	bset	21061,#2
3448  06e2 2004          	jra	L3731
3449  06e4               L1731:
3450                     ; 585         UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */                                                                                                       
3452  06e4 72155245      	bres	21061,#2
3453  06e8               L3731:
3454                     ; 588     if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)                                                                                                                                    
3456  06e8 7b18          	ld	a,(OFST+10,sp)
3457  06ea a580          	bcp	a,#128
3458  06ec 2706          	jreq	L5731
3459                     ; 590         UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */                                                                                                           
3461  06ee 72175246      	bres	21062,#3
3463  06f2 200a          	jra	L7731
3464  06f4               L5731:
3465                     ; 595         UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);                                                                                                                                
3467  06f4 7b18          	ld	a,(OFST+10,sp)
3468  06f6 a408          	and	a,#8
3469  06f8 ca5246        	or	a,21062
3470  06fb c75246        	ld	21062,a
3471  06fe               L7731:
3472                     ; 597 }  
3475  06fe 5b0e          	addw	sp,#14
3476  0700 81            	ret
3531                     ; 608 void UART2_Cmd(FunctionalState NewState)                                                                                                                                                  
3531                     ; 609 {                                                                                                                                                                                         
3532                     	switch	.text
3533  0701               _UART2_Cmd:
3537                     ; 611     if (NewState != DISABLE)                                                                                                                                                              
3539  0701 4d            	tnz	a
3540  0702 2706          	jreq	L7241
3541                     ; 613         UART2->CR1 &= (u8)(~UART2_CR1_UARTD); /**< UART2 Enable */                                                                                                                        
3543  0704 721b5244      	bres	21060,#5
3545  0708 2004          	jra	L1341
3546  070a               L7241:
3547                     ; 617         UART2->CR1 |= UART2_CR1_UARTD;  /**< UART2 Disable (for low power consumption) */                                                                                                 
3549  070a 721a5244      	bset	21060,#5
3550  070e               L1341:
3551                     ; 619 } 
3554  070e 81            	ret
3686                     ; 637 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)                                                                                                                  
3686                     ; 638 {                                                                                                                                                                                         
3687                     	switch	.text
3688  070f               _UART2_ITConfig:
3690  070f 89            	pushw	x
3691  0710 89            	pushw	x
3692       00000002      OFST:	set	2
3695                     ; 639     u8 uartreg, itpos = 0x00;                                                                                                                                                             
3697  0711 7b02          	ld	a,(OFST+0,sp)
3698  0713 97            	ld	xl,a
3699                     ; 640     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));                                                                                                                                        
3701                     ; 641     assert_param(IS_FUNCTIONALSTATE_OK(NewState));                                                                                                                                        
3703                     ; 644     uartreg = (u8)(UART2_IT >> 0x08);                                                                                                                                                     
3705  0714 7b03          	ld	a,(OFST+1,sp)
3706  0716 6b01          	ld	(OFST-1,sp),a
3707                     ; 648      itpos = (u8)UART2_IT ;                                                                                                                                                                                    
3709  0718 7b04          	ld	a,(OFST+2,sp)
3710  071a 6b02          	ld	(OFST+0,sp),a
3711                     ; 649     if (NewState != DISABLE)                                                                                                                                                              
3713  071c 0d07          	tnz	(OFST+5,sp)
3714  071e 273a          	jreq	L3151
3715                     ; 652         if (uartreg == 0x01)                                                                                                                                                              
3717  0720 7b01          	ld	a,(OFST-1,sp)
3718  0722 a101          	cp	a,#1
3719  0724 260a          	jrne	L5151
3720                     ; 654             UART2->CR1 |= itpos;                                                                                                                                                          
3722  0726 c65244        	ld	a,21060
3723  0729 1a02          	or	a,(OFST+0,sp)
3724  072b c75244        	ld	21060,a
3726  072e 2066          	jra	L1351
3727  0730               L5151:
3728                     ; 656         else if (uartreg == 0x02)                                                                                                                                                         
3730  0730 7b01          	ld	a,(OFST-1,sp)
3731  0732 a102          	cp	a,#2
3732  0734 260a          	jrne	L1251
3733                     ; 658             UART2->CR2 |= itpos;                                                                                                                                                          
3735  0736 c65245        	ld	a,21061
3736  0739 1a02          	or	a,(OFST+0,sp)
3737  073b c75245        	ld	21061,a
3739  073e 2056          	jra	L1351
3740  0740               L1251:
3741                     ; 660         else if (uartreg == 0x03)                                                                                                                                                         
3743  0740 7b01          	ld	a,(OFST-1,sp)
3744  0742 a103          	cp	a,#3
3745  0744 260a          	jrne	L5251
3746                     ; 662             UART2->CR4 |= itpos;                                                                                                                                                          
3748  0746 c65247        	ld	a,21063
3749  0749 1a02          	or	a,(OFST+0,sp)
3750  074b c75247        	ld	21063,a
3752  074e 2046          	jra	L1351
3753  0750               L5251:
3754                     ; 666             UART2->CR6 |= itpos;                                                                                                                                                          
3756  0750 c65249        	ld	a,21065
3757  0753 1a02          	or	a,(OFST+0,sp)
3758  0755 c75249        	ld	21065,a
3759  0758 203c          	jra	L1351
3760  075a               L3151:
3761                     ; 672         if (uartreg == 0x01)                                                                                                                                                              
3763  075a 7b01          	ld	a,(OFST-1,sp)
3764  075c a101          	cp	a,#1
3765  075e 260b          	jrne	L3351
3766                     ; 674             UART2->CR1 &= (u8)(~itpos);                                                                                                                                                   
3768  0760 7b02          	ld	a,(OFST+0,sp)
3769  0762 43            	cpl	a
3770  0763 c45244        	and	a,21060
3771  0766 c75244        	ld	21060,a
3773  0769 202b          	jra	L1351
3774  076b               L3351:
3775                     ; 676         else if (uartreg == 0x02)                                                                                                                                                         
3777  076b 7b01          	ld	a,(OFST-1,sp)
3778  076d a102          	cp	a,#2
3779  076f 260b          	jrne	L7351
3780                     ; 678             UART2->CR2 &= (u8)(~itpos);                                                                                                                                                   
3782  0771 7b02          	ld	a,(OFST+0,sp)
3783  0773 43            	cpl	a
3784  0774 c45245        	and	a,21061
3785  0777 c75245        	ld	21061,a
3787  077a 201a          	jra	L1351
3788  077c               L7351:
3789                     ; 680         else if (uartreg == 0x03)                                                                                                                                                         
3791  077c 7b01          	ld	a,(OFST-1,sp)
3792  077e a103          	cp	a,#3
3793  0780 260b          	jrne	L3451
3794                     ; 682             UART2->CR4 &= (u8)(~itpos);                                                                                                                                                   
3796  0782 7b02          	ld	a,(OFST+0,sp)
3797  0784 43            	cpl	a
3798  0785 c45247        	and	a,21063
3799  0788 c75247        	ld	21063,a
3801  078b 2009          	jra	L1351
3802  078d               L3451:
3803                     ; 686             UART2->CR6 &= (u8)(~itpos);                                                                                                                                                   
3805  078d 7b02          	ld	a,(OFST+0,sp)
3806  078f 43            	cpl	a
3807  0790 c45249        	and	a,21065
3808  0793 c75249        	ld	21065,a
3809  0796               L1351:
3810                     ; 689 }
3813  0796 5b04          	addw	sp,#4
3814  0798 81            	ret
3837                     ; 698 u8 UART2_ReceiveData8(void)                                                                                                                                                               
3837                     ; 699 {                                                                                                                                                                                         
3838                     	switch	.text
3839  0799               _UART2_ReceiveData8:
3843                     ; 700     return ((u8)UART2->DR);                                                                                                                                                               
3845  0799 c65241        	ld	a,21057
3848  079c 81            	ret
3882                     ; 711 void UART2_SendData8(u8 Data)                                                                                                                                                             
3882                     ; 712 {                                                                                                                                                                                         
3883                     	switch	.text
3884  079d               _UART2_SendData8:
3888                     ; 714     UART2->DR = Data;                                                                                                                                                                     
3890  079d c75241        	ld	21057,a
3891                     ; 715 } 
3894  07a0 81            	ret
4019                     ; 742 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)                                                                                                                                       
4019                     ; 743 {                                                                                                                                                                                         
4020                     	switch	.text
4021  07a1               _UART2_ClearFlag:
4023  07a1 89            	pushw	x
4024       00000000      OFST:	set	0
4027                     ; 744     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));                                                                                                                                     
4029                     ; 747     if (UART2_FLAG == UART2_FLAG_RXNE)                                                                                                                                                    
4031  07a2 a30020        	cpw	x,#32
4032  07a5 2606          	jrne	L7461
4033                     ; 749         UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
4035  07a7 35df5240      	mov	21056,#223
4037  07ab 201e          	jra	L1561
4038  07ad               L7461:
4039                     ; 752     else if (UART2_FLAG == UART2_FLAG_LBDF)                                                                                                                                               
4041  07ad 1e01          	ldw	x,(OFST+1,sp)
4042  07af a30210        	cpw	x,#528
4043  07b2 2606          	jrne	L3561
4044                     ; 754         UART2->CR4 &= (u8)(~UART2_CR4_LBDF);                                                                                                                                              
4046  07b4 72195247      	bres	21063,#4
4048  07b8 2011          	jra	L1561
4049  07ba               L3561:
4050                     ; 757     else if (UART2_FLAG == UART2_FLAG_LHDF)                                                                                                                                               
4052  07ba 1e01          	ldw	x,(OFST+1,sp)
4053  07bc a30302        	cpw	x,#770
4054  07bf 2606          	jrne	L7561
4055                     ; 759         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
4057  07c1 72135249      	bres	21065,#1
4059  07c5 2004          	jra	L1561
4060  07c7               L7561:
4061                     ; 764         UART2->CR6 &= (u8)(~UART2_CR6_LSF);                                                                                                                                               
4063  07c7 72115249      	bres	21065,#0
4064  07cb               L1561:
4065                     ; 767 } 
4068  07cb 85            	popw	x
4069  07cc 81            	ret
4105                     ; 792 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)                                                                                                                                   
4105                     ; 793 {                                                                                                                                                                                         
4106                     	switch	.text
4107  07cd               _UART2_ClearITPendingBit:
4109  07cd 89            	pushw	x
4110       00000000      OFST:	set	0
4113                     ; 794     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));                                                                                                                                         
4115                     ; 797     if (UART2_IT == UART2_IT_RXNE)                                                                                                                                                        
4117  07ce a30220        	cpw	x,#544
4118  07d1 2606          	jrne	L1071
4119                     ; 799         UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
4121  07d3 35df5240      	mov	21056,#223
4123  07d7 2011          	jra	L3071
4124  07d9               L1071:
4125                     ; 802     else if (UART2_IT == UART2_IT_LBDF)                                                                                                                                                   
4127  07d9 1e01          	ldw	x,(OFST+1,sp)
4128  07db a30346        	cpw	x,#838
4129  07de 2606          	jrne	L5071
4130                     ; 804         UART2->CR4 &= (u8)~(UART2_CR4_LBDF);                                                                                                                                              
4132  07e0 72195247      	bres	21063,#4
4134  07e4 2004          	jra	L3071
4135  07e6               L5071:
4136                     ; 809         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
4138  07e6 72135249      	bres	21065,#1
4139  07ea               L3071:
4140                     ; 811 } 
4143  07ea 85            	popw	x
4144  07eb 81            	ret
4195                     	xdef	_SM1668_SEND_COMMAND
4196                     	xdef	_SM1668_SENT_DATA
4197                     	xdef	_zone_x_cur_no_set
4198                     	xdef	_flex_ntc_deal
4199                     	xdef	_vf_fan_deal
4200                     	xdef	_Check_Unique_ID
4201                     	xdef	_APTTouchRdOneData1
4202                     	xdef	_APTTouchRdOneData
4203                     	xdef	_APTTouchWrOneData1
4204                     	xdef	_APTTouchWrOneData
4205                     	xdef	_ReceiveAck1
4206                     	xdef	_ReceiveAck
4207                     	xdef	_RX1_Byte
4208                     	xdef	_RX_Byte
4209                     	xdef	_TX1_Byte
4210                     	xdef	_TX_Byte
4211                     	xdef	_Stop1
4212                     	xdef	_Stop
4213                     	xdef	_Start1
4214                     	xdef	_Start
4215                     	xdef	_IIC1_initial
4216                     	xdef	_IIC_initial
4217                     	xdef	_delay
4218                     	xdef	_tx_rx_beep_io_deal
4219                     	xdef	_fan_on
4220                     	xdef	_comm_bit_count
4221                     	xdef	_Low_time
4222                     	xdef	_High_time
4223                     	xref.b	_fan_status
4224                     	xref.b	_Get_word_4
4225                     	xref.b	_Get_word_3
4226                     	xref.b	_Get_word_2
4227                     	xref.b	_Get_word_1
4228                     	xref.b	_bit_comm
4229                     	xref.b	_comm_status
4230                     	xref.b	_comm_list
4231                     	xref.b	_buzzer_time
4232                     	xdef	_UART2_ClearITPendingBit
4233                     	xdef	_UART2_ClearFlag
4234                     	xdef	_UART2_SendData8
4235                     	xdef	_UART2_ReceiveData8
4236                     	xdef	_UART2_ITConfig
4237                     	xdef	_UART2_Cmd
4238                     	xdef	_UART2_Init
4239                     	xdef	_UART2_DeInit
4240                     	xdef	_IWDG_Enable
4241                     	xdef	_IWDG_ReloadCounter
4242                     	xdef	_IWDG_SetReload
4243                     	xdef	_IWDG_SetPrescaler
4244                     	xdef	_IWDG_WriteAccessCmd
4245                     	xref.b	c_lreg
4246                     	xref.b	c_x
4265                     	xref	c_lursh
4266                     	xref	c_lsub
4267                     	xref	c_smul
4268                     	xref	c_ludv
4269                     	xref	c_rtol
4270                     	xref	c_llsh
4271                     	xref	c_ltor
4272                     	end
