unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, AppEvnts, ImgList, dxBar, CSBarMDIMaster, FR_Desgn,
  CSBplPlugin, CSFRptFuncLib, CSScrCtrlChild, CommonLib;

type
  TfrmMain = class(TForm)
    stbGeneral: TStatusBar;
    AppEvents: TApplicationEvents;
    BarImageList: TImageList;
    BarMDIMaster: TCSBarMDIMaster;
    ReportDesigner: TfrDesigner;
    BarManager: TdxBarManager;
    miSystem: TdxBarSubItem;
    miWindow: TdxBarSubItem;
    miHelp: TdxBarSubItem;
    miLogOff: TdxBarButton;
    miArrange: TdxBarButton;
    miCascade: TdxBarButton;
    miHTile: TdxBarButton;
    miVTile: TdxBarButton;
    miTopic: TdxBarButton;
    miAbout: TdxBarButton;
    miWindowList: TdxBarListItem;
    miExit: TdxBarButton;
    miCTile: TdxBarButton;
    miSecurityMng: TdxBarButton;
    ScrChild: TCSScrCtrlChild;
    miChangePwd: TdxBarButton;
    FRptFuncLib: TCSFRptFuncLib;
    miPluginManage: TdxBarButton;
    miSysQuery: TdxBarSubItem;
    miIntQuery: TdxBarButton;
    miExtQuery: TdxBarButton;
    miOrgan: TdxBarSubItem;
    miPerson: TdxBarSubItem;
    miDevice: TdxBarSubItem;
    miSupr: TdxBarSubItem;
    miSysCode: TdxBarSubItem;
    miOrganMng: TdxBarButton;
    miOperation: TdxBarButton;
    miLicense: TdxBarSubItem;
    miOrganCertAdd: TdxBarButton;
    miOrganCertChange: TdxBarButton;
    miOrganCertExchg: TdxBarButton;
    miOrganCertLogout: TdxBarButton;
    miPersonMng: TdxBarButton;
    miExamTrain: TdxBarButton;
    miPerLcn: TdxBarSubItem;
    miPerLcnApply: TdxBarButton;
    miPerLcnLogo: TdxBarButton;
    miPerLcnchg: TdxBarButton;
    miPerLcnEngage: TdxBarButton;
    miDeviceMng: TdxBarButton;
    miBeginWork: TdxBarButton;
    miSuprExamMng: TdxBarButton;
    miAccidentMng: TdxBarButton;
    miBaseCode: TdxBarButton;
    miDeviceCode: TdxBarButton;
    miPerLcnIssue: TdxBarButton;
    miSuprNotice: TdxBarButton;
    miDataExchg: TdxBarSubItem;
    miDataExport: TdxBarButton;
    miDataImport: TdxBarButton;
    miPerInfract: TdxBarButton;
    miPerLcnLogin: TdxBarButton;
    miPerChk: TdxBarButton;
    miSuprStatistics: TdxBarButton;
    miAccidentCode: TdxBarButton;
    miOrganCode: TdxBarButton;
    miContentTemplet: TdxBarButton;
    miUserInfoForAcc: TdxBarButton;
    miPersonCode: TdxBarButton;
    miAcct: TdxBarSubItem;
    miServerConfig: TdxBarButton;
    miClientConfig: TdxBarButton;
    miServerActive: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure AppEventsHint(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miArrangeClick(Sender: TObject);
    procedure miCascadeClick(Sender: TObject);
    procedure miHTileClick(Sender: TObject);
    procedure miVTileClick(Sender: TObject);
    procedure miTopicClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miLogOffClick(Sender: TObject);
    procedure miCTileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miSecurityMngClick(Sender: TObject);
    procedure miChangePwdClick(Sender: TObject);
    procedure ScrChildSetControl(Sender: TObject;
      var Ab_AutoMatic: Boolean; Ac_Control: TComponent;
      As_ExtArg: String);
    procedure miIntQueryClick(Sender: TObject);
    procedure AppEventsSettingChange(Sender: TObject; Flag: Integer;
      const Section: String; var Result: Integer);
    procedure miExtQueryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miPluginManageClick(Sender: TObject);
    procedure miOrganMngClick(Sender: TObject);
    procedure miOperationClick(Sender: TObject);
    procedure miOrganCertAddClick(Sender: TObject);
    procedure miOrganCertChangeClick(Sender: TObject);
    procedure miOrganCertExchgClick(Sender: TObject);
    procedure miOrganCertLogoutClick(Sender: TObject);
    procedure miPersonMngClick(Sender: TObject);
    procedure miExamTrainClick(Sender: TObject);
    procedure miPerLcnApplyClick(Sender: TObject);
    procedure miPerLcnIssueClick(Sender: TObject);
    procedure miPerLcnLogoClick(Sender: TObject);
    procedure miPerLcnEngageClick(Sender: TObject);
    procedure miDeviceMngClick(Sender: TObject);
    procedure miBeginWorkClick(Sender: TObject);
    procedure miSuprExamMngClick(Sender: TObject);
    procedure miAccidentMngClick(Sender: TObject);
    procedure miSuprNoticeClick(Sender: TObject);
    procedure miDataExportClick(Sender: TObject);
    procedure miDataImportClick(Sender: TObject);
    procedure miPerInfractClick(Sender: TObject);
    procedure miPerLcnLoginClick(Sender: TObject);
    procedure miPerChkClick(Sender: TObject);
    procedure miSuprStatisticsClick(Sender: TObject);
    procedure miBaseCodeClick(Sender: TObject);
    procedure miAccidentCodeClick(Sender: TObject);
    procedure miOrganCodeClick(Sender: TObject);
    procedure miContentTempletClick(Sender: TObject);
    procedure miPerLcnchgClick(Sender: TObject);
    procedure miUserInfoForAccClick(Sender: TObject);
    procedure miDeviceCodeClick(Sender: TObject);
    procedure miPersonCodeClick(Sender: TObject);
    procedure miServerActiveClick(Sender: TObject);
    procedure miServerConfigClick(Sender: TObject);
    procedure miClientConfigClick(Sender: TObject);
  private
    Fb_ForceClose: Boolean;
    Fc_AfterLoad: TCSBplPluginAfterLoad;
    procedure prip_Ini;
    function prif_LoadBarSettings: Boolean;
    procedure prip_ShowUserId;
    procedure prip_CloseAllChildren;
    procedure prip_Logoff;
    procedure prip_AfterLoad(As_FileName: String; const Ai_ModuleIndex: Integer;
      var Ab_StopLoadAll: Boolean);
    procedure prip_SetCommRelatedMenu(const Ab_Show: Boolean);
    procedure CMForceClose(var Msg: TMessage); message CM_FORCECLOSE; 
    procedure CMMenuItemClick(var Msg: TMessage); message CM_MENUITEMCLICK;
    procedure CMMFLoadPlugin(var Msg: TMessage); message CM_MFLOADPLUGIN;
    procedure CMMFUnloadPlugin(var Msg: TMessage); message CM_MFUNLOADPLUGIN;
  public
    function pubf_Ini: Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  CSVCLUtils, CSScrCtrlMaster, udmData, ufrmSplash, ufrmOrganMng,
  ufrmOrganCertMng, ufrmOrganCertList, ufrmPersonMng, ufrmPersonLicnsMng,
  ufrmPsnLcnList, ufrmPsninfract, ufrmPsnTrainTest, ufrmDeviceManage,
  ufrmBeginWorkList, ufrmSuprExam, ufrmSuprNotice, ufrmSuprTotal,
  ufrmAcctManage, ufrmAcctUserSetting, ufrmIntQuery, ufrmExtQuery,
  ufrmDataExport, ufrmDataImport, CommService, ufrmBaseCode, ufrmDeviceCode,
  ufrmOrganCode, ufrmPersonCode, ufrmAccidentCode, ufrmContentTemplet,
  ufrmPluginManage;

{$R *.dfm}

const
  PANEL_USER = 0;
  PANEL_HINT = 2;
  LOADPLUGINTIP = '正在载入插件，请稍候...';

function TfrmMain.prif_LoadBarSettings: Boolean;
var
  li_i: Integer;
begin
  try
    //Initialize BarItem enable settings
    with BarManager do
      for li_i := 0 to ItemCount - 1 do Items[li_i].Enabled := True;
    //Load settings from registry
    with BarManager, ScrChild.Master do
    begin
      RegistryPath := RK_MENUOPTION;
      LoadFromRegistry(RegistryPath);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmMain.prip_AfterLoad(As_FileName: String;
  const Ai_ModuleIndex: Integer; var Ab_StopLoadAll: Boolean);
begin
  frmSplash.SplashTip := LOADPLUGINTIP + #13#10 +
    dmData.PluginMaster.Modules[Ai_ModuleIndex].Name;
  frmSplash.Update;

  if dmData.PluginMaster.Modules[Ai_ModuleIndex].Identifier = PLUGIN_COMM then
    prip_SetCommRelatedMenu(True);

  if Assigned(Fc_AfterLoad) then
    Fc_AfterLoad(As_FileName, Ai_ModuleIndex, Ab_StopLoadAll);
end;

procedure TfrmMain.prip_CloseAllChildren;
var
  li_i: Integer;
begin
  for li_i := MDIChildCount - 1 downto 0 do
  begin
    SendMessage(MDIChildren[li_i].Handle, CM_FORCECLOSE, MSGWP_FORCECLOSE,
      MSGLP_FORCECLOSE);
    MDIChildren[li_i].Close;
  end;
end;

procedure TfrmMain.prip_Ini;
begin
  //Initialize system global format strings
  ShortDateFormat := 'yyyy-MM-dd';
  ShortTimeFormat := 'hh:nn:ss';

  //Initialize global objects' references
  frmSplash := nil;
  dmData := nil;
  Gc_ComnBridges := nil;

  //Initialize all always-single-one MDI Childs' references
  frmOrganMng := nil;

  frmPersonMng := nil;
  frmPsnTrainTest := nil;
  frmPsninfract := nil;

  frmDeviceManage := nil;
  frmBeginWorkList := nil;

  frmSuprExam := nil;
  frmSuprNotice := nil;
  frmSuprTotal := nil;
  frmAcctManage := nil;

  frmBaseCode := nil;
  frmDeviceCode := nil;
  frmOrganCode := nil;
  frmPersonCode := nil;
  frmAccidentCode := nil;
  frmContentTemplet := nil;
  
  frmPluginManage := nil;
  
  Fb_ForceClose := False;
  Fc_AfterLoad := nil;
end;

procedure TfrmMain.prip_Logoff;
var
  lb_Result: Boolean;
begin
  prip_CloseAllChildren;
  Hide;
  with ScrChild.Master do
  begin
    lb_Result := Logon;
    if lb_Result then lb_Result := InitSecurity;
  end;
  if lb_Result then lb_Result := prif_LoadBarSettings;
  if lb_Result then
  begin
    ScrChild.SetSecurity(Self);
    prip_ShowUserId;
    Show;
  end else
    PostMessage(Self.Handle, CM_FORCECLOSE, MSGWP_FORCECLOSE, MSGLP_FORCECLOSE);
end;

procedure TfrmMain.prip_SetCommRelatedMenu(const Ab_Show: Boolean);
var
  lc_Visible: TdxBarItemVisible;
begin
  if Ab_Show then lc_Visible := ivAlways else lc_Visible := ivNever;
  miServerConfig.Visible := lc_Visible;
  miServerActive.Visible := lc_Visible;
  miClientConfig.Visible := lc_Visible;
  if lc_Visible = ivNever then miServerActive.Down := False;
end;

procedure TfrmMain.prip_ShowUserId;
begin
  stbGeneral.Panels[PANEL_USER].Text := '当前用户：' + ScrChild.Master.UserId;
end;

procedure TfrmMain.CMForceClose(var Msg: TMessage);
begin
  with Msg do
    if (WParam = MSGWP_FORCECLOSE) and (LParam = MSGLP_FORCECLOSE) then
    begin
      Fb_ForceClose := True;
      Close;
    end;
end;

procedure TfrmMain.CMMenuItemClick(var Msg: TMessage);
begin
  if Msg.WParam = MSGWP_MENUITEMCLICK then
    Gc_ComnBridges.Items(Msg.LParam).Proc(nil);
end;

procedure TfrmMain.CMMFLoadPlugin(var Msg: TMessage);
begin
  if Msg.WParam = MSGWP_MFLOADPLUGIN then
    if dmData.PluginMaster.Modules[Msg.LParam].Identifier = PLUGIN_COMM then
      prip_SetCommRelatedMenu(True); 
end;

procedure TfrmMain.CMMFUnloadPlugin(var Msg: TMessage);
begin
  if Msg.WParam = MSGWP_MFUNLOADPLUGIN then
    if dmData.PluginMaster.Modules[Msg.LParam].Identifier = PLUGIN_COMM then
      prip_SetCommRelatedMenu(False);
end;

function TfrmMain.pubf_Ini: Boolean;
var
  li_i: Integer;
begin
  //TODO: Some registry operations are to be added when this system is to be
  //  made into a final product

  //TODO: Some rockey related initialization and checking operations are to be
  //  added when this system is to be made into a final product. Note: other
  //  forms (especially main function forms) should also need rockey checking
  //  operations

  //Initialize global variables (not include objects)
  Gs_AppDir := ExcludeTrailingPathDelimiter(ExtractFileDir(
    Application.ExeName));
  Gs_AppPath := ExtractFilePath(Application.ExeName);

  //Load help
  Application.HelpFile := Gs_AppPath + ChangeFileExt(ExtractFileName(
    Application.ExeName), '.hlp');

  //Show splash
  frmSplash := TfrmSplash.Create(nil);
  frmSplash.AppName := Application.Title;
  //TODO: The way to get version is to be enhanced when this system is to be
  //  made into a final product
  frmSplash.Version := '2.0';
  frmSplash.Copyright := 'Copyright (c) 2002-2003 上海荣恒信息技术开发公司';
  frmSplash.Update;
  frmSplash.Show;

  //Create data module and establish connection
  frmSplash.SplashTip := '正在连接数据库，请稍候...';
  frmSplash.Update;
  dmData := TdmData.Create(nil);
  Result := dmData.pubf_Connect;

  //Try to logon system
  if Result then
  begin
    frmSplash.SplashTip := '登录系统...';
    frmSplash.Update;
    Result := ScrChild.Master.Logon;
  end;

  //Initialize security
  if Result then
  begin
    frmSplash.SplashTip := '系统正在初始化，请稍候...';
    frmSplash.Update;
    Result := ScrChild.Master.InitSecurity;
  end;

  //Load bar settings
  if Result then Result := prif_LoadBarSettings;

  //Set window security
  if Result then Result := ScrChild.SetSecurity(Self);

  //Show user
  if Result then prip_ShowUserId;

  //Create global bridges holding object
  if Result then
  begin
    Gc_ComnBridges := TCSComnBridges.Create;
    with BarManager do
      for li_i := 0 to ItemCount - 1 do
        Gc_ComnBridges.Add(Self.Handle, Items[li_i].Name, Items[li_i].OnClick);
    Gc_ComnBridges.Add(Integer(Gc_PsnAssistant), Gc_PsnAssistant.ClassName,
      Gc_PsnAssistant.pubp_Call);
  end;

  if Result then
  begin
    //Load user configuration
    Gp_LoadUserConfig;

    //Load plugins
    prip_SetCommRelatedMenu(False);
    with dmData.PluginMaster do
    begin
      PluginPath := Gs_AppPath + PLUGIN_PATH;
      frmSplash.SplashTip := LOADPLUGINTIP;
      frmSplash.Update;
      Fc_AfterLoad := AfterLoad;
      try
        AfterLoad := prip_AfterLoad;
        LoadAllPlugin;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar(E.Message), PChar(Caption),
            MB_OK + MB_ICONERROR);
          Result := False;
        end;
      end;
      AfterLoad := Fc_AfterLoad;
    end;
  end;

  //Close splash
  frmSplash.Close;
