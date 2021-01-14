unit ufrmDeviceManage;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, DBGridEh, CSDBEhGrdStore, FR_DSet, FR_DBSet, FR_Class,
  CSScrCtrlChild, DB, CSBarMDIChild, PrnDbgeh, CSGrdColCtrl, DBLookupEh,
  CSEhGrdColCtrl, CSADOFilter, CSADOEhGrdFilter, CSDBBase, CSDBFind,
  CSDBEhGrdFind, ADODB, CSADOQuery, CSRowCountPanel, DBCtrls,
  CSDBNavigator, Grids, ExtCtrls, ComCtrls, StdCtrls, Buttons,
  dxmdaset, dxExEdtr, dxEdLib, dxDBELib, DBCtrlsEh, dxCntner, dxEditor,
  CSCustomdxDateEdit, CSdxDBDateEdit, Mask, ufraTechInfoBase, ufrmOrganMng;

const
  CM_REFRESHDEVICEINFO = WM_USER + 500;
  CM_DEVICECODECHANGED = WM_USER + 501;

type
	TfrmDeviceManage = class(TForm)
		Panel1: TPanel;
		List: TCSADOQuery;
		Listd: TDataSource;
		Panel5: TPanel;
		ListFind: TCSDBEhGrdFind;
		ListFilter: TCSADOEhGrdFilter;
		ListColCtrl: TCSEhGrdColCtrl;
		SaveDialog: TSaveDialog;
    PrintGrd: TPrintDBGridEh;
    CSBarMDIChild1: TCSBarMDIChild;
		Panel3: TPanel;
		pagDetail: TPageControl;
		tsBaseInfo: TTabSheet;
		tsTechInfo: TTabSheet;
		tsVerifyInfo: TTabSheet;
		BaseInfo: TCSADOQuery;
		BaseInfod: TDataSource;
		grdVerifyInfo: TDBGridEh;
		VerifyInfo: TCSADOQuery;
		VerifyInfod: TDataSource;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    navVerify: TCSDBNavigator;
    bbtnVerifyColumn: TBitBtn;
    bbtnVerifyFilter: TBitBtn;
    bbtnVerifyFind: TBitBtn;
    VerifyFind: TCSDBEhGrdFind;
    VerifyFilter: TCSADOEhGrdFilter;
    VerifyColCtrl: TCSEhGrdColCtrl;
    VerifyInfosysid: TStringField;
    VerifyInfodev_id: TStringField;
    VerifyInfoaccept_date: TStringField;
    VerifyInfoverify_plan_custom_id: TStringField;
    VerifyInfoverify_start_date: TStringField;
    VerifyInfoverify_end_date: TStringField;
    VerifyInfoinput_date: TStringField;
    VerifyInfofirst_audit_date: TStringField;
    VerifyInfosecond_audit_date: TStringField;
    VerifyInfothird_audit_date: TStringField;
    VerifyInforefit_return_date: TStringField;
    VerifyInfoget_cert_date: TStringField;
    VerifyInforeport_custom_id: TStringField;
    VerifyInforefit_times: TIntegerField;
    scrbBaseInfo: TScrollBox;
    Province: TCSADOQuery;
    City: TCSADOQuery;
    Borough: TCSADOQuery;
    boroughd: TDataSource;
    cityd: TDataSource;
    provinced: TDataSource;
    DeviceCode: TCSADOQuery;
    DeviceCoded: TDataSource;
    grdList: TDBGridEh;
    Panel2: TPanel;
    Panel4: TPanel;
    bbtnListInsert: TBitBtn;
    bbtnListDelete: TBitBtn;
    navList: TCSDBNavigator;
    navInfo: TCSDBNavigator;
    bbtnListFind: TBitBtn;
    bbtnListFilter: TBitBtn;
    bbtnListColumn: TBitBtn;
    spList: TSplitter;
    tsDeviceLog: TTabSheet;
    DeviceLog: TCSADOQuery;
    DeviceLogdevice_id: TStringField;
    DeviceLogdevice_reg_id: TStringField;
    DeviceLogdevice_custom_id: TStringField;
    DeviceLoguser_id: TStringField;
    DeviceLogoperation_type: TStringField;
    DeviceLogoperation_time: TDateTimeField;
    DeviceLogoperation_machine: TStringField;
    DeviceLogoperation_content: TStringField;
    DeviceLogd: TDataSource;
    Panel10: TPanel;
    bbtnLogPrint: TBitBtn;
    Panel11: TPanel;
    grdDeviceLog: TDBGridEh;
    navDeviceLog: TCSDBNavigator;
    VerifyInfonext_verify_date: TStringField;
    BaseInfosysid: TStringField;
    BaseInforeg_id: TStringField;
    BaseInfocustom_id: TStringField;
    BaseInfouse_cert_id: TStringField;
    BaseInfodev_inner_id: TStringField;
    BaseInfodev_kind: TStringField;
    BaseInfodev_code_id: TStringField;
    BaseInfodev_name: TStringField;
    BaseInfouser_id: TStringField;
    BaseInfoinst_id: TStringField;
    BaseInfomanu_id: TStringField;
    BaseInforepair_id: TStringField;
    BaseInfoproperty_id: TStringField;
    BaseInfodesign_id: TStringField;
    BaseInfoverify_id: TStringField;
    BaseInfobuild_id: TStringField;
    BaseInfobuildverify_id: TStringField;
    BaseInfosupervise_id: TStringField;
    BaseInfoverifyorg_id: TStringField;
    BaseInfoprovince_id: TStringField;
    BaseInfocity_id: TStringField;
    BaseInfoborough_id: TStringField;
    BaseInfodev_address: TStringField;
    BaseInfodev_safety_dept: TStringField;
    BaseInfodev_linkman: TStringField;
    BaseInfodev_tel: TStringField;
    BaseInfodev_fax: TStringField;
    BaseInfodev_zip: TStringField;
    BaseInfodev_email: TStringField;
    BaseInfodev_operator: TStringField;
    BaseInforun_date: TStringField;
    BaseInfoupdate_date: TStringField;
    BaseInfostart_date: TStringField;
    BaseInfoend_date: TStringField;
    BaseInfoliber_id: TStringField;
    BaseInforeg_person: TStringField;
    BaseInforeg_date: TStringField;
    BaseInfoproject_manager: TStringField;
    BaseInfoys_report_id: TStringField;
    BaseInfofit_situation: TStringField;
    BaseInfowb_cycle: TStringField;
    BaseInfodx_cycle: TStringField;
    VerifyInfomain_checker: TStringField;
    VerifyInfochecker1: TStringField;
    VerifyInfochecker2: TStringField;
    VerifyInfochecker3: TStringField;
    VerifyInfochecker4: TStringField;
    VerifyInfoverify_type_name: TStringField;
    VerifyInfonext_verify_type_name: TStringField;
    VerifyInfoverify_result_name: TStringField;
    VerifyInfomanual_verify_result_name: TStringField;
    VerifyInfomaster_problem_name: TStringField;
    VerifyInfois_case: TStringField;
    ScrChild: TCSScrCtrlChild;
    BaseInfopressure_rate: TStringField;
    Temp: TCSADOQuery;
    frPrintReg: TfrReport;
    bbtnGenerateId: TBitBtn;
    bbtnExport: TBitBtn;
    bbtnPrint: TBitBtn;
    RegData: TCSADOQuery;
    frPrintRegData: TfrDBDataSet;
    ListEhGrdStore: TCSDBEhGrdStore;
    rcpList: TCSRowCountPanel;
    bbtnReplaceDevice: TBitBtn;
    VerifyEhGrdStore: TCSDBEhGrdStore;
    VerifyInfoinputor: TStringField;
    VerifyInfofirst_auditor: TStringField;
    VerifyInfosecond_auditor: TStringField;
    VerifyInfothird_auditor: TStringField;
    VerifyInforeport_print_date: TStringField;
    VerifyInfocert_begin_date: TStringField;
    VerifyInfocert_end_date: TStringField;
    VerifyInfocert_print_date: TStringField;
    mComInfo: TdxMemData;
    mComInfod: TDataSource;
    mComInfouser_id: TStringField;
    mComInfouser_name: TStringField;
    mComInfoinst_id: TStringField;
    mComInfoinst_name: TStringField;
    mComInfomanu_id: TStringField;
    mComInfomanu_name: TStringField;
    mComInforepair_id: TStringField;
    mComInforepair_name: TStringField;
    mComInfoproperty_id: TStringField;
    mComInfoproperty_name: TStringField;
    mComInfodesign_id: TStringField;
    mComInfodesign_name: TStringField;
    mComInfoverify_id: TStringField;
    mComInfoverify_name: TStringField;
    mComInfobuild_id: TStringField;
    mComInfobuild_name: TStringField;
    mComInfobuildverify_id: TStringField;
    mComInfobuildverify_name: TStringField;
    mComInfosupervise_id: TStringField;
    mComInfosupervise_name: TStringField;
    mComInfoverifyorg_id: TStringField;
    mComInfoverifyorg_name: TStringField;
    mComInfoBak: TdxMemData;
    mComInfoBakuser_id: TStringField;
    mComInfoBakuser_name: TStringField;
    mComInfoBakinst_id: TStringField;
    mComInfoBakinst_name: TStringField;
    mComInfoBakmanu_id: TStringField;
    mComInfoBakmanu_name: TStringField;
    mComInfoBakrepair_id: TStringField;
    mComInfoBakrepair_name: TStringField;
    mComInfoBakproperty_id: TStringField;
    mComInfoBakproperty_name: TStringField;
    mComInfoBakdesign_id: TStringField;
    mComInfoBakdesign_name: TStringField;
    mComInfoBakverify_id: TStringField;
    mComInfoBakverify_name: TStringField;
    mComInfoBakbuild_id: TStringField;
    mComInfoBakbuild_name: TStringField;
    mComInfoBakbuildverify_id: TStringField;
    mComInfoBakbuildverify_name: TStringField;
    mComInfoBaksupervise_id: TStringField;
    mComInfoBaksupervise_name: TStringField;
    mComInfoBakverifyorg_id: TStringField;
    mComInfoBakverifyorg_name: TStringField;
    UserCom: TCSADOQuery;
    UserComd: TDataSource;
    CSRowCountPanel1: TCSRowCountPanel;
    Label1: TLabel;
    labLiberId: TLabel;
    labCustomId: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    labDevInnerId: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label41: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label26: TLabel;
    Label43: TLabel;
    eLiberId: TDBEditEh;
    eCustomId: TDBEditEh;
    lcmbDeviceCode: TDBLookupComboboxEh;
    CSdxDBDateEdit2: TCSdxDBDateEdit;
    CSdxDBDateEdit3: TCSdxDBDateEdit;
    eDevInnerId: TDBEditEh;
    eRegId: TDBEditEh;
    lcmbSuperviseOrg: TDBLookupComboboxEh;
    eRegPerson: TDBEditEh;
    lcmbUserCom: TDBLookupComboboxEh;
    eUserId: TDBEditEh;
    eZip: TDBEditEh;
    eSafetyDept: TDBEditEh;
    eLinkman: TDBEditEh;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    eTel: TDBEditEh;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lcmbDevProvince: TDBLookupComboboxEh;
    lcmbDevCity: TDBLookupComboboxEh;
    lcmbDevBorough: TDBLookupComboboxEh;
    eDevAddress: TDBEditEh;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lcmbUserProvince: TDBLookupComboboxEh;
    lcmbUserCity: TDBLookupComboboxEh;
    lcmbUserBorough: TDBLookupComboboxEh;
    eAddress: TDBEditEh;
    lcmbManuCom: TDBLookupComboboxEh;
    lcmbInstCom: TDBLookupComboboxEh;
    lcmbRepairCom: TDBLookupComboboxEh;
    lcmbDesignCom: TDBLookupComboboxEh;
    lcmbPropertyCom: TDBLookupComboboxEh;
    lcmbVerifyCom: TDBLookupComboboxEh;
    lcmbBuildCom: TDBLookupComboboxEh;
    lcmbBuildVerifyCom: TDBLookupComboboxEh;
    DBEdit12: TDBEditEh;
    DBEdit14: TDBEditEh;
    CSdxDBDateEdit4: TCSdxDBDateEdit;
    CSdxDBDateEdit5: TCSdxDBDateEdit;
    lcmbVerifyOrg: TDBLookupComboboxEh;
    DBEdit10: TDBEditEh;
    DBEdit11: TDBEditEh;
    DBEdit13: TDBEditEh;
    DBEdit9: TDBEditEh;
    labDevName: TLabel;
    eDevName: TDBEditEh;
    labDevKind: TLabel;
    eDevKind: TdxDBPickEdit;
    labPressureRate: TLabel;
    ePressureRate: TdxDBPickEdit;
    labUseCertId: TLabel;
    eUseCertId: TDBEditEh;
    BaseInfostop_date: TStringField;
    BaseInforeject_date: TStringField;
    BaseInforeuse_date: TStringField;
    BaseInfodev_use_id: TStringField;
    Listid: TStringField;
    Listreg_id: TStringField;
    Listuse_cert_id: TStringField;
    Listcustom_id: TStringField;
    Listdev_inner_id: TStringField;
    Listdev_code_id: TStringField;
    Listdev_code: TStringField;
    Listdev_code_name: TStringField;
    Listuser_name: TStringField;
    Listinst_name: TStringField;
    Listmanu_name: TStringField;
    Listrepair_name: TStringField;
    Listproperty_name: TStringField;
    Listprovince_name: TStringField;
    Listcity_name: TStringField;
    Listborough_name: TStringField;
    Listdev_address: TStringField;
    Listdev_state_name: TStringField;
    Listdev_safety_dept: TStringField;
    Listdev_linkman: TStringField;
    Listdev_tel: TStringField;
    Listdev_fax: TStringField;
    Listdev_zip: TStringField;
    Listrun_date: TStringField;
    Listverify_type_name: TStringField;
    Listverify_start_date: TStringField;
    Listnext_verify_date: TStringField;
    Listmanual_verify_result_name: TStringField;
    Label2: TLabel;
    CSdxDBDateEdit6: TCSdxDBDateEdit;
    Label3: TLabel;
    CSdxDBDateEdit7: TCSdxDBDateEdit;
    BaseInfosupdevice_id: TStringField;
    BaseInfosupdevice_custom_id: TStringField;
    BaseInfodev_state: TStringField;
    BaseInfooutflag: TIntegerField;
    DevState: TCSADOQuery;
    DevStated: TDataSource;
    lcmbDevState: TDBLookupComboboxEh;
    Listdev_state: TStringField;
    procedure bbtnListFindClick(Sender: TObject);
    procedure bbtnListFilterClick(Sender: TObject);
    procedure bbtnListColumnClick(Sender: TObject);
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnVerifyFindClick(Sender: TObject);
    procedure bbtnVerifyFilterClick(Sender: TObject);
    procedure bbtnVerifyColumnClick(Sender: TObject);
    procedure bbtnListInsertClick(Sender: TObject);
    procedure ListAfterScroll(DataSet: TDataSet);
    procedure BaseInfoBeforePost(DataSet: TDataSet);
    procedure BaseInfoAfterInsert(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BaseInfoAfterPost(DataSet: TDataSet);
    procedure BaseInfoAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pagDetailChange(Sender: TObject);
    procedure pagDetailChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ListAfterOpen(DataSet: TDataSet);
    procedure BaseInfoBeforeInsert(DataSet: TDataSet);
    procedure BaseInfoBeforeEdit(DataSet: TDataSet);
    procedure bbtnGenerateIdClick(Sender: TObject);
    procedure ListBeforeScroll(DataSet: TDataSet);
    procedure navInfoBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure bbtnPrintClick(Sender: TObject);
    procedure bbtnListDeleteClick(Sender: TObject);
    procedure bbtnReplaceDeviceClick(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure grdListGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbtnLogPrintClick(Sender: TObject);
    procedure BaseInfoAfterScroll(DataSet: TDataSet);
    procedure BaseInfoAfterCancel(DataSet: TDataSet);
    procedure lcmbSuperviseOrgEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbUserComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbManuComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbInstComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbRepairComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbBuildComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbBuildVerifyComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbPropertyComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbVerifyComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbDesignComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbVerifyOrgEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbDevProvinceKeyValueChanged(Sender: TObject);
    procedure lcmbDevCityKeyValueChanged(Sender: TObject);
    procedure lcmbDeviceCodeKeyValueChanged(Sender: TObject);
    procedure lcmbDeviceCodeChange(Sender: TObject);
	private
    Fb_DataModified: Boolean;
    Fc_CurTechInfo: TfraTechInfoBase;
    Fi_ActMode: Integer;
    Fs_PrevDevCode, Fs_PrevDevCodeId, Fs_PrevRegId, Fs_PrevCustomId,
    Fs_InitUserId: string;
    procedure prip_IniData(const Ab_GetList: Boolean = False);
    procedure prip_IniInterface;
    procedure prip_SetInterface(const As_DevCode: string);
    procedure prip_Adjust;
    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_GetUserCom(const As_Id: string);
    procedure prip_GetBaseInfo(const As_Id: string = '');
    procedure prip_GetVerifyInfo(const As_Id: string);
    procedure prip_GetDeviceLog(const As_Id: string);
    procedure prip_CopyUserComInfo;
    procedure prip_AddDevice(const As_InitUserId: string);
    procedure prip_EditDevice(const As_Id: string);
    procedure prip_BrowseDevice;
    procedure prip_CheckDevCode(Ac_lcmbDevCode: TDBLookupComboboxEh);
    procedure prip_GenerateIds;
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_DeleteDevice;
    procedure prip_ReplaceDevice;
    procedure prip_TargetForReplace;
		procedure prip_ExportData;

    procedure prip_RefreshListSource;
    procedure prip_CompanyDialog(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng = nil);
    procedure prip_RefreshCity(Ac_lcmbProvince: TDBLookupComboboxEh;
      const As_ProvinceId: string = '');
    procedure prip_RefreshBorough(Ac_lcmbCity: TDBLookupComboboxEh;
      const As_CityId: string = '');
    procedure prip_RefreshDeviceInfo;
    function prif_GetDevCode(As_ID: string): string;
		function prif_CheckBlank(Ac_DataSet: TDataSet;
      Ac_Fields: array of TField): Boolean;
    function prif_CheckSaved: Boolean;
    function prif_Validate(Ac_DataSet: TDataSet): Boolean;
    function prif_GenerateRegId: string;
    function prif_GenerateCustomId: string;
    function prif_CreateTechInfo: Boolean;
    procedure CMRefreshDeviceInfo(var Msg: TMessage);
      message CM_REFRESHDEVICEINFO;
    procedure CMDeviceCodeChanged(var Msg: TMessage);
      message CM_DEVICECODECHANGED;
	public
    procedure pubp_Ini(Ai_ActMode: Integer; As_Id: string = '');
    property DataModified: Boolean read Fb_DataModified;
	end;

var
  frmDeviceManage: TfrmDeviceManage;

implementation

uses
  StrUtils, DBGridEhImpExp, CSDBUtils, CSVCLUtils, udmData, CommonLib,
  ufrmDevReplaceDlg, ufraLiftInfo, ufraEscalatorInfo, ufraHoistInfo,
  ufraTruckInfo, ufraBoilerInfo, ufraVesselInfo;

{$R *.dfm}

procedure TfrmDeviceManage.pubp_Ini(Ai_ActMode: Integer; As_Id: string);
begin
  ScrChild.SetSecurity(Self);
  try
    Fi_ActMode := Ai_ActMode;
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    case Fi_ActMode of
      AM_DMADDDEVICE: prip_AddDevice(As_Id);
      AM_DMEDITDEVICE: prip_EditDevice(As_Id);
      AM_DMBROWSEDEVICE: prip_BrowseDevice;
    end;
    prip_IniInterface;
    prip_Adjust;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmDeviceManage.prip_ExportData;
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

function TfrmDeviceManage.prif_CreateTechInfo: Boolean;
var
  li_DeviceCode: Integer;
begin
  li_DeviceCode := StrToInt(Copy(DeviceCode.FieldByName('code').AsString,
    1, 3));
  Result := True;
  try
    case li_DeviceCode of
      100..199:
        if Fc_CurTechInfo = nil then
          Fc_CurTechInfo := TfraBoilerInfo.Create(Self)
        else if not Fc_CurTechInfo.ClassNameIs('TfraBoilerInfo') then begin
          Fc_CurTechInfo.Free;
          Fc_CurTechInfo := nil;
          Fc_CurTechInfo := TfraBoilerInfo.Create(Self);
        end;
      200..299:
        if Fc_CurTechInfo = nil then
          Fc_CurTechInfo := TfraVesselInfo.Create(Self)
        else if not Fc_CurTechInfo.ClassNameIs('TfraVesselInfo') then begin
          Fc_CurTechInfo.Free;
          Fc_CurTechInfo := nil;
          Fc_CurTechInfo := TfraVesselInfo.Create(Self);
        end;
      300..399:
        if li_DeviceCode = 302 then
        begin
          if Fc_CurTechInfo = nil then
            Fc_CurTechInfo := TfraEscalatorInfo.Create(Self)
          else if not Fc_CurTechInfo.ClassNameIs('TfraEscalatorInfo') then begin
            Fc_CurTechInfo.Free;
            Fc_CurTechInfo := nil;
            Fc_CurTechInfo := TfraEscalatorInfo.Create(Self);
          end;
        end else begin
          if Fc_CurTechInfo = nil then
            Fc_CurTechInfo := TfraLiftInfo.Create(Self)
          else if not Fc_CurTechInfo.ClassNameIs('TfraLiftInfo') then begin
            Fc_CurTechInfo.Free;
            Fc_CurTechInfo := nil;
            Fc_CurTechInfo := TfraLiftInfo.Create(Self);
          end;
        end;
      400..499:
        if Fc_CurTechInfo = nil then
          Fc_CurTechInfo := TfraHoistInfo.Create(Self)
        else if not Fc_CurTechInfo.ClassNameIs('TfraHoistInfo') then begin
          Fc_CurTechInfo.Free;
          Fc_CurTechInfo := nil;
          Fc_CurTechInfo := TfraHoistInfo.Create(Self);
        end;
      500..599:
        if Fc_CurTechInfo = nil then
          Fc_CurTechInfo := TfraTruckInfo.Create(Self)
        else if not Fc_CurTechInfo.ClassNameIs('TfraTruckInfo') then begin
          Fc_CurTechInfo.Free;
          Fc_CurTechInfo := nil;
          Fc_CurTechInfo := TfraTruckInfo.Create(Self);
        end;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('创建设备技术参数时出错，错误原因：' +
        E.Message), PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmDeviceManage.bbtnListFindClick(Sender: TObject);
begin
	ListFind.FindDlg;
end;

procedure TfrmDeviceManage.bbtnListFilterClick(Sender: TObject);
begin
	ListFilter.FilterDlg;
end;

procedure TfrmDeviceManage.bbtnListColumnClick(Sender: TObject);
begin
	with ListColCtrl do
  begin
    InitColumns;
  	SetupDlg;
  end;
end;

procedure TfrmDeviceManage.bbtnExportClick(Sender: TObject);
begin
  prip_ExportData;
end;

procedure TfrmDeviceManage.bbtnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmDeviceManage.bbtnVerifyFindClick(Sender: TObject);
begin
  VerifyFind.FindDlg;
end;

procedure TfrmDeviceManage.bbtnVerifyFilterClick(Sender: TObject);
begin
  VerifyFilter.FilterDlg;
end;

procedure TfrmDeviceManage.bbtnVerifyColumnClick(Sender: TObject);
begin
  with VerifyColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmDeviceManage.bbtnListInsertClick(Sender: TObject);
begin
  BaseInfo.Append;
end;

procedure TfrmDeviceManage.ListAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    prip_SetInterface(FieldByName('dev_code').AsString);
    prip_GetBaseInfo(FieldByName('id').AsString);
  end;
end;

procedure TfrmDeviceManage.BaseInfoBeforePost(DataSet: TDataSet);
begin
  if not prif_Validate(DataSet) then Abort;
end;

procedure TfrmDeviceManage.prip_CopyUserComInfo;
begin
  with BaseInfo do
    begin
      FieldValues['dev_address'] := UserCom.FieldValues['addr'];
      FieldValues['dev_linkman'] := UserCom.FieldValues['linkman'];
      FieldValues['dev_tel'] := UserCom.FieldValues['tel'];
      FieldValues['dev_fax'] := UserCom.FieldValues['fax'];
      FieldValues['dev_zip'] := UserCom.FieldValues['zip'];
//      FieldValues['dev_email'] := UserCom.FieldValues['email'];
//      FieldValues['dev_safety_dept'] := UserCom.FieldValues['safety_dept'];
      FieldValues['province_id'] := UserCom.FieldValues['province_id'];
      prip_RefreshCity(nil, UserCom.FieldByName('province_id').AsString);
      FieldValues['city_id'] := UserCom.FieldValues['city_id'];
      prip_RefreshBorough(nil, UserCom.FieldByName('city_id').AsString);
      FieldValues['borough_id'] := UserCom.FieldValues['borough_id'];
    end;
end;

procedure TfrmDeviceManage.prip_GetUserCom(const As_Id: string);
begin
  with UserCom do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT TOP 1 a.sysid, a.addr, a.tel, a.fax, a.zip, ' +
      'a.province_id, a.city_id, a.borough_id, b.name AS linkman ' +
      'FROM device.organ_baseinfo a LEFT OUTER JOIN device.organ_contact b ' +
      'ON b.organ_sysid = a.sysid WHERE a.sysid = ''%s''', [As_Id]);
    Open;
  end;
end;

procedure TfrmDeviceManage.prip_SelectCompany(const Ai_Category: Integer;
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
  with lc_Company, BaseInfo do
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
      li_Index := mComInfo.FieldByName(As_Field).Index;
      mComInfo.Edit;
      mComInfo.Fields[li_Index].AsString := CurOrganId;
      mComInfo.Fields[li_Index + 1].AsString := CurOrganName;
      mComInfo.Post;
      if As_Field = 'user_id' then
        prip_GetUserCom(VarToStr(mComInfo.FieldValues['user_id']));

      if IsEmpty then Append else Edit;
      FieldByName(As_Field).AsString := CurOrganId;

      if (State = dsInsert) and (As_Field = 'user_id') then
        prip_CopyUserComInfo;
    end else if DataModified and (As_Field = 'user_id') then UserCom.Requery;
  end;
end;

procedure TfrmDeviceManage.prip_GetVerifyInfo(const As_Id: string);
begin
  with VerifyInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_use_info WHERE ' +
      'dev_id = ''%s''', [As_Id]);
    Open;
  end;
end;

procedure TfrmDeviceManage.prip_GetDeviceLog(const As_Id: string);
begin
  //TODO:设备日志信息
{  with DeviceLog do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.device_log WHERE ' +
      'device_id = ''%s''', [As_Id]);
    Open;
  end;}
end;

procedure TfrmDeviceManage.BaseInfoAfterInsert(DataSet: TDataSet);
begin
  //TODO:BaseInfoAfterInsert
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    if Fs_InitUserId <> '' then
      FieldByName('user_id').AsString := Fs_InitUserId;
//    FieldByName('supervise_id').AsString := 'SOC20030118000000001';
//    FieldByName('province_id').AsString := '320000';
//    FieldByName('city_id').AsString := '320500';
    FieldByName('dev_state').AsString := '01';
  end;
end;

function TfrmDeviceManage.prif_CheckSaved: Boolean;
var
  ls_Msg: string;
begin
  ls_Msg := '正在添加或修改的设备基本信息尚未保存，是否需要保存?';
  Result := CheckDBState(Self, True, [BaseInfo], ls_Msg) in CDS_GO;
  if not Result then Exit;

  if Fc_CurTechInfo <> nil then
  begin
    ls_Msg := '正在添加或修改的设备技术参数尚未保存，是否需要保存?';
    Result := CheckDBState(Self, True, [Fc_CurTechInfo.TechInfo], ls_Msg) in
      CDS_GO;
    if not Result then Exit;
  end;

  ls_Msg := '正在添加或修改的设备检验信息尚未保存，是否需要保存?';
  Result := CheckDBState(Self, True, [VerifyInfo], ls_Msg) in CDS_GO;
  if not Result then Exit;
end;

procedure TfrmDeviceManage.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := prif_CheckSaved;
end;

procedure TfrmDeviceManage.prip_AddDevice(const As_InitUserId: string);
begin
  Fs_InitUserId := As_InitUserId;
  prip_IniData;
  prip_GetBaseInfo;
  BaseInfo.Insert;
  BorderIcons := BorderIcons - [BiMinimize];
  WindowState := wsMaximized;
end;

procedure TfrmDeviceManage.prip_EditDevice(const As_Id: string);
begin
  prip_IniData;
  prip_GetBaseInfo(As_Id);
  BorderIcons := BorderIcons - [BiMinimize];
  WindowState := wsMaximized;
end;

procedure TfrmDeviceManage.prip_BrowseDevice;
begin
  prip_IniData(True);
  FormStyle := fsMDIChild;
  if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
end;

procedure TfrmDeviceManage.prip_GetBaseInfo(const As_Id: string);
begin
  with BaseInfo do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.equipment_info ' +
        'WHERE sysid = ''%s''', [As_Id]);
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmDeviceManage.BaseInfoAfterPost(DataSet: TDataSet);
begin
  mComInfoBak.LoadFromDataSet(mComInfo);
  Fb_DataModified := True;
end;

procedure TfrmDeviceManage.BaseInfoAfterDelete(DataSet: TDataSet);
begin
  Fb_DataModified := True;
