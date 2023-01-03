# Making music on the BBC micro

## Chapter 8

### The BBC as a monophonic keyboard

```
10 REM PROGRAM 8.1
20 REM Monophonic Keyboard
30 REM From G (Pitch=33)
40 REM To E (Pitch=117)
50
60 ON ERROR GOTO150
70
80 Keyboard$="Q2W3ER5T6YU8I9O0P^[\_"
90 *FX11,1
100 REPEAT
110 Key$=INKEY$(0)
120 Pitch=29+4*INSTR(Keyboard$,Key$)
130 IF Key$<>"":IF Pitch>29 SOUND&11,-15,Pitch,2
140 UNTIL FALSE
150 *FX12,0
```


#### Add an envelope
```
ENVELOPE1,1 ,0,0,0 ,0,0,0,126,-4,0,-4,126,80
```
### Keyboard display program
```
1000 REM PROGRAM 8.2
1010 REM Keyboard Display
1020
1030 DEF PROCKeyBoard
1040 CLS
1050 FOR Title=1 TO 2
1060 PRINTTAB(9,1+Title)CHR$141;CHR$132;"K E Y B O A R D"
1070 NEXT Title
1080 
1090 PRINT''" f1   f2   f3   f4"
1100 PRINT"ENV1 ENV2 ENV3 ENV4"
1110 PRINT''"  2  3     5  6     8  9  0     ^ |"
1120
1130 K$=CHR$156+CHR$151+CHR$157
1140 J$=CHR$148+CHR$181+" "
1150
1160 FOR Key=1 TO 4 
1170 PRINTCHR$151;CHR$255; 
1180 PRINTK$;K$;J$;K$;K$;J$; 
1190 PRINTK$;K$;K$;J$;K$;K$;CHR$156 
1200 NEXT Key
1210
1220 FOR Key=1 TO 5
1230 PRINTCHR$151;CHR$157;CHR$148;
1240 PRINTSTRING$(12,CHR$181+" "+" ") 
1250 NEXT Key
1260
1270 PRINT" Q  W  E  R  T  Y  U  I  O  P  @  [  _"
1280 ENDPROC
```
#### Insert the following procedure call at the beginning of the following program listings
```
PROCKeyBoard
```
### Alternative methods of note production
```
10 REM PROGRAM 8.3
20 REM 3-Note Polyphonic
30 REM Keyboard (Q - _)
40 REM From G (Pitch=81)
50 REM To E (Pitch=165)
60
70 DIM KBoard%(26)
80 DIM KFlag%(26)
90 DIM CH%(3)
100
110 FOR Channel=1 TO 3
120 CH%(Channel)=0
130 NEXT Channel
140
150 FOR Keys=1 TO 26
160 READ Data
170 KBoard%(Keys)=Data
180 KFlag%(Keys)=-1
190 NEXT Keys
200
210 DATA 17,50,34,18,35,52,20,36,53
220 DATA 69,54,22,38,39,55,40,56,72
230 DATA 25,57,121,41,114,115,116,21
240
250 REM f1=ENVELOPE1:f2=ENVELOPE2
260 REM f3=ENVELOPE3:f4=ENVELOPE4
270
280 ENVELOPE1,1,0,0,0,0,0,0,126,-4,-4,-4,126,100
290 ENVELOPE2,129,12,0,-4,1,0,3,126,-1,0,-4,126,100
300 ENVELOPE3,1,0,1,-1,0,1,1,126,-1,0,-4,126,100
310 ENVELOPE4,8,0,0,0,0,0,0,63,10,0,-63,63,126
320
330 Pitch%=77
340 E%=2
350
360 KPressed%=0
370 REPEAT
380 FOR N%=1 TO 26
390 IF INKEY(-(KBoard%(N%)))=KFlag%(N%) PROCP
400 NEXT N%
410 UNTIL FALSE
420 END
430
440 DEF PROCP
450 IF N%>22 PROCE:ENDPROC
460 IF KPressed%=3 AND KFlag%(N%) ENDPROC
470 Chan%=0
480 IF KFlag%(N%) REPEAT Chan%=Chan%+1:UNTIL CH%(Chan%)=0:CH%(Chan%)=N%:SOUND&10+Chan%,E%,Pitch%+N%*4,255:KPressed%=KPressed%+1
490 IF NOT KFlag%(N%) REPEAT Chan%=Chan%+1:UNTIL CH%(Chan%)=N%:CH%(Chan%)=0:SOUND&1010+Chan%,0,0,0:KPressed%=KPressed%-1
500 KFlag%(N%)=NOT KFlag%(N%)
510 ENDPROC
520
530 DEF PROCE
540 E%=N%-22
550 ENDPROC
```

#### Brute force
```
390 IF KeysPressed>3 ENDPROC ELSE IF INKEY (-17) Note=33:PROCSound:KeysPressed:KeysPressed+1
```
### Further additions to the musical keyboard: a bass sequencer
```
10 REM PROGRAM 8.4
20 REM Bass Sequencer with
30 REM Duophonic Keyboard
40 REM Alter 460: Add 345, 375 &
50 REM 560 plus in PROGRAM 8.3
60
345 Env%=1
375 PROCBass
560 DEF PROCBass
570 IF ADVAL(-8)<1 ENDPROC
580 READ P%,D%:IF P%=-1 RESTORE 620:READ P%,D%
590 SOUND3,Env%,P%,D%
600 ENDPROC
610
620 DATA 33,4,33,4,45,4,53,4,-1,-1
```

### Altering the bass riff

```
346 BassPitch%=33
590 SOUND3,Env%,BassPitch%+P%,D%
620 DATA 0,4,0,4,12,4,20,4,-1,-1
```

565 IF ADVAL(5)>0 SOUND0,Env%,4,2

#### Combine with Rhythm Unit listing from chapter 7 (listing 7.3 or 7.3.1)

????

#### More bass lines to try
```
REM Key G Minor
620 DATA 33,4,81,4,49,4,53,4,57,4,61,4,13,4,61,4,-1,1
```

```
REM Key G Minor
620 DATA 33,4,45,4,65,4,61,4,-1,-1
```

```
REM Key G Major
620 DATA 33,8,49 ,2,61,2,81,4,73,4,61,4,73,4,89,4,-1,-1
```

```
REM Key A Minor/G Major
620 DATA 41,4,49 ,4,53,4,33,4,49,4,61,4,-1,-1
```

```
REM Key C Minorish!: Set Env%=4 or Similar
620 DATA 5,16,17,16,13,16,9,16,-1,-1
```
