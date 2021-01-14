unit C_JfData;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TJfData = class(TDataModule)
    tblBasicFmt: TTable;
    tblNewData: TTable;
    tblJfConfig: TTable;
    tblFare: TTable;
    tblShfare: TTable;
    tblOldData: TTable;
    tblUserData: TTable;
    tblDhf: TTable;
    HotelDatabase: TDatabase;
  private
    { Private declarations }

  public
    { Public declarations }
    function FindRoom(const AClass: string): string;
    function IfPass(const APassword: string): Boolean;
  end;

var
  JfData: TJfData;

implementation

{$R *.dfm}
function TJfData.IfPass(const APassword: string): Boolean;
begin
  Result := False;
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'JFCONFIG';
    Open;
    First;
    if APassword=FieldByName('PASSWORD').AsString then
      Result := True;
    Close;
  end;
end;

function TJfData.FindRoom(const AClass: string): string;
begin
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'SIGCODE';
    Open;
    if Locate('CLASS',AClass,[]) then
      Result := FieldByName('ROOM').AsString
    else
      Result := '';
    Close;
  end;
end;

end.
