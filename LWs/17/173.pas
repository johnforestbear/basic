PROGRAM Stat(INPUT, OUTPUT);
VAR
  MinNum, MaxNum, TempNum, Sum, Count: INTEGER;
  Overflow: BOOLEAN;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9  
      ELSE
        D := -1
    END
END; {ReadDigit}
PROCEDURE ReadNumber(VAR InpF: TEXT; VAR Num: INTEGER);
VAR
  D: INTEGER;
BEGIN { ReadNumber }
  Num := 0;
  D := 0;
  WHILE NOT ((Num = -1) OR (D = -1))
  DO
    BEGIN
      ReadDigit(InpF, D);
      IF D <> -1
      THEN
        BEGIN     
          IF ((MAXINT DIV 10 = Num) AND (MAXINT MOD 10 >= D)) OR (MAXINT DIV 10 > Num)
          THEN
            Num := Num * 10 + D      
          ELSE
            Num := -1 
        END
    END
END; {ReadNumber} 
BEGIN {Stat}
  MinNum := MAXINT;
  MaxNum := 0;
  TempNum := 0;
  Sum := 0;
  Count := 0;
  Overflow := FALSE;
  WHILE NOT EOLN OR Overflow
  DO
    BEGIN
      ReadNumber(INPUT, TempNum);
      IF TempNum = -1
      THEN
        Overflow := TRUE;
      IF Count < MAXINT
      THEN
        Count := Count + 1
      ELSE
        Overflow := TRUE;
      IF ((MAXINT - TempNum) >= Sum)
      THEN
        Sum := Sum + TempNum
      ELSE
        Overflow := TRUE;
      IF NOT Overflow
      THEN
        BEGIN
          IF MinNum > TempNum
          THEN
            MinNum := TempNum;
          IF MaxNum < TempNum
          THEN
            MaxNum := TempNum
        END    
    END;
  IF (NOT Overflow) AND (Count <> 0)
  THEN
    BEGIN
      WRITELN('Max is ', MaxNum);
      WRITELN('Min is ', MinNum);
      WRITELN('The average value is ', Sum DIV Count, '.', (((Sum MOD Count) * 100) DIV Count))
    END
  ELSE
    WRITELN('There is overflow.')  
END. {Stat}
