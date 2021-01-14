
{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}

unit C_HotelData;

interface

uses
  SysUtils, Classes, DB, DBTables, StdCtrls, C_Define, DBCtrls, Forms, DateUtils;

type
  THotelData = class(TDataModule)
    tblSysData: TTable;
    tblUserdata: TTable;
    qryUserData: TQuery;
    tblBMDM: TTable;
    tblCTDM: TTable;
    tblDQDM: TTable;
    tblFLDM: TTable;
    tblFXDM: TTable;
    tblGBDM: TTable;
    tblHCDM: TTable;
    tblKFDM: TTable;
    tblLCDM: TTable;
    tblMZDM: TTable;
    tblQZDM: TTable;
    tblXMDM: TTable;
    tblXYK: TTable;
    tblZJDM: TTable;
    tblKHDA: TTable;
    tblBqj: TTable;
    tblKfzt: TTable;
    tblKrxx: TTable;
    tblKryj: TTable;
    tblKrzd: TTable;
    tblEwf: TTable;
    BatchMove1: TBatchMove;
    tblLctj: TTable;
    tblLctjda: TTable;
    qrySysData: TQuery;
    tblCtdc: TTable;
    tblCtdcda: TTable;
    tblDcmx: TTable;
    tblDcmxda: TTable;
    tblYdxx: TTable;
    qryDhf: TQuery;
    tblXxdc: TTable;
    DatabaseUser: TDatabase;
    tblDhfOld: TTable;
    tblKrzdcx: TTable;
    tblYssj: TTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  CheckKfzt(const AKfbh: string) : string;
    function  GetBh(const AFieldName,APrevStr: string): string;
    function  FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
    function  FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
    function  FindUserBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
    //function IsExists(const AValue,ATableName,AFieldName: string): Boolean;
    //function IsValidYd(AXfxm: TXFXM;ADate: TDateTime): Boolean;
    function  IsValidHcyd(const AHcbh,ASjdm: string;ADate: TDateTime): Boolean;
    function  IsValidCyyd(const ACtbh,ASjdm: string;ADate: TDateTime): Boolean;
    function  IsValidKfyd(const AKfbh,AYdbh: string;ADdrq,ALdrq: TDateTime): Boolean;
    procedure ListMc(AComboBox: TComboBox;const ATableName,AFieldMc: string);
    procedure ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
    procedure ListDbDm(ADBComboBox: TDBComboBox;const ATableName,AFieldMc: string);
    procedure UpdateBqj(const AKfbh: string;ABqj: Integer;ASjfj,AJjfj: Currency);
    procedure UpdateJjfj(const AKfbh: string;ABqj: Integer;AJjfj: Currency);
    function  SumJe(const ASqlStr: string): Currency;
    function  SumSysJe(const ASqlStr: string): Currency;
    function  GetKfxx(const AKfbh: string): TKFXX;
    function  GetKfxx1(const AKfbh: string): TKFXX;
    function  GetMaxZdhh(const AZdbh: string): Integer;
    procedure UpdateEwfDbf(const AJzbh,AKrxm: string;AEwf: Currency;AJzrq,AJzsj: TDateTime);
    procedure InitKfzt(const AKfbh: string);
    procedure InitKfztOK(const AKfbh: string);
    procedure ClearKfzt(const AKfbh: string);
    procedure UpdateKrxxJz(const AKrbh: string;ALdrq,ALdsj: TDateTime);
    procedure BakData(const ASqlStr,ATableName: string);
    procedure EmptyData(const ASqlStr: string);
    procedure SetKfzt(const AKfbh,AKfzt: string);
    function  GetKfbh(const AKrbh: string):string;
    function  GetZdbh(const AKrbh: string):string;
    procedure BakTable(S,D: TTable);
    function  GetTdxx(const AKrbh: string): TTdxx;
    function  IsTdtf(const AKrbh: string): Boolean;
    function  GetYjxx(const AYjbh: string): TYjxx;
    function  Ldcs(const AKrxm: string): Integer;
    function  IsHmd(const AKrxm,AZjhm: string): string;
    procedure YgkfAppend(const ACzyxm,AKfbh,AKrxm: string;ASjfj: Currency;ADdrq,ADdsj: TDateTime);
    function  GetDhf(const AKfbh: string;ADdrq,ADdsj: TDateTime): Currency;
    function  GetDhf1(const AKfbh: string;ADdrq,ADdsj: TDateTime): Currency;
    function  CheckYgqx(const AYgbh,ACzxm: string): Boolean;
    function  GetFirstRec(const ATableName,AFieldBh,AFieldMc: string): TRecInfo;
    procedure ListTdmc(AComboBox: TComboBox);
    function  GetXfxx(const AZdbh: string): TXfxx;
    function  SumCount(const ASqlStr: string): Integer;
    procedure ExecSql(const ASqlStr: string);
    procedure InsertYjk(const AShlx,ABz: string;ARmb,AXyk,AZp: Currency);
    procedure InsertKrzd(const AZdbh,AZdlb,AKrbh,AYjbh,AKfbh,AXmbh,AJzbz,AJsbz,ABmbh,ABz: string;AHh: Integer;AXfje,AYhje: Currency);
    procedure AddKrzdZdXfje(const AZdbh: string;AXfje: Currency);
    procedure BakDhf;
    procedure EmptyDhf;
    function GetDdts(const aKfbh: string): string;
    procedure GetYssj(var HH,NN,SS: Word);
    function FindValue(const aSqlStr: string): string;
    function FindCurrency(const aSqlStr: string): Currency;
    function GetMaxId(const aSqlStr: string):Integer;
  end;

var
  HotelData: THotelData;

implementation

{$R *.dfm}
function THotelData.GetMaxId(const aSqlStr: string): Integer;
begin
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSqlStr);
    Prepare;
    Open;
    if Fields[0].IsNull then Result := 1
    else Result := Fields[0].AsInteger+1;
    Close;
  end;

end;

function THotelData.FindCurrency(const aSqlStr: string): Currency;
begin
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSqlStr);
    Prepare;
    Open;
    if Fields[0].IsNull then Result := 0
    else Result := Fields[0].AsCurrency;
    Close;
  end;
end;

function THotelData.FindValue(const aSqlStr: string): string;
begin
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSqlStr);
    Prepare;
    Open;
    if Fields[0].IsNull then Result := ''
    else Result := Fields[0].AsString;
    Close;
  end;
