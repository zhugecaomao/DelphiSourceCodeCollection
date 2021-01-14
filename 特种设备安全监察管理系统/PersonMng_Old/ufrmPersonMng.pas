unit ufrmPersonMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxmdaset, DB, DBGridEh, CSDBEhGrdStore, CSScrCtrlChild,
  CSBarMDIChild, PrnDbgeh, CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter,
  CSADOEhGrdFilter, CSDBBase, CSDBFind, CSDBEhGrdFind, ADODB, CSADOQuery,
  dxEditor, dxExEdtr, dxEdLib, CSCustomdxDateEdit, CSdxDBDateEdit,
  DBLookupEh, dxCntner, dxDBELib, StdCtrls, Mask, DBCtrlsEh, ComCtrls,
  CSRowCountPanel, Grids, DBCtrls, CSDBNavigator, Buttons, ExtCtrls,
  ufrmComMng;

type
  TfrmPersonMng = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    PersonInfo: TCSADOQuery;
    PersonInfod: TDataSource;
    grdPersonList: TDBGridEh;
    Panel4: TPanel;
    navList: TCSDBNavigator;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    SaveDialog: TSaveDialog;
    ListPrint: TPrintDBGridEh;
    CSBarMDIChild1: TCSBarMDIChild;
    Panel5: TPanel;
    bbtnExport: TBitBtn;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    bbtnSelect: TBitBtn;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    ScrChild: TCSScrCtrlChild;
    ListEhGrdStore: TCSDBEhGrdStore;
    CSRowCountPanel1: TCSRowCountPanel;
    Panel3: TPanel;
    pagPsnInfo: TPageControl;
    tsBaseInfo: TTabSheet;
    scrbDetail: TScrollBox;
    license: TCSADOQuery;
    licensed: TDataSource;
    bbtnReplace: TBitBtn;
    tsLicense: TTabSheet;
    Panel10: TPanel;
    grdLicns: TDBGridEh;
    bbtnView: TBitBtn;
    bbtnApply: TBitBtn;
    bbtnUpdate: TBitBtn;
    bbtnChange: TBitBtn;
    bbtnLogout: TBitBtn;
    bbtnEngage: TBitBtn;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    eName: TDBEditEh;
    eCardid: TDBEditEh;
    eTel: TDBEditEh;
    ePassid: TDBEditEh;
    ePolity: TDBEditEh;
    eMate: TDBEditEh;
    eZip: TDBEditEh;
    ePost: TDBEditEh;
    eTitleofpast: TDBEditEh;
    mRemark: TdxDBMemo;
    eAddr: TDBEditEh;
    lcmbSex: TDBLookupComboboxEh;
    lcmbZzqk: TDBLookupComboboxEh;
    lcmbDegree: TDBLookupComboboxEh;
    lcmbEdudegree: TDBLookupComboboxEh;
    lcmbMarry: TDBLookupComboboxEh;
    lcmbNation: TDBLookupComboboxEh;
    eSpecial: TDBEditEh;
    dteBirthday: TCSdxDBDateEdit;
    dteGratime: TCSdxDBDateEdit;
    dteZcpdtime: TCSdxDBDateEdit;
    eGraSchool: TDBEditEh;
    sex: TCSADOQuery;
    sexd: TDataSource;
    nation: TCSADOQuery;
    nationd: TDataSource;
    marrystatus: TCSADOQuery;
    marrystatusd: TDataSource;
    edudegree: TCSADOQuery;
    edudegreed: TDataSource;
    zzqkd: TDataSource;
    zzqk: TCSADOQuery;
    degreed: TDataSource;
    degree: TCSADOQuery;
    lcmbOrgan: TDBLookupComboboxEh;
    Label24: TLabel;
    PersonInfosysid: TStringField;
    PersonInforegno: TStringField;
    PersonInfoorgan_sysid: TStringField;
    PersonInfoname: TStringField;
    PersonInfocardid: TStringField;
    PersonInfobirthdate: TStringField;
    PersonInfosex: TStringField;
    PersonInfoaddr: TStringField;
    PersonInfotel: TStringField;
    PersonInfoedudegree: TStringField;
    PersonInfospeciality: TStringField;
    PersonInfozip: TStringField;
    PersonInfopost: TStringField;
    PersonInfotitleofpost: TStringField;
    PersonInforemark: TStringField;
    PersonInfonation: TStringField;
    PersonInfopolity: TStringField;
    PersonInfozzqk: TStringField;
    PersonInfoismarry: TStringField;
    PersonInfomate: TStringField;
    PersonInfodegree: TStringField;
    PersonInfogradua_time: TStringField;
    PersonInfogradua_school: TStringField;
    PersonInfozcpd_time: TStringField;
    PersonInfopic_info: TBlobField;
    PersonInfopic_type: TStringField;
    Label19: TLabel;
    eRegno: TDBEditEh;
    licensesysid: TStringField;
    licensecertno: TStringField;
    licenseperson_sysid: TStringField;
    licensecategory: TStringField;
    PersonInfopassportid: TStringField;
    licns_category: TCSADOQuery;
    licns_categoryd: TDataSource;
    licns_state: TCSADOQuery;
    licns_stated: TDataSource;
    licensecategory_name: TStringField;
    licenseenddate: TStringField;
    licensestate: TStringField;
    licensestate_name: TStringField;
    licenselen_of_service: TIntegerField;
    licensepass_date: TStringField;
    licenselicns_change_date: TStringField;
    licenselicns_kind: TStringField;
    licns_kind: TCSADOQuery;
    licns_kindd: TDataSource;
    licenselicns_kind_name: TStringField;
    bbtnIssue: TBitBtn;
    licensestartdate: TStringField;
    bbtnLogin: TBitBtn;
    List: TCSADOQuery;
    Listd: TDataSource;
    Listsysid: TStringField;
    Listregno: TStringField;
    Listorgan_sysid: TStringField;
    Listorgan_sysid_name: TStringField;
    Listname: TStringField;
    Listcardid: TStringField;
    Listbirthdate: TStringField;
    Listsex: TStringField;
    Listsex_name: TStringField;
    Listaddr: TStringField;
    Listtel: TStringField;
    Listedudegree: TStringField;
    Listedudegree_name: TStringField;
    Listspeciality: TStringField;
    Listzip: TStringField;
    Listpost: TStringField;
    Listtitleofpost: TStringField;
    Listnation: TStringField;
    Listnation_name: TStringField;
    Listpolity: TStringField;
    Listzzqk: TStringField;
    Listzzqk_name: TStringField;
    Listismarry: TStringField;
    Listismarry_name: TStringField;
    Listmate: TStringField;
    Listpassportid: TStringField;
    Listdegree: TStringField;
    Listdegree_name: TStringField;
    mComBak: TdxMemData;
    mCom: TdxMemData;
    mComd: TDataSource;
    Temp: TCSADOQuery;
    mComorgan_sysid: TStringField;
    mComorgan_sysid_name: TStringField;
    mComBakorgan_sysid: TStringField;
    mComBakorgan_sysid_name: TStringField;
    navPersonInfo: TCSDBNavigator;
    bbtnRefresh: TBitBtn;
    ePic: TdxDBGraphicEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PersonInfoBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnFindClick(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure bbtnColunmClick(Sender: TObject);
    procedure bbtnInsertClick(Sender: TObject);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure bbtnApplyClick(Sender: TObject);
    procedure bbtnViewClick(Sender: TObject);
    procedure bbtnUpdateClick(Sender: TObject);
    procedure bbtnChangeClick(Sender: TObject);
    procedure bbtnLogoutClick(Sender: TObject);
    procedure bbtnEngageClick(Sender: TObject);
    procedure bbtnIssueClick(Sender: TObject);
    procedure bbtnLoginClick(Sender: TObject);
    procedure lcmbOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ListAfterScroll(DataSet: TDataSet);
    procedure PersonInfoAfterInsert(DataSet: TDataSet);
    procedure PersonInfoAfterPost(DataSet: TDataSet);
    procedure bbtnRefreshClick(Sender: TObject);
    procedure PersonInfoAfterCancel(DataSet: TDataSet);
    procedure PersonInfoAfterDelete(DataSet: TDataSet);
    procedure ePicAssignPicture(Sender: TObject; var Picture: TPicture);
    procedure ePicGetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
  private
		Fb_SelectOn, Fb_DataModified: Boolean;
    Fs_CurPersonId, Fs_PsnLicnsKind, Fs_PsnLicnsCategory,
    Fs_PsnLicnsPrj: string;
    function GetCurPersonId: string;
    function GetCurPersonName: string;
    function GetCurPsnLicnsId: string;

    procedure prip_GetPsnInfo;
    procedure prip_LoadPsnInfo;
    procedure prip_LoadLicense;
    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_RefreshComListSource;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_RefreshPsnList(const As_ID: string = '');

    procedure prip_DeletePerson;

    procedure prip_CompanyDialog(const Ai_Category: Integer;
       Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmComMng);

    procedure prip_OpenPersonlicnsMng(const Ai_ActionID: Integer);

    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
    function prif_CheckDelete: Boolean;
    function prif_Validate: Boolean;

    procedure prip_ExportData;
  public
    procedure pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
    property DataModified: Boolean read Fb_DataModified;
    property CurPersonId: string read GetCurPersonId;
    property CurPersonName: string read GetCurPersonName;
    property CurPsnLicnsId: string read GetCurPsnLicnsId;
  end;

var
  frmPersonMng: TfrmPersonMng;

implementation

uses
  Jpeg, DBGridEhImpExp, CSDBUtils, CSVCLUtils, udmData, CommonLib,
  ufrmPersonlicnsMng;

{$R *.dfm}

// Ac_Args说明：
// Ac_Args[0] 人员系统ID; Ac_Args[1] 人员证书性质;
// Ac_Args[2] 人员证书类别;Ac_Args[3] 人员证书项目；
// Author: ocean_deep
procedure TfrmPersonMng.pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
begin
  ScrChild.SetSecurity(Self);

  Fb_SelectOn := Ab_SelectOn;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_CurPersonId := Strings[0];
      if Count > 1 then Fs_PsnLicnsKind := Strings[1];
      if Count > 2 then Fs_PsnLicnsCategory := Strings[2];
      if Count > 3 then Fs_PsnLicnsPrj := Strings[3];
    end;

  Gp_ProgressHint('正在载入人员信息，请稍候...');
  try
    prip_IniData;
  finally
    Gp_ProgressHint;
  end;

  prip_IniInterface;

  if Fb_SelectOn then
  begin
    BorderIcons := BorderIcons - [BiMinimize];
    Position := poScreenCenter;
  end else begin
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
  end;
end;

procedure TfrmPersonMng.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := CheckDBState(Self, True, [PersonInfo]) in CDS_GO;
end;

procedure TfrmPersonMng.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Fb_SelectOn then Action := caHide
  else begin
    Action := caFree;
    frmPersonMng := nil;
  end;
end;

procedure TfrmPersonMng.prip_ExportData;
var
	lc_ExpClass: TDBGridEhExportClass;
  ls_Ext: string;
begin
	if grdPersonList.Selection.SelectionType = gstNon then
  begin
    Gp_EhGrdNoExportSelectMsg;
    Exit;
  end;

  if not SaveDialog.Execute then Exit;
  
  case SaveDialog.FilterIndex of
    1: begin lc_ExpClass := TDBGridEhExportAsXLS; ls_Ext := '.xls'; end;
    2: begin lc_ExpClass := TDBGridEhExportAsText; ls_Ext := '.txt'; end;
    3: begin lc_ExpClass := TDBGridEhExportAsHTML; ls_Ext := '.htm'; end;
    4: begin lc_ExpClass := TDBGridEhExportAsRTF; ls_Ext := '.rtf'; end;
    5: begin lc_ExpClass := TDBGridEhExportAsCSV; ls_Ext := '.csv'; end;
    else begin
      lc_ExpClass := nil;
      ls_Ext := '';
    end;
  end;

  if lc_ExpClass <> nil then
  begin
    Update;
    Gp_ProgressHint('正在导出数据，请稍候...');
    try
      SaveDBGridEhToExportFile(lc_ExpClass, grdPersonList,
        ChangeFileExt(SaveDialog.FileName, ls_Ext), False);
      Application.MessageBox('数据导出成功。', Pchar(Caption),
        MB_OK + MB_ICONINFORMATION);
    finally
      Gp_ProgressHint;
    end;
  end;
end;

// 初始化相关的代码表list，获得人员基本信息列表
// Author : ocean_deep
procedure TfrmPersonMng.prip_IniData;
begin
  with nation do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_nation';
    Open;
  end;

  with marrystatus do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_marry';
    Open;
  end;

  with sex do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_sex';
    Open;
  end;

  with edudegree do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_xl';
    Open;
  end;

  with zzqk do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_work_info';
    Open;
  end;

  with degree do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_degree';
    Open;
  end;

  with licns_kind do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns WHERE licns_level = 1';
    Open;
  end;

  with licns_category do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns WHERE licns_level = 2';
    Open;
  end;

  with licns_state do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_ry_licns_state';
    Open;
  end;

  prip_GetPsnInfo;
end;

function TfrmPersonMng.prif_CheckBlank(Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with PersonInfo do
		for li_i := 0 to Length(Ac_Fields) - 1 do
      if Trim(VarToStr(Ac_Fields[li_i].Value)) = '' then
      begin
        Result := False;
        Application.MessageBox(PChar(Ac_Fields[li_i].DisplayLabel +
          '不能为空。'), PChar(Caption), MB_OK + MB_ICONWARNING);
        Ac_Fields[li_i].FocusControl;
        Exit;
      end;
end;

procedure TfrmPersonMng.PersonInfoBeforePost(DataSet: TDataSet);
begin
  if not prif_Validate then Abort;
end;

procedure TfrmPersonMng.FormCreate(Sender: TObject);
begin
  with ListEhGrdStore do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    RestoreGridLayout;
  end;

	Fb_DataModified := False;
  Fs_CurPersonId := '';
  Fs_PsnLicnsKind := '';
  Fs_PsnLicnsCategory := '';
  Fs_PsnLicnsPrj := '';
end;

procedure TfrmPersonMng.bbtnExportClick(Sender: TObject);
begin
  prip_ExportData;
end;

procedure TfrmPersonMng.bbtnPrintClick(Sender: TObject);
begin
	ListPrint.Preview;
end;

procedure TfrmPersonMng.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPersonMng.bbtnFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmPersonMng.bbtnFilterClick(Sender: TObject);
begin
	ListFilter.FilterDlg;
end;

procedure TfrmPersonMng.bbtnColunmClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmPersonMng.bbtnInsertClick(Sender: TObject);
begin
  PersonInfo.Insert;
end;

procedure TfrmPersonMng.bbtnDeleteClick(Sender: TObject);
begin
  prip_DeletePerson;
end;

function TfrmPersonMng.prif_CheckDelete: Boolean;
begin
  //TODO: To be finished
  Result := True;
  with personInfo do if (not Active) or IsEmpty then
  begin
    Result := False;
    Exit;
  end;

  if Application.MessageBox('警告，删除此人员时将同时删除该人员所有的资质信息、' +
    '资质聘用信息和培训考核信息和人员违规记录。您确定要删除当前记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then
  begin
    Result := False;
    Exit;
  end;
end;

function TfrmPersonMng.prif_Validate: Boolean;
begin
  with PersonInfo do
    Result := prif_CheckBlank([FieldByName('name'), FieldByName('cardid')]);
end;

procedure TfrmPersonMng.bbtnApplyClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMAPPL);
end;

procedure TfrmPersonMng.bbtnViewClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMVIEW);
end;

procedure TfrmPersonMng.bbtnUpdateClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMUPDA);
end;

