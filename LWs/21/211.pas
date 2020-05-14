PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  FirstSymOfCpr = ' ';
  LastSymOfCpr = 'Z';
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [FirstSymOfCpr .. LastSymOfCpr] OF CHAR;
VAR
  Msg: Str;   
  Code: Chiper;
  LenOfStr: INTEGER;

PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code[' '] := '@';
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := 'W';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'R';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := 'O';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := 'L';
  Code['P'] := 'K';
  Code['Q'] := 'J';
  Code['R'] := 'I';
  Code['S'] := 'H';
  Code['T'] := 'G';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'D';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A'
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR Code: Chiper);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  IF LenOfStr = 0
  THEN
    WRITE('empty line above')
  ELSE
    BEGIN
      FOR Index := 1 TO LenOfStr
      DO
        IF S[Index] IN [' ', 'A' .. 'Z']
        THEN
          WRITE(Code[S[Index]])
        ELSE
          WRITE(S[Index])
    END;
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      LenOfStr := 0;
      WHILE NOT EOLN AND (LenOfStr < Len)
      DO
        BEGIN
          LenOfStr := LenOfStr + 1;
          READ(Msg[LenOfStr]);
          {эхо ввода}
          WRITE(Msg[LenOfStr])
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg, Code)
    END
END.  {Encryption}
