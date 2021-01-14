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
  ufrmOrganMng;

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
    licenselist: TCSADOQuery;
    licenselistd: TDataSource;
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
    Label19: TLabel;
    eRegno: TDBEditEh;
    bbtnIssue: TBitBtn;
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
    Splitter2: TSplitter;
    DBGridEh1: TDBGridEh;
    licnsprjlist: TCSADOQuery;
    licnsprjlistd: TDataSource;
    licenselistsysid: TStringField;
    licenselistlicnsno: TStringField;
    licenselistperson_sysid: TStringField;
    licenselistlicns_kind_code: TStringField;
    licenselistlicns_kind_name: TStringField;
    licenselistlicns_category_code: TStringField;
    licenselistlicns_category_name: TStringField;
    licenselistorgan_sysid: TStringField;
    licenselistorgan_sysid_name: TStringField;
    licenselistissue_date: TStringField;
    licenselistlicns_state: TStringField;
    licenselistlicns_state_name: TStringField;
    licnsprjlistsysid: TStringField;
    licnsprjlistpsnlicns_sysid: TStringField;
    licnsprjlistpsnlicns_prjcode: TStringField;
    licnsprjlistpsnlicns_prjcode_name: TStringField;
    licnsprjlistpsnlicns_levelcode: TStringField;
    licnsprjlistpsnlicns_levelcode_name: TStringField;
    licnsprjlistpsnlicns_prjname: TStringField;
    licnsprjlisttest_organ_sysid: TStringField;
    licnsprjlisttest_organ_sysid_name: TStringField;
    licnsprjlistauth_organ_sysid: TStringField;
    licnsprjlistauth_organ_sysid_name: TStringField;
    licnsprjlistauth_date: TStringField;
    licnsprjlistend_date: TStringField;
    licnsprjlistapply_date: TStringField;
    licnsprjliststate: TStringField;
    licnsprjliststate_name: TStringField;
    Listworkinfo: TStringField;
    Listworkinfo_name: TStringField;
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
    procedure licenselistAfterScroll(DataSet: TDataSet);
  private
		Fb_SelectOn, Fb_DataModified: Boolean;
    Fs_PersonId, Fs_OrganId: string;
    function GetCurPersonId: string;
    function GetCurPsnLicnsId: string;
    function GetCurLicnsPrjId: string;

    procedure prip_IniData;
    procedure prip_IniInterface;

    procedure prip_LoadPsnList;
    procedure prip_LoadPsnInfo;
    procedure prip_LoadPsnLicnsList;
    procedure prip_LoadPsnLicnsPrjList;
    procedure prip_RefreshPsnList(const As_ID: string = '');
    procedure prip_RefreshPsnLicnsList(const As_ID: string = '');

    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_RefreshComListSource;
    procedure prip_CompanyDialog(const Ai_Category: Integer;
       Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);

    procedure prip_OpenPersonlicnsMng(const Ai_ActionID: Integer);

    procedure prip_DeletePerson;

    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
    function prif_CheckDelete: Boolean;
    function prif_Validate: Boolean;

    procedure prip_ExportData;
    function GetCurPersonName: string;

  public
    procedure pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
    property DataModified: Boolean read Fb_DataModified;
    property CurPersonId: string read GetCurPersonId;
    property CurPersonName: string read GetCurPersonName;
    property CurLicnsId: string read GetCurPsnLicnsId;
    property CurLicnsPrjId: string read GetCurLicnsPrjId;
  end;

type
  TCSPsnAssistant = class
  public
    procedure pubp_Call(Param: TObject);
  end;

var
  frmPersonMng: TfrmPersonMng;
  Gc_PsnAssistant: TCSPsnAssistant;

implementation

uses
  Jpeg, DBGridEhImpExp, CSDBUtils, CSVCLUtils, udmData, CommonLib,
  ufrmPersonlicnsMng;

{$R *.dfm}

// Ac_Args说明：
// Ac_Args[1] 人员所属机构系统ID; Ac_Args[0] 人员系统ID;
// Author: ocean_deep
procedure TfrmPersonMng.pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
begin
  ScrChild.SetSecurity(Self);

  Fb_SelectOn := Ab_SelectOn;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_PersonId := Strings[0];
      if Count > 1 then Fs_OrganId := Strings[1];
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

  prip_LoadPsnList;
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
  Fs_OrganId := '';
  Fs_PersonId := '';
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
  Result := True;
  with personInfo do if (not Active) or IsEmpty then
  begin
    Result := False;
    Exit;
  end;
