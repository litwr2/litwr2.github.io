 1 rem *** koi8-r encoding
 2 rem *** notepad+4 bk0011 edition, the text file editor, v1 rev.5
 4 rem *** converted from Commodore plus/4 and Amstrad CPC6128
 6 rem *** by litwr, 2015, (C) GNU GPL, thanks to SyX
 7 rem *** the initial banner was made by Text Resizer by MIRKOSOFT
10 mc=64:cc$=chr$(191):cf$=chr$(127):mo$="ins":im=1
12 u=1:un$=chr$(u+64)+":":nl=24:poke -78,16896:poke 65486,4096
14 ml=500:dim a$(500):clear 0,49090
15 for i=0 to 30:read c$:poke 49090+i*2,dec(c$):next:def usr = 49090
20 gosub 100
30 gosub 9700
40 if fo then gosub 2210
45 gosub 2600:goto 40

100 gosub 10280:cls
110 locate 15,18:print "Press Cõ + P to get help":locate 0,6
112 PRINT "¯¯» ¯¯          ¯¯                             ¯¯   »»      »¯¯"
114 PRINT "¯¯¯¯¯¯ »¯¬¬¯» ¬¬¯¯¬¬  »¯¬¬¯» ¯¯¬¬¯»  ¬¬¬¯» »¯¬¬¯¯ »»¯¯»» »»¬¬¯¯"
116 PRINT "¯¯ ¬¯¯ ¯¯  ¯¯   ¯¯ »» ¯¯¬¬¬¬ ¯¯»»¯¬ »¯¬¬¯¯ ¯¯  ¯¯   ¯¯   ¬¬¬¬¯¯"
118 PRINT "¬¬  ¬¬  ¬¬¬¬     ¬¬¬   ¬¬¬¬¬ ¯¯      ¬¬¬¬¬  ¬¬¬¬¬            ¬¬"
150 locate 38,11:print "üÌeËÔpoÎÉËa âK0011 Edition";
154 locate 29,12,0:print "v1r5, by litwr, (c) 2015-21 gnu gpl"
156 for i=0 to 7000:cx=55*i:next i
180 c$=inkey$:if c$<>"" then 180
190 return

300 data 15cd,1b00,65df,f6,ffb4,17c0,84,e5c0,280,15c3,c000,40c0,101f,84,e5c0
310 data 180,1001,e5c0,280,15c2,200,40c0,40c1,e0c1,e0c0,1250,a11,7e87,15cd,2b00,87

2000 gosub 10280:print chr$(12)tab(16)"Notepad +4 âK0011 Edition commands":print
2005 print tab(23)chr$(156)"With the Cõ key"chr$(156)
2010 print "P - help"tab(22)"N - new"tab(44)"L/S - load/save"
2020 print "U/D - page up/down"tab(22)"B/E - to begin/end"tab(44)"F - find forward"
2030 print "R - repeat find"tab(22)"C - cat & load"tab(44)"G - change disk"
2035 print "O - cursor home"tab(22)"Q - quit":print
2040 print tab(21)chr$(156)"With the TAâ prefix"chr$(156)
2050 print "A/C - toggle insert/overwrite mode"tab(35)"D/I - delete/insert a line"
2060 print "J/K - to start/end of line"tab(35)"P/Q - erase begin/end of line";
2070 print "V/W - scroll up/down"tab(35)"Any other key - cancel TAB":print
2090 print "|<--, |-->, return, cursors, ..."
2100 print:print uint$(fre(""))" bytes free":print tab(20)"Hit any key to continue"
2120 c$=inkey$:if c$="" then 2120

2200 rem show screen
2205 fo=1:return
2210 i=ty:cls
2215 poke 116,1600
2220 if i<lc and i-ty<nl then gosub 2400:i=i+1:goto 2220
2225 poke 116,1536
2230 gosub 2310

