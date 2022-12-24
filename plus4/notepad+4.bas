 0 rem *** notepad+4, the sequential files editor, v1 rev.6
 4 rem *** by litwr, 2014-16, (C) GNU GPL
 6 rem *** the initial banner was made by Text Resizer by MIRKOSOFT
 8 cc$=chr$(233):mc%=40:cf$=chr$(230):mo$="ins":im%=1:u%=8:un$="u8"
10 ml%=700:dima$(700)

15 trap 20000

20 gosub100
25 for i=0 to 63:read k:poke 819+i,k:next
30 gosub9700
40 if fo% then gosub2210
45 gosub2600:goto40

82 data225,252,225,97,0,0,0,0,0,160,0,0,0,0,0,0,0
83 data0,0,0,0,0,0,0,0,0,225,97,0,108,123,0,0,0,254,97
84 data225,160,160,97,108,236,251,123,226,160,226,0,108,236,251,123,225
85 data236,251,123,0,226,251,123,108,236,251,97,108,254,252,123,108,255,251,97
86 data225,97,251,97,225,97,225,97,0,160,108,123,225,236,226,126,225
87 data252,254,126,108,236,251,97,225,97,225,97,0,225,97,0,124,226,251,236
88 data124,126,124,126,0,226,226,0,0,124,226,0,0,226,226,126,225
89 data97,0,0,0,226,226,126,0,226,226,126,0,0,0,0,0,0,124,126

91 data 162,104,160,11,140,63,3,140,66,3,189,192,12,157,152,12
92 data 232,208,247,200,140,63,3,140,66,3,192,15,208,236,96
94 data 162,151,160,15,140,94,3,140,97,3,189,0,15,157,40,15
95 data 202,224,255,208,245,136,140,94,3,140,97,3,192,11,208,234,96

100 printchr$(9)chr$(14)chr$(147);
110 char1,2,23,"Press Commodore Logo + H to get help"
120 for i=0 to 3:for k=0 to 35
130 readl%:ifl%thenpoke3354+i*40+k,l%
140 next k,i
150 char1,5,11,"v1r6, by litwr, (c) 2014-16 gnu gpl"
160 i=ti
170 if ti-i<150 then170
180 getc$:if c$<>"" then 180
190 return

2000 printchr$(9)chr$(14)chr$(147)tab(10)"Notepad+4 commands":print
2010 print"C=H - help          C=N - new"
2020 print"C=L - load          C=S - save"
2030 print"C=U - page up       C=D - page down"
2040 print"C=B - begin         C=E - end"
2050 print"C=F - find forward  C=R - repeat find"
2070 print"C=C - cat&load      C=Q - quit"
2075 print"C=V - unit #        C=T - delete char":print
2080 print"ESC+A/C/D/I/J/K/O/P/Q/V/W/X":print
2090 print"ins, del, home, return, cursors, ...":poke2024,39:gosub2900
2100 print:print:printtab(24);:printusing"#####";fre(0);:print" bytes free";:printtab(17)"Hit any key to continue"
2110 getkeyc$

2200 rem show screen
2205 fo%=1:return
2210 print chr$(27)"o";
2215 i=ty%:scnclr
2220 if i<lc% and i-ty%<24 then print a$(i):i=i+1:goto2220
2230 print chr$(27)"o";:gosub2400

2250 char1,0,24,"{rvon}"+f$+"{rvof}":char1,17,24,mo$
2260 char1,22,24,"{rvon}"+un$+"{rvof}":return

2270 i=cy%
2280 if i<lc% and i-ty%<24 then gosub2500:if right$(a$(i),1)<>cc$ then i=i+1:goto2280
2290 goto2400

2300 rem show coors
2310 c$=str$(cx%+1):d$=str$(cy%+1)::mid$(c$,1,1)="x":mid$(d$,1,1)="y"
2330 c$=c$+" "+d$:d$=str$(lc%):mid$(d$,1,1)="/":c$=c$+d$:l%=mc%-len(c$)
2350 char1,l%-3,24,"   ":poke2024,40:printc$;:return

2400 i=40*(cy%-ty%)+cx%:poke65292,i/256:poke65293,iand255:goto2310

