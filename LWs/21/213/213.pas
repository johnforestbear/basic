PROGRAM Decryption(INPUT, OUTPUT);
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
  Decoder: Chiper;
  LenOfStr: INTEGER;

PROCEDURE Initialize(VAR Decoder: Chiper; VAR Chpr: TEXT);
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
            READ(Chpr, Decoder[Symbol])
        END;
        READLN(Chpr)
    END
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; VAR Decoder: Chiper);
{Выводит символы из Decoder, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Decode}
  IF LenOfStr = 0
  THEN
    WRITE('empty line above')
  ELSE
    BEGIN
      FOR Index := 1 TO LenOfStr
      DO
        IF Decoder[S[Index]] IN CorrSetSymbols
        THEN
          WRITE(Decoder[S[Index]])
        ELSE
          WRITE(S[Index])
    END;
  WRITELN
END;  {Decode}

BEGIN {Decryption}
  {Инициализировать Decoder}
  ASSIGN(Chpr, 'CHPR.TXT');
  RESET(Chpr);
  Initialize(Decoder, Chpr);
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
      Decode(Msg, Decoder)
    END
END.  {Decryption}