2250 c$=f$:if len(c$)<12 then c$=c$+string$(12-len(f$),32)
2260 c$=c$+" "+uint$(fre)+"  ":y=0:gosub 10300:c$=mo$:y=22:gosub 10300:c$=un$:y=28:goto 10300

2270 i=cy
2280 if i<lc and i-ty<nl then gosub 2510:if mid$(a$(i),len(a$(i)))<>cc$ then i=i+1:goto 2280

2300 rem show coors
2310 c$=str$(cx+1):d$=str$(cy+1):mid$(c$,1,1)="x":mid$(d$,1,1)="y"
2330 c$=c$+" "+d$:d$=str$(lc):mid$(d$,1,1)="/":c$=c$+d$:l=mc-len(c$)
2350 c$="   "+c$:y=l-3:goto 10300

2400 print a$(i);:if pos<>0 then print
2410 return

2500 rem show line #i
2510 locate 0,i-ty:poke 116,1600:print chr$(153) a$(i);:poke 116,1536:return

2600 locate cx,cy-ty,1
2604 c$=inkey$:if c$="" then 2604
2608 i=asc(c$):fo=0:locate cx,cy-ty,0
2610 if i=25 then 4000:rem right
2620 if i=8 then 4100:rem left
2630 if i=27 then 4200:rem down
2640 if i=26 then 4300:rem up
2650 if i=15 then 4400 'home
2660 if i>31 and i<127 or i>159 then 4500
2680 if i=24 then 4700 'backspace
2690 if i=23 then 4800 'insert space
2700 if i=10 then 4900
2710 if i=9 then 8000:rem esc/tab
2720 if i=16 then 2000:rem help
2730 if i=17 then print chr$(12)"Hit a key and get OS":end
2740 if i=2 then 9300 'to start
2750 if i=5 then 9400 'to end
2760 if i=21 then 9500:rem pgup
2770 if i=4 then 9600:rem pgdn
2780 if i=14 then 9700 'new
2790 if i=6 then 9800:rem search
2800 if i=18 then 9900:rem repeat search
2810 if i=12 then 3000 'load
2820 if i=19 then 3200:rem save
2830 if i=7 then 3400:rem change drv
2840 if i=3 then 3500:rem cat & load
2850 if i=22 then 3800 'delete
2890 goto 2600

3000 rem load
3010 cls:s$="":print"enter filename to load (case-sensitive)":input s$:if s$="" goto 3100
3014 f$=s$:gosub 5900
3020 cls:open f$ for input:if peek(208) and -256 then 3120
3030 get# c$
3050 i=asc(c$):ol=lc
3060 if i=10 then gosub 7000 else if i>31 and i<127 or i>159 then gosub 7200
3065 if ol<lc then print chr$(18) lc;
3070 if not eof goto 3030
3080 a$(lc)=a$(lc)+cf$:gosub 7100
3090 close
3100 gosub 2205:goto 2310

3120 cls:print f$" bad":gosub 10280
3130 gosub 11000:gosub 9700:goto 3090

3160 if len(c$)>mc then gosub 7200:goto 3160
3165 d$=c$:l=len(d$):if efs then gosub 3140 else return
3170 if l+l2<255 then c$=d$+c$:return
3180 if l2>254 then gosub 3190:goto 3160

3190 a$(lc)=d$+mid$(c$,1,mc-l):c$=mid$(c$,mc-l+1):goto 7100

3200 rem save
3210 cls:s$=""
3212 print"Enter filename to save":print"  an empty string - use the current one, * - exit"
3214 input s$:c$=s$:if s$="*" then 3100
3216 if s$="" then c$=f$ else f$=c$
3217 if f$="" goto 3210
3218 if instr(c$,"*") or instr(c$,"?") then 3370
3230 open c$ for output:if peek(208) and -256 then 3370
3240 if a$(0)=cf$ goto 3330
3250 cls:for i=1 to lc
3260 s$=a$(i-1):l=len(s$)
3270 if l>1 then print# mid$(s$,1,l-1);:s$=mid$(s$,len(s$))
3280 if s$=cf$ goto 3310
3290 print chr$(18)i;:if s$=cc$ then print#:goto 3310
3300 print# s$;
3310 next
3330 close
3340 goto 3100