end;

procedure TfrmMain.AppEventsHint(Sender: TObject);
begin
  stbGeneral.Panels[PANEL_HINT].Text := Application.Hint;
end;

procedure TfrmMain.AppEventsSettingChange(Sender: TObject; Flag: Integer;
  const Section: String; var Result: Integer);
begin
  if ShortDateFormat <> 'yyyy-MM-dd' then ShortDateFormat := 'yyyy-MM-dd';
end;

procedure TfrmMain.ScrChildSetControl(Sender: TObject;
  var Ab_AutoMatic: Boolean; Ac_Control: TComponent; As_ExtArg: String);
begin
  if Ac_Control is TdxBarItem then
    with TCSScrCtrlMaster(Sender).InfoBuf, Ac_Control as TdxBarItem do
    begin
      case FieldByName('enable').AsInteger of
        CSSC_ALLOW: Enabled := True;
        CSSC_FORBID: Enabled := False;
      end;
      case FieldByName('visible').AsInteger of
        CSSC_ALLOW: Visible := ivAlways;
        CSSC_FORBID: Visible := ivNever;
      end;
      Ab_AutoMatic := False;
    end
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  prip_Ini;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  dmData.PluginMaster.UnloadAllPlugin;
  if Gc_ComnBridges <> nil then Gc_ComnBridges.Free;
  if frmSplash <> nil then frmSplash.Free;
  if dmData <> nil then dmData.Free;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Fb_ForceClose then CanClose := True
  else if Application.MessageBox('您确定要退出系统吗?',
      PChar(Application.Title), MB_OKCANCEL + MB_ICONQUESTION) = IDCANCEL then
    CanClose := False;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  prip_CloseAllChildren;
  Gp_SaveUserConfig;