2500 rem show line #i
2510 char1,0,i-ty%,chr$(27)+"q":poke2024,40:printa$(i);
2520 print chr$(27)"o";
2530 return

2600 getc$:ifc$=""goto2600
2605 i=asc(c$):fo%=0
2610 ifi=29then4000
2620 ifi=157then4100
2630 ifi=17then4200
2640 ifi=145then4300
2650 ifi=19then4400
2660 ifi>31andi<128then4500
2670 ifi>192andi<219then4600
2680 ifi=20then4700
2690 ifi=148then4800
2700 ifi=13then4900
2710 ifi=27then8000
2720 ifi=180then2000
2730 ifi=171then poke2024,39:print "{clr}Welcome to Basic":end
2740 ifi=191then9300
2750 ifi=177then9400
2760 ifi=184then9500
2770 ifi=172then9600
2780 ifi=170then9700
2790 ifi=187then9800
2800 ifi=178then9900
2810 ifi=182then3000
2820 ifi=174then3200
2830 ifi=190then3400
2840 ifi=188then3500
2850 ifi=163then3800
2890 goto2600

2900 poke65292,255:poke65293,255:return

3000 rem load
3010 scnclr:s$="":print"{rvon}unit"u%"{rvof}";:print"enter file name to load":input s$:if s$=""goto3100
3014 f$=s$:gosub5900
3020 open8,u%,8,f$+",s,r":scnclr
3030 get#8,c$:if st<>0 and st<>64 then3120
3040 ifc$=""goto3070
3050 i=asc(c$):ol=lc%
3060 ifi=13thengosub7000:else:ifi>31thengosub7200
3065 if ol<lc% then print chr$(19)lc%;
3070 if st=0 goto3030
3080 a$(lc%)=a$(lc%)+cf$:gosub 7100
3090 close8:s$=ds$
3100 gosub2200:goto2400

3120 scnclr:gosub2900:print "{rvon}"f$"{rvof} bad":print ds$
3130 getkeyc$:gosub9700:goto3090

3200 rem save
3210 scnclr:s$="":print"{rvon}unit"u%"{rvof} {rvon}"f$"{rvof}"
3212 print"Enter filename to save":print"  empty string - use the current one":print"  * - exit"
3214 input s$:c$=s$:if s$="*" then3100
3216 if s$="" then c$="@:"+f$:else:f$=c$
3218 if c$="@:" then 3350
3220 open8,u%,8,c$+",s,w"
3230 if st<>0 goto3370
3240 if a$(0)=cf$ goto3320
3250 for i=1 to lc%
3260 s$=a$(i-1):l%=len(s$)
3270 if l%>1 then print#8,left$(s$,l%-1);:s$=right$(s$,1)
3275 if st<>0 then3370
3280 if s$=cf$ goto3310
3290 printchr$(27)"j"i;:if s$=cc$ then print#8:goto3310
3300 print#8,s$;
3310 next
3320 if st<>0 then3370
3330 goto3090

3350 scnclr:gosub2900:print "cannot open "c$:print ds$
3360 getkeyc$:goto3100

3370 scnclr:gosub2900:print "cannot write to "f$:print ds$
3380 getkeyc$:goto3090

3400 rem change unit #
3410 u%=u%+1:if u%>9 then u%=8
3420 un$="u"+right$(str$(u%),1)
3430 gosub2260:goto2400

3500 rem directory & load
3510 scnclr:dm$="":print"{rvon}unit"u%"{rvof}";:print"enter directory mask,":print"  e.g., b*=seq (*=seq by default)":input dm$:if dm$="" then dm$="*=seq"
3515 print"Hit any key to stop"
3520 open8,u%,0,"$0:"+dm$
3530 get#8,c$:if st=0 then get#8,c$:k=0:else:print"bad mask or unit":printds$:getkeyc$:goto3090
3540 get#8,c$:get#8,c$
3550 if st then3610:else:get#8,c$:get#8,d$
3560 if c$="" then c$=chr$(0)
3570 if d$="" then d$=chr$(0)
3580 ol=asc(c$)+asc(d$)*256:s$="":getc$:ifc$<>""goto3610
3590 get#8,c$
3600 if c$<>"" then s$=s$+c$:goto3590:else:goto3700
3610 close8
3620 c$="":input"File number (empty string = exit)";c$:l%=val(c$):if l%=0 or l%>k then3100
3630 open8,u%,0,"$0:"+dm$:get#8,c$:get#8,c$:k=-1
3640 get#8,c$:get#8,c$:get#8,c$:get#8,c$
3650 get#8,c$:if c$<>"" then s$=s$+c$:goto3650:else:k=k+1