3370 cls:gosub 2900:print "cannot write to "f$
3380 gosub 11000:goto 3090

3400 rem change drive letter
3410 cls:gosub 10280
3415 u=u+1:if u>4 then u=1
3420 un$=chr$(u+64)+":":poke 234,257*u:poke -50,7168:poke -24468,peek(234):poke -50,11008
3430 goto 2205

3500 rem directory & load
3510 cls:dm$="":input"enter directory mask (*.* by default)";dm$:if dm$="" then dm$="*.*"
3520 files dm$:?
3640 s$="":input "Filename (case-sensitive, empty string = exit)";s$:if s$="" then 3100
3650 goto 3014

3800 rem delete char
3810 if mid$(a$(cy),cx+1,1)=cf$ then return
3820 if cx<len(a$(cy))-1 then cx=cx+1:goto 4700
3830 k=cy:if cy<lc-1 then gosub 4200
3840 gosub 4150
3850 if k<>cy then cx=0
3860 goto 4700

4000 rem cursor right
4010 if cx<len(a$(cy))-1 then cx=cx+1 else goto 4050
4020 goto 2310

4050 k=cy:gosub 4200
4060 if k<>cy then cx=0:goto 2310
4070 return

4100 rem cursor left
4110 if cx>0 then cx=cx-1 else if cy>0 then cx=len(a$(cy-1))-1:goto 4300
4120 goto 2310

4150 if cx>=len(a$(cy)) then cx=len(a$(cy))-1
4160 return

4200 rem cursor down
4210 e=0
4220 if cy<lc-1 then cy=cy+1
4230 if cy-ty>nl-1 then ty=ty+1:e=1
4240 gosub 4150
4250 if e then locate 0,nl-1:?:poke 116,1600:print chr$(153)a$(ty+nl-1);:poke 116,1536
4260 goto 2310

4300 rem cursor up
4305 e=0
4310 if cy>0 then cy=cy-1
4320 if cy-ty<0 then ty=ty-1:e=1
4330 gosub 4150
4340 if e then e=usr(-50):locate 0,0:print a$(ty);
4350 goto 2310

4400 rem cursor home
4410 cy=ty:cx=0
4420 goto 2310

4500 rem small letter,digits,...
4510 if im then gosub 4820:goto 4000
4520 if cx=len(a$(cy))-1 then gosub 5000 else mid$(a$(cy),cx+1,1)=c$
4530 i=cy:gosub 2510
4540 goto 4000

4700 rem backspace
4710 if cx=0 then 5400
4720 cx=cx-1:a$(cy)=mid$(a$(cy),1,cx)+mid$(a$(cy),cx+2)
4730 d$=mid$(a$(cy),len(a$(cy)))
4740 if d$<>cc$ and d$<>cf$ then gosub 5100 else i=cy:gosub 2510
4750 goto 2310

4800 rem shift+backspace
4810 c$=" "
4820 a$(cy)=mid$(a$(cy),1,cx)+c$+mid$(a$(cy),cx+1)
4830 if len(a$(cy))>mc then 5500
4840 i=cy:goto 2510

4900 rem return
4910 if cx=len(a$(cy))-1 then gosub 7300 else gosub 7400
4920 goto 2205

5000 d$=mid$(a$(cy),len(a$(cy)))
5010 if d$=cf$ then return
5020 mid$(a$(cy),cx+1,1)=c$
5030 if cx=mc-1 then return
5040 if d$=cc$ then 5100
5050 return

5100 i=cy
5120 if i>=lc-1 goto 2270
5130 d$=a$(i):s$=mid$(d$,len(d$))
5140 if s$=cc$ or s$=cf$ then 2270 else gosub 5300
5150 i=i+1
5160 if a$(i)="" then gosub 5200:goto 2205
5170 goto 5120

