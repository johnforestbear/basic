PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  Min = 0;
  Max = 100;
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Overflow: BOOLEAN;
PROCEDURE Copy(VAR Fin, Fout: TEXT); {Copy}
VAR
  Ch: CHAR;
BEGIN
  WHILE ((NOT EOLN) AND (Ch <> ' '))
  DO
    BEGIN
      READ(Fin, Ch);
      WRITE(Fout, Ch)
    END
END; {Copy}
BEGIN {AverageScore}
  Overflow := FALSE;
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE ((Student <= ClassSize) AND (NOT Overflow))
  DO 
    BEGIN
      Copy(INPUT, OUTPUT);
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 1;
      WHILE ((WhichScore <= NumberOfScores) AND (NOT Overflow))
      DO
        BEGIN
          READ(NextScore);
          Overflow := ((Max < NextScore) OR (NextScore < Min ));
          IF NOT Overflow
          THEN
            BEGIN
              WhichScore := WhichScore + 1;
              TotalScore := TotalScore + NextScore
            END
        END;
      READLN;
      IF NOT Overflow
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore
        END
    END;
  WRITELN;
  IF NOT Overflow {выведи или то, или то по переполнению}
  THEN
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE
    WRITELN('Превышен диапазон минимального или максимального значения баллов.')
END. {AverageScore}