end;

procedure TfrmDeviceManage.prip_RefreshCity(
  Ac_lcmbProvince: TDBLookupComboboxEh; const As_ProvinceId: string);
var
  ls_ProvinceId: string;
begin
  if Ac_lcmbProvince = nil then ls_ProvinceId := As_ProvinceId
  else with BaseInfo do if State = dsBrowse then begin
    if FieldByName('province_id').IsNull then ls_ProvinceId := ''
    else ls_ProvinceId := FieldByName('province_id').AsString;
  end else begin
    ls_ProvinceId := VarToStr(Ac_lcmbProvince.Value);
    FieldByName('city_id').Clear;
	end;

  with City do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_ProvinceId]);
    Open;
  end;
end;

procedure TfrmDeviceManage.prip_RefreshBorough(
  Ac_lcmbCity: TDBLookupComboboxEh; const As_CityId: string);
var
  ls_CityId: string;
begin
  if Ac_lcmbCity = nil then ls_CityId := As_CityId
  else with BaseInfo do if State = dsBrowse then begin
    if FieldByName('city_id').IsNull then ls_CityId := ''
    else ls_CityId := FieldByName('city_id').AsString;
  end else begin
  	ls_CityId := VarToStr(Ac_lcmbCity.Value);
    FieldByName('borough_id').Clear;
  end;

  with Borough do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'parent_id = ''%s''', [ls_CityId]);
    Open;
  end;
