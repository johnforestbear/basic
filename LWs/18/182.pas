PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  Min = 0;
  Max = 100;
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Counting, Overflow: BOOLEAN;
PROCEDURE CopyWord(VAR Fin, Fout: TEXT); {CopyWord}
VAR
  Ch: CHAR;
BEGIN
  WHILE ((NOT EOLN) AND (Ch <> ' '))
  DO
    BEGIN
      READ(Fin, Ch);
      WRITE(Fout, Ch)
    END
END; {CopyWord}
BEGIN {AverageScore}
  Counting := TRUE;
  Overflow := FALSE;
  ClassTotal := 0;
  Student := 0;
  WRITELN('Student averages:');
  WHILE ((Student < ClassSize) AND Counting AND (NOT Overflow))
  DO 
    BEGIN
      CopyWord(INPUT, OUTPUT);
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 0;
      WHILE ((WhichScore < NumberOfScores) AND Counting AND (NOT Overflow))
      DO
        BEGIN
          IF NOT EOLN
          THEN
            BEGIN
              READ(NextScore);
              Overflow := ((Max < NextScore) OR (NextScore < Min ));
              IF NOT Overflow
              THEN
                BEGIN
                  WhichScore := WhichScore + 1;
                  TotalScore := TotalScore + NextScore
                END  
            END
          ELSE
            BEGIN
              Counting := FALSE;
              WRITELN('The counting is stopped. The values of overflow is ', Overflow, ' and counting is ', Counting, '.')
            END        
        END;
      READLN;
      IF Counting AND (NOT Overflow)
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
  IF Counting AND (NOT Overflow)
  THEN
    BEGIN
      WRITELN('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
END. {AverageScore}
