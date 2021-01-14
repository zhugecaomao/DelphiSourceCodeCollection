library uncon;

uses
  Windows,
  Registry,
  SysUtils,
  Messages,
  UClearHistory in 'UClearHistory.pas' {FrmClearHistory},
  UColor in 'UColor.pas' {FrmColor},
  UStartMana in 'UStartMana.pas' {FrmStartMana},
  UTaskMana in 'UTaskMana.pas' {FrmTaskMana};

{$R *.res}

function LastPos(Needle: Char; Haystack: String): word;
begin
  for Result := Length(Haystack) downto 1 do
    if Haystack[Result] = Needle then Break
end;

function RegSetValue(RootKey: HKEY; Name: String; ValType: Cardinal; PVal: Pointer; ValSize: Cardinal): boolean;
var
  SubKey: String; n: word;
  dispo: DWORD; hTemp: HKEY;
begin
  Result := False;
  n := LastPos('\', Name);
  if n > 0 then
  begin
    SubKey := Copy(Name, 1, n - 1);
    if RegCreateKeyEx(RootKey, PChar(SubKey), 0, nil, REG_OPTION_NON_VOLATILE, KEY_WRITE, nil, hTemp, @dispo) = ERROR_SUCCESS then
    begin
      SubKey := Copy(Name, n + 1, Length(Name) - n);
      if SubKey = '' then
        Result := (RegSetValueEx(hTemp, nil, 0, ValType, PVal, ValSize) = ERROR_SUCCESS)
      else
        Result := (RegSetValueEx(hTemp, PChar(SubKey), 0, ValType, PVal, ValSize) = ERROR_SUCCESS);
        RegCloseKey(hTemp);
    end;
  end;
end;

function RegSetDword(RootKey: HKEY; Name: String; Value: Cardinal): boolean;stdcall;
begin
  Result := RegSetValue(RootKey, Name, REG_DWORD, @Value, SizeOf(Cardinal))
end;

procedure BroadcastChanges;
var success: DWORD;
begin
  SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, SPI_SETNONCLIENTMETRICS, 0, SMTO_ABORTIFHUNG, 10000, success)
end;

function RefreshScreenIcons : Boolean;stdcall; //重建图标缓存
const 
  KEY_TYPE = HKEY_CURRENT_USER; 
  KEY_NAME = 'Control Panel\Desktop\WindowMetrics'; 
  KEY_VALUE = 'Shell Icon Size';
var Reg: TRegistry; sDataRet, sDataRet2: string;
begin 
  Result := False; 
  Reg := TRegistry.Create; 
  try 
    Reg.RootKey := KEY_TYPE;
    if Reg.OpenKey(KEY_NAME, False) then 
    begin
      sDataRet := Reg.ReadString(KEY_VALUE);
      Reg.CloseKey; 
      if sDataRet <> '' then
      begin
      sDataRet2 := IntToStr(StrToInt(sDataRet) - 1);
        if Reg.OpenKey(KEY_NAME, False) then 
        begin
          Reg.WriteString(KEY_VALUE, sDataRet2);
          Reg.CloseKey;
          BroadcastChanges;
          if Reg.OpenKey(KEY_NAME, False) then 
          begin 
            Reg.WriteString(KEY_VALUE, sDataRet);
            Reg.CloseKey;
            BroadcastChanges;
            Result := True; 
          end; 
        end; 
      end; 
    end; 
  finally
    Reg.Free;
  end; 
end;

procedure ClearHistory;stdcall;
begin
  FrmClearHistory:=TFrmClearHistory.Create(nil);
  FrmClearHistory.ShowModal;
  FrmClearHistory.Free;
end;

procedure ColorSet;stdcall;
begin
  FrmColor:=TFrmColor.Create(nil);
  FrmColor.ShowModal;
  FrmColor.Free;
end;

procedure StartMana;stdcall;
begin
  FrmStartMana:=TFrmStartMana.Create(nil);
  FrmStartMana.ShowModal;
  FrmStartMana.Free;
end;

procedure TaskMana;stdcall;
begin
  FrmTaskMana:=TFrmTaskMana.Create(nil);
  FrmTaskMana.ShowModal;
  FrmTaskMana.Free;
end;

//dll文件导出的函数及过程列表
exports
  RegSetDword,        //设置注册表双字节值
  RefreshScreenIcons, //重建图标缓存
  ClearHistory,       //清除历史记录
  ColorSet,           //菜单及登录背景色
  StartMana,          //迷你启动管理器
  TaskMana;           //迷你任务管理器

begin
end.
 