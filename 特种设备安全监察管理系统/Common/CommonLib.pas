unit CommonLib;

interface

uses
  Classes, Windows, Messages, Graphics;

const
  {顶级地区代码}
  TOPAREACODE = '32%';
  {地区级别}
  PROVINCELEVEL = 1;
  CITYLEVEL = 2;
  BOROUTHLEVEL = 3;
  RESERVEDLEVEL = 4;

  {各类机构性质代码}
  SUPERVISOR_SIGN   = $0001; {监察}
  MANU_SIGN         = $0002; {制造}
  INST_SIGN         = $0004; {安装}
  REPAIR_SIGN       = $0008; {维保}
  VERIFY_SIGN       = $0010; {检验}
  VERIFYACCEPT_SIGN = $0020; {验收}
  BUILDER_SIGN      = $0040; {土建施工}
  BUILDVERIFY_SIGN  = $0080; {土建验收}
  ASSES_SIGN        = $0100; {考核}
  RINSE_SIGN        = $0200; {清洗}
  FILL_SIGN         = $0400; {充装}
  USER_SIGN         = $0800; {使用}
  PROPERTY_SIGN     = $1000; {产权}
  DESIGN_SIGN       = $2000; {设计}
  AUDITOR_SIGN      = $4000; {审图}

  CATEGORY_IDS: array[1..15] of Integer = (SUPERVISOR_SIGN, MANU_SIGN,
    INST_SIGN, REPAIR_SIGN, VERIFY_SIGN, VERIFYACCEPT_SIGN, BUILDER_SIGN,
    BUILDVERIFY_SIGN, ASSES_SIGN, RINSE_SIGN, FILL_SIGN, USER_SIGN,
    PROPERTY_SIGN, DESIGN_SIGN, AUDITOR_SIGN);
  CATEGORY_NAMES: array[1..15] of string = ('监察', '制造', '安装', '维保',
    '检验', '验收', '土建施工', '土建验收', '考核', '清洗', '充装', '使用',
    '产权', '设计', '审图');

  {机构状态}
  OS_NORMAL = '01'; {正常}

  {机构许可证状态}
  OCS_NORMAL = '01'; {正常}
  OCS_TIMEOUT = '02'; {到期}
  OCS_LOGOUT = '03'; {注销}

  {人员资质状态}
  PLS_LICNSSTATE = '01';{证书正常}
  PLS_LICNSKILL = '02'; {证书被吊销}
  PLS_NORMAL = '01'; {项目正常}
  PLS_APPLY = '02'; {项目申请}
  PLS_RETEST = '03'; {项目重考}
  PLS_LOGOUT = '04'; {项目注销}
  PLS_WELDER = '0113'; {焊接}

  {设备状态－DevState}
  DS_INUSE = '01'; {在用}
  DS_STOP = '02'; {停用}
  DS_USELESS = '03'; {报废}

  {函数入口代码}
  AM_OCMVIEW = $0001; {许可证管理－许可证查看}
  AM_OCMADD = $0002; {许可证管理－取证登记}
  AM_OCMCHANGE = $0003; {许可证管理－变更}
  AM_OCMEXCHANGE = $0004; {许可证管理－换证}
  AM_OCMLOGOUT = $0005; {许可证管理－注销}

  AM_PLMVIEW = $0001; {查看}
  AM_PLMAPPL = $0002; {申请}
  AM_PLMUPDA = $0003; {变更}
  AM_PLMCHEC = $0004; {换证}
  AM_PLMLOGO = $0005; {注销}
  AM_PLMENGA = $0006; {聘用情况}
  AM_PLMISSU = $0007; {发证}
  AM_PLMLOGI = $0008; {取证登记}

  AM_DMADDDEVICE = $0001; {设备管理－添加设备}
  AM_DMEDITDEVICE = $0002; {设备管理－修改/查看设备}
  AM_DMBROWSEDEVICE = $0003; {设备管理－浏览设备}

  AM_VMADDREPORT = $0001; {开工报告－添加报告}
  AM_VMEDITREPORT = $0002; {开工报告－修改报告}
  AM_VMDELETEREPORT = $0003; {开工报告－删除报告}

  {主窗体总控事件}
  CM_FORCECLOSE = WM_USER + 5000; {强制关闭事件，程序退出时发给每个开着的子窗
    体；也可发给主窗体}
  MSGWP_FORCECLOSE = $1357; {强制关闭事件标志性参数一}
  MSGLP_FORCECLOSE = $7531; {强制关闭事件标志性参数二}

  CM_MENUITEMCLICK = WM_USER + 5002; {菜单点击事件，可由程序其它窗体发给主窗体
    从而执行相应代码；事件参数一如下，参数二为目标菜单在Common Bridge中的序号}
  MSGWP_MENUITEMCLICK = $2468;

  CM_MFLOADPLUGIN = WM_USER + 5003; {插件载入事件，人为载入插件时触发；事件
    参数一如下，参数二为插件序号}
  MSGWP_MFLOADPLUGIN = $1579;

  CM_MFUNLOADPLUGIN = WM_USER + 5004; {插件卸载事件，人为卸载插件前触发；事件
    参数一如下，参数二为插件序号}
  MSGWP_MFUNLOADPLUGIN = $9751;

  {系统插件标识码}
  PLUGIN_INTQUERY = 'BPAIntQuerySpr';
  PLUGIN_EXTQUERY = 'BPAExtQuerySpr';
  PLUGIN_COMM = 'PlgBpaComm';

  {系统文件路径}
  PLUGIN_DIR = 'plugin';
  PLUGIN_PATH = 'plugin\';
  SYSFILES_DIR = 'sysfiles';
  REPORTS_DIR = 'reports';
  SYSFILES_PATH = 'sysfiles\';
  REPORTS_PATH = 'reports\';
  TECHINFO_NAME = 'techinfo.ini';
  USERCONFIG_NAME = 'bpaspruc.ini';

  {系统注册表节点名}
  RK_ROOT = 'Software\RHXINXI\BpaSpr';
  RK_MENUOPTION = RK_ROOT + '\MenuOption';

  {系统颜色定义}
  CL_OCSLOGOUT = clRed;

  CL_DSSTOP = clBlue;
  CL_DSUSELESS = clRed;

  CL_CONFIRM = clMedGray;
  