5200 for k=i to lc-2
5210 a$(k)=a$(k+1)
5220 next
5230 lc=lc-1
5240 return

5300 l=len(d$):s$=a$(i+1):ls=len(s$)
5310 if ls>mc-l then a$(i)=d$+mid$(s$,1,mc-l):a$(i+1)=mid$(s$,len(s$)-ls+mc-l+1) else a$(i)=d$+s$:a$(i+1)=""
5320 return

5400 if cy=0 then return
5410 gosub 6100:cx=len(a$(cy))-1:a$(cy)=mid$(a$(cy),1,cx)
5420 gosub 5100
5430 goto 2310

5500 i=cy
5520 d$=mid$(a$(i),len(a$(i))):a$(i)=mid$(a$(i),1,mc):i=i+1
5530 if d$=cc$ or d$=cf$ then 5600
5540 a$(i)=d$+a$(i)
5550 if len(a$(i))>mc goto 5520
5560 goto 2270

5600 for k=lc to i+1 step -1
5610 a$(k)=a$(k-1)
5620 next
5630 a$(i)=d$
5640 gosub 7100
5650 goto 2205

5900 cx=0:cy=0:ty=0:lc=0:a$(0)="":return

6100 cy=cy-1
6110 if ty>cy then ty=cy
6120 return

7000 rem input line after eol
7010 if len(a$(lc))<mc then a$(lc)=a$(lc)+cc$ else gosub 7100:a$(lc)=cc$

7100 if lc<ml then lc=lc+1 else print chr$(156)"file too big, a line skipped"chr$(156);:a$(lc-1)=cf$
7110 a$(lc)="":return

7160 if len(c$)<mc then a$(lc)=c$:return else gosub 7200:goto 7160

7200 rem add input char
7210 if len(a$(lc))=mc then gosub 7100
7220 a$(lc)=a$(lc)+c$
7230 return

7300 if mid$(a$(cy),len(a$(cy)))=cf$ then 7600

7400 gosub 7500
7410 if cy+2>ml then 7450 else c$=a$(cy):a$(cy)=mid$(c$,1,cx)+cc$
7415 if cy+3>ml then 7450
7420 a$(cy+1)=mid$(c$,cx+1):cx=0:c$=mid$(a$(cy+1),len(a$(cy+1)))
7440 if c$<>cc$ and c$<>cf$ then gosub 4200:goto 5100
7450 cx=0:goto 4200

7500 for k=lc-1 to cy+1 step -1
7510 a$(k+1)=a$(k)
7520 next
7530 goto 7100

7600 a$(cy)=mid$(a$(cy),1,cx)+cc$:a$(cy+1)=cf$
7610 cx=0:gosub 7100
7630 goto 4200

8000 rem esc
8010 c$=inkey$:if c$="" goto 8010
8020 i=asc(c$):if i<91 and i>64 then i=i+32
8030 if i=100 then 8200:rem D
8040 if i=105 then 8300:rem I
8050 if i=106 then 8400:rem J
8060 if i=107 then 8500:rem K
8070 if i=112 then 8600:rem P
8080 if i=113 then 8700:rem Q
8090 if i=118 then 8800:rem V
8100 if i=119 then 8900:rem W
8110 if i=97 then 9000:rem A
8120 if i=99 then 9100:rem C
8130 if i=111 then 9200:rem O
8140 return

8200 rem esc+d
8210 cx=0
8220 if cy=lc-1 then a$(cy)=cf$:i=cy:gosub 2510:goto 2310
8230 for k=cy to lc-2
8240 a$(k)=a$(k+1)
8250 next
8260 lc=lc-1:goto 2205

8300 rem esc+i
8310 for k=lc-1 to cy step -1
8320 a$(k+1)=a$(k)
8330 next
8340 cx=0:a$(cy)=cc$:gosub 7100:goto 2205

8400 rem esc+j
8410 cx=0:goto 2310

