1 Q=0:GOSUB 5000
5 GOSUB 1000
10 CLS
15 CLEAR 500
20 J=0:X=2:D=0:S=0:DIM A$(50)
30 CLS:J=0:D=0:S=0:R=2:TT=0:TM=0
40 PRINT "PRIME NUMBERS"
50 PRINT "VALUE TO CALCULATE TO";
60 INPUT P
65 G=0
68 TIMER=0

70 FOR N=2 TO P
95 IF N=2 THEN 120
80 PRIME=1
90 FOR I=2 TO INT(SQR(N)+1)
100 IF N/I=INT(N/I)THENPRIME=0
110 NEXT I
120 IF PRIME=1 THEN G=G+1:PRINT G"-";:PRINT"PRIME"N;:T=TIMER/60:PRINT USING "##.##";T;:PRINT " SECS":TIMER=0:TT=TT+T:IF T>D THEN D=T:S=N:R=N:

130 NEXT N
140 SOUND 1,5
145 FOR DD =1 TO 500:NEXT DD
150 CLS
160 PRINT " finished calculating"
165 FOR LL = 0 TO 31
170 PRINT @LL,"*":NEXT LL
230 PRINT G"PRIME NUMBERS UP TO";
250 PRINT P
260 PRINT " LONGEST PRIME TO CALC"
270 PRINT " PRIME"S;
280 PRINT USING "###.##";D;
290 PRINT " SECS"
295 PRINT " TOTAL TIME ";
300 PRINT USING "####.##";TT;
305 PRINT " SECS"
310 FOR F = 1 TO 4
320 IF F=1 THEN A$(F)=STR$(P) 
330 IF F=2 THEN A$(F)=STR$(S) 
340 IF F=3 THEN A$(F)=STR$(D) 
345 IF F=4 THEN A$(F)=STR$(TT)
350 NEXT F
355 FOR LL = 224 TO 255:PRINT @LL,"*";:NEXT LL
360 PRINT " ":PRINT "WOULD YOU LIKE TO SAVE Y/N": INPUT L$: IF L$="Y" THEN 2000
370 GOSUB 1000
1000 CLS
1010 PRINT "1-START"
1030 PRINT "2-REVIEW LAST 10"
1035 PRINT "3-EXIT"
1038 PRINT "9-DELETE DISK FILES"
1050 INPUT L
1060 IF L = 1 THEN 30
1070 IF L = 3 THEN END
1090 IF L = 2 THEN 3000
1095 IF L = 9 THEN PRINT "ARE YOUR SURE: Y/N";:INPUT L$: IF L$="Y" THEN KILL "PRIME/DAT": GOTO 1000
1100 GOTO 1000
1110 RETURN
2000 IF G < 1 THEN PRINT "NO DATA TO SAVE, PRESS ENTER TO CONT": INPUT L: GOTO 1000
2005 OPEN "D",#1,"PRIME.DAT",32
2010 FIELD #1,6 AS P$,6 AS N$,10 AS T$,10 AS TT$ 
2020 LSET P$=A$(1)
2040 LSET N$=A$(2)
2060 LSET T$=A$(3)
2065 LSET TT$=A$(4)
2070 PUT #1,1+Q
2075 Q=Q+1
2080 CLOSE #1
2090 GOTO 1000
3000 OPEN "D",#1,"PRIME.DAT",32
3005 CLS:IF LOF(1) < 1 THEN PRINT "NO DATA TO SHOW":CLOSE #1: GOTO 1000
3006 PRINT " # limit  prime#   time   all"
3010 FIELD #1,6 AS P$, 6 AS N$, 10 AS T$, 10 AS TT$
3020 FOR E=1 TO LOF(1)
3030 GET #1,E 
3040 PRINT E;P$;" "N$;"  ";
3045 PRINT USING "##.##";VAL(T$);
3046 IF VAL(TT$) >999 THEN 3048
3047 PRINT USING " ###.##";VAL(TT$):GOTO 3050
3048 PRINT USING "####.##";VAL(TT$):GOTO 3050
3050 NEXT E 
3060 CLOSE #1
3070 PRINT " ":PRINT "PRESS ENTER TO CONTINUE";
3080 INPUT L 
3090 GOTO 1000
5000 OPEN "D",#1,"PRIME.DAT",32
5005 IF LOF(1) <1 THEN CLOSE #1:RETURN
5010 Q= LOF(1)
5055 IF Q > 20 THEN Q=20
5060 CLOSE #1
5070 RETURN
10000 END
 