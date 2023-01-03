# Making music on the BBC micro

## Chapter 3 

### Pitch
```
10 REM Hawaiian Guitar
20 ENVELOPE1,132,0,0,0,0,0,0,126,-10,0,-4,126,100 
30 ENVELOPE2,132,-8,0,1,1,0,8,126,-10,0,-4,126,100 
40 FOR Note=1 TO 8
50 READ Env,Pitch,Dur
60 SOUND 1,Env,Pitch,Dur
70 NEXT Note
80 END
90 DATA1,53 ,5,1,41,10,1,53,10,2,73,15
100 DATA1,41,5,1,33,10, 1,53,10,2,69,20
```

### Note to Number Conversion Program
```
10 REM PROGRAM 3.1
20 REM Basic Program to Convert
30 REM Note Names & Octave Numbers 40 REM Into PITCH values
50
60 PROCSetup
70 FOR Count=1 TO 16
80 PROCChooseNote
90 PROCPlayNote
100 NEXT Count
110 END
120
130 DEF PROCSetup
140 Scale$="  C  C# D  D# E  F  F# G  G# A  A# B" 
150
160 REM Key Sets Value
170 REM Key=1 Will Play as You Would
220 Key=1
230
240 DIM NotesToChooseFrom$(15)
250 FOR S%=1 TO 15
260 READ Note$
270 NotesToChooseFrom$(S%)=Note$
280 NEXT S%
290 ENDPROC
300
310 DATAG1,A0,B0,C2,D2,E2,F#2,G2,A2,B2,C3,D3,E3,F#3,G3
320
330 DEF PROCChooseNote
340 Note=RND(15)
350 Note$=NotesToChooseFrom$(Note)
360 ENDPROC
370
380 DEF PROCPlayNote
390 PROCAnalyseNote
400 PROCCalculatePitch
410 PRINT Note$,Pitch,Octave
420 SOUND1,-15,Pitch,5:SOUND1,0,0,0
430 ENDPROC
440
450 DEF PROCAnalyseNote
460 IF LEN(Note$)<2 OR LEN(Note$)>3 THEN PRINT"ERROR IN DATA ";Note$:STOP
470 IF LEN(Note$)=2 THEN NoteName$=LEFT$(Note$,1) ELSE NoteName$=LEFT$(Note$,2)
480 PositionInScale=INSTR(Scale$,NoteName$)/3
490 Octave=VAL(RIGHT$(Note$,1))
500 ENDPROC
510
520 DEF PROCCalculatePitch
530 Pitch=Key+PositionInScale*4+(Octave-1)*48
540 IF Pitch<0 OR Pitch>255 THEN PRINT"ERROR IN DATA ";Note$:STOP
550 ENDPROC
```
#### The lowest A#
```
10 FOR Pitch=13 TO 1 STEP -4
20 SOUND1,-15,Pitch,8
30 NEXT Pitch
40 SOUND1,-15,0,8
```

