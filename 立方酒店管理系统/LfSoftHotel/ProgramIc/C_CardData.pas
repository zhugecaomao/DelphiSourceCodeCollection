unit C_CardData;

interface

uses
  SysUtils, Classes, DB, DBTables, IcCardDefine, StdCtrls;

type
  TCardData = class(TDataModule)
    tblSysData: TTable;
    qrySysData: TQuery;
    DatabaseUser: TDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetBh(const AFieldName,APrevStr: string): string;
    procedure ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
    function FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
    function FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
    function CheckYgqx(const AYgbh,ACzxm: string): Boolean;
    procedure InsertYjk(const AShlx,ABz: string;ARmb,AXyk,AZp: Currency);
    procedure ExecSql(const ASqlStr: string);
  end;

var
  CardData: TCardData;

implementation

{$R *.dfm}

procedure TCardData.ExecSql(const ASqlStr: string);
begin
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASqlStr);
    Prepare;
    ExecSQL;
  end;
end;

procedure TCardData.InsertYjk(const AShlx,ABz: string;ARmb,AXyk,AZp: Currency);
var
  s : string;
begin
  s := 'insert into YJK (D_RMB,D_XYK,D_ZP,D_CZYXM,D_YJRQ,D_YJSJ,D_YJLX,D_BZ) values '+
       '('+CurrToStr(ARmb)+','+CurrToStr(AXyk)+','+CurrToStr(AZp)+','+
       '"'+CZY.CzyXm+'","'+FormatDateTime('yyyy-mm-dd',Date)+'","'+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+
       '","'+AShlx+'","'+ABz+'")';
  ExecSql(s);
end;

function TCardData.CheckYgqx(const AYgbh,ACzxm: string): Boolean;
var
  s: string;
begin
  Result := False;
  if AYgbh='00000' then
  begin
    Result := True;
    Exit;
  end;
  with qrySysData do
  begin
    if Active then Active := False;
    s := 'select * from YGQX where D_YGBH="'+AYgbh+'"';
    SQL.Clear;
    SQL.Add(s);
    Open;
    if Locate('D_CZXM',ACzxm,[]) then
      Result := FieldByName('D_QX').AsBoolean;
    if not Result then
      ShowWarning('对不起，你没有权限操作该模块！');
    Close;
  end;
end;

function TCardData.FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
begin
  Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    Open;
    try
      if Locate(AFieldMc,AMc,[]) then
        Result := FieldByName(AFieldBh).AsString;
    finally
      Close;
    end;
  end;
end;

function TCardData.FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
begin
  Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    Open;
    try
      if Locate(AFieldBh,ABh,[]) then
        Result := FieldByName(AFieldMc).AsString;
    finally
      Close;
    end;
  end;
end;

procedure TCardData.ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
var
  s: string;
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    Open;
    try
      AComboBox.Items.Clear;
      First;
      while not Eof do
      begin
        s := FieldByName('D_DM').AsString+'|'+FieldByName(AFieldMc).AsString;
        AComboBox.Items.Add(s);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

function TCardData.GetBh(const AFieldName,APrevStr: string): string;
begin
  Result := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
{  Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'BH.DB';
    Open;
    try
      First;
      Edit;
      //FieldByName(AFieldName).AsString := APrevStr+AddDH(FieldByName(AFieldName).AsString);
      FieldByName(AFieldName).AsString := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
      Post;
      Result := FieldByName(AFieldName).AsString;
    finally
      Close;
    end;
  end;}
end;

procedure TCardData.DataModuleCreate(Sender: TObject);
begin
  DataBaseUser.Connected := True;
end;

end.
