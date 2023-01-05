# Making music on the BBC micro

## Chapter 10
```
5 REM Anarchy
10 REPEAT
20 SOUND RND(3),RND(15)-16,RND(255),RND(10)
30 UNTIL FALSE
```

### Aspects of a composition
```
10 REM PROGRAM 10.1
20 REM Computer Composition 
30 REM Based on Rules
40
50 PROCSetup
60
70 NoOfBars=4
80 Count=0
90
100 FOR B=1 TO NoOfBars
110 PRINT"Composing Bar ";B
120 PROCBar
130 NEXT B
140
150 PROCPlay
160
170 PRINT"Press SPACE For Another Tune"
180 PRINT"Press ""R"" For A Replay"
190
200 REPEAT
210 *FX15,1
220 Key$=GET$
230 UNTIL (Key$=" " OR Key$="R")
240 IF Key$="R" GOTO 150 ELSE GOTO 80
250
260 END
270
280 DEF PROCSetup
290 Scale$="  C  C# D  D# E  F  F# G  G# A  A# B"
300
310 ENVELOPE1,4,0,1,0,1,1,0,126,-8,0,- 8,126,80
320 Key=1
330 Tempo=2
340
350 DIM Tune(2,129), Tune$(129)
360
370 DIM NotesToChooseFrom$(15)
380 FOR S%=1 TO 15
390 READ Note$
400 NotesToChooseFrom$(S%)=Note$
410 NEXT S%
420 ENDPROC
430
440 DATA G1,A1,B1,C2,D2,E2,F2,G2,A2,B2,C3,D3,E3,F3,G3
450
460 DEF PROCChooseNote
470 Note=RND(15)
480 Note$=NotesToChooseFrom$(Note)
490 ENDPROC
500
510 DEF PROCPlay
520 FOR P=1 TO Count
530 PRINTTune$(P),Tune(2,P)*Tempo
540 SOUND1,1,Tune(1,P),Tune(2,P)*Tempo
550 NEXT P
560 ENDPROC
570
580 DEF PROCAnalyseNote
590 IF LEN(Note$)<2 OR LEN(Note$)>3 THEN PRINT"ERROR IN DATA ";Note$:STOP
600 IF LEN(Note$)=2 THEN NoteName$=LEFT$(Note$,1) ELSE NoteName$=LEFT$(Note$,2)
610 PositionInScale=INSTR(Scale$,NoteName$)/3
620 Octave=VAL(RIGHT$(Note$,1))
630 ENDPROC
640
650 DEF PROCCalculatePitch
660 Pitch=Key+PositionInScale*4+(Octave-1)*48
670 IF Pitch<0 OR Pitch>255 THEN PRINT"ERROR IN PITCH DATA ";Note$;" Pitch = " ;Pitch:STOP
680 ENDPROC
690
700 DEF PROCBar
710 DurationSoFar=0
720 REPEAT
730 Count=Count+1
740 REPEAT
750 PROCChooseNote
760 PROCAnalyseNote
770 PROCRules
780 UNTIL NoteOK
790 LastNote=Note
800 PROCCalculatePitch
810 Tune(1,Count)=Pitch:Tune$(Count)=Note$
820 PROCDur
830 Tune(2,Count)=Dur
840 DurationSoFar=DurationSoFar+Dur
850 UNTIL DurationSoFar=16
860 ENDPROC
870
880 DEF PROCDur
890 REPEAT
900 Dur=2^RND(2)
910
920 REM Set Last Note To Semibreve
930 IF B=NoOfBars Dur=16
940
950 UNTIL DurationSoFar+Dur<=16
960 ENDPROC
970
980 DEF PROCRules
990 NoteOK=FALSE
1000
1010 REM Set First Note
1020 IF Count=1 AND NOT(NoteName$="C" OR NoteName$="G" OR NoteName$="E") ENDPROC
1030
1040 REM Make a "B" Move up to a "C" 
1050 IF Count>1 AND LEFT$(Tune$(Count-1),1)="B" Note=LastNote+1:Note$=NotesToChooseFrom$(Note):PROCAnalyseNote
1060
1070 REM Restrict Jumps To 4 Notes
1080 IF Count>1:IF ABS(LastNote-Note)>4 ENDPROC
1090
1100 REM Set Last Bar
1110 IF B=NoOfBars AND NoteName$<>"C" ENDPROC
1120
1130 NoteOK=TRUE
1140 ENDPROC
```

