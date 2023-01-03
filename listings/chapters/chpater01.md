# Making music on the BBC micro

## Chapter 1

### Looking at sound waves
```
10 REM PROGRAM 1.1
20 REM Sine Wave Plotter
30
40 MODE 4
50 REM Define Windows
60 VDU28,0,4,39,0
70 VDU24,0,0;1279;850; 
80
90 REPEAT
100 INPUT"Frequency (1-10)",Freq
110 INPUT"Amplitude (50-400)",Amp 
120 PROCSine
130 PRINT"Press SPACE to enter another wave"'"'C' to clear screen, 'F' to finish"
140 REPEAT
150 Key=GET
160 UNTIL Key=32 OR Key=67 OR Key=70
170 IF Key=67 THEN CLG
180 UNTIL Key=70
190 MODE7
200 END
210
220 DEF PROCSine
230 VDU29,0;450;
240 MOVE0,0
250 FOR Time=0 TO 1279 STEP 10
260 DRAWTime,Amp*SIN(RAD(Freq*Time))
270 NEXT Time
280 ENDPROC
```
#### Adding a harmonic

```
5 REM With harmonic in line 260
10 REM PROGRAM 1.1
20 REM Sine Wave Plotter
30
40 MODE 4
50 REM Define Windows
60 VDU28,0,4,39,0
70 VDU24,0,0;1279;850; 
80
90 REPEAT
100 INPUT"Frequency (1-10)",Freq
110 INPUT"Amplitude (50-400)",Amp 
120 PROCSine
130 PRINT"Press SPACE to enter another wave"'"'C' to clear screen, 'F' to finish"
140 REPEAT
150 Key=GET
160 UNTIL Key=32 OR Key=67 OR Key=70
170 IF Key=67 THEN CLG
180 UNTIL Key=70
190 MODE7
200 END
210
220 DEF PROCSine
230 VDU29,0;450;
240 MOVE0,0
250 FOR Time=0 TO 1279 STEP 10
260 DRAWTime,Amp *SIN(RAD(Freq*Time))+Amp*SIN (RAD(Freq *2*Time))
270 NEXT Time
280 ENDPROC
```
### The sound of the BBC micro
```
10 FOR Pitch=1 TO 253 STEP 4
20 SOUND1,-15,Pitch,10
30 NEXT Pitch
```
### Pitch
```
10 FOR Pitch=53 TO 149
20 SOUND1,-15,Pitch,1
30 NEXT Pitch
```

```
10 FOR Pitch=53 TO 149 STEP 4
20 SOUND1,-15,Pitch,1
30 NEXT Pitch
```

```
10 FOR Pitch=101 TO 149
20 SOUND1, -15,Pitch,10
30 NEXT Pitch
```

```
10 FOR Pitch=1 TO 255
20 SOUND1, -15,Pitch,10
30 NEXT Pitch
```
### Volume
```
40 FOR Volume =-15 TO -1
50 SOUND1, Volume,53,1
60 NEXT Volume
```

```
10 FOR Volume=1 TO -15 STEP -1
20 SOUND1,Volume,53,1
30 NEXT Volume
```

```
10 ENVELOPE1,1,0,0,0,0,0,0,127,-1,-1,-1,126,1
20 FOR Pitch=53 TO 101
30 SOUND1,1,Pitch,10
40 NEXT Pitch
```

```
10 ENVELOPE1,1,0,0,0,0,0,0,127,-1,-1,-1,126,1
20 FOR Pitch=149 TO 245 STEP 5
30 SOUND1,1,Pitch,10
40 NEXT Pitch
```

```
10 ENVELOPE1,1,0,0,0,0,0,0,3,-100,0,0,126,0
20 FOR Pitch=53 TO 101
30 SOUND1,1,Pitch,10
40 NEXT Pitch
```
### Duration
n/a
### Motility
```
10 REM PROGRAM 1.2
20 REM Motility Tester
30
40 ON ERROR GOTO 290
50
60 ENVELOPE1,11,16,4,8,2,1,1,100,0,0,-100,100,100
70 REM Turn off Auto Repeat 80 *FX11,0
90
100 REPEAT
110 Score=0
120 CLS
130 PRINTTAB(4,6)"Tap the RETURN key repeatedly"'" d with"'"as quickly as possible an the minimum of movement."
140 Begin=GET
150 TIME=0
160
170 REPEAT
180 Tap=INKEY(0):IF Tap=13 Score=Score+1
190 UNTIL TIME>=500
200
210 PRINTTAB(16,10)"STOP"
220 SOUND1,1,100,20
230 PRINTTAB(6,12)"Your MOTILITY rating is"'Score/5;" taps per second"
240 PRINTTAB(8,15)"Another try (Y/N)?"
250 REPEAT:Key=GET AND &DF:UNTIL Key=89 OR Key=78
260 UNTIL Key=78
270
280 REM Turn On Auto Repeat 290 *FX12,0
300 END
```
### Timbre

#### Sawtooth wave
```
10 REM PROGRAM 1.1
20 REM Sine Wave Plotter
30
40 MODE 4
50 REM Define Windows
60 VDU28,0,4,39,0
70 VDU24,0,0;1279;850; 
80
90 REPEAT
100 INPUT"Frequency (1-10)",Freq
110 INPUT"Amplitute (50-400)",Amp 
120 PROCSine
130 PRINT"Press SPACE to enter another wave"'"'C' to clear screen, 'F' to finish"
140 REPEAT
150 Key=GET
160 UNTIL Key=32 OR Key=67 OR Key=70
170 IF Key=67 THEN CLG
180 UNTIL Key=70
190 MODE7
200 END
210
220 DEF PROCSine
230 VDU29,0;450;
240 MOVE0,0
250 FOR Time=0 TO 1279 STEP 10
260 DRAWTime,Amp*SIN(RAD(Freq*Time))+Amp*1/2*SIN (RAD(Freq*2*Time))+Amp*1/3*SIN(RAD(Freq*3*Time))+ Amp*1/4*SIN(RAD(Freq*4*Time))+Amp*1/5*SIN (RAD(Freq*5*Time))
270 NEXT Time
280 ENDPROC
```
### Square wave
```
10 REM PROGRAM 1.1
20 REM Sine Wave Plotter
30
40 MODE 4
50 REM Define Windows
60 VDU28,0,4,39,0
70 VDU24,0,0;1279;850; 
80
90 REPEAT
100 INPUT"Frequency (1-10)",Freq
110 INPUT"Amplitute (50-400)",Amp 
120 PROCSine
130 PRINT"Press SPACE to enter another wave"'"'C' to clear screen, 'F' to finish"
140 REPEAT
150 Key=GET
160 UNTIL Key=32 OR Key=67 OR Key=70
170 IF Key=67 THEN CLG
180 UNTIL Key=70
190 MODE7
200 END
210
220 DEF PROCSine
230 VDU29,0;450;
240 MOVE0,0
250 FOR Time=0 TO 1279 STEP 10
260 DRAWTime,Amp*SIN(RAD(Freq*Time))+Amp*1/3*SIN (RAD(Freq*3*Time))+Amp*1/5*SIN(RAD(Freq*5*Time))+ Amp*1/7*SIN(RAD(Freq*7*Time))
270 NEXT Time
280 ENDPROC
```
