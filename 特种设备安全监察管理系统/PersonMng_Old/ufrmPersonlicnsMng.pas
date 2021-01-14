unit ufrmPersonlicnsMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter,
  CSADOEhGrdFilter, CSDBBase, CSDBFind, CSDBEhGrdFind, dxmdaset, DB, ADODB,
  CSADOQuery, CSRowCountPanel, dxExEdtr, dxEdLib, dxDBELib, Grids,
  DBGridEh, dxCntner, dxEditor, CSCustomdxDateEdit, CSdxDBDateEdit,
  DBLookupEh, StdCtrls, Mask, DBCtrlsEh, DBCtrls, CSDBNavigator, ExtCtrls,
  ComCtrls, Buttons, ufrmPersonMng, ufrmComMng;

type
  TfrmPersonlicnsMng = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    pagPsnLicns: TPageControl;
    tsLicnsInfo: TTabSheet;
    tsEngageInfo: TTabSheet;
    Panel3: TPanel;
    Panel5: TPanel;
    CSDBNavigator1: TCSDBNavigator;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    eCertNO: TDBEditEh;
    Label11: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    lcmbIssueOrgan: TDBLookupComboboxEh;
    Label3: TLabel;
    lcmbConfirmOrgan: TDBLookupComboboxEh;
    Label7: TLabel;
    lcmbTrainOrgan: TDBLookupComboboxEh;
    Label8: TLabel;
    lcmbTestOrgan: TDBLookupComboboxEh;
    Label5: TLabel;
    dteStartDate: TCSdxDBDateEdit;
    Label6: TLabel;
    dteConfirmDate: TCSdxDBDateEdit;
    Label9: TLabel;
    dteEndDate: TCSdxDBDateEdit;
    Label10: TLabel;
    dteChangeDate: TCSdxDBDateEdit;
    Label16: TLabel;
    personlicense: TCSADOQuery;
    personlicensed: TDataSource;
    licnsprj: TCSADOQuery;
    licnsprjd: TDataSource;
    licnsleveld: TDataSource;
    licnslevel: TCSADOQuery;
    licnskind: TCSADOQuery;
    licnskindd: TDataSource;
    lcmbLicnsKind: TDBLookupComboboxEh;
    lcmbLicnsCategory: TDBLookupComboboxEh;
    licnscategory: TCSADOQuery;
    licnscategoryd: TDataSource;
    personlicensesysid: TStringField;
    personlicensecertno: TStringField;
    personlicenseperson_sysid: TStringField;
    personlicenselicns_kind: TStringField;
    personlicenselicns_category: TStringField;
    personlicenseorgan_sysid: TStringField;
    personlicensestartdate: TStringField;
    personlicenseenddate: TStringField;
    personlicensestate: TStringField;
    licnsstate: TCSADOQuery;
    licnsstated: TDataSource;
    personlicensetrain_organ_sysid: TStringField;
    personlicensetest_organ_sysid: TStringField;
    personlicensepass_organ_sysid: TStringField;
    personlicenselen_of_service: TIntegerField;
    personlicensepass_date: TStringField;
    personlicenselicns_change_date: TStringField;
    licnsprjsysid: TStringField;
    licnsprjlicns_sysid: TStringField;
    licnsprjprj_no: TStringField;
    licnslevelsysid: TStringField;
    licnslevellicns_prj_sysid: TStringField;
    licnslevellevel_no: TStringField;
    licnsengage: TCSADOQuery;
    licnsengaged: TDataSource;
    scrbDetail: TScrollBox;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label18: TLabel;
    eLicnsNO: TDBEditEh;
    mRemark: TdxDBMemo;
    dteApplayDate: TCSdxDBDateEdit;
    lcmbOrgan: TDBLookupComboboxEh;
    lcmbLicnsPrj: TDBLookupComboboxEh;
    grdEngageList: TDBGridEh;
    Panel7: TPanel;
    Panel8: TPanel;
    bbtnEngageIns: TBitBtn;
    bbtnEngageDel: TBitBtn;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    CSRowCountPanel1: TCSRowCountPanel;
    Splitter1: TSplitter;
    lcmbName: TDBLookupComboboxEh;
    lcmbPrsName: TDBLookupComboboxEh;
    eKind: TDBEditEh;
    eCategory: TDBEditEh;
    bbtnOperate: TBitBtn;
    mCom: TdxMemData;
    mComorgan_sysid: TStringField;
    mComorgan_sysid_name: TStringField;
    mComtrain_organ_sysid: TStringField;
    mComtrain_organ_sysid_name: TStringField;
    mComtest_organ_sysid: TStringField;
    mComtest_organ_sysid_name: TStringField;
    mCompass_organ_sysid: TStringField;
    mCompass_organ_sysid_name: TStringField;
    Temp: TCSADOQuery;
    mComBak: TdxMemData;
    mComBakorgan_sysid: TStringField;
    mComBaktrain_organ_sysid: TStringField;
    mComBaktest_organ_sysid: TStringField;
    mComBakpass_organ_sysid: TStringField;
    mComBakorgan_sysid_name: TStringField;
    mComBaktrain_organ_sysid_name: TStringField;
    mComBaktest_organ_sysid_name: TStringField;
    mComBakpass_organ_sysid_name: TStringField;
    mComd: TDataSource;
    mPerson: TdxMemData;
    mPersonBak: TdxMemData;
    mPersond: TDataSource;
    mPersonperson_sysid: TStringField;
    mPersonperson_sysid_name: TStringField;
    mPersonBakperson_sysid: TStringField;
    mPersonBakperson_sysid_name: TStringField;
    mEngageOrganBak: TdxMemData;
    mEngageOrgan: TdxMemData;
    mEngageOrgand: TDataSource;
    mEngageOrganorgan_sysid: TStringField;
    mEngageOrganorgan_sysid_name: TStringField;
    mEngageOrganBakorgan_sysid: TStringField;
    mEngageOrganBakorgan_sysid_name: TStringField;
    prjCode: TCSADOQuery;
    licnsprjprj_no_name: TStringField;
    levelCode: TCSADOQuery;
    licnslevellevel_no_name: TStringField;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel6: TPanel;
    grdLicnsLevel: TDBGridEh;
    Panel11: TPanel;
    Panel12: TPanel;
    bbtnLicnsLevelIns: TBitBtn;
    bbtnLicnsLevelDel: TBitBtn;
    CSDBNavigator2: TCSDBNavigator;
    Panel9: TPanel;
    grdLicnsPrj: TDBGridEh;
    panItem: TPanel;
    Panel10: TPanel;
    bbtnLicnsPrjIns: TBitBtn;
    bbtnLicnsPrjDel: TBitBtn;
    navItem: TCSDBNavigator;
    engageList: TCSADOQuery;
    engageListd: TDataSource;
    navList: TCSDBNavigator;
    navEngage: TCSDBNavigator;
    bbtnRefresh: TBitBtn;
    engageListsysid: TStringField;
    engageListperson_sysid: TStringField;
    engageListperson_sysid_name: TStringField;
    engageListlicns_prj_sysid: TStringField;
    engageListlicns_prj_sysid_name: TStringField;
    engageListorgan_sysid: TStringField;
    engageListorgan_sysid_name: TStringField;
    engageListengage_date: TStringField;
    EngageFind: TCSDBEhGrdFind;
    EngageFilter: TCSADOEhGrdFilter;
    EngageColCtrl: TCSEhGrdColCtrl;
    ImageList1: TImageList;
    bbtnTrainInfo: TBitBtn;
    tmp1: TCSADOQuery;
    engageListlicns_sysid: TStringField;
    engageListcert_no: TStringField;
    engageListlicns_kind: TStringField;
    engageListlicns_category: TStringField;
    engageListlicns_prj_code: TStringField;
    procedure bbtnLicnsPrjInsClick(Sender: TObject);
    procedure bbtnLicnsPrjDelClick(Sender: TObject);
    procedure bbtnLicnsLevelInsClick(Sender: TObject);
    procedure bbtnLicnsLevelDelClick(Sender: TObject);
    procedure bbtnEngageInsClick(Sender: TObject);
    procedure bbtnEngageDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure personlicenseAfterScroll(DataSet: TDataSet);
    procedure licnsprjAfterScroll(DataSet: TDataSet);
    procedure licnsengageAfterInsert(DataSet: TDataSet);
    procedure lcmbIssueOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbTrainOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbConfirmOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbTestOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure bbtnTrainInfoClick(Sender: TObject);
    procedure bbtnOperateClick(Sender: TObject);
    procedure personlicenseAfterInsert(DataSet: TDataSet);
    procedure personlicenseAfterPost(DataSet: TDataSet);
    procedure licnsprjAfterInsert(DataSet: TDataSet);
    procedure licnslevelAfterInsert(DataSet: TDataSet);
    procedure licnsprjBeforeEdit(DataSet: TDataSet);
    procedure grdLicnsPrjEnter(Sender: TObject);
    procedure grdLicnsLevelEnter(Sender: TObject);
    procedure lcmbLicnsKindKeyValueChanged(Sender: TObject);
    procedure lcmbLicnsCategoryKeyValueChanged(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnFindClick(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure bbtnColunmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure engageListAfterScroll(DataSet: TDataSet);
    procedure bbtnRefreshClick(Sender: TObject);
    procedure licnsengageAfterDelete(DataSet: TDataSet);
    procedure licnsengageAfterPost(DataSet: TDataSet);
    procedure lcmbLicnsPrjKeyValueChanged(Sender: TObject);
  private
		Fb_DataModified: Boolean;
    Fi_ActionID: Integer;
    Fs_CurLicnsId, Fs_CurPersonId: String;
    
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_LoadLicnsPrj;
    procedure prip_LoadLicnslevel;
    procedure prip_LoadTrainInfo;

    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_GetPersonInfo(strPsnId: string);
    procedure prip_GetEngageOrgan(Asa_Ids: array of string);

    procedure prip_RefreshComListSource;
    procedure prip_RefreshPersonListSource;
    procedure prip_RefreshmEngageOrganListSource;

    procedure prip_LoadPsnEngageList;
    procedure prip_GetPsnEngageInfo;
    procedure prip_RefreshEngageList(const As_ID: string = '');

    procedure prip_CompanyDialog(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmComMng);
    procedure prip_SelectEngageCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmComMng);

    procedure prip_PersonDialog(const Ai_Kind: Integer;
      const Ai_Category: Integer;const Ai_Prj: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmPersonMng);
    procedure prip_SelectPerson(const Ai_Kind: Integer;
      const Ai_Category: Integer;const Ai_Prj: Integer;
      const As_Field: string; Ac_Requestor: TfrmPersonMng);

    procedure prip_Logout;
    procedure prip_Issue;
    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
  public
    procedure pubp_Ini(const Ai_ActionID: Integer; Ac_Args: TStrings = nil);
    property DataModified: Boolean read Fb_DataModified;
  end;

implementation

uses
  DBGrids, CSVCLUtils, udmData, CommonLib, ufrmPsnTrainTest;

{$R *.dfm}

procedure TfrmPersonlicnsMng.bbtnLicnsPrjInsClick(Sender: TObject);
begin
  if personlicense.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质已保存', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end else licnsprj.Insert;
end;

procedure TfrmPersonlicnsMng.bbtnLicnsPrjDelClick(Sender: TObject);
begin
  if personlicense.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质已保存', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end else licnsprj.Delete;
end;

procedure TfrmPersonlicnsMng.bbtnLicnsLevelInsClick(Sender: TObject);
begin
  if licnsprj.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质项目已保存', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end else licnslevel.Insert;
end;

procedure TfrmPersonlicnsMng.bbtnLicnsLevelDelClick(Sender: TObject);
begin
  if licnsprj.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质项目已保存', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end else licnslevel.Delete;
end;

procedure TfrmPersonlicnsMng.bbtnEngageInsClick(Sender: TObject);
begin
  licnsengage.Insert;
end;

procedure TfrmPersonlicnsMng.bbtnEngageDelClick(Sender: TObject);
begin
  with licnsengage do if (not Active) or IsEmpty then
  begin
    Exit;
  end;

  if Application.MessageBox('警告，您确定要删除当前选择的人员资质聘用记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then
  begin
    Exit;
  end;

  licnsengage.Delete;
end;

function TfrmPersonlicnsMng.prif_CheckBlank(
  Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with personlicense do
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

procedure TfrmPersonlicnsMng.prip_IniData;
begin
  with licnskind do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns WHERE licns_level = 1';
    Open;
  end;

  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns WHERE licns_level = 2';
    Open;
  end;

  with licnsstate do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_ry_licns_state';
    Open;
  end;

  with prjCode do
  begin
		if Active then Close;
    SQL.Text := 'SELECT id,name FROM device.code_person_licns WHERE ' +
      'licns_level = 3';
    Open;
  end;

  with levelCode do
  begin
		if Active then Close;
    SQL.Text := 'SELECT id,name FROM device.code_person_licns WHERE ' +
      'licns_level = 4';
    Open;
  end;

  with personlicense do
  begin
    if Active then Close;

    SQL.Text := Format('SELECT * FROM device.person_certificate WHERE ' +
      'sysid = ''%s''', [Fs_CurLicnsId]);
    Open;

    if (Fi_ActionID = AM_PLMAPPL) or (Fi_ActionID = AM_PLMLOGI) then Insert;

    prip_GetComInfo([VarToStr(FieldValues['organ_sysid']),
      VarToStr(FieldValues['train_organ_sysid']),
      VarToStr(FieldValues['test_organ_sysid']),
      VarToStr(FieldValues['pass_organ_sysid'])]);
    prip_GetPersonInfo(Fs_CurPersonId);
  end;

end;

procedure TfrmPersonlicnsMng.prip_IniInterface;
begin
  // Fi_ActionID = AM_PLMVIEW 1 查看；Fi_ActionID = AM_PLMAPPL 2 申请；
  // Fi_ActionID = AM_PLMUPDA 3 变更；Fi_ActionID = AM_PLMEXCH 4 换证；
  // Fi_ActionID = AM_PLMLOGO 5 注销；Fi_ActionID = AM_PLMENAG 6 聘用情况；
  // Fi_ActionID = AM_PLMISSU 7 发证；Fi_ActionID = AM_PLMLOGI 8 持证登记；
  pagPsnLicns.ActivePageIndex:=0;
  case Fi_ActionID of
    AM_PLMVIEW: Caption := '查看人员资质';
    AM_PLMAPPL: Caption := '资质申请';
    AM_PLMUPDA: Caption := '资质变更';
    AM_PLMEXCH: Caption := '换证';
    AM_PLMLOGI: Caption := '持证登记';
    AM_PLMLOGO:
      begin
        Caption := '注销';
        with bbtnOperate do
        begin
          Caption := '注销';
          ImageList1.GetBitmap(1, Glyph);
        end;
      end;
    AM_PLMENGA:
      begin
        Caption := '聘用情况';
        pagPsnLicns.ActivePageIndex:=1;
      end;
    AM_PLMISSU:
      begin
        Caption := '发证';
        with bbtnOperate do
        begin
          Caption := '发证';
          ImageList1.GetBitmap(0, Glyph);
        end;
      end
  end;

  case Fi_ActionID of
    AM_PLMVIEW, AM_PLMLOGO, AM_PLMENGA:
      begin
        eCertNo.ReadOnly := True;
        lcmbName.ReadOnly := True;
        lcmbLicnskind.ReadOnly := True;
        lcmbLicnsCategory.ReadOnly := True;
        lcmbIssueorgan.ReadOnly := True;
        lcmbConfirmOrgan.ReadOnly := True;
        lcmbTrainOrgan.ReadOnly := True;
        lcmbTestOrgan.ReadOnly := True;
        dteStartDate.ReadOnly := True;
        dteConfirmDate.ReadOnly := True;
        dteEndDate.ReadOnly := True;
        dteChangeDate.ReadOnly := True;
        with grdLicnsPrj do Options := Options - [dgEditing];
        with grdLicnsLevel do Options := Options - [dgEditing];
        bbtnLicnsPrjIns.Enabled := False;
        bbtnLicnsPrjDel.Enabled := False;
        bbtnLicnsLevelIns.Enabled := False;
        bbtnLicnsLevelDel.Enabled := False;
      end;
    AM_PLMAPPL:
      begin
        eCertNo.ReadOnly := True;
      end;
    AM_PLMUPDA:
      begin
        eCertNo.ReadOnly := True;
        lcmbName.ReadOnly := True;
        lcmbLicnskind.ReadOnly := True;
        lcmbLicnsCategory.ReadOnly := True;
        lcmbIssueOrgan.ReadOnly := True;
        lcmbConfirmOrgan.ReadOnly := True;
      end;
    AM_PLMEXCH:
      begin
        eCertNo.ReadOnly := True;
        lcmbName.ReadOnly := True;
        lcmbLicnskind.ReadOnly := True;
        lcmbLicnsCategory.ReadOnly := True;
        lcmbIssueOrgan.ReadOnly := True;
        lcmbConfirmOrgan.ReadOnly := True;
        lcmbTrainOrgan.ReadOnly := True;
        lcmbTestOrgan.ReadOnly := True;
        with grdLicnsPrj do Options := Options - [dgEditing];
        with grdLicnsLevel do Options := Options - [dgEditing];
        bbtnLicnsPrjIns.Enabled := False;
        bbtnLicnsPrjDel.Enabled := False;
        bbtnLicnsLevelIns.Enabled := False;
        bbtnLicnsLevelDel.Enabled := False;
      end;
    AM_PLMISSU:
      begin
        with grdLicnsPrj do Options := Options - [dgEditing];
        with grdLicnsLevel do Options := Options - [dgEditing];
        bbtnLicnsPrjIns.Enabled := False;
        bbtnLicnsPrjDel.Enabled := False;
        bbtnLicnsLevelIns.Enabled := False;
        bbtnLicnsLevelDel.Enabled := False;
      end;
    AM_PLMLOGI:
      begin
        lcmbIssueOrgan.Color := clSkyBlue;
        lcmbConfirmOrgan.Color := clSkyBlue;
        dteStartDate.Color := clSkyBlue;
        dteEndDate.Color := clSkyBlue;
      end;
  end;

  bbtnOperate.Visible := Fi_ActionID in [AM_PLMLOGO, AM_PLMISSU];
  bbtnTraininfo.Visible := Fi_ActionID = AM_PLMISSU;
end;

// Ai_ActionID 模块打开方式
// Ac_Args[0] 放资质证书ID；Ac_Args[1] 放人员系统ID
procedure TfrmPersonlicnsMng.pubp_Ini(const Ai_ActionID: Integer;
  Ac_Args: TStrings);
begin
  Fi_ActionID := Ai_ActionID;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_CurLicnsId := Strings[0];
      if Count > 1 then Fs_CurPersonId := Strings[1];
    end;

  Gp_ProgressHint('正在载入人员资质信息，请稍候...');
  try
    prip_IniData;
  finally
    Gp_ProgressHint;
  end;

  prip_IniInterface;

  if MAXIMIZEMODALBYDEF then WindowState := wsMaximized;
end;

procedure TfrmPersonlicnsMng.FormCreate(Sender: TObject);
begin
  Fb_DataModified := False;
  Fi_ActionID := 0;
  Fs_CurLicnsId := '';
  Fs_CurPersonId := '';
end;

procedure TfrmPersonlicnsMng.personlicenseAfterScroll(DataSet: TDataSet);
begin
  prip_LoadlicnsPrj;
  prip_LoadPsnEngageList;
end;

procedure TfrmPersonlicnsMng.prip_LoadlicnsPrj;
var
  ls_LicnsId: string;
begin
  ls_LicnsId := personlicense.FieldByName('sysid').AsString;
  with licnsprj do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_cert_prj WHERE ' +
      'licns_sysid = ''%s''', [ls_LicnsId]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.licnsprjAfterScroll(DataSet: TDataSet);
begin
  prip_LoadLicnslevel;
end;

procedure TfrmPersonlicnsMng.prip_LoadLicnslevel;
var
  ls_LicnsPrjCode: string;
  ls_LicnsPrjSysId: string;
begin
  ls_LicnsPrjCode := licnsprj.FieldByName('prj_no').AsString;
  ls_LicnsPrjSysId := licnsprj.FieldByName('sysid').AsString;

  with levelCode do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE licns_level = 4 and parent_id = ''%s''', [ls_LicnsPrjCode]);
    Open;
  end;

  with licnslevel do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_cert_prjlevel WHERE ' +
      'licns_prj_sysid = ''%s''', [ls_LicnsPrjSysId]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.prip_LoadPsnEngageList;
var ls_PersonID : string;
begin
  ls_PersonID := personlicense.FieldByName('person_sysid').AsString;
  with engageList do
  begin
		if Active then Close;
    SQL.Text := Format('device.usp_getpsnengage ''%s'',''%s''',
      [ls_PersonID,Fs_CurLicnsId]);
    Open;

    if IsEmpty then prip_GetPsnEngageInfo;
  end;
end;

procedure TfrmPersonlicnsMng.prip_GetPsnEngageInfo;
var
  ls_PsnEngageId: string;
  ls_OrganId: string;
begin
  ls_PsnEngageId := EngageList.FieldByName('sysid').AsString;

  with licnsengage do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_engage_prj WHERE ' +
      'sysid = ''%s''', [ls_PsnEngageId]);
    Open;

    if not IsEmpty then
    begin
      ls_OrganId := VarToStr(FieldValues['organ_sysid']);
      prip_GetEngageOrgan([ls_OrganId]);
//      prip_GetPersonInfo([VarToStr(FieldValues['person_sysid'])]);
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_RefreshEngageList(const As_ID: string);
var ls_PersonID : string;
begin
  ls_PersonID := licnsEngage.FieldByName('person_sysid').AsString;
  with engageList do
  begin
    DisableControls;
    try
		  if Active then Close;
      SQL.Text := Format('device.usp_getpsnengage ''%s'',''%s''',
      [ls_PersonID,Fs_CurLicnsId]);
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.licnsengageAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
  end;
  licnsengage.FieldValues['person_sysid'] :=
    personlicense.FieldValues['person_sysid'];
end;

procedure TfrmPersonlicnsMng.prip_GetComInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 2 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 3 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 4 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0], Asa_Ids[1], Asa_Ids[2], Asa_Ids[3]]);
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