end;

procedure TfrmMain.miLogOffClick(Sender: TObject);
begin
  prip_Logoff;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miArrangeClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmMain.miCascadeClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmMain.miHTileClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmMain.miVTileClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmMain.miCTileClick(Sender: TObject);
begin
  ClientTileAll;
end;

procedure TfrmMain.miTopicClick(Sender: TObject);
begin
  //TODO: To complete this event handler
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  frmSplash.pubp_ShowAsDialog;
  frmSplash.ShowModal;
end;

procedure TfrmMain.miSecurityMngClick(Sender: TObject);
begin
  with dmData.ScrMaster do UserDefine(LowerCase(UserId) = 'administrator');
  {
  if frmPersonManage = nil then
  begin
    frmPersonManage := TfrmPersonManage.Create(Self);
    with frmPersonManage do
      try
        pubp_Ini;
      except
        Free;
        frmPersonManage := nil;
        raise;
      end;
  end else frmPersonManage.Show;
  }
end;

procedure TfrmMain.miChangePwdClick(Sender: TObject);
begin
  with ScrChild.Master do ChangePwd(UserId, True);
end;

procedure TfrmMain.miPluginManageClick(Sender: TObject);
begin
  if frmPluginManage = nil then
  begin
    frmPluginManage := TfrmPluginManage.Create(Self);
    with frmPluginManage do
      try
        pubp_Ini;
      except
        Free;
        frmPluginManage := nil;
        raise;
      end;
  end else frmPluginManage.Show;
