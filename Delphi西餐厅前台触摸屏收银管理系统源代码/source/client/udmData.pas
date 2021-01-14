{
  主程序的数据连接模块
}
unit udmData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, CSADOQuery;

type
  TdmData = class(TDataModule)
    adocon: TADOConnection;
    Temp: TCSADOQuery;
  private
    Fi_Size, Fi_ComPort: Integer;
    Fb_IsReg: Boolean;
    Fs_SerialNum: String;
    function prif_CheckReg: Boolean; 
    function prif_DecodePass(As_RegCode: String): String;
  public
    As_OptName: String;
    //function pubf_GetConnPwd: string;
    function pubf_GetTradeCD: String;
    function pubf_Connect: Boolean;
    function pubp_ExecSQL(As_SQL: String): Boolean; 
    property Ai_Size: Integer read Fi_Size;  
    property IsReg: Boolean read Fb_IsReg;
    property As_SerialNum: String read Fs_SerialNum;
    property Ai_ComPort: Integer read Fi_ComPort;
  end;

var
  dmData: TdmData;

implementation

uses
  Variants, IniFiles, upubCommon, StrUtils, Registry;

{$R *.DFM}

{ Tfrm_data }

{function TdmData.pubf_GetConnPwd: string;
begin
  //TODO: To be completed
  //To be bind with rockey
  Result := '';
end; }

function TdmData.prif_CheckReg: Boolean;
var
  lc_Reg: TRegistry;
  ls_KeyName: String;
  ls_Pass: String;
  ls_Temp: String;
begin
  ls_KeyName := 'SOFTWARE\' + Application.ExeName;
  lc_Reg := TRegistry.Create;
  try
    lc_Reg.RootKey := HKEY_LOCAL_MACHINE;
    if lc_Reg.OpenKey(ls_KeyName, False) then
    begin
      ls_Temp := ExtractFileName(Application.ExeName);
      ls_Pass := lc_Reg.ReadString(ls_Temp);
      if ls_Pass = prif_DecodePass(Fs_SerialNum) then begin
        Result := True;
      end else
      begin
        Result := False;
      end;
    end else begin
      lc_Reg.OpenKey(ls_KeyName, True);
      Result := False;
    end;
  finally
    lc_Reg.Free;
  end;
end;

function TdmData.prif_DecodePass(As_RegCode: String): String;
var
  li_I: Integer;
begin
  for li_I := 1 to Length(As_RegCode) - 1 do
  begin
    Result := Result + IntToStr(Ord(As_RegCode[li_I]) + li_I + $20);
  end;
end;

function TdmData.pubf_Connect: Boolean;
var
  ls_ConStr, ls_AppPath, ls_DBMS, ls_DBDRV: string;
  lc_DatFile: TIniFile;   
  lp_RootPath: PChar;
begin
  ls_AppPath := ExtractFilePath(Application.ExeName); 
  lp_RootPath := PChar(LeftStr(Application.ExeName, 3));
  Fs_SerialNum := GetSerialNumber(lp_RootPath); 
  ls_AppPath := ExtractFilePath(Application.ExeName);
  if not FileExists(ls_AppPath + 'connset.dat') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件丢失', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  lc_DatFile := TIniFile.Create(ls_AppPath + 'connset.dat');
  with lc_DatFile do
  begin
    ShopInfo.ShopCD := Readstring('SETUP', 'SHOPCD', '');
    ls_DBMS := Readstring('SETUP', 'DBMS', '');
    ls_DBDRV := Readstring('SETUP', 'DBDRV', '');  
    Fi_Size := ReadInteger('Printer', 'Size', 8); 
    Fi_ComPort := ReadInteger('COM', 'PORT', 1);
    if pubCommon.IsNet then
    begin
      ls_ConStr := Readstring('SETUP', 'CONSTRNET', '');
      MachinesInfo.MachinesNet := '联网'; 
      ls_ConStr := stringReplace(ls_ConStr, '%PWD%', '',
        [rfReplaceAll, rfIgnoreCase]);
    end
    else
    begin
      ls_ConStr := Readstring('SETUP',
      'CONSTRLOCAL', '');
      MachinesInfo.MachinesNet := '断网';
      ls_ConStr := stringReplace(ls_ConStr, '%PWD%', '1234567890abc',
        [rfReplaceAll, rfIgnoreCase]);
    end;
    //ShowMessage(ls_ConStr);
    Free;
  end;
  if (ls_DBMS = '') or (ls_DBDRV = '') or (ls_ConStr = '') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件损坏', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  try
    with adocon do
    begin
      if Connected then Close;
      Connectionstring := ls_ConStr; 
      Open;
      Result := Connected;  
      if Result then
      begin 
        Fb_IsReg := prif_CheckReg;
      end;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TdmData.pubf_GetTradeCD: String; 
var
  ls_TradeCD, ls_Date, ls_Date1: String;
  li_TradeCD: integer;
const ls_Zero = '0000';
begin     
  ls_Date := FormatDateTime('YYMMDDHHMMSS', Now);
  ls_Date1 := FormatDateTime('YYYY-MM-DD', Date);
  with Temp do
  begin
    if Active then Close;
    Connection := Adocon;
    SQL.Text := Format('SELECT Max(I_TRADE_CD) as I_TRADE_CD FROM T_TRADE_MS WHERE ' +
      'I_TRADE_DATE = ''%s''', [ls_Date1]);
    Open;
  end;
  if Temp.IsEmpty then
  begin
    ls_TradeCD := ShopInfo.ShopCD + MachinesInfo.MachinesCD + ls_Date + '0001';
    Result := ls_TradeCD;
    Temp.Close;
    Exit;
  end
  else
  begin
    ls_TradeCD := Temp.FieldByName('I_TRADE_CD').AsString;
    Temp.Close;
    li_TradeCD := StrToIntDef(RightStr(ls_TradeCD, 4), 0);
    ls_TradeCD := IntToStr(li_TradeCD + 1);
    ls_TradeCD := Copy(ls_Zero, 1, 4 - Length(ls_TradeCD)) + ls_TradeCD;
    Result := ShopInfo.ShopCD + MachinesInfo.MachinesCD + ls_Date + ls_TradeCD;
  end;
end;

function TdmData.pubp_ExecSQL(As_SQL: String): Boolean;
begin
  adocon.BeginTrans;
  try
    adocon.Execute(As_SQL);
    adocon.CommitTrans;
    Result := True;
  except
    adocon.RollbackTrans;
    Result := False;
  end; 
end;

end.
