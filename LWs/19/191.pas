PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
TYPE
  Range = 0 .. MAX;
  Sets = SET OF 2 .. MAX;
VAR
  StartSet, FinSet: Sets;
  Next, Elem: Range;
BEGIN
  StartSet := [2 .. MAX];
  FinSet := [];
  Next := 2;
  WHILE StartSet <> []
  DO
    BEGIN
      WHILE NOT (Next IN StartSet)
      DO
        Next := Next + 1;
      FinSet := FinSet + [Next];
      Elem := Next;
      WHILE Elem <= Max
      DO
        BEGIN
          StartSet := StartSet - [Elem];
          Elem := Elem + Next
        END 
    END;
  Elem := 2;  
  WHILE Elem <> Max
  DO
    BEGIN
      IF Elem IN FinSet 
      THEN
        WRITE(Elem:3);
      Elem := Elem +1
    END;
  WRITELN
END.