3670 if l%<>k then s$="":goto3640
3680 l%=len(s$):i=instr(s$,chr$(34)):s$=right$(s$,l%-i)
3690 l%=len(s$):i=instr(s$,chr$(34)):s$=left$(s$,i-1):close8:scnclr:goto3014

3700 if len(s$)<>27 then 3780
3710 if left$(s$,3)="   " then s$=mid$(s$,3):else:if left$(s$,2)="  " then s$=mid$(s$,2)
3725 if right$(s$,3)="   " then s$=left$(s$,len(s$)-2):else:if right$(s$,2)="  " then s$=left$(s$,len(s$)-1)
3730 if right$(s$,2)="  " then s$=left$(s$,len(s$)-1)
3740 k=k+1:printusing"###";k;:print s$;ol
3750 goto3540

3780 if k>0 then print"     "ol;s$:goto3540
3790 print"   "s$:goto3540

3800 rem delete char
3810 if mid$(a$(cy%),cx%+1,1)=cf$ then return
3820 if cx%<len(a$(cy%))-1 then cx%=cx%+1:goto4700
3830 k=cy%:ifcy%<lc%-1thengosub4200
3840 gosub4150
3850 if k<>cy% then cx%=0
3860 goto4700

4000 rem cursor right
4010 if cx%<len(a$(cy%))-1 then cx%=cx%+1:else:goto4050
4020 goto2400

4050 k=cy%:gosub4200
4060 if k<>cy% then cx%=0:goto2400
4070 return

4100 rem cursor left
4110 ifcx%>0thencx%=cx%-1:else:ifcy%>0thencx%=len(a$(cy%-1))-1:goto4300
4120 goto2400

4150 ifcx%>=len(a$(cy%))thencx%=len(a$(cy%))-1
4160 return

4200 rem cursor down
4210 e%=0
4220 ifcy%<lc%-1thency%=cy%+1
4230 ifcy%-ty%>23thenty%=ty%+1:e%=1
4240 gosub4150
4250 ife%thensys819:i=ty%+23:gosub2500
4260 goto2400

4300 rem cursor up
4305 e%=0
4310 ifcy%>0thency%=cy%-1
4320 ifcy%-ty%<0thenty%=ty%-1:e%=1
4330 gosub4150
4340 ife%thensys850:i=ty%:gosub2500
4350 goto2400

4400 rem cursor home
4410 cy%=ty%:cx%=0
4420 goto2400

4500 rem small letter,digits,...
4510 if im% then gosub4820:goto4000
4520 s$=a$(cy%):if cx%=len(s$)-1 then gosub5000:else:mid$(s$,cx%+1,1)=c$:a$(cy%)=s$
4530 i=cy%:gosub2500
4540 goto4000

4600 rem capital letter
4610 c$=chr$(i-96)
4620 goto4500

4700 rem backspace
4710 ifcx%=0then5400
4720 cx%=cx%-1:a$(cy%)=left$(a$(cy%),cx%)+mid$(a$(cy%),cx%+2)
4730 d$=right$(a$(cy%),1)
4740 if d$<>cc$ and d$<>cf$ then gosub5100:else:i=cy%:gosub2500
4750 goto2400

4800 rem shift+backspace
4810 c$=" "
4820 a$(cy%)=left$(a$(cy%),cx%)+c$+mid$(a$(cy%),cx%+1)
4830 if len(a$(cy%))>mc% then 5500
4840 i=cy%:goto2500

4900 rem return
4910 if cx%=len(a$(cy%))-1 then gosub7300:else:gosub7400
4920 goto2200

5000 rem in:s$=a$(cy%)
5005 d$=right$(s$,1)
5010 if d$=cf$ then return
5020 mid$(s$,cx%+1,1)=c$:a$(cy%)=s$
5030 if cx%=mc%-1 then return
5040 if d$=cc$ then 5100
5050 return