end;

//edit by ls.2003.01.10
procedure THotelData.GetYssj(var HH,NN,SS: Word);
var
  aYssj: string;
begin
  tblYssj.Open;
  if tblYssj.IsEmpty then
  begin
    aYssj := '233000';
  end
  else
  begin
    tblYssj.Last;
    aYssj := tblYssj.FieldByName('D_YSSJ').AsString;
  end;
  HH := StrToInt(Copy(aYssj,1,2));
  NN := StrToInt(Copy(aYssj,3,2));
  SS := StrToInt(Copy(aYssj,5,2));
end;

function THotelData.GetDdts(const aKfbh: string): string;
var
  aKrbh: string;
  aDdrq: TDateTime;
  aTs : Integer;
begin
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KFZT where D_KFBH="'+aKfbh+'"');
    Prepare;
    Open;
    aKrbh := FieldByName('D_KRBH').AsString;
  end;
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRXX where D_KRBH="'+aKrbh+'"');
    Prepare;
    Open;
    if not IsEmpty then
      aDdrq := FieldByName('D_DDRQ').AsDateTime
    else
      aDdrq := Date;
  end;
  aTs := DaysBetween(Date,aDdrq);
  if (aTs = 0)or(aTs = 1) then
    Result := ''
  else if (aTs > 26) then
    Result := 'Z'
  else
    Result := Chr(64+aTs);
end;

//备份电话费
procedure THotelData.EmptyDhf;
var
  s : string;
begin
  with qryDhf do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    //edit by ls 2002.12.28
    s := 'delete from DHFDATA.DBF where (SDate<:DD) or ((SDate=:DD)and(STime<"23:00"))';
    SQL.Add(s);
    ParamByName('DD').AsDate := Date;
    Prepare;
    ExecSQL;
  end;
end;

//清空当前电话费
procedure THotelData.BakDhf;
var
  s : string;
begin
  with qryDhf do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    s := 'select * from DHFDATA.DBF where (SDate<:DD) or ((SDate=:DD)and(STime<"23:00"))';
    SQL.Add(s);
    ParamByName('DD').AsDate := Date;
    Open;
  end;
  with tblDhfOld do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    TableName := 'DHFOLD.DBF';
    Open;
  end;
  qryDhf.First;
  while not qryDhf.Eof do
  begin
    tblDhfOld.Append;
    tblDhfOld.FieldByName('ROOM').AsString := qryDhf.FieldByName('ROOM').AsString;
    tblDhfOld.FieldByName('SDATE').AsDateTime := qryDhf.FieldByName('SDATE').AsDateTime;
    tblDhfOld.FieldByName('STIME').AsString := qryDhf.FieldByName('STIME').AsString;
    tblDhfOld.FieldByName('NUMBER').AsString := qryDhf.FieldByName('NUMBER').AsString;
    tblDhfOld.FieldByName('LAST').AsFloat := qryDhf.FieldByName('LAST').AsFloat;
    tblDhfOld.FieldByName('PLACE').AsString := qryDhf.FieldByName('PLACE').AsString;
    tblDhfOld.FieldByName('UNIT').AsFloat := qryDhf.FieldByName('UNIT').AsFloat;
    tblDhfOld.FieldByName('FEE').AsFloat := qryDhf.FieldByName('FEE').AsFloat;
    tblDhfOld.FieldByName('SVC_FEE').AsFloat := qryDhf.FieldByName('SVC_FEE').AsFloat;
    tblDhfOld.FieldByName('ADDI_FEE').AsFloat := qryDhf.FieldByName('ADDI_FEE').AsFloat;
    tblDhfOld.FieldByName('TOTAL').AsFloat := qryDhf.FieldByName('TOTAL').AsFloat;
    tblDhfOld.FieldByName('FLTY').AsFloat := qryDhf.FieldByName('FLTY').AsFloat;
    tblDhfOld.Post;
    qryDhf.Next;
  end;
  tblDhfOld.Close;
  qryDhf.Close;
end;

procedure THotelData.AddKrzdZdXfje(const AZdbh: string;AXfje: Currency);
var
  s : string;
begin
  s := 'update KRZD set D_XFJE = D_XFJE+'+CurrToStr(AXfje)+' where (D_ZDBH="'+AZdbh+'")and(D_HH=0)';
  Execsql(s);
end;

procedure THotelData.InsertKrzd(const AZdbh,AZdlb,AKrbh,AYjbh,AKfbh,AXmbh,AJzbz,AJsbz,ABmbh,ABz: string;AHh: Integer;AXfje,AYhje: Currency);
var
  s : string;
begin
  s := 'insert into KRZD (D_ZDBH,D_ZDLB,D_KRBH,D_YJBH,D_KFBH,D_XMBH,D_JZBZ,D_JSBZ,D_BMBH,D_BZ,D_HH,D_XFJE,D_YHJE,D_XFRQ,D_XFSJ) values '+
       '("'+AZdbh+'","'+AZdlb+'","'+AKrbh+'","'+AYjbh+'","'+AKfbh+'","'+AXmbh+'","'+AJzbz+
       '","'+AJsbz+'","'+ABmbh+'","'+ABz+'",'+IntToStr(AHh)+','+CurrToStr(AXfje)+','+CurrToStr(AYhje)+
       ',"'+FormatDateTime('yyyy-mm-dd',Date)+'","'+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+'")';
  Execsql(s);
end;

procedure THotelData.InsertYjk(const AShlx,ABz: string;ARmb,AXyk,AZp: Currency);
var
  s : string;
begin
  s := 'insert into YJK (D_RMB,D_XYK,D_ZP,D_CZYXM,D_YJRQ,D_YJSJ,D_YJLX,D_BZ) values '+
       '('+FormatFloat('0.00',ARmb)+','+FormatFloat('0.00',AXyk)+','+FormatFloat('0.00',AZp)+','+
       '"'+CZY.CzyXm+'","'+FormatDateTime('yyyy-mm-dd',Date)+'","'+FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)+
       '","'+AShlx+'","'+ABz+'")';
  ExecSql(s);
end;

procedure THotelData.ExecSql(const ASqlStr: string);
begin
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASqlStr);
    Prepare;
    ExecSQL;
  end;
end;

