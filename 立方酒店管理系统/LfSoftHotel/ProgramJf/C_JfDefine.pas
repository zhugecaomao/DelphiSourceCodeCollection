unit C_JfDefine;

interface
uses SysUtils, DateUtils;

const
  BufLen = 80;

  SNDH   = '市内电话';

  DHFL_SH = 1;//市话
  DHFL_NH = 2;//农话
  DHFL_GN = 3;//国内长途
  DHFL_GJ = 4;//国际长途

  //系统配置文件
  INI_FILENAME = 'LFHOTEL.ini';

type
  TComBuf = array[0..BufLen-1] of Char;
  TBasicFmt = record
    Room : string;
    SDate: string;
    STime: string;
    Last : string;
    Number: string;
  end;
  TFee = record
    STime: TDateTime;
    FTime: TDateTime;
    AddiFee: Currency;
    AddiFee0: Currency;
    Xxtf: Currency;
    Svc: Double;
    Svc0: Currency;
    Gn: Currency;
    Gj: Currency;
    Nh: Currency;
    Wxf: Currency;
    Yzf: Currency;
    ShFee: Currency;
    ShUnit: Double;
    ShFee0: Currency;
    ShUnit0: Double;
    NhFee: Currency;
    NhUnit: Double;
    GnFee: Currency;
    GnUnit: Double;
    GjFee: Currency;
    GjUnit: Double;
    GatFee: Currency;
    GatUnit: Double;
    GnFeeYh: Currency;
    GnYhUnit: Double;
    GjFeeYh: Currency;
    GjYhUnit: Double;
  end;

  TCodeInfo = record
    APlace: string;
    AFee: Currency;
    AUnit: Double;
    JFYN: Boolean;
    NHYN: Boolean;
    DHFL: Integer;
  end;

  TNewData = record
    AClass: string;
    Room : string;
    Place: string;
    Number: string;
    SDate: TDateTime;
    STime: TDateTime;
    Last : Double;
    AUnit: Currency;
    Fee  : Currency;
    AddiFee: Currency;
    SvcFee: Currency;
    Total: Currency;
    Flty: Integer;
  end;

var
  ComBuf  : TComBuf;
  BasBuf  : TComBuf;
  BasicFmt: TBasicFmt;
  NewData : TNewData;
  IsWrite : Boolean;
  Fee     : TFee;
  CodeInfo: TCodeInfo;
  PORTNUM : Integer;
  APP_DIR : string;
  
function FindData: Integer;
function MoveData: Boolean;
procedure ReadData;
procedure WriteData;
procedure MainWork;
function CaculateLast(const ALast: string): Double;
function GetNewData: TNewData;
procedure WriteNewData(ANewData: TNewData);
procedure ShowNewData(ANewData: TNewData);
procedure InitFee;
procedure GetCodeInfo(const ANumber: string);
function FindCode(const ANumber: string): Boolean;
function FindShCode(const ANumber: string): Boolean;
function GetDate(const s: string): TDateTime;
function GetTime(const s: string): TDateTime;
function IsYh(ATime: TDateTime): Boolean;


implementation

uses C_JfMain, C_JfData;

function IsYh(ATime: TDateTime): Boolean;
begin
  Result := False;
  if (ATime>Fee.STime)or(ATime<Fee.FTime) then
    Result := True;
end;

function GetTime(const s: string): TDateTime;
var
  hh,nn: Word;
begin
  hh := StrToInt(Copy(s,1,2));
  nn := StrToInt(Copy(s,4,2));
  Result := EnCodeTime(hh,nn,0,0);
end;

function GetDate(const s: string): TDateTime;
var
  MM,DD: Word;
begin
  MM := StrToInt(Copy(s,1,2));
  DD := StrToInt(Copy(s,4,2));
  Result := EnCodeDate(YearOf(Now),MM,DD);
end;

function FindCode(const ANumber: string): Boolean;
var
  i,l: Integer;
  s: string;
