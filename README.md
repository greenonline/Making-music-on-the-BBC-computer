# Making-music-on-the-BBC-computer
BASIC listings from the book, *Making music on the BBC computer* by Ian Waugh

There is a thread about this book on StarDot.org.uk, [Making Music on the BBC Computer by Ian Waugh](https://stardot.org.uk/forums/viewtopic.php?t=4923).

## Links to the book

The book is available online:

- [OCR scanned PDF](http://8bs.com/othrdnld/manuals/publication/Making_Music_on_the_BBC_Computer_Waugh.zip) on [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml)
- A bitmap scanned PDF on [Archive.org](https://archive.org/details/makingmusiconbbc0000waug) - free account required for a digital "loan"

The book contains a lot of errors and typos in both the text and the code, especially the [OCR scanned PDF](http://8bs.com/othrdnld/manuals/publication/Making_Music_on_the_BBC_Computer_Waugh.zip) on [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml) which has additional OCR induced errors. 

**Note**: Listing 5.2 is incomplete due to a listing truncation in the book (see **Errors in listing 5.2** below).

The listings in this repository have, for the most part, been checked, run and corrected. 

## Disk images

Disk images of the code listings are available:
- A DSD is contained within [making_music.zip](https://stardot.org.uk/forums/download/file.php?id=3321&sid=1cd77dd3853fad707f262f788a0b93b4), from [this post](https://stardot.org.uk/forums/viewtopic.php?p=44849&sid=1cd77dd3853fad707f262f788a0b93b4#p44849) on the stardot.org.uk forum.
  - ***NOTE**: this DSD contains errors in listing 5.2 carried over from the listing truncation and omissions in the book, as well as other additional errors (i.e. line 2330) introduced by the manual code entry*.
  
- Another couple of SSD images are available within the [ZIP file](http://8bs.com/othrdnld/manuals/publication/Making_Music_on_the_BBC_Computer_Waugh.zip) containing the OCR scan of the book on [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml). The SSD, `SIDE0.SSD` has a complete listing 5.2, although this listing still contains some errors (see **Errors in listing 5.2** below):
  - Line 2310 
  - The `ON x GOTO` error, requiring the patch for lines 2420 and 2485



## Errors in listing 5.2

Listing 5.2, as it is shown in the book, has a number of errors:

- Omission of an updated version of line 150 (only in the OCR scan)
- Typo in line 2310 (only in the OCR scan)
- Truncated listing, which ends prematurely at line 2350, causing an omission of lines 2360-2670

### Line 150

The missing line 150 should be 

```none
150 IF Input$="C" PROCAxis:PROCAxis2
```

Note that this omission is only in the OCR scan of the 1983 publication of the book. The 1984 publication shows this line correctly. Both of the disk images (from 8bs.com and stardot.org.uk) are correct.

### Line 2310

The typo is line 2310 is fixed with the following line

```none
2310 IF Input=39 p=1
```

Note that this omission is *only* in the OCR scan of the 1983 publication of the book and the SSD disk image that accompanies it, on 8bs.com. The 1984 publication, on archive.org, shows this line correctly. The DSD image, on stardot.org.uk, also has this line correct.

### Line 2330

Line 2330 should be 

```none
2330 PROCAlterPit
```

and not 

```none
2330 PROCAlter
```

Note that *only* the DSD image from stardot.org.uk has this error which appears to have arisen from an attempt to make the truncated listing work. Both the OCR scan (as well as the SSD) on 8bs.com and the bitmap scan on archive.org are correct. 

### The missing lines 2360-2670

The missing lines can be found on `SIDE0.SSD` which is bundled with the OCR scanned PDF, in the ZIP file on [8bs.com - publications](http://8bs.com/othrdnld/manuals/publications.shtml).

The missing lines are as follows:

```none
2360
2370 DEF PROCAlterPit
2380 INPUT NewVal$:PRINTTAB(0,2)SPC(6)
2390 IF NewVal$=“” PROCReset: PROCPrintEnv:ENDPROC
2400 NewVal=EVAL(NewVal$)
2410 PRINTTAB(30,0)SPC(20)
2420 ON (Input-32) GOTO 2430,2440,2450,2460,2470,2480
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

Note that the omission of these lines is in *both* PDFs (the OCR scan and the bitmap scan) of the book. The DSD image from stardot.org.uk is *also* missing these lines.

### Errors in `ON x GOTO`

These previously missing lines 2360-2670 also contain typos:

- Omission of the seventh `ON x GOTO` option on line 2420
- Missing line pointed to, by the seventh option of the `ON x GOTO` on line 2420

These omissions can be fixed by the following two lines:

```none
2420 ON (Input-32) GOTO 2430,2440,2450,2460,2470,2480,2485
2485 Pitch=NewVal:ENDPROC
```

### The correct listing 5.2

This is the full listing of 5.2 with the missing lines included and the other four patched lines mentioned above. It also has the `P.` substitution of `PRINT` in line 810

```none
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
2370 DEF PROCAlterPit
2380 INPUT NewVal$:PRINTTAB(0,2)SPC(6)
2390 IF NewVal$=“” PROCReset: PROCPrintEnv:ENDPROC
2400 NewVal=EVAL(NewVal$)
2410 PRINTTAB(30,0)SPC(20)
2420 ON (Input-32) GOTO 2430,2440,2450,2460,2470,2480,2485
2430 PI1=NewVal:ENDPROC
2440 PI2=NewVal:ENDPROC
2450 PI3=NewVal:ENDPROC
2460 PN1=NewVal:ENDPROC
2470 PN2=NewVal:ENDPROC
2480 PN3=NewVal:ENDPROC
2485 Pit1=NewVal:ENDPROC
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
### Further reading

See [Making music on the BBC computer – Errata](https://gr33nonline.wordpress.com/2022/12/25/making-music-on-the-bbc-computer-errata/) for further details.

