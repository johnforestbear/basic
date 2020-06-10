PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
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
{��������� Code ���� ������}
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
{������� ������� �� Code, ��������������� �������� �� S}
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
  {���������������� Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      LenOfStr := 0;
      WHILE NOT EOLN AND (LenOfStr < Len)
      DO
        BEGIN
          LenOfStr := LenOfStr + 1;
          READ(Msg[LenOfStr]);
          {��� �����}
          WRITE(Msg[LenOfStr])
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Encode(Msg, Code)
    END
END.  {Encryption}