end;

procedure TfrmMain.miOrganMngClick(Sender: TObject);
begin
  if frmOrganMng = nil then
  begin
    frmOrganMng := TfrmOrganMng.Create(Self);
    with frmOrganMng do
      try
        pubp_Ini(False);
      except
        Free;
        frmOrganMng := nil;
        raise;
      end;
  end else frmOrganMng.Show;
end;

procedure TfrmMain.miOperationClick(Sender: TObject);
begin
  //TODO: To be finished
end;

procedure TfrmMain.miOrganCertAddClick(Sender: TObject);
var
  lc_Arg: TStrings;
  lc_OrganCertMng: TfrmOrganCertMng;
begin
  lc_Arg := TStringList.Create;
  try
    lc_Arg.Add('');
    lc_Arg.Add('');

    lc_OrganCertMng := TfrmOrganCertMng.Create(nil);
    with lc_OrganCertMng do
      try
        pubp_Ini(AM_OCMADD, lc_Arg);
        ShowModal;
      finally
        Free;
      end;
  finally
    lc_Arg.Free;
  end;
end;

procedure TfrmMain.miOrganCertChangeClick(Sender: TObject);
begin
  frmOrganCertList := TfrmOrganCertList.Create(nil);
  with frmOrganCertList do
    try
      pubp_Ini(AM_OCMCHANGE);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miOrganCertExchgClick(Sender: TObject);