function THotelData.SumCount(const ASqlStr: string): Integer;
begin
  with qryUserData do
  begin
    SQL.Clear;
    SQL.Add(ASqlStr);
    Open;
    if Fields[0].IsNull then Result := 0
    else Result := Fields[0].AsInteger;
    Close;
  end;
end;

function THotelData.GetXfxx(const AZdbh: string): TXfxx;
var
  s: string;
  AYjje: Currency;
begin
  Result.AZdbh := AZdbh;
  s := 'select sum(D_XFJE) from KRZD where (D_XMBH<>"'
      +XMBH_YJK
      +'")and(D_JZBZ<>"'+JZ_YX+'")and(D_HH<>0)and(D_ZDBH="'+AZdbh+'")';
  Result.AXfje := SumJe(s);
  {s := 'select sum(D_XFJE) from KRZD where (D_XMBH="'
      +XMBH_YJK
      +'")and(D_HH<>0)and(D_ZDBH="'+AZdbh+'")';
  AYjk := SumJe(s);}
  s := 'select sum(D_XFJE) from KRZD where (D_JZBZ="'
      +JZ_YX
      +'")and(D_HH<>0)and(D_ZDBH="'+AZdbh+'")';
  AYjje := SumJe(s);

  Result.AYjje := 0-AYjje;
end;

procedure THotelData.ListTdmc(AComboBox: TComboBox);
begin
  with tblKrxx do
  begin
    try
      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      AComboBox.Items.Clear;

      Filter   := 'D_KRLX=''T''';
      Filtered := True;

      First;
      while not Eof do
      begin
        AComboBox.Items.Add(tblKrxx.FIeldbyName('D_KRXM').AsString);
        Next;
      end;
    finally
      Filter   := '';
      Filtered := False;
      Close;
    end;
  end;
end;

function THotelData.GetFirstRec(const ATableName,AFieldBh,AFieldMc: string): TRecInfo;
begin
  with tblSysData do
  begin
    try
      if Active then Active := False;
      TableName := ATableName;
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开'+ATableName+'出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
    if not IsEmpty then
    begin
      First;
      Result.ABh := FieldByName(AFieldBh).AsString;
      Result.AMc := FieldByName(AFieldMc).AsString;
    end
    else
    begin
      Result.ABh := '';
      Result.AMc := '';
    end;
    Close;
  end;
end;

//通过员工编号、操作项目 检查员工权限 具有权限返回True
function THotelData.CheckYgqx(const AYgbh,ACzxm: string): Boolean;
var
  s: string;
begin
  Result := False;

  if AYgbh=SYSTEM_BH then //如果是系统管理员，则永远返回True
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

    try
      Open;

      if Locate('D_CZXM',ACzxm,[]) then   //察看操作项目
        Result := FieldByName('D_QX').AsBoolean;
      if not Result then
        ShowWarning('对不起，你没有权限操作该模块！');

      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开YGQX.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;
end;

//通过客人编号、到店日期、到店时间 获取电话费
function THotelData.GetDhf(const AKfbh: string;Addrq,Addsj: TDateTime): Currency;
var
  s: string;
  ARoom: string;
  ASj: string;
begin
  //连接旧的程序
  if Length(Akfbh)=3 then
  //if Copy(AKfbh,1,2) = '10' then
    //ARoom := '1' + Copy(AKfbh,3,3)
    ARoom := '1' + AKfbh
  else
    //ARoom := Copy(AKfbh,1,1) + Copy(AKfbh,3,3);
    ARoom := AKfbh;
  ASj := FormatDateTime('hh:nn',ADdsj);
  with qryDhf do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    //edit by ls.20021030
    {s := 'select sum(TOTAl) from DHFDATA.DBF where (ROOM = "'
        +ARoom+'")and((SDate>:BD)or((SDate=:BD)and(STime>"'+ASj+'")))';}
    s := 'select sum(TOTAl) from DHFDATA.DBF where (ROOM = "'
        +ARoom+'")and((SDate>:BD)or((SDate=:BD)and(STime>"'+ASj+'")))';

    SQL.Add(s);
    ParamByName('BD').DataType := ftDate;
    ParamByName('BD').AsDate   := ADdrq;
    try
      Open;
      if Fields[0].IsNull then Result := 0
      else
        Result := Fields[0].AsCurrency;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开DHFDATA.DBF出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;

  //新程序
  {ASj := FormatDateTime('yyyymmdd',ADdrq)+FormatDateTime('hhnnss',ADdsj);

  with qryDhf do
  begin
    if Active then Active := False;
    //DatabaseName := JF_DIR;     //获取电话费数据库的路径
    SQL.Clear;
    s := 'select sum(TOTAL) from DHF where (ROOM="'
        +AKfbh+'")and((SDATE+STIME)>"'+ASj+'")';
    SQL.Add(s);

    try
      Open;
      if Fields[0].IsNull then Result := 0
      else
        Result := Fields[0].AsCurrency;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开DHF.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;}
end;

//夜审时获取电话费 23:00以前
function THotelData.GetDhf1(const AKfbh: string;Addrq,Addsj: TDateTime): Currency;
var
  s: string;
  ARoom: string;
  ASj: string;
begin
  //连接旧的程序
  if Length(Akfbh)=3 then
  //if Copy(AKfbh,1,2) = '10' then
    //ARoom := '1' + Copy(AKfbh,3,3)
    ARoom := '1' + AKfbh
  else
    //ARoom := Copy(AKfbh,1,1) + Copy(AKfbh,3,3);
    ARoom := AKfbh;
  ASj := FormatDateTime('hh:nn',ADdsj);
  with qryDhf do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    s := 'select sum(TOTAl) from DHFDATA.DBF where (ROOM = "'
        +ARoom+'")and((SDate>:BD)or((SDate=:BD)and(STime>="'+ASj+'")and(STime<="23:00")))';
    SQL.Add(s);
    ParamByName('BD').DataType := ftDate;
    ParamByName('BD').AsDate   := ADdrq;
    try
      Open;
      if Fields[0].IsNull then Result := 0
      else
        Result := Fields[0].AsCurrency;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开DHFDATA.DBF出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;

  //新程序
  {ASj := FormatDateTime('yyyymmdd',ADdrq)+FormatDateTime('hhnnss',ADdsj);

  with qryDhf do
  begin
    if Active then Active := False;
    //DatabaseName := JF_DIR;     //获取电话费数据库的路径
    SQL.Clear;
    s := 'select sum(TOTAL) from DHF where (ROOM="'
        +AKfbh+'")and((SDATE+STIME)>"'+ASj+'")';
    SQL.Add(s);

    try
      Open;
      if Fields[0].IsNull then Result := 0
      else
        Result := Fields[0].AsCurrency;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开DHF.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;}
