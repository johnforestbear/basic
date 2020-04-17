PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Counting: BOOLEAN;
BEGIN {AverageScore}
  Counting := TRUE;
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE Student < ClassSize
  DO 
    BEGIN
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 0;
      WHILE WhichScore < NumberOfScores
      DO
        BEGIN
          IF NOT EOLN
          THEN
            BEGIN
              READ(NextScore);
              WhichScore := WhichScore + 1;
              TotalScore := TotalScore + NextScore
            END
          ELSE
            BEGIN
              WRITELN('The counting is stopped. There are less than 4 values.');
              WhichScore := NumberOfScores;
              Student := ClassSize;
              Counting := FALSE
            END
        END;
      READLN;
      IF Counting
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
  IF Counting
  THEN
    BEGIN
      WRITELN('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
END.  {AverageScore}