begin
  frmOrganCertList := TfrmOrganCertList.Create(nil);
  with frmOrganCertList do
    try
      pubp_Ini(AM_OCMEXCHANGE);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miOrganCertLogoutClick(Sender: TObject);
begin
  frmOrganCertList := TfrmOrganCertList.Create(nil);
  with frmOrganCertList do
    try
      pubp_Ini(AM_OCMLOGOUT);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPersonMngClick(Sender: TObject);
begin
  if frmPersonMng = nil then
  begin
    frmPersonMng := TfrmPersonMng.Create(Self);
    with frmPersonMng do
      try
        pubp_Ini(False);
      except
        Free;
        frmPersonMng := nil;
        raise;
      end;
  end else frmPersonMng.Show;
end;

procedure TfrmMain.miExamTrainClick(Sender: TObject);
begin
  if frmPsnTrainTest = nil then
  begin
    frmPsnTrainTest := TfrmPsnTrainTest.Create(Self);
    with frmPsnTrainTest do
      try
        pubp_Ini(False);
      except
        Free;
        frmPsnTrainTest := nil;
        raise;
      end;
  end else frmPsnTrainTest.Show;
end;

procedure TfrmMain.miPerInfractClick(Sender: TObject);
begin
  if frmPsninfract = nil then
  begin
    frmPsninfract := TfrmPsninfract.Create(Self);
    with frmPsninfract do
      try
        pubp_Ini(False);
      except
        Free;
        frmPsninfract := nil;
        raise;
      end;
  end else frmPsninfract.Show;
