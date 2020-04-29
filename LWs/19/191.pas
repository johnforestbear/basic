PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
TYPE
  Sets = SET OF Min .. Max;
VAR
  StartSet: Sets;
  Next, Elem: INTEGER;
BEGIN
  StartSet := [Min .. Max];
  Next := Min;
  WHILE Next <= SQRT(Max)
  DO
    BEGIN
      Elem := Next;
      WHILE Elem <= Max
      DO
        BEGIN
          Elem := Elem + Next;
          StartSet := StartSet - [Elem]
        END;  
      Next := Next + 1
    END;
  Elem := Min;  
  WHILE Elem <> Max
  DO
    BEGIN
      IF Elem IN StartSet 
      THEN
        WRITE(Elem:3);
      Elem := Elem + 1
    END;
  WRITELN
END.
