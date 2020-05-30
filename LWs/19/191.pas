PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
TYPE
  Sets = SET OF Min .. Max;
VAR
  StartSet: Sets;
  Next, Elem: INTEGER;
PROCEDURE Sieve(VAR Next, Elem: INTEGER; VAR StartSet: Sets);
BEGIN
  Next := Min;
  WHILE Next * Next < Max
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
    END
END;
PROCEDURE PrintSet(VAR Elem: INTEGER; VAR StartSet: Sets);
BEGIN
  Elem := Min;  
  WHILE Elem <> Max
  DO
    BEGIN
      IF Elem IN StartSet 
      THEN
        WRITE(Elem, ',');
      Elem := Elem + 1
    END;
  WRITELN
END;
BEGIN
  StartSet := [Min .. Max];
  Sieve(Next, Elem, StartSet);
  WRITE('Простые числа в диапазоне до ', Max, ' будут: ');
  PrintSet(Elem, StartSet)
END.
