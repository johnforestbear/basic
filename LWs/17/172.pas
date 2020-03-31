PROGRAM StringToInt(INPUT, OUTPUT);
VAR
  Num: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
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
{Преобразует строку цифр из файла до первого нецифрового символа, в соответствующее целое число N}
VAR
  D: INTEGER;
  Overflow: BOOLEAN;
BEGIN { ReadNumber }
  Num := 0;
  D := 0;
  Overflow := FALSE;
  WHILE (NOT EOLN(InpF)) AND (NOT Overflow) AND (D <> -1)
  DO
    BEGIN
      ReadDigit(InpF, D);
      IF D <> -1
      THEN
        BEGIN
          Overflow := (Num * 10 + D > MAXINT);
          IF NOT Overflow
          THEN
            Num := Num * 10 + D
        END
    END;
  IF Overflow
  THEN
    Num := -1
END; {ReadNumber} 
BEGIN {StringToInt}
  ReadNumber(INPUT, Num);
  WRITELN(Num)
END. {StringToInt}