end;

function TfrmDeviceManage.prif_CheckBlank(Ac_DataSet: TDataSet;
  Ac_Fields: array of TField): Boolean;
var
	li_i: Integer;
begin
	Result := True;
	with Ac_DataSet do
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

procedure TfrmDeviceManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Fc_CurTechInfo <> nil then
  begin
    Fc_CurTechInfo.Free;
    Fc_CurTechInfo := nil;
  end;
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmDeviceManage := nil;
  end else Action := caHide;
end;

procedure TfrmDeviceManage.prip_IniData(const Ab_GetList: Boolean);
begin
  with Province do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code LIKE ''%s''',
      [TOPAREACODE]);
    Open;
  end;

  with City do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code LIKE ''%s''',
      [TOPAREACODE]);
    Open;
  end;

  with Borough do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code LIKE ''%s''',
      [TOPAREACODE]);
    Open;
  end;

  {设备分类代码}
  with DeviceCode do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_device WHERE DATALENGTH(code) = 4 ' +
      'ORDER BY code';
    Open;
  end;

  {设备使用状态代码}
  with DevState do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_dev_state ORDER BY code';
    Open;
  end;

  {设备一览表}
  if Ab_GetList then
    with List do
    begin
      if Active then Close;
      SQL.Text := 'device.usp_getdevicedata';
      Open;
    end;
end;

procedure TfrmDeviceManage.FormCreate(Sender: TObject);
begin
  with ListEhGrdStore do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    RestoreGridLayout;
  end;
  with VerifyEhGrdStore do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    RestoreGridLayout;
  end;

  Fs_PrevRegId := '';
  Fs_PrevCustomId := '';
  Fs_InitUserId := '';
  Fb_DataModified := False;
  Fc_CurTechInfo := nil;
end;

procedure TfrmDeviceManage.pagDetailChange(Sender: TObject);
var
  ls_Id: string;
begin
  ls_Id := BaseInfo.FieldByName('sysid').AsString;
  with (Sender as TPageControl) do
  begin
    case ActivePageIndex of
      0:
        begin
          bbtnGenerateId.Visible := True;
          bbtnExport.Visible := Fi_ActMode = AM_DMBROWSEDEVICE;
          bbtnPrint.Visible := Fi_ActMode = AM_DMBROWSEDEVICE;
          bbtnReplaceDevice.Visible := True;
        end;
      1:
        if prif_CreateTechInfo then
        begin
          Fc_CurTechInfo.pubp_Ini(ls_Id);
          Fc_CurTechInfo.Parent := tsTechInfo;
          ScrChild.SetSecurity(Self);
          bbtnGenerateId.Visible := False;
          bbtnExport.Visible := False;
          bbtnPrint.Visible := False;
          bbtnReplaceDevice.Visible := False;
        end;
      2:
        begin
          prip_GetVerifyInfo(ls_Id);
          bbtnGenerateId.Visible := False;
          bbtnExport.Visible := False;
          bbtnPrint.Visible := False;
          bbtnReplaceDevice.Visible := False;
        end;
      3:
        begin
          prip_GetDeviceLog(ls_Id);
          bbtnGenerateId.Visible := False;
          bbtnExport.Visible := False;
          bbtnPrint.Visible := False;
          bbtnReplaceDevice.Visible := False;
        end;
    end;
  end;
end;

procedure TfrmDeviceManage.pagDetailChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  ls_Msg: string;
begin
  case TPageControl(Sender).ActivePageIndex of
    0:
      begin
        ls_Msg := '正在添加或修改的设备基本信息尚未保存，是否立即保存?';
        AllowChange := CheckDBState(Self, True, [BaseInfo], ls_Msg) in CDS_GO;
        if AllowChange then
          AllowChange := VarToStr(DeviceCode.FieldValues['code']) <> '';
      end;
    1:
      begin
        ls_Msg := '正在添加或修改的设备技术参数尚未保存，是否立即保存?';
        AllowChange := CheckDBState(Self, True, [Fc_CurTechInfo.TechInfo],
          ls_Msg) in CDS_GO;
      end;
    2:
      begin
        ls_Msg := '正在添加或修改的设备检验信息尚未保存，是否立即保存?';
        AllowChange := CheckDBState(Self, True, [VerifyInfo], ls_Msg) in CDS_GO;
      end;
  end;
end;

procedure TfrmDeviceManage.ListAfterOpen(DataSet: TDataSet);
begin
  with DataSet do if IsEmpty then prip_GetBaseInfo;
end;

function TfrmDeviceManage.prif_Validate(Ac_DataSet: TDataSet): Boolean;
var
  ls_RegId, ls_CustomId: string;
begin
  with Ac_DataSet do
    Result := prif_CheckBlank(Ac_DataSet, [FieldByName('reg_id'),
      FieldByName('dev_code_id'), FieldByName('supervise_id'),
      FieldByName('user_id'), FieldByName('verify_id'),
      FieldByName('province_id'), FieldByName('city_id'),
      FieldByName('borough_id'), FieldByName('dev_state')]);

  if not Result then Exit;

  ls_RegId := VarToStr(Ac_DataSet.FieldValues['reg_id']);
  ls_CustomId := VarToStr(Ac_DataSet.FieldValues['custom_id']);

  if ls_RegId <> Fs_PrevRegId then
    with Temp do
    begin
      if Active then Close;
      SQL.Text := Format('SELECT sysid FROM device.equipment_info WHERE ' +
        'reg_id = ''%s''', [ls_RegId]);
      Open;
      if not IsEmpty then
      begin
        Result := False;
        Application.MessageBox('您输入的设备注册代码已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;

  if ls_CustomId <> Fs_PrevCustomId then
    with Temp do
    begin
      if Active then Close;
      SQL.Text := Format('SELECT sysid FROM device.equipment_info WHERE ' +
        'custom_id = ''%s''', [ls_CustomId]);
      Open;
      if not IsEmpty then
      begin
        Result := False;
        Application.MessageBox('您输入的设备流水号已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
      end;
    end;
end;

procedure TfrmDeviceManage.BaseInfoBeforeInsert(DataSet: TDataSet);
begin
  Fs_PrevRegId := '';
  Fs_PrevCustomId := '';
end;

procedure TfrmDeviceManage.BaseInfoBeforeEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Fs_PrevDevCodeId := VarToStr(FieldValues['dev_code_id']);
    Fs_PrevDevCode := prif_GetDevCode(Fs_PrevDevCodeId);
    Fs_PrevRegId := VarToStr(FieldValues['reg_id']);
    Fs_PrevCustomId := VarToStr(FieldValues['custom_id']);
  end;
end;

function TfrmDeviceManage.prif_GenerateRegId: string;
var
  ls_DevCodeId, ls_BoroughId, ls_RegDate, ls_TempId, ls_RegId: string;
begin
  with BaseInfo do
  begin
    ls_DevCodeId := Copy(DeviceCode.FieldByName('code').AsString, 1, 4);
    ls_BoroughId := Borough.FieldByName('code').AsString;
    ls_RegDate := VarToStr(FieldValues['reg_date']);
    if ls_RegDate <> '' then
    begin
      ls_RegDate := StringReplace(ls_RegDate, '-', '', [rfReplaceAll,
        rfIgnoreCase]);
      ls_RegDate := Copy(ls_RegDate, 1, 6);
    end else ls_RegDate := '未注册';
    ls_TempId := ls_DevCodeId + '______' + ls_RegDate;
    ls_RegId := ls_DevCodeId + ls_BoroughId + ls_RegDate;
  end;
  
  with Temp do
  begin
    if Active then Close;
    if ls_RegDate <> '未注册' then
      SQL.Text := Format('SELECT MAX(SUBSTRING(reg_id, 17, 4)) AS reg_id ' +
        'FROM device.equipment_info WHERE reg_id LIKE ''%s%%''', [ls_TempId])
    else
      SQL.Text := Format('SELECT MAX(SUBSTRING(reg_id, 14, 4)) AS reg_id ' +
        'FROM device.equipment_info WHERE reg_id LIKE ''%s%%''', [ls_TempId]);
    Open;
    if VarToStr(FieldValues['reg_id']) = '' then
      Result := ls_RegId + Format('%.4d', [1])
    else Result := ls_RegId + Format('%.4d',
      [StrToInt(RightStr(FieldByName('reg_id').AsString, 4)) + 1]);
  end;
end;

procedure TfrmDeviceManage.bbtnGenerateIdClick(Sender: TObject);
begin
  prip_GenerateIds;
end;

procedure TfrmDeviceManage.ListBeforeScroll(DataSet: TDataSet);
begin
  if not prif_CheckSaved then Abort;
end;

function TfrmDeviceManage.prif_GenerateCustomId: string;
var
  li_DevCode: Integer;
  ls_SQL, ls_CustomIdHead: string;
begin
  li_DevCode := StrToInt(Copy(DeviceCode.FieldByName('code').AsString,
    1, 1));
  case li_DevCode of
    1:
      begin
        ls_CustomIdHead := 'G';
        ls_SQL := 'SELECT MAX(custom_id) AS custom_id FROM device.device_info ' +
          'WHERE custom_id LIKE ''G%'' AND dev_code_id LIKE ''1%''';
      end;
    2:
      begin
        ls_CustomIdHead := 'R';
        ls_SQL := 'SELECT MAX(custom_id) AS custom_id FROM device.device_info ' +
          'WHERE custom_id LIKE ''R%'' AND dev_code_id LIKE ''2%''';
      end;
    3..9:
      begin
        Result := '';
        Exit;
      end;
  end;
  
  with Temp do
  begin
    if Active then Close;
    SQL.Text := ls_SQL;
    Open;
    if VarToStr(FieldValues['custom_id']) = '' then
      Result := ls_CustomIdHead + Format('%.5d', [1])
    else Result := ls_CustomIdHead + Format('%.5d',
      [StrToInt(Copy(FieldByName('custom_id').AsString, 2, 5)) + 1]);
  end;
end;

procedure TfrmDeviceManage.prip_RefreshDeviceInfo;
begin
  //TODO:刷新设备列表
  with List do
  begin
    if Active then Close;
    SQL.Text := 'device.usp_getdevicedata';
    Open;
  end;  
end;

procedure TfrmDeviceManage.navInfoBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbRefresh) and (Fi_ActMode = AM_DMBROWSEDEVICE) then
  begin
    Gp_ProgressHint('正在刷新，请稍候...');
    try
      prip_RefreshDeviceInfo;
    finally
      Gp_ProgressHint;
    end;
    Abort;
  end;
end;

procedure TfrmDeviceManage.bbtnPrintClick(Sender: TObject);
begin
  try
    List.DisableControls;
    BaseInfo.DisableControls;
    with PrintGrd do
    begin
      DBGridEh := grdList;
      Preview;
    end;
  finally
    List.EnableControls;
    BaseInfo.EnableControls;
  end;
end;

procedure TfrmDeviceManage.prip_Adjust;
var
  li_i, li_Bottom, li_MaxBottom, li_Height: Integer;
begin
  li_MaxBottom := 0;
  with scrbBaseInfo do
    for li_i := 0 to ControlCount - 1 do
    begin
      li_Bottom := Controls[li_i].Top + Controls[li_i].Height;
      if li_Bottom > li_MaxBottom then li_MaxBottom := li_Bottom;
    end;
  Inc(li_MaxBottom, 5);
  li_Height := scrbBaseInfo.Height;
  if li_Height > li_MaxBottom then
  begin
    scrbBaseInfo.Align := alNone;
    scrbBaseInfo.Height := li_Height - li_MaxBottom;
    spList.Align := alTop;
    grdList.Align := alTop;
    grdList.Height := grdList.Height + (li_Height - li_MaxBottom);
    grdList.Align := alBottom;
    spList.Align := alBottom;
    scrbBaseInfo.Align := alClient;
  end;
end;

procedure TfrmDeviceManage.prip_IniInterface;
begin
  case Fi_ActMode of
    AM_DMADDDEVICE, AM_DMEDITDEVICE:
      begin
        grdList.Visible := False;
        spList.Visible := False;
        rcpList.Visible := False;
        bbtnListFind.Visible := False;
        bbtnListFilter.Visible := False;
        bbtnListColumn.Visible := False;
        bbtnListInsert.Visible := False;
        bbtnListDelete.Visible := False;
        bbtnExport.Visible := False;
        bbtnPrint.Visible := False;
        bbtnReplaceDevice.Visible := False;
      end;
  end;
end;

procedure TfrmDeviceManage.prip_GenerateIds;
var
  li_DevCode: Integer;
  ls_DevCode: string;
begin
  with BaseInfo do
    if not prif_CheckBlank(BaseInfo, [FieldByName('dev_code_id'),
      FieldByName('borough_id')]) then Exit;

  ls_DevCode := Copy(DeviceCode.FieldByName('code').AsString, 1, 4);

  with BaseInfo do
  begin
    li_DevCode := StrToInt(Copy(DeviceCode.FieldByName('code').AsString, 1, 1));
    if State = dsInsert then
    begin
      FieldByName('reg_id').AsString := prif_GenerateRegId;
      if GENDEVCIDBYARITHMETIC then
        case li_DevCode of
          1: FieldByName('custom_id').AsString := prif_GenerateCustomId;
          2: FieldByName('custom_id').AsString := prif_GenerateCustomId;
          3..9: begin end;
        end;
    end else begin
      if ((Pos('未注册', FieldByName('reg_id').AsString) <> 0) and
        (VarToStr(FieldByName('reg_date').AsString) <> '')) or
        (ls_DevCode <> Copy(FieldByName('reg_id').AsString, 1, 4)) then
      begin
        Edit;
        FieldByName('reg_id').AsString := prif_GenerateRegId;
      end;
      if VarToStr(FieldValues['custom_id']) = '' then
      begin
        Edit;
        if GENDEVCIDBYARITHMETIC then
          case li_DevCode of
            1: FieldByName('custom_id').AsString := prif_GenerateCustomId;
            2: FieldByName('custom_id').AsString := prif_GenerateCustomId;
            3..9: begin end;
          end;
      end;
    end;
  end;
end;

procedure TfrmDeviceManage.prip_CompanyDialog(const Ai_Category: Integer;
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
begin
  with BaseInfod do if (not AutoEdit) and (State = dsBrowse) then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mComInfod;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmDeviceManage.prip_DeleteDevice;
var
  ls_Id, ls_DevCodeId: string;
begin
  with BaseInfo do
  begin
    if (not Active) or IsEmpty then Exit;
    ls_Id := FieldByName('sysid').AsString;
    ls_DevCodeId := Copy(DeviceCode.FieldByName('code').AsString, 1, 1);
  end;

  if Application.MessageBox('警告！删除设备将导致与此设备相关的所有的' +
    '检验信息、报告书、报检派工信息及设备日志全部被删除，请务必确认无' +
    '误后再执行此操作！您确定要删除当前记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then Exit;

  Gp_ProgressHint('正在删除设备，请稍候...');
  try
    dmData.adocon.Execute(Format('device.usp_deletedeviceinfo ''%s'', ''%s''',
      [ls_Id, ls_DevCodeId]));
  finally
    Gp_ProgressHint;
  end;

  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_RefreshDeviceInfo;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmDeviceManage.bbtnListDeleteClick(Sender: TObject);
begin
  prip_DeleteDevice;
end;

procedure TfrmDeviceManage.bbtnReplaceDeviceClick(Sender: TObject);
begin
  prip_ReplaceDevice;
end;

procedure TfrmDeviceManage.prip_ReplaceDevice;
begin
  frmDevReplaceDlg := TfrmDevReplaceDlg.Create(Self);
  frmDevReplaceDlg.pubp_Ini(Self);
end;

procedure TfrmDeviceManage.prip_TargetForReplace;
var
  lc_DataSet: TdxMemData;
begin
  with BaseInfo do
  begin
    if not Active then Exit;
    if State <> dsBrowse then Exit;
  end;
  
  if Assigned(frmDevReplaceDlg) then
  begin
    case frmDevReplaceDlg.rdgSelected.ItemIndex of
      0: lc_DataSet := frmDevReplaceDlg.memSrc;
      1: lc_DataSet := frmDevReplaceDlg.memDest;
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
      FieldValues['id'] := BaseInfo.FieldValues['sysid'];
      FieldValues['reg_id'] := BaseInfo.FieldValues['reg_id'];
      FieldValues['custom_id'] := BaseInfo.FieldValues['custom_id'];
      FieldValues['dev_code_id'] := DeviceCode.FieldValues['code'];
      FieldValues['dev_code_name'] := List.FieldValues['dev_code_name'];
      FieldValues['user_name'] := List.FieldValues['user_name'];
      if List.FindField('dev_type') <> nil then
        FieldValues['dev_type'] := List.FieldValues['dev_type'];
      if List.FindField('manu_no') <> nil then
        FieldValues['manu_no'] := List.FieldValues['manu_no'];
      Post;
    end;
  end;
end;

procedure TfrmDeviceManage.grdListDblClick(Sender: TObject);
begin
  prip_TargetForReplace; 
end;

procedure TfrmDeviceManage.CMRefreshDeviceInfo(var Msg: TMessage);
begin
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_RefreshDeviceInfo;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmDeviceManage.grdListGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  with List do
  begin
    if FieldByName('dev_state').AsString = DS_STOP then
      AFont.Color := CL_DSSTOP;
    if FieldByName('dev_state').AsString = DS_USELESS then
      AFont.Color := CL_DSUSELESS;
  end;
end;

procedure TfrmDeviceManage.bbtnLogPrintClick(Sender: TObject);
begin
  with PrintGrd do
  begin
    DBGridEh := grdDeviceLog;
    Preview;
  end;
end;

procedure TfrmDeviceManage.prip_GetComInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 2 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 3 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 4 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 5 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 6 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 7 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 8 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 9 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 10 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 11 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0], Asa_Ids[1], Asa_Ids[2], Asa_Ids[3], Asa_Ids[4], Asa_Ids[5],
      Asa_Ids[6], Asa_Ids[7], Asa_Ids[8], Asa_Ids[9], Asa_Ids[10]]);
    Open;
    if not mComInfo.IsEmpty then mComInfo.Delete;
    mComInfo.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mComInfo.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mComInfo.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mComInfo.Post;
    if BaseInfo.State <> dsInsert then mComInfoBak.LoadFromDataSet(mComInfo);
    prip_GetUserCom(VarToStr(mComInfo.FieldValues['user_id']));
    Close;
  end;
  prip_RefreshListSource;