end;

//添加员工开房情况
procedure THotelData.YgkfAppend(const ACzyxm,AKfbh,AKrxm: string;ASjfj: Currency;ADdrq,ADdsj: TDateTime);
var
  s : string;
begin
  s := 'insert into YGKF (D_CZYXM,D_KFRQ,D_KFSJ,D_KFBH,D_KRXM,D_SJFJ) values '+
       '("'+ACzyxm+'","'+FormatDateTime('yyyy-mm-dd',ADdrq)+'","'+FormatDateTime('yyyy-mm-dd hh:nn:ss',ADdsj)+
       '","'+AKfbh+'","'+AKrxm+'",'+CurrToStr(ASjfj)+
       ')';
  ExecSql(s); 
  {with tblUserData do
  begin
    if Active then Active := False;
    TableName := 'YGKF';

    try
      Open;
      Append;
      FieldByName('D_CZYXM').AsString  := ACzyxm;
      FieldByName('D_KFRQ').AsDateTime := Date;
      FieldByName('D_KFSJ').AsDateTime := Time;
      FieldByName('D_KFBH').AsString   := AKfbh;
      FieldByName('D_KRXM').AsString   := AKrxm;
      FieldByName('D_SJFJ').AsCurrency := ASjfj;
      Post;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开YGKF.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;}
end;

//判断客人姓名和身份证号码是否在黑名单中，如果是则返回True
function THotelData.IsHmd(const AKrxm,AZjhm: string): string;
begin
  Result := '';

  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'HMD';

    try
      Open;
      if Locate('D_XM',AKrxm,[]) then
        Result := '姓名：'+FieldByName('D_XM').AsString+#13#10
                 +'身份证号码：'+FieldByName('D_ZJHM').AsString+#13#10
                 +'年龄：'+FieldByName('D_NL').AsString+#13#10
                 +'家庭地址：'+FieldByName('D_JTDZ').AsString+#13#10
                 +'备注：'+FieldByName('D_BZ').AsString;
      if Locate('D_ZJHM',AZjhm,[]) then
        Result := '姓名：'+FieldByName('D_XM').AsString+#13#10
                 +'身份证号码：'+FieldByName('D_ZJHM').AsString+#13#10
                 +'年龄：'+FieldByName('D_NL').AsString+#13#10
                 +'家庭地址：'+FieldByName('D_JTDZ').AsString+#13#10
                 +'备注：'+FieldByName('D_BZ').AsString;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开HMD.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;
end;

//判断预定客房是否冲突，如果是则返回True
function THotelData.IsValidKfyd(const AKfbh,AYdbh: string;ADdrq,ALdrq: TDateTime): Boolean;
var
  s: string;
begin
  Result := True;

  with qryUserData do
  begin
    s := 'select * from YDKF where (D_KFBH=:KFBH)and(D_YDBH<>:YDBH)';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('KFBH').DataType := ftString;
    ParamByName('YDBH').DataType := ftString;
    ParamByName('KFBH').Value    := AKfbh;
    ParamByName('YDBH').Value    := AYdbh;

    try
      Open;
      First;
      while not Eof do
      begin
        if (FieldByName('D_DDRQ').AsDateTime<=ALdrq)and(FieldByName('D_LDRQ').AsDateTime>=ALdrq) then
          Result := False;
        if (FieldByName('D_DDRQ').AsDateTime<=ADdrq)and(FieldByName('D_LDRQ').AsDateTime>=ADdrq) then
          Result := False;
        if (FieldByName('D_DDRQ').AsDateTime>=ADdrq)and(FieldByName('D_LDRQ').AsDateTime<=ALdrq) then
          Result := False;
        Next;
      end;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开YDKF.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;
end;

//判断预定餐饮是否冲突，如果是则返回True
function THotelData.IsValidCyyd(const ACtbh,ASjdm: string;ADate: TDateTime): Boolean;
var
  s: string;
begin
  Result := True;

  with qryUserData do
  begin
    s := 'select * from YDCY '
        +'where (D_SYRQ=:SYRQ)and(D_CTBH=:CTBH)and(D_SJDM=:SJDM)and(D_RZBZ="F")';
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('SYRQ').DataType := ftDate;
    ParamByName('CTBH').DataType := ftString;
    ParamByName('SJDM').DataType := ftString;
    ParamByName('SYRQ').Value    := ADate;
    ParamByName('CTBH').Value    := ACtbh;
    ParamByName('SJDM').Value    := ASjdm;

    try
      Open;
      if not IsEmpty then
        Result := False;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开YDCY.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;
end;

//判断预定会场是否冲突，如果冲突则返回True
function THotelData.IsValidHcyd(const AHcbh,ASjdm: string;ADate: TDateTime): Boolean;
var
  s: string;
