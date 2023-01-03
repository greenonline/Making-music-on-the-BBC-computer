## Chapter 11

### A three-part computer composition

```
10 REM PROGRAM 11.1
20 REM Computer Composition
30 REM In 3-Part Harmony
40
50 MODE7
60
70 FOR X%=0 TO 1:PRINTTAB(0,X%)CHR$141;CHR$133;TAB(6)"3-PART HARMONY COMPOSITION":NEXT X%
80 PRINTTAB(0,2)CHR$131;"Channel 1";TAB(13);"Channel 2";TAB(26);"Channel 3"
90
100 FOR Col=3 TO 24
110 PRINTTAB(0,Col);CHR$(129+Col MOD 6);
120 NEXT Col
130
140 REM Set text Window
150 VDU28,1,24,39,4
160
170 DIM Dice%(4),Key$(15)
180 Key=1
190 Tempo%=1
200 Scale$=" C C#D D#E F F#GG#A A#B"
210
220 REM Chinese Sticks
230 ENVELOPE1,1,0,0,0,0,0,0,126,-10,-5 ,-2,126,100
240
250 REM Slow Attack
260 ENVELOPE2,1,0,0,0,0,0,0,10,-1,0,-1,126,100
270
280 REM Vibrato
290 ENVELOPE3,4,0,1,0,2,1,0,126,-10,-4 ,-4,126,100
300 Env1=3:Env2=3:Env3=3
310
320 PROCSetScale
330 PROCDuration
340
350 REPEAT
360 IF ADVAL(-6)>0 PROCPlay1
370 IF ADVAL(-7)>0 PROCPlay2
380 IF ADVAL(-8)>0 PROCPlay3
390 UNTIL FALSE
400 END
410
420 DEF PROCSetScale
430
440 REM RESTORE To Required Scale
450 RESTORE 530
460
470 FOR I%=0 TO 15
480 READ Key$(I%)
490 NEXT I%
500 ENDPROC
510
520 REM Hornpipe
530 DATA C2,E2,G2,C3,E3,G3,C4,G3,A3,F3,D3,A2,F2,D2,F2,A2 540
550 REM Chinese
560 DATA F#2,G#2,A#2,C#2,D#2,F#3,G#3,A #3,C#3,D#3,F#2,G#2,A#2,C#2,D#2,F#2
570
580 REM Minor Key
590 DATA A#3,D3,G2,C2,D#2,G2,C3,G#3,G3,C4,D#3,G#3,C4,D3,D#3,G#3
600
610 REM Minstrel
620 DATA B2,G2,D3,G2,A3,E3,C4,A2,C3,A2 ,E3,C3,G3,D3,G3,B2
630
640 REM Minstrel 2
650 DATA F3,A3,G3,C2,E3,G2,C2,G2,E2,C3 ,A2,G3,C3,A#2,G2,F2
660
670 DEF PROCDuration
680
690 REM GOTO Required Durations
700 REM See Text For Explanation
710 GOTO 770
720
730 REM Fast (Chinese)
740 X1=3:Y1=0:Dotted1=1:X2=1:Y2=2:Dotted2=9:X3=1:Y3=1:Dotted3=9:GOTO 820
750
760 REM Mad Hornpipe
770 X1=1:Y1=1:Dotted1=9:X2=1:Y2=1:Dotted2=9:X3=1:Y3=1:Dotted3=9:GOTO 820
780
790 REM Minstrel
800 X1=1:Y1=3:Dotted1=1:X2=2:Y2=3:Dott
ed2=1:X3=1:Y3=5:Dotted3=1:GOTO 820
810
820 ENDPROC
830
840 DEF PROCPlay1
850 PROCRollDice
860 PROCGetNote
870 D=1:IF RND(16)<Dotted1 THEN D=1.5
880 IF X1=1 THEN Dur%=2^Y1*D
890 IF X1>1 THEN Dur%=2^(RND(X1)+Y1)*D
900 SOUND1,Env1,Pitch%,Dur%*Tempo%
910 PROCPrint(3)
920 ENDPROC
930
940 DEF PROCPlay2
950 PROCRollDice
960 PROCGetNote
970 D=1:IF RND(16)<Dotted2 THEN D=1.5
980 IF X2=1 THEN Dur%=2^Y1*D
990 IF X2>1 THEN Dur%=2^(RND(X1)+Y1)*D
1000 SOUND2,Env2,Pitch%,Dur%*Tempo%
1010 PROCPrint(15)
1020 ENDPROC
1030
1040 DEF PROCPlay3
1050 PROCRollDice
1060 PROCGetNote
1070 D=1:IF RND(16)<Dotted3 THEN D=1.5
1080 IF X3=1 THEN Dur%=2^Y3*D
1090 IF X3>1 THEN Dur%=2^(RND(X3)+Y3)*D
1100 SOUND3,Env3,Pitch%-48,Dur%*Tempo%
1110 PROCPrint(28)
1120 ENDPROC
1130
1140 DEF PROCRollDice
1150 Chance%=RND(100)
1160
1170 REM This Sets the Random Factor
1180 IF Chance%<84 Roll=1 ELSE IF Chance%<88 Roll=2 ELSE IF Chance%<92 Roll=3 ELSE IF Chance%<96 ROLL=4 ELSE Roll=5
1190
1200 IF Roll=1 Dice%(0)=RND(4)-1 ELSE PROCRoll
1210 PROCAddRolls
1220 ENDPROC
1230
1240 DEF PROCRoll
1250 FOR I%=0 TO Roll-1
1260 Dice%(I%)=RND(4)-1
1270 NEXT I%
1280 ENDPROC
1290
1300 DEF PROCAddRolls
1310 Note%=0
1320 FOR I%=0 TO 4
1330 Note%=Note%+Dice%(I%)
1340 NEXT I%
1350 ENDPROC
1360
1370 DEF PROCPrint(Tab)
1380 PRINTTAB(Tab)Key$(Note%);"-";Dur%*Tempo%;
1390 ENDPROC
1400
1410 DEF PROCGetNote
1420 IF LEN(Key$(Note%))=2 THEN NoteName$=LEFT$(Key$(Note%),1) ELSE NoteName$=L EFT$(Key$(Note%),2)
1430 Octave%=VAL(RIGHT$(Key$(Note%),1))
1440 PositionInScale%=(INSTR(Scale$,NoteName$))/3
1450 Pitch%=Key+PositionInScale%*4+(Octave%-1)*48
1460 IF Pitch%<0 OR Pitch%>255 PRINT"ERROR IN PITCH DATA ";Key$(Note%);" Pitch = ";Pitch%:STOP
1470 ENDPROC
```