type
  TCSComnBridge = class
  private
    F_Handle: HWND;
    Fs_Tag: string;
    Fc_Process: TNotifyEvent;
    procedure SetProc(const Value: TNotifyEvent);
  public
    constructor Create(const A_Handle: HWND; const As_Tag: string;
      const Ac_Proc: TNotifyEvent);
    property Handle: HWND read F_Handle;
    property Tag: string read Fs_Tag;
    property Proc: TNotifyEvent read Fc_Process write SetProc;
  end;
  TCSComnBridges = class
  private
    Fc_Items: TList;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const A_Handle: HWND; const As_Tag: string;
      const Ac_Proc: TNotifyEvent): TCSComnBridge;
    procedure Delete(const A_Handle: HWND; const As_Tag: string);
    function Items(const A_Handle: HWND; const As_Tag: string): TCSComnBridge;
      overload;
    function Items(const Ai_Index: Integer): TCSComnBridge; overload;
    function IndexOf(const A_Handle: HWND; const As_Tag: string): Integer;
    property Count: Integer read GetCount;
  end;

procedure Gp_LoadUserConfig;
procedure Gp_SaveUserConfig;
procedure Gp_ProgressHint(const As_Hint: string = '');
procedure Gp_EhGrdNoExportSelectMsg;
procedure Gp_NCAddCompleteMsg(const As_Caption: string);

function Gf_GenSysId: string;

var
  Gs_AppDir: string;
  Gs_AppPath: string;
  Gs_DBMS: string;
  Gs_DBDRV: string;
  Gc_ComnBridges: TCSComnBridges;

  {可自定义配置}
  //TODO: To be modified in future
  SYSIDHEAD: string; //系统标识头
  MAXIMIZEDBYDEFAULT: Boolean; //子窗体打开时默认最大化
  MAXIMIZEMODALBYDEF: Boolean; //模式窗体打开时默认最大化
  GENDEVCIDBYARITHMETIC: Boolean; //使用算法生成设备用户编号

implementation

uses
  Controls, Forms, SysUtils, IniFiles;

const
  GBS = 'General Behaviour';

{ Gp_LoadUserConfig }

procedure Gp_LoadUserConfig;
var
  lc_IniFile: TIniFile;
begin
  lc_IniFile := TIniFile.Create(Gs_AppPath + USERCONFIG_NAME);
  with lc_IniFile do
    try
      //TODO: To be modified in future
      SYSIDHEAD := ReadString(GBS, 'SYSIDHEAD', '');
      if Length(Trim(SYSIDHEAD)) <> 3 then
        raise Exception.Create('系统标识错误或丢失');
      MAXIMIZEDBYDEFAULT := ReadBool(GBS, 'MAXIMIZEDBYDEFAULT', False);
      MAXIMIZEMODALBYDEF := ReadBool(GBS, 'MAXIMIZEMODALBYDEF', False);
      GENDEVCIDBYARITHMETIC := ReadBool(GBS, 'GENDEVCIDBYARITHMETIC', False);
    finally
      Free;
    end;
end;

{ Gp_SaveUserConfig }

procedure Gp_SaveUserConfig;
var
  lc_IniFile: TIniFile;