### Experimenting with the program

```
1 REM PROGRAM 10.2
2 REM Computer Compositions with
3 REM Fixed Rhythm Pattern
4 REM Insert in PROGRAM 10.1
85 RESTORE 920 
890 READ Dur
900 ENDPROC
910
920 DATA 2,2,2,2,4,4
930 DATA 2,2,4,8
940 DATA 2,2,4,2,2,4
950 DATA 4,4,8
960
970
980 DEF PROCRules
990 NoteOK=FALSE
1110 IF Count=19 AND NoteName$<>"C" END
```
BUG???: Runs once and then just quits and never runs again?


### Note analysis in composition

```
10 REM PROGRAM 10.3
20 REM Computer Compositions
30 REM Based Upon Note Analysis
40
50 MODE 7
60 REM Page Mode Off
70 VDU15
80 ENVELOPE1,4,0,1,0,1,1,0,126,-8,0,-8,120,90
90
100 DIM Tune$(238),Dur%(238),F1%(36)
110 Key%=37
120 Scale$="  A1 A#1B1 C1 C#1D1 D#1E1 F1 F#1G1 G#1A2 A#2B2 C2 C#2D2 D#2E2 F2 F#2G2 G#2A3 A#3B3 C3 D#3D3 D#3E3 F3 F#3G3 G#3"
130
140 PROCGetTune
150 PROCNewScale
160 PROCAnalyseTune
170 PROCCalcPercentages
180 PROCPrint
190
200 INPUT"Enter 'LAST BUT ONE' and 'LAST NOTE' in terms of note number in New Scale",Penult%,LastNote%
210 PRINT'"Press 'S' to STOP"'"Enter s earch depth (1/2/3) - This may be altered as the program is running?":Play%=GET
220
230 D%=0
240 REPEAT
250 PROCGetNote
260 PROCPlay
270 PL%=INKEY(0):IF PL%>48 AND PL%<52 THEN Play%=PL%
280 UNTIL PL%=83
290
300 END
310
320 DEFPROCGetTune
330 PRINT"Reading in Tune For Analysis"'
340 REM RESTORE To Required Tune
350 RESTORE 1810
360
370 Count%=0
380 REPEAT
390 Count%=Count%+1
400 READ Note$,Dur:IF Note$="X" GOTO 430
410 Tune$(Count%)=Note$
420 Dur%(Count%)=Dur
430 UNTIL Note$="X"
440
450 TuneLength%=Count%
460 ENDPROC
470
480 DEFPROCNewScale
490 PRINT"Calculating New Scale"'
500
510 FOR Note%=1 TO TuneLength%
520 Pos%=INSTR(Scale$,Tune$(Note%))/3
530 F1%(Pos%)=F1%(Pos%)+1
540 NEXT Note%
550
560 Scale2$=" "
570
580 FOR Note%=1 TO 36
590 IF F1%(Note%)>0 THEN Scale2$=Scale2$+MID$(Scale$,Note%*3,3)
600 NEXT Note%
610
620 PRINT"New Scale = ";Scale2$'
630 ScaleLength%=(LEN(Scale2$)-2)/3
640 PRINT"Scale length = ";ScaleLength%'
650
660 DIM F2%(ScaleLength%,ScaleLength%),F3%(ScaleLength%,ScaleLength%,ScaleLength%)
670
680 REM Reset F1% Array
690 FOR C%=1 TO 36
700 F1%(C%)=0
710 NEXT C%
720 ENDPROC
730
740 DEFPROCAnalyseTune
750 PRINT"Analysing Tune..."'
760 FOR Note%=1 TO TuneLength%
770 Pos1%=INSTR(Scale2$,Tune$(Note%))/3
780 F1%(Pos1%)=F1%(Pos1%)+1
790 IF Note%>TuneLength%-1 THEN GOTO 820
800 Pos2%=INSTR(Scale2$,Tune$(Note%+1))/3
810 F2%(Pos1%,Pos2%)=F2%(Pos1%,Pos2%)+1
820 IF Note%>TuneLength%-2 THEN GOTO 850
830 Pos3%=INSTR(Scale2$,Tune$(Note%+2))/3
840 F3%(Pos1%,Pos2%,Pos3%)=F3%(Pos1%,Pos2%,Pos3%)+1
850 NEXT Note%
860 ENDPROC
870
880 DEFPROCCalcPercentages
890
900 PRINT"Calculating First Order Frequency..."
910 Sum1%=0
920 FOR n1%=1 TO ScaleLength%
930 Sum1%=Sum1%+F1%(n1%)
940 NEXT n1%
950 FOR n1%=1 TO ScaleLength%
960 F1%(n1%)=F1%(n1%)*100/Sum1%
970 NEXT n1%
980
990 PRINT"Calculating Second Order Frequency..."
1000 FOR n1%=1 TO ScaleLength%
1010 Sum2%=0
1020 FOR n2%=1 TO ScaleLength%
1030 Sum2%=Sum2%+F2%(n1%,n2%)
1040 NEXT n2%
1050 IF Sum2%>0 THEN FOR n2=1 TO ScaleLength%:F2%(n1%,n2)=F2%(n1%,n2)*100/Sum2% :NEXT n2
1060 NEXT n1%
1070
1080 PRINT"Calculating Third Order Frequency..."
1090 FOR n1%=1 TO ScaleLength%
1100 FOR n2%=1 TO ScaleLength%
1110 Sum3%=0
1120 FOR n3%=1 TO ScaleLength%
1130 Sum3%=Sum3%+F3%(n1%,n2%,n3%)
1140 NEXT n3%
1150 IF Sum3%>0 THEN FOR n3=1 TO ScaleLength%:F3%(n1%,n2%,n3)=F3%(n1%,n2%,n3)*100/Sum3%:NEXT n3
1160 NEXT n2%
1170 NEXT n1%
1180 ENDPROC
1190
1200 DEF PROCPrint
1210 PRINT'"Do You Want a Printout (Y/N)?"
1220 Ans$=GET$:IF Ans$="N" THEN PRINT:ENDPROC ELSE IF Ans$<>"Y" THEN 1220
1230
1240 FOR n1%=1 TO ScaleLength%
1250 IF F1%(n1%)>0 THEN PRINTMID$(Scale2$,n1%*3,2);"...";F1%(n1%)
1260 NEXT n1%
1270
1280 FOR n1%=1 TO ScaleLength%
1290 FOR n2%=1 TO ScaleLength%
1300 IF F2%(n1%,n2%)>0 THEN PRINTMID$(Scale2$,n1%*3,2);"-";MID$(Scale2$,n2%*3,2 );"...";F2%(n1%,n2%)
1310 NEXT n2%
1320 NEXT n1%
1330
1340 FOR n1%=1 TO ScaleLength%
1350 FOR n2%=1 TO ScaleLength%
1360 FOR n3%=1 TO ScaleLength%
1370 IF F3%(n1%,n2%,n3%)>0 THEN PRINTMID$(Scale2$,n1%*3,2);"-";MID$(Scale2$,n2% *3,2);"-";MID$(Scale2$,n3%*3,2);"...";F3 %(n1%,n2%,n3%)
1380 NEXT n3%
1390 NEXT n2%
1400 NEXT n1%
1410 PRINT
1420
1430 ENDPROC
1440
1450 DEFPROCGetNote
1460 Dice%=RND(100)
1470 Note%=0:Sum%=0
1480
1490 REPEAT
1500 Note%=Note%+1
1510
1520 REM In Case a Note Has Never
1530 REM Followed a Particular
1540 REM Sequence of Notes
1550 IF Note%>ScaleLength% THEN Note%=RND(ScaleLength%):Sum%=Dice%
1560
1570 REM Third Order
1580 IF Play%=51 THEN Sum%=Sum%+F3%(Pen ult%,LastNote%,Note%)
1590
1600 REM Second Order
1610 IF Play%=50 THEN Sum%=Sum%+F2%(LastNote%,Note%)
1620
1630 REM First Order
1640 IF Play%=49 THEN Sum%=Sum%+F1%(Note%)
1650 UNTIL Sum%>=Dice%
1660
1670 Note$=MID$(Scale2$,Note%*3,3)
1680 Penult%=LastNote%:LastNote%=Note%
1690 PRINTNote$;TAB(12)"Depth = ";CHR$Play%
1700 ENDPROC
1710
1720 DEFPROCPlay
1730 Position%=(INSTR(Scale$,Note$))/3
1740 Note%=Key%+(Position%*4)
1750 SOUND1,1,Note%,Dur%(D%)
1760 D%=D%+1
1770 IF D%>TuneLength% D%=0
1780 ENDPROC
1790
1800 REM Ode To Joy - Beethoven
1810 DATA E2,8,E2,8,F2,8,G2,8,G2,8,F2,8 ,E2,8,D2,8,C2,8,C2,8,D2,8,E2,8,E2,12
1820 DATA D2,4,D2,16,E2,8,E2,8,F2,8,G2, 8,G2,8,F2,8,E2,8,D2,8,C2,8,C2,8,D2,8
1830 DATA E2,8,D2,12,C2,4,C2,16,D2,8,D2 ,8,E2,8,C2,8,D2,8,E2,4,F2,4,E2,8,C2,8
1840 DATA D2,8,E2,4,F2,4,E2,8,D2,8,C2,8 ,D2,8,G1,16,E2,8,E2,8,F2,8,G2,8,G2,8
1850 DATA F2,8,E2,8,D2,8,C2,8,C2,8,D2,8 ,E2,8,D2,12,C2,4,C2,8,X,0
1860
1870 REM Jesu, Joy - Bach
1880 DATA G1,6,A2,6,B2,6,D2,6,C2,6,C2,6,E2,6,D2,6,D2,6,G2,6,F#2,6,G2,6,D2,6 
1890 DATA B2,6,G1,6,A2,6,B2,6,C2,6,D2,6,E2,6,D2,6,C2,6,B2,6,A2,6,B2,G1,6
1900 DATA F#1,6,G1,6,A2,6,D1,6,F#1,6,A2,6,C2,6,B2,6,A2,6,B2,6,G1,6,A2,6,B2,6 
1910 DATA D2,6,C2,6,C2,6,E2,6,D2,6,D2,6,82,6,F#2,6,G2,6,D2,6,B2,6,G1,6,A2,6
1920 DATA B2,6,E1,6,D2,6,C2,6,B2,6,A2,6,G1,6,D1,6,G1,6,F#1,6,G1,18,X,0
1930
1940 REM Irish Jig
1950 DATA D2,3,B2,3,G1,3,G1,3,D1,3,G1,3 ,G1,3,B2,3,G1,3,B2,3,D2,3,C2,3,B2,3
1960 DATA C2,3,A2,3,A2,3,E1,3,A2,3,A2,3 ,C2,3,A2,3,C2,3,E2,3,D2,3,C2,3,B2,3
1970 DATA G1,3,G1,3,D1,3,G1,3,G1,3,B2,3 ,G1,3,B2,3,D2,3,C2,3,B1,3,C2,3,B1,3
1980 DATA C2,3,A2,3,D2,3,C2,3,B2,3,G1,3 ,D2,3,G2,3,B3,3,A3,3,G2,3,F#2,3,D2,3
1990 DATA F#2,3,F#2,3,D2,3,F#2,3,F#2,3, D2,3,F#2,3,A3,3,G2,3,F#2,3,E2,3,G2,3
2000 DATA G2,3,D2,3,G2,3,G2,3,C2,3,G2,3 ,G2,3,B2,3,G2,3,G2,3,C2,3,B2,3,C2,3
2010 DATA A2,3,D2,3,C2,3,B2,3,G1,3,G1,3 ,G1,6,X,0
```