end;

procedure TfrmMain.miPerLcnLoginClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMLOGI);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerLcnApplyClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMAPPL);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerLcnIssueClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMISSU);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerLcnLogoClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMLOGO);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerLcnchgClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMUPDA);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerLcnEngageClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMENGA);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miPerChkClick(Sender: TObject);
var
  lc_PsnLcnList: TfrmPsnLcnList;
begin
  lc_PsnLcnList := TfrmPsnLcnList.Create(nil);
  with lc_PsnLcnList do
    try
      pubp_Ini(AM_PLMCHEC);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miDeviceMngClick(Sender: TObject);
begin
  if frmDeviceManage = nil then
  begin
    frmDeviceManage := TfrmDeviceManage.Create(Self);
    with frmDeviceManage do
      try
        pubp_Ini(AM_DMBROWSEDEVICE);
      except
        Free;
        frmDeviceManage := nil;
        raise;
      end;
  end else frmDeviceManage.Show;
end;

procedure TfrmMain.miBeginWorkClick(Sender: TObject);
begin
  if frmBeginWorkList = nil then
  begin
  	frmBeginWorkList := TfrmBeginWorkList.Create(Self);
    with frmBeginWorkList do
      try
        pubp_Ini;
      except
        Free;
        frmBeginWorkList := nil;
        raise;
      end;
  end else frmBeginWorkList.Show;
end;

procedure TfrmMain.miSuprExamMngClick(Sender: TObject);
begin
  if frmSuprExam = nil then
  begin
    frmSuprExam := TfrmSuprExam.Create(Self);
    with frmSuprExam do
      try
        pubp_Ini;
      except
        Free;
        frmSuprExam := nil;
        raise;
      end;
  end else frmSuprExam.Show;
end;

procedure TfrmMain.miSuprNoticeClick(Sender: TObject);
begin
  if frmSuprNotice = nil then
  begin
    frmSuprNotice := TfrmSuprNotice.Create(Self);
    with frmSuprNotice do
      try
        pubp_Ini;
      except
        Free;
        frmSuprNotice := nil;
        raise;
      end;
  end else frmSuprNotice.Show;
end;

procedure TfrmMain.miSuprStatisticsClick(Sender: TObject);
begin
  if frmSuprTotal = nil then
  begin
    frmSuprTotal := TfrmSuprTotal.Create(Self);
    with frmSuprTotal do
      try
        pubp_Ini;
      except
        Free;
        frmSuprTotal := nil;
        raise;
      end;
  end else frmSuprTotal.Show;
end;

