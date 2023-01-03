# Making music on the BBC micro

## Chapter 2

### The pitch of a note
```
10 FOR Scale=1 TO 8
20 READ Pitch
30 SOUND1 ,-15,Pitch,10
40 NEXT Scale
50 END
60 DATA 53,61,69,73,81,89,97 ,101
```
### Scales
```
10 FOR Pitch=5 TO 245 STEP 48
20 SOUND1,-15,Pitch,10
30 NEXT Pitch
```

```
10 Note=53
20 FOR Pitch=1 TO 8
30 READ Interval
40 Note=Note+Interval
50 SOUND1,- 15,Note,10
60 NEXT Pitch
70 END
80 DATA 0,8,8,4,8,8,8,4
```
### Harmony and chords
```
10 REM PROGRAM 2.1
20 REM Chord Sound Demonstration
30
40 CLS
50 PRINT'''
60
70 FOR Chord=1 TO 4
80 READ Chord$,Notes$,Pitch1,Pitch2 
90 PRINT"C ";Chord$;"=C + "Notes$'
100 SOUND&201,-12,53,60
110 SOUND&202,-12,Pitch1,60
120 SOUND&203,-12,Pitch2,60
130 PROCDelay(300)
140 NEXT Chord
150
160 REM Chords with 4 Notes
170 FOR Arp=1 TO 5
180 READ Chord$,Notes$
190 PRINT"C ";Chord$;" (Arpeggio)=C +"Notes$'
200 FOR Note=1 TO 17
210 READ Pitch
220 SOUND1,-15,Pitch,3
230 NEXT Note
240 PROCDelay(200)
250 NEXT Arp
260 END
270
280 DEF PROCDelay(Time)
290 TIME=0:REPEAT UNTIL TIME>Time
300 ENDPROC
310
320 DATA Major,E + G,69,81
330 DATA Minor,Eb + G,65,81
340 DATA Augmented,E + G#,69,85
350 DATA Suspended 4th,F + G,73,81
360 DATA Diminished,Eb + Gb + A,53,65,77,89,101,113,125,137,149,137,125,113,10 1,89,77,65,53
370 DATA 7th,E + G + Bb,53,69,81,93,10 1,117,129,141,149,141,129,117,101,93,81, 69,53
380 DATA Major 7th,E + G + B,53,69,81, 97,101,117,129,145,149,145,129,117,101,9 7,81,69,53
390 DATA Major Sixth,E + G + A,53,69,8 1,89,101,117,129,137,149,137,129,117,101 ,89,81,69,53
400 DATA Minor Sixth,Eb + G + A,53,65, 81,89,101,113,129,137,149,137,129,113,10 1,89,81,65,53
```
