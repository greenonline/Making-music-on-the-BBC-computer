# Making music on the BBC micro

## Chapter 13

### Sound and animation synchronization
```
1 REM PROGRAM 14.1
2 REM Animated/Synchronised Dancer
3 REM Insert in PROGRAM 9.5/9.2
4
195 MODE 5
197 PROCFigures
198 VDU23,1,0;0;0;0;
634 x%=0:y%=10:m%=0:d%=0
640
650 Ch1=0:Ch2=0:Ch3=0
680 IF ADVAL(-6)>14 AND Ch1<C1 Ch1=Ch1+1:SOUNDChan1(1,Ch1)+1,Chan1(2,Ch1),Chan1(3,Ch1),Chan1(4,Ch1)*Tempo:IF Ch1<82 OR Ch1>97 PROCCartoon
690 IF ADVAL(-7)>14 AND Ch2<C2 Ch2=Ch2+1:SOUNDChan2(1,Ch2)+2,Chan2(2,Ch2),Chan2(3,Ch2),Chan2(4,Ch2)*Tempo:IF Ch2>69 AND Ch2<92 PROCCartoon
725 VDU23,1,1,0;0;0;
2000 DEF PROCFigures
2010 VDU23,224,124,254,68,130,130,68,40,100
2020 VDU23,225,16,56,40,16,56,84,146,56
2030 VDU23,227,40,40,40,40,40,0,0,0
2040 VDU23,228,146,16,56,124,254,40,40, 40
2050 VDU23,229,0,16,56,40,16,56,84,146
2060 M1$=" "+CHR$8+CHR$8+CHR$8+CHR$10 +" "+CHR$225+" "+CHR$8+CHR$8+CHR$8+CHR$10+" "+CHR$224+" "
2070 M2$=" "+CHR$229+CHR$8+CHR$8+CHR$10 +" "+CHR$228+" "+CHR$8+CHR$8+CHR$8+CHR$10+" "+CHR$227+" "
2080
2090 COLOUR 2
2100 ENDPROC
2110
2120
2130 DEF PROCCartoon
2140 m%=m% EOR 1
2150 IF m%=1 PRINTTAB(x%,y%)M2$ ELSE PRINTTAB(x%,y%)M1$
2160 IF x%>17 d%=1
2170 IF x%<2 d%=0
2180 IF d%=0 x%=x%+1 ELSE x%=x%-1
2190 ENDPROC
```
### Hercules
```
10 REM PROGRAM 14.2
20 REM "Hercules"
30 REM Sound and Animation in Sync 
40 REM Insert in PROGRAM 9.2
50
90 C1=53:C2=47:C3=35
250 ENVELOPE1,1,0,0,0,0,0,0,126,-4,-1, -6,126,100
260 ENVELOPE2,2,0,0,1,4,0,1,126,-3,0,- 6,126,100
270 ENVELOPE3,3,0,8,-8,0,1,1,110,0,0,- 10,110,110
272 ENVELOPE4,4,0,0,1,1,0,1,126,-8,-8, -16,126,100
274 ENVELOPE5,3,0,0,1,1,0,1,63,-8,-8,- 16,126,100
276 ENVELOPE6,6,0,0,0,0,0,0,126,0,0,-1,126,126
278 ENVELOPE7,1,0,0,0,0,0,0,126,-10,-10,-10,126,0
330 IF Note$="R" Env=0 ELSE IF (N=35 OR N=42) Env=3 ELSE IF N<19 Env=1 ELSE Env=2
450 IF Note$="R" Env=0 ELSE Env=4
570 IF Note$="R" Env=0 ELSE Env=5
651 PROCMan
652 MODE 5
653 VDU23,1,0;0;0;0;
654 m%=0:x%=8:y%=12
655 COLOUR1
656 PRINT'"Ladies and Gentlemen"
657 PRINTTAB(5)"Presenting"
658 PRINT''TAB(6)"HERCULES"
659 SOUND0,6,4,40:SOUND1,0,0,180
660 SOUND&1000,0,0,80:FOR S=1 TO 4:SOUND0,7,4,4:NEXT S
661 COLOUR 2
662
670 REPEAT
680 IF ADVAL(-6)>14 AND Ch1<C1 Ch1=Ch1+1:PROCCartoon:SOUNDChan1(1,Ch1)+1,Chan1(2,Ch1),Chan1(3,Ch1),Chan1(4,Ch1)*Tempo
690 IF ADVAL(-7)>14 AND Ch2<C2 Ch2=Ch2+1:SOUNDChan2(1,Ch2)+2,Chan2(2,Ch2),Chan2(3,Ch2),Chan2(4,Ch2)*Tempo
700 IF ADVAL(-8)>14 AND Ch3<C3 Ch3=Ch3+1:SOUNDChan3(1,Ch3)+3,Chan3(2,Ch3),Chan3(3,Ch3),Chan3(4,Ch3)*Tempo
710 UNTIL Ch1=C1 AND Ch2=C2 AND Ch3=C3
721 COLOUR1
722 PRINTTAB(10,y%+5)"Thank You"
723 PRINT'TAB(6)"...Signed HERC"
724 VDU23,1,1;0;0;0;
725 SOUND0,6,4,40
880 REM Channel 1
890 DATA &200,D3,8,E3,6,D3,2,B2,8,B2,8
900 DATA &200,B2,6,A2,2,B2,6,C3,2,B2,16
910 DATA &200,C3,8,A2,6,D3,2,B2,16
920 DATA &200,G2,8,E2,6,A2,2,D2,16
930 DATA &200,A2,20,E3,4,D3,4,C3,4
940 DATA &200,B2,4,A2,4,B2,4,C3,4,B2,16
950 DATA &200,F#2,8,B2,8,B2,8,A#2,6,C#3,2
960 DATA &200,F#3,32
970 DATA &200,R,4,E3,4,D#3,4,E3,4,A2,4,B2,4,C3,8
980 DATA &200,R,4,B2,4,G2,4,E3,4,D3,16
990 DATA &200,R,4,G2,4,D2,4,C3,4,B2,8,A2,8
1000 DATA &200,G2,16,R,16
1010 REM Channel 2
1020 DATA &200,G1,8,D1,8,G1,8,D1,8
1030 DATA &200,G1,8,D1,8,G1,8,D1,8
1040 DATA &200,A1,8,F#1,8,G1,8,F#1,8
1050 DATA &200,E1,8,C#1,8,D1,8,F#1,8
1060 DATA &200,A1,8,C2,8,A1,8,C2,8
1070 DATA &200,G1,8,B1,8,E1,8,B1,8
1080 DATA &200,F#1,8,B1,8,F#1,8,A#1,8
1090 DATA &200,B1,8,F#1,8,D#1,8,B0,8
1100 DATA &200,C1,8,A1,8,E1,8,A1,8
1110 DATA &200,D1,8,G1,8,R,4,B1,4,G1,4,E2,4
1120 DATA &200,D2,8,R,16,F#1,8
1130 DATA &200,G1,16,R,16
1140 REM Channel 3
1150 DATA &200,B1,8,R,8,B1,8,R,8 
1160 DATA &200,B1,8,R,8,B1,8,R,8 
1170 DATA &200,R,32
1180 DATA &200,R,32
1190 DATA &200,R,8,E2,8,R,8,E2,8
1200 DATA &200,R,8,E2,8,R,8,E2,8
1210 DATA &200,D2,8,R,8,C#2,8,R,8
1220 DATA &200,D#2,8,R,24
1230 DATA &200,R,8,C2,8,R,8,C2,8
1240 DATA &200,R,8,B1,8,R,16
1250 DATA &200,R,24,D1,8
1260 DATA &200,B1,16,R,16
1270
1280 DEF PROCMan
1290 VDU23,234,128,128,128,128,128,128,128,255
1300 VDU23,235,0,6,8,16,32,76,158,255
1310 VDU23,236,24,60,90,255,90,36,24,255
1320 VDU23,237,7,1,1,1,1,1,1,255
1330 VDU23,238,0,96,16,8,4,50,121,255
1340 VDU23,241,255,126,60,24,24,24,24,126
1350 VDU23,242,24,24,24,24,24,24,24,126
1360 VDU23,246,126,36,38,38,100,100,36,231
1370 VDU23,247,126,36,100,100,38,38,36,231
1380 Man1$=CHR$234+CHR$236+CHR$237+CHR$8+CHR$8+CHR$10+CHR$241+CHR$8+CHR$10+CHR$246
1390 Man2$=CHR$234+CHR$236+CHR$238+CHR$8+CHR$8+CHR$10+CHR$241+CHR$8+CHR$10+CHR$247
1400 Man3$=CHR$234+CHR$236+CHR$238+CHR$8+CHR$8+CHR$10+CHR$242+CHR$8+CHR$10+CHR$247
1410 Man4$=CHR$234+CHR$236+CHR$237+CHR$8+CHR$8+CHR$10+CHR$241+CHR$8+CHR$10+CHR$247
1420 Man5$=CHR$234+CHR$236+CHR$237+CHR$8+CHR$8+CHR$10+CHR$242+CHR$8+CHR$10+CHR$246
1430 ENDPROC
1440
1450 DEF PROCCartoon
1460 m%=m% EOR 1
1470 PRINTTAB(x%,y%);
1480 IF Ch1=1 PRINTMan4$:ENDPROC
1490 IF Ch1=C1 Wait=INKEY(60):PRINTMan4$:ENDPROC
1500 IF Ch1<19 AND m%=0 PRINTMan1$:ENDPROC ELSE IF Ch1<19 AND m%=1 PRINTMan2$:ENDPROC
1510 IF Ch1<35 AND m%=0 PRINTMan4$:ENDPROC ELSE IF Ch1<35 AND m%=1 PRINTMan5$:E NDPROC
1520 IF m%=0 PRINTMan1$ ELSE IF m%=1 PRINTMan3$
1530 ENDPROC
```
BUG???: Line 1090 B0 error in pitch data (check calculation in line 840)