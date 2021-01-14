unit EncryptIt;

interface
USES
    Classes;
const
     C1 = 52845;
     C2 = 22719;

function Encrypt(const S: String; Key: Word): String;
function Decrypt(const S: String; Key: Word): String;
procedure EncryptFile(INFName, OutFName : String; Key : Word);
procedure DecryptFile(INFName, OutFName : String; Key : Word);

implementation

function Encrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
      begin
           Result[I] := char(byte(S[I]) xor (Key shr 8));
           Key := (byte(Result[I]) + Key) * C1 + C2;
      end;
  end;

function Decrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
      begin
           Result[I] := char(byte(S[I]) xor (Key shr 8));
           Key := (byte(S[I]) + Key) * C1 + C2;
      end;
  end;


procedure EncryptFile(INFName, OutFName : String; Key : Word);
VAR
   MS, SS : TMemoryStream;
   X : Integer;
   C : Byte;
begin
MS := TMemoryStream.Create;
SS := TMemoryStream.Create;
    TRY
       MS.LoadFromFile(INFName);
       MS.Position := 0;
       FOR X := 0 TO MS.Size - 1 DO
             begin
                  MS.Read(C, 1);
                  C := (C xor (Key shr 8));
                  Key := (C + Key) * C1 + C2;
                  SS.Write(C,1);
             end;
       SS.SaveToFile(OutFName);
    FINALLY
           SS.Free;
           MS.Free;
    end;
end;

procedure DecryptFile(INFName, OutFName : String; Key : Word);
VAR
   MS, SS : TMemoryStream;
   X : Integer;
   C, O : Byte;
begin
MS := TMemoryStream.Create;
SS := TMemoryStream.Create;
    TRY
       MS.LoadFromFile(INFName);
       MS.Position := 0;
       FOR X := 0 TO MS.Size - 1 DO
             begin
                  MS.Read(C, 1);
                  O := C;
                  C := (C xor (Key shr 8));
                  Key := (O + Key) * C1 + C2;
                  SS.Write(C,1);
             end;
       SS.SaveToFile(OutFName);
    FINALLY
           SS.Free;
           MS.Free;
    end;
end;

end.