end;

procedure TfrmDeviceManage.BaseInfoAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if State <> dsInsert then
      prip_GetComInfo([VarToStr(FieldValues['user_id']),
        VarToStr(FieldValues['inst_id']),
        VarToStr(FieldValues['manu_id']),
        VarToStr(FieldValues['repair_id']),
        VarToStr(FieldValues['property_id']),
        VarToStr(FieldValues['design_id']),
        VarToStr(FieldValues['verify_id']),
        VarToStr(FieldValues['build_id']),
        VarToStr(FieldValues['buildverify_id']),
        VarToStr(FieldValues['supervise_id']),
        VarToStr(FieldValues['verifyorg_id'])]);
//    else prip_RefreshListSource;
  end;
end;

procedure TfrmDeviceManage.prip_RefreshListSource;
begin
  with lcmbUserCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbInstCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbManuCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbRepairCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbPropertyCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbDesignCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbVerifyCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbBuildCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbBuildVerifyCom do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbSuperviseOrg do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbVerifyOrg do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
end;

procedure TfrmDeviceManage.BaseInfoAfterCancel(DataSet: TDataSet);
begin
  with mComInfo do
  begin
    LoadFromDataSet(mComInfoBak);
    prip_GetUserCom(VarToStr(FieldValues['user_id']));
  end;
  prip_RefreshListSource;