end;

function TfrmPersonMng.prif_Validate: Boolean;
begin
  with PersonInfo do
  begin
    Result := prif_CheckBlank([FieldByName('name'), FieldByName('cardid'),
              FieldByName('organ_sysid')]);
    if not Result then Exit;

    if dtebirthday.Date > Date then Result := False;
    if not Result then
    begin
      Application.MessageBox('出生日期应比当前系统时间早！',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if dteGratime.Date > Date then Result := False;
    if not Result then
    begin
      Application.MessageBox('毕业时间应比当前系统时间早！',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if dteZcpdtime.Date > Date then Result := False;
    if not Result then
    begin
      Application.MessageBox('职称评定时间应比当前系统时间早！',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
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
  prip_OpenPersonlicnsMng(AM_PLMCHEC);
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
  pagPsnInfo.ActivePageIndex := 0;
end;

procedure TfrmPersonMng.bbtnIssueClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMISSU);
end;

// 调用 人员资质操作界面
// 参数说明Ai_ActionID：描述调用的动作
// Author : ocean_deep
procedure TfrmPersonMng.prip_OpenPersonlicnsMng(const Ai_ActionID: Integer);
var
  lc_Arg: TStrings;
  lc_PersonlicnsMng: TfrmPersonlicnsMng;
begin
  // Ai_ActionID = AM_PLMVIEW 1 查看；Ai_ActionID = AM_PLMAPPL 2 项目申请；
  // Ai_ActionID = AM_PLMUPDA 3 项目变更；Ai_ActionID = AM_PLMCHEC 4 项目审查；
  // Ai_ActionID = AM_PLMLOGO 5 证书吊销；Ai_ActionID = AM_PLMENAG 6 聘用情况；
  // Ai_ActionID = AM_PLMISSU 7 项目审批；Ai_ActionID = AM_PLMLOGI 8 持证登记；

  with licenselist do
  begin
    if (not Active) or IsEmpty then
    begin
      if Ai_ActionID in [AM_PLMVIEW,  AM_PLMUPDA, AM_PLMCHEC,
        AM_PLMLOGO, AM_PLMENGA, AM_PLMISSU] then
      Exit;
    end;
    if VarToStr(FieldValues['licns_state']) = PLS_LICNSKILL then
    begin
      if Ai_ActionID in [AM_PLMUPDA, AM_PLMCHEC, AM_PLMLOGO, AM_PLMISSU,
        AM_PLMENGA] then
      begin
        Application.MessageBox('此证书已吊销', PChar(Caption),
        MB_OK + MB_ICONWARNING);
        exit;
      end;
    end;
  end;

  lc_PersonlicnsMng := TfrmPersonlicnsMng.Create(nil);
  with lc_PersonlicnsMng do
    try
      lc_Arg := TStringList.Create;

      //参数数组[0] 资质证书ID
      lc_Arg.Add(licenselist.FieldByName('sysid').AsString);
      //参数数组[1] 人员系统ID
      lc_Arg.Add(PersonInfo.FieldByName('sysid').AsString);
      try
        pubp_Ini(Ai_ActionID, lc_Arg);
        ShowModal;
//        if DataModified then
          prip_RefreshPsnLicnsList(licenselist.FieldByName('sysid').AsString);
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
  Result := VarToStr(list.FieldValues['sysid']);
end;

// 返回当前的人员的资质SYSID；
// Author: ocean_deep
function TfrmPersonMng.GetCurPsnLicnsId: string;
begin
  Result := VarToStr(licenselist.FieldValues['sysid']);
end;

procedure TfrmPersonMng.bbtnLoginClick(Sender: TObject);
begin
  prip_OpenPersonlicnsMng(AM_PLMLOGI);
end;

// 取人员数据到人员grid；
// Author: ocean_deep
procedure TfrmPersonMng.prip_LoadPsnList;
begin
  with List do
  begin
		if Active then Close;
    SQL.Text := Format('device.usp_getpersoninfo ''%s''',
       [Fs_OrganId]);
    Open;

    if IsEmpty then
    begin
      prip_LoadPsnInfo;
      prip_LoadPsnLicnsList;
    end
    else
      if Fs_PersonId <> '' then
        Locate('sysid', Fs_PersonId, []);
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
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
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
  const As_Field: string; Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
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

    if (lc_Rc = mrOK) and (ls_PrevId <> CurOrganId) then
    begin
      li_Index := mCom.FieldByName(As_Field).Index;
      mCom.Edit;
      mCom.Fields[li_Index].AsString := CurOrganId;
      mCom.Fields[li_Index + 1].AsString := CurOrganName;
      mCom.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmPersonMng.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(0, lcmbOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonMng.ListAfterScroll(DataSet: TDataSet);
begin
  prip_LoadPsnInfo;
  prip_LoadPsnLicnsList;
  prip_LoadPsnLicnsPrjList;
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
  li_Result : Integer;
  ls_Id: string;
begin
  //TODO: To be completed
  if not prif_CheckDelete then Exit;
  ls_Id := personInfo.FieldByName('sysid').AsString;
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_delete_psn_check ''%s''',
      [ls_Id]);
    Open;
    li_Result := Fields[0].AsInteger;
    Close;
  end;

  if li_Result = 1 then
  begin
    if Application.MessageBox('您确定要删除此人员信息吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
    personinfo.Delete;
  end
  else
    Application.MessageBox('此人员在其他数据表中有相关记录，不能删除！',
    PChar(Caption), MB_OK + MB_ICONWARNING);

end;

procedure TfrmPersonMng.bbtnRefreshClick(Sender: TObject);
begin
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_LoadPsnList;
  finally
    Gp_ProgressHint;
  end;
end;

// 根据人员列表中选定的人员，读取其 资质信息
// Author : ocean_deep

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
      SQL.Text := Format('device.usp_getpersoninfo ''%s''',
       [Fs_OrganId]);
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

// 返回当前的人员的资质项目SYSID；
// Author: ocean_deep
function TfrmPersonMng.GetCurLicnsPrjId: string;
begin
  Result := VarToStr(licnsprjlist.FieldValues['sysid']);
end;

// 取数据到人员资质grid；
// Author: ocean_deep
procedure TfrmPersonMng.prip_LoadPsnLicnsList;
var
  ls_PersonId : string;
begin
  ls_PersonId := list.FieldByName('sysid').AsString;
  with licenselist do
  begin
		if Active then Close;
    if not list.IsEmpty then
    begin
      SQL.Text := Format('device.usp_getpsnlicns ''%s''', [ls_PersonId]);
      Open;
      if not IsEmpty then
      begin
        prip_LoadPsnLicnsPrjList;
      end;
    end;
  end;
end;

procedure TfrmPersonMng.prip_RefreshPsnLicnsList(const As_ID: string);
var
  ls_PersonId : string;
begin
  ls_PersonId := list.FieldByName('sysid').AsString;
  with licenselist do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('device.usp_getpsnlicns ''%s''', [ls_PersonId]);
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

function TfrmPersonMng.GetCurPersonName: string;
begin
  Result := VarToStr(list.FieldValues['name']);
end;

procedure TfrmPersonMng.licenselistAfterScroll(DataSet: TDataSet);
begin
  prip_LoadPsnLicnsPrjList;
end;

procedure TfrmPersonMng.prip_LoadPsnLicnsPrjList;
var
  ls_PsnLicnsId : string;
begin
  ls_PsnLicnsId := licenselist.FieldByName('sysid').AsString;
  with licnsprjlist do
  begin
		if Active then Close;
    SQL.Text := Format('device.usp_getpsnlicnsprj ''%s''', [ls_PsnLicnsId]);
    Open;
  end;
end;

{ TCSPsnAssistant }

procedure TCSPsnAssistant.pubp_Call(Param: TObject);
var
  lc_Rc: TModalResult;
  lc_PsnMng: TfrmPersonMng;
begin
  lc_PsnMng := TfrmPersonMng.Create(nil);
  with lc_PsnMng do
    try
      pubp_Ini(True, TStrings(Param));
      lc_Rc := ShowModal;
      TStrings(Param).Clear;
      TStrings(Param).Add(IntToStr(lc_Rc));
      if lc_Rc = mrOK then
      begin
        TStrings(Param).Add(CurPersonId);
        TStrings(Param).Add(CurLicnsId);
        TStrings(Param).Add(CurLicnsPrjId);
      end;
    finally
      Free;
    end;
end;

initialization

RegisterClasses([TIcon, TMetafile, TBitmap, TJPEGImage]);

Gc_PsnAssistant := TCSPsnAssistant.Create;

finalization

Gc_PsnAssistant.Free;

end.