### Experimenting with the program
All the variable parameters and DATA statements can be altered and adjusted to produce an almost infinite range of sounds. Much of it will be music but with extreme settings, especially of the duration parameters, the results will be disjointed.
If you enter: 
```
1155 Chance%=80 
```
and then:
```
1155 Chance%=100
```
you will be able to hear and observe the results of rolling only one dice and then of rolling all five. You can add values in between, to simulate rolling any specific number. If you temporarily blank out PROCPrint, eg by adding:
```
1375 ENDPROC
```
and add:
```
1345 PRINT Note%
```
### Using chords as a compositional base
```
10 REM PROGRAM 11.2
20 REM Computer Composition
30 REM Based on Chord Sequences
40
50 MODE7
60
70 Scale$=" C C#D D#E F F#GG#A A#B"
80 ChordRange$=" M 7 9 min min6min7min9maj6maj7aug dim"
90
100 DIM NotesToChooseFrom$(11,6)
110
120 REM RESTORE To Requied Data
130 RESTORE 220
140 READ NoOfChords%
150
160 DIM Melody$(NoOfChords%)
170
180 FOR Tune=1 TO NoOfChords%
190 READ Melody$(Tune)
200 NEXT Tune
210
220 DATA 12
230 DATA C7,C7,C7,C7,F7,F7,C7,C7,G7,F7,C7,G7
240
250 DATA 12
260 DATA C7,C9,C7,C9,F7,F9,C7,C9,G9,F9,C9,G7
270
280 DATA 32
290 DATA Cmin,Cmin,G7,G7,G7,G7,Cmin
300 DATA Cmin,Cmin,Cmin,G7,G7,G7,G7
310 DATA Cmin,Cmin,Fmin,Fmin,Cmin,Cmin
320 DATA G7,G7,Cmin,Cmin,Fmin,Fmin
330 DATA Cmin,Cmin,G7,G7,Cmin,Cmin
340
350 DATA 16
360 DATA Amin7,D7,Gmaj6,Emin6,Gmin9,C7
370 DATA Fmaj7,Dmin6,Fmin7,G#min6
380 DATA Gmaj6,D#M,Cmin6,D7,Bmin,E7
390
400 RESTORE 1470
410 FOR N=1 TO 11
420 FOR C=1 TO 6
430 READ NotesToChooseFrom$(N,C)
440 NEXT C
450 NEXT N
460
470 ENVELOPE1,4,0,1,0,1,1,0,32,-2,0,-4,126,100
480 ENVELOPE2,1,0,0,0,0,0,0,126,-4,-1,-4,126,100
490 ENVELOPE3,4,0,0,0,0,0,0,106,-1,0,-1,106,80
500 Env1%=2:Env2%=2:Env3%=3
510
520 PRINT''
530 PRINT"Please Enter Number of Beats in Bar"
540 INPUT NoOfBeats%
550 PRINT"Please Enter Tempo (2 or greater)"
560 INPUT Tempo1%
570 Tempo%=Tempo1%
580
590 PRINT"Do You Want Rhythm Variation (Y/N)"
600 INPUT Sync$
610 IF Sync$="Y" OR Sync$="y" Sync=TRUE ELSE Sync=FALSE 620
630 Comp=0
640 REPEAT
650
660 Comp=Comp+1
670 Col=128+(Comp MOD7)
680 PRINTTAB(2,10)CHR$Col;CHR$141;"Composing Opus 1 Variation ";Comp
690 PRINTTAB(2,11)CHR$Col;CHR$141;"Composing Opus 1 Variation ";Comp
700
710 FOR T%=1 TO NoOfChords%
720 SyncPoint=RND(4)
730 FOR Beat%=1 TO NoOfBeats%*2
740
750 IF Sync PROCSync
760 PROCPlay
770
780 NEXT Beat%
790 NEXT T%
800 UNTIL FALSE
810
820 END
830
840 DEF PROCPlay
850
860 PROCAnalyseChord
870 PROCGetNote(Note1$)
880 PROCPlayChord(&101,Env1%)
890 PROCGetNote(Note2$)
900 PROCPlayChord(&102,Env2%)
910 PROCBass(Key%+4)
920
930 ENDPROC
940
950 DEF PROCAnalyseChord
960 Chord$=Melody$(T%)
970 IF MID$(Chord$,2,1)="#" Key$=LEFT$(Chord$,2):ChordType$=MID$(Chord$,3) ELSE Key$=LEFT$(Chord$,1):ChordType$=MID$(Chord$,2)
980 Key%=1+((INSTR(Scale$,Key$))/3-1)* 4
990 ChordNumber%=(INSTR(ChordRange$,ChordType$))/4
1000
1010 Choice1%=RND(6)
1020 REPEAT
1030 Choice2%=RND(6)
1040 UNTIL Choice2%<>Choice1%
1050
1060 Note1$=NotesToChooseFrom$(ChordNumber%,Choice1%)
1070 Note2$=NotesToChooseFrom$(ChordNumber%,Choice2%)
1080 ENDPROC
1090
1100 DEF PROCGetNote(Note$)
1110 IF LEN(Note$)=2 THEN NoteName$=LEFT$(Note$,1) ELSE NoteName$=LEFT$(Note$,2 )
1120 Octave%=VAL(RIGHT$(Note$,1))
1130 PositionInScale%=(INSTR(Scale$,NoteName$))/3
1140 Pitch%=Key%+PositionInScale%*4+(Octave%-1)*48
1150 IF Pitch%<0 OR Pitch%>255 PRINT"ERROR IN PITCH DATA ";Note$;" Pitch = ";Pitch%:STOP
1160 ENDPROC
1170
1180 DEF PROCPlayChord(Chan%,Env%)
1190 SOUNDChan%,Env%,Pitch%,Tempo%
1200 ENDPROC
1210
1220 DEF PROCBass(Pit%)
1230 IF ADVAL(-8)>0 SOUND3,Env3%,Pit%,Tempo%
1240 ENDPROC
1250
1260 DEF PROCSync
1270 REM GOTO Required Syncopation
1280 ON SyncPoint GOTO 1300,1370,1400,1310
1290
1300 IF Beat%=1 Tempo%=Tempo1%*1.5 ELSE IF Beat%=2 Tempo%=Tempo1%*.5 ELSE Tempo%=Tempo1%
1310 ENDPROC
1320
1330 REM Out Of Sync
1340 IF Beat%=1 Tempo%=Tempo1%*2 ELSE IF Beat%=2 Beat%=3 ELSE Tempo%=Tempo1% 1350 ENDPROC
1360
1370 IF Beat%=NoOfBeats% OR Beat%=NoOfBeats%+1 Tempo%=Tempo1%*.5 ELSE IF Beat%= 1 Tempo%=Tempo1%*2 ELSE Tempo%=Tempo1%
1380 ENDPROC
1390
1400 IF Beat%=NoOfBeats% OR Beat%=NoOfBeats%+1 OR Beat%=NoOfBeats%+2 OR Beat%=NoOfBeats%+3 Tempo%=Tempo1%*.5:PROCPlay
1410 ENDPROC
1420
1430 IF Beat% MOD 2=1 Tempo%=Tempo1%*.7 5 ELSE IF Beat% MOD 2=0 Tempo%=Tempo1%*.25
1440 ENDPROC
1450
1460 REM Major
1470 DATA G1,C2,E2,G2,C3,E3
1480
1490 REM Seventh
1500 DATA A#1,C2,E2,G2,A#2,C3
1510
1520 REM Major Ninth
1530 DATA D2,E2,G2,A#2,C3,D3
1540
1550 REM Minor
1560 DATA G1,C2,D#2,G2,C3,D#3
1570
1580 REM Minor 6th
1590 DATA A1,C2,D#2,G2,A2,C3
1600
1610 REM Minor 7th
1620 DATA A#1,C2,D#2,G2,A#2,C3
1630
1640 REM Minor Ninth
1650 DATA D2,D#2,G2,A#2,C3,D3
1660
1670 REM Major 6th
1680 DATA A1,C2,E2,G2,A2,C3
1690
1700 REM Major 7th
1710 DATA B1,C2,E2,G2,B2,C3
1720
1730 REM Augmented
1740 DATA G#1,C2,E2,G#2,C3,E3
1750
1760 REM Diminished
1770 DATA D#2,F#2,A2,C3,D#3,F#3
```

### The Amazing One Line Wonder Composer program

If you do not want to check through the music or DATA statements of a particular piece, you can find the highest and lowest notes by adding the following (to programs based on Program 9.2):
```
1 HiP=0:LoP=255
851 IF Pitch>HiP HiP=Pitch
852 IF Pitch<LoP LoP=Pitch
```
Here is the line to insert in Rondo:
```
855 Pitch=77+77-Pitch
```
For the Dance of the Sugar-plum Fairy insert: 
```
855 Pitch=117+117-Pitch
```
and this for the Liberty Bell:
```
855 Pitch=85+85-Pitch
```