5100 i=cy%
5120 if i>=lc%-1 goto2270
5130 d$=a$(i):s$=right$(d$,1)
5140 if s$=cc$ or s$=cf$ then2270:else:gosub5300
5150 i=i+1
5160 if a$(i)="" then gosub5200:goto2200
5170 goto5120

5200 for k=i to lc%-2
5210 a$(k)=a$(k+1)
5220 next
5230 lc%=lc%-1
5240 return

5300 l%=len(d$):s$=a$(i+1):ls%=len(s$)
5310 if ls%>mc%-l% then a$(i)=d$+left$(s$,mc%-l%):a$(i+1)=right$(s$,ls%-mc%+l%):else:a$(i)=d$+s$:a$(i+1)=""
5320 return

5400 ifcy%=0thenreturn
5410 gosub6100:cx%=len(a$(cy%))-1:a$(cy%)=left$(a$(cy%),cx%)
5420 gosub5100
5430 goto2400

5500 i=cy%
5520 d$=right$(a$(i),1):a$(i)=left$(a$(i),mc%):i=i+1
5530 if d$=cc$ or d$=cf$ then5600
5540 a$(i)=d$+a$(i)
5550 if len(a$(i))>mc% goto5520
5560 goto2270

5600 for k=lc% to i+1 step -1
5610 a$(k)=a$(k-1)
5620 next
5630 a$(i)=d$
5640 gosub7100
5650 goto2200

5900 lc%=0:cx%=0:cy%=0:ty%=0:a$(0)="":return

6100 cy%=cy%-1
6110 if ty%>cy% then ty%=cy%
6120 return

7000 rem input line after eol
7010 if len(a$(lc%))<mc% then a$(lc%)=a$(lc%)+cc$:else:gosub7100:a$(lc%)=cc$

7100 if lc%<ml% then lc%=lc%+1:else:print "{rvon}file too big, a line skipped{rvof}";:a$(lc%-1)=cf$
7110 a$(lc%)="":return

7200 rem add input char
7210 if len(a$(lc%))=mc% thengosub7100
7220 a$(lc%)=a$(lc%)+c$
7230 return

7300 if right$(a$(cy%),1)=cf$ then7600

7400 gosub7500
7410 if cy%+2>ml% then 7450:else:c$=a$(cy%):a$(cy%)=left$(c$,cx%)+cc$
7415 if cy%+3>ml% then 7450
7420 a$(cy%+1)=mid$(c$,cx%+1):cx%=0:c$=right$(a$(cy%+1),1)
7440 if c$<>cc$ and c$<>cf$ then gosub4200:goto5100
7450 cx%=0:goto4200

7500 for k=lc%-1 to cy%+1 step -1
7510 a$(k+1)=a$(k)
7520 next
7530 goto7100

7600 a$(cy%)=left$(a$(cy%),cx%)+cc$:a$(cy%+1)=cf$
7610 cx%=0:gosub7100
7630 goto4200

8000 rem esc
8010 gosub2900:getkeya$:gosub2400
8020 i=asc(a$):if i>192 and i<219 then i=i-128
8030 if i=68 then8200
8040 if i=73 then8300
8050 if i=74 then8400
8060 if i=75 then8500
8070 if i=80 then8600
8080 if i=81 then8700
8090 if i=86 then8800
8100 if i=87 then8900
8110 if i=65 then9000
8120 if i=67 then9100
8130 if i=79 then9200
8140 return

8200 rem esc+d
8210 cx%=0
8220 if cy%=lc%-1 then a$(cy%)=cf$:i=cy%:gosub2500:goto2400
8230 for k=cy% to lc%-2
8240 a$(k)=a$(k+1)
8250 next
8260 lc%=lc%-1:goto2200

8300 rem esc+i
8310 for k=lc%-1 to cy% step -1
8320 a$(k+1)=a$(k)
8330 next
8340 cx%=0:a$(cy%)=cc$:gosub7100:goto2200

8400 rem esc+j
8410 cx%=0:goto2400