begin
  Result := False;
  l := Length(ANumber);
  for i:=1 to l do
  begin
    s := Copy(ANumber,1,i);
    if JfData.tblFare.Locate('CODE',s,[]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function FindShCode(const ANumber: string): Boolean;
var
  i,l: Integer;
  s: string;
begin
  Result := False;
  l := Length(ANumber);
  for i:=1 to l do
  begin
    s := Copy(ANumber,1,i);
    if JfData.tblShfare.Locate('CODE',s,[]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure GetCodeInfo(const ANumber: string);
var
  ANum,s1,s2: string;
begin
  s1 := Copy(ANumber,1,1);
  s2 := Copy(ANumber,2,1);
  ANum := Copy(ANumber,1,6);
  if s1<>'0' then
  begin
    if JfData.tblShfare.Locate('CODE',ANum,[]) then
    begin
      CodeInfo.APlace := SNDH;
      CodeInfo.AFee := JfData.tblShfare.FieldByName('UNIT').AsCurrency;
      CodeInfo.AUnit:= JfData.tblShfare.FieldByName('PRICE').AsFloat;
      CodeInfo.JFYN := JfData.tblShfare.FieldByName('JFYN').AsBoolean;
      CodeInfo.NHYN := JfData.tblShfare.FieldByName('NHYN').AsBoolean;
      if CodeInfo.NHYN then
        CodeInfo.DHFL := DHFL_NH
      else
        CodeInfo.DHFL := DHFL_SH;
    end
    else
    begin
      if FindShCode(ANum) then
      begin
        CodeInfo.JFYN := JfData.tblShfare.FieldByName('JFYN').AsBoolean;
        CodeInfo.NHYN := JfData.tblShfare.FieldByName('NHYN').AsBoolean;
      end
      else
      begin
        CodeInfo.JFYN := True;
        CodeInfo.NHYN := False;
      end;
      CodeInfo.APlace := SNDH;
      if CodeInfo.NHYN then
      begin
        CodeInfo.AFee := Fee.NhFee;
        CodeInfo.AUnit:= Fee.NhUnit;
        CodeInfo.DHFL := DHFL_NH;
      end
      else
      begin
        CodeInfo.AFee := Fee.ShFee;
        CodeInfo.AUnit:= Fee.ShUnit;
        CodeInfo.DHFL := DHFL_SH;
      end;
    end;
  end
  else
  begin
    if s2<>'0' then
    begin
      if FindCode(ANum) then
        CodeInfo.APlace := JfData.tblFare.FieldByName('PLACE').AsString
      else
        CodeInfo.APlace := '未知地区';
      CodeInfo.AFee := Fee.GnFee;
      CodeInfo.AUnit:= Fee.GnUnit;
      CodeInfo.JFYN := True;
      CodeInfo.NHYN := False;
      CodeInfo.DHFL := DHFL_GN;
    end
    else
    begin
      if FindCode(ANum) then
        CodeInfo.APlace := JfData.tblFare.FieldByName('PLACE').AsString
      else
        CodeInfo.APlace := '未知地区';
      CodeInfo.AFee := Fee.GjFee;
      CodeInfo.AUnit:= Fee.GjUnit;
      CodeInfo.JFYN := True;
      CodeInfo.NHYN := False;
      CodeInfo.DHFL := DHFL_GJ;
    end;
  end;
end;

procedure InitFee;
begin
  with JfData.tblJfConfig do
  begin
    Open;
    First;
    Fee.STime := FieldByName('STime').AsDateTime;
    Fee.FTime := FieldByName('FTime').AsDateTime;
    Fee.AddiFee := FieldByName('AddiFee').AsCurrency;
    Fee.AddiFee0 := FieldByName('AddiFee0').AsCurrency;
    Fee.Xxtf := FieldByName('Xxtf').AsCurrency;
    Fee.Svc := FieldByName('Svc').AsFloat;
    Fee.Svc0 := FieldByName('Svc0').AsCurrency;
    Fee.Gn := FieldByName('Gn').AsCurrency;
    Fee.Gj := FieldByName('Gj').AsCurrency;
    Fee.Nh := FieldByName('Nh').AsCurrency;
    Fee.Wxf := FieldByName('Wxf').AsCurrency;
    Fee.Yzf := FieldByName('Yzf').AsCurrency;
    Fee.ShFee := FieldByName('ShFee').AsCurrency;
    Fee.ShUnit:= FieldByName('ShUnit').AsFloat;
    Fee.ShFee0 := FieldByName('ShFee0').AsCurrency;
    Fee.ShUnit0 := FieldByName('ShUnit0').AsFloat;
    Fee.NhFee := FieldByName('NhFee').AsCurrency;
    Fee.NhUnit := FieldByName('NhUnit').AsFloat;
    Fee.GnFee := FieldByName('GnFee').AsCurrency;
    Fee.GnUnit := FieldByName('GnUnit').AsFloat;
    Fee.GjFee := FieldByName('GjFee').AsCurrency;
    Fee.GjUnit := FieldByName('GjUnit').AsFloat;
    Fee.GatFee := FieldByName('GatFee').AsCurrency;
    Fee.GatUnit := FieldByName('GatUnit').AsFloat;
    Fee.GnFeeYh := FieldByName('GnFeeYh').AsCurrency;
    Fee.GnYhUnit := FieldByName('GnYhUnit').AsFloat;
    Fee.GjFeeYh := FieldByName('GjFeeYh').AsCurrency;
    Fee.GjYhUnit := FieldByName('GjYhUnit').AsFloat;
    Close;
  end;
end;

procedure ShowNewData(ANewData: TNewData);
var
  s: string;
begin
  if JfMainForm.Memo1.Lines.Count >35 then
    JfMainForm.Memo1.Lines.Clear;
  s :='分机号:'+ANewData.AClass+' '+
      '地名:'+ANewData.Place+' '+
      '号码:'+ANewData.Number+' '+
      '时间:'+DateToStr(ANewData.SDate)+TimeToStr(ANewData.STime)+' '+
      '时长:'+FloatToStr(ANewData.Last)+' '+
      '单价：'+CurrToStr(ANewData.AUnit)+' '+
      '话费:'+CurrToStr(ANewData.Fee+ANewData.AddiFee)+' '+
      '服务费:'+CurrToStr(ANewData.SvcFee)+' '+
      '金额:'+CurrToStr(ANewData.Total);
  JfMainForm.Memo1.Lines.Add(s);
end;

function GetNewData: TNewData;
var
  AFee,XxFee: Currency;
  s: string;
  AUnit: Double;
begin
  with JfData do
  begin
    Result.AClass := tblBasicFmt.FieldByName('CLASS').AsString;
    Result.Room := JfData.FindRoom(Result.AClass);
    Result.Number := tblBasicFmt.FieldByName('NUMBER').AsString;
    GetCodeInfo(Result.Number);
    Result.Place := CodeInfo.APlace;
    Result.Last := tblBasicFmt.FieldByName('LAST').AsFloat;
    Result.SDate := GetDate(tblBasicFmt.FieldByName('SDATE').AsString);
    Result.STime := GetTime(tblBasicFmt.FieldByName('STIME').AsString);
    Result.Flty := CodeInfo.DHFL;
    if Copy(Result.Number,1,3)='168' then
      XxFee := Trunc(Result.Last/180+0.9999)*Fee.Xxtf
    else
      XxFee := 0;
    case CodeInfo.DHFL of
      DHFL_SH:
        begin
          Result.AUnit := Fee.ShFee;
          if Result.Last<Fee.ShUnit then
            Result.Fee := Fee.ShFee+XxFee
          else
          begin
            Result.Fee := Fee.ShFee + XxFee + Trunc((Result.Last-Fee.ShUnit)/Fee.ShUnit0+0.9999)*Fee.ShFee0;
          end;
          Result.AddiFee := 0;
          Result.SvcFee := 0;
          Result.Total := Result.Fee + Result.AddiFee + Result.SvcFee;
        end;
      DHFL_NH:
        begin
          Result.AUnit := Fee.NhFee;
          Result.Fee := Trunc(Result.Last/Fee.NhUnit+0.9999)*Fee.NhFee;
          Result.AddiFee := 0;
          Result.SvcFee := 0;
          Result.Total := Result.Fee + Result.AddiFee + Result.SvcFee;
        end;
      DHFL_GN:
        begin
          if IsYh(Result.STime) then
          begin
            AFee := Fee.GnFeeYh;
            AUnit:= Fee.GnYhUnit;
          end
          else
          begin
            AFee := Fee.GnFee;
            AUnit:= Fee.GnUnit;
          end;
          Result.AUnit := AUnit;
          Result.Fee := Trunc(Result.Last/AUnit+0.9999)*AFee;
          Result.AddiFee := Trunc(Result.Last/AUnit+0.9999)*Fee.AddiFee;
          if (Result.Fee + Result.AddiFee)<=5 then
            Result.SvcFee := 0.5 + Fee.Gn
          else
            Result.SvcFee := (Result.Fee+Result.AddiFee)*Fee.Svc/100+Fee.Gn;
          Result.Total := Result.Fee + Result.AddiFee + Result.SvcFee;
        end;
      DHFL_GJ:
        begin
          if IsYh(Result.STime) then
          begin
            AFee := Fee.GjFeeYh;
            AUnit:= Fee.GjYhUnit;
          end
          else
          begin
            AFee := Fee.GjFee;
            AUnit:= Fee.GjUnit;
          end;
          s := Copy(Result.Number,1,5);
          if (s='00852')or(s='00853')or(s='00886') then
          begin
            Result.AUnit := Fee.GatFee;
            Result.Fee := Trunc(Result.Last/Fee.GatUnit+0.9999)*Fee.GatFee;
            Result.AddiFee := Trunc(Result.Last/Fee.GatUnit+0.9999)*Fee.AddiFee0;
            Result.SvcFee := (Result.Fee+Result.AddiFee)*Fee.Svc/100+Fee.Gj;
            Result.Total := Result.Fee + Result.AddiFee + Result.SvcFee;
          end
          else
          begin
            Result.AUnit := AUnit;
            Result.Fee := Trunc(Result.Last/AUnit+0.9999)*AFee;
            Result.AddiFee := Trunc(Result.Last/AUnit+0.9999)*Fee.AddiFee0;
            Result.SvcFee := (Result.Fee+Result.AddiFee)*Fee.Svc/100+Fee.Gj;
            Result.Total := Result.Fee + Result.AddiFee + Result.SvcFee;
          end;
        end;
    end;
  end;
end;

procedure WriteNewData(ANewData: TNewData);
begin
  with JfData do
  begin
    tblNewData.Append;
    tblNewData.FieldByName('CLASS').AsString := ANewData.AClass;
    tblNewData.FieldByName('ROOM').AsString := ANewData.Room;
    tblNewData.FieldByName('PLACE').AsString := ANewData.Place;
    tblNewData.FieldByName('NUMBER').AsString := ANewData.Number;
    tblNewData.FieldByName('SDATE').AsString := FormatDateTime('yyyymmdd',ANewData.SDate);
    tblNewData.FieldByName('STIME').AsString := FormatDateTime('hhnnss',ANewData.STime);
    tblNewData.FieldByName('LAST').AsFloat := ANewData.Last;
    tblNewData.FieldByName('UNIT').AsCurrency := ANewData.AUnit;
    tblNewData.FieldByName('FEE').AsCurrency := ANewData.Fee;
    tblNewData.FieldByName('ADDIFEE').AsCurrency := ANewData.AddiFee;
    tblNewData.FieldByName('SVCFEE').AsCurrency := ANewData.SvcFee;
    tblNewData.FieldByName('TOTAL').AsCurrency := ANewData.Total;
    tblNewData.FieldByName('FLTY').AsInteger := ANewData.Flty;
    tblNewData.Post;
    tblOldData.Append;
    tblOldData.FieldByName('CLASS').AsString := ANewData.AClass;
    tblOldData.FieldByName('ROOM').AsString := ANewData.Room;
    tblOldData.FieldByName('PLACE').AsString := ANewData.Place;
    tblOldData.FieldByName('NUMBER').AsString := ANewData.Number;
    tblOldData.FieldByName('SDATE').AsString := FormatDateTime('yyyymmdd',ANewData.SDate);
    tblOldData.FieldByName('STIME').AsString := FormatDateTime('hhnnss',ANewData.STime);
    tblOldData.FieldByName('LAST').AsFloat := ANewData.Last;
    tblOldData.FieldByName('UNIT').AsCurrency := ANewData.AUnit;
    tblOldData.FieldByName('FEE').AsCurrency := ANewData.Fee;
    tblOldData.FieldByName('ADDIFEE').AsCurrency := ANewData.AddiFee;
    tblOldData.FieldByName('SVCFEE').AsCurrency := ANewData.SvcFee;
    tblOldData.FieldByName('TOTAL').AsCurrency := ANewData.Total;
    tblOldData.FieldByName('FLTY').AsInteger := ANewData.Flty;
    tblOldData.Post;
    tblDHF.Append;
    tblDHF.FieldByName('CLASS').AsString := ANewData.AClass;
    tblDHF.FieldByName('ROOM').AsString := ANewData.Room;
    tblDHF.FieldByName('PLACE').AsString := ANewData.Place;
    tblDHF.FieldByName('NUMBER').AsString := ANewData.Number;
    tblDHF.FieldByName('SDATE').AsString := FormatDateTime('yyyymmdd',ANewData.SDate);
    tblDHF.FieldByName('STIME').AsString := FormatDateTime('hhnnss',ANewData.STime);
    tblDHF.FieldByName('LAST').AsFloat := ANewData.Last;
    tblDHF.FieldByName('UNIT').AsCurrency := ANewData.AUnit;
    tblDHF.FieldByName('FEE').AsCurrency := ANewData.Fee;
    tblDHF.FieldByName('ADDIFEE').AsCurrency := ANewData.AddiFee;
    tblDHF.FieldByName('SVCFEE').AsCurrency := ANewData.SvcFee;
    tblDHF.FieldByName('TOTAL').AsCurrency := ANewData.Total;
    tblDHF.FieldByName('FLTY').AsInteger := ANewData.Flty;
    tblDHF.Post;

  end;
end;

procedure MainWork;
var
  ANewData : TNewData;
begin
  with JfData do
  begin
    if not IsWrite then
    begin
      tblBasicFmt.First;
      while not tblBasicFmt.Eof do
      begin
        try
          ANewData := GetNewData;
          if CodeInfo.JFYN then
          begin
            WriteNewData(ANewData);
            ShowNewData(ANewData);
          end;
        finally
          tblBasicFmt.Delete;
        end;
      end;
    end;
  end;
end;

function CaculateLast(const ALast: string): Double;
var
  HH,NN,SS: Integer;
begin
  HH := StrToInt(Copy(ALast,1,2));
  NN := StrToInt(Copy(ALast,4,2));
  SS := StrToInt(Copy(ALast,7,2));
  Result := HH*3600+NN*60+SS;
end;

procedure WriteData;
begin
  with JfData.tblBasicFmt do
  begin
    IsWrite := True;
    Append;
    FieldByName('CLASS').AsString := BasicFmt.Room;
    FieldByName('SDATE').AsString := BasicFmt.SDate;
    FieldByName('STIME').AsString := BasicFmt.STime;
    FieldByName('LAST').AsFloat := CaculateLast(BasicFmt.Last);
    FieldByName('NUMBER').AsString := BasicFmt.Number;
    Post;
    IsWrite := False;
  end;
end;

procedure ReadData;
var
  i: Integer;
begin
  try
    for i:=0 to BufLen-1 do
      if BasBuf[i] = #13 then
        Break;

    BasicFmt.Room := Copy(BasBuf,i+2,4);
    BasicFmt.SDate:= Copy(BasBuf,i+6,5);
    BasicFmt.STime:= Copy(BasBuf,i+11,5);
    BasicFmt.Last := Copy(BasBuf,i+16,8);
    BasicFmt.Number := Copy(BasBuf,i+24,11);
  finally
    FillChar(BasBuf,BufLen-1,#0);
  end;
end;

function FindData: Integer;
var
  i: Integer;
begin
  Result := BufLen-1;
  for i:=0 to BufLen-1 do
    if ComBuf[i] = #13 then
    begin
      Result := i;
      Break;
    end;
end;

function MoveData: Boolean;
begin
  Result := False;
  if (FindData<>BufLen-1) then
  begin
    BasBuf := ComBuf;
    FillChar(ComBuf,BufLen-1,#0);
    Result := True;
  end;
end;

end.
