unit ufrmOrganMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, CSDBEhGrdStore, CSScrCtrlChild, CSBarMDIChild,
  PrnDbgeh, CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter, CSADOEhGrdFilter,
  CSDBBase, CSDBFind, CSDBEhGrdFind, DB, ADODB, CSADOQuery, DBLookupEh,
  StdCtrls, CSCheckBox, Mask, DBCtrlsEh, ComCtrls, CSRowCountPanel, Grids,
  DBCtrls, CSDBNavigator, Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, CSCustomdxDateEdit, CSdxDBDateEdit;

type
  TfrmOrganMng = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    OrganInfo: TCSADOQuery;
    OrganInfod: TDataSource;
    grdList: TDBGridEh;
    Panel4: TPanel;
    Navigator: TCSDBNavigator;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    SaveDialog: TSaveDialog;
    ListPrint: TPrintDBGridEh;
    CSBarMDIChild1: TCSBarMDIChild;
    Panel5: TPanel;
    province: TCSADOQuery;
    city: TCSADOQuery;
    borough: TCSADOQuery;
    provinced: TDataSource;
    cityd: TDataSource;
    boroughd: TDataSource;
    area: TCSADOQuery;
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
    Temp: TCSADOQuery;
    bbtnReplace: TBitBtn;
    CSRowCountPanel1: TCSRowCountPanel;
    Panel3: TPanel;
    pagDetail: TPageControl;
    tsBaseInfo: TTabSheet;
    tsContact: TTabSheet;
    scrbDetail: TScrollBox;
    Panel6: TPanel;
    Panel7: TPanel;
    bbtnContactInsert: TBitBtn;
    bbtnContactDelete: TBitBtn;
    navLinkman: TCSDBNavigator;
    grdContact: TDBGridEh;
    contact: TCSADOQuery;
    contactd: TDataSource;
    tsCert: TTabSheet;
    Panel10: TPanel;
    CertList: TCSADOQuery;
    CertListd: TDataSource;
    bbtnView: TBitBtn;
    bbtnAdd: TBitBtn;
    bbtnChange: TBitBtn;
    bbtnExchange: TBitBtn;
    bbtnLogout: TBitBtn;
    grdCert: TDBGridEh;
    Label1: TLabel;
    eRegNo: TDBEditEh;
    Label2: TLabel;
    eName: TDBEditEh;
    Label3: TLabel;
    eLegalperson: TDBEditEh;
    gbx_address: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    lcmbProvince: TDBLookupComboboxEh;
    lcmbCity: TDBLookupComboboxEh;
    lcmbBorough: TDBLookupComboboxEh;
    eAddress: TDBEditEh;
    Label10: TLabel;
    eTel: TDBEditEh;
    Label11: TLabel;
    eFax: TDBEditEh;
    Label12: TLabel;
    eZip: TDBEditEh;
    Label8: TLabel;
    eWeb: TDBEditEh;
    OrganInfosysid: TStringField;
    OrganInforegno: TStringField;
    OrganInfoname: TStringField;
    OrganInfotype_id: TStringField;
    OrganInfolegalperson: TStringField;
    OrganInfoprovince_id: TStringField;
    OrganInfocity_id: TStringField;
    OrganInfoborough_id: TStringField;
    OrganInfoaddr: TStringField;
    OrganInfotel: TStringField;
    OrganInfozip: TStringField;
    OrganInfofax: TStringField;
    OrganInfoweb: TStringField;
    OrganInfostate: TStringField;
    OrganInfocategory: TIntegerField;
    OrganInfoprovince: TStringField;
    OrganInfocity: TStringField;
    OrganInfoborough: TStringField;
    Label9: TLabel;
    lcmbType: TDBLookupComboboxEh;
    Label13: TLabel;
    lcmbState: TDBLookupComboboxEh;
    gbCategory: TGroupBox;
    OrganType: TCSADOQuery;
    OrganTyped: TDataSource;
    OrganState: TCSADOQuery;
    OrganStated: TDataSource;
    OrganInfotype: TStringField;
    OrganInfostate_name: TStringField;
    contactsysid: TStringField;
    contactcategory: TIntegerField;
    contactorgan_sysid: TStringField;
    contactname: TStringField;
    contacttel: TStringField;
    contactaddr: TStringField;
    contactzip: TStringField;
    contactemail: TStringField;
    CertListsysid: TStringField;
    bbtnFindCert: TBitBtn;
    bbtnFilterCert: TBitBtn;
    CertFilter: TCSADOEhGrdFilter;
    CertFind: TCSDBEhGrdFind;
    CSCheckBox1: TCSCheckBox;
    CSCheckBox2: TCSCheckBox;
    CSCheckBox3: TCSCheckBox;
    CSCheckBox4: TCSCheckBox;
    CSCheckBox5: TCSCheckBox;
    CSCheckBox6: TCSCheckBox;
    CSCheckBox7: TCSCheckBox;
    CSCheckBox8: TCSCheckBox;
    CSCheckBox9: TCSCheckBox;
    CSCheckBox10: TCSCheckBox;
    CSCheckBox11: TCSCheckBox;
    CSCheckBox12: TCSCheckBox;
    CSCheckBox13: TCSCheckBox;
    CSCheckBox14: TCSCheckBox;
    CSCheckBox15: TCSCheckBox;
    ListEhGrdStore: TCSDBEhGrdStore;
    OrganInfocharge_com: TStringField;
    OrganInfoauth_com: TStringField;
    OrganInfolicns_com: TStringField;
    OrganInfolicns_no: TStringField;
    OrganInfoestab_date: TStringField;
    OrganInfostart_date: TStringField;
    OrganInfocountry: TStringField;
    OrganInfocapital_asserts: TBCDField;
    OrganInfocapital_register: TBCDField;
    OrganInfomanager: TStringField;
    OrganInfomanager_post: TStringField;
    OrganInfoisomanager: TStringField;
    OrganInfoman_quantity: TIntegerField;
    Label14: TLabel;
    eCountry: TDBEditEh;
    Label15: TLabel;
    cmbChargeCom: TDBComboBoxEh;
    Label16: TLabel;
    cmbAuthCom: TDBComboBoxEh;
    Label17: TLabel;
    cmbLicnsCom: TDBComboBoxEh;
    Label18: TLabel;
    deEstabDate: TCSdxDBDateEdit;
    Label19: TLabel;
    deStartDate: TCSdxDBDateEdit;
    Label20: TLabel;
    eLicnsNo: TDBEditEh;
    Label21: TLabel;
    eCapitalAsserts: TDBNumberEditEh;
    Label22: TLabel;
    eCapitalRegister: TDBNumberEditEh;
    Label23: TLabel;
    eManQuantity: TDBNumberEditEh;
    Label24: TLabel;
    eManager: TDBEditEh;
    Label25: TLabel;
    eManagerPost: TDBEditEh;
    Label26: TLabel;
    eIsoManager: TDBEditEh;
    CertListagent_name: TStringField;
    CertListagent_regno: TStringField;
    CertListagent_legalperson: TStringField;
    CertListagent_addr: TStringField;
    CertListagent_zip: TStringField;
    CertListagent_tel: TStringField;
    CertListagent_fax: TStringField;
    CertListagent_email: TStringField;
    CertListcharge_remark: TStringField;
    CertListlocal_supervise_remark: TStringField;
    CertListaccept_supervise_remark: TStringField;
    CertListaccept_no: TStringField;
    CertListaccept_type: TStringField;
    CertListcom_area: TBCDField;
    CertListworkshop_area: TBCDField;
    CertListexposal_area: TBCDField;
    CertListdesigner_num: TIntegerField;
    CertListchecker_num: TIntegerField;
    CertListinspector_num: TIntegerField;
    CertListwelder_num: TIntegerField;
    CertListother_num: TIntegerField;
    CertListdesign_type: TStringField;
    CertListyear_value: TBCDField;
    CertListlevel1_id: TStringField;
    CertListlevel1: TStringField;
    CertListlevel2_id: TStringField;
    CertListlevel2: TStringField;
    CertListlevel3_id: TStringField;
    CertListlevel3: TStringField;
    CertListapply_date: TStringField;
    CertListauth_date: TStringField;
    CertListend_date: TStringField;
    CertListstate: TStringField;
    CertListstate_name: TStringField;
    CertListauth_organ: TStringField;
    CertListauth_organ_sysid: TStringField;
    CertListremark: TStringField;
    CertListcertno: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OrganInfoBeforePost(DataSet: TDataSet);
    procedure OrganInfoAfterInsert(DataSet: TDataSet);
    procedure OrganInfoAfterPost(DataSet: TDataSet);
    procedure OrganInfoAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnFindClick(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure bbtnColunmClick(Sender: TObject);
    procedure bbtnInsertClick(Sender: TObject);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure OrganInfoBeforeEdit(DataSet: TDataSet);
    procedure OrganInfoBeforeInsert(DataSet: TDataSet);
    procedure bbtnReplaceClick(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure lcmbProvinceKeyValueChanged(Sender: TObject);
    procedure lcmbCityKeyValueChanged(Sender: TObject);
    procedure bbtnContactInsertClick(Sender: TObject);
    procedure bbtnContactDeleteClick(Sender: TObject);
    procedure bbtnFindCertClick(Sender: TObject);
    procedure bbtnFilterCertClick(Sender: TObject);
    procedure OrganInfoAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnViewClick(Sender: TObject);
    procedure bbtnAddClick(Sender: TObject);
    procedure bbtnChangeClick(Sender: TObject);
    procedure bbtnExchangeClick(Sender: TObject);
    procedure bbtnLogoutClick(Sender: TObject);
    procedure contactAfterInsert(DataSet: TDataSet);
    procedure CategoryClick(Sender: TObject);
    procedure pagDetailChanging(Sender: TObject; var AllowChange: Boolean);
    procedure grdCertGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CertListAfterScroll(DataSet: TDataSet);
    procedure cmbChargeComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cmbAuthComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cmbLicnsComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
		Fb_SelectOn, Fb_DataModified, Fb_ChangeEnabled, Fb_ExchangeEnabled,
    Fb_LogoutEnabled: Boolean;
    Fi_Category: Integer;
    Fs_PrevRegNo, Fs_LocateInfo, Fs_Requestor: string;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_LoadCategory;
    procedure prip_LoadCert;
    procedure prip_LoadDetail;

    procedure prip_RefreshCity;
    procedure prip_RefreshBorough;
    procedure prip_RefreshCategoryList(const Ab_NeedRefresh: Boolean = False);
    function prif_GenerateRegNo: string;
    procedure prip_SelectOrgan(const As_Field: string;
      const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng);
    procedure prip_OrganDialog(Ac_Sender: TDBComboBoxEh;
      const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng = nil);
    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
    function prif_CheckDelete: Boolean;
    function prif_Validate: Boolean;
    procedure prip_OrganInfoBeforePost;
    procedure prip_DeleteOrgan;

    procedure prip_OpenOrganCertMng(const Ai_ActMode: Integer);

    procedure prip_ExportData;
    procedure prip_ReplaceOrgan;
    procedure prip_TargetForReplace;

    function GetCurOrganId: string;
    function GetCurOrganName: string;
    function GetCurCertId: string;
  public
    procedure pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
    property DataModified: Boolean read Fb_DataModified;
    property CurOrganId: string read GetCurOrganId;
    property CurOrganName: string read GetCurOrganName;
    property CurCertId: string read GetCurCertId;
  end;

var
  frmOrganMng: TfrmOrganMng;

implementation

uses
  DBGridEhImpExp, dxmdaset ,CSDBUtils, CSVCLUtils, udmData, CommonLib,
  ufrmReplaceDlg, ufrmOrganCertMng;

{$R *.dfm}

procedure TfrmOrganMng.pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings);
begin
  ScrChild.SetSecurity(Self);
  Fb_ChangeEnabled := bbtnChange.Enabled;
  Fb_ExchangeEnabled := bbtnExchange.Enabled;
  Fb_LogoutEnabled := bbtnLogout.Enabled;

  Fb_SelectOn := Ab_SelectOn;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_LocateInfo := Strings[0];
      if Count > 1 then Fi_Category := StrToInt(Strings[1]);
      if Count > 2 then Fs_Requestor := Strings[2];
    end;

  Gp_ProgressHint('正在载入单位信息，请稍候...');
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

procedure TfrmOrganMng.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Fb_SelectOn then Action := caHide
  else begin
    Action := caFree;
    frmOrganMng := nil;
  end;
end;

procedure TfrmOrganMng.prip_ExportData;
var
	lc_ExpClass: TDBGridEhExportClass;
  ls_Ext: string;
begin
	if grdList.Selection.SelectionType = gstNon then
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
      SaveDBGridEhToExportFile(lc_ExpClass, grdList,
        ChangeFileExt(SaveDialog.FileName, ls_Ext), False);
      Application.MessageBox('数据导出成功。', Pchar(Caption),
        MB_OK + MB_ICONINFORMATION);
    finally
      Gp_ProgressHint;
    end;
  end;
end;

procedure TfrmOrganMng.prip_IniData;
begin
  with area do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code LIKE ''%s''',
      [TOPAREACODE]);
    Open;
  end;

  with province do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'code LIKE ''%s'' AND code_level = %d', [TOPAREACODE, PROVINCELEVEL]);
    Open;
  end;

  with city do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level = %d',
      [CITYLEVEL]);
    Open;
  end;

  with borough do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level in ' +
      '(%d, %d)', [BOROUTHLEVEL, RESERVEDLEVEL]);
    Open;
  end;

  with OrganType do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_type';
    Open;
  end;

  with OrganState do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_state';
    Open;
  end;

  with OrganInfo do
  begin
		if Active then Close;
    if Fi_Category = 0 then SQL.Text := 'SELECT * FROM organ_baseinfo'
    else
      SQL.Text := Format('SELECT * FROM device.organ_baseinfo WHERE ' +
        'category & %d <> 0', [Fi_Category]);
    Open;
    if Fb_SelectOn then
      if not Locate('sysid', Fs_LocateInfo, []) then
        Locate('name', Fs_LocateInfo, []);
  end;
end;

procedure TfrmOrganMng.prip_RefreshBorough;
var
  ls_CityId: string;
begin
 	with OrganInfo do
	  if State = dsBrowse then ls_CityId := VarToStr(FieldValues['city_id'])
    else begin
			ls_CityId := VarToStr(lcmbCity.Value);
      FieldByName('borough_id').Clear;
    end;

  with borough do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_CityId]);
    Open;
  end;
end;

procedure TfrmOrganMng.prip_RefreshCity;
var
  ls_ProvinceId: string;
begin
  with OrganInfo do
	  if State = dsBrowse then
      ls_ProvinceId := VarToStr(FieldValues['province_id'])
    else begin
      ls_ProvinceId := VarToStr(lcmbProvince.Value);
      FieldByName('city_id').Clear;
  	end;

  with city do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_ProvinceId]);
    Open;
  end;
end;

function TfrmOrganMng.prif_CheckBlank(Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with OrganInfo do
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

procedure TfrmOrganMng.OrganInfoBeforePost(DataSet: TDataSet);
begin
  prip_OrganInfoBeforePost;
end;

function TfrmOrganMng.prif_GenerateRegNo: string;
var
  li_MaxRegNo: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := 'SELECT MAX(regno) AS regno FROM device.organ_baseinfo WHERE ' +
      'regno LIKE ''PDY%%''';
    Open;
    if VarToStr(FieldValues['regno']) = '' then li_MaxRegNo := 0
    else
      li_MaxRegNo := StrToInt(Copy(FieldByName('regno').AsString, 4,
        Length(FieldByName('regno').AsString) - 3));
    Close;
  end;
  Result := Format('PDY%.9d', [li_MaxRegNo + 1]);
end;

procedure TfrmOrganMng.OrganInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('regno').AsString := prif_GenerateRegNo;
    FieldByName('state').AsString := OS_NORMAL;
  end;
end;

procedure TfrmOrganMng.OrganInfoAfterPost(DataSet: TDataSet);
begin
  prip_RefreshCategoryList(True);
	Fb_DataModified := True;
end;

procedure TfrmOrganMng.OrganInfoAfterDelete(DataSet: TDataSet);
begin
	Fb_DataModified := True;
end;

procedure TfrmOrganMng.FormCreate(Sender: TObject);
begin
  with ListEhGrdStore do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    RestoreGridLayout;
  end;

	Fb_DataModified := False;
  Fi_Category := 0;
  Fs_PrevRegNo := '';
  Fs_LocateInfo := '';
  Fs_Requestor := '';
end;

function TfrmOrganMng.GetCurOrganId: string;
begin
  Result := VarToStr(OrganInfo.FieldValues['sysid']);
end;

procedure TfrmOrganMng.bbtnExportClick(Sender: TObject);
begin
  prip_ExportData;
end;

procedure TfrmOrganMng.bbtnPrintClick(Sender: TObject);
begin
	ListPrint.Preview;
end;

procedure TfrmOrganMng.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrganMng.bbtnFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmOrganMng.bbtnFilterClick(Sender: TObject);
begin
	ListFilter.FilterDlg;
end;

procedure TfrmOrganMng.bbtnColunmClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmOrganMng.bbtnInsertClick(Sender: TObject);
begin
  OrganInfo.Insert;
end;

procedure TfrmOrganMng.bbtnDeleteClick(Sender: TObject);
begin
  prip_DeleteOrgan;
end;

function TfrmOrganMng.prif_CheckDelete: Boolean;
begin
  Result := True;

  with OrganInfo do if (not Active) or IsEmpty then
  begin
    Result := False;
    Exit;
  end;

  if Application.MessageBox('警告，删除单位时将同时删除该单位所有的联系信息' +
    '和许可证信息。您确定要删除当前记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then
  begin
    Result := False;
    Exit;
  end;

  //TODO: To be completed
end;

function TfrmOrganMng.prif_Validate: Boolean;
var
  ls_RegNo: string;
begin
  with OrganInfo do
  begin
    Result := prif_CheckBlank([FieldByName('regno'), FieldByName('name'),
      FieldByName('category')]);
    if Result then ls_RegNo := FieldByName('regno').AsString;
  end;
  if not Result then Exit;

  if VarToStr(OrganInfo.FieldValues['regno']) <> Fs_PrevRegNo then
    with temp do
    begin
      if Active then Close;
      SQL.Text := Format('SELECT regno FROM device.organ_baseinfo WHERE ' +
        'regno = ''%s''', [ls_RegNo]);
      Open;
      if IsEmpty then Result := True
      else begin
        Result := False;
        Application.MessageBox('您输入的单位机构代码已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
      end;
      Close;
    end;
end;

procedure TfrmOrganMng.OrganInfoBeforeEdit(DataSet: TDataSet);
begin
  Fs_PrevRegNo := VarToStr(DataSet.FieldValues['regno']);
end;

procedure TfrmOrganMng.OrganInfoBeforeInsert(DataSet: TDataSet);
begin
  Fs_PrevRegNo := '';
end;

procedure TfrmOrganMng.prip_ReplaceOrgan;
begin
  frmReplaceDlg := TfrmReplaceDlg.Create(Self);
  frmReplaceDlg.pubp_Ini(Self); 
end;

procedure TfrmOrganMng.bbtnReplaceClick(Sender: TObject);
begin
  prip_ReplaceOrgan;
end;

procedure TfrmOrganMng.grdListDblClick(Sender: TObject);
begin
  prip_TargetForReplace;
end;

procedure TfrmOrganMng.prip_TargetForReplace;
var
  lc_DataSet: TdxMemData;
begin
  with OrganInfo do
  begin
    if RecordCount = 0 then Exit;
    if State <> dsBrowse then Exit;
  end;
  
  if Assigned(frmReplaceDlg) then
  begin
    case frmReplaceDlg.rdgSelected.ItemIndex of
      0: lc_DataSet := frmReplaceDlg.memSrc;
      1: lc_DataSet := frmReplaceDlg.memDest;
      else lc_DataSet := nil;
    end;
    with lc_DataSet do
    begin
      if RecordCount = 1 then
      begin
        Close;
        Open;
      end;
      Append;
      FieldValues['sysid'] := OrganInfo.FieldValues['sysid'];
      FieldValues['name'] := OrganInfo.FieldValues['name'];
      Post;
    end;
  end;
end;

function TfrmOrganMng.GetCurOrganName: string;
begin
  Result := VarToStr(OrganInfo.FieldValues['name'])
end;

procedure TfrmOrganMng.lcmbProvinceKeyValueChanged(Sender: TObject);
begin
  prip_RefreshCity;
end;

procedure TfrmOrganMng.lcmbCityKeyValueChanged(Sender: TObject);
begin
  prip_RefreshBorough;
end;

procedure TfrmOrganMng.bbtnContactInsertClick(Sender: TObject);
begin
  with OrganInfo do if (not Active) or IsEmpty then Exit;

  contact.Insert;
end;

procedure TfrmOrganMng.bbtnContactDeleteClick(Sender: TObject);
begin
  with contact do
  begin
    if (not Active) or IsEmpty then Exit;

    if Application.MessageBox('您确定要删除当前记录吗?', '确认', MB_OKCANCEL +
      MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then Exit;

    Delete;
  end;
end;

procedure TfrmOrganMng.bbtnFindCertClick(Sender: TObject);
begin
  CertFind.FindDlg;
end;

procedure TfrmOrganMng.bbtnFilterCertClick(Sender: TObject);
begin
  CertFilter.FilterDlg;
end;

procedure TfrmOrganMng.prip_LoadDetail;
var
  ls_Id: string;
begin
  ls_Id := OrganInfo.FieldByName('sysid').AsString;

  with contact do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_contact WHERE ' +
      'organ_sysid = ''%s''', [ls_Id]);
    Open;
  end;

  prip_LoadCert;
end;

procedure TfrmOrganMng.OrganInfoAfterScroll(DataSet: TDataSet);
begin
  prip_RefreshCategoryList;
  prip_LoadCategory;
  prip_LoadDetail;
end;

procedure TfrmOrganMng.prip_LoadCert;
var
  ls_Id: string;
begin
  ls_Id := OrganInfo.FieldByName('sysid').AsString;

  with CertList do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_getcertlist ''%s''', [ls_Id]);
    Open;
  end;
end;

procedure TfrmOrganMng.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := CheckDBState(Self, True, [OrganInfo, contact]) in CDS_GO;
  
  with OrganInfo do if Fb_SelectOn and ((not Active) or IsEmpty) and
    (ModalResult = mrOK) then
  begin
    Application.MessageBox('没有任何单位可以选择，不能执行确认选择。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    CanClose := False;
  end;
end;

procedure TfrmOrganMng.bbtnViewClick(Sender: TObject);
begin
  prip_OpenOrganCertMng(AM_OCMVIEW);
end;

procedure TfrmOrganMng.bbtnAddClick(Sender: TObject);
begin
  prip_OpenOrganCertMng(AM_OCMADD);
end;

procedure TfrmOrganMng.bbtnChangeClick(Sender: TObject);
begin
  prip_OpenOrganCertMng(AM_OCMCHANGE);
end;

procedure TfrmOrganMng.bbtnExchangeClick(Sender: TObject);
begin
  prip_OpenOrganCertMng(AM_OCMEXCHANGE);
end;

procedure TfrmOrganMng.bbtnLogoutClick(Sender: TObject);
begin
  prip_OpenOrganCertMng(AM_OCMLOGOUT);
end;

procedure TfrmOrganMng.prip_IniInterface;
begin
  bbtnSelect.Visible := Fb_SelectOn;

  bbtnView.Visible := Fs_Requestor <> 'TfrmOrganCertMng';
  bbtnAdd.Visible := bbtnView.Visible;
  bbtnChange.Visible := bbtnView.Visible;
  bbtnExchange.Visible := bbtnView.Visible;
  bbtnLogout.Visible := bbtnView.Visible;
end;

procedure TfrmOrganMng.prip_OpenOrganCertMng(const Ai_ActMode: Integer);
var
  lc_Arg: TStrings;
  lc_OrganCertMng: TfrmOrganCertMng;
begin
  with OrganInfo do if (not Active) or IsEmpty then Exit;

  with CertList do
    if ((not Active) or IsEmpty) and (Ai_ActMode <> AM_OCMADD) then Exit;

  lc_Arg := TStringList.Create;
  try
    if Ai_ActMode = AM_OCMADD then lc_Arg.Add('')
    else lc_Arg.Add(CertList.FieldByName('sysid').AsString);
    if Ai_ActMode = AM_OCMADD then
      lc_Arg.Add(OrganInfo.FieldByName('sysid').AsString)
    else lc_Arg.Add('');

    lc_OrganCertMng := TfrmOrganCertMng.Create(nil);
    with lc_OrganCertMng do
      try
        pubp_Ini(Ai_ActMode, lc_Arg);
        ShowModal;
        if DataModified then prip_LoadCert;
      finally
        Free;
      end;
  finally
    lc_Arg.Free;
  end;
end;

procedure TfrmOrganMng.contactAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldValues['organ_sysid'] := OrganInfo.FieldValues['sysid'];
  end;
end;

procedure TfrmOrganMng.CategoryClick(Sender: TObject);
var
  li_CurVal, li_Val: Integer;
begin
  with OrganInfo do
    if IsEmpty then li_CurVal := 0
    else li_CurVal := FieldByName('category').AsInteger;

  with TCSCheckBox(Sender) do
  begin
    li_Val := Value;
    if li_Val = 0 then
    begin
      li_Val := ValueChecked;
      li_Val := not li_Val;
      li_CurVal := li_CurVal and li_Val;
    end else li_CurVal := li_CurVal or li_Val;
  end;

  with OrganInfo do
  begin
    Edit;
    FieldByName('category').AsInteger := li_CurVal;
  end;
end;

procedure TfrmOrganMng.prip_LoadCategory;
var
  li_i, li_Val, li_ValueChecked: Integer;
  lc_CheckBox: TCSCheckBox;
begin
  li_Val := OrganInfo.FieldByName('category').AsInteger;
  with gbCategory do
    for li_i := 0 to ControlCount - 1 do
    begin
      lc_CheckBox := TCSCheckBox(Controls[li_i]);
      li_ValueChecked := lc_CheckBox.ValueChecked;
      lc_CheckBox.OnClick := nil;
      try
        lc_CheckBox.Checked := (li_Val and li_ValueChecked) <> 0;
      finally
        lc_CheckBox.OnClick := CategoryClick;
      end;
    end;
end;

function TfrmOrganMng.GetCurCertId: string;
begin
  with CertList do
    if IsEmpty then Result := ''
    else if FieldByName('state').AsString = OCS_LOGOUT then Result := ''
    else Result := FieldByName('sysid').AsString;
end;

procedure TfrmOrganMng.pagDetailChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  case pagDetail.ActivePageIndex of
    0:
      AllowChange := CheckDBState(Self, True, [OrganInfo], '必须保存您正在编辑' +
        '的基本信息才能继续操作，是否要立即保存并继续?') in CDS_GO;
    1:
      AllowChange := CheckDBState(Self, True, [contact], '必须保存您正在编辑' +
        '的联系方式信息才能继续操作，是否要立即保存并继续?') in CDS_GO;
  end;
end;

procedure TfrmOrganMng.grdCertGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if CertList.FieldByName('state').AsString = OCS_LOGOUT then
    AFont.Color := CL_OCSLOGOUT;
end;

procedure TfrmOrganMng.CertListAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    bbtnChange.Enabled := Fb_ChangeEnabled and
      (FieldByName('state').AsString <> OCS_LOGOUT);
    bbtnExchange.Enabled := Fb_ExchangeEnabled and
      (FieldByName('state').AsString <> OCS_LOGOUT);
    bbtnLogout.Enabled := Fb_LogoutEnabled and
      (FieldByName('state').AsString <> OCS_LOGOUT);
  end;
end;

procedure TfrmOrganMng.prip_RefreshCategoryList(const Ab_NeedRefresh: Boolean);
var
  li_i, li_Category: Integer;
begin
  li_Category := OrganInfo.FieldByName('category').AsInteger;

  with grdContact.Columns[1] do
  begin
    KeyList.Clear;
    PickList.Clear;

    for li_i := Low(CATEGORY_IDS) to High(CATEGORY_IDS) do
      if (li_Category and CATEGORY_IDS[li_i]) = CATEGORY_IDS[li_i] then
      begin
        KeyList.Add(IntToStr(CATEGORY_IDS[li_i]));
        PickList.Add(CATEGORY_NAMES[li_i]);
      end;
  end;

  if (Fi_Category <> 0) and Ab_NeedRefresh then
    if (li_Category and Fi_Category) = 0 then
    begin
      Gp_ProgressHint('正在刷新，请稍候...');
      try
        OrganInfo.Requery;
      finally
        Gp_ProgressHint;
      end;
    end;
end;

procedure TfrmOrganMng.prip_OrganInfoBeforePost;
var
  li_i, li_Category: Integer;
begin
  if not prif_Validate then Abort;

  li_Category := OrganInfo.FieldByName('category').AsInteger;
  for li_i := Low(CATEGORY_IDS) to High(CATEGORY_IDS) do
    if (li_Category and CATEGORY_IDS[li_i]) = 0 then
      with contact do
        while Locate('category', CATEGORY_IDS[li_i], []) do Delete;
end;

procedure TfrmOrganMng.prip_DeleteOrgan;
var
  ls_Id: string;
begin
  if not prif_CheckDelete then Exit;

  ls_Id := OrganInfo.FieldByName('sysid').AsString;

  Gp_ProgressHint('正在删除单位及相关信息，请稍候...');
  dmData.adocon.BeginTrans;
  try
    dmData.adocon.Execute(Format('DELETE FROM device.organ_requirement WHERE ' +
      'EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_requirement.prj_sysid = A.sysid AND EXISTS(' +
      'SELECT * FROM device.organ_cert B WHERE A.cert_sysid = B.sysid ' +
      'AND B.organ_sysid = ''%s''))', [ls_Id]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj_modal ' +
      'WHERE EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_license_product.prj_sysid = A.sysid AND EXISTS(' +
      'SELECT * FROM device.organ_cert B WHERE A.cert_sysid = B.sysid ' +
      'AND B.organ_sysid = ''%s''))', [ls_Id]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj WHERE ' +
      'EXISTS(SELECT * FROM device.organ_cert A WHERE ' +
      'device.organ_cert_prj.cert_sysid = A.sysid AND ' +
      'A.organ_sysid = ''%s'')', [ls_Id]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert WHERE ' +
      'organ_sysid = ''%s''', [ls_Id]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_contact WHERE ' +
      'organ_sysid = ''%s''', [ls_Id]));

    OrganInfo.Delete;
    
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

procedure TfrmOrganMng.prip_OrganDialog(Ac_Sender: TDBComboBoxEh;
  const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng);
begin
  with Ac_Sender do
    try
      prip_SelectOrgan(DataField, Ai_Category, Ac_Requestor);
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmOrganMng.prip_SelectOrgan(const As_Field: string;
  const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng);
var
  ls_PrevVal, ls_CurVal: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
begin
  with Ac_Requestor, Self.OrganInfo do
  begin
    ls_PrevVal := VarToStr(FieldValues[As_Field]);

    lc_Arg := TStringList.Create;
    try
      lc_Arg.Add(ls_PrevVal);
      lc_Arg.Add(IntToStr(Ai_Category));
      lc_Arg.Add(Self.ClassName);
      
      pubp_Ini(True, lc_Arg);
      lc_Rc := ShowModal;
      Self.Update;
    finally
      lc_Arg.Free;
    end;

    if lc_Rc = mrOK then
      if Pos('sysid', As_Field) > 0 then ls_CurVal := CurOrganId
      else ls_CurVal := CurOrganName;

    if (lc_Rc = mrOK) and (ls_PrevVal <> ls_CurVal) then
    begin
      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := ls_CurVal;
    end;
  end;
end;

procedure TfrmOrganMng.cmbChargeComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(cmbChargeCom, 0, TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganMng.cmbAuthComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(cmbAuthCom, 0, TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganMng.cmbLicnsComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(cmbLicnsCom, 0, TfrmOrganMng.Create(nil));
end;

end.