8500 rem esc+k
8510 cx%=len(a$(cy%))-1:goto2400

8600 rem esc+p
8610 c$=a$(cy%):if cx%=len(c$)-1 then 8200
8620 a$(cy%)=mid$(c$,cx%+2):cx%=0:c$=right$(c$,1)
8630 if c$=cf$ or c$=cc$ then i=cy%:gosub2500:goto2400
8640 goto5100

8700 rem esc+q
8710 if cx%=0 then8200
8720 c$=a$(cy%):a$(cy%)=left$(c$,cx%)
8730 if right$(c$,1)=cf$ then a$(cy%)=a$(cy%)+cf$:i=cy%:gosub2500:goto2400
8740 goto5100

8800 rem esc+v
8810 if ty%>=lc%-1 then return
8820 ty%=ty%+1:if cy%<ty% then cy%=ty%
8830 sys819:i=ty%+23:if i<lc% then gosub2500:elsechar1,0,23,chr$(27)+"q"
8840 goto2400

8900 rem esc+w
8910 if ty%=0 then return
8920 ty%=ty%-1:if cy%-ty%>23 then cy%=cy%-1
8930 sys850:i=ty%:gosub2500
8430 goto2400

9000 rem esc+a
9010 im%=1:mo$="ins"
9020 goto2250

9100 rem esc+c
9110 im%=0:mo$="owr"
9120 goto2250

9200 rem esc+o
9210 goto2250

9300 rem to the begin
9310 cx%=0:cy%=0:if ty%<>0 then ty%=0:goto2200
9320 goto2400

9400 rem to the end
9410 cx%=0:cy%=lc%-1:l%=lc%-24:if l%<0 then l%=0
9420 if ty%<>l% then ty%=l%:goto2200
9430 goto2400

9500 rem page up
9510 cx%=0:l%=ty%-24:if l%<0 then l%=0
9520 cy%=cy%-24:if cy%<0 then cy%=0
9530 goto9420

9600 rem page down
9610 cx%=0:l%=ty%+24:if l%>=lc% then l%=lc%-24
9620 if l%<0 then l%=0
9630 cy%=cy%+24:if cy%>=lc% then cy%=lc%-1
9640 goto9420

9700 rem new
9705 gosub5900
9710 a$(0)=cf$:lc%=1:cx%=0:cy%=0:f$=""
9720 goto2200

9800 rem search
9810 scnclr:fs$="":input"Find";fs$:l%=len(fs$):if len(fs$)=0 then2200
9820 s$=fs$:gosub10100:fs$=s$
9830 gosub2900:l2%=cx%+2:gosub10000
9840 if fi%=0 then2200
9850 cx%=fi%-1:cy%=j
9860 if cy%-ty%>23 then ty%=cy%-12
9870 goto2200

9900 rem repeat find
9910 if fs$="" then return
9920 scnclr:print"searching "fs$:l%=len(fs$):goto9830

10000 for j=cy% to lc%-1
10010 s$=a$(j):gosub10100:printchr$(27)"j"j+1;
10020 fi%=instr(s$,fs$,l2%):if fi%=0 and len(s$)=mc% then gosub 10200
10030 if fi% then return
10040 l2%=1
10050 next
10060 goto180

10100 if s$="" then return
10105 l1%=len(s$)
10110 for i=1 to l1%
10120 k=asc(mid$(s$,i,1)):n%=k
10130 if k>96 and k<123 then n%=k-32:goto10150
10140 if k>192 and k<219 then n%=k-128
10150 if n%<>k then mid$(s$,i,1)=chr$(n%)
10160 next
10170 return

10200 l3%=len(fs$):if l3%=1 then return
10205 d$=s$:s$=a$(j+1):gosub10100:g$=s$:s$=d$:l4%=len(g$)
10210 for i=l3%-1 to 1 step -1
10220 if l4%<l3%-i then return
10225 if l2%>mc%-i+1 then 10240
10230 c$=left$(fs$,i):d$=right$(fs$,l3%-i)
10235 if c$=right$(s$,i) and d$=left$(g$,l3%-i) then fi%=mc%-i+1:return
10240 next
10250 return

20000 poke2024,39:print "an error's occured or run/stop's pressed at line"el
