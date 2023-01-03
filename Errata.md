# Errata in the PDF of Making Music on the BBC Micro by Waugh
## URL: [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml)
## Page numbers are shown as PDF (BOOK)

There is a difference of twelve pages between the PDF and the page numbering in the book

### Page 10 - The Operating system
*fisted* should be *listed*

Other examples of *fisted* can be found on pages 62, 124, 196, 212, 224, 252, and 254

### Page 14 (2)

Spelling of amplitude
```
110 INPUT"Amplitute (50-400)",Amp
```
should be
```
110 INPUT"Amplitude (50-400)",Amp
```
### Page 14 (2)
Missing semicolon (`;`) and a comma (`,`) used instead. Line 
```
60 VDU28,0,4,39,0
```
should be
```
70 VDU24,0;0;1279;850
```
### Page 16 (4)
*everyday fife* should be *life*

### Page 7
*fine* should be *line*

Other examples of where *fine* should be *line*, can be found on pages:

- 26 (14)
*five fines* should be *five lines*
and there are four more occurrences on that page.
 - 27(15)
Two occurrences
 - 35 (23)
One occurrence
 - 48 (36)
three occurrences
 - 54 (42)
One occurrence
 - 56 (44)
Two occurrences
 - 68 (56)
Four occurrences
 - 79 (67)
One occurrence
 - 82 (70)
One occurrence
 - 85 (73)
One occurrence
 - 89 (77)
One occurrence
 - 90 (78)
Two occurrences
 - 92 (80)
Four occurrences
 - 97 (85)
Three occurrences
 - 123 (111)
One occurrence
 - 130 (118)
One occurance
 - 131 (119)
One occurrence
 - 134 (122)
One occurrence
 - 138 (126)
x1 lines
 - 139 (127)
One occurrence
 - 140 (128)
Two occurrences
 - 141 (129)
One occurrence
 - 142 (130)
One occurrence
 - 148 (136)
Two occurrences
 - 149 (137)
One occurrence
 - 154 (142)
One occurrence
 - 155 (143)
One occurrence
 - 156 (144)
One occurrence
 - 157 (145)
One occurrence
 - 160 (148)
Three occurrences
 - 168 (156)
One occurrence
 - 176 (164)
One occurrence
 - 184 (172)
One occurrence
 - 185 (173)
One occurrence
 - 186 (174)
One occurrence
 - 196 (184)
One occurrence
 - 198 (186)
One occurrence
 - 199 (187)
One occurrence
 - 205 (193)
One occurrence
 - 206 (194)
Two occurrences
 - 207 (195)
One occurrence
 - 208 (196)
One occurrence
 - 213 (201)
One occurrence
 - 215 (203)
One occurrence
 - 217 (205)
One occurrence
 - 219 (207)
Two occurrences
 - 222 (210)
One occurrence
 - 232 (220)
One occurrence
 - 233 (221)
One occurrence
 - 234 (222)
Five occurrences
 - 241 (229)
One occurrence
 - 242 (230)
Two occurrences
 - 243 (231)
Three occurrences
 - 247 (235)
Three occurrences
 - 254 (242)
Two occurrences

### Page 40 (28)

Random introduction of text: *Chapter 3 The BBC Micro and Sound and Music*

*If you cut between the keyboard and the stave, you can position the keyboard, which_ covers the range of the sound chip, beneath the stave in such a Chapter 3 The BBC Micro and Sound and Music chip you want to use.*


### Page 41 (29)

*}OK* should be *10kOhm*

### Page 49 (37)

Random introduction of text: *Chapter 3 The BBC Micro and Sound and Music*

*It seems to make more sense to call the lowest octave, and one Chapter 3 The BBC Micro and Sound and Music writing Cl, D1, etc to C0, D0 and it still allows a pitch value of 1 which is B0.*

### Page 49 (37) 

Missing sound channel number,  "1" 
```
40 SOUND,-15,0,8
```
should be
```
40 SOUND 1, -15,0,8
```

### Page 65 (53)
*backwards recording of ar} instrument* should be *...an instrument*

### Page 68 (56)
fine -> line

### Page 75 (62)
*along the 3£ axis*

*3£* should be *x*

### Page 76 (64)
*it only needs to be reduced by 26 to reach the ALE*

*ALE* should be *ALD*

### Page 79 (67)
*The use of PH and PI2*:

*PH* should be *PI1*

### Page 79 (67) (only in OCR scan PDF)
The listing shows in line 29
```
29 REM Altered Lines=150,810
```
However, whilst 810 is indeed altered, the new version of line 150 is not shown. This line should be:
```
150 IF Input$="C" PROCAxis:PROCAxis2
```
### Page 81 (69)
Note that the listing 5.2 is truncated and ends at line 2350. 

