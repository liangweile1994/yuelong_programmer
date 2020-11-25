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
  66  0004 c65005        	ld	a,20485
  67  0007 a801          	xor	a,	#1
  68  0009 c75005        	ld	20485,a
  70  000c 2004          	jra	L32
  71  000e               L12:
  72                     ; 42 	else BEEP_OFF;
  74  000e 72115005      	bres	20485,#0
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
  92  0021 721e500f      	bset	20495,#7
  93  0025               L72:
  94                     ; 48      	  if((comm_list >=50) &&(comm_list <66)) 	TX_0;//start low 16(*125 =2ms)
  96  0025 b600          	ld	a,_comm_list
  97  0027 a132          	cp	a,#50
  98  0029 250a          	jrult	L13
 100  002b b600          	ld	a,_comm_list
 101  002d a142          	cp	a,#66
 102  002f 2404          	jruge	L13
 105  0031 721f500f      	bres	20495,#7
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
 138  0052 721e500f      	bset	20495,#7
 141  0056 3a00          	dec	_High_time
 144  0058 35040001      	mov	_Low_time,#4
 146  005c 2032          	jra	L14
 147  005e               L73:
 148                     ; 61 			if(Low_time) {TX_0;Low_time--;}
 150  005e 3d01          	tnz	_Low_time
 151  0060 2708          	jreq	L34
 154  0062 721f500f      	bres	20495,#7
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
 206  0099 721e500f      	bset	20495,#7
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
 449  0152 72145007      	bset	20487,#2
 450                     ; 133   SDA_1;
 452  0156 72145005      	bset	20485,#2
 453                     ; 134   SCL_1;
 455  015a 72165005      	bset	20485,#3
 456                     ; 135 }
 459  015e 81            	ret
 482                     ; 137 void IIC1_initial(void)
 482                     ; 138 {
 483                     	switch	.text
 484  015f               _IIC1_initial:
 488                     ; 139   D_SDA_OUT;
 490  015f 7214500c      	bset	20492,#2
 491                     ; 140   D_SDA_1;
 493  0163 7214500a      	bset	20490,#2
 494                     ; 141   D_SCL_1;
 496  0167 721a5014      	bset	20500,#5
 497                     ; 142 }
 500  016b 81            	ret
 523                     ; 144 void IIC2_initial(void)
 523                     ; 145 {
 524                     	switch	.text
 525  016c               _IIC2_initial:
 529                     ; 146   SDA1_OUT;
 531  016c 72105011      	bset	20497,#0
 532                     ; 147   SDA1_1;
 534  0170 7210500f      	bset	20495,#0
 535                     ; 148   SCL1_1;
 537  0174 721e500a      	bset	20490,#7
 538                     ; 149 }
 541  0178 81            	ret
 565                     ; 150 void Start(void)
 565                     ; 151 {
 566                     	switch	.text
 567  0179               _Start:
 571                     ; 152   SDA_OUT;
 573  0179 72145007      	bset	20487,#2
 574                     ; 153   SDA_1;
 576  017d 72145005      	bset	20485,#2
 577                     ; 154   delay(IIC_DELAY);
 579  0181 a628          	ld	a,#40
 580  0183 adc2          	call	_delay
 582                     ; 155   SCL_1;
 584  0185 72165005      	bset	20485,#3
 585                     ; 156   delay(IIC_DELAY);
 587  0189 a628          	ld	a,#40
 588  018b adba          	call	_delay
 590                     ; 157   SDA_0;
 592  018d 72155005      	bres	20485,#2
 593                     ; 158   delay(IIC_DELAY);
 595  0191 a628          	ld	a,#40
 596  0193 adb2          	call	_delay
 598                     ; 159   SCL_0;
 600  0195 72175005      	bres	20485,#3
 601                     ; 160   delay(IIC_DELAY);
 603  0199 a628          	ld	a,#40
 604  019b adaa          	call	_delay
 606                     ; 161 }
 609  019d 81            	ret
 633                     ; 163 void Start1(void)
 633                     ; 164 {
 634                     	switch	.text
 635  019e               _Start1:
 639                     ; 165   D_SDA_OUT;
 641  019e 7214500c      	bset	20492,#2
 642                     ; 166   D_SDA_1;
 644  01a2 7214500a      	bset	20490,#2
 645                     ; 167   delay(IIC_DELAY);
 647  01a6 a628          	ld	a,#40
 648  01a8 ad9d          	call	_delay
 650                     ; 168   D_SCL_1;
 652  01aa 721a5014      	bset	20500,#5
 653                     ; 169   delay(IIC_DELAY);
 655  01ae a628          	ld	a,#40
 656  01b0 ad95          	call	_delay
 658                     ; 170   D_SDA_0;
 660  01b2 7215500a      	bres	20490,#2
 661                     ; 171   delay(IIC_DELAY);
 663  01b6 a628          	ld	a,#40
 664  01b8 ad8d          	call	_delay
 666                     ; 172   D_SCL_0;
 668  01ba 721b5014      	bres	20500,#5
 669                     ; 173   delay(IIC_DELAY);
 671  01be a628          	ld	a,#40
 672  01c0 ad85          	call	_delay
 674                     ; 174 }
 677  01c2 81            	ret
 701                     ; 176 void Start2(void)
 701                     ; 177 {
 702                     	switch	.text
 703  01c3               _Start2:
 707                     ; 178   SDA1_OUT;
 709  01c3 72105011      	bset	20497,#0
 710                     ; 179   SDA1_1;
 712  01c7 7210500f      	bset	20495,#0
 713                     ; 180   delay(IIC_DELAY);
 715  01cb a628          	ld	a,#40
 716  01cd cd0147        	call	_delay
 718                     ; 181   SCL1_1;
 720  01d0 721e500a      	bset	20490,#7
 721                     ; 182   delay(IIC_DELAY);
 723  01d4 a628          	ld	a,#40
 724  01d6 cd0147        	call	_delay
 726                     ; 183   SDA1_0;
 728  01d9 7211500f      	bres	20495,#0
 729                     ; 184   delay(IIC_DELAY);
 731  01dd a628          	ld	a,#40
 732  01df cd0147        	call	_delay
 734                     ; 185   SCL1_0;
 736  01e2 721f500a      	bres	20490,#7
 737                     ; 186   delay(IIC_DELAY);
 739  01e6 a628          	ld	a,#40
 740  01e8 cd0147        	call	_delay
 742                     ; 187 }
 745  01eb 81            	ret
 769                     ; 188 void Stop(void)
 769                     ; 189 {
 770                     	switch	.text
 771  01ec               _Stop:
 775                     ; 190   SDA_0;
 777  01ec 72155005      	bres	20485,#2
 778                     ; 191   delay(IIC_DELAY);
 780  01f0 a628          	ld	a,#40
 781  01f2 cd0147        	call	_delay
 783                     ; 192   SCL_1;
 785  01f5 72165005      	bset	20485,#3
 786                     ; 193   delay(IIC_DELAY);
 788  01f9 a628          	ld	a,#40
 789  01fb cd0147        	call	_delay
 791                     ; 194   SDA_1;
 793  01fe 72145005      	bset	20485,#2
 794                     ; 195   delay(IIC_DELAY);
 796  0202 a628          	ld	a,#40
 797  0204 cd0147        	call	_delay
 799                     ; 196 }
 802  0207 81            	ret
 826                     ; 197 void Stop1(void)
 826                     ; 198 {
 827                     	switch	.text
 828  0208               _Stop1:
 832                     ; 199   D_SDA_0;
 834  0208 7215500a      	bres	20490,#2
 835                     ; 200   delay(IIC_DELAY);
 837  020c a628          	ld	a,#40
 838  020e cd0147        	call	_delay
 840                     ; 201   D_SCL_1;
 842  0211 721a5014      	bset	20500,#5
 843                     ; 202   delay(IIC_DELAY);
 845  0215 a628          	ld	a,#40
 846  0217 cd0147        	call	_delay
 848                     ; 203   D_SDA_1;
 850  021a 7214500a      	bset	20490,#2
 851                     ; 204   delay(IIC_DELAY);
 853  021e a628          	ld	a,#40
 854  0220 cd0147        	call	_delay
 856                     ; 205 }
 859  0223 81            	ret
 883                     ; 206 void Stop2(void)
 883                     ; 207 {
 884                     	switch	.text
 885  0224               _Stop2:
 889                     ; 208   SDA1_0;
 891  0224 7211500f      	bres	20495,#0
 892                     ; 209   delay(IIC_DELAY);
 894  0228 a628          	ld	a,#40
 895  022a cd0147        	call	_delay
 897                     ; 210   SCL1_1;
 899  022d 721e500a      	bset	20490,#7
 900                     ; 211   delay(IIC_DELAY);
 902  0231 a628          	ld	a,#40
 903  0233 cd0147        	call	_delay
 905                     ; 212   SDA1_1;
 907  0236 7210500f      	bset	20495,#0
 908                     ; 213   delay(IIC_DELAY);
 910  023a a628          	ld	a,#40
 911  023c cd0147        	call	_delay
 913                     ; 214 }
 916  023f 81            	ret
 969                     ; 215 void TX_Byte(u8  WriteData)
 969                     ; 216 {
 970                     	switch	.text
 971  0240               _TX_Byte:
 973  0240 89            	pushw	x
 974       00000002      OFST:	set	2
 977                     ; 218   j=WriteData;
 979  0241 6b02          	ld	(OFST+0,sp),a
 980                     ; 219   SDA_OUT;
 982  0243 72145007      	bset	20487,#2
 983                     ; 220   for (i=0; i<8; i++)
 985  0247 0f01          	clr	(OFST-1,sp)
 986  0249               L772:
 987                     ; 222     if ((j&0x80)==0)
 989  0249 7b02          	ld	a,(OFST+0,sp)
 990  024b a580          	bcp	a,#128
 991  024d 2606          	jrne	L503
 992                     ; 223     { SDA_0;}
 994  024f 72155005      	bres	20485,#2
 996  0253 2004          	jra	L703
 997  0255               L503:
 998                     ; 225     { SDA_1;}
1000  0255 72145005      	bset	20485,#2
1001  0259               L703:
1002                     ; 226     j <<=1;
1004  0259 0802          	sll	(OFST+0,sp)
1005                     ; 227     delay(IIC_DELAY);
1007  025b a628          	ld	a,#40
1008  025d cd0147        	call	_delay
1010                     ; 228     SCL_1;
1012  0260 72165005      	bset	20485,#3
1013                     ; 229     delay(IIC_DELAY);
1015  0264 a628          	ld	a,#40
1016  0266 cd0147        	call	_delay
1018                     ; 230     SCL_0;
1020  0269 72175005      	bres	20485,#3
1021                     ; 231     delay(IIC_DELAY);
1023  026d a628          	ld	a,#40
1024  026f cd0147        	call	_delay
1026                     ; 220   for (i=0; i<8; i++)
1028  0272 0c01          	inc	(OFST-1,sp)
1031  0274 7b01          	ld	a,(OFST-1,sp)
1032  0276 a108          	cp	a,#8
1033  0278 25cf          	jrult	L772
1034                     ; 233 }
1037  027a 85            	popw	x
1038  027b 81            	ret
1091                     ; 235 void TX1_Byte(u8  WriteData)
1091                     ; 236 {
1092                     	switch	.text
1093  027c               _TX1_Byte:
1095  027c 89            	pushw	x
1096       00000002      OFST:	set	2
1099                     ; 238   j=WriteData;
1101  027d 6b02          	ld	(OFST+0,sp),a
1102                     ; 239   D_SDA_OUT;
1104  027f 7214500c      	bset	20492,#2
1105                     ; 240   for (i=0; i<8; i++)
1107  0283 0f01          	clr	(OFST-1,sp)
1108  0285               L733:
1109                     ; 242     if ((j&0x80)==0)
1111  0285 7b02          	ld	a,(OFST+0,sp)
1112  0287 a580          	bcp	a,#128
1113  0289 2606          	jrne	L543
1114                     ; 243     { D_SDA_0;}
1116  028b 7215500a      	bres	20490,#2
1118  028f 2004          	jra	L743
1119  0291               L543:
1120                     ; 245     { D_SDA_1;}
1122  0291 7214500a      	bset	20490,#2
1123  0295               L743:
1124                     ; 246     j <<=1;
1126  0295 0802          	sll	(OFST+0,sp)
1127                     ; 247     delay(IIC_DELAY);
1129  0297 a628          	ld	a,#40
1130  0299 cd0147        	call	_delay
1132                     ; 248     D_SCL_1;
1134  029c 721a5014      	bset	20500,#5
1135                     ; 249     delay(IIC_DELAY);
1137  02a0 a628          	ld	a,#40
1138  02a2 cd0147        	call	_delay
1140                     ; 250     D_SCL_0;
1142  02a5 721b5014      	bres	20500,#5
1143                     ; 251     delay(IIC_DELAY);
1145  02a9 a628          	ld	a,#40
1146  02ab cd0147        	call	_delay
1148                     ; 240   for (i=0; i<8; i++)
1150  02ae 0c01          	inc	(OFST-1,sp)
1153  02b0 7b01          	ld	a,(OFST-1,sp)
1154  02b2 a108          	cp	a,#8
1155  02b4 25cf          	jrult	L733
1156                     ; 253 }
1159  02b6 85            	popw	x
1160  02b7 81            	ret
1213                     ; 255 void TX2_Byte(u8  WriteData)
1213                     ; 256 {
1214                     	switch	.text
1215  02b8               _TX2_Byte:
1217  02b8 89            	pushw	x
1218       00000002      OFST:	set	2
1221                     ; 258   j=WriteData;
1223  02b9 6b02          	ld	(OFST+0,sp),a
1224                     ; 259   SDA1_OUT;
1226  02bb 72105011      	bset	20497,#0
1227                     ; 260   for (i=0; i<8; i++)
1229  02bf 0f01          	clr	(OFST-1,sp)
1230  02c1               L773:
1231                     ; 262     if ((j&0x80)==0)
1233  02c1 7b02          	ld	a,(OFST+0,sp)
1234  02c3 a580          	bcp	a,#128
1235  02c5 2606          	jrne	L504
1236                     ; 263     { SDA1_0;}
1238  02c7 7211500f      	bres	20495,#0
1240  02cb 2004          	jra	L704
1241  02cd               L504:
1242                     ; 265     { SDA1_1;}
1244  02cd 7210500f      	bset	20495,#0
1245  02d1               L704:
1246                     ; 266     j <<=1;
1248  02d1 0802          	sll	(OFST+0,sp)
1249                     ; 267     delay(IIC_DELAY);
1251  02d3 a628          	ld	a,#40
1252  02d5 cd0147        	call	_delay
1254                     ; 268     SCL1_1;
1256  02d8 721e500a      	bset	20490,#7
1257                     ; 269     delay(IIC_DELAY);
1259  02dc a628          	ld	a,#40
1260  02de cd0147        	call	_delay
1262                     ; 270     SCL1_0;
1264  02e1 721f500a      	bres	20490,#7
1265                     ; 271     delay(IIC_DELAY);
1267  02e5 a628          	ld	a,#40
1268  02e7 cd0147        	call	_delay
1270                     ; 260   for (i=0; i<8; i++)
1272  02ea 0c01          	inc	(OFST-1,sp)
1275  02ec 7b01          	ld	a,(OFST-1,sp)
1276  02ee a108          	cp	a,#8
1277  02f0 25cf          	jrult	L773
1278                     ; 273 }
1281  02f2 85            	popw	x
1282  02f3 81            	ret
1326                     ; 274 u8 RX_Byte(void)
1326                     ; 275 {
1327                     	switch	.text
1328  02f4               _RX_Byte:
1330  02f4 89            	pushw	x
1331       00000002      OFST:	set	2
1334                     ; 277   u8 TempData = 0;
1336  02f5 0f02          	clr	(OFST+0,sp)
1337                     ; 278   SDA_IN;
1339  02f7 72155007      	bres	20487,#2
1340                     ; 279   for (i=0; i<8; i++)
1342  02fb 0f01          	clr	(OFST-1,sp)
1343  02fd               L334:
1344                     ; 281     delay(IIC_DELAY);
1346  02fd a628          	ld	a,#40
1347  02ff cd0147        	call	_delay
1349                     ; 282     SCL_1;
1351  0302 72165005      	bset	20485,#3
1352                     ; 283     delay(IIC_DELAY);
1354  0306 a628          	ld	a,#40
1355  0308 cd0147        	call	_delay
1357                     ; 284     TempData <<= 1;
1359  030b 0802          	sll	(OFST+0,sp)
1360                     ; 285     if(J_SDA_1_or_0)
1362  030d c65006        	ld	a,20486
1363  0310 a504          	bcp	a,#4
1364  0312 2702          	jreq	L144
1365                     ; 286     { TempData++; }
1367  0314 0c02          	inc	(OFST+0,sp)
1368  0316               L144:
1369                     ; 287     SCL_0;
1371  0316 72175005      	bres	20485,#3
1372                     ; 288     delay(IIC_DELAY);
1374  031a a628          	ld	a,#40
1375  031c cd0147        	call	_delay
1377                     ; 279   for (i=0; i<8; i++)
1379  031f 0c01          	inc	(OFST-1,sp)
1382  0321 7b01          	ld	a,(OFST-1,sp)
1383  0323 a108          	cp	a,#8
1384  0325 25d6          	jrult	L334
1385                     ; 290   SDA_OUT;
1387  0327 72145007      	bset	20487,#2
1388                     ; 291   return(TempData);
1390  032b 7b02          	ld	a,(OFST+0,sp)
1393  032d 85            	popw	x
1394  032e 81            	ret
1438                     ; 294 u8 RX1_Byte(void)
1438                     ; 295 {
1439                     	switch	.text
1440  032f               _RX1_Byte:
1442  032f 89            	pushw	x
1443       00000002      OFST:	set	2
1446                     ; 297   u8 TempData = 0;
1448  0330 0f02          	clr	(OFST+0,sp)
1449                     ; 298   D_SDA_IN;
1451  0332 7215500c      	bres	20492,#2
1452                     ; 299   for (i=0; i<8; i++)
1454  0336 0f01          	clr	(OFST-1,sp)
1455  0338               L564:
1456                     ; 301     delay(IIC_DELAY);
1458  0338 a628          	ld	a,#40
1459  033a cd0147        	call	_delay
1461                     ; 302     D_SCL_1;
1463  033d 721a5014      	bset	20500,#5
1464                     ; 303     delay(IIC_DELAY);
1466  0341 a628          	ld	a,#40
1467  0343 cd0147        	call	_delay
1469                     ; 304     TempData <<= 1;
1471  0346 0802          	sll	(OFST+0,sp)
1472                     ; 305     if(J_D_SDA_1_or_0)
1474  0348 c6500b        	ld	a,20491
1475  034b a504          	bcp	a,#4
1476  034d 2702          	jreq	L374
1477                     ; 306     { TempData++; }
1479  034f 0c02          	inc	(OFST+0,sp)
1480  0351               L374:
1481                     ; 307     D_SCL_0;
1483  0351 721b5014      	bres	20500,#5
1484                     ; 308     delay(IIC_DELAY);
1486  0355 a628          	ld	a,#40
1487  0357 cd0147        	call	_delay
1489                     ; 299   for (i=0; i<8; i++)
1491  035a 0c01          	inc	(OFST-1,sp)
1494  035c 7b01          	ld	a,(OFST-1,sp)
1495  035e a108          	cp	a,#8
1496  0360 25d6          	jrult	L564
1497                     ; 310   D_SDA_OUT;
1499  0362 7214500c      	bset	20492,#2
1500                     ; 311   return(TempData);
1502  0366 7b02          	ld	a,(OFST+0,sp)
1505  0368 85            	popw	x
1506  0369 81            	ret
1550                     ; 313 u8 RX2_Byte(void)
1550                     ; 314 {
1551                     	switch	.text
1552  036a               _RX2_Byte:
1554  036a 89            	pushw	x
1555       00000002      OFST:	set	2
1558                     ; 316   u8 TempData = 0;
1560  036b 0f02          	clr	(OFST+0,sp)
1561                     ; 317   SDA1_IN;
1563  036d 72115011      	bres	20497,#0
1564                     ; 318   for (i=0; i<8; i++)
1566  0371 0f01          	clr	(OFST-1,sp)
1567  0373               L715:
1568                     ; 320     delay(IIC_DELAY);
1570  0373 a628          	ld	a,#40
1571  0375 cd0147        	call	_delay
1573                     ; 321     SCL1_1;
1575  0378 721e500a      	bset	20490,#7
1576                     ; 322     delay(IIC_DELAY);
1578  037c a628          	ld	a,#40
1579  037e cd0147        	call	_delay
1581                     ; 323     TempData <<= 1;
1583  0381 0802          	sll	(OFST+0,sp)
1584                     ; 324     if(J_SDA1_1_or_0)
1586  0383 c65010        	ld	a,20496
1587  0386 a501          	bcp	a,#1
1588  0388 2702          	jreq	L525
1589                     ; 325     { TempData++; }
1591  038a 0c02          	inc	(OFST+0,sp)
1592  038c               L525:
1593                     ; 326     SCL1_0;
1595  038c 721f500a      	bres	20490,#7
1596                     ; 327     delay(IIC_DELAY);
1598  0390 a628          	ld	a,#40
1599  0392 cd0147        	call	_delay
1601                     ; 318   for (i=0; i<8; i++)
1603  0395 0c01          	inc	(OFST-1,sp)
1606  0397 7b01          	ld	a,(OFST-1,sp)
1607  0399 a108          	cp	a,#8
1608  039b 25d6          	jrult	L715
1609                     ; 329   SDA1_OUT;
1611  039d 72105011      	bset	20497,#0
1612                     ; 330   return(TempData);
1614  03a1 7b02          	ld	a,(OFST+0,sp)
1617  03a3 85            	popw	x
1618  03a4 81            	ret
1653                     ; 332 void  ReceiveAck(void)
1653                     ; 333 {
1654                     	switch	.text
1655  03a5               _ReceiveAck:
1657  03a5 88            	push	a
1658       00000001      OFST:	set	1
1661                     ; 334   u8  k1=0;
1663  03a6 0f01          	clr	(OFST+0,sp)
1664                     ; 335   SDA_IN;
1666  03a8 72155007      	bres	20487,#2
1667                     ; 336   SCL_1;
1669  03ac 72165005      	bset	20485,#3
1670                     ; 337   delay(IIC_DELAY);
1672  03b0 a628          	ld	a,#40
1673  03b2 cd0147        	call	_delay
1676  03b5 2017          	jra	L745
1677  03b7               L545:
1678                     ; 340     k1++;
1680  03b7 0c01          	inc	(OFST+0,sp)
1681                     ; 341     if(k1>=250)
1683  03b9 7b01          	ld	a,(OFST+0,sp)
1684  03bb a1fa          	cp	a,#250
1685  03bd 250f          	jrult	L745
1686                     ; 343       break;
1687  03bf               L155:
1688                     ; 346   SCL_0;
1690  03bf 72175005      	bres	20485,#3
1691                     ; 347   SDA_OUT;
1693  03c3 72145007      	bset	20487,#2
1694                     ; 348   delay(IIC_DELAY);
1696  03c7 a628          	ld	a,#40
1697  03c9 cd0147        	call	_delay
1699                     ; 354 }
1702  03cc 84            	pop	a
1703  03cd 81            	ret
1704  03ce               L745:
1705                     ; 338   while(J_SDA_1_or_0)
1707  03ce c65006        	ld	a,20486
1708  03d1 a504          	bcp	a,#4
1709  03d3 26e2          	jrne	L545
1710  03d5 20e8          	jra	L155
1745                     ; 356 void  ReceiveAck1(void)
1745                     ; 357 {
1746                     	switch	.text
1747  03d7               _ReceiveAck1:
1749  03d7 88            	push	a
1750       00000001      OFST:	set	1
1753                     ; 358   u8  k1=0;
1755  03d8 0f01          	clr	(OFST+0,sp)
1756                     ; 359   D_SDA_IN;
1758  03da 7215500c      	bres	20492,#2
1759                     ; 360   D_SCL_1;
1761  03de 721a5014      	bset	20500,#5
1762                     ; 361   delay(IIC_DELAY);
1764  03e2 a628          	ld	a,#40
1765  03e4 cd0147        	call	_delay
1768  03e7 2017          	jra	L575
1769  03e9               L375:
1770                     ; 364     k1++;
1772  03e9 0c01          	inc	(OFST+0,sp)
1773                     ; 365     if(k1>=50)
1775  03eb 7b01          	ld	a,(OFST+0,sp)
1776  03ed a132          	cp	a,#50
1777  03ef 250f          	jrult	L575
1778                     ; 367       break;
1779  03f1               L775:
1780                     ; 370   D_SCL_0;
1782  03f1 721b5014      	bres	20500,#5
1783                     ; 371   D_SDA_OUT;
1785  03f5 7214500c      	bset	20492,#2
1786                     ; 372   delay(IIC_DELAY);
1788  03f9 a628          	ld	a,#40
1789  03fb cd0147        	call	_delay
1791                     ; 378 }
1794  03fe 84            	pop	a
1795  03ff 81            	ret
1796  0400               L575:
1797                     ; 362   while(J_D_SDA_1_or_0)
1799  0400 c6500b        	ld	a,20491
1800  0403 a504          	bcp	a,#4
1801  0405 26e2          	jrne	L375
1802  0407 20e8          	jra	L775
1837                     ; 379 void  ReceiveAck2(void)
1837                     ; 380 {
1838                     	switch	.text
1839  0409               _ReceiveAck2:
1841  0409 88            	push	a
1842       00000001      OFST:	set	1
1845                     ; 381   u8  k1=0;
1847  040a 0f01          	clr	(OFST+0,sp)
1848                     ; 382   SDA1_IN;
1850  040c 72115011      	bres	20497,#0
1851                     ; 383   SCL1_1;
1853  0410 721e500a      	bset	20490,#7
1854                     ; 384   delay(IIC_DELAY);
1856  0414 a628          	ld	a,#40
1857  0416 cd0147        	call	_delay
1860  0419 2017          	jra	L326
1861  041b               L126:
1862                     ; 387     k1++;
1864  041b 0c01          	inc	(OFST+0,sp)
1865                     ; 388     if(k1>=250)
1867  041d 7b01          	ld	a,(OFST+0,sp)
1868  041f a1fa          	cp	a,#250
1869  0421 250f          	jrult	L326
1870                     ; 390       break;
1871  0423               L526:
1872                     ; 393   SCL1_0;
1874  0423 721f500a      	bres	20490,#7
1875                     ; 394   SDA1_OUT;
1877  0427 72105011      	bset	20497,#0
1878                     ; 395   delay(IIC_DELAY);
1880  042b a628          	ld	a,#40
1881  042d cd0147        	call	_delay
1883                     ; 401 }
1886  0430 84            	pop	a
1887  0431 81            	ret
1888  0432               L326:
1889                     ; 385   while(J_SDA1_1_or_0)
1891  0432 c65010        	ld	a,20496
1892  0435 a501          	bcp	a,#1
1893  0437 26e2          	jrne	L126
1894  0439 20e8          	jra	L526
1951                     ; 402 void  APTTouchWrOneData(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
1951                     ; 403 {
1952                     	switch	.text
1953  043b               _APTTouchWrOneData:
1955  043b 89            	pushw	x
1956       00000000      OFST:	set	0
1959                     ; 404    IIC_initial();
1961  043c cd0152        	call	_IIC_initial
1963                     ; 405    Start();
1965  043f cd0179        	call	_Start
1967                     ; 406    TX_Byte((apt_add<<1)|0x00);
1969  0442 7b01          	ld	a,(OFST+1,sp)
1970  0444 48            	sll	a
1971  0445 cd0240        	call	_TX_Byte
1973                     ; 407    ReceiveAck();
1975  0448 cd03a5        	call	_ReceiveAck
1977                     ; 408    TX_Byte(APTWrAdd);
1979  044b 7b02          	ld	a,(OFST+2,sp)
1980  044d cd0240        	call	_TX_Byte
1982                     ; 409    ReceiveAck();
1984  0450 cd03a5        	call	_ReceiveAck
1986                     ; 410    TX_Byte(APTWrData);
1988  0453 7b05          	ld	a,(OFST+5,sp)
1989  0455 cd0240        	call	_TX_Byte
1991                     ; 411    ReceiveAck();
1993  0458 cd03a5        	call	_ReceiveAck
1995                     ; 412    Stop();
1997  045b cd01ec        	call	_Stop
1999                     ; 413 }
2002  045e 85            	popw	x
2003  045f 81            	ret
2060                     ; 415 void  APTTouchWrOneData1(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
2060                     ; 416 {
2061                     	switch	.text
2062  0460               _APTTouchWrOneData1:
2064  0460 89            	pushw	x
2065       00000000      OFST:	set	0
2068                     ; 417    IIC2_initial();
2070  0461 cd016c        	call	_IIC2_initial
2072                     ; 418    Start2();
2074  0464 cd01c3        	call	_Start2
2076                     ; 419    TX2_Byte((apt_add<<1)|0x00);
2078  0467 7b01          	ld	a,(OFST+1,sp)
2079  0469 48            	sll	a
2080  046a cd02b8        	call	_TX2_Byte
2082                     ; 420    ReceiveAck2();
2084  046d ad9a          	call	_ReceiveAck2
2086                     ; 421    TX2_Byte(APTWrAdd);
2088  046f 7b02          	ld	a,(OFST+2,sp)
2089  0471 cd02b8        	call	_TX2_Byte
2091                     ; 422    ReceiveAck2();
2093  0474 ad93          	call	_ReceiveAck2
2095                     ; 423    TX2_Byte(APTWrData);
2097  0476 7b05          	ld	a,(OFST+5,sp)
2098  0478 cd02b8        	call	_TX2_Byte
2100                     ; 424    ReceiveAck2();
2102  047b ad8c          	call	_ReceiveAck2
2104                     ; 425    Stop2();
2106  047d cd0224        	call	_Stop2
2108                     ; 426 }
2111  0480 85            	popw	x
2112  0481 81            	ret
2170                     ; 430 u8  APTTouchRdOneData(u8 apt_add,u8 APTRdAdd)
2170                     ; 431 {
2171                     	switch	.text
2172  0482               _APTTouchRdOneData:
2174  0482 89            	pushw	x
2175  0483 88            	push	a
2176       00000001      OFST:	set	1
2179                     ; 432    u8 APTRdData=0;
2181  0484 0f01          	clr	(OFST+0,sp)
2182                     ; 434    IIC_initial();
2184  0486 cd0152        	call	_IIC_initial
2186                     ; 435    Start();
2188  0489 cd0179        	call	_Start
2190                     ; 436    TX_Byte((apt_add<<1)|0x00);
2192  048c 7b02          	ld	a,(OFST+1,sp)
2193  048e 48            	sll	a
2194  048f cd0240        	call	_TX_Byte
2196                     ; 437    ReceiveAck();
2198  0492 cd03a5        	call	_ReceiveAck
2200                     ; 438    TX_Byte(APTRdAdd);
2202  0495 7b03          	ld	a,(OFST+2,sp)
2203  0497 cd0240        	call	_TX_Byte
2205                     ; 439    ReceiveAck();
2207  049a cd03a5        	call	_ReceiveAck
2209                     ; 440    Stop();
2211  049d cd01ec        	call	_Stop
2213                     ; 441    Start();
2215  04a0 cd0179        	call	_Start
2217                     ; 442    TX_Byte((apt_add<<1)|0x01);
2219  04a3 7b02          	ld	a,(OFST+1,sp)
2220  04a5 48            	sll	a
2221  04a6 aa01          	or	a,#1
2222  04a8 cd0240        	call	_TX_Byte
2224                     ; 443    ReceiveAck();
2226  04ab cd03a5        	call	_ReceiveAck
2228                     ; 444    APTRdData=RX_Byte();
2230  04ae cd02f4        	call	_RX_Byte
2232  04b1 6b01          	ld	(OFST+0,sp),a
2233                     ; 445    Stop();
2235  04b3 cd01ec        	call	_Stop
2237                     ; 446    return(APTRdData);
2239  04b6 7b01          	ld	a,(OFST+0,sp)
2242  04b8 5b03          	addw	sp,#3
2243  04ba 81            	ret
2301                     ; 449 u8  APTTouchRdOneData1(u8 apt_add,u8 APTRdAdd)
2301                     ; 450 {
2302                     	switch	.text
2303  04bb               _APTTouchRdOneData1:
2305  04bb 89            	pushw	x
2306  04bc 88            	push	a
2307       00000001      OFST:	set	1
2310                     ; 451    u8 APTRdData=0;
2312  04bd 0f01          	clr	(OFST+0,sp)
2313                     ; 453    IIC2_initial();
2315  04bf cd016c        	call	_IIC2_initial
2317                     ; 454    Start2();
2319  04c2 cd01c3        	call	_Start2
2321                     ; 455    TX2_Byte((apt_add<<1)|0x00);
2323  04c5 7b02          	ld	a,(OFST+1,sp)
2324  04c7 48            	sll	a
2325  04c8 cd02b8        	call	_TX2_Byte
2327                     ; 456    ReceiveAck2();
2329  04cb cd0409        	call	_ReceiveAck2
2331                     ; 457    TX2_Byte(APTRdAdd);
2333  04ce 7b03          	ld	a,(OFST+2,sp)
2334  04d0 cd02b8        	call	_TX2_Byte
2336                     ; 458    ReceiveAck2();
2338  04d3 cd0409        	call	_ReceiveAck2
2340                     ; 459    Stop2();
2342  04d6 cd0224        	call	_Stop2
2344                     ; 460    Start2();
2346  04d9 cd01c3        	call	_Start2
2348                     ; 461    TX2_Byte((apt_add<<1)|0x01);
2350  04dc 7b02          	ld	a,(OFST+1,sp)
2351  04de 48            	sll	a
2352  04df aa01          	or	a,#1
2353  04e1 cd02b8        	call	_TX2_Byte
2355                     ; 462    ReceiveAck2();
2357  04e4 cd0409        	call	_ReceiveAck2
2359                     ; 463    APTRdData=RX2_Byte();
2361  04e7 cd036a        	call	_RX2_Byte
2363  04ea 6b01          	ld	(OFST+0,sp),a
2364                     ; 464    Stop2();
2366  04ec cd0224        	call	_Stop2
2368                     ; 465    return(APTRdData);
2370  04ef 7b01          	ld	a,(OFST+0,sp)
2373  04f1 5b03          	addw	sp,#3
2374  04f3 81            	ret
2432                     ; 468 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)                
2432                     ; 469 {                                                                                                                                                                                                                         
2433                     	switch	.text
2434  04f4               _IWDG_WriteAccessCmd:
2438                     ; 470     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));                   
2440                     ; 472     IWDG->KR = (u8)IWDG_WriteAccess;                                                                                                               
2442  04f4 c750e0        	ld	20704,a
2443                     ; 473 }                                                                                                                                                                
2446  04f7 81            	ret
2536                     ; 474 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)                      
2536                     ; 475 {                                                                                                                                     
2537                     	switch	.text
2538  04f8               _IWDG_SetPrescaler:
2542                     ; 476     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));                            
2544                     ; 478     IWDG->PR = (u8)IWDG_Prescaler;                                                 
2546  04f8 c750e1        	ld	20705,a
2547                     ; 479 }                                                                                                                                                                
2550  04fb 81            	ret
2584                     ; 480 void IWDG_SetReload(u8 IWDG_Reload)                                                
2584                     ; 481 {                                                                                  
2585                     	switch	.text
2586  04fc               _IWDG_SetReload:
2590                     ; 482     IWDG->RLR = IWDG_Reload;                                                       
2592  04fc c750e2        	ld	20706,a
2593                     ; 483 }                                                                                                                                                                 
2596  04ff 81            	ret
2619                     ; 484 void IWDG_ReloadCounter(void)                                                      
2619                     ; 485 {                                                                                  
2620                     	switch	.text
2621  0500               _IWDG_ReloadCounter:
2625                     ; 486     IWDG->KR = IWDG_KEY_REFRESH;                                                   
2627  0500 35aa50e0      	mov	20704,#170
2628                     ; 487 }                                                                                  
2631  0504 81            	ret
2654                     ; 489 void IWDG_Enable(void)                                                             
2654                     ; 490 {                                                                                  
2655                     	switch	.text
2656  0505               _IWDG_Enable:
2660                     ; 491     IWDG->KR = IWDG_KEY_ENABLE;                                                    
2662  0505 35cc50e0      	mov	20704,#204
2663                     ; 492 } 
2666  0509 81            	ret
2711                     ; 494 u8 Check_Unique_ID(void)
2711                     ; 495 {
2712                     	switch	.text
2713  050a               _Check_Unique_ID:
2715  050a 5208          	subw	sp,#8
2716       00000008      OFST:	set	8
2719                     ; 499   UID[0] =*(u8*)(User_option_address+0);
2721  050c c648cd        	ld	a,18637
2722  050f 6b01          	ld	(OFST-7,sp),a
2723                     ; 500   UID[1] =*(u8*)(User_option_address+1);
2725  0511 c648ce        	ld	a,18638
2726  0514 6b02          	ld	(OFST-6,sp),a
2727                     ; 501   UID[2] =*(u8*)(User_option_address+2);
2729  0516 c648cf        	ld	a,18639
2730  0519 6b03          	ld	(OFST-5,sp),a
2731                     ; 502   UID[3] =*(u8*)(User_option_address+3);
2733  051b c648d0        	ld	a,18640
2734  051e 6b04          	ld	(OFST-4,sp),a
2735                     ; 504   Result[0] =0x82&UID[0];
2737  0520 7b01          	ld	a,(OFST-7,sp)
2738  0522 a482          	and	a,#130
2739  0524 6b05          	ld	(OFST-3,sp),a
2740                     ; 505   Result[1] =0x19&UID[1];
2742  0526 7b02          	ld	a,(OFST-6,sp)
2743  0528 a419          	and	a,#25
2744  052a 6b06          	ld	(OFST-2,sp),a
2745                     ; 506   Result[2] =0xAA&UID[2];
2747  052c 7b03          	ld	a,(OFST-5,sp)
2748  052e a4aa          	and	a,#170
2749  0530 6b07          	ld	(OFST-1,sp),a
2750                     ; 507   Result[3] =0x55&UID[3];
2752  0532 7b04          	ld	a,(OFST-4,sp)
2753  0534 a455          	and	a,#85
2754  0536 6b08          	ld	(OFST+0,sp),a
2755                     ; 509   if(((*(u8*)(0xFF00+0))==Result[0])&&((*(u8*)(0xFF00+1))==Result[1])&&((*(u8*)(0xFF00+2))==Result[2])&&((*(u8*)(0xFF00+3))==Result[3]))  return(0);
2757  0538 c6ff00        	ld	a,65280
2758  053b 1105          	cp	a,(OFST-3,sp)
2759  053d 2618          	jrne	L7211
2761  053f c6ff01        	ld	a,65281
2762  0542 1106          	cp	a,(OFST-2,sp)
2763  0544 2611          	jrne	L7211
2765  0546 c6ff02        	ld	a,65282
2766  0549 1107          	cp	a,(OFST-1,sp)
2767  054b 260a          	jrne	L7211
2769  054d c6ff03        	ld	a,65283
2770  0550 1108          	cp	a,(OFST+0,sp)
2771  0552 2603          	jrne	L7211
2774  0554 4f            	clr	a
2776  0555 2002          	jra	L411
2777  0557               L7211:
2778                     ; 510   else return(1); 	
2780  0557 a601          	ld	a,#1
2782  0559               L411:
2784  0559 5b08          	addw	sp,#8
2785  055b 81            	ret
2810                     ; 513 void vf_fan_deal(void)
2810                     ; 514 {
2811                     	switch	.text
2812  055c               _vf_fan_deal:
2816                     ; 515 	fan_on++;
2818  055c 3c03          	inc	_fan_on
2819                     ; 516 	if(fan_on >=4) fan_on =0;
2821  055e b603          	ld	a,_fan_on
2822  0560 a104          	cp	a,#4
2823  0562 2502          	jrult	L3411
2826  0564 3f03          	clr	_fan_on
2827  0566               L3411:
2828                     ; 517 	if(fan_on >=fan_status)  FAN_OFF;
2830  0566 b603          	ld	a,_fan_on
2831  0568 b100          	cp	a,_fan_status
2832  056a 2506          	jrult	L5411
2835  056c 7219500f      	bres	20495,#4
2837  0570 2004          	jra	L7411
2838  0572               L5411:
2839                     ; 518 	else 	FAN_ON;
2841  0572 7218500f      	bset	20495,#4
2842  0576               L7411:
2843                     ; 519 }
2846  0576 81            	ret
2889                     ; 521 u8 flex_ntc_deal(u8 par,u8 data)
2889                     ; 522 {
2890                     	switch	.text
2891  0577               _flex_ntc_deal:
2893  0577 89            	pushw	x
2894       00000000      OFST:	set	0
2897                     ; 523 	if((par ==2)||(par ==4))  data |=0x80;			//bit8 ->1 -> flex NTC
2899  0578 9e            	ld	a,xh
2900  0579 a102          	cp	a,#2
2901  057b 2705          	jreq	L5711
2903  057d 9e            	ld	a,xh
2904  057e a104          	cp	a,#4
2905  0580 2606          	jrne	L3711
2906  0582               L5711:
2909  0582 7b02          	ld	a,(OFST+2,sp)
2910  0584 aa80          	or	a,#128
2911  0586 6b02          	ld	(OFST+2,sp),a
2912  0588               L3711:
2913                     ; 524 				  data |=0x40;			//bit7 ->1 -> PWM direct setting mode
2915  0588 7b02          	ld	a,(OFST+2,sp)
2916  058a aa40          	or	a,#64
2917  058c 6b02          	ld	(OFST+2,sp),a
2918                     ; 525 	return(data);
2920  058e 7b02          	ld	a,(OFST+2,sp)
2923  0590 85            	popw	x
2924  0591 81            	ret
2976                     ; 528 u8 zone_x_cur_no_set(u8 par,u8 count_ppg)
2976                     ; 529 {
2977                     	switch	.text
2978  0592               _zone_x_cur_no_set:
2980  0592 89            	pushw	x
2981  0593 88            	push	a
2982       00000001      OFST:	set	1
2985                     ; 530   u8 result =0;
2987  0594 0f01          	clr	(OFST+0,sp)
2988                     ; 531   if(par %2)		//1# 3#
2990  0596 9e            	ld	a,xh
2991  0597 a501          	bcp	a,#1
2992  0599 2730          	jreq	L5221
2993                     ; 533   result =CON_NO_CUR1_MIN;
2995  059b a620          	ld	a,#32
2996  059d 6b01          	ld	(OFST+0,sp),a
2997                     ; 534   if((count_ppg >=CON_PWM_20us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR1_LOW;	//17US<PPG<20US 
2999  059f 7b03          	ld	a,(OFST+2,sp)
3000  05a1 a160          	cp	a,#96
3001  05a3 250a          	jrult	L7221
3003  05a5 7b03          	ld	a,(OFST+2,sp)
3004  05a7 a178          	cp	a,#120
3005  05a9 2404          	jruge	L7221
3008  05ab a630          	ld	a,#48
3009  05ad 6b01          	ld	(OFST+0,sp),a
3010  05af               L7221:
3011                     ; 535   if((count_ppg >=CON_PWM_23us)&&(count_ppg <CON_PWM_20us)) 	result =CON_NO_CUR1_MID;	//20US<PPG<23US 
3013  05af 7b03          	ld	a,(OFST+2,sp)
3014  05b1 a148          	cp	a,#72
3015  05b3 250a          	jrult	L1321
3017  05b5 7b03          	ld	a,(OFST+2,sp)
3018  05b7 a160          	cp	a,#96
3019  05b9 2404          	jruge	L1321
3022  05bb a638          	ld	a,#56
3023  05bd 6b01          	ld	(OFST+0,sp),a
3024  05bf               L1321:
3025                     ; 536   if(count_ppg <CON_PWM_23us)		 			result =CON_NO_CUR1_HIG;	//23US<PPG
3027  05bf 7b03          	ld	a,(OFST+2,sp)
3028  05c1 a148          	cp	a,#72
3029  05c3 2434          	jruge	L5321
3032  05c5 a648          	ld	a,#72
3033  05c7 6b01          	ld	(OFST+0,sp),a
3034  05c9 202e          	jra	L5321
3035  05cb               L5221:
3036                     ; 540   result =CON_NO_CUR2_MIN;
3038  05cb a628          	ld	a,#40
3039  05cd 6b01          	ld	(OFST+0,sp),a
3040                     ; 541   if((count_ppg >=CON_PWM_17us)&&(count_ppg <CON_PWM_15us)) 	result =CON_NO_CUR2_LOW;	//15US<PPG<17US 
3042  05cf 7b03          	ld	a,(OFST+2,sp)
3043  05d1 a178          	cp	a,#120
3044  05d3 250a          	jrult	L7321
3046  05d5 7b03          	ld	a,(OFST+2,sp)
3047  05d7 a188          	cp	a,#136
3048  05d9 2404          	jruge	L7321
3051  05db a638          	ld	a,#56
3052  05dd 6b01          	ld	(OFST+0,sp),a
3053  05df               L7321:
3054                     ; 542   if((count_ppg >=CON_PWM_19us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR2_MID;	//17US<PPG<19US 
3056  05df 7b03          	ld	a,(OFST+2,sp)
3057  05e1 a168          	cp	a,#104
3058  05e3 250a          	jrult	L1421
3060  05e5 7b03          	ld	a,(OFST+2,sp)
3061  05e7 a178          	cp	a,#120
3062  05e9 2404          	jruge	L1421
3065  05eb a648          	ld	a,#72
3066  05ed 6b01          	ld	(OFST+0,sp),a
3067  05ef               L1421:
3068                     ; 543   if(count_ppg <CON_PWM_19us)		 			result =CON_NO_CUR2_HIG;	//19US<PPG
3070  05ef 7b03          	ld	a,(OFST+2,sp)
3071  05f1 a168          	cp	a,#104
3072  05f3 2404          	jruge	L5321
3075  05f5 a650          	ld	a,#80
3076  05f7 6b01          	ld	(OFST+0,sp),a
3077  05f9               L5321:
3078                     ; 546   return(result);
3080  05f9 7b01          	ld	a,(OFST+0,sp)
3083  05fb 5b03          	addw	sp,#3
3084  05fd 81            	ret
3118                     ; 550 void UART2_DeInit(void)                                                                                                                                                                   
3118                     ; 551 {                                                                                                                                                                                         
3119                     	switch	.text
3120  05fe               _UART2_DeInit:
3122  05fe 88            	push	a
3123       00000001      OFST:	set	1
3126                     ; 552     u8 dummy = 0;                                                                                                                                                                                                                                                                                   
3128  05ff 0f01          	clr	(OFST+0,sp)
3129                     ; 553     dummy = UART2->SR;                                                                                                                                                                    
3131  0601 c65240        	ld	a,21056
3132  0604 6b01          	ld	(OFST+0,sp),a
3133                     ; 554     dummy = UART2->DR;                                                                                                                                                                    
3135  0606 c65241        	ld	a,21057
3136  0609 6b01          	ld	(OFST+0,sp),a
3137                     ; 556     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */                                                                                                      
3139  060b 725f5243      	clr	21059
3140                     ; 557     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */                                                                                                      
3142  060f 725f5242      	clr	21058
3143                     ; 559     UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */                                                                                                         
3145  0613 725f5244      	clr	21060
3146                     ; 560     UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */                                                                                                         
3148  0617 725f5245      	clr	21061
3149                     ; 561     UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */                                                                                                        
3151  061b 725f5246      	clr	21062
3152                     ; 562     UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */                                                                                                        
3154  061f 725f5247      	clr	21063
3155                     ; 563     UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */                                                                                                         
3157  0623 725f5248      	clr	21064
3158                     ; 564     UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */                                                                                                                                                                                                                                                                                                  
3160  0627 725f5249      	clr	21065
3161                     ; 565 } 
3164  062b 84            	pop	a
3165  062c 81            	ret
3485                     .const:	section	.text
3486  0000               L031:
3487  0000 00000064      	dc.l	100
3488                     ; 579 void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
3488                     ; 580 {                                                                                                                                                                                         
3489                     	switch	.text
3490  062d               _UART2_Init:
3492  062d 520e          	subw	sp,#14
3493       0000000e      OFST:	set	14
3496                     ; 581     u8 BRR2_1, BRR2_2 = 0;                                                                                                                                                                
3498  062f 7b06          	ld	a,(OFST-8,sp)
3499  0631 97            	ld	xl,a
3500                     ; 582     u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;                                                                                                                                      
3502  0632 96            	ldw	x,sp
3503  0633 1c0007        	addw	x,#OFST-7
3504  0636 cd0000        	call	c_ltor
3506                     ; 585     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));                                                                                                                                         
3508                     ; 587     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));                                                                                                                                     
3510                     ; 589     assert_param(IS_UART2_STOPBITS_OK(StopBits));                                                                                                                                         
3512                     ; 591     assert_param(IS_UART2_PARITY_OK(Parity));                                                                                                                                             
3514                     ; 594     assert_param(IS_UART2_MODE_OK((u8)Mode));                                                                                                                                             
3516                     ; 598     assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));                                                                                                                                     
3518                     ; 600     UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */                                                                                                                  
3520  0639 72195244      	bres	21060,#4
3521                     ; 601     UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */                                                                                     
3523  063d c65244        	ld	a,21060
3524  0640 1a15          	or	a,(OFST+7,sp)
3525  0642 c75244        	ld	21060,a
3526                     ; 603     UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */                                                                                                                     
3528  0645 c65246        	ld	a,21062
3529  0648 a4cf          	and	a,#207
3530  064a c75246        	ld	21062,a
3531                     ; 604     UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */                                                                                      
3533  064d c65246        	ld	a,21062
3534  0650 1a16          	or	a,(OFST+8,sp)
3535  0652 c75246        	ld	21062,a
3536                     ; 606     UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */                                                                                         
3538  0655 c65244        	ld	a,21060
3539  0658 a4f9          	and	a,#249
3540  065a c75244        	ld	21060,a
3541                     ; 607     UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */                                                                                                   
3543  065d c65244        	ld	a,21060
3544  0660 1a17          	or	a,(OFST+9,sp)
3545  0662 c75244        	ld	21060,a
3546                     ; 609     UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */                                                                                                    
3548  0665 725f5242      	clr	21058
3549                     ; 610     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */                                                                                                    
3551  0669 c65243        	ld	a,21059
3552  066c a40f          	and	a,#15
3553  066e c75243        	ld	21059,a
3554                     ; 611     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */                                                                                                    
3556  0671 c65243        	ld	a,21059
3557  0674 a4f0          	and	a,#240
3558  0676 c75243        	ld	21059,a
3559                     ; 614     BaudRate_Mantissa    = ((u32)16000000 / (BaudRate << 4));                                                                                                                   
3561  0679 96            	ldw	x,sp
3562  067a 1c0011        	addw	x,#OFST+3
3563  067d cd0000        	call	c_ltor
3565  0680 a604          	ld	a,#4
3566  0682 cd0000        	call	c_llsh
3568  0685 96            	ldw	x,sp
3569  0686 1c0001        	addw	x,#OFST-13
3570  0689 cd0000        	call	c_rtol
3572  068c ae2400        	ldw	x,#9216
3573  068f bf02          	ldw	c_lreg+2,x
3574  0691 ae00f4        	ldw	x,#244
3575  0694 bf00          	ldw	c_lreg,x
3576  0696 96            	ldw	x,sp
3577  0697 1c0001        	addw	x,#OFST-13
3578  069a cd0000        	call	c_ludv
3580  069d 96            	ldw	x,sp
3581  069e 1c000b        	addw	x,#OFST-3
3582  06a1 cd0000        	call	c_rtol
3584                     ; 615     BaudRate_Mantissa100 = (((u32)16000000 * 100) / (BaudRate << 4));                                                                                                           
3586  06a4 96            	ldw	x,sp
3587  06a5 1c0011        	addw	x,#OFST+3
3588  06a8 cd0000        	call	c_ltor
3590  06ab a604          	ld	a,#4
3591  06ad cd0000        	call	c_llsh
3593  06b0 96            	ldw	x,sp
3594  06b1 1c0001        	addw	x,#OFST-13
3595  06b4 cd0000        	call	c_rtol
3597  06b7 ae1000        	ldw	x,#4096
3598  06ba bf02          	ldw	c_lreg+2,x
3599  06bc ae5f5e        	ldw	x,#24414
3600  06bf bf00          	ldw	c_lreg,x
3601  06c1 96            	ldw	x,sp
3602  06c2 1c0001        	addw	x,#OFST-13
3603  06c5 cd0000        	call	c_ludv
3605  06c8 96            	ldw	x,sp
3606  06c9 1c0007        	addw	x,#OFST-7
3607  06cc cd0000        	call	c_rtol
3609                     ; 617     BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */                                                                                                    
3611  06cf 96            	ldw	x,sp
3612  06d0 1c000b        	addw	x,#OFST-3
3613  06d3 cd0000        	call	c_ltor
3615  06d6 a664          	ld	a,#100
3616  06d8 cd0000        	call	c_smul
3618  06db 96            	ldw	x,sp
3619  06dc 1c0001        	addw	x,#OFST-13
3620  06df cd0000        	call	c_rtol
3622  06e2 96            	ldw	x,sp
3623  06e3 1c0007        	addw	x,#OFST-7
3624  06e6 cd0000        	call	c_ltor
3626  06e9 96            	ldw	x,sp
3627  06ea 1c0001        	addw	x,#OFST-13
3628  06ed cd0000        	call	c_lsub
3630  06f0 a604          	ld	a,#4
3631  06f2 cd0000        	call	c_llsh
3633  06f5 ae0000        	ldw	x,#L031
3634  06f8 cd0000        	call	c_ludv
3636  06fb b603          	ld	a,c_lreg+3
3637  06fd a40f          	and	a,#15
3638  06ff 6b05          	ld	(OFST-9,sp),a
3639                     ; 618     BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);                                                                                                                                   
3641  0701 96            	ldw	x,sp
3642  0702 1c000b        	addw	x,#OFST-3
3643  0705 cd0000        	call	c_ltor
3645  0708 a604          	ld	a,#4
3646  070a cd0000        	call	c_lursh
3648  070d b603          	ld	a,c_lreg+3
3649  070f a4f0          	and	a,#240
3650  0711 b703          	ld	c_lreg+3,a
3651  0713 3f02          	clr	c_lreg+2
3652  0715 3f01          	clr	c_lreg+1
3653  0717 3f00          	clr	c_lreg
3654  0719 b603          	ld	a,c_lreg+3
3655  071b 6b06          	ld	(OFST-8,sp),a
3656                     ; 620     UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);                                                                                                                                                  
3658  071d 7b05          	ld	a,(OFST-9,sp)
3659  071f 1a06          	or	a,(OFST-8,sp)
3660  0721 c75243        	ld	21059,a
3661                     ; 621     UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */                                                                                               
3663  0724 7b0e          	ld	a,(OFST+0,sp)
3664  0726 c75242        	ld	21058,a
3665                     ; 623     UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */                                           
3667  0729 c65245        	ld	a,21061
3668  072c a4f3          	and	a,#243
3669  072e c75245        	ld	21061,a
3670                     ; 624     UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */                                             
3672  0731 c65246        	ld	a,21062
3673  0734 a4f8          	and	a,#248
3674  0736 c75246        	ld	21062,a
3675                     ; 625     UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */                          
3677  0739 7b18          	ld	a,(OFST+10,sp)
3678  073b a407          	and	a,#7
3679  073d ca5246        	or	a,21062
3680  0740 c75246        	ld	21062,a
3681                     ; 627     if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)                                                                                                                                              
3683  0743 7b19          	ld	a,(OFST+11,sp)
3684  0745 a504          	bcp	a,#4
3685  0747 2706          	jreq	L5441
3686                     ; 629         UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */                                                                                                          
3688  0749 72165245      	bset	21061,#3
3690  074d 2004          	jra	L7441
3691  074f               L5441:
3692                     ; 633         UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */                                                                                                    
3694  074f 72175245      	bres	21061,#3
3695  0753               L7441:
3696                     ; 635     if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)                                                                                                                                              
3698  0753 7b19          	ld	a,(OFST+11,sp)
3699  0755 a508          	bcp	a,#8
3700  0757 2706          	jreq	L1541
3701                     ; 637         UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */                                                                                                             
3703  0759 72145245      	bset	21061,#2
3705  075d 2004          	jra	L3541
3706  075f               L1541:
3707                     ; 641         UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */                                                                                                       
3709  075f 72155245      	bres	21061,#2
3710  0763               L3541:
3711                     ; 644     if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)                                                                                                                                    
3713  0763 7b18          	ld	a,(OFST+10,sp)
3714  0765 a580          	bcp	a,#128
3715  0767 2706          	jreq	L5541
3716                     ; 646         UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */                                                                                                           
3718  0769 72175246      	bres	21062,#3
3720  076d 200a          	jra	L7541
3721  076f               L5541:
3722                     ; 651         UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);                                                                                                                                
3724  076f 7b18          	ld	a,(OFST+10,sp)
3725  0771 a408          	and	a,#8
3726  0773 ca5246        	or	a,21062
3727  0776 c75246        	ld	21062,a
3728  0779               L7541:
3729                     ; 653 }  
3732  0779 5b0e          	addw	sp,#14
3733  077b 81            	ret
3788                     ; 664 void UART2_Cmd(FunctionalState NewState)                                                                                                                                                  
3788                     ; 665 {                                                                                                                                                                                         
3789                     	switch	.text
3790  077c               _UART2_Cmd:
3794                     ; 667     if (NewState != DISABLE)                                                                                                                                                              
3796  077c 4d            	tnz	a
3797  077d 2706          	jreq	L7051
3798                     ; 669         UART2->CR1 &= (u8)(~UART2_CR1_UARTD); /**< UART2 Enable */                                                                                                                        
3800  077f 721b5244      	bres	21060,#5
3802  0783 2004          	jra	L1151
3803  0785               L7051:
3804                     ; 673         UART2->CR1 |= UART2_CR1_UARTD;  /**< UART2 Disable (for low power consumption) */                                                                                                 
3806  0785 721a5244      	bset	21060,#5
3807  0789               L1151:
3808                     ; 675 } 
3811  0789 81            	ret
3943                     ; 693 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)                                                                                                                  
3943                     ; 694 {                                                                                                                                                                                         
3944                     	switch	.text
3945  078a               _UART2_ITConfig:
3947  078a 89            	pushw	x
3948  078b 89            	pushw	x
3949       00000002      OFST:	set	2
3952                     ; 695     u8 uartreg, itpos = 0x00;                                                                                                                                                             
3954  078c 7b02          	ld	a,(OFST+0,sp)
3955  078e 97            	ld	xl,a
3956                     ; 696     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));                                                                                                                                        
3958                     ; 697     assert_param(IS_FUNCTIONALSTATE_OK(NewState));                                                                                                                                        
3960                     ; 700     uartreg = (u8)(UART2_IT >> 0x08);                                                                                                                                                     
3962  078f 7b03          	ld	a,(OFST+1,sp)
3963  0791 6b01          	ld	(OFST-1,sp),a
3964                     ; 704      itpos = (u8)UART2_IT ;                                                                                                                                                                                    
3966  0793 7b04          	ld	a,(OFST+2,sp)
3967  0795 6b02          	ld	(OFST+0,sp),a
3968                     ; 705     if (NewState != DISABLE)                                                                                                                                                              
3970  0797 0d07          	tnz	(OFST+5,sp)
3971  0799 273a          	jreq	L3751
3972                     ; 708         if (uartreg == 0x01)                                                                                                                                                              
3974  079b 7b01          	ld	a,(OFST-1,sp)
3975  079d a101          	cp	a,#1
3976  079f 260a          	jrne	L5751
3977                     ; 710             UART2->CR1 |= itpos;                                                                                                                                                          
3979  07a1 c65244        	ld	a,21060
3980  07a4 1a02          	or	a,(OFST+0,sp)
3981  07a6 c75244        	ld	21060,a
3983  07a9 2066          	jra	L1161
3984  07ab               L5751:
3985                     ; 712         else if (uartreg == 0x02)                                                                                                                                                         
3987  07ab 7b01          	ld	a,(OFST-1,sp)
3988  07ad a102          	cp	a,#2
3989  07af 260a          	jrne	L1061
3990                     ; 714             UART2->CR2 |= itpos;                                                                                                                                                          
3992  07b1 c65245        	ld	a,21061
3993  07b4 1a02          	or	a,(OFST+0,sp)
3994  07b6 c75245        	ld	21061,a
3996  07b9 2056          	jra	L1161
3997  07bb               L1061:
3998                     ; 716         else if (uartreg == 0x03)                                                                                                                                                         
4000  07bb 7b01          	ld	a,(OFST-1,sp)
4001  07bd a103          	cp	a,#3
4002  07bf 260a          	jrne	L5061
4003                     ; 718             UART2->CR4 |= itpos;                                                                                                                                                          
4005  07c1 c65247        	ld	a,21063
4006  07c4 1a02          	or	a,(OFST+0,sp)
4007  07c6 c75247        	ld	21063,a
4009  07c9 2046          	jra	L1161
4010  07cb               L5061:
4011                     ; 722             UART2->CR6 |= itpos;                                                                                                                                                          
4013  07cb c65249        	ld	a,21065
4014  07ce 1a02          	or	a,(OFST+0,sp)
4015  07d0 c75249        	ld	21065,a
4016  07d3 203c          	jra	L1161
4017  07d5               L3751:
4018                     ; 728         if (uartreg == 0x01)                                                                                                                                                              
4020  07d5 7b01          	ld	a,(OFST-1,sp)
4021  07d7 a101          	cp	a,#1
4022  07d9 260b          	jrne	L3161
4023                     ; 730             UART2->CR1 &= (u8)(~itpos);                                                                                                                                                   
4025  07db 7b02          	ld	a,(OFST+0,sp)
4026  07dd 43            	cpl	a
4027  07de c45244        	and	a,21060
4028  07e1 c75244        	ld	21060,a
4030  07e4 202b          	jra	L1161
4031  07e6               L3161:
4032                     ; 732         else if (uartreg == 0x02)                                                                                                                                                         
4034  07e6 7b01          	ld	a,(OFST-1,sp)
4035  07e8 a102          	cp	a,#2
4036  07ea 260b          	jrne	L7161
4037                     ; 734             UART2->CR2 &= (u8)(~itpos);                                                                                                                                                   
4039  07ec 7b02          	ld	a,(OFST+0,sp)
4040  07ee 43            	cpl	a
4041  07ef c45245        	and	a,21061
4042  07f2 c75245        	ld	21061,a
4044  07f5 201a          	jra	L1161
4045  07f7               L7161:
4046                     ; 736         else if (uartreg == 0x03)                                                                                                                                                         
4048  07f7 7b01          	ld	a,(OFST-1,sp)
4049  07f9 a103          	cp	a,#3
4050  07fb 260b          	jrne	L3261
4051                     ; 738             UART2->CR4 &= (u8)(~itpos);                                                                                                                                                   
4053  07fd 7b02          	ld	a,(OFST+0,sp)
4054  07ff 43            	cpl	a
4055  0800 c45247        	and	a,21063
4056  0803 c75247        	ld	21063,a
4058  0806 2009          	jra	L1161
4059  0808               L3261:
4060                     ; 742             UART2->CR6 &= (u8)(~itpos);                                                                                                                                                   
4062  0808 7b02          	ld	a,(OFST+0,sp)
4063  080a 43            	cpl	a
4064  080b c45249        	and	a,21065
4065  080e c75249        	ld	21065,a
4066  0811               L1161:
4067                     ; 745 }
4070  0811 5b04          	addw	sp,#4
4071  0813 81            	ret
4094                     ; 754 u8 UART2_ReceiveData8(void)                                                                                                                                                               
4094                     ; 755 {                                                                                                                                                                                         
4095                     	switch	.text
4096  0814               _UART2_ReceiveData8:
4100                     ; 756     return ((u8)UART2->DR);                                                                                                                                                               
4102  0814 c65241        	ld	a,21057
4105  0817 81            	ret
4139                     ; 767 void UART2_SendData8(u8 Data)                                                                                                                                                             
4139                     ; 768 {                                                                                                                                                                                         
4140                     	switch	.text
4141  0818               _UART2_SendData8:
4145                     ; 770     UART2->DR = Data;                                                                                                                                                                     
4147  0818 c75241        	ld	21057,a
4148                     ; 771 } 
4151  081b 81            	ret
4276                     ; 798 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)                                                                                                                                       
4276                     ; 799 {                                                                                                                                                                                         
4277                     	switch	.text
4278  081c               _UART2_ClearFlag:
4280  081c 89            	pushw	x
4281       00000000      OFST:	set	0
4284                     ; 800     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));                                                                                                                                     
4286                     ; 803     if (UART2_FLAG == UART2_FLAG_RXNE)                                                                                                                                                    
4288  081d a30020        	cpw	x,#32
4289  0820 2606          	jrne	L7271
4290                     ; 805         UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
4292  0822 35df5240      	mov	21056,#223
4294  0826 201e          	jra	L1371
4295  0828               L7271:
4296                     ; 808     else if (UART2_FLAG == UART2_FLAG_LBDF)                                                                                                                                               
4298  0828 1e01          	ldw	x,(OFST+1,sp)
4299  082a a30210        	cpw	x,#528
4300  082d 2606          	jrne	L3371
4301                     ; 810         UART2->CR4 &= (u8)(~UART2_CR4_LBDF);                                                                                                                                              
4303  082f 72195247      	bres	21063,#4
4305  0833 2011          	jra	L1371
4306  0835               L3371:
4307                     ; 813     else if (UART2_FLAG == UART2_FLAG_LHDF)                                                                                                                                               
4309  0835 1e01          	ldw	x,(OFST+1,sp)
4310  0837 a30302        	cpw	x,#770
4311  083a 2606          	jrne	L7371
4312                     ; 815         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
4314  083c 72135249      	bres	21065,#1
4316  0840 2004          	jra	L1371
4317  0842               L7371:
4318                     ; 820         UART2->CR6 &= (u8)(~UART2_CR6_LSF);                                                                                                                                               
4320  0842 72115249      	bres	21065,#0
4321  0846               L1371:
4322                     ; 823 } 
4325  0846 85            	popw	x
4326  0847 81            	ret
4362                     ; 848 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)                                                                                                                                   
4362                     ; 849 {                                                                                                                                                                                         
4363                     	switch	.text
4364  0848               _UART2_ClearITPendingBit:
4366  0848 89            	pushw	x
4367       00000000      OFST:	set	0
4370                     ; 850     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));                                                                                                                                         
4372                     ; 853     if (UART2_IT == UART2_IT_RXNE)                                                                                                                                                        
4374  0849 a30220        	cpw	x,#544
4375  084c 2606          	jrne	L1671
4376                     ; 855         UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
4378  084e 35df5240      	mov	21056,#223
4380  0852 2011          	jra	L3671
4381  0854               L1671:
4382                     ; 858     else if (UART2_IT == UART2_IT_LBDF)                                                                                                                                                   
4384  0854 1e01          	ldw	x,(OFST+1,sp)
4385  0856 a30346        	cpw	x,#838
4386  0859 2606          	jrne	L5671
4387                     ; 860         UART2->CR4 &= (u8)~(UART2_CR4_LBDF);                                                                                                                                              
4389  085b 72195247      	bres	21063,#4
4391  085f 2004          	jra	L3671
4392  0861               L5671:
4393                     ; 865         UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
4395  0861 72135249      	bres	21065,#1
4396  0865               L3671:
4397                     ; 867 } 
4400  0865 85            	popw	x
4401  0866 81            	ret
4452                     	xdef	_zone_x_cur_no_set
4453                     	xdef	_flex_ntc_deal
4454                     	xdef	_vf_fan_deal
4455                     	xdef	_Check_Unique_ID
4456                     	xdef	_APTTouchRdOneData1
4457                     	xdef	_APTTouchRdOneData
4458                     	xdef	_APTTouchWrOneData1
4459                     	xdef	_APTTouchWrOneData
4460                     	xdef	_ReceiveAck2
4461                     	xdef	_ReceiveAck1
4462                     	xdef	_ReceiveAck
4463                     	xdef	_RX2_Byte
4464                     	xdef	_RX1_Byte
4465                     	xdef	_RX_Byte
4466                     	xdef	_TX2_Byte
4467                     	xdef	_TX1_Byte
4468                     	xdef	_TX_Byte
4469                     	xdef	_Stop2
4470                     	xdef	_Stop1
4471                     	xdef	_Stop
4472                     	xdef	_Start2
4473                     	xdef	_Start1
4474                     	xdef	_Start
4475                     	xdef	_IIC2_initial
4476                     	xdef	_IIC1_initial
4477                     	xdef	_IIC_initial
4478                     	xdef	_delay
4479                     	xdef	_tx_rx_beep_io_deal
4480                     	xdef	_fan_on
4481                     	xdef	_comm_bit_count
4482                     	xdef	_Low_time
4483                     	xdef	_High_time
4484                     	xref.b	_fan_status
4485                     	xref.b	_Get_word_4
4486                     	xref.b	_Get_word_3
4487                     	xref.b	_Get_word_2
4488                     	xref.b	_Get_word_1
4489                     	xref.b	_bit_comm
4490                     	xref.b	_comm_status
4491                     	xref.b	_comm_list
4492                     	xref.b	_buzzer_time
4493                     	xdef	_UART2_ClearITPendingBit
4494                     	xdef	_UART2_ClearFlag
4495                     	xdef	_UART2_SendData8
4496                     	xdef	_UART2_ReceiveData8
4497                     	xdef	_UART2_ITConfig
4498                     	xdef	_UART2_Cmd
4499                     	xdef	_UART2_Init
4500                     	xdef	_UART2_DeInit
4501                     	xdef	_IWDG_Enable
4502                     	xdef	_IWDG_ReloadCounter
4503                     	xdef	_IWDG_SetReload
4504                     	xdef	_IWDG_SetPrescaler
4505                     	xdef	_IWDG_WriteAccessCmd
4506                     	xref.b	c_lreg
4507                     	xref.b	c_x
4526                     	xref	c_lursh
4527                     	xref	c_lsub
4528                     	xref	c_smul
4529                     	xref	c_ludv
4530                     	xref	c_rtol
4531                     	xref	c_llsh
4532                     	xref	c_ltor
4533                     	end