procedure TfrmPersonlicnsMng.prip_RefreshComListSource;
begin
  with lcmbIssueOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
  with lcmbConfirmOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
  with lcmbTrainOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
  with lcmbTestOrgan do
  begin
    listSource := nil;
    listSource := mComd;
  end;
end;

procedure TfrmPersonlicnsMng.prip_GetPersonInfo(strPsnId: string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.person_baseinfo ' +
      'WHERE sysid = ''%s''', [strPsnId]);
    Open;
    if not mPerson.IsEmpty then mPerson.Delete;
    mPerson.Insert;
    
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mPerson.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mPerson.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mPerson.Post;
    mPersonBak.LoadFromDataSet(mPerson);
    Close;
  end;
  prip_RefreshPersonListSource;
end;

procedure TfrmPersonlicnsMng.prip_RefreshPersonListSource;
begin
  with lcmbName do
  begin
    ListSource := nil;
    ListSource := mPersond;
  end;
  with lcmbPrsName do
  begin
    ListSource := nil;
    ListSource := mPersond;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbIssueOrganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbIssueOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbTrainOrganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbTrainOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbConfirmOrganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbConfirmOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbTestOrganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(ASSES_SIGN, lcmbTestOrgan, TfrmComMng.Create(nil));
end;

// TODO:
procedure TfrmPersonlicnsMng.prip_SelectCompany(const Ai_Category: Integer;
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
  with lc_Company, personlicense do
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

procedure TfrmPersonlicnsMng.prip_CompanyDialog(const Ai_Category: Integer;
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
begin
  with personlicensed do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      if Ac_LookupComboBox.Name = 'lcmbOrgan' then
      begin
        prip_SelectEngageCompany(Ai_Category, DataField, Ac_Requestor);
        ListSource := nil;
        ListSource := mEngageOrgand;
      end
      else
      begin
        prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
        ListSource := nil;
        ListSource := mComd;
      end;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_PersonDialog(const Ai_Kind, Ai_Category,
  Ai_Prj: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmPersonMng);
begin
  with personlicensed do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectPerson(Ai_Kind, Ai_Category, Ai_Prj, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mPersond;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_SelectPerson(const Ai_Kind, Ai_Category,
  Ai_Prj: Integer; const As_Field: string; Ac_Requestor: TfrmPersonMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Person: TfrmPersonMng;
begin
  ls_PrevId := '';
  lc_Person := Ac_Requestor;
  with lc_Person, personlicense do
  begin
    if VarToStr(FieldValues[As_Field]) <> '' then
      ls_PrevId := FieldByName(As_Field).AsString;

    lc_Arg := TStringList.Create;
    lc_Arg.Add(ls_PrevId);
//    lc_Arg.Add(IntToStr(Ai_Kind));
//    lc_Arg.Add(IntToStr(Ai_Category));
//    lc_Arg.Add(IntToStr(Ai_Prj));
    try
      pubp_ini(True, lc_Arg);
      lc_Rc := ShowModal;
      Self.Update;
    finally
      lc_Arg.Free;
    end;

    if (lc_Rc = mrOK) and (ls_PrevId <> CurPersonId) then
    begin
      li_Index := mPerson.FieldByName(As_Field).Index;
      mPerson.Edit;
      mPerson.Fields[li_Index].AsString := CurPersonId;
      mPerson.Fields[li_Index + 1].AsString := CurPersonName;
      mPerson.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurPersonId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_PersonDialog(0, 0, 0, lcmbName, TfrmPersonMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.prip_GetEngageOrgan(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''', [Asa_Ids[0]]);
    Open;
    if not mEngageOrgan.IsEmpty then mEngageOrgan.Delete;
    mEngageOrgan.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mEngageOrgan.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mEngageOrgan.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mEngageOrgan.Post;
    mEngageOrganBak.LoadFromDataSet(mEngageOrgan);
    Close;
  end;
  prip_RefreshmEngageOrganListSource;
end;

procedure TfrmPersonlicnsMng.prip_RefreshmEngageOrganListSource;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mEngageOrgand;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(0, lcmbOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.prip_LoadTrainInfo;
var
  lc_Arg: TStrings;
  lc_PsnTrainTest: TfrmPsnTrainTest;
begin
  with personlicense do if (not Active) or IsEmpty then Exit;

  lc_PsnTrainTest := TfrmPsnTrainTest.Create(nil);
  with lc_PsnTrainTest do
    try
      lc_Arg := TStringList.Create;

      //参数数组[0] 人员系统ID
      lc_Arg.Add(personlicense.FieldByName('person_sysid').AsString);
      try
        pubp_Ini(True, lc_Arg);
        ShowModal;
      finally
        lc_Arg.Free;
      end;
    finally
      Free;
    end;
end;

procedure TfrmPersonlicnsMng.bbtnTrainInfoClick(Sender: TObject);
begin
  prip_LoadTrainInfo;
end;

procedure TfrmPersonlicnsMng.bbtnOperateClick(Sender: TObject);
begin
  case Fi_ActionID of
    AM_PLMLOGO: prip_Logout;
    AM_PLMISSU: prip_Issue;
  end
end;

procedure TfrmPersonlicnsMng.personlicenseAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    if Fs_CurPersonId <> '' then
      FieldByName('person_sysid').AsString := Fs_CurPersonId;
    case Fi_ActionID of
      AM_PLMLOGI: FieldByName('state').AsString := PLS_NORMAL;
      AM_PLMAPPL: FieldByName('state').AsString := PLS_APPLY;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.personlicenseAfterPost(DataSet: TDataSet);
begin
  Fb_DataModified := True;
end;

procedure TfrmPersonlicnsMng.licnsprjAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('licns_sysid').AsString := personlicense.FieldByName('sysid').AsString;
  end;
end;

procedure TfrmPersonlicnsMng.licnslevelAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('licns_prj_sysid').AsString := licnsprj.FieldByName('sysid').AsString;
  end;
end;

procedure TfrmPersonlicnsMng.licnsprjBeforeEdit(DataSet: TDataSet);
begin
  if personlicense.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质已保存', PChar(Caption), MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

procedure TfrmPersonlicnsMng.grdLicnsPrjEnter(Sender: TObject);
begin
  if personlicense.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质已保存', PChar(Caption), MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

procedure TfrmPersonlicnsMng.grdLicnsLevelEnter(Sender: TObject);
begin
  if licnsprj.State <> dsBrowse then
  begin
    Application.MessageBox('请确保当前编辑的资质项目已保存', PChar(Caption), MB_OK + MB_ICONWARNING);
    Abort;
  end
end;

procedure TfrmPersonlicnsMng.lcmbLicnsKindKeyValueChanged(Sender: TObject);
var
  ls_LicnsKind: string;
begin
  ls_LicnsKind := VarToStr(lcmbLicnsKind.KeyValue);
  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE licns_level = 2 and parent_id = ''%s''', [ls_LicnsKind]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbLicnsCategoryKeyValueChanged(
  Sender: TObject);
var
  ls_LicnsCategory: string;
begin
  ls_LicnsCategory := VarToStr(lcmbLicnsCategory.KeyValue);
  with prjCode do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE licns_level = 3 and parent_id = ''%s''', [ls_LicnsCategory]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPersonlicnsMng.bbtnFindClick(Sender: TObject);
begin
  EngageFind.FindDlg;
end;

procedure TfrmPersonlicnsMng.bbtnFilterClick(Sender: TObject);
begin
  EngageFilter.FilterDlg;
end;

procedure TfrmPersonlicnsMng.bbtnColunmClick(Sender: TObject);
begin
  with EngageColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmPersonlicnsMng.prip_Issue;
var
  lb_Result : Boolean;
  li_Result: Integer;
  ls_CurPsnId : string;
  ls_CurLcnsId : string;
  ls_CurLcnsKind : string;
  ls_CurLcnsCategory : string;
  ls_CertNo : string;
  ls_ConfirmOrganId : string;
  ls_Passdate : string;
begin
  if Application.MessageBox('您确定要颁发这张证书吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
// 调用发证 存储过程
  with personLicense do
  begin               //
    lb_Result := prif_CheckBlank([FieldByName('certno'),
    FieldByName('licns_kind'), FieldByName('licns_category'),
    FieldByName('organ_sysid'),  FieldByName('pass_date')]);
    if not lb_Result then Abort
    else
    begin
      ls_CurPsnId := FieldByName('person_sysid').AsString;
      ls_CurLcnsId := FieldByName('sysid').AsString;
      ls_CurLcnsKind := FieldByName('licns_kind').AsString;
      ls_CurLcnsCategory := FieldByName('licns_category').AsString;
      ls_CertNo := FieldByName('certno').AsString;
      ls_ConfirmOrganId := FieldByName('organ_sysid').AsString;
      ls_Passdate := FieldByName('pass_date').AsString;
    end;
  end;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_issuelicense ''%s'', ''%s'', ''%s'', ' +
      '''%s'', ''%s'', ''%s'', ''%s''', [ls_CurPsnId,ls_CurLcnsId,ls_CurLcnsKind,
      ls_CurLcnsCategory,ls_CertNo,ls_ConfirmOrganId,ls_Passdate]);
    Open;
    li_Result := Fields[0].AsInteger;
    Close;
  end;
  if li_Result = 1 then
    Application.MessageBox('发证成功！', PChar(Caption), MB_OK + MB_ICONWARNING)
  else
    Application.MessageBox('发证未成功！', PChar(Caption), MB_OK + MB_ICONWARNING);
//  with personlicense do
//  begin
//    Edit;
//    FieldByName('state').AsString := PLS_NORMAL;
//    Post;
//  end;

  Close;
end;

procedure TfrmPersonlicnsMng.prip_Logout;
begin
  if Application.MessageBox('您确定要注销这张证书吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

  with personlicense do
  begin
    Edit;
    FieldByName('state').AsString := PLS_LOGOUT;
    Post;
  end;

  Close;
end;

procedure TfrmPersonlicnsMng.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmPersonlicnsMng.engageListAfterScroll(DataSet: TDataSet);
begin
  prip_GetPsnEngageInfo;
end;

procedure TfrmPersonlicnsMng.bbtnRefreshClick(Sender: TObject);
begin
  prip_RefreshEngageList;
end;

procedure TfrmPersonlicnsMng.licnsengageAfterDelete(DataSet: TDataSet);
begin
  prip_RefreshEngageList;
end;

procedure TfrmPersonlicnsMng.prip_SelectEngageCompany(
  const Ai_Category: Integer; const As_Field: string;
  Ac_Requestor: TfrmComMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmComMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company, licnsengage do
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
      li_Index := mEngageOrgan.FieldByName(As_Field).Index;
      mEngageOrgan.Edit;
      mEngageOrgan.Fields[li_Index].AsString := CurCompanyId;
      mEngageOrgan.Fields[li_Index + 1].AsString := CurCompanyName;
      mEngageOrgan.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurCompanyId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.licnsengageAfterPost(DataSet: TDataSet);
var
  ls_PsnEngageId : string;
begin
  ls_PsnEngageId := licnsengage.FieldByName('sysid').AsString ;
  prip_RefreshEngageList(ls_PsnEngageId);
end;

procedure TfrmPersonlicnsMng.lcmbLicnsPrjKeyValueChanged(Sender: TObject);
begin
  with licnsengage do
    if State in [dsEdit, dsInsert] then
      FieldValues['licns_prj_sysid'] := licnsprj.FieldValues['sysid'];
end;

end.