begin
  Result := True;

  with qryUserData do
  begin
    if ASjdm='全天' then
    begin
      s := 'select * from YDHC where (D_SYRQ=:SYRQ)and(D_HCBH=:HCBH)and(D_JSBZ<>"'+JS_YES+'")';
      if Active then Active := False;
      SQL.Clear;
      SQL.Add(s);
      ParamByName('SYRQ').DataType := ftDate;
      ParamByName('HCBH').DataType := ftString;
      ParamByName('SYRQ').Value    := ADate;
      ParamByName('HCBH').Value    := AHcbh;

      try
        Open;
        if not IsEmpty then
          Result := False;
      except
        On E:Exception do
        begin
          ShowWarning('打开YDHC.DB出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

    end
    else
    begin
      s := 'select * from YDHC where (D_SYRQ=:SYRQ)and(D_HCBH=:HCBH)and((D_SJDM="全天")or(D_SJDM=:SJDM))and(D_JSBZ<>"'+JS_YES+'")';
      if Active then Active := False;
      SQL.Clear;
      SQL.Add(s);
      ParamByName('SYRQ').DataType := ftDate;
      ParamByName('HCBH').DataType := ftString;
      ParamByName('SJDM').DataType := ftString;
      ParamByName('SYRQ').Value    := ADate;
      ParamByName('HCBH').Value    := AHcbh;
      ParamByName('SJDM').Value    := ASjdm;

      try
        Open;
        if not IsEmpty then
          Result := False;
      except
        On E:Exception do
        begin
          ShowWarning('打开YDHC.DB出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

    end;
    Close;
  end;
end;

//获取客人来店次数
function THotelData.Ldcs(const AKrxm: string): Integer;
begin
  Result := 0;

  try
    qryUserData.SQL.Clear;
    qryUserData.SQL.Add('select count(*) from KRXXDA where D_KRXM="'
                        +AKrxm+'"');

    try
      qryUserData.Open;
      Result := qryUserData.Fields[0].AsInteger;
    except
      On E:Exception do
      begin
        ShowWarning('打开KRXXDA.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  finally
    qryUserData.Close;
  end;
end;


//团队结帐时，是否还有没有退的房间 如果有则返回True
function THotelData.IsTdtf(const AKrbh: string): Boolean;
begin
  Result := False;
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'KFZT';

    try
      Open;
      if Locate('D_KRBH',AKrbh,[]) then
        Result := True;
      Close;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
    
  end;
end;

//通过押金编号获取押金信息
function THotelData.GetYjxx(const AYjbh: string): TYjxx;
begin
  try

    tblKryj.Filter   := 'D_YJBH='''+AYjbh+'''';//过滤出所有等于YJBH的记录
    tblKryj.Filtered := True;

    try
      tblKryj.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KRYJ.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    tblKryj.First;
    Result.AYjbh := AYjbh;
    Result.AFkfs := tblKryj.FieldByName('D_FKFS').AsString;
    Result.AXykbh:= tblKryj.FieldByName('D_XYKBH').AsString;
    Result.AKhbh := tblKryj.FieldByName('D_KHBH').AsString;

    if (Result.AFkfs = FKFS_RMB) then   //如果押金方式为人民币，则累计押金金额
    begin
      while not tblKryj.Eof do
      begin
        Result.AYfje := Result.AYfje + tblKryj.FieldByName('D_YFJE').AsCurrency;
        tblKryj.Next;
      end;
    end
    else
      Result.AYfje := 0;        //否则押金金额为零

    tblKryj.Last;       //获取当前押金记录的行号
    Result.AYjhh := tblKryj.FieldByName('D_HH').AsInteger + 1;

  finally
    tblKryj.Filter   := '';
    tblKryj.Filtered := False;
    tblKryj.Close;
  end;
end;

//根据客人编号获取团队信息
function THotelData.GetTdxx(const AKrbh: string): TTdxx;
begin
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRZD where (D_KRBH="'+AKrbh+'")and(D_HH=0)');
    Prepare;
    Open;
    Result.AKrbh := AKrbh;
    Result.AZdbh := FieldByName('D_ZDBH').AsString;
    Result.AYjbh := FieldByName('D_YJBH').AsString;
    Result.AZdlb := ZDLB_TD;
    Close;
    Result.AZdhh := GetMaxZdhh(Result.AZdbh);
    Result.AKrxm := FindMc('KRXX','D_KRBH','D_KRXM',Result.AKrbh);
  end;
{  try

    try
      tblKrzd.Open;
      tblKrxx.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KRZD.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKrzd.Locate('D_KRBH',AKrbh,[]) then
    begin
      Result.AKrbh := AKrbh;
      Result.AZdbh := tblKrzd.FieldByName('D_ZDBH').AsString;
      Result.AYjbh := tblKrzd.FieldByName('D_YJBH').AsString;
      if tblKrxx.FindKey([AKrbh]) then
        Result.AKrxm := tblKrxx.FieldByName('D_KRXM').AsString;
    end;

    tblKrzd.Filter   := 'D_ZDBH='''+Result.AZdbh+'''';
    tblKrzd.Filtered := True;

    tblKrzd.Last;       //获取帐单的下一个行号
    Result.AZdhh := tblKrzd.FieldByName('D_HH').AsInteger + 1;
  finally
    tblKrzd.Filter   := '';
    tblKrzd.Filtered := False;
    tblKrzd.Close;
    tblKrxx.Close;
  end;}
end;

//通过客人编号获取帐单编号
function THotelData.GetZdbh(const AKrbh: string): string;
begin
  Result := '';
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KRZD where (D_KRBH="'+AKrbh+'")and(D_HH=0)');
    Prepare;
    Open;
    Result := FieldByName('D_ZDBH').AsString;
    Close;
  end;
{  try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.Locate('D_KRBH',AKrbh,[]) then
      Result := tblKfzt.FieldByName('D_ZDBH').AsString;

  finally
    tblKfzt.Close;
  end;}
end;

//通过客人编号获取客房编号
function THotelData.GetKfbh(const AKrbh: string): string;
begin
  Result := '';
  try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.Locate('D_KRBH',AKrbh,[]) then
      Result := tblKfzt.FieldByName('D_KFBH').AsString;

  finally
    tblKfzt.Close;
  end;
end;

//设置客房状态
procedure THotelData.SetKfzt(const AKfbh,AKfzt: string);
begin
  ExecSql('update KFZT set D_KFZT="'+AKfzt+'" where D_KFBH="'+AKfbh+'"');
  {try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      tblKfzt.Edit;
      tblKfzt.FieldByName('D_KFZT').AsString := AKfzt;
      tblKfzt.Post;
    end;

  finally
    tblKfzt.Close;
  end;}
end;

//清空数据库
procedure THotelData.EmptyData(const ASqlStr: string);
begin
  ExecSql(ASqlStr);
  {
  with qryUserData do
  begin
    if Active then Active := False;
    RequestLive := True;
    SQL.Clear;
    SQL.Add(ASqlStr);

    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    First;
    while not Eof do Delete;
    Close;
    RequestLive := False;
  end;}
end;

//备份数据库
procedure THotelData.BakData(const ASqlStr,ATableName: string);
begin
  with qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(ASqlStr);

    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  end;

  with tblUserData do
  begin
    if Active then Active := False;
    TableName := ATableName;
  end;

  BatchMove1.Mode:= batAppendUpdate;
  BatchMove1.Source:= qryUserData;
  BatchMove1.Destination:= tblUserData;
  BatchMove1.Execute;
end;

//备份数据
procedure THotelData.BakTable(S,D: TTable);
begin
  BatchMove1.Mode:= batAppendUpdate;
  BatchMove1.Source:= S;
  BatchMove1.Destination:= D;
  BatchMove1.Execute;
end;

//结帐时，修改客人信息的离店日期和时间
procedure THotelData.UpdateKrxxJz(const AKrbh: string;ALdrq,ALdsj: TDateTime);
begin
  try

    try
      tblKrxx.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KRXX.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKrxx.FindKey([AKrbh]) then
    begin
      tblKrxx.Edit;
      tblKrxx.FieldByName('D_LDRQ').AsDateTime := ALdrq;
      tblKrxx.FieldByName('D_LDSJ').AsDateTime := ALdsj;
      tblKrxx.Post;
    end;

  finally
    tblKrxx.Close;
  end;
end;

//清除客房状态
procedure THotelData.ClearKfzt(const AKfbh: string);
var
  s : string;
begin
  s := 'update KFZT set '+
       'D_ZDBH="",D_KRBH="",D_YJBH="",D_KFBZ="",D_KRXM="",'+
       'D_KFZT="'+KFZT_OK+'",'+
       'D_SJFJ=0,D_JJFJ=0,D_KRSL=0,D_BJS=0,D_QJS=0 '+
       'where D_KFBH="'+AKfbh+'"';
  ExecSql(s);
  {try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      tblKfzt.Edit;
      tblKfzt.FieldByName('D_ZDBH').AsString   := '';
      tblKfzt.FieldByName('D_KRBH').AsString   := '';
      tblKfzt.FieldByName('D_YJBH').AsString   := '';
      tblKfzt.FieldByName('D_KFBZ').AsString   := '';
      tblKfzt.FieldByName('D_KFZT').AsString   := KFZT_OK;
      tblKfzt.FieldByName('D_SJFJ').AsCurrency := 0;
      tblKfzt.FieldByName('D_JJFJ').AsCurrency := 0;
      tblKfzt.FieldByName('D_KRSL').AsInteger  := 0;
      tblKfzt.FieldByName('D_BJS').AsInteger   := 0;
      tblKfzt.FieldByName('D_QJS').AsInteger   := 0;
      tblKfzt.FieldByName('D_KRXM').AsString   := '';
      tblKfzt.Post;
    end;

  finally
    tblKfzt.Close;
  end;}
end;

//初始化客房状态
procedure THotelData.InitKfzt(const AKfbh: string);
var
  s : string;
begin
  s := 'update KFZT set '+
       'D_ZDBH="",D_KRBH="",D_YJBH="",D_KFBZ="",'+
       'D_KFZT="'+KFZT_ZK+'",'+
       'D_SJFJ=0,D_KRSL=0,D_KRXM="" '+
       'where D_KFBH="'+AKfbh+'"';
  ExecSql(s); 

  {try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      tblKfzt.Edit;
      tblKfzt.FieldByName('D_ZDBH').AsString   := '';
      tblKfzt.FieldByName('D_KRBH').AsString   := '';
      tblKfzt.FieldByName('D_YJBH').AsString   := '';
      tblKfzt.FieldByName('D_KFBZ').AsString   := '';
      tblKfzt.FieldByName('D_KFZT').AsString   := KFZT_ZK;
      tblKfzt.FieldByName('D_SJFJ').AsCurrency := 0;
      tblKfzt.FieldByName('D_KRSL').AsInteger  := 0;
      //tblKfzt.FieldByName('D_JJFJ').AsCurrency := 0;
      //tblKfzt.FieldByName('D_BJS').AsInteger := 0;
      //tblKfzt.FieldByName('D_QJS').AsInteger := 0;
      tblKfzt.FieldByName('D_KRXM').AsString   := '';
      tblKfzt.Post;
    end;
  finally
    tblKfzt.Close;
  end;}
end;

//初始化客房状态
procedure THotelData.InitKfztOK(const AKfbh: string);
var
  s : string;
begin
  s := 'update KFZT set '+
       'D_ZDBH="",D_KRBH="",D_YJBH="",D_KFBZ="",'+
       'D_KFZT="'+KFZT_OK+'",'+
       'D_SJFJ=0,D_KRSL=0,D_KRXM="" '+
       'where D_KFBH="'+AKfbh+'"';
  ExecSql(s);

  {try

    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KFZT.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      tblKfzt.Edit;
      tblKfzt.FieldByName('D_ZDBH').AsString   := '';
      tblKfzt.FieldByName('D_KRBH').AsString   := '';
      tblKfzt.FieldByName('D_YJBH').AsString   := '';
      tblKfzt.FieldByName('D_KFBZ').AsString   := '';
      tblKfzt.FieldByName('D_KFZT').AsString   := KFZT_ZK;
      tblKfzt.FieldByName('D_SJFJ').AsCurrency := 0;
      tblKfzt.FieldByName('D_KRSL').AsInteger  := 0;
      //tblKfzt.FieldByName('D_JJFJ').AsCurrency := 0;
      //tblKfzt.FieldByName('D_BJS').AsInteger := 0;
      //tblKfzt.FieldByName('D_QJS').AsInteger := 0;
      tblKfzt.FieldByName('D_KRXM').AsString   := '';
      tblKfzt.Post;
    end;
  finally
    tblKfzt.Close;
  end;}
end;

//获取最大的帐单行号
function THotelData.GetMaxZdhh(const AZdbh: string): Integer;
begin
  with qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add('select max(D_HH) from KRZD where D_ZDBH="'+AZdbh+'"');

    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开KRZD.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if Fields[0].IsNull then Result := 1
    else Result := Fields[0].AsInteger + 1;
    Close;
  end;
end;

//添加额外费
procedure THotelData.UpdateEwfDbf(const AJzbh,AKrxm: string;AEwf: Currency;AJzrq,AJzsj: TDateTime);
begin
  if not tblEwf.Active then
    try
      tblEwf.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开EWF.DB出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  if tblEwf.FindKey([AJzbh]) then
  begin
    tblEwf.Edit;
    tblEwf.FieldByName('D_EWF').AsCurrency :=
      tblEwf.FieldByName('D_EWF').AsCurrency + AEwf;
    tblEwf.Post;
  end
  else
  begin
    tblEwf.Insert;
    tblEwf.FieldByName('D_JZBH').AsString   := AJzbh;
    tblEwf.FieldByName('D_KRXM').AsString   := AKrxm;
    tblEwf.FieldByName('D_EWF').AsCurrency  := AEwf;
    tblEwf.FieldByName('D_JZRQ').AsDateTime := AJzrq;
    tblEwf.FieldByName('D_JZSJ').AsDateTime := AJzsj;
    tblEwf.Post;
  end;

  //tblEwf.ApplyUpdates;
  //tblEwf.CommitUpdates;
  tblEwf.Close;
end;

//通过客房编号获取客房信息
function THotelData.GetKfxx1(const AKfbh: string): TKFXX;
begin
  try

    try
      tblKfzt.Open;
      tblKrxx.Open;
      //tblKryj.Open;
      //tblKrzd.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      Result.AKfbh := AKfbh;
      //Result.AZdbh := tblKfzt.FieldByName('D_ZDBH').AsString;
      Result.AKrbh := tblKfzt.FieldByName('D_KRBH').AsString;
      //Result.AYjbh := tblKfzt.FieldByName('D_YJBH').AsString;
      Result.AKfbz := tblKfzt.FieldByName('D_KFBZ').AsString;
      Result.ASjfj := tblKfzt.FieldByName('D_SJFJ').AsCurrency;

      if tblKrxx.FindKey([Result.AKrbh]) then
      begin
        Result.AKrxm := tblKrxx.FieldByName('D_KRXM').AsString;
        //Result.AKrlx := tblKrxx.FieldByName('D_KRLX').AsString;
        Result.ADdrq := tblKrxx.FieldByName('D_DDRQ').AsDateTime;
        Result.ADdsj := tblKrxx.FieldByName('D_DDSJ').AsDateTime;
      end;

      {if tblKryj.FindKey([Result.AYjbh,0]) then
      begin
        Result.AFkfs := tblKryj.FieldByName('D_FKFS').AsString;
        Result.AYfrq := tblKryj.FieldByName('D_YFRQ').AsDateTime;
        Result.AYfsj := tblKryj.FieldByName('D_YFSJ').AsDateTime;
      end;

      if tblKrzd.FindKey([Result.AZdbh,0]) then
      begin
        Result.AZdlb := tblKrzd.FieldByName('D_ZDLB').AsString;
        Result.AXfje := tblKrzd.FieldByName('D_XFJE').AsCurrency;
      end;

      Result.AZdhh := GetMaxZdhh(Result.AZdbh);}
    end;
  finally
    //tblKfzt.Close;
    //tblKrxx.Close;
    //tblKryj.Close;
    //tblKrzd.Close;
  end;
end;


//通过客房编号获取客房信息
function THotelData.GetKfxx(const AKfbh: string): TKFXX;
begin
  try

    try
      tblKfzt.Open;
      tblKrxx.Open;
      tblKryj.Open;
      tblKrzd.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      Result.AKfbh := AKfbh;
      Result.AZdbh := tblKfzt.FieldByName('D_ZDBH').AsString;
      Result.AKrbh := tblKfzt.FieldByName('D_KRBH').AsString;
      Result.AYjbh := tblKfzt.FieldByName('D_YJBH').AsString;
      Result.AKfbz := tblKfzt.FieldByName('D_KFBZ').AsString;
      Result.ASjfj := tblKfzt.FieldByName('D_SJFJ').AsCurrency;

      if tblKrxx.FindKey([Result.AKrbh]) then
      begin
        Result.AKrxm := tblKrxx.FieldByName('D_KRXM').AsString;
        Result.AKrlx := tblKrxx.FieldByName('D_KRLX').AsString;
        Result.ADdrq := tblKrxx.FieldByName('D_DDRQ').AsDateTime;
        Result.ADdsj := tblKrxx.FieldByName('D_DDSJ').AsDateTime;
      end;

      if tblKryj.FindKey([Result.AYjbh,0]) then
      begin
        Result.AFkfs := tblKryj.FieldByName('D_FKFS').AsString;
        Result.AYfrq := tblKryj.FieldByName('D_YFRQ').AsDateTime;
        Result.AYfsj := tblKryj.FieldByName('D_YFSJ').AsDateTime;
      end;

      if tblKrzd.FindKey([Result.AZdbh,0]) then
      begin
        Result.AZdlb := tblKrzd.FieldByName('D_ZDLB').AsString;
        Result.AXfje := tblKrzd.FieldByName('D_XFJE').AsCurrency;
      end;

      Result.AZdhh := GetMaxZdhh(Result.AZdbh);
    end;
  finally
    tblKfzt.Close;
    tblKrxx.Close;
    tblKryj.Close;
    tblKrzd.Close;
  end;
end;

//金额求和
function THotelData.SumSysJe(const ASqlStr: string): Currency;
begin
  with qrySysData do
  begin
    SQL.Clear;
    SQL.Add(ASqlStr);
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if Fields[0].IsNull then Result := 0
    else Result := Fields[0].AsCurrency;
    Close;
  end;
end;

//金额求和
function THotelData.SumJe(const ASqlStr: string): Currency;
begin
  with qryUserData do
  begin
    SQL.Clear;
    SQL.Add(ASqlStr);
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if Fields[0].IsNull then Result := 0
    else Result := Fields[0].AsCurrency;
    Close;
  end;
end;

//更新客房状态中的半全价和间接房价
procedure THotelData.UpdateJjfj(const AKfbh: string;ABqj: Integer;AJjfj: Currency);
begin
  try
    try
      tblKfzt.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if tblKfzt.FindKey([AKfbh]) then
    begin
      tblKfzt.Edit;
      tblKfzt.FieldByName('D_JJFJ').AsCurrency :=
        tblKfzt.FieldByName('D_JJFJ').AsCurrency+AJjfj;
      if ABqj=BQJ_BJ then
        tblKfzt.FieldByName('D_BJS').AsInteger :=
          tblKfzt.FieldByName('D_BJS').AsInteger + ABqj
      else
        tblKfzt.FieldByName('D_QJS').AsInteger :=
          tblKfzt.FieldByName('D_QJS').AsInteger + ABqj;
      tblKfzt.Post;
    end;
  finally
    tblKfzt.Close;
  end;
end;

//添加半全价到bqj.db
procedure THotelData.UpdateBqj(const AKfbh: string;ABqj: Integer;ASjfj,AJjfj: Currency);
begin
  if not tblBqj.Active then
    try
      tblBqj.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

  if tblBqj.FindKey([AKfbh]) then
  begin
    tblBqj.Edit;
    tblBqj.FieldByName('D_SJFJ').AsCurrency := ASjfj;

    if ABqj=BQJ_BJ then
    begin
      tblBqj.FieldByName('D_BJS').AsInteger :=
        tblBqj.FieldByName('D_BJS').AsInteger + 1;//ABqj;
      tblBqj.FieldByName('D_BJ').AsString   :=
        tblBqj.FIeldByName('D_BJ').AsString+CurrToStr(AJjfj) + ',';
    end
    else
    if ABqj=BQJ_QJ then
    begin
      tblBqj.FieldByName('D_QJS').AsInteger :=
        tblBqj.FieldByName('D_QJS').AsInteger + 1;//ABqj;
      tblBqj.FieldByName('D_QJ').AsString   :=
        tblBqj.FIeldByName('D_QJ').AsString+CurrToStr(AJjfj) + ',';
    end;

    tblBqj.FieldByName('D_JJFJ').AsCurrency :=
      tblBqj.FieldByName('D_JJFJ').AsCurrency + AJjfj;
    tblBqj.Post;
  end
  else
  begin
    tblBqj.Insert;
    tblBqj.FieldByName('D_KFBH').AsString   := AKfbh;
    tblBqj.FieldByName('D_SJFJ').AsCurrency := ASjfj;
    if ABqj=BQJ_BJ then
    begin
      tblBqj.FieldByName('D_BJS').AsInteger :=
        tblBqj.FieldByName('D_BJS').AsInteger + 1;//ABqj;
      tblBqj.FieldByName('D_BJ').AsString   := CurrToStr(AJjfj) + ',';
    end
    else
    if ABqj=BQJ_QJ then
    begin
      tblBqj.FieldByName('D_QJS').AsInteger :=
        tblBqj.FieldByName('D_QJS').AsInteger + 1;//ABqj;
      tblBqj.FieldByName('D_QJ').AsString   := CurrToStr(AJjfj) + ',';
    end;

    tblBqj.FieldByName('D_JJFJ').AsCurrency := AJjfj;
    tblBqj.Post;
  end;

  //tblBqj.ApplyUpdates;
  //tblBqj.CommitUpdates;
  tblBqj.Close;
end;

//返回当前的客房状态
function THotelData.CheckKfzt(const AKfbh: string) : string;
begin
  with qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select D_KFZT from KFZT where D_KFBH="'+AKfbh+'"');
    Prepare;
    Open;
    if Fields[0].IsNull then Result := ''
    else Result := Fields[0].AsString;
  end;
  {with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'KFZT';
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    if FindKey([AKfbh]) then
      Result := FieldByName('D_KFZT').AsString
    else
      Result := '';
    Close;
  end;}
end;

//获得编号
function THotelData.GetBh(const AFieldName,APrevStr: string): string;
begin
  Result := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
  {Result := '';
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := 'BH';
    try
      try
        Open
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      First;
      Edit;
      //20020627 edit by ls.
      //根据当前时间自动生成编号
      //FieldByName(AFieldName).AsString := APrevStr+AddDH(FieldByName(AFieldName).AsString);
      FieldByName(AFieldName).AsString := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
      Post;
      Result := FieldByName(AFieldName).AsString;
    finally
      Close;
    end;
  end;}
end;

//通过名称查找编号
function THotelData.FindBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
begin
  Result := '';
  Result := '';
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+AFieldBh+' from '+ATableName+' where '+AFieldMc+'="'+AMc+'"');
    Prepare;
    Open;
    Result := Fields[0].AsString;
  end;

  {with tblSysData do
  begin
    try
      if Active then Active := False;
      TableName := ATableName;
      try
        Open;
      except
          On E:Exception do
          begin
            ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                        +#13#10
                        +'错误信息:'
                        +E.Message);
            raise;
          end;
      end;

      if Locate(AFieldMc,AMc,[]) then
        Result := FieldByName(AFieldBh).AsString;
    finally
      Close;
    end;
  end;}
end;


//通过编号查找名称
function THotelData.FindMc(const ATableName,AFieldBh,AFieldMc,ABh: string): string;
begin
  Result := '';
  with qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+AFieldMc+' from '+ATableName+' where '+AFieldBh+'="'+ABh+'"');
    Prepare;
    Open;
    Result := Fields[0].AsString;
  end;
  {with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    try
      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      if Locate(AFieldBh,ABh,[]) then
        Result := FieldByName(AFieldMc).AsString;
    finally
      Close;
    end;
  end;}
end;

function THotelData.FindUserBh(const ATableName,AFieldBh,AFieldMc,AMc: string): string;
begin
  Result := '';
  with tblUserData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    try
      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      if Locate(AFieldMc,AMc,[]) then
        Result := FieldByName(AFieldBh).AsString;
    finally
      Close;
    end;
  end;
end;

//将所有名称添加到下拉框中
procedure THotelData.ListMc(AComboBox: TComboBox;const ATableName,AFieldMc: string);
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    try

      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

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

//将所有代码和名称添加到下拉框中
procedure THotelData.ListDm(AComboBox: TComboBox;const ATableName,AFieldMc: string);
var
  s: string;
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    try

      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

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

procedure THotelData.ListDbDm(ADBComboBox: TDBComboBox;const ATableName,AFieldMc: string);
var
  s: string;
begin
  with tblSysData do
  begin
    if Active then Active := False;
    TableName := ATableName;
    try

      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      ADBComboBox.Items.Clear;
      First;
      while not Eof do
      begin
        s := FieldbyName('D_DM').AsString+'|'+FieldByName(AFieldMc).AsString;
        ADBComboBox.Items.Add(s);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

//路径初始化
procedure THotelData.DataModuleCreate(Sender: TObject);
begin
  //获取系统路径，系统配置文件
  APP_DIR := ExtractFilePath(Application.ExeName);
  SystemReportDir := APP_DIR+'report\';
  {Database_Dir := APP_DIR + 'Database\UserData';
  if not Session.IsAlias('HotelUser') then
  begin
    Session.AddStandardAlias('HotelUser',Database_Dir,'PARADOX');
    Session.SaveConfigFile;
  end;}
  DatabaseUser.Connected := True;
end;

end.