8500 rem esc+k
8510 cx=len(a$(cy))-1:goto 2310

8600 rem esc+p
8610 c$=a$(cy):if cx=len(c$)-1 then 8200
8620 a$(cy)=mid$(c$,cx+2):cx=0:c$=mid$(c$,len(c$))
8630 if c$=cf$ or c$=cc$ then i=cy:gosub 2510:goto 2310
8640 goto 5100

8700 rem esc+q
8710 if cx=0 then 8200
8720 c$=a$(cy):a$(cy)=mid$(c$,1,cx)
8730 if mid$(c$,len(c$))=cf$ then a$(cy)=a$(cy)+cf$:i=cy:gosub 2510:goto 2310
8740 goto 5100

8800 rem esc+v
8810 if ty>=lc-1 then return
8820 ty=ty+1:if cy<ty then cy=ty
8830 locate 0,nl-1:?:print chr$(153);:if ty+nl-1<lc then poke 116,1600:print a$(ty+nl-1);:poke 116,1536
8840 goto 2310

8900 rem esc+w
8910 if ty=0 then return
8920 ty=ty-1:if cy-ty>nl-1 then cy=cy-1
8930 e=usr(-50):locate 0,0:print a$(ty);:goto 2310

9000 rem esc+a
9010 im=1:mo$="ins"
9020 goto 2250

9100 rem esc+c
9110 im=0:mo$="owr"
9120 goto 2250

9200 rem esc+o
9210 goto 9110

9300 rem to the begin
9310 cx=0:cy=0:if ty<>0 then ty=0:goto 2205
9320 goto 2310

9400 rem to the end
9410 cx=0:cy=lc-1:l=lc-nl:if l<0 then l=0
9420 if ty<>l then ty=l:goto 2205
9430 goto 2310

9500 rem page up
9510 cx=0:l=ty-nl:if l<0 then l=0
9520 cy=cy-nl:if cy<0 then cy=0
9530 goto 9420

9600 rem page down
9610 cx=0:l=ty+nl:if l>=lc then l=lc-nl
9620 if l<0 then l=0
9630 cy=cy+nl:if cy>=lc then cy=lc-1
9640 goto 9420

9700 rem new
9705 gosub 5900
9710 a$(0)=cf$:lc=1:cx=0:cy=0:f$=""
9720 goto 2205

9800 rem search
9810 cls:fs$="":?:input "Find";fs$:l=len(fs$):if l=0 then 2205
9820 s$=upper$(fs$):fs$=s$
9830 l2=cx+2:gosub 10000
9840 if fi=0 then 2205
9850 cx=fi-1:cy=j
9860 if cy-ty>nl-1 then ty=cy-12
9870 goto 2205

9900 rem repeat find
9910 if fs$="" then return
9920 cls:?:print "searching "fs$:l=len(fs$):goto 9830:gosub 10280

10000 for j=cy to lc-1
10010 s$=upper$(a$(j)):print chr$(18) j+1;
10020 fi=instr(l2,s$,fs$):if fi=0 and len(s$)=mc then gosub 10200
10030 if fi then return
10040 l2=1
10050 next
10060 goto 180

10200 l3=len(fs$):g$=upper$(a$(j+1)):l4=len(g$)
10210 for i=l3-1 to 1 step -1
10220 if l4<l3-i then return
10225 if l2>mc-i+1 then 10240
10230 c$=mid$(fs$,1,i):d$=mid$(fs$,len(fs$)-l3+i+1)
10235 if c$=mid$(s$,len(s$)-i+1) and d$=mid$(g$,1,l3-i) then fi=mc-i+1:return
10240 next
10250 return

10280 c$=chr$(153):y=0
10300 rem write to status bar C$ at pos Y
10310 y1=csrlin:x1=pos:locate 0,0
10320 poke 112,(peek(132)+15424+y) or 16384:print c$;
10340 locate x1,y1
10350 return

11000 k$=inkey$:if k$="" goto 11000
11010 return