There are three PROCs missing:
- `PROCAlterPit` is missing
- `PROCOvertime` is missing
- `PROCFinalTimeCheck` is missing

### Page 81 (69) (only in OCR scan PDF)
Also, line 2310 is incorrect as its action is a repeat of 2300.  
```
2310 IF Input=39 pn3=1
```
To affect the pitch colour (`p`), it should be
```
2310 IF Input=39 p=1
```

### Page 81 (69)
The missing lines are
```
2360
2370 DEF PROCAlterPit
2380 INPUT NewVal$:PRINTTAB(0,2)SPC(6)
2390 IF NewVal$="" PROCReset: PROCPrintEnv:ENDPROC
2400 NewVal=EVAL(NewVal$)
2410 PRINTTAB(30,0)SPC(20)
2420 ON (Input-32) GOTO 2430, 2440, 2450,2460,2470,2480
2430 PI1=NewVal:ENDPROC
2440 PI2=NewVal:ENDPROC
2450 PI3=NewVal:ENDPROC
2460 PN1=NewVal:ENDPROC
2470 PN2=NewVal:ENDPROC
2480 PN3=NewVal:ENDPROC
2490 ENDPROC
2500
2510 DEF PROCPitchEnv
2520 Time=0
2530 YScale=3
2540 MOVE 0,Pitch*YScale
2550 REPEAT
2560 Pitch=Pit1
2570 PROCP(PI1, PN1)
2580 PROCP(PI2, PN2)
2590 PROCP(PI3, PN3)
2600 UNTIL FTime OR T1>127
2610 ENDPROC
2620 
2630 DEF PROCFinalTimeCheck
2640 FTime=FALSE
2650 IF Time>Duration*5 Time=Duration*5:FTime=TRUE
2660 ENDPROC
2670 
```

### Page 81 (69)

To be able to change the Pitch variable.

Finally, to fix the `ON x GOTO` range error and actually be able to change the value of `Pitch`, change line 2420 to add a seventh line option:
```
2420 ON (Input-32) GOTO 2430,2440,2450,2460,2470,2480,2485
```
and then add a new line to change the Pitch variable

```
2485 Pitch=NewVal:ENDPROC
```
actually you have to update the helper/"assistant", `Pit1` instead:

```
2485 Pit1=NewVal:ENDPROC
```

### Page 86 (74) 
tastee 5.6

### Page 89 (77) 
£0

### Page 90 (78)
£0

### Page 103 (91)
```
110 SOUND2,Amp,Pitch+1,Dur
```
should be
```
110 SOUND2,Amp,Note+1,Dur
```
### Page 118 (106)

Listing 7.2, if "S" is the first key press then there is a "No such variable" error. This is because some of the variables are not declared (`T`, `PI1`, `PI2`, `PI3`, `PN1`, `PN2`, `PN3`).

This is because PROCEnvelope is not called (which is where the undefined variables (`T`, `PI1`, `PI2`, `PI3`, `PN1`, `PN2`, `PN3`) are set, prior to `PROCPrintEnv`), if "S" is the first key press causing `PROCSoundNoise` to be called, via `PROCAction`, in the main loop. However, `PROCEnvelope` calls the `PROCPlay` start after setting.

A fix would be to separate `PROCEnvelope` into two calls `PROCSetEnvelope` and `PROCPlay`, where `PROCSetEnvelope` sets the undefined variables. Then `PROCSetEnvelope` can also be called as part of `PROCSetUp`, either just after or just before `PROCSetSN`.

### Page 128 (116)
`ENV` should be `Env`
```
380 IF ADVAL(-5)>0 READ Env,Pit,Dur: SOUND0,ENV,Pit,Dur*Tempo:IF Env=0 RESTORE Rhythm
```
should be 
```
380 IF ADVAL(-5)>0 READ Env,Pit,Dur: SOUND0,Env,Pit,Dur*Tempo:IF Env=0 RESTORE Rhythm
```

### Page 226 (214)
```
650 DIM OffSetArray(12,12)
```
should be
```
650 DIM OffSetArray%(12,12)
```

### Page 229 (217)
```
1270 PRINT'CHR$131"How many ";Ac$;" has it? ("CHR$129"1-6"CHR$131")?"CHR$129;:POCInput(48,55)
```
should be 
```
1270 PRINT'CHR$131"How many ";Ac$;" has it? ("CHR$129"1-6"CHR$131")?"CHR$129;:PROCInput(48,55)
```
### Page 231 (219)
```
2190 MinKey$=MinKeyArray(No)+" Minor"
```
should be 
```
2190 MinKey$=MinKeyArray$(No)+" Minor"
```

## Page 239(227)/Page241(229)
Chapter 13 but listing is 14.1

### Page 243(231)
Likewise Chapter 13 but listing is 14.2