end;

procedure TfrmDeviceManage.prip_CheckDevCode(
  Ac_lcmbDevCode: TDBLookupComboboxEh);
var
  li_OldType, li_NewType: Integer;
begin
  if BaseInfo.State <> dsEdit then Exit;
  li_OldType := StrToInt(Copy(Fs_PrevDevCode, 1, 1));
  li_NewType := StrToInt(Copy(DeviceCode.FieldByName('code').AsString, 1, 1));
  PostMessage(Handle, CM_DEVICECODECHANGED, li_OldType, li_NewType);
end;

procedure TfrmDeviceManage.CMDeviceCodeChanged(var Msg: TMessage);
var
  ls_DevCode: string;
begin
  if Msg.WParam <> Msg.LParam then
  begin
    Application.MessageBox('不能改为不同类别的设备', PChar(Self.Caption),
      MB_OK + MB_ICONWARNING);
    BaseInfo.FieldByName('dev_code_id').AsString := Fs_PrevDevCodeId;
  end;
  ls_DevCode := DeviceCode.FieldByName('code').AsString;
  prip_SetInterface(ls_DevCode);
end;

procedure TfrmDeviceManage.lcmbSuperviseOrgEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(SUPERVISOR_SIGN, lcmbSuperviseOrg, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbUserComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(USER_SIGN, lcmbUserCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbManuComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(MANU_SIGN, lcmbManuCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbInstComEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(INST_SIGN, lcmbInstCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbRepairComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(REPAIR_SIGN, lcmbRepairCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbBuildComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(BUILDER_SIGN, lcmbBuildCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbBuildVerifyComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(BUILDVERIFY_SIGN, lcmbBuildVerifyCom,
    TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbVerifyOrgEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(VERIFYACCEPT_SIGN, lcmbVerifyOrg, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbPropertyComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(PROPERTY_SIGN, lcmbPropertyCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbVerifyComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(VERIFY_SIGN, lcmbVerifyCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbDesignComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog(DESIGN_SIGN, lcmbDesignCom, TfrmOrganMng.Create(nil));
end;

procedure TfrmDeviceManage.lcmbDevProvinceKeyValueChanged(Sender: TObject);
begin
  prip_RefreshCity(lcmbDevProvince);
end;

procedure TfrmDeviceManage.lcmbDevCityKeyValueChanged(Sender: TObject);
begin
  prip_RefreshBorough(lcmbDevCity);
end;

procedure TfrmDeviceManage.prip_SetInterface(const As_DevCode: string);
var
  li_DevCode: Integer;
begin
  li_DevCode := StrToInt(Copy(As_DevCode, 1, 1));
  case li_DevCode of
    1:
      begin
        labUseCertId.Visible := True;
        eUseCertId.Visible := True;
        labDevName.Visible := False;
        eDevName.Visible := False;
        labDevKind.Visible := False;
        eDevKind.Visible := False;
        labPressureRate.Visible := False;
        ePressureRate.Visible := False;
      end;
    2:
      begin
        labUseCertId.Visible := True;
        eUseCertId.Visible := True;
        labDevName.Visible := True;
        eDevName.Visible := True;
        labDevKind.Visible := True;
        eDevKind.Visible := True;
        labPressureRate.Visible := True;
        ePressureRate.Visible := True;
      end;
    3..9:
      begin
        labUseCertId.Visible := False;
        eUseCertId.Visible := False;
        labDevName.Visible := False;
        eDevName.Visible := False;
        labDevKind.Visible := False;
        eDevKind.Visible := False;
        labPressureRate.Visible := False;
        ePressureRate.Visible := False;
      end;
  end;
end;

procedure TfrmDeviceManage.lcmbDeviceCodeKeyValueChanged(Sender: TObject);
begin
  prip_CheckDevCode(lcmbDeviceCode);
end;

function TfrmDeviceManage.prif_GetDevCode(As_ID: string): string;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT code FROM device.code_device WHERE id = ''%s''',
      [As_ID]);
    Open;
    Result := VarToStr(FieldValues['code']);
  end;
end;

procedure TfrmDeviceManage.lcmbDeviceCodeChange(Sender: TObject);
begin
  prip_SetInterface(DeviceCode.FieldByName('code').AsString);
end;

end.