procedure TfrmMain.miAccidentMngClick(Sender: TObject);
begin
{  if frmAcctManage = nil then
  begin
    frmAcctManage := TfrmAcctManage.Create(Self);
    with frmAcctManage do
      try
        pubp_Ini;
      except
        Free;
        frmAcctManage := nil;
        raise;
      end;
  end else frmAcctManage.Show;   }
end;

procedure TfrmMain.miUserInfoForAccClick(Sender: TObject);
begin
  frmAcctUserSetting := TfrmAcctUserSetting.Create(nil);
  with frmAcctUserSetting do
    try
      pubp_Ini;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miIntQueryClick(Sender: TObject);
begin
  frmIntQuery := TfrmIntQuery.Create(nil);
  with frmIntQuery do
    try
      if Sender is TStrings then pubp_Ini(TStrings(Sender))
      else begin
        pubp_Ini;
        ShowModal;
      end;
    finally
      Free;
    end;
end;

procedure TfrmMain.miExtQueryClick(Sender: TObject);
begin
  frmExtQuery := TfrmExtQuery.Create(nil);
  with frmExtQuery do
    try
      pubp_Ini;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miDataExportClick(Sender: TObject);
begin
  frmDataExport := TfrmDataExport.Create(nil);
  with frmDataExport do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miDataImportClick(Sender: TObject);
begin
  frmDataImport := TfrmDataImport.Create(nil);
  with frmDataImport do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.miServerConfigClick(Sender: TObject);
begin
  Gc_ServerService.pubp_ServerConfig;
end;

procedure TfrmMain.miServerActiveClick(Sender: TObject);
begin
  with miServerActive do Down := Gc_ServerService.pubf_ServerActive(Down);
end;

procedure TfrmMain.miClientConfigClick(Sender: TObject);
begin
  Gc_ClientService.pubp_ClientConfig;
end;

procedure TfrmMain.miBaseCodeClick(Sender: TObject);
begin
  if frmBaseCode = nil then
  begin
    frmBaseCode := TfrmBaseCode.Create(Self);
    with frmBaseCode do
      try
        pubp_Ini(True);
      except
        Free;
        frmBaseCode := nil;
        raise;
      end;
  end else frmBaseCode.Show;
end;

procedure TfrmMain.miDeviceCodeClick(Sender: TObject);
begin
  if frmDeviceCode = nil then
  begin
    frmDeviceCode := TfrmDeviceCode.Create(Self);
    with frmDeviceCode do
      try
        pubp_Ini(True);
      except
        Free;
        frmDeviceCode := nil;
        raise;
      end;
  end else frmDeviceCode.Show;
end;

procedure TfrmMain.miOrganCodeClick(Sender: TObject);
begin
  if frmOrganCode = nil then
  begin
    frmOrganCode := TfrmOrganCode.Create(Self);
    with frmOrganCode do
      try
        pubp_Ini(True);
      except
        Free;
        frmOrganCode := nil;
        raise;
      end;
  end else frmOrganCode.Show;
end;

procedure TfrmMain.miPersonCodeClick(Sender: TObject);
begin
  if frmPersonCode = nil then
  begin
    frmPersonCode := TfrmPersonCode.Create(Self);
    with frmPersonCode do
      try
        pubp_Ini(True);
      except
        Free;
        frmPersonCode := nil;
        raise;
      end;
  end else frmPersonCode.Show;
end;

procedure TfrmMain.miAccidentCodeClick(Sender: TObject);
begin
  if frmAccidentCode = nil then
  begin
    frmAccidentCode := TfrmAccidentCode.Create(Self);
    with frmAccidentCode do
      try
        pubp_Ini(True);
      except
        Free;
        frmAccidentCode := nil;
        raise;
      end;
  end else frmAccidentCode.Show;
end;

procedure TfrmMain.miContentTempletClick(Sender: TObject);
begin
  if frmContentTemplet = nil then
  begin
    frmContentTemplet := TfrmContentTemplet.Create(Self);
    with frmContentTemplet do
      try
        pubp_Ini(True);
      except
        Free;
        frmContentTemplet := nil;
        raise;
      end;
  end else frmContentTemplet.Show;
end;

end.
