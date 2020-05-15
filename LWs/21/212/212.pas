PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  FirstSymOfCpr = ' ';
  LastSymOfCpr = 'Z';
  CorrSetSymbols = [' ', 'A' .. 'Z'];
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [FirstSymOfCpr .. LastSymOfCpr] OF CHAR;
VAR
  Chpr: TEXT;
  Msg: Str;   
  Code: Chiper;
  LenOfStr: INTEGER;

PROCEDURE Initialize(VAR Code: Chiper; VAR Chpr: TEXT);
{Присвоить Code шифр замены}
VAR
  Symbol: CHAR;
BEGIN {Initialize}
  WHILE NOT EOF(Chpr)
  DO
    BEGIN
      IF NOT EOLN(Chpr)
      THEN
        BEGIN
          READ(Chpr, Symbol);
          IF ((NOT EOLN(Chpr)) AND (Symbol IN CorrSetSymbols))
          THEN
            READ(Chpr, Code[Symbol])
        END;
        READLN(Chpr)
    END
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
        IF S[Index] IN CorrSetSymbols
        THEN
          WRITE(Code[S[Index]])
        ELSE
          WRITE(S[Index])
    END;
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(Chpr, 'CHPR.TXT');
  RESET(Chpr);
  Initialize(Code, Chpr);
  CLOSE(Chpr);
  WHILE NOT EOF(INPUT)
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
