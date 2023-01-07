9 REM PROGRAM 5.2 (Combined)
10 REM PROGRAM 5.1
19 REM ADSR & PITCH Graph Generator
20 REM ADSR Graph Generator
24 REM Added Line Numbers are not
25 REM Multiples of 10 and are+
26 REM 75,145,762,764,855,1242,1244
27 REM Plus 2000 to 2670
29 REM Altered Lines=150,810
35
75 PROCAxis2
145 IF Input$>="!" AND Input$<="'" Input=ASC(Input$):PROCPitEnv
150 IF Input$="C" PROCAxis:PROCAxis2
762 pi1=3:pi2=3:pi3=3
764 pn1=3:pn2=3:pn3=3:p=3
810 COLOURb:P.;",";:COLOURpi1:P.;PI1;:COLOURb:P.;",";:COLOURpi2:P.;PI2;:COLOURb:P.;",";:COLOURpi3:P.;PI3;:COLOURb:P.;",";:COLOURpn1:P.;PN1;:COLOURb:P.;",";:COLOURpn2:P.;PN2;:COLOURb:P.;",";:COLOURpn3:P.;PN3;:COLOURb:P.;",";
855 COLOURp:PRINTTAB(23,1)SPC(6)TAB(18 ,1)"Pitch=";Pit1:COLOURb
1242 FinalTime=Time
1244 PROCPitchEnv
2000 DEF PROCAxis2
2010 YScale=3
2020 VDU29,0;0;
2030 VDU5
2040 FOR Mark%=60 TO 780 STEP YScale*10
2050 MOVE40,Mark%+YScale*10:PRINT"-"
2060 NEXT Mark%
2070 VDU4
2080 VDU29,50;50;
2090 ENDPROC
2100
2110 DEF PROCP(pi,pn)
2120 FOR P%=1 TO pn
2130 Pitch=Pitch+pi
2140 IF Pitch>255 Pitch=Pitch MOD256
2150 IF Pitch<0 Pitch=Pitch+256
2160 DRAW Time,Pitch*YScale
2170 Time=Time+T1 MOD128
2180 PROCFinalTimeCheck:IF FTime P%=pn
2190 DRAW Time,Pitch*YScale
2200 NEXT P%
2210 ENDPROC
2220
2230 DEF PROCPitEnv
2240 PROCReset
2250 IF Input=33 pi1=1
2260 IF Input=34 pi2=1
2270 IF Input=35 pi3=1
2280 IF Input=36 pn1=1
2290 IF Input=37 pn2=1
2300 IF Input=38 pn3=1
2310 IF Input=39 p=1
2320 PROCPrintEnv
2330 PROCAlterPit
2340 PROCPrintEnv
2350 ENDPROC
2360