5 REM//INCOME VS EXPENSE BASIC PROGRAM FOR THE COCO PROGRAMED BY TAZROG//
10 REM//REQUIES COCO SDC COPYRIGHT 2024//
15 REM//V.05.1//
20 CLS:FORA=0TO8:READA$:POKE1024+A,VAL("&H"+A$):NEXTA:EXEC1024:DATAC6,1,96,BC,1F,2,7E,96,A3
25 CLEAR 500:Q=0:GT=0:DT=0:IT=0:QQ=0
30 GOTO 1820
35 GOSUB 720:GOSUB 760:GOSUB 1470
40 CLS:T=150
45 PRINT@7,"INCOME VS EXPENSE":IF DA$=""THEN GOTO 55
50 PRINT@234,"DATE ";DA$:PRINT@262,"PRESS [C] TO CHANGE";
55 A$= INKEY$:IF A$="C" THEN GOTO 75
60 T=T-1:IF T<1 THEN 125
65 IF A$=" "THEN 125
70 PRINT@293,"PRESS SPACE TO START":PRINT@360,"AUTO START IN";INT(T/30):GOTO 55
75 CLS:PRINT@7,"INCOME VS EXPENSE":PRINT@233,"";:PRINT "MONTH =##";MO$;:INPUT M$:IF M$=""THEN M$=MO$
80 IF M$="1"THEN M$ ="01"ELSE IF M$="2"THEN M$="02"ELSE IF M$="3"THEN M$ ="03"ELSE IF M$="6"THEN M$="06"
85 IF M$="7"THEN M$ ="07"ELSE IF M$="8"THEN M$="08"ELSE IF M$="9"THEN M$ = "09" 
90 PRINT@265,"DAY =##";DL$;:INPUT D$:IF D$=""THEN D$=DL$:GOTO 110
95 IF D$="1"THEN D$="01"ELSE IF D$="2"THEN D$="02"ELSE IF D$="3"THEN D$="03"ELSE IF D$="6"THEN D$="06"
100 IF D$="7"THEN D$="07"ELSE IF D$="8"THEN D$="08"ELSE IF D$="9"THEN D$="09" 
105 IF VAL(D$)>31 THEN CLS:PRINT "INVALID DAY, CHOOSE AGAIN":FOR T=T TO 100:NEXT T:CLS:GOTO 90
110 DA$=M$+"/"+D$:CLS:PRINT@10,"DATE ";:PRINT DA$:PRINT"":T=0:INPUT"CORRECT?, [C] TO CHANGE";A$
115 IF A$="C"THEN GOTO 75
120 GOSUB 1435
125 CLS:PRINT@268,"LOADING":GOTO 2475
130 LO=40:CLS:PRINT"       --> DATE ";:PRINT DA$;:PRINT" <--":GT=IT-DT:A=0:A$=""
135 PRINT@LO-4,"***INCOME VS EXPENSE***";:LO=LO+32:PRINT@LO,"1- ENTER INCOME";:LO=LO+32:PRINT@LO,"2- ENTER EXPENSE";:LO=LO+32:PRINT@LO,"3- LIST INCOME";:LO=LO+32
140 PRINT@LO,"4- LIST EXPENSE";:LO=LO+32:PRINT@LO,"5- MONTHLY IVE";:LO=LO+32:PRINT@LO,"6- IVE GRAPH";:LO=LO+32:PRINT@LO,"7- CAT. INCOME";:LO=LO+32:PRINT@LO,"8- CAT. EXPENSE";:LO=LO+32
145 PRINT@LO,"9- SETTINGS":LO=LO+32:PRINT@LO-8,STRING$(32,"-"):PRINT@32*12,"INCOME  >>>";:PRINT@19+32*12,"";:PRINT USING"$$###,###.##";IT
150 PRINT@32*13,"EXPENSE >>>";:PRINT@19+32*13,"";:PRINT USING"$$###,###.##";DT
155 IF GT>0 THEN PRINT@32*14,"+$FLOW  >>>";ELSE PRINT@32*14,"-$FLOW  >>>";
160 PRINT@19+32*14,"";:PRINT USING"$$###,###.##";GT
165 A$=INKEY$
170 IF A$="1"OR A$="I"THEN 235
175 IF A$="2"OR A$="E"THEN 295
180 IF A$="3"THEN 365
185 IF A$="4"THEN 545
190 IF A$="5"OR A$="M"THEN GOTO 805
195 IF A$="6"OR A$="G"THEN 2145
200 IF A$="7"THEN CLS:GOTO 2575
205 IF A$="8"THEN CLS:GOTO 2550
210 IF A$="S"OR A$="9"THEN 1185
215 IF A$="H"THEN GOSUB 1785
220 IF A$="Q"THEN EXP
225 IF A$="R"THEN 125
230 GOTO 165
235 CLS:PRINT@6,"INCOME TRANSACTION":PRINT@70,"ENTER AMOUNT";:INPUT AM 
240 IF AM=0 GOTO 125
245 GOSUB 1010 
250 AM$=STR$(AM):CLS:PRINT@6,"INCOME TRANSACTION":PRINT@165,"TRANSACTION ENTERED":PRINT@225,DA$;:PRINT" ";:PRINT CI$;:PRINT USING"$$##,###.##";AM
255 PRINT"":PRINT"      PRESS [C] TO CHANGE":PRINT"":PRINT"   PRESS [A] TO ADD ANOTHER":INPUT" PRESS ENTER FOR MAIN SCREEN";A$
260 IF A$="C"THEN 235
265 OPEN"D",#1,"IN.DAT",30:FIELD#1,10 AS DD$,10 AS TT$,10 AS CA$
270 IF A$="Q"THEN END
275 LSET DD$=DA$:LSET TT$=CI$:LSET CA$=AM$:PUT#1,1+Q:Q=Q+1:CLOSE#1
280 IT=IT+AM:GT=GT+IT
285 IF A$="A"THEN 235
290 GOTO 125
295 CLS:PRINT@6,"EXPENSE TRANSACTION":PRINT@70,"ENTER AMOUNT";:INPUT IM 
300 IF IM = 0 GOTO 125
305 GOSUB 1010
310 IM$=STR$(IM)
315 CLS: PRINT@6,"EXPENSE TRANSACTION":PRINT@165, "TRANSACTION ENTERED":PRINT@225,DA$;:PRINT" ";:PRINT CI$;:PRINT USING "$$##,###.##";IM
320 PRINT"":PRINT"      PRESS [C] TO CHANGE":PRINT"":PRINT"   PRESS [A] TO ADD ANOTHER":INPUT " PRESS ENTER FOR MAIN SCREEN";A$
325 IF A$="C"THEN 295
330 OPEN"D",#1,"OUT.DAT",30:FIELD #1,10 AS PD$,10 AS PT$,10 AS PA$
335 LSET PD$=DA$:LSET PT$=CI$:LSET PA$=IM$
340 PUT#1,1+K:K=K+1:CLOSE#1
345 L=VAL(A$):
350 DT=DT-(IM*-1):GT=GT+DT
355 IF A$="A"THEN 295
360 GOTO 125
365 OPEN"D",#1,"IN.DAT",30:IT=0:K$="INCOME"
370 LO=31:CLS:INPUT "MONTH## OR FIND";JJ$:IF JJ$ =""THEN JJ$=LEFT$(DA$,2)
375 CLS:IF LOF(1) < 1 THEN PRINT"NO DATA TO SHOW":CLOSE #1: GOTO 125
380 PRINT"#    DATE   INCOME      AMOUNT"
385 FIELD#1,10 AS DD$,10 AS TT$,10 AS CA$
390 FOR E=1 TO LOF(1):GET#1,E:IF VAL(CA$)<1 THEN 440
395 IF LEN(JJ$)>2 THEN IF VAL(JJ$)=VAL(CA$) THEN GOTO 420 ELSE IF JJ$=LEFT$(TT$,LEN(JJ$)) THEN K$="?-"+JJ$:GOTO 420
400 IF JJ$="13"THEN GOTO 415
405 GG$=LEFT$(DD$,2):IF GG$=JJ$ THEN 420
410 GOTO 440
415 REM IF VAL(CA$)<.01 THEN GOTO 89
420 IT=IT + VAL(CA$):PRINT@LO,E;
425 PRINT@LO+6,DD$;:PRINT@LO+14,TT$;:PRINT@LO+21,"";:PRINT USING"$$##,###.##";VAL(CA$)
435 LO=LO+32:IF LO>448 THEN PRINT@480,"PRESS ENTER KEY";:INPUT L$:IF L$="" OR L$="X" THEN CLS:PRINT"#    DATE    EXPENSE     AMOUNT":LO=31:IF L$="X" THEN CLOSE#1:GOTO 125
440 NEXT E 
445 PRINT@448,K$:PRINT@462,"";:PRINT USING"total$$###,###.##";IT:CLOSE#1
450 PRINT@480,"[M]-MENU [R]-REDO ##-DELETE";:INPUT A$:IF A$="R" THEN 365
455 IF A$=" "THEN 495
460 IF A$="Q"THEN END
465 IF A$="M"THEN 125
470 IF A$="H"THEN GOSUB 1785
475 IF A$="S"OR A$="9"THEN 1185
480 IF A$="6"OR A$="G"THEN 2145
485 IF A$="5" THEN 805
490 IF VAL(A$)>0 THEN L= VAL(A$):GOTO 500
495 GOSUB 720:GOTO 125
500 INPUT"DELETE Y/N";A$:IF A$ ="Y" OR A$ ="Y"THEN AM$="":GOTO 510
505 GOTO 535
510 OPEN"D",#1,"IN.DAT",30
515 FIELD#1,10 AS DD$,10 AS TT$,10 AS CA$
520 IF AM$=""THEN TJ$=DA$:DA$="":CI$=""
525 LSET DD$=DA$:LSET TT$=CI$:LSET CA$=AM$
530 IF AM$=""THEN DA$=TJ$:PUT#1,L:CLOSE#1
535 CLEAR 500:GOSUB 720
540 GOTO 365
545 OPEN"D",#1,"OUT.DAT",30:DT=0
550 LO=31: CLS:INPUT"MONTH## OR FIND";JJ$:IF JJ$=""THEN JJ$=LEFT$(DA$,2)
555 CLS:IF LOF(1)<1 THEN PRINT"NO DATA TO SHOW":CLOSE#1:GOTO 125
560 PRINT"#    DATE   EXPENSE      AMOUNT"
565 FIELD#1,10 AS PD$,10 AS PT$,10 AS PA$:K$="EXPENSE"
570 FOR E=1 TO LOF(1):GET#1,E:IF VAL(PA$)<1 THEN GOTO 615
575 IF LEN(JJ$)>2 THEN IF VAL(JJ$)=VAL(PA$) THEN GOTO 600 ELSE IF JJ$=LEFT$(PT$,LEN(JJ$)) THEN K$="?-"+JJ$:GOTO 600
580 IF JJ$="13"THEN 595
585 GG$=LEFT$(PD$,2):IF GG$=JJ$ GOTO 600
590 GOTO 615
595 REM IF VAL(PA$)<1 THEN GOTO 124
600 DT=DT+VAL(PA$) 
605 PRINT@LO,E;:PRINT@LO+6,PD$;:PRINT@LO+14,PT$;:PRINT@LO+21,"";:PRINT USING"$$##,###.##";VAL(PA$)
610 LO=LO+32:IF LO>448 THEN PRINT@480,"PRESS ENTER KEY";:INPUT L$:IF L$="" OR L$="X" THEN CLS:PRINT"#    DATE    EXPENSE     AMOUNT":LO=31:IF L$="X" THEN CLOSE#1:GOTO 125
615 NEXT E
620 PRINT@448,K$:PRINT @462,"";:PRINT USING "total$$###,###.##";DT:CLOSE#1
625 PRINT@480,"[M]-MENU [R]-REDO ##-DELETE";:INPUT A$:IF A$="R" THEN 545
630 IF A$=" "THEN GOTO 665
635 IF A$="Q"THEN END
640 IF A$="M"THEN 125
645 IF A$="S"OR A$="9"THEN 1185
650 IF A$="6"OR A$="G"THEN 2145
655 IF A$="5"THEN 805
660 L=VAL(A$):IF L>0 THEN 670
665 GOSUB 760:GOTO 125
670 INPUT"DELETE Y/N";A$:IF A$ ="Y" OR A$ ="Y"THEN IM$="":GOTO 680
675 GOTO 710
680 OPEN"D",#1,"OUT.DAT",30
685 IF IM$=""THEN TJ$=DA$:DA$="":CI$=""
690 FIELD #1,10 AS PD$,10 AS PT$,10 AS PA$
695 LSET PD$=DA$:LSET PT$=CI$:LSET PA$=IM$
700 PUT#1,L:IF IM$=""THEN DA$=TJ$
705 CLOSE #1
710 GOSUB 760
715 GOTO 545
720 OPEN"D",#1,"IN.DAT",30:GT=0:IT=0
725 IF LOF(1) <1 THEN CLOSE #1:RETURN
730 FIELD#1,10 AS DD$,10 AS TT$,10 AS CA$:Q=LOF(1)
735 FOR E=1 TO Q
740 GET#1,E
745 IT=IT+VAL(CA$)
750 NEXT E
755 CLOSE#1:RETURN
760 OPEN"D",#1,"OUT.DAT",30:GT=0:DT=0
765 IF LOF(1) <1 THEN CLOSE #1:RETURN
770 FIELD #1,10 AS DD$,10 AS TD$,10 AS CD$
775 K=LOF(1)
780 FOR E=1 TO K
785 GET#1,E 
790 DT=DT+VAL(CD$)
795 NEXT E:CLOSE#1
800 RETURN
805 CLS:PRINT@267,"CALCULATING";
810 FOR X=1 TO 12:MI(X)=0:MD(X)=0:NEXT X
815 OPEN"D",#1,"IN.DAT",30
820 IF LOF(1)<1 THEN CLOSE #1:GOTO 865
825 FIELD#1,10 AS MD$,10 AS MC$,10 AS MZ$
830 G=LOF(1)
835 FOR E=1 TO G
840 GET#1,E
845 MT=VAL(LEFT$(MD$,2))
850 GOSUB 975
855 NEXT E
860 CLOSE #1
865 OPEN"D",#1,"OUT.DAT",30:MU=0:MG=0:MP=0
870 IF LOF(1)<1 THEN CLOSE #1:A$="R":GOTO 125
875 FIELD #1,10 AS ID$,10 AS IC$,10 AS IZ$
880 G=LOF(1)
885 FOR E=1 TO G
890 PRINT@302,"";:PRINT USING"###";(E/G)*100;:PRINT"%"
895 GET#1,E:IQ=VAL(LEFT$(ID$,2))
900 GOSUB 990
905 NEXT E 
910 CLOSE#1
915 CLS(0):LO=32
920 PRINT"m";:PRINT@4,"income";:PRINT@14,"expense";:PRINT@27,"diff";
925 FOR X= 1 TO 12
930 PRINT@LO,RIGHT$(STR$(X),1);:PRINT@LO+1,"";:PRINT USING"#######.##";MI(X);:MU=MU+MI(X)
935 PRINT@LO+12,"";:PRINT USING"#######.##";MD(X);:MG=MG+MD(X):PRINT@LO+23,"";:PRINT USING"######.##";MI(X)-MD(X);:MP=MP+(MI(X)-MD(X))
940 LO=LO+32:NEXT X
945 PRINT@LO+13,"totals";:LO=LO+32:PRINT@LO,"":PRINT @ LO+2,"";:PRINT USING"######.##";MU
950 PRINT@LO+13,"";:PRINT USING"######.##";MG:PRINT@LO+23,"";:PRINT USING"######.##";MP;
955 A$=INKEY$
960 IF A$=" "THEN GOSUB 720:GOSUB 760:GOSUB 1470:GOTO 125
965 IF A$="G"THEN 2145
970 GOTO 955
975 FOR X=1 TO 12
980 IF X=MT THEN MI(MT)=MI(MT)+VAL(MZ$)
985 NEXT X:RETURN
990 FOR X=1 TO 12
995 IF X=IQ THEN MD(IQ)=MD(IQ)+VAL(IZ$)
1000 NEXT X
1005 RETURN
1010 REM//CATEGORIES//
1015 CLS:PRINT"          CATEGORIES"
1020 OPEN"D",#1,"CAT.DAT",10:QQ=0:LO=32
1025 IF LOF(1)<1THEN QQ=99:CLOSE#1:GOTO 1125
1030 FIELD #1,10 AS CT$
1035 G=LOF(1)
1040 FOR E=1 TO G
1045 GET#1,E 
1050 PRINT@LO,E;:PRINT"-";
1055 PRINT CT$;
1060 CG$(E)=CT$
1065 LO=LO+32/2
1070 NEXT E
1075 PRINT"":PRINT@15*32,"";
1080 CLOSE#1
1085 IF A=6 THEN INPUT"99 TO ADD OR ## TO EDIT";QQ
1090 IF A=6 AND QQ=99 THEN 1125 
1095 IF A=6 AND QQ<1 THEN A$="R":GOTO 125
1100 IF A=6 THEN 1120
1105 INPUT"ENTER CAT.# OR 99 TO ADD";L:IF L=99 THEN QQ=99:GOTO 1125
1110 CI$=CG$(L):A$=""
1115 A$="R":RETURN
1120 PRINT"EDIT CATEGORIES"
1125 OPEN"D",#1,"CAT.DAT",10
1130 FIELD#1,10 AS CA$
1135 IF B>24 THEN 1180
1140 IF QQ=99 THEN B=LOF(1)+1:GOTO 1150
1145 IF QQ<99 AND QQ>0 THEN B=QQ
1150 IF B>28 THEN CLOSE#1:PRINT "MAX CAT": FOR X=1 TO 1500:NEXT X: GOTO 125 
1155 INPUT"CAT NAME";CD$
1160 LSET CA$=CD$
1165 PUT#1,B
1170 CLOSE#1
1175 IF A<6 THEN GOTO 1010
1180 A$="R":GOTO 125
1185 REM //SETTING SCREEN//
1190 CLS:A$=""
1195 PRINT"SETTINGS":PRINT"":PRINT"1- ADD/DELETE CATEGORIES":PRINT"2- CLEAR INCOME DATA":PRINT"3- CLEAR EXPENSE DATA":PRINT"3- CLEAR CATEGORIES DATA":PRINT"5- CHANGE DATE"
1200 PRINT"6- BACKUP":PRINT"7- CLOSE OUT YEAR":PRINT"[SPACE]- MAIN MENU":PRINT"H- HELP"
1205 A$=INKEY$
1210 IF A$="1"THEN A=6:GOSUB 1010:GOTO 1185
1215 IF A$="2"THEN PRINT"CLEARED INCOME DATA":INPUT"ARE YOU SURE <Y/N>?";L$: IF L$ ="Y"THEN GOTO 1260 ELSE GOTO 125
1220 IF A$="3"THEN PRINT"CLEARED EXEPNSE DATA":INPUT"ARE YOU SURE <Y/N>?";L$: IF L$ ="Y"THEN GOTO 1265 ELSE GOTO 125
1225 IF A$="4"THEN PRINT"CLEARED CATEGORIES":INPUT"ARE YOU SURE <Y/N>?";L$: IF L$ ="Y"THEN GOTO 1270 ELSE GOTO 125
1230 IF A$="5"THEN PRINT"NEW DATE":GOTO 75
1235 IF A$="6"THEN GOTO 1280
1240 IF A$="7"THEN GOTO 1330
1245 IF A$=" "THEN GOTO 125
1250 IF A$="H"GOSUB 1785: GOTO 1185
1255 GOTO 1205
1260 KILL"IN/DAT":IT=0:GOTO 125
1265 KILL"OUT/DAT":DT=0:GOTO 125
1270 KILL"CAT/DAT":GOTO 125
1275 GOTO 125
1280 REM//BACKUP// 
1285 CLS:PRINT"":A$=""
1290 CLEAR 500
1295 PRINT"THIS REQUIRES THE COCO SDC ":PRINT"ENTER [C] TO CANCEL": INPUT"ANY OTHER KEY TO EXEC";A$:IF A$="C" THEN 1185
1300 CLS:DRIVE1,"IVEBU.DSK",NEW: PRINT "FORMATING DRIVE":DSKINI1
1305 PRINT"DRIVE FORMATTED":PRINT"CONDUCTING BACKUP"
1310 BACKUP 0 TO 1
1315 PRINT"BACKUP COMPLETE":PRINT"BACKUP DISK NAMED IVEBU.DSK"
1320 FOR X=1 TO 1500:NEXT X
1325 GOTO 125
1330 REM //YEAR CLOSE OUT//
1335 CLEAR 500:CLS
1340 PRINT"THIS WILL CLOSEOUT THE YEAR,":PRINT"AND ARCHIVE THE DATA ON DISK,":PRINT"AND CREATE A NEW YEAR.":PRINT"THIS REQUIRES THE COCO SDC."
1345 PRINT"ARE YOU SURE?":INPUT"TYPE YES AND ENTER TO CONT.";B$: IF B$="YES"THEN GOTO 1350 ELSE GOTO 125
1350 CLS:PRINT"YEAR CLOSE OUT AND NEW YEAR DISK."
1355 INPUT"WHAT YEAR(##) IS THIS FOR?";A$ 
1360 IF LEN(A$)<2 OR LEN(A$)>2 THEN PRINT"USE ONLY 2 DIGITS FOR YEAR.":GOTO 1355
1365 PRINT"ENTER [C] TO CANCEL":INPUT"ANY OTHER KEY TO EXECUTE.";B$: IF B$="C"THEN 1185
1370 CLS:DRIVE1,"IVE"+A$+"-C.DSK",NEW:PRINT"FORMATING DRIVE":DSKINI1
1375 PRINT"DRIVE FORMATTED.":PRINT"TRANSFERING DATA TO DISK."
1380 BACKUP 0 TO 1
1385 PRINT"CLOSEOUT COMPLETE.":PRINT"ARCHIVE DISK NAMED IVE"+A$+".DSK"
1390 CLEAR 500
1395 INPUT"ENTER NEW YEAR ## ";A$
1400 IF LEN(A$)<2 OR LEN(A$)>2 THEN PRINT"USE ONLY 2 DIGITS FOR YEAR.": FOR X =1 TO 500:NEXT X: GOTO 1395
1405 PRINT"CREATING NEW YEAR."
1410 KILL"IN/DAT":KILL"OUT/DAT":KILL"DATE/DAT":DA$="01/01":GOSUB 1435
1415 DRIVE1,"IVE"+A$+".DSK",NEW:PRINT"FORMATING DRIVE.":DSKINI1:BACKUP 0 TO 1
1420 PRINT"CLOSEOUT COMPLETE."
1425 FOR X=1 TO 1500:NEXT X
1430 EXP
1435 OPEN"D",#1,"DATE.DAT",5
1440 FIELD#1,5 AS DJ$
1445 B=LOF(1)
1450 LSET DJ$=DA$
1455 PUT#1,1
1460 CLOSE#1
1465 RETURN
1470 OPEN"D",#1,"DATE.DAT",5
1475 B=LOF(1)
1480 IF B<1 THEN CLOSE #1:CLS:PRINT"CREATE NEW YEAR DISK":GOTO 1390
1485 FIELD#1,5 AS DJ$
1490 GET#1,1
1495 DA$=DJ$
1500 MO$=LEFT$(DJ$,2):DL$=RIGHT$(DJ$,2)
1505 CLOSE#1
1510 RETURN
1515 OPEN"D",#1,"CAT.DAT",10:A$="":S=0:A$=""
1520 IF LOF(1) <1 THEN CLOSE#1:A$="R":GOTO 125
1525 FIELD#1,10 AS CT$
1530 G=LOF(1)
1535 FOR E=1 TO G
1540 GET#1,E 
1545 CG$(E)=CT$
1550 NEXT E
1555 CLOSE#1
1560 FOR X=1 TO G 
1565 OT(X)=0
1570 NEXT X
1575 IP=0
1580 OPEN"D",#1,"OUT.DAT",30
1585 IF LOF(1)<1THEN CLOSE #1:A$="R":GOTO 125
1590 FIELD#1,10 AS ID$,10 AS IC$,10 AS IZ$
1595 P=LOF(1)
1600 FOR E=1 TO P
1605 PRINT@302,"";:PRINT USING"###";(E/P)*100;:PRINT"%"
1610 GET#1,E:IF WW$=""THEN GOTO 1625
1615 IF LEFT$(ID$,2)=WW$ THEN 1625
1620 GOTO 1635
1625 IL$=IC$
1630 IP=VAL(IZ$)
1635 FOR W=1 TO G:IF WW$=""GOTO 1650
1640 IF LEFT$(ID$,2)=WW$ THEN 1650
1645 GOTO 1655
1650 IF IL$=CG$(W) THEN OT(W)=OT(W)+IP
1655 NEXT W,E
1660 CLOSE#1
1665 CLS(0):LO=32
1670 PRINT@0,"category";:PRINT @15,K$;:PRINT @ 24,"expense";
1675 FOR X = 1 TO G
1680 IF OT(X)<1 THEN GOTO 1705
1685 PRINT@LO,CG$(X);:PRINT STRING$(6," ");:
1690 PRINT@LO+18,"";:PRINT USING"$$###,###.##";OT(X)
1695 LO=LO+32
1700 IF LO>448 THEN PRINT@480,"PRESS ENTER TO CONT.";:INPUT L:CLS(0):PRINT@0,"category";:PRINT@15,K$;:PRINT@24,"expense";:LO=32
1705 NEXT X
1710 PRINT@480,"";:INPUT"M-MENU OR MONTH ##        ";A$:WW$=""
1715 IF A$="1"THEN A$="01"ELSE IF A$="2"THEN A$="02"ELSE IF A$="3"THEN A$="03"ELSE IF A$="6"THEN A$="06"
1720 IF A$="7"THEN A$ ="07"ELSE IF A$="8"THEN A$="08"ELSE IF A$="9"THEN A$="09" 
1725 IF A$="M"THEN GOTO 125
1730 IF A$="G"THEN 2145
1735 IF A$="S"THEN 1185
1740 IF A$=""GOTO 1780
1745 IF A$="H"GOSUB 1785
1750 IF A$="R"GOTO 125
1755 WW$=A$
1760 IF A$="01"THEN K$="jan"ELSE IF A$="02"THEN K$="feb"ELSE IF A$="03"THEN K$="mar"ELSE IF A$="04"THEN K$="apr"ELSE IF A$="05"THEN K$="may"ELSE IF A$="06"THEN K$="jun"ELSE IF A$="07"THEN K$="jul"ELSE IF A$="08"THEN K$="aug"
1765 IF A$="09"THEN K$="sep"ELSE IF A$="10"THEN K$="oct"ELSE IF A$="11"THEN K$="nov"ELSE IF A$="12"THEN K$="dec"
1770 IF VAL(WW$)<13 THEN CLS:PRINT@267,"CALCULATING";:GOTO 1515
1775 IF WW$="13"THEN CLS(0):GOTO 2600
1780 WW$="":A$="R":GOTO 125
1785 REM//HELP SCREEN//
1790 CLS:A$="":PRINT@13,"HELP":PRINT"KEY COMMANDS":PRINT"[H]-HELP SCREEN":PRINT"[S]-SETTINGS FROM MAIN MENU":PRINT"[M]-MAIN MENU FROM LIST SCREENS":PRINT"[G]-GRAPHS ON MONTHLY/MAIN MENU":PRINT"[C]-CANCEL"
1795 PRINT"[Q]-QUIT":PRINT"[SPACE]-MAIN MENU":PRINT"[ENTER](W/NO ENTRY)-MAIN MENU":PRINT"[R]-REDO ON LIST SCREEN":PRINT"[X] EXIT INCOME/EXPENSE LIST":PRINT"[1-12] FOR MONTH ENTRY":PRINT"[13]=ALL YEAR ON MONTH ENTRY":PRINT"FIND? USE>2 CHARS. I.E. #.##"
1800 A$=INKEY$
1805 IF A$=" "THEN A$="R":RETURN
1810 IF A$="Q"THEN END
1815 GOTO 1800
1820 REM //SPLASH SCREEN//
1825 CLS:C=143:A$="":PRINT@332,"FOR THE":PRINT@358,"TANDY COLOR COMPUTER":PRINT@396,"COCO SDC":PRINT@72,"INCOME VS EXPENSE":PRINT@171,"CREATED BY"
1830 PRINT@205,"TAZROG":PRINT@238,"2024":PRINT@458,"PRESS SPACE":T=0
1835 FOR ZZ=0TO1STEP0:FORX=0TO15:POKEX+1024,C:POKEX+1040,C:POKE1535-X,C:POKE1519-X,C:POKE1055+(32*X),C:POKE1472-(32*X),C:GOSUB1840:NEXT:GOSUB1840:NEXT
1840 C=C+16:IF C>255 THEN C=143
1845 A$=INKEY$
1850 T=T+1
1855 IF T >70 THEN 35
1860 IF A$=" "GOTO 35
1865 RETURN
1870 REM //INCOME REPORTS//
1875 OPEN"D",#1,"CAT.DAT",10:A$="":S=0
1880 IF LOF(1)<1 THEN CLOSE#1:A$="R":GOTO 125
1885 FIELD#1,10 AS CT$
1890 G=LOF(1)
1895 FOR E=1 TO G
1900 GET#1,E 
1905 CG$(E)=CT$
1910 NEXT E
1915 CLOSE#1
1920 FOR X=1 TO G 
1925 OT(X)=0
1930 NEXT X
1935 IP=0
1940 OPEN "D",#1,"IN.DAT",30
1945 IF LOF(1) <1 THEN CLOSE #1:A$="R":GOTO 125
1950 FIELD #1,10 AS ID$,10 AS IC$,10 AS IZ$
1955 P=LOF(1)
1960 FOR E=1 TO P
1965 PRINT @ 302,"";:PRINT USING "###";(E/P)*100;:PRINT"%"
1970 GET #1,E :IF WW$="" THEN GOTO 1985
1975 IF LEFT$(ID$,2)=WW$ THEN 1985
1980 GOTO 1995
1985 IL$=IC$
1990 IP= VAL(IZ$)
1995 FOR W=1 TO G:IF WW$="" GOTO 2010
2000 IF LEFT$(ID$,2)=WW$ THEN 2010
2005 GOTO 2015
2010 IF IL$=CG$(W) THEN OT(W)=OT(W)+IP
2015 NEXT W,E
2020 CLOSE #1
2025 CLS(0):LO=32
2030 PRINT@0,"category";:PRINT @15,K$;:PRINT @ 24,"income";
2035 FOR X=1 TO G
2040 IF OT(X)<1 THEN GOTO 2065
2045 PRINT@LO,CG$(X);:PRINT STRING$(6," ");:
2050 PRINT@ LO+18,"";:PRINT USING "$$###,###.##";OT(X)
2055 LO=LO+32
2060 IF LO>448 THEN PRINT@480,"PRESS ENTER TO CONT.";:INPUT L:CLS(0):PRINT@0,"category";:PRINT@15,K$;:PRINT@24,"income";:LO=32
2065 NEXT X
2070 PRINT@480,"";:INPUT"M-MENU OR MONTH ##        ";A$:WW$=""
2075 IF A$="1"THEN A$ ="01"ELSE IF A$= "2"THEN A$="02"ELSE IF A$="3"THEN A$ ="03"ELSE IF A$="6"THEN A$="06"
2080 IF A$="7"THEN A$="07"ELSE IF A$="8"THEN A$="08"ELSE IF A$="9"THEN A$="09" 
2085 IF A$="M"THEN CLS(0):GOTO 125
2090 IF A$="G"THEN 2145
2095 IF A$="S"THEN 1185
2100 IF A$=""THEN CLS(0):GOTO 2140
2105 IF A$="H"GOSUB 1785
2110 IF A$="R"GOTO 125
2115 WW$=A$
2120 IF A$="01"THEN K$="jan"ELSE IF A$="02"THEN K$="feb"ELSE IF A$="03"THEN K$="mar"ELSE IF A$="04"THEN K$="apr"ELSE IF A$="05"THEN K$="may"ELSE IF A$="06"THEN K$="jun"ELSE IF A$="07"THEN K$="jul"ELSE IF A$="08"THEN K$="aug"
2125 IF A$="09"THEN K$="sep"ELSE IF A$="10"THEN K$="oct"ELSE IF A$="11"THEN K$="nov"ELSE IF A$="12"THEN K$="dec"
2130 IF VAL(WW$)<13 THEN CLS:PRINT@267,"CALCULATING";:GOTO 1870
2135 IF WW$="13"THEN CLS(0):GOTO 2620
2140 WW$="":A$="R":GOTO 125
2145 REM//CALCULATIONS FOR INCOME/EXPENSE REPORTS//
2150 CLS:HT=0:HM=0:HH=0:A$=""
2155 FOR X=1TO12:MI(X)=0:MD(X)=0:NEXT X
2160 PRINT@267,"CALCULATING";
2165 FOR X=1 TO 12:MI(X)=0:MD(X)=0
2170 OPEN"D",#1,"IN.DAT",30
2175 IF LOF(1) <1 THEN CLOSE #1:GOTO 865
2180 FIELD #1,10 AS MD$,10 AS MC$,10 AS MZ$
2185 G=LOF(1)
2190 FOR E=1 TO G
2195 GET#1,E
2200 MT=VAL(LEFT$(MD$,2))
2205 GOSUB 2425
2210 NEXT E
2215 CLOSE#1
2220 OPEN"D",#1,"OUT.DAT",30:MU=0:MG=0:MP=0
2225 IF LOF(1)<1 THEN CLOSE #1:A$="R":RETURN
2230 FIELD #1,10 AS ID$,10 AS IC$,10 AS IZ$
2235 G=LOF(1)
2240 FOR E=1 TO G
2245 GET#1,E 
2250 IQ= VAL(LEFT$(ID$,2))
2255 PRINT@302,"";:PRINT USING"###";(E/G)*100;:PRINT"%"
2260 GOSUB 2450
2265 NEXT E 
2270 CLOSE#1
2275 IF HT<HH THEN HT=HH
2280 IF HT<>INT(HT) THEN HT=INT(HT)+1
2285 HM=HT/2:IF HM <>INT(HM) THEN HM=INT(HM)+1
2290 CLS(0):Y$=STRING$(1,126):PRINT @7,"income";:SET(13,0,1):SET(13,1,1):SET(26,0,1):SET(26,1,1):PRINT@16,"vs";:PRINT@21,"expense";:SET(41,0,4):SET(41,1,4):SET(56,0,4):SET(56,1,4)
2295 PRINT@420,Y$;:PRINT@433,Y$;:PRINT@447,Y$;
2300 PRINT@451,STR$(0):PRINT@448+17-LEN(STR$(HM))/2,HM:PRINT@480-LEN(STR$(HT)),STR$(HT);
2305 FOR X= 1 TO 12:IF X=1 THEN X$="jan"ELSE IF X=2 THEN X$="feb"ELSE IF X=3 THEN X$="mar"ELSE IF X=4 THEN X$="apr"ELSE IF X=5 THEN X$="may"ELSE IF X=6 THEN X$="jun"ELSE IF X=7 THEN X$="jul"ELSE IF X=8 THEN X$="aug"
2310 IF X=9 THEN X$="sep"ELSE IF X=10 THEN X$="oct"ELSE IF X=11 THEN X$="nov"ELSE IF X=12 THEN X$="dec"
2315 PRINT@32*X,X$;
2320 IF MI(X)>MD(X) THEN BB=MI(X):C=1
2325 IF MD(X)>=MI(X) THEN BB= MD(X):C=4
2330 IF BB <>INT(BB)THEN BB=INT(BB)+1
2335 FOR G=8TO (BB/(HT/55)+8)
2340 IF BB < 1 THEN 2350
2345 SET (G,2*X,C)
2350 NEXT G 
2355 IF MI(X)<MD(X) THEN BD=MI(X):C=1: 
2360 IF MD(X)<=MI(X) THEN BD=MD(X):C=4
2365 IF BD <>INT(BD) THEN BD=INT(BD)+1
2370 FOR H=8 TO (BD/(HT/55)+8)
2375 IF BD<1 GOTO 2385
2380 SET (H,2*X,C)
2385 NEXT H
2390 NEXT X
2395 A$=INKEY$
2400 IF A$=" "THEN GOTO 125
2405 IF A$="M"THEN GOTO 125
2410 IF A$="S"THEN GOTO 1185
2415 IF A$="H"GOSUB 1785: GOTO 125
2420 GOTO 2395
2425 FOR X=1 TO 12
2430 IF X=MT THEN MI(MT)=MI(MT)+VAL(MZ$)
2435 IF MI(X)>HT THEN HT=MI(X)
2440 NEXT X
2445 RETURN
2450 FOR X=1 TO 12
2455 IF X= IQ THEN MD(IQ)=MD(IQ)+VAL(IZ$)
2460 IF MD(X)>HH THEN HH=MD(X)
2465 NEXT X 
2470 RETURN
2475 REM//MEMORY MANAGAMENT//
2480 CLEAR 500:CLS:PRINT@268,"LOADING"
2485 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28):HT=0:HH=0
2490 GOSUB 1470:GOSUB 720:GOSUB 760
2495 GOTO 130
2500 CLEAR 500:CLS:PRINT@268,"LOADING"
2505 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28):HT=0:HH=0
2510 GOSUB 1470:GOSUB 720
2515 CLS:PRINT@267,"CALCULATING":WW$=LEFT$(DA$,2):K$="MONTH"
2520 GOTO 1515
2525 CLEAR 500:CLS:PRINT@268,"LOADING"
2530 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28):HT=0:HH=0
2535 GOSUB 1470:GOSUB 760
2540 CLS:PRINT@267,"CALCULATING":K$="MONTH"
2545 GOTO 1870
2550 CLEAR 500:CLS:PRINT@268,"LOADING"
2555 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28)
2560 GOSUB 1470:GOSUB 720
2565 CLS:PRINT@267,"CALCULATING":IF VAL(WW$)<13 THEN A$=MO$ ELSE K$="year":GOTO 1515
2570 GOTO 1715
2575 CLEAR 500:CLS:PRINT@268,"LOADING"
2580 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28)
2585 GOSUB 1470:GOSUB 760
2590 CLS:PRINT@267,"CALCULATING":IF VAL(WW$)<13 THEN A$=MO$ ELSE K$="year":GOTO 1870
2595 GOTO 2075
2600 CLEAR 500:CLS:PRINT@268,"LOADING"
2605 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28)
2610 GOSUB 1470:GOSUB 720
2615 CLS:PRINT@266,"CALCULATING":K$="year": GOTO 1515
2620 CLEAR 500:CLS:PRINT@268,"LOADING"
2625 DIM MI(12):DIM MD(12):DIM CG$(28):DIM OT(28)
2630 GOSUB 1470:GOSUB 720
2635 CLS:PRINT@267,"CALCULATING":K$="year": GOTO 1870
2640 END
