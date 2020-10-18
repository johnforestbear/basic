PROGRAM Test(INPUT, OUTPUT);
VAR
  I, Sum, D, Num, Len: INTEGER;
  Ch: CHAR;
  Str: STRING[255];
PROCEDURE IsDigit(VAR Ch: CHAR; VAR D: INTEGER);
BEGIN
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
END;
BEGIN {StringToInt}
  Sum := 0;
  Num := 0;
  D := 0;
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      IF NOT EOLN(INPUT)
      THEN
        BEGIN
          READ(INPUT, Str);
          Len := length(Str);
          FOR I := 1 TO Len
          DO
            BEGIN
              IsDigit(Str[I], D);
              IF D <> -1
              THEN
                Num := Num * 10 + D;
              IF D = -1
              THEN
                BEGIN
                  Sum := Sum + Num;
                  Num := 0
                END 
            END;
          READLN(INPUT)
        END
    END;
  IF (D <> -1) AND EOF(INPUT)
  THEN
    Sum := Sum + Num;  
  WRITELN(Sum)
END. {StringToInt}