procedure TfrmPersonMng.bbtnChangeClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMEXCH);
end;

procedure TfrmPersonMng.bbtnLogoutClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMLOGO);
end;

procedure TfrmPersonMng.bbtnEngageClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMENGA);
end;

// 初始化界面
// Author : ocean_deep
procedure TfrmPersonMng.prip_IniInterface;
begin
  bbtnSelect.Visible := Fb_SelectOn;
end;

procedure TfrmPersonMng.bbtnIssueClick(Sender: TObject);
var
  ls_sysid : string;
begin
  prip_OpenPersonlicnsMng(AM_PLMISSU);
  ls_sysid := PersonInfo.FieldByName('sysid').AsString;
  prip_RefreshPsnList(ls_sysid);
end;

// 调用 人员资质操作界面
// 参数说明Ai_ActionID：描述调用的动作
// Author : ocean_deep
procedure TfrmPersonMng.prip_OpenPersonlicnsMng(const Ai_ActionID: Integer);
var
  lc_Arg: TStrings;
  lc_PersonlicnsMng: TfrmPersonlicnsMng;
begin
  // Ai_ActionID = AM_PLMVIEW 1 查看；Ai_ActionID = AM_PLMAPPL 2 申请；
  // Ai_ActionID = AM_PLMUPDA 3 变更；Ai_ActionID = AM_PLMEXCH 4 换证；
  // Ai_ActionID = AM_PLMLOGO 5 注销；Ai_ActionID = AM_PLMENAG 6 聘用情况；
  // Ai_ActionID = AM_PLMISSU 7 发证；Ai_ActionID = AM_PLMLOGI 8 取证登记；
  //if Ai_ActionID in [AM_PLMVIEW, AM_PLMLOGI] then
  with license do
  if (not Active) or IsEmpty then
  begin
    if Ai_ActionID in [AM_PLMVIEW, AM_PLMUPDA, AM_PLMEXCH,
      AM_PLMLOGO, AM_PLMENGA, AM_PLMISSU] then
    Exit;
  end;

  case Ai_ActionID of
    AM_PLMUPDA:
    begin
      if VarToStr(license.FieldValues['state']) = PLS_LOGOUT then
      begin
        Application.MessageBox('此证书已注销', PChar(Caption),
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    AM_PLMEXCH,AM_PLMLOGO,AM_PLMENGA:
    begin
      if VarToStr(license.FieldValues['state']) <> PLS_NORMAL then
      begin
        Application.MessageBox('此证书状态不符合此操作要求', PChar(Caption),
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    AM_PLMISSU:
    begin
      if VarToStr(license.FieldValues['state']) <> PLS_APPLY then
      begin
        Application.MessageBox('此证书不符合发证的条件', PChar(Caption),
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
  end;

  lc_PersonlicnsMng := TfrmPersonlicnsMng.Create(nil);
  with lc_PersonlicnsMng do
    try
      lc_Arg := TStringList.Create;

      //参数数组[0] 资质证书ID
      if Ai_ActionID in [AM_PLMAPPL, AM_PLMLOGI] then lc_Arg.Add('')
      else lc_Arg.Add(license.FieldByName('sysid').AsString);
      //参数数组[1] 人员系统ID
      lc_Arg.Add(PersonInfo.FieldByName('sysid').AsString);
      try
        pubp_Ini(Ai_ActionID, lc_Arg);
        ShowModal;
        if DataModified then prip_LoadLicense;
      finally
        lc_Arg.Free;
      end;
    finally
      Free;
    end;
end;

// 返回当前的人员SYSID；
// Author: ocean_deep
function TfrmPersonMng.GetCurPersonId: string;
begin
  Result := VarToStr(PersonInfo.FieldValues['sysid']);
end;

// 返回当前的人员姓名；
// Author: ocean_deep
function TfrmPersonMng.GetCurPersonName: string;
begin
  Result := VarToStr(PersonInfo.FieldValues['name']);
end;

// 返回当前的人员的资质SYSID；
// Author: ocean_deep
function TfrmPersonMng.GetCurPsnLicnsId: string;
begin
  Result := VarToStr(license.FieldValues['sysid']);
end;

procedure TfrmPersonMng.bbtnLoginClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMLOGI);
end;

procedure TfrmPersonMng.prip_GetPsnInfo;
begin
  with List do
  begin
		if Active then Close;
    SQL.Text := 'device.usp_getpersoninfo';
    Open;
    if IsEmpty then prip_LoadPsnInfo;
  end;
end;

// 根据人员列表中选定的人员，读取此人员的基本信息
// 同时读取出此人员的资质信息
// Author : ocean_deep
procedure TfrmPersonMng.prip_LoadPsnInfo;
var
  ls_PersonId: string;
begin
  ls_PersonId := List.FieldByName('sysid').AsString;
  
  with PersonInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_baseinfo WHERE ' +
      'sysid = ''%s''', [ls_PersonId]);
    Open;

    if not IsEmpty then prip_GetComInfo([VarToStr(FieldValues['organ_sysid'])]);
  end;

  prip_LoadLicense;
end;

procedure TfrmPersonMng.prip_RefreshComListSource;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
end;

// 打开 机构基本信息模块；
// 参数Ai_Category：向机构基本信息模块传递 机构类别
// 参数Ac_LookupComboBox：调用此函数的 TDBLookupComboBoxEh 控件名称
// 参数Ac_Requestor：打开的模块
// Author: ocean_deep
procedure TfrmPersonMng.prip_CompanyDialog(const Ai_Category: Integer;
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
begin
  with personinfod do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mComd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

// 从机构基本信息表中取出 sysid和name，填入涉及机构的TDBLookupComboBoxEh
// 控件的listsource中
// Author: ocean_deep
procedure TfrmPersonMng.prip_GetComInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',[Asa_Ids[0]]);
    Open;
    if not mCom.IsEmpty then mCom.Delete;
    mCom.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mCom.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mCom.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mCom.Post;
    mComBak.LoadFromDataSet(mCom);
    Close;
  end;
  prip_RefreshComListSource;
end;

// 打开 机构基本信息模块；
// 参数Ai_Category：向机构基本信息模块传递 机构类别
// 参数As_Field：调用此过程的控件的字段
// 参数Ac_Requestor：打开的模块
// Author: ocean_deep
procedure TfrmPersonMng.prip_SelectCompany(const Ai_Category: Integer;
  const As_Field: string; Ac_Requestor: TfrmComMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmComMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company, PersonInfo do
  begin
    if VarToStr(FieldValues[As_Field]) <> '' then
      ls_PrevId := FieldByName(As_Field).AsString;

    lc_Arg := TStringList.Create;
    lc_Arg.Add(ls_PrevId);
    lc_Arg.Add(IntToStr(Ai_Category));
    try
      pubp_ini(True, lc_Arg);
      lc_Rc := ShowModal;
      Self.Update;
    finally
      lc_Arg.Free;
    end;

    if (lc_Rc = mrOK) and (ls_PrevId <> CurCompanyId) then
    begin
      li_Index := mCom.FieldByName(As_Field).Index;
      mCom.Edit;
      mCom.Fields[li_Index].AsString := CurCompanyId;
      mCom.Fields[li_Index + 1].AsString := CurCompanyName;
      mCom.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurCompanyId;
    end;
  end;
end;

procedure TfrmPersonMng.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(0, lcmbOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPersonMng.ListAfterScroll(DataSet: TDataSet);
begin
  prip_LoadPsnInfo;
end;

procedure TfrmPersonMng.PersonInfoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
end;

procedure TfrmPersonMng.PersonInfoAfterPost(DataSet: TDataSet);
var
  ls_PsnID : string;
begin
  mComBak.LoadFromDataSet(mCom);
  Fb_DataModified := True;

  ls_PsnID:= DataSet.FieldByName('sysid').AsString;
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_RefreshPsnList(ls_PsnID);
  finally
    Gp_ProgressHint;
  end;
end;

// 删除系统中的人员，在删除时，同时把跟此人员有关的其他数据表
// 记录也删除。
// Author: ocean_deep
procedure TfrmPersonMng.prip_DeletePerson;
var
  ls_Id: string;
begin
  //TODO: To be completed
  if not prif_CheckDelete then Exit;
  ls_Id := personInfo.FieldByName('sysid').AsString;

  Gp_ProgressHint('正在删除人员及相关信息，请稍候...');
  dmData.adocon.BeginTrans;
  try

  dmData.adocon.Execute(Format('DELETE FROM device.person_infraction_info WHERE ' +
      'person_sysid = ''%s''', [ls_Id]));

  dmData.adocon.Execute(Format('DELETE FROM device.person_engage_prj WHERE ' +
      'person_sysid = ''%s''', [ls_Id]));

  dmData.adocon.Execute(Format('DELETE FROM device.person_assess WHERE ' +
      'person_sysid = ''%s''', [ls_Id]));

  dmData.adocon.Execute(Format('DELETE FROM device.person_cert_prjlevel WHERE ' +
      'EXISTS(SELECT * FROM person_cert_prj A WHERE ' +
      'device.person_cert_prjlevel.licns_prj_sysid = A.sysid AND EXISTS(SELECT ' +
      '* FROM device.person_certificate B WHERE A.licns_sysid = B.sysid AND ' +
      'B.person_sysid = ''%s''))',[ls_Id]));

  dmData.adocon.Execute(Format('DELETE FROM device.person_cert_prj WHERE ' +
      'EXISTS(SELECT * FROM device.person_certificate A WHERE A.sysid = ' +
      'device.person_cert_prj.licns_sysid AND A.person_sysid = ''%s'')',[ls_Id]));

  dmData.adocon.Execute(Format('DELETE FROM device.person_certificate WHERE ' +
      'device.person_certificate.person_sysid = ''%s''',[ls_Id]));

  personInfo.Delete;
  dmData.adocon.CommitTrans;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      Application.MessageBox(PChar('删除时发生错误，错误信息：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
  Gp_ProgressHint;
end;

procedure TfrmPersonMng.bbtnRefreshClick(Sender: TObject);
begin
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_GetPsnInfo;
  finally
    Gp_ProgressHint;
  end;
end;

// 根据人员列表中选定的人员，读取其 资质信息
// Author : ocean_deep
procedure TfrmPersonMng.prip_LoadLicense;
var
  ls_PersonId: string;
begin
  ls_PersonId := PersonInfo.FieldByName('sysid').AsString;

  with license do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_certificate WHERE ' +
      'person_sysid = ''%s''', [ls_PersonId]);
    Open;
  end;
end;

procedure TfrmPersonMng.PersonInfoAfterCancel(DataSet: TDataSet);
begin
  mCom.LoadFromDataSet(mComBak);
  prip_RefreshComListSource;
end;

procedure TfrmPersonMng.PersonInfoAfterDelete(DataSet: TDataSet);
begin
  prip_RefreshPsnList;
end;

procedure TfrmPersonMng.prip_RefreshPsnList(const As_ID: string);
begin
  with List do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := 'device.usp_getpersoninfo';
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmPersonMng.ePicAssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with PersonInfo, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('pic_type').Clear
    else FieldByName('pic_type').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmPersonMng.ePicGetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with PersonInfo.FieldByName('pic_type') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

initialization

RegisterClasses([TIcon, TMetafile, TBitmap, TJPEGImage]);

end.