begin
  lc_IniFile := TIniFile.Create(Gs_AppPath + USERCONFIG_NAME);
  with lc_IniFile do
    try
      WriteBool(GBS, 'MAXIMIZEDBYDEFAULT', MAXIMIZEDBYDEFAULT);
      WriteBool(GBS, 'MAXIMIZEMODALBYDEF', MAXIMIZEMODALBYDEF);
      WriteBool(GBS, 'GENDEVCIDBYARITHMETIC', GENDEVCIDBYARITHMETIC);
    finally
      Free;
    end;
end;

{ Gp_ProgressHint }

var Gs_PrevHint: string;

//As_Hint = '' to set hint back
procedure Gp_ProgressHint(const As_Hint: string);
begin
  if As_Hint <> '' then Screen.Cursor := crHourGlass;
  with Application do
  begin
    if As_Hint <> '' then
    begin
      Gs_PrevHint := Hint;
      Hint := As_Hint;
    end else Hint := Gs_PrevHint;
    MainForm.Update;
  end;
  if As_Hint = '' then Screen.Cursor := crDefault;
end;

{ Gp_EhGrdNoExportSelectMsg }

procedure Gp_EhGrdNoExportSelectMsg;
begin
  Application.MessageBox(PChar('在列表区中没有选中要导出的数据，请在列表区' +
    '内按住鼠标左键不放，'#13#10'然后拖动鼠标来选中要导出的数据，选中的数据' +
    '呈蓝色高亮显示，也'#13#10'可以单击列表区最左上角小方块来选中全部数据。'),
    PChar('数据导出'), MB_OK + MB_ICONWARNING);
end;

{ Gp_NCAddCompleteMsg }

procedure Gp_NCAddCompleteMsg(const As_Caption: string);
begin
  Application.MessageBox(PChar(Format('数据添加完毕。现在您可以继续选择并添加' +
    '其它要添加的数据；要修改所添加的数据请在点击 确定 按钮后点击 关闭 按钮关' +
    '闭%s对话框。', [As_Caption])), '完成', MB_OK + MB_ICONINFORMATION);
end;

{ Gf_GenSysId }

function Gf_GenSysId: string;
begin
  Result := SYSIDHEAD + FormatDateTime('yyyymmddhhnnsszzz', Now);
end;

{ TCSComnBridge }

constructor TCSComnBridge.Create(const A_Handle: HWND; const As_Tag: string;
  const Ac_Proc: TNotifyEvent);
begin
  F_Handle := A_Handle;
  Fs_Tag := As_Tag;
  Fc_Process := Ac_Proc;
end;

procedure TCSComnBridge.SetProc(const Value: TNotifyEvent);
begin
  Fc_Process := Value;
end;

{ TCSComnBridges }

function TCSComnBridges.Add(const A_Handle: HWND; const As_Tag: string;
  const Ac_Proc: TNotifyEvent): TCSComnBridge;
begin
  Result := TCSComnBridge.Create(A_Handle, As_Tag, Ac_Proc);
  Fc_Items.Add(Result);
end;

constructor TCSComnBridges.Create;
begin
  Fc_Items := TList.Create;
end;

procedure TCSComnBridges.Delete(const A_Handle: HWND; const As_Tag: string);
var
  li_Index: Integer;
  lc_Item: TCSComnBridge;
begin
  with Fc_Items do
    for li_index := 0 to Count - 1 do
    begin
      lc_Item := TCSComnBridge(Items[li_Index]);
      if (lc_Item.Handle = A_Handle) and (lc_Item.Tag = As_Tag) then
      begin
        lc_Item.Free;
        Delete(li_Index);
        Break;
      end;
    end;
end;

destructor TCSComnBridges.Destroy;
begin
  with Fc_Items do
    while Count > 0 do
    begin
      TCSComnBridge(Items[0]).Free;
      Delete(0);
    end;
  Fc_Items.Destroy;
  inherited;
end;

function TCSComnBridges.GetCount: Integer;
begin
  Result := Fc_Items.Count;
end;

function TCSComnBridges.IndexOf(const A_Handle: HWND;
  const As_Tag: string): Integer;
var
  li_Index: Integer;
  lc_Item: TCSComnBridge;
begin
  Result := -1;
  with Fc_Items do
    for li_Index := 0 to Count - 1 do
    begin
      lc_Item := TCSComnBridge(Items[li_Index]);
      if (lc_Item.Handle = A_Handle) and (lc_Item.Tag = As_Tag) then
      begin
        Result := li_Index;
        Break;
      end;
    end;
end;

function TCSComnBridges.Items(const A_Handle: HWND;
  const As_Tag: string): TCSComnBridge;
var
  li_Index: Integer;
begin
  li_Index := IndexOf(A_Handle, As_Tag);
  if li_Index >= 0 then Result := TCSComnBridge(Fc_Items.Items[li_Index])
  else Result := nil;
end;

function TCSComnBridges.Items(const Ai_Index: Integer): TCSComnBridge;
begin
  Result := TCSComnBridge(Fc_Items.Items[Ai_Index]);
end;

end.
