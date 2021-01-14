unit CommService;

interface

uses
  Classes, CSBplPlugin, OtherMng_PBCCommon;

type
  TCSCommServerService = class
  public
    procedure pubp_ServerConfig;
    function pubf_ServerActive(const Ab_Active: Boolean): Boolean;
  end;

  TCSCommClientService = class
  public
    procedure pubp_ClientConfig;
    function pubf_Connect(var As_Msg: string; const Ab_AbsoluteWork,
      Ab_CheckTimely: Boolean; Ac_MsgReciever: TComponent;
      Ac_MsgHandler: TBpaCommMsgHandler): Integer;
    procedure pubp_DisConnect;
    function pubf_SendFile(const As_FileName: string;
      var As_Msg: string): Integer;
  end;

var
  Gc_ServerService: TCSCommServerService;
  Gc_ClientService: TCSCommClientService;

implementation

uses
  Windows, SysUtils, Forms, udmData, CommonLib;

function Gf_GetPluginModule: TCSBplPluginModule;
var
  li_Index: Integer;
begin
  li_Index := dmData.PluginMaster.IndexOf(PLUGIN_COMM);
  if li_Index >= 0 then Result := dmData.PluginMaster.Modules[li_Index]
  else Result := nil;
end;

{ TCSCommServerService }

function TCSCommServerService.pubf_ServerActive(
  const Ab_Active: Boolean): Boolean;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then
  begin
    Result := not Ab_Active;
    Exit;
  end;

  if Ab_Active then
  begin
    if Application.MessageBox('您确定要启动通讯服务器吗?', '确认',
      MB_OKCANCEL + MB_ICONQUESTION) = IDCANCEL then
    begin
      Result := not Ab_Active;
      Exit;
    end;
  end else begin
    if Application.MessageBox('您确定要停止通讯服务器吗?', '确认',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then
    begin
      Result := not Ab_Active;
      Exit;
    end;
  end;

  lc_Args := TStringList.Create;
  try
    if Ab_Active then
    begin
      lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_SRVSTR), nil);
      lc_Args.AddObject(Gs_AppPath + USERCONFIG_NAME, nil);
      lc_Args.AddObject('', nil);
    end else lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_SRVSTP), nil);

    if Ab_Active then Gp_ProgressHint('正在启动通讯服务器，请稍候...')
    else Gp_ProgressHint('正在停止通讯服务器，请稍候...');
    try
      lc_Mod.MainIntf(lc_Args);
    finally
      Gp_ProgressHint;
    end;

    Result := False;
    if Ab_Active then
    begin
      if Integer(lc_Args.Objects[0]) = PLGBPACOMM_RTC_SRVSTROK then
      begin
        Result := True;
        with Application do MessageBox('通讯服务器已启动', PChar(Title));
      end;
    end else with Application do MessageBox('通讯服务器已停止', PChar(Title));
  finally
    lc_Args.Free;
  end;
end;

procedure TCSCommServerService.pubp_ServerConfig;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then Exit;

  lc_Args := TStringList.Create;
  try
    lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_SRVCFG), nil);
    lc_Args.AddObject(Gs_AppPath + USERCONFIG_NAME, nil);

    lc_Mod.MainIntf(lc_Args);
  finally
    lc_Args.Free;
  end;
end;

{ TCSCommClientService }

function TCSCommClientService.pubf_Connect(var As_Msg: string;
  const Ab_AbsoluteWork, Ab_CheckTimely: Boolean; Ac_MsgReciever: TComponent;
  Ac_MsgHandler: TBpaCommMsgHandler): Integer;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then
  begin
    Result := -1;
    Exit;
  end;

  lc_Args := TStringList.Create;
  try
    lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_CLNSTR), nil);
    lc_Args.AddObject(Gs_AppPath + USERCONFIG_NAME, nil);
    lc_Args.AddObject(BoolToStr(Ab_AbsoluteWork), Ac_MsgReciever);
    lc_Args.AddObject(BoolToStr(Ab_CheckTimely), @Ac_MsgHandler);

    lc_Mod.MainIntf(lc_Args);

    Result := Integer(lc_Args.Objects[0]);
    As_Msg := lc_Args.Strings[0];
  finally
    lc_Args.Free;
  end;
end;

function TCSCommClientService.pubf_SendFile(const As_FileName: string;
  var As_Msg: string): Integer;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then
  begin
    Result := -1;
    Exit;
  end;

  lc_Args := TStringList.Create;
  try
    lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_CLNSF), nil);
    lc_Args.AddObject(As_FileName, nil);

    lc_Mod.MainIntf(lc_Args);

    Result := Integer(lc_Args.Objects[0]);
    As_Msg := lc_Args.Strings[0];
  finally
    lc_Args.Free;
  end;
end;

procedure TCSCommClientService.pubp_ClientConfig;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then Exit;

  lc_Args := TStringList.Create;
  try
    lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_CLNCFG), nil);
    lc_Args.AddObject(Gs_AppPath + USERCONFIG_NAME, nil);

    lc_Mod.MainIntf(lc_Args);
  finally
    lc_Args.Free;
  end;
end;

procedure TCSCommClientService.pubp_DisConnect;
var
  lc_Args: TStrings;
  lc_Mod: TCSBplPluginModule;
begin
  lc_Mod := Gf_GetPluginModule;
  if lc_Mod = nil then Exit;

  lc_Args := TStringList.Create;
  try
    lc_Args.AddObject(IntToStr(PLGBPACOMM_CMD_CLNSTP), nil);
    lc_Args.AddObject(Gs_AppPath + USERCONFIG_NAME, nil);

    lc_Mod.MainIntf(lc_Args);
  finally
    lc_Args.Free;
  end;
end;

initialization
Gc_ServerService := TCSCommServerService.Create;
Gc_ClientService := TCSCommClientService.Create;

finalization
Gc_ServerService.Free;
Gc_ClientService.Free;

end.
