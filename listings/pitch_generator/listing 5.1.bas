10 REM PROGRAM 5.1
20 REM ADSR Graph Generator
30
40 *TV255,1
50 MODE1
60 PROCSetUp
70 PROCAxis
80 Input$="":PROCReset:PROCPrintEnv
90
100 REPEAT
110 *FX15,1
120 Input$=GET$
130 IF Input$=" " PROCSound
140 IF Input$>="1" AND Input$<="8" PROCEnv
150 IF Input$="C" PROCAxis
160 UNTIL Input$="Q"
170 END
180
190 DEF PROCSetUp
200 REM Set Text Window
210 VDU28,0,4,39,0
220 REM Set Graphics Window
230 VDU24,0;0;1279;860;
240 REM Background=Yellow
250 GCOL0,130:CLG
260 REM Foreground=Black
270 GCOL0,0
280 REM Set COLOUR 1 to Flashing 
290 VDU19,1,9,0,0,0
300
310 REM Set Initial Parameters
320 PI1=0:PI2=0:PI3=0
330 PN1=0:PN2=0:PN3=0
340 T=20:T1=T:Pitch=10:Pit1=Pitch
350 AA=126:AD=-4:AS=-1:AR=-6
360 ALA=126:ALD=80:Duration=80
370 REM Marker for X Axis
380 VDU23,224,128,128,128,128,128,128,128,128
390 ENDPROC
400
410 DEF PROCAxis
420 YScale=6
430 CLG
440 VDU29,0;0;
450 MOVE50,0:DRAW50,860
460 MOVE0,50:DRAW1279,50
470 VDU5
480 FOR Mark%=0 TO 780 STEP YScale*10
490 MOVE20,Mark%+YScale*10:PRINT"-" 
500 NEXT Mark%
510 FOR Mark%=50 TO 1250 STEP 100
520 MOVEMark%,50:PRINTCHR$224
530 NEXT Mark%
540 VDU 4
550 REM Set Graphics Origin
560 VDU29,50;50;
570 ENDPROC
580
590 DEF PROCEnv
600 PROCReset
610 IF Input$="1" t=1
620 IF Input$="2" aa=1
630 IF Input$="3" ad=1
640 IF Input$="4" as=1
650 IF Input$="5" ar=1
660 IF Input$="6" ala=1
670 IF Input$="7" ald=1
680 IF Input$="8" dur=1
690 PROCPrintEnv
700 PROCAlter
710 PROCPrintEnv
720 ENDPROC
730
740 DEF PROCReset
750 b=3:t=3:aa=3:ad=3:as=3:ar=3
760 ala=3:ald=3:dur=3
770 ENDPROC
780
790 DEF PROCPrintEnv
800 COLOURb:PRINTTAB(0,0)"ENV1,";:COLOURt:PRINT;T;
810 COLOURb:PRINT;",";PI1;",";PI2;",";PI3;",";PN1;",";PN2;",";PN3;",";
820 COLOURaa:PRINT;AA;:COLOURb:PRINT;",";:COLOURad:PRINT;AD;:COLOURb:PRINT;",";
830 COLOURas:PRINT;AS;:COLOURb:PRINT;",";:COLOURar:PRINT;AR;:COLOURb:PRINT","; 
840 COLOURala:PRINT;ALA;:COLOURb:PRINT;",";:COLOURald:PRINT;ALD:COLOURb
850 COLOURdur:PRINTTAB(14,1)SPC(4)TAB(10,1)"Dur=";Duration:COLOURb
860 ENDPROC
870
880 DEF PROCAlter
890 INPUT NewVal$:PRINTTAB(0,2)SPC(6)
900 IF NewVal$="" PROCReset:PROCPrintEnv:ENDPROC
910 NewVal=EVAL(NewVal$)
920 PRINTTAB(30,0)SPC(20)
930 ON EVAL(Input$) GOTO940,950,960,970,980,990,1000,1010
940 T=NewVal:T1=T:ENDPROC
950 AA=NewVal:ENDPROC
960 AD=NewVal:ENDPROC
970 AS=NewVal:ENDPROC
980 AR=NewVal:ENDPROC
990 ALA=NewVal:ENDPROC
1000 ALD=NewVal:ENDPROC
1010 Duration=NewVal:ENDPROC
1020
1030 DEF PROCSound
1040 ENVELOPE1,T,PI1,PI2,PI3,PN1,PN2,PN3,AA,AD,AS,AR,ALA,ALD
1050 SOUND1,1,Pit1,Duration
1060 REM Clear Last Timing Results
1070 PRINTTAB(0,4)SPC(39);:PRINTTAB(0,4);
1080 IF T=0 T1=1
1090 IF T=128MT1=129
1100 Time=0:Amp=0
1110 MOVE0,0
1120 YScale=6
1130 PROCAttack
1140 PROCPrint("A",8,32)
1150 IF OverTime GOTO 1210
1160 PROCDecay
1170 PROCPrint("D",8,32)
1180 IF OverTime GOTO 1210
1190 PROCSustain
1200 PROCPrint("S",8,32)
1210 PROCPrint("r",40,16)
1220 PROCRelease
1230 PROCPrint("R",0,0)
1240 PRINT;"Secs";
1250 ENDPROC
1260
1270 DEF PROCAttack
1280 REPEAT
1290 Amp=Amp+AA
1300 IF Amp>ALA Amp=ALA
1310 DRAW Time,Amp*YScale
1320 Time=Time+T1 MOD128
1330 PROCTimeCheck:IF OverTime GOTO1350
1340 DRAW Time,Amp*YScale
1350 UNTIL OverTime OR Amp=ALA
1360 ENDPROC
1370
1380 DEF PROCDecay
1390 REPEAT
1400 Amp=Amp+AD
1410 IF ALD<ALA:IF Amp<ALD Amp=ALD
1420 IF ALD>ALA:IF Amp>ALD Amp=ALD
1430 IF ALD=ALA Amp=ALD
1440 DRAW Time,Amp*YScale
1450 Time=Time+T1 MOD128
1460 PROCTimeCheck:IF OverTime GOTO1480
1470 DRAW Time,Amp*YScale
1480 UNTIL OverTime OR Amp=ALD
1490 ENDPROC
1500
1510 DEF PROCSustain
1520 REPEAT
1530 Amp=Amp+AS
1540 IF Amp<0 Amp=0
1550 DRAW Time,Amp*YScale
1560 Time=Time+T1 MOD128
1570 PROCTimeCheck:IF OverTime GOTO1590
1580 DRAW Time,Amp*YScale
1590 UNTIL OverTime OR Amp=0
1600 ENDPROC
1610
1620 DEF PROCRelease
1630 REPEAT
1640 Amp=Amp+AR
1650 IF Amp<0 Amp=0
1660 DRAW Time,Amp*YScale
1670 IF Amp=0 GOTO1700
1680 Time=Time+T1 MOD128
1690 DRAW Time,Amp*YScale
1700 UNTIL Amp=0
1710 ENDPROC
1720
1730 DEF PROCTimeCheck
1740 OverTime=FALSE
1750 IF Time>Duration*5 Time=Duration*5:OverTime=TRUE
1760 ENDPROC
1770
1780 DEF PROCPrint(Phase$,Oset1,Oset2) 
1790 IF Phase$="R" GOTO1860
1800 VDU5
1810 MOVE Time+Oset1,Amp*YScale+Oset2 
1820 PRINTPhase$
1830 MOVE Time,Amp*YScale
1840 VDU4
1850 IF Phase$="r" ENDPROC
1860 PRINTPhase$;"=";Time/100;" ";
1870 ENDPROC
