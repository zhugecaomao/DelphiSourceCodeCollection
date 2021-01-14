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
    Fi_Card, Fi_ComPort, Fi_Size, Fi_IsFoot: Integer; 
    Fi_Count: Integer;
    Fb_IsReg: Boolean;
    Fs_PrintTitle, Fs_Tel, Fs_Address, Fs_SerialNum: String;   
    function prif_GetCount: Integer; 
    function prif_CheckReg: Boolean; 
    function prif_DecodePass(As_RegCode: String): String;
    { Private declarations }
  public
    As_OptName: String;
    //function pubf_GetConnPwd: string;  
    function pubp_GetConsumeId: String;
    function pubf_Connect: Boolean;
    function pubf_GetCustomerId: String; 
    function pubf_GetCardId: String;  
    property Ai_Card: Integer read Fi_Card; 
    property Ai_ComPort: Integer read Fi_ComPort;
    property As_PrintTitle: String read Fs_PrintTitle;
    property As_Address: String read Fs_Address;
    property As_Tel: String read Fs_Tel;
    property Ai_Size: Integer read Fi_Size;
    property Ai_IsFoot: Integer read Fi_IsFoot; 
    property IsReg: Boolean read Fb_IsReg;
    property As_SerialNum: String read Fs_SerialNum;
    property Ai_Count: Integer read Fi_Count;
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

function TdmData.pubf_Connect: Boolean;
var
  ls_ConStr, ls_AppPath, ls_DBMS, ls_DBDRV: string;
  lc_DatFile: TIniFile;  
  lp_RootPath: PChar;
begin
  ls_AppPath := ExtractFilePath(Application.ExeName); 
  lp_RootPath := PChar(LeftStr(Application.ExeName, 3));
  Fs_SerialNum := GetSerialNumber(lp_RootPath);
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
    ls_ConStr := Readstring('SETUP', 'CONSTRNET', '');
    Free;
  end;
  if (ls_DBMS = '') or (ls_DBDRV = '') or (ls_ConStr = '') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件损坏', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  ls_ConStr := stringReplace(ls_ConStr, '%PWD%', '',
    [rfReplaceAll, rfIgnoreCase]);
  try
    with adocon do
    begin
      if Connected then Close;
      Connectionstring := ls_ConStr;
      Open;
      Result := Connected;
      if Result then
      begin
        Fi_Count := prif_GetCount;
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

function TdmData.pubf_GetCardId: String;
var
  ls_ConsumeId: String;
  li_ConsumeId: integer;
const ls_Zero = '00000';
begin
  with Temp do
  begin
    if Active then Close;
    Connection := Adocon;
    SQL.Text := 'Select Max(card_id) as card_id FROM cardinfo';
    Open;
  end;
  if Temp.IsEmpty then
  begin
    ls_ConsumeId := '00001';
    Result := ls_ConsumeId;
    Temp.Close;
    Exit;
  end
  else
  begin
    ls_ConsumeId := Temp.FieldByName('card_id').AsString;
    Temp.Close;
    li_ConsumeId := StrToIntDef(ls_ConsumeId, 0);
    ls_ConsumeId := IntToStr(li_ConsumeId + 1);
    ls_ConsumeId := Copy(ls_Zero, 1, 5 - Length(ls_ConsumeId)) + ls_ConsumeId;
    Result := ls_ConsumeId;
  end;
end;

function TdmData.pubf_GetCustomerId: String;
var
  ls_ConsumeId: String;
  li_ConsumeId: integer;
const ls_Zero = '0000000000';
begin
  with Temp do
  begin
    if Active then Close;
    Connection := Adocon;
    SQL.Text := 'Select Max(cm_id) as cm_id FROM customerinfo';
    Open;
  end;
  if Temp.IsEmpty then
  begin
    ls_ConsumeId := '1000000001';
    Result := ls_ConsumeId;
    Temp.Close;
    Exit;
  end
  else
  begin
    ls_ConsumeId := Temp.FieldByName('cm_id').AsString;
    Temp.Close;
    li_ConsumeId := StrToIntDef(ls_ConsumeId, 0);
    ls_ConsumeId := IntToStr(li_ConsumeId + 1);
    ls_ConsumeId := Copy(ls_Zero, 1, 10 - Length(ls_ConsumeId)) + ls_ConsumeId;
    Result := ls_ConsumeId;
  end;
end;

function TdmData.pubp_GetConsumeId: String;
var
  ls_ConsumeId, ls_Date, ls_Date1: String;
  li_ConsumeId: integer;
const ls_Zero = '0000';
begin
  ls_Date := FormatDateTime('YYMMDD', Date);
  ls_Date1 := FormatDateTime('YYYY-MM-DD', Date);
  with Temp do
  begin
    if Active then Close;
    Connection := Adocon;
    SQL.Text := Format('Select Max(cs_id) as cs_id FROM consumeinfo WHERE cs_date = ''%s''',
      [ls_Date1]);
    Open;
  end;
  if Temp.IsEmpty then
  begin
    ls_ConsumeId := '0001';
    Result := ls_ConsumeId;
    Temp.Close;
    Exit;
  end
  else
  begin
    ls_ConsumeId := Copy(Temp.FieldByName('cs_id').AsString, 7, 4);
    Temp.Close;
    li_ConsumeId := StrToIntDef(ls_ConsumeId, 0);
    ls_ConsumeId := IntToStr(li_ConsumeId + 1);
    ls_ConsumeId := ls_Date + Copy(ls_Zero, 1, 4 - Length(ls_ConsumeId)) + ls_ConsumeId;
    Result := ls_ConsumeId;
  end;
end;  

function TdmData.prif_GetCount: Integer;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT iscount FROM sys_date';
    Open;
    Result := FieldByName('iscount').AsInteger;
  end;
end;

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

end.

