PROGRAM InsertionSort(INPUT, OUTPUT);
{Сортирует символы из INPUT}
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  Range = ListEnd .. Max;
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: Range;
               END;
VAR
  Arr: RecArray;
  Index: INTEGER;
  First, Prev, Curr: Range;  
  Extra: CHAR;

PROCEDURE FindValuesPrevCurr(VAR Prev, Curr: Range; VAR Arr: RecArray);
VAR
  Found: BOOLEAN;
BEGIN
  Found := FALSE;
  WHILE (Curr <> 0) AND (NOT Found)
  DO
    IF Arr[Index].Key >= Arr[Curr].Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Arr[Curr].Next
      END
    ELSE
      Found := True
END;

PROCEDURE PutKeyToPlace(VAR Arr: RecArray; VAR First, Prev, Curr: Range);
BEGIN {Включение Arr[Index] в связанный список}
  READ(Arr[Index].Key);
  {Вставляем запись в связанный список}
  Prev := 0;
  Curr := First;
 {Найти значения Prev и Curr, если существуют такие что Arr[Prev].Key  <= Arr[Index].Key < Arr[Curr].Key}
  FindValuesPrevCurr(Prev, Curr, Arr);
  Arr[Index].Next := Curr;
  IF Prev = 0 {Первый элемент в списке}
  THEN
    First := Index
  ELSE
    Arr[Prev].Next := Index
END;

PROCEDURE TypeArr(VAR Arr: RecArray; VAR First: Range);
BEGIN
  Index := First;
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(Arr[Index].Key);  
      Index := Arr[Index].Next
    END;
  WRITELN
END;

BEGIN {InsertionSort}
  First := 0;
  Index := 0;
  WHILE NOT EOLN AND (Index <= Max)     
  DO
    BEGIN
      {Помещать запись в список, если позволяет пространство, иначе игнорировать и сообщать об ошибке}
      Index := Index + 1;
      IF Index <= Max
      THEN
        PutKeyToPlace(Arr, First, Prev, Curr)             
    END; {WHILE}
  {Печать списка начиная с Arr[First]}
  IF Index > Max
  THEN
    BEGIN
      READ(Extra);
      WRITELN('Сообщение содержит: ', Extra, '. Игнорируем.')
    END
  ELSE
    TypeArr(Arr, First)
END.  {InsertionSort}
