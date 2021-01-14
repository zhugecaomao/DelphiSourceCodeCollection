unit ufrmBeginWorkManageBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DBCtrls, CSDBNavigator, CSdxDBNavigator, FR_DSet,
  FR_DBSet, FR_Class, CSScrCtrlChild, DB, ADODB, CSADOQuery, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, dxEdLib, dxDBELib, DBLookupEh, dxEditor,
  CSCustomdxDateEdit, CSdxDBDateEdit, StdCtrls, Mask, DBCtrlsEh, Buttons,
  ExtCtrls, dxGrClms, ComCtrls, dxDBTLCl, ufrmOrganMng;

type
  TfrmBeginWorkManageBase = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbtnClose: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnConfirm: TBitBtn;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnDeleteConfirm: TBitBtn;
    spList: TSplitter;
    Generald: TDataSource;
    ScrChild: TCSScrCtrlChild;
    Temp: TCSADOQuery;
    DetailDevCode: TCSADOQuery;
    DetailDevCoded: TDataSource;
    bbtnPrint: TBitBtn;
    frBeginWork: TfrReport;
    frDBBeginWork: TfrDBDataSet;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grdDeviceDetail: TdxDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    bbtnAddDeviceDetail: TBitBtn;
    bbtnDeleteDeviceDetail: TBitBtn;
    navDeviceDetail: TCSdxDBNavigator;
    Panel6: TPanel;
    pagGeneralInfo: TPageControl;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    Label3: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    eReportNo: TDBEditEh;
    GroupBox3: TGroupBox;
    mRemark: TdxDBMemo;
    peDevKind: TdxDBPickEdit;
    peConstKind: TdxDBPickEdit;
    TabSheet4: TTabSheet;
    grdPersonDetail: TdxDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    bbtnAddPersonDetail: TBitBtn;
    bbtnDeletePersonDetail: TBitBtn;
    navPersonDetail: TCSdxDBNavigator;
    DeviceDetail: TCSADOQuery;
    DeviceDetaild: TDataSource;
    PersonDetail: TCSADOQuery;
    PersonDetaild: TDataSource;
    BuildDetail: TCSADOQuery;
    BuildDetaild: TDataSource;
    DocDetaild: TDataSource;
    SuprDetail: TCSADOQuery;
    SuprDetaild: TDataSource;
    DocDetail: TCSADOQuery;
    ConstDetail: TCSADOQuery;
    PersonDetailsysid: TStringField;
    PersonDetailstwk_id: TStringField;
    PersonDetailcard_no: TStringField;
    PersonDetailname: TStringField;
    PersonDetailwork_kind: TStringField;
    PersonDetailwork_item: TStringField;
    PersonDetailwork_level: TStringField;
    PersonDetailoutflag: TIntegerField;
    ConstDetaild: TDataSource;
    General: TCSADOQuery;
    Generalsysid: TStringField;
    Generalreport_no: TStringField;
    Generalconst_kind: TStringField;
    Generalappraise_date: TStringField;
    Generalproject_name: TStringField;
    Generalproperty_com: TStringField;
    Generalproperty_address: TStringField;
    Generalproperty_manager: TStringField;
    Generalmanager_tel: TStringField;
    Generalprj_design_com: TStringField;
    Generalcontract_no: TStringField;
    Generalcontract_date: TStringField;
    Generalbuild_project: TStringField;
    Generaldev_num: TIntegerField;
    Generalstart_date: TStringField;
    Generalend_date: TStringField;
    Generalbuild_charge: TBCDField;
    Generaldev_charge: TBCDField;
    Generalconst_com: TStringField;
    Generalconst_address: TStringField;
    Generalconst_reg_no: TStringField;
    Generalconst_deputy: TStringField;
    Generalconst_lics_no: TStringField;
    Generalconst_lics_date: TStringField;
    Generalconst_group: TStringField;
    Generalconst_group_address: TStringField;
    Generalconst_group_tel: TStringField;
    Generalconst_group_fax: TStringField;
    Generalconst_manager: TStringField;
    Generalconst_manager_tel: TStringField;
    Generalconst_instructor: TStringField;
    Generalconst_instructor_tel: TStringField;
    Generalidea_content: TStringField;
    Generalnotice_no: TStringField;
    Generalnotice_date: TStringField;
    Generalremark: TStringField;
    Generaloutflag: TIntegerField;
    TabSheet5: TTabSheet;
    deAppraiseDate: TCSdxDBDateEdit;
    Label5: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    eProjectName: TDBEditEh;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    deContractDate: TCSdxDBDateEdit;
    Label26: TLabel;
    eContractNo: TDBEditEh;
    Label28: TLabel;
    Label35: TLabel;
    Label33: TLabel;
    deStartDate: TCSdxDBDateEdit;
    Label34: TLabel;
    deEndDate: TCSdxDBDateEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label36: TLabel;
    GroupBox4: TGroupBox;
    Label29: TLabel;
    eConstCom: TDBEditEh;
    Label30: TLabel;
    eConstAddress: TDBEditEh;
    Label27: TLabel;
    eConstLicsNo: TDBEditEh;
    Label6: TLabel;
    deConstLicsDate: TCSdxDBDateEdit;
    Label31: TLabel;
    eConstDeputy: TDBEditEh;
    Label32: TLabel;
    eConstRegNo: TDBEditEh;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label24: TLabel;
    eConstManagerTel: TDBEditEh;
    eConstInstructor: TDBEditEh;
    eConstInstructorTel: TDBEditEh;
    eConstManager: TDBEditEh;
    eConstGroupAddress: TDBEditEh;
    eConstGroup: TDBEditEh;
    Label2: TLabel;
    Label17: TLabel;
    eConstGroupTel: TDBEditEh;
    Label23: TLabel;
    eConstGroupFax: TDBEditEh;
    TabSheet6: TTabSheet;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label9: TLabel;
    mIdeaContent: TdxDBMemo;
    deNoticeDate: TCSdxDBDateEdit;
    eNoticeNo: TDBEditEh;
    ePropertyCom: TDBEditEh;
    ePropertyAddress: TDBEditEh;
    ePropertyManager: TDBEditEh;
    eBuildProject: TDBEditEh;
    eDevNum: TDBEditEh;
    eDevCharge: TDBEditEh;
    eBuildCharge: TDBEditEh;
    TabSheet3: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    grdConstDetail: TdxDBGrid;
    grdBuildDetail: TdxDBGrid;
    grdSuprDetail: TdxDBGrid;
    TabSheet9: TTabSheet;
    grdDocDetail: TdxDBGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    bbtnAddConstDetail: TBitBtn;
    bbtnDeleteConstDetail: TBitBtn;
    navConstDetail: TCSdxDBNavigator;
    Panel11: TPanel;
    Panel12: TPanel;
    bbtnAddBuildDetail: TBitBtn;
    bbtnDeleteBuildDetail: TBitBtn;
    navBuildDetail: TCSdxDBNavigator;
    Panel13: TPanel;
    Panel14: TPanel;
    bbtnAddSuprDetail: TBitBtn;
    bbtnDeleteSuprDetail: TBitBtn;
    navSuprDetail: TCSdxDBNavigator;
    Panel15: TPanel;
    Panel16: TPanel;
    bbtnAddDocDetail: TBitBtn;
    bbtnDeleteDocDetail: TBitBtn;
    navDocDetail: TCSdxDBNavigator;
    DeviceDetailsysid: TStringField;
    DeviceDetailstwk_id: TStringField;
    DeviceDetaildev_kind: TStringField;
    DeviceDetaildev_level: TStringField;
    DeviceDetaildev_model: TStringField;
    DeviceDetaildev_name: TStringField;
    DeviceDetaildev_type: TStringField;
    DeviceDetaildev_reg_no: TStringField;
    DeviceDetaildev_inner_no: TStringField;
    DeviceDetaildev_address: TStringField;
    DeviceDetailmanu_no: TStringField;
    DeviceDetailmanu_date: TStringField;
    DeviceDetailmanu_reg_no: TStringField;
    DeviceDetailmanu_name: TStringField;
    DeviceDetailoutflag: TIntegerField;
    BuildDetailsysid: TStringField;
    BuildDetailstwk_id: TStringField;
    BuildDetailreg_no: TStringField;
    BuildDetailcom_name: TStringField;
    BuildDetailitem_name: TStringField;
    BuildDetailoutflag: TIntegerField;
    ConstDetailsysid: TStringField;
    ConstDetailstwk_id: TStringField;
    ConstDetailreg_no: TStringField;
    ConstDetailcom_name: TStringField;
    ConstDetailitem_name: TStringField;
    ConstDetailoutflag: TIntegerField;
    SuprDetailsysid: TStringField;
    SuprDetailstwk_id: TStringField;
    SuprDetailreg_no: TStringField;
    SuprDetailcom_name: TStringField;
    SuprDetailitem_name: TStringField;
    SuprDetailoutflag: TIntegerField;
    DocDetailsysid: TStringField;
    DocDetailstwk_id: TStringField;
    DocDetaildoc_name: TStringField;
    DocDetailpages: TIntegerField;
    DocDetailoutflag: TIntegerField;
    eManagerTel: TDBEditEh;
    ePrjDesignCom: TDBEditEh;
    Generalstate: TIntegerField;
    Generaldev_kind: TStringField;
    DeviceDetaildev_category: TStringField;
    grdDeviceDetaildev_category: TdxDBGridPickColumn;
    grdDeviceDetaildev_level: TdxDBGridPickColumn;
    grdDeviceDetaildev_model: TdxDBGridPickColumn;
    grdDeviceDetaildev_name: TdxDBGridMaskColumn;
    grdDeviceDetaildev_type: TdxDBGridMaskColumn;
    grdDeviceDetaildev_reg_no: TdxDBGridMaskColumn;
    grdDeviceDetaildev_inner_no: TdxDBGridMaskColumn;
    grdDeviceDetaildev_address: TdxDBGridMaskColumn;
    grdDeviceDetailmanu_no: TdxDBGridMaskColumn;
    grdDeviceDetailmanu_date: TdxDBGridMaskColumn;
    grdDeviceDetailmanu_reg_no: TdxDBGridMaskColumn;
    grdDeviceDetailmanu_name: TdxDBGridMaskColumn;
    grdDeviceDetaildev_kind: TdxDBGridMaskColumn;
    grdConstDetailreg_no: TdxDBGridColumn;
    grdConstDetailcom_name: TdxDBGridButtonColumn;
    grdConstDetailitem_name: TdxDBGridColumn;
    grdBuildDetailreg_no: TdxDBGridColumn;
    grdBuildDetailitem_name: TdxDBGridColumn;
    grdBuildDetailcom_name: TdxDBGridButtonColumn;
    grdSuprDetailreg_no: TdxDBGridColumn;
    grdSuprDetailitem_name: TdxDBGridColumn;
    grdSuprDetailcom_name: TdxDBGridButtonColumn;
    grdDocDetaildoc_name: TdxDBGridColumn;
    grdDocDetailpages: TdxDBGridColumn;
    grdPersonDetailname: TdxDBGridColumn;
    grdPersonDetailwork_kind: TdxDBGridColumn;
    grdPersonDetailwork_item: TdxDBGridColumn;
    grdPersonDetailwork_level: TdxDBGridColumn;
    grdPersonDetailcard_no: TdxDBGridButtonColumn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSaveClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure DeviceDetailAfterInsert(DataSet: TDataSet);
    procedure bbtnDeleteDeviceDetailClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnPrintMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure navDeviceDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure bbtnAddDeviceDetailClick(Sender: TObject);
    procedure bbtnDeleteConfirmClick(Sender: TObject);
    procedure GeneraldDataChange(Sender: TObject; Field: TField);
    procedure GeneralAfterInsert(DataSet: TDataSet);
    procedure PersonDetailAfterInsert(DataSet: TDataSet);
    procedure bbtnAddPersonDetailClick(Sender: TObject);
    procedure bbtnDeletePersonDetailClick(Sender: TObject);
    procedure peConstKindChange(Sender: TObject);
    procedure bbtnAddConstDetailClick(Sender: TObject);
    procedure bbtnDeleteConstDetailClick(Sender: TObject);
    procedure bbtnAddBuildDetailClick(Sender: TObject);
    procedure bbtnDeleteBuildDetailClick(Sender: TObject);
    procedure bbtnAddSuprDetailClick(Sender: TObject);
    procedure bbtnDeleteSuprDetailClick(Sender: TObject);
    procedure bbtnAddDocDetailClick(Sender: TObject);
    procedure bbtnDeleteDocDetailClick(Sender: TObject);
    procedure navConstDetailBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure navBuildDetailBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure navSuprDetailBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure navDocDetailBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure peDevKindChange(Sender: TObject);
    procedure DeviceDetailAfterScroll(DataSet: TDataSet);
    procedure grdDeviceDetailChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure BuildDetailAfterInsert(DataSet: TDataSet);
    procedure DocDetailAfterInsert(DataSet: TDataSet);
    procedure SuprDetailAfterInsert(DataSet: TDataSet);
    procedure ConstDetailAfterInsert(DataSet: TDataSet);
    procedure grdDeviceDetaildev_categoryCloseUp(Sender: TObject;
      var Value: Variant; var Accept: Boolean);
    procedure grdDeviceDetaildev_levelCloseUp(Sender: TObject;
      var Value: Variant; var Accept: Boolean);
    procedure DeviceDetailBeforeOpen(DataSet: TDataSet);
    procedure DeviceDetailAfterOpen(DataSet: TDataSet);
    procedure eConstComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ePropertyComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ePrjDesignComEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure eConstGroupEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure grdBuildDetailcom_nameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdSuprDetailcom_nameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdConstDetailcom_nameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdPersonDetailcard_noButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    Fs_CurOrganId, Fs_CurCertId: string;
    Fb_DataModified, Fb_GeneralChanged, Fb_DetailChanged,
    Fb_DisableSetChange, Fb_DisableAfterScroll: Boolean;
    Fs_BWGeneralId, Fs_PrevBWCustomId, Fs_DevKindId, Fs_DevCategoryId, Fs_DevLevelId: string;
    Fe_DeviceDetail: TDataSetNotifyEvent;
    procedure prip_AfterEdit(DataSet: TDataSet);
    procedure prip_GetGeneralData;
    procedure prip_GetDetailData;
    procedure prip_IniData;
    procedure prip_IniInterface(Ai_ActMode: Integer);
    procedure prip_Adjust;
		function prif_CheckBlank(Ac_DataSet: TDataSet;
      Ac_Fields: array of TField): Boolean;
    function prif_Validate: Boolean;
    function prif_CheckSaved: Boolean;
    function prof_GenerateCustomId: string;
    function prif_Save: Boolean;
    function prif_Sameness: Boolean;
    procedure prip_SelectCompany(const Ai_Category: Integer;
      Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectPerson;
    procedure prip_Reset;
    procedure prip_AddGeneral;
    procedure prip_AddDeviceDetail;
    procedure prip_AddPersonDetail;
    procedure prip_AddBuildDetail;
    procedure prip_AddSuprDetail;
    procedure prip_AddDocDetail;
    procedure prip_AddConstDetail;
    procedure prip_DeleteDeviceDetail;
    procedure prip_DeletePersonDetail;
    procedure prip_DeleteBuildDetail;
    procedure prip_DeleteSuprDetail;
    procedure prip_DeleteDocDetail;
    procedure prip_DeleteConstDetail;
    procedure prip_Cancel;
    procedure prip_Confirm;
    procedure prip_PrintReport(Ab_IsDesign: Boolean);
    procedure prip_GetDevKind;
    procedure prip_GetDevCategory;
    procedure prip_GetDevLevel;
    procedure prip_GetDevModel;
    procedure prip_GetConstKind;
    procedure prip_EnableAfterScroll;
    procedure prip_DisableAfterScroll;
  protected
    Rs_BeginWorkReport, Rs_DetailTableName, Rs_CustomIdHead,
    Rs_DevCodeId: string;
    procedure prop_GetTechInfoItems(const As_Section: string;
      Ac_DBGridPickColumn: TdxDBGridPickColumn);
  public
    procedure pubp_Ini(const Ai_ActMode: Integer; Ac_Args: TStrings);
    property DataModified: Boolean read Fb_DataModified;
    property BWGeneralId: string read Fs_BWGeneralId;
  end;

implementation

uses
  StrUtils, IniFiles, CSDBUtils, udmData, Commonlib,
  ufrmPersonMng;

const
  SAVE_STATE = 0;
  CONFIRM_STATE = 1;
    
{$R *.dfm}

{ TfrmBeginWorkManageBase }

procedure TfrmBeginWorkManageBase.prip_AddGeneral;
begin
  with General do
  begin
    Fb_DisableSetChange := True;
    try
      Append;
    finally
      Fb_DisableSetChange := False;
    end;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_Cancel;
begin
  Gp_ProgressHint('正在取消，请稍候...');
  try
    DeviceDetail.CancelBatch;
    PersonDetail.CancelBatch;
    SuprDetail.CancelBatch;
    BuildDetail.CancelBatch;
    ConstDetail.CancelBatch;
    DocDetail.CancelBatch; 
    with General do
    begin
      if State <> dsBrowse then Cancel;
      if IsEmpty then prip_AddGeneral;
    end;
    prip_GetDetailData;
    prip_Reset;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_Confirm;
begin
  if Application.MessageBox('是否真的要执行确认?', PChar(Caption),
    MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;

{  if VarToStr(General.FieldValues['audit_date']) = '' then
  begin
    Application.MessageBox('审核日期不能为空', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    pagGeneralInfo.ActivePageIndex := 1;
    deAuditDate.SetFocus;
    Exit;
  end;}

  if not prif_Save then Exit;

  Gp_ProgressHint('正在执行确认，请稍候...');
  try
    with General do
    begin
      Fb_DisableSetChange := True;
      try
        Edit;
        FieldByName('state').AsInteger := CONFIRM_STATE;
        Post;
      finally
        Fb_DisableSetChange := False;
      end;
      Fb_DataModified := True;
    end;
    Gp_ProgressHint;
    Close;
  except
    on E: Exception do
    begin
      Gp_ProgressHint;
      Application.MessageBox(PChar('执行确认时出错，错误原因：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_GetDetailData;
begin
  with DeviceDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_device ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;

  with PersonDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_person ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;

  with BuildDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_build ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;

  with DocDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_doc ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;

  with SuprDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_supr ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;

  with ConstDetail do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_const ' +
      'WHERE stwk_id = ''%s''', [Fs_BWGeneralId]);
    Open;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_GetGeneralData;
begin
  with General do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_report WHERE ' +
      'sysid = ''%s''', [Fs_BWGeneralId]);
    Open;
    if not IsEmpty then
    begin
      Fs_PrevBWCustomId := VarToStr(FieldValues['report_no']);
    end;
  end;
end;

function TfrmBeginWorkManageBase.prif_Save: Boolean;
var
  lb_DetailUpdated: Boolean;
begin
  Result := False;
  
  if not prif_Validate then Exit;
  
  lb_DetailUpdated := False;
  Gp_ProgressHint('正在保存数据，请稍候...');
  dmData.adocon.BeginTrans;
  try
    with General do
    begin
      Fb_DisableSetChange := True;
      try
        Edit;
        FieldByName('state').AsInteger := SAVE_STATE;
        Fb_DataModified := True;
        if State <> dsBrowse then Post;
      finally
        Fb_DisableSetChange := False;
      end;
    end;

    with DeviceDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with PersonDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with BuildDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with ConstDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with DocDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with SuprDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    dmData.adocon.CommitTrans;

    Fb_GeneralChanged := False;
    Fb_DetailChanged := False;
    bbtnSave.Enabled := False;
    bbtnCancel.Enabled := False;

    Result := True;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      try
        with General do
        begin
          if State = dsBrowse then Requery;
          if IsEmpty then prip_AddGeneral;
        end;
        if lb_DetailUpdated then prip_GetDetailData;
      except
      end;
      Application.MessageBox(PChar('执行保存时出错，错误原因：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
  Gp_ProgressHint;
end;

procedure TfrmBeginWorkManageBase.pubp_Ini(const Ai_ActMode: Integer;
  Ac_Args: TStrings);
begin
  ScrChild.SetSecurity(Self);
  Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
  try
    if Ac_Args.Count > 0 then
    begin
      Fs_BWGeneralId := Ac_Args.Strings[0];
    end;

    prip_IniData;
    if Ai_ActMode = AM_VMADDREPORT then prip_AddGeneral;

    General.AfterEdit := prip_AfterEdit;
    with DeviceDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    with PersonDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    with BuildDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    with DocDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    with ConstDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    with SuprDetail do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;

    prip_IniInterface(Ai_ActMode);

    BorderIcons := BorderIcons -[biMinimize];
    Position := poScreenCenter;
    WindowState := wsMaximized;
    prip_Adjust;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmBeginWorkManageBase.FormCreate(Sender: TObject);
begin
  Fb_DataModified := False;
  Fb_GeneralChanged := False;
  Fb_DetailChanged := False;
  Fb_DisableSetChange := False;
  Fs_BWGeneralId := '';
  Fs_PrevBWCustomId := '';
  Fs_CurOrganId := '';
  Fs_CurCertId := '';
end;

procedure TfrmBeginWorkManageBase.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBeginWorkManageBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmBeginWorkManageBase.bbtnSaveClick(Sender: TObject);
begin
  prif_Save;
end;

procedure TfrmBeginWorkManageBase.bbtnCancelClick(Sender: TObject);
begin
  prip_Cancel;
end;

procedure TfrmBeginWorkManageBase.bbtnConfirmClick(Sender: TObject);
begin
  prip_Confirm;
end;

procedure TfrmBeginWorkManageBase.prip_AddDeviceDetail;
begin
  with General do
  begin
    if VarToStr(FieldValues['dev_kind']) = '' then
    begin
      Application.MessageBox('开工告知基本信息的设备种类未输入', PChar(Caption),
        MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    if not IsEmpty then DeviceDetail.Append;
  end;
end;

procedure TfrmBeginWorkManageBase.DeviceDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
    FieldByName('dev_kind').AsString := peDevKind.Text;
  end;
  prip_AfterEdit(DataSet);   
end;

procedure TfrmBeginWorkManageBase.PersonDetailAfterInsert(
  DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmBeginWorkManageBase.prip_IniInterface(Ai_ActMode: Integer);
var
  li_GeneralState: Integer;
  procedure SetReadOnly;
  begin
    eReportNo.Enabled := False;
    peDevKind.Enabled := False;
    peConstKind.Enabled := False;
    deAppraiseDate.Enabled := False;
    eProjectName.Enabled := False;
    ePropertyCom.Enabled := False;
    ePropertyAddress.Enabled := False;
    ePropertyManager.Enabled := False;
    eManagerTel.Enabled := False;
    ePrjDesignCom.Enabled := False;
    eContractNo.Enabled := False;
    eBuildProject.Enabled := False;
    deContractDate.Enabled := False;
    eDevNum.Enabled := False;
    deStartDate.Enabled := False;
    deEndDate.Enabled := False;
    eBuildCharge.Enabled := False;
    eDevCharge.Enabled := False;
    mRemark.Enabled := False;
    eConstCom.Enabled := False;
    eConstAddress.Enabled := False;
    eConstRegNo.Enabled := False;
    eConstDeputy.Enabled := False;
    eConstLicsNo.Enabled := False;
    deConstLicsDate.Enabled := False;
    eConstGroup.Enabled := False;
    eConstGroupAddress.Enabled := False;
    eConstManager.Enabled := False;
    eConstManagerTel.Enabled := False;
    eConstGroupTel.Enabled := False;
    eConstGroupFax.Enabled := False;
    eConstInstructor.Enabled := False;
    eConstInstructorTel.Enabled := False;
    mIdeaContent.Enabled := False;
    eNoticeNo.Enabled := False;
    deNoticeDate.Enabled := False;

    bbtnAddDeviceDetail.Enabled := False;
    bbtnDeleteDeviceDetail.Enabled := False;
    navDeviceDetail.Enabled := False;
    bbtnAddPersonDetail.Enabled := False;
    bbtnDeletePersonDetail.Enabled := False;
    navPersonDetail.Enabled := False;
    bbtnAddBuildDetail.Enabled := False;
    bbtnDeleteBuildDetail.Enabled := False;
    navBuildDetail.Enabled := False;
    bbtnAddDocDetail.Enabled := False;
    bbtnDeleteDocDetail.Enabled := False;
    navDocDetail.Enabled := False;
    bbtnAddConstDetail.Enabled := False;
    bbtnDeleteConstDetail.Enabled := False;
    navConstDetail.Enabled := False;
    bbtnAddSuprDetail.Enabled := False;
    bbtnDeleteSuprDetail.Enabled := False;
    navSuprDetail.Enabled := False;
    bbtnSave.Enabled := False;
    bbtnCancel.Enabled := False;
    bbtnConfirm.Enabled := False;
    with grdDeviceDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
    with grdPersonDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
    with grdBuildDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
    with grdDocDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
    with grdSuprDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
    with grdConstDetail do OptionsBehavior := OptionsBehavior - [edgoEditing];
  end;
  
begin
  case Ai_ActMode of
    AM_VMADDREPORT, AM_VMEDITREPORT:
      begin
        bbtnDeleteConfirm.Visible := False;
        bbtnPrint.Left := bbtnConfirm.Left + bbtnConfirm.Width + 2;

        if Ai_ActMode = AM_VMEDITREPORT then
        begin
          li_GeneralState := General.FieldByName('state').AsInteger;
          if li_GeneralState = CONFIRM_STATE then SetReadOnly;
        end;
      end;
    AM_VMDELETEREPORT: SetReadOnly;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_DeleteDeviceDetail;
begin
  with DeviceDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteDeviceDetailClick(Sender: TObject);
begin
  prip_DeleteDeviceDetail;
end;

function TfrmBeginWorkManageBase.prif_CheckBlank(Ac_DataSet: TDataSet;
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

function TfrmBeginWorkManageBase.prif_Validate: Boolean;
var
  ls_BWCustomId: string;
begin
  with General do
  begin
    Result := prif_CheckBlank(General, [FieldByName('report_no'),FieldByName('dev_kind'),
                FieldByName('const_kind'),FieldByName('appraise_date'),
                FieldByName('project_name'),FieldByName('property_com'),
                FieldByName('property_address'),FieldByName('property_manager'),
                FieldByName('manager_tel'),FieldByName('prj_design_com'),
                FieldByName('build_project'),FieldByName('dev_num'),
                FieldByName('start_date'),FieldByName('end_date'),
                FieldByName('build_charge'),FieldByName('dev_charge'),
                FieldByName('const_com'),FieldByName('const_address'),
                FieldByName('const_reg_no'),FieldByName('const_deputy'),
                FieldByName('const_lics_no'),FieldByName('const_lics_date')]);
    if not Result then Exit;
    
    if FieldByName('end_date').AsString <=
      FieldByName('start_date').AsString then
    begin
      Result := False;
      Application.MessageBox('竣工日期不能早于开工日期。', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      Exit;
    end;
    
    if DeviceDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告拟安装设备基本情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if PersonDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告安装人员基本情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if BuildDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告工程施工单位基本情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if DocDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告文件资料基本情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if ConstDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告施工分包基本情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if SuprDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入开工报告土建工程监理或验收单位情况，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    ls_BWCustomId := VarToStr(FieldValues['report_no']);
    if ls_BWCustomId <> Fs_PrevBWCustomId then
    begin
      if Temp.Active then Temp.Close;
      Temp.SQL.Text := Format('SELECT sysid FROM device.equipment_stwk_report ' +
        'WHERE report_no = ''%s''', [ls_BWCustomId]);
      Temp.Open;
      if not Temp.IsEmpty then
      begin
        Result := False;
        eReportNo.SetFocus;
        Application.MessageBox('您输入的审批编号已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
      end;
    end;
  end;
end;

function TfrmBeginWorkManageBase.prif_CheckSaved: Boolean;
var
  li_Result: Integer;
  lc_PrevActive: TWinControl;
begin
  Result := True;

  if ActiveControl <> bbtnClose then
  begin
    lc_PrevActive := ActiveControl;
    ActiveControl := bbtnClose;
    ActiveControl := lc_PrevActive;
  end;
  
  if Fb_GeneralChanged or Fb_DetailChanged then
  begin
    li_Result := Application.MessageBox('数据尚未保存，是否要保存数据?',
      PChar(Caption), MB_YESNOCANCEL + MB_ICONQUESTION);
    case li_Result of
      IDYES: Result := prif_Save;
      IDNO:
        begin
          DeviceDetail.CancelBatch;
          PersonDetail.CancelBatch;
          BuildDetail.CancelBatch;
          DocDetail.CancelBatch;
          ConstDetail.CancelBatch;
          SuprDetail.CancelBatch;
          General.Cancel;
          Result := True;
        end;
      IDCANCEL: Result := False;
    end;
  end;
end;

procedure TfrmBeginWorkManageBase.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := prif_CheckSaved;
end;

procedure TfrmBeginWorkManageBase.prip_PrintReport(
  Ab_IsDesign: Boolean);
//var
//  ls_WorkReportReport: string;
//  lc_Bookmark: TBookmarkStr;
begin
{  ls_WorkReportReport := Gs_AppPath + REPORTS_PATH + Rs_BeginWorkReport;

  Detail.DisableControls;
  lc_Bookmark := Detail.Bookmark;
  try
    Detail.First;
    with frBeginWork do
    begin
      LoadFromFile(ls_WorkReportReport);
      if Ab_IsDesign then DesignReport else ShowReport;
    end;
  finally
    try
      Detail.GotoBookmark(Pointer(lc_Bookmark));
    except
    end;
    Detail.EnableControls;
  end;}
end;

procedure TfrmBeginWorkManageBase.bbtnPrintMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  prip_PrintReport(Shift = [ssShift, ssCtrl, ssAlt]);
end;

procedure TfrmBeginWorkManageBase.navDeviceDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    prip_GetDetailData;
    Abort;
  end;
end;

function TfrmBeginWorkManageBase.prof_GenerateCustomId: string;
var
  ls_CustomIdHead: string;
begin
  ls_CustomIdHead := Rs_CustomIdHead + FormatDateTime('yyyymm', Now);
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT MAX(report_no) AS report_no FROM ' +
      'device.equipment_stwk_report WHERE report_no LIKE ''%s%%''',
      [ls_CustomIdHead]);
    Open;
    if VarToStr(FieldValues['report_no']) = '' then
      Result := ls_CustomIdHead + Format('%.5d', [1])
    else Result := ls_CustomIdHead + Format('%.5d',
      [StrToInt(RightStr(FieldByName('report_no').AsString, 5)) + 1]);
    Close;
  end;
end;

procedure TfrmBeginWorkManageBase.prop_GetTechInfoItems(
  const As_Section: string; Ac_DBGridPickColumn: TdxDBGridPickColumn);
var
  ls_IniFile: string;
  lc_IniFile: TIniFile;
begin
  ls_IniFile := Gs_AppPath + TECHINFO_NAME;
  lc_IniFile := TIniFile.Create(ls_IniFile);
  try
    lc_IniFile.ReadSection(As_Section, Ac_DBGridPickColumn.Items);
  finally
    lc_IniFile.Free;
  end;
end;

procedure TfrmBeginWorkManageBase.bbtnAddDeviceDetailClick(Sender: TObject);
begin
  prip_AddDeviceDetail;
end;

procedure TfrmBeginWorkManageBase.prip_IniData;
begin
  prip_GetDevKind;
  prip_GetConstKind;  
  prip_GetGeneralData;
  prip_GetDetailData;
  if not (General.FieldByName('dev_kind').AsString = '') then
    prip_GetDevCategory;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteConfirmClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmBeginWorkManageBase.prip_Reset;
begin
  Fb_GeneralChanged := False;
  Fb_DetailChanged := False;
  bbtnSave.Enabled := False;
  bbtnCancel.Enabled := False;
end;

procedure TfrmBeginWorkManageBase.prip_AfterEdit(DataSet: TDataSet);
begin
  if Fb_DisableSetChange then Exit;

  if DataSet = General then Fb_GeneralChanged := True;
  if DataSet = DeviceDetail then Fb_DetailChanged := True;
  if DataSet = BuildDetail then Fb_DetailChanged := True;
  if DataSet = ConstDetail then Fb_DetailChanged := True;
  if DataSet = DocDetail then Fb_DetailChanged := True;
  if DataSet = SuprDetail then Fb_DetailChanged := True;
  if not bbtnSave.Enabled then bbtnSave.Enabled := True;
  if not bbtnCancel.Enabled then bbtnCancel.Enabled := True;
end;

procedure TfrmBeginWorkManageBase.GeneraldDataChange(Sender: TObject;
  Field: TField);
begin
  if Field <> nil then prip_AfterEdit(General);
end;

procedure TfrmBeginWorkManageBase.prip_Adjust;
//var
//  li_i, li_Bottom, li_MaxBottom, li_Height: Integer;
begin
{  li_MaxBottom := 0;
  with scrbGeneral do
    for li_i := 0 to ControlCount - 1 do
    begin
      li_Bottom := Controls[li_i].Top + Controls[li_i].Height;
      if li_Bottom > li_MaxBottom then li_MaxBottom := li_Bottom;
    end;
  Inc(li_MaxBottom, 5);
  li_Height := scrbGeneral.Height;
  if li_Height > li_MaxBottom then
  begin
    scrbGeneral.Align := alNone;
    scrbGeneral.Height := li_Height - li_MaxBottom;
    spList.Align := alTop;
    scrbDetail.Align := alTop;
    scrbDetail.Height := scrbDetail.Height + (li_Height - li_MaxBottom);
    scrbDetail.Align := alBottom;
    spList.Align := alBottom;
    scrbGeneral.Align := alClient;
  end;}
end;

procedure TfrmBeginWorkManageBase.GeneralAfterInsert(DataSet: TDataSet);
begin
  Fs_BWGeneralId := Gf_GenSysId;
  with DataSet do
  begin
    FieldByName('sysid').AsString := BWGeneralId;
    FieldByName('report_no').AsString := prof_GenerateCustomId;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_AddPersonDetail;
begin
  with General do if not IsEmpty then PersonDetail.Append;
end;

procedure TfrmBeginWorkManageBase.prip_DeletePersonDetail;
begin
  with PersonDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.bbtnAddPersonDetailClick(
  Sender: TObject);
begin
  prip_AddPersonDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnDeletePersonDetailClick(
  Sender: TObject);
begin
  prip_DeletePersonDetail
end;

procedure TfrmBeginWorkManageBase.peConstKindChange(Sender: TObject);
begin
//  prip_GetDevKindData(peReportKind.Text);
end;

procedure TfrmBeginWorkManageBase.prip_SelectPerson;
var
  ls_PrevPersonId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Person: TfrmPersonMng;
begin
  ls_PrevPersonId := '';
  lc_Person := TfrmPersonMng.Create(nil);

  try
    with PersonDetail do
    begin
      lc_Arg := TStringList.Create;
      lc_Arg.Add(ls_PrevPersonId);
      try
        lc_Person.pubp_ini(True, lc_Arg);
        lc_Rc := lc_Person.ShowModal;
        Self.Update;
      finally
        lc_Arg.Free;
      end;

      if lc_Rc = mrOK then
      begin
        Edit;
        FieldValues['card_no'] := lc_Person.PersonInfo.FieldValues['cardid'];
        FieldValues['name'] := lc_Person.PersonInfo.FieldValues['name'];
        FieldValues['work_kind'] :=
          lc_Person.licenselist.FieldValues['licns_category_name'];
        FieldValues['work_item'] :=
          lc_Person.licnsprjlist.FieldValues['psnlicns_prjname'];
        FieldValues['work_level'] :=
          lc_Person.licnsprjlist.FieldValues['psnlicns_levelcode_name'];
      end;
    end;
  finally
    if lc_Person <> nil then lc_Person.Free;
  end;
end;

procedure TfrmBeginWorkManageBase.bbtnAddConstDetailClick(Sender: TObject);
begin
  prip_AddConstDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteConstDetailClick(
  Sender: TObject);
begin
  prip_DeleteConstDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnAddBuildDetailClick(Sender: TObject);
begin
  prip_AddBuildDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteBuildDetailClick(
  Sender: TObject);
begin
  prip_DeleteBuildDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnAddSuprDetailClick(Sender: TObject);
begin
  prip_AddSuprDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteSuprDetailClick(
  Sender: TObject);
begin
  prip_DeleteSuprDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnAddDocDetailClick(Sender: TObject);
begin
  prip_AddDocDetail;
end;

procedure TfrmBeginWorkManageBase.bbtnDeleteDocDetailClick(
  Sender: TObject);
begin
  prip_DeleteDocDetail;
end;

procedure TfrmBeginWorkManageBase.prip_AddBuildDetail;
begin
  with General do if not IsEmpty then BuildDetail.Append;
end;

procedure TfrmBeginWorkManageBase.prip_AddConstDetail;
begin
  with General do if not IsEmpty then ConstDetail.Append;
end;

procedure TfrmBeginWorkManageBase.prip_AddDocDetail;
begin
  with General do if not IsEmpty then DocDetail.Append;
end;

procedure TfrmBeginWorkManageBase.prip_AddSuprDetail;
begin
  with General do if not IsEmpty then SuprDetail.Append;
end;

procedure TfrmBeginWorkManageBase.prip_DeleteBuildDetail;
begin
  with BuildDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.prip_DeleteConstDetail;
begin
  with ConstDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.prip_DeleteDocDetail;
begin
  with DocDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.prip_DeleteSuprDetail;
begin
  with SuprDetail do if not IsEmpty then Delete;
end;

procedure TfrmBeginWorkManageBase.navConstDetailBeforeAction(
  Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    prip_GetDetailData;
    Abort;
  end;
end;

procedure TfrmBeginWorkManageBase.navBuildDetailBeforeAction(
  Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    prip_GetDetailData;
    Abort;
  end;
end;

procedure TfrmBeginWorkManageBase.navSuprDetailBeforeAction(
  Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    prip_GetDetailData;
    Abort;
  end;
end;

procedure TfrmBeginWorkManageBase.navDocDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    prip_GetDetailData;
    Abort;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_GetDevKind;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := 'SELECT name FROM device.code_cert_device ' +
      'WHERE code_level = 2 ORDER BY id';
    Open;

    peDevKind.Items.Clear;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        peDevKind.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_GetConstKind;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := 'SELECT name FROM device.code_stwk_kind ORDER BY code';
    Open;

    peConstKind.Items.Clear;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        peConstKind.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TfrmBeginWorkManageBase.prip_GetDevCategory;
var
  ls_DevKind: string;
begin
  Fb_DisableAfterScroll := True;

  ls_DevKind := peDevKind.Text;
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT id,name FROM device.code_cert_device ' +
      'WHERE code_level = 2 AND name = ''%s''', [ls_DevKind]);
    Open;
    Fs_DevKindId :=FieldByName('id').AsString;
  end;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT name FROM device.code_cert_device ' +
      'WHERE code_level = 3 AND parent_id = ''%s''', [Fs_DevKindId]);
    Open;

    grdDeviceDetaildev_category.Items.Clear;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        grdDeviceDetaildev_category.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;
  
  Fb_DisableAfterScroll := False;
end;

procedure TfrmBeginWorkManageBase.prip_GetDevLevel;
begin
  Fb_DisableAfterScroll := True;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT id, name FROM device.code_cert_device ' +
      'WHERE code_level = 3 AND name = ''%s'' AND parent_id = ''%s''',
      [grdDeviceDetaildev_category.Field.AsString, Fs_DevKindId]);
    Open;
    Fs_DevCategoryId := FieldByName('id').AsString;
  end;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT name FROM device.code_cert_device ' +
      'WHERE code_level = 4 AND parent_id = ''%s''', [Fs_DevCategoryId]);
    Open;

    grdDeviceDetaildev_level.Items.Clear;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        grdDeviceDetaildev_level.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;

  Fb_DisableAfterScroll := False;
end;

procedure TfrmBeginWorkManageBase.prip_GetDevModel;
begin
  Fb_DisableAfterScroll := True;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT id, name FROM device.code_cert_device ' +
      'WHERE code_level = 4 AND name = ''%s'' AND parent_id= ''%s''',
      [grdDeviceDetaildev_level.Field.AsString, Fs_DevCategoryId]);
    Open;
    Fs_DevLevelId := FieldByName('id').AsString;
  end;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT name FROM device.code_cert_device ' +
      'WHERE code_level = 5 AND parent_id= ''%s''', [Fs_DevLevelId]);
    Open;

    grdDeviceDetaildev_model.Items.Clear;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        grdDeviceDetaildev_model.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;

  Fb_DisableAfterScroll := False;
end;

procedure TfrmBeginWorkManageBase.peDevKindChange(Sender: TObject);
begin
//  ShowMessage('peDevKindChange');
  prip_GetDevCategory;
end;

procedure TfrmBeginWorkManageBase.DeviceDetailAfterScroll(
  DataSet: TDataSet);
begin
//  ShowMessage('DeviceDetailAfterScroll');
  if Fb_DisableAfterScroll then Exit;  
  prip_GetDevCategory;
  prip_GetDevLevel;
  prip_GetDevModel;
end;

procedure TfrmBeginWorkManageBase.grdDeviceDetailChangeColumn(
  Sender: TObject; Node: TdxTreeListNode; Column: Integer);
begin
//  ShowMessage('grdDeviceDetailChangeColumn');
  case Column of
    2: prip_GetDevLevel;
    3: prip_GetDevModel;
  end;
end;

procedure TfrmBeginWorkManageBase.BuildDetailAfterInsert(
  DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmBeginWorkManageBase.DocDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmBeginWorkManageBase.SuprDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmBeginWorkManageBase.ConstDetailAfterInsert(
  DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('stwk_id').AsString := Fs_BWGeneralId;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmBeginWorkManageBase.grdDeviceDetaildev_categoryCloseUp(
  Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  if prif_Sameness then
  begin
    with DeviceDetail do
    begin
      Edit;
      FieldByName('dev_level').Clear;
      FieldByName('dev_model').Clear;
    end;
  end;
end;

function TfrmBeginWorkManageBase.prif_Sameness: Boolean;
begin
  Result := True;
{  with Temp do
  begin
    if Active then Close;
    //todo 请修改这里的GETDISPLAY函数
    SQL.Text := 'SELECT id,name FROM device.code_cert_device WHERE code_level = 3 AND name = ''' +
                grdDeviceDetaildev_category.GetDisplayValue(grdDeviceDetail.FocusedNode,'dev_category') + ''' AND parent_id=''' +
                Fs_DevKindId + ''' ORDER BY id';
    Open;
    if Fs_DevCategoryId =FieldByName('id').AsString then Result := False else Result := True;
  end;}
end;

procedure TfrmBeginWorkManageBase.grdDeviceDetaildev_levelCloseUp(
  Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  with DeviceDetail do
  begin
    Edit;
    FieldByName('dev_model').Clear;
  end;
end;

procedure TfrmBeginWorkManageBase.DeviceDetailBeforeOpen(
  DataSet: TDataSet);
begin
  prip_DisableAfterScroll;
end;

procedure TfrmBeginWorkManageBase.DeviceDetailAfterOpen(DataSet: TDataSet);
begin
  prip_EnableAfterScroll;
end;

procedure TfrmBeginWorkManageBase.prip_DisableAfterScroll;
begin
  Fe_DeviceDetail := DeviceDetail.AfterScroll;
  DeviceDetail.AfterScroll := nil;
end;

procedure TfrmBeginWorkManageBase.prip_EnableAfterScroll;
begin
  DeviceDetail.AfterScroll := Fe_DeviceDetail;
end;

procedure TfrmBeginWorkManageBase.prip_SelectCompany(
  const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng);
var
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company do
  begin
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

    if lc_Rc = mrOK then
    begin
      Fs_CurOrganId := CurOrganId;
      Fs_CurCertId := CurCertId;
    end;
  end;
end;

procedure TfrmBeginWorkManageBase.eConstComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  lc_Organ: TfrmOrganMng;
begin
  with Generald do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(INST_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        General.Edit;
        General.FieldValues['const_com'] := FieldValues['name'];
        General.FieldValues['const_reg_no'] := FieldValues['regno'];
        General.FieldValues['const_address'] := FieldValues['addr'];
        General.FieldValues['const_deputy'] := FieldValues['legalperson'];
        Close;
      end;
    end;
    if Fs_CurCertId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_cert ' +
          'WHERE sysid= ''%s''', [Fs_CurCertId]);
        Open;
        General.Edit;
        General.FieldValues['const_lics_no'] := FieldValues['certno'];
        General.FieldValues['const_lics_date'] := FieldValues['end_date'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.ePropertyComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  lc_Organ: TfrmOrganMng;
begin
  with Generald do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(PROPERTY_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        General.Edit;
        General.FieldValues['property_com'] := FieldValues['name'];
        General.FieldValues['property_address'] := FieldValues['addr'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.ePrjDesignComEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  lc_Organ: TfrmOrganMng;
begin
  with Generald do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(0, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        General.Edit;
        General.FieldValues['prj_design_com'] := FieldValues['name'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.eConstGroupEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  lc_Organ: TfrmOrganMng;
begin
  with Generald do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(INST_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        General.Edit;
        General.FieldValues['const_group'] := FieldValues['name'];
        General.FieldValues['const_group_address'] := FieldValues['addr'];
        General.FieldValues['const_group_tel'] := FieldValues['tel'];
        General.FieldValues['const_group_fax'] := FieldValues['fax'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.grdConstDetailcom_nameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  lc_Organ: TfrmOrganMng;
begin
  with ConstDetaild do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(BUILDER_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        ConstDetail.Edit;
        ConstDetail.FieldValues['com_name'] := FieldValues['name'];
        ConstDetail.FieldValues['reg_no'] := FieldValues['regno'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.grdBuildDetailcom_nameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  lc_Organ: TfrmOrganMng;
begin
  with BuildDetaild do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(BUILDER_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        BuildDetail.Edit;
        BuildDetail.FieldValues['com_name'] := FieldValues['name'];
        BuildDetail.FieldValues['reg_no'] := FieldValues['regno'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.grdSuprDetailcom_nameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  lc_Organ: TfrmOrganMng;
begin
  with SuprDetaild do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_Organ := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(BUILDVERIFY_SIGN, lc_Organ);
    if Fs_CurOrganId <> '' then
    begin
      with Temp do
      begin
        if Active then Close;
        SQL.Text := Format('SELECT * FROM device.organ_baseinfo ' +
          'WHERE sysid = ''%s''', [Fs_CurOrganId]);
        Open;
        SuprDetail.Edit;
        SuprDetail.FieldValues['com_name'] := FieldValues['name'];
        SuprDetail.FieldValues['reg_no'] := FieldValues['regno'];
        Close;
      end;
    end;
  finally
    if lc_Organ <> nil then lc_Organ.Free;
    Fs_CurOrganId := '';
    Fs_CurCertId := '';
  end;
end;

procedure TfrmBeginWorkManageBase.grdPersonDetailcard_noButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  prip_SelectPerson;
end;

end.
