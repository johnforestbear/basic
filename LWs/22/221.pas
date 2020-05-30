PROGRAM InsertionSort(INPUT, OUTPUT);
{��������� ������� �� INPUT}
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

PROCEDURE FindValuesPrevCurr(VAR Arr: RecArray; VAR Prev, Curr: Range);
VAR
  Found: BOOLEAN;
BEGIN
  Found := FALSE;
  WHILE (Curr <> ListEnd) AND (NOT Found)
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

PROCEDURE PutKeyToPlace(VAR Arr: RecArray; VAR First, Prev, Curr: Range; VAR Index: INTEGER);
BEGIN {��������� Arr[Index] � ��������� ������}
  READ(Arr[Index].Key);
  {��������� ������ � ��������� ������}
  Prev := 0;
  Curr := First;
 {����� �������� Prev � Curr, ���� ���������� ����� ��� Arr[Prev].Key  <= Arr[Index].Key < Arr[Curr].Key}
  FindValuesPrevCurr(Arr, Prev, Curr);
  Arr[Index].Next := Curr;
  IF Prev = 0 {������ ������� � ������}
  THEN
    First := Index
  ELSE
    Arr[Prev].Next := Index
END;

PROCEDURE TypeArr(VAR Arr: RecArray; VAR First: Range);
VAR
  Index: INTEGER;
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
  First := ListEnd;
  Index := ListEnd;
  WHILE NOT EOLN AND (Index <= Max)     
  DO
    BEGIN
      {�������� ������ � ������, ���� ��������� ������������, ����� ������������ � �������� �� ������}
      Index := Index + 1;
      IF Index <= Max
      THEN
        PutKeyToPlace(Arr, First, Prev, Curr, Index)             
    END; {WHILE}
  {������ ������ ������� � Arr[First]}
  IF Index > Max
  THEN
    BEGIN
      READ(Extra);
      WRITELN('��������� ��������: ', Extra, '. ����������.')
    END
  ELSE
    TypeArr(Arr, First)
END.  {InsertionSort}