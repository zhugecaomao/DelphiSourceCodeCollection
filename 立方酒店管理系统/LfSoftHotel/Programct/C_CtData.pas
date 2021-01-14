unit C_CtData;

interface

uses
  SysUtils, Classes, DB, DBTables, StdCtrls, C_CtDefine;

type
  TCtData = class(TDataModule)
    tblCtxm: TTable;
    tblSysData: TTable;
    tblUserData: TTable;
    qrySum: TQuery;
    tblCtdm: TTable;
    qrySysData: TQuery;
    DatabaseUser: TDatabase;
    tblFldm: TTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetBh(const AFieldName,APrevStr: string): string;
    procedure SetCtzt(ACtzt: TCtzt);
    function IsValidCtbh(const ACtbh: string): string;
    function GetCtzt(const ACtbh: string): TCtzt;
    procedure InitCtzt(ACtzt: TCtzt);
    procedure UpdateCtbh(const ADcbh,ACtbhs,ACtbhd: string);
    procedure Dcmxbt(const ADcbhs,ADcbhd: string);
    procedure DeleteCtdc(const ADcbh: string);
    procedure UpdateCtdcbt(const ADcbhs,ADcbhd: string);
    procedure InsertBzc(const ADcbh,ACtbh: string;AXfrq: TDateTime;AYcje: Currency);
    procedure EditBzc(const ADcbh,ACtbh: string;AYcje: Currency);
    function SumJe(const ASqlStr: string): Currency;
    procedure ListMc(AComboBox: TComboBox;const ATableName,AFieldMc: string);
    procedure ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
    function FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
    function FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
    function CheckKfzt(const AKfbh: string) : string;
    function CheckYgqx(const AYgbh,ACzxm: string): Boolean;
    procedure UpdateDcmx(const ADcbh,ACtbhs,ACtbhd: string);
    function InsertNewCd(const ACdmc: string): string;
    //function GetCddm(const Str: string): string;
  end;

var
  CtData: TCtData;

implementation

uses hzpy;

{$R *.dfm}

//新增菜单 edit by ls. 20020726
function TCtData.InsertNewCd(const ACdmc: string): string;
var
  ACdbh: string;
  i    : Integer;
begin
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'CDDM';
    Filter := 'D_CDBH=''0*''';
    Filtered := True;
    Open;
    if Locate('D_CDMC',ACdmc,[]) then
    begin
      Result := FieldByName('D_CDBH').AsString;
    end
    else
    begin
      Last;
      ACdbh := FieldByName('D_CDBH').AsString;
      i := StrToInt(ACdbh);
      Inc(i);
      if (i>0)and(i<=9) then ACdbh := '000'+IntToStr(i)
      else
      if (i>=10)and(i<=99) then ACdbh := '00'+IntToStr(i)
      else
      if (i>=100)and(i<=999) then ACdbh := '0'+IntToStr(i)
      else
        raise Exception.Create('自定义菜单编号定义已满，请删除一些自定义餐单！');
      Insert;
      FieldByName('D_CDBH').AsString := ACdbh;
      FieldByName('D_CDMC').AsString := ACdmc;
      FieldByName('D_MJ').AsString   := 'T';
      FieldByName('D_XMBH').AsString := XMBH_SP;
      FieldByName('D_DM').AsString   := GetPy1(ACdmc);
      Post;
      Result := FieldByName('D_CDBH').AsString;
    end;
    Close;
    Filter := '';
    Filtered := False;
  end;
end;


//检查员工权限
function TCtData.CheckYgqx(const AYgbh,ACzxm: string): Boolean;
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

//查找名称
function TCtData.FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
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

//检查客房状态
function TCtData.CheckKfzt(const AKfbh: string) : string;
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'KFZT';
    Open;
    try
      if FindKey([AKfbh]) then
        Result := FieldByName('D_KFZT').AsString
      else
        Result := '';
    finally
      Close;
    end;
  end;
end;

//查找编号
function TCtData.FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
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

procedure TCtData.ListMc(AComboBox: TComboBox;const ATableName,AFieldMc: string);
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
        AComboBox.Items.Add(FieldByName(AFieldMc).AsString);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TCtData.ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
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

//求和
function TCtData.SumJe(const ASqlStr: string): Currency;
begin
  with qrySum do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(ASqlStr);
    Open;
    if Fields[0].IsNull then Result := 0
    else
      Result := Fields[0].AsCurrency;
    Close;
  end;
end;

//编辑标准菜
procedure TCtData.EditBzc(const ADcbh,ACtbh: string;AYcje: Currency);
begin
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'DCMX';
    Filter    := 'D_DCBH='''+ADcbh+''' and D_CTBH='''+ACtbh+'''';
    Filtered  := True;

    Open;
    if Locate('D_CDBH',CDBH_BZ,[]) then
    begin
      Edit;
      FieldByName('D_DJ').AsCurrency := AYcje;
      Post;
    end;

    Filter   := '';
    Filtered := False;
    Close;
  end;
end;

//添加标准菜
procedure TCtData.InsertBzc(const ADcbh,ACtbh: string;AXfrq: TDateTime;AYcje: Currency);
begin
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'DCMX';
    Filter    := 'D_DCBH='''+ADcbh+''' and D_CTBH='''+ACtbh+'''';
    Filtered  := True;
    Open;
    if Locate('D_CDBH',CDBH_BZ,[]) then
    begin
      Edit;
      FieldByName('D_DJ').AsCurrency := AYcje;
      Post;
    end
    else
    begin
      Insert;
      FieldByName('D_HH').AsString   := GetHh;
      FieldByName('D_DCBH').AsString := ADcbh;
      FieldByName('D_CTBH').AsString := ACtbh;
      FieldByName('D_XMBH').AsString := XMBH_SP;
      FieldByName('D_CDBH').AsString := CDBH_BZ;
      FieldByName('D_CDMC').AsString := CDMC_BZ;
      FieldByName('D_XFSL').AsFloat  := 1;
      FieldByName('D_DJ').AsCurrency := AYcje;
      FieldByName('D_XFRQ').AsDateTime := AXfrq;
      Post;
    end;
    Close;
    Filter   := '';
    Filtered := False;
  end;
end;

//餐厅并台
procedure TCtData.UpdateCtdcbt(const ADcbhs,ADcbhd: string);
var
  s : string;
begin
  with qrySysData do
  begin
    s := 'update CTDC set D_DCBH = "'+ADcbhd+'" where (D_DCBH="'+ADcbhs+'")';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;

{  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'CTDC';
    Open;
    First;
    while not Eof do
    begin
      if FieldByName('D_DCBH').AsString = ADcbhs then
      begin
        Edit;
        FieldByName('D_DCBH').AsString := ADcbhd;
        Post;
      end;
      Next;
    end;}
    {
    if FindKey([ADcbh,'0']) then
    begin
      Edit;
      FieldByName('D_KRSL').AsInteger :=
        FieldByName('D_KRSL').AsInteger + ACtzt.AKrsl;
      FieldByName('D_BZ').AsString :=
        FieldByName('D_BZ').AsString + ACtzt.ACtmc +'并入;';
      Post;
    end;}
    //Close;
  //end;
end;

//删除餐厅定餐记录
procedure TCtData.DeleteCtdc(const ADcbh: string);
var
  s : string;
begin
  with qrySysData do
  begin
    s := 'delete from CTDC where D_CTBH = "'+ADcbh+'"';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;

{  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'CTDC';
    Filter    := 'D_DCBH='''+ADcbh+'''';
    Filtered  := True;

    Open;
    First;
    while not Eof do
      Delete;
    Close;
  end;}
end;

//点菜明细并台
procedure TCtData.Dcmxbt(const ADcbhs,ADcbhd: string);
var
  s : string;
begin
  with qrySysData do
  begin
    s := 'update DCMX set D_DCBH = "'+ADcbhd+'" where (D_DCBH="'+ADcbhs+'")';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;

{  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'DCMX';
    Open;
    First;
    while not Eof do
    begin
      if FieldByName('D_DCBH').AsString = ADcbhs then
      begin
        Edit;
        FieldByName('D_DCBH').AsString := ADcbhd;
        Post;
      end;
      Next;
    end;
    Close;
  end;}
end;

procedure TCtData.UpdateDcmx(const ADcbh,ACtbhs,ACtbhd: string);
var
  s : string;
begin
  with qrySysData do
  begin
    s := 'update DCMX set D_CTBH = "'+ACtbhd+'" where (D_DCBH="'+ADcbh+'")and(D_CTBH="'+ACtbhs+'")';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;

{  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'DCMX';
    Filter    := 'D_DCBH='''+ADcbh+''' and D_CTBH='''+ACtbhs+'''';
    Filtered  := True;
    Open;
    First;
    while not Eof do
    begin
      Edit;
      FieldByName('D_CTBH').AsString := ACtbhd;
      Post;
      //Next;
    end;
    Close;
    Filter   := '';
    Filtered := False;
  end;}
end;

procedure TCtData.UpdateCtbh(const ADcbh,ACtbhs,ACtbhd: string);
var
  s : string;
begin
  with qrySysData do
  begin
    s := 'update CTDC set D_CTBH = "'+ACtbhd+'" where (D_DCBH="'+ADcbh+'")and(D_CTBH="'+ACtbhs+'")';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;
{  with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'CTDC';
    Filter    := 'D_DCBH='''+ADcbh+''' and D_CTBH='''+ACtbhs+'''';
    Filtered  := True;
    Open;
    First;
    while not Eof do
    begin
      Edit;
      FieldByName('D_CTBH').AsString := ACtbhd;
      Post;
      //Next;
    end;
    Close;
    Filter   := '';
    Filtered := False;
  end;}
end;

//初始化餐厅状态
procedure TCtData.InitCtzt(ACtzt: TCtzt);
begin
  ACtzt.ACtzt := CTZT_OK;
  ACtzt.ADcbh := '';
  ACtzt.AKrxm := '';
  ACtzt.AKrsl := 0;
  ACtzt.AXfrq := 0;
  ACtzt.AXfsj := 0;
  ACtzt.AJzrq := 0;
  ACtzt.AJzsj := 0;
  SetCtzt(ACtzt);
end;

//获取餐厅状态
function TCtData.GetCtzt(const ACtbh: string): TCtzt;
begin
  Result.ACtbh := ACtbh;
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'CTZT';
    Open;
    if FindKey([ACtbh]) then
    begin
      Result.ACtmc := FieldByName('D_CTMC').AsString;
      Result.ACtzt := FieldByName('D_CTZT').AsString;
      Result.ADcbh := FieldByName('D_DCBH').AsString;
      Result.AKrxm := FieldByName('D_KRXM').AsString;
      Result.AKrsl := FieldByName('D_KRSL').AsInteger;
      Result.AXfrq := FieldByName('D_XFRQ').AsDateTime;
      Result.AXfsj := FieldByName('D_XFSJ').AsDateTime;
      Result.AJzrq := FieldByName('D_JZRQ').AsDateTime;
      Result.AJzsj := FieldByName('D_JZSJ').AsDateTime;
    end;
    Close;
  end;
end;

//是否有效
function TCtData.IsValidCtbh(const ACtbh: string): string;
begin
  Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'CTDM';
    Open;
    if FindKey([ACtbh]) then
      Result := FieldByName('D_CTMC').AsString;
  end;
end;

//设置餐厅状态
procedure TCtData.SetCtzt(ACtzt: TCtzt);
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'CTZT';
    Open;
    if FindKey([ACtzt.ACtbh]) then
    begin
      Edit;
      FieldByName('D_CTZT').AsString   := ACtzt.ACtzt;
      FieldByName('D_DCBH').AsString   := ACtzt.ADcbh;
      FieldByName('D_XFRQ').AsDateTime := ACtzt.AXfrq;
      FieldByName('D_XFSJ').AsDateTime := ACtzt.AXfsj;
      FieldByName('D_KRSL').AsInteger  := ACtzt.AKrsl;
      FieldByName('D_KRXM').AsString   := ACtzt.AKrxm;
      FieldByName('D_JZRQ').AsDateTime := ACtzt.AJzrq;
      FieldByName('D_JZSJ').AsDateTime := ACtzt.AJzsj;
      Post;
    end;
    Close;
  end;
end;

//获取编号
function TCtData.GetBh(const AFieldName,APrevStr: string): string;
begin
  Result := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
  {Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'BH';
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

procedure TCtData.DataModuleCreate(Sender: TObject);
begin
  DatabaseUser.Connected := True;
end;

end.
