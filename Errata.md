# Errata in the PDF of Making Music on the BBC Micro by Waugh
## URL: [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml)
## Page numbers are shown as PDF (BOOK)

There is a difference of twelve pages between the PDF and the page numbering in the book

### Page 10 - The Operating system
*fisted* should be *listed*

Other examples of *fisted*
page 62, 124, 196,212,224, 252, 254
fisted should be listed

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

Other xamples of fine should be line:
7
26 (14)
*five fines* should be *five lines*
and there are four more occurrences on that page.
27(15)
two occurrences
35 (23)
one occurrence
48 (36)
three occurrences
54 (42)
One occurance
56 (44)
x2
68 (56)
x4
79 (67)
One occurance
82 (70)
One occurance
85 (73)
One occurance
89 (77)
One occurance
90 (78)
x2
92 (80)
x4
97 (85)
x3
Page 123(111)
One occurance
130 (118)
One occurance
131 (119)
One occurance
134 (122)
One occurance
138 (126)
x1 lines
139 (127)
One occurance
140 (128)
x2
141 (129)
One occurance
142 (130)
One occurance
148 (136)
x2
149 (137)
One occurance
154 (142)
One occurance
155 (143)
One occurance
156 (144)
One occurance
157 (145)
One occurance
160 (148)
x3
168 (156)
One occurance
176 (164)
One occurance
184 (172)
One occurance
185 (173)
One occurance
186 (174)
One occurance
196 (184)
One occurance
198 (186)
One occurance
199 (187)
One occurance
205 (193)
One occurance
206 (194)
x2
207 (195)
One occurance
208 (196)
One occurance
213 (201)
One occurance
215 (203)
One occurance
217 (205)
One occurance
219 (207)
x2
222 (210)
One occurance
232 (220)
One occurance
233 (221)
One occurance
234 (222)
x5
241 (229)
One occurance
242 (230)
x2
243 (231)
x3
247 (235)
x3
254 (242)
x2

### Page 40 (28)

If you cut between the keyboard and the stave, you can position the keyboard, which_ covers the range of the sound chip, beneath the stave in such a Chapter 3 The BBC Micro and Sound and Music chip you want to use.


### Page 41 (29)

*}OK* should be *10kOhm*

### Page 49 (37)
It seems to make more sense to call the lowest octave, and one Chapter 3 The BBC Micro and Sound and Music writing Cl, D1, etc to C0, D0 and it still allows a pitch value of 1 which is B0.

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
To affect the pitch colour (p), it should be
```
2310 IF Input=39 p=1
```

### Page 81 ((69)
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

To be able to change the Pitch variable
Finally, to fix the `ON x GOTO` range error and actually be able to change the value of `Pitch`, change line 2420 to add a seventh line option
```
2420 ON (Input-32) GOTO 2430, 2440, 2450,2460,2470,2480,2485
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
Page 118 (106)
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
