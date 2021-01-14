unit ufrmAcctManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DBCtrls, CSDBNavigator, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, dxExEdtr, dxEdLib, dxDBELib, DBCtrlsEh, dxCntner,
  dxEditor, CSCustomdxDateEdit, CSdxDBDateEdit, Mask, DBLookupEh,
  CSScrCtrlChild, CSBarMDIChild, DB, ADODB, dxmdaset, ExtDlgs,
  CSADOQuery, DBGrids, CSGrdColCtrl, CSdxGrdColCtrl, CSADOFilter,
  CSADOdxGrdFilter, CSDBBase, CSDBFind, CSDBdxGrdFind;

type
  TfrmAcctManage = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    grdList: TDBGridEh;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    Panel6: TPanel;
    grdDeathDetail: TDBGridEh;
    Panel9: TPanel;
    grdInquiryDetail: TDBGridEh;
    Panel12: TPanel;
    grdLogDetail: TDBGridEh;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel21: TPanel;
    Panel26: TPanel;
    TabSheet9: TTabSheet;
    Panel30: TPanel;
    Panel31: TPanel;
    Label50: TLabel;
    Label49: TLabel;
    deInquiryDate: TCSdxDBDateEdit;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    deInquiryDeptDate: TCSdxDBDateEdit;
    Panel38: TPanel;
    Temp: TCSADOQuery;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnConfirm: TBitBtn;
    bbtnPrint: TBitBtn;
    Panel3: TPanel;
    bbtnListFind: TBitBtn;
    bbtnListFilter: TBitBtn;
    bbtnListColumn: TBitBtn;
    Panel4: TPanel;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    navList: TCSDBNavigator;
    Panel7: TPanel;
    Panel8: TPanel;
    bbtnAddDeathDetail: TBitBtn;
    bbtnDeleteDeathDetail: TBitBtn;
    navDeathDetail: TCSDBNavigator;
    mAcctResult: TdxDBMemo;
    mInquiryDifferIdea: TdxDBMemo;
    mInquiryDeptIdea: TdxDBMemo;
    mAcctRemark: TdxDBMemo;
    Panel10: TPanel;
    Panel11: TPanel;
    bbtnAddInquiryDetail: TBitBtn;
    bbtnDeleteInquiryDetail: TBitBtn;
    navInquiryDetail: TCSDBNavigator;
    Panel13: TPanel;
    Panel14: TPanel;
    bbtnAddLogDetail: TBitBtn;
    bbtnDeleteLogDetail: TBitBtn;
    navLogDetail: TCSDBNavigator;
    mAcctCourse: TdxDBMemo;
    mDestroyCircs: TdxDBMemo;
    General: TCSADOQuery;
    Generald: TDataSource;
    DeathDetaild: TDataSource;
    DeathDetail: TCSADOQuery;
    InquiryDetaild: TDataSource;
    InquiryDetail: TCSADOQuery;
    LogDetail: TCSADOQuery;
    LogDetaild: TDataSource;
    Province: TCSADOQuery;
    provinced: TDataSource;
    City: TCSADOQuery;
    cityd: TDataSource;
    Borough: TCSADOQuery;
    boroughd: TDataSource;
    DevPurpose: TCSADOQuery;
    DevPurposed: TDataSource;
    ScrollBox1: TScrollBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label24: TLabel;
    Label41: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label25: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label38: TLabel;
    eAcctCom: TDBEditEh;
    eAcctRegNo: TDBEditEh;
    eContact: TDBEditEh;
    eChiefDept: TDBEditEh;
    eTel: TDBEditEh;
    eZip: TDBEditEh;
    eFax: TDBEditEh;
    eEmail: TDBEditEh;
    lcmbOrgProperty: TdxDBPickEdit;
    eOrgAdress: TDBEditEh;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    eAcctAddress: TDBEditEh;
    lcmbProvince: TDBLookupComboboxEh;
    lcmbCity: TDBLookupComboboxEh;
    lcmbBorough: TDBLookupComboboxEh;
    eTown: TDBEditEh;
    CSdxDBDateEdit1: TCSdxDBDateEdit;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    labDevName: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    labUseCertId: TLabel;
    labDevInnerId: TLabel;
    Label8: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label20: TLabel;
    Label27: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    eDevName: TDBEditEh;
    eDevType: TDBEditEh;
    eDevRegNo: TDBEditEh;
    eDevCertNo: TDBEditEh;
    eDevInnerNo: TDBEditEh;
    lcmbDevCategory: TDBLookupComboboxEh;
    lcmbDevPurpose: TDBLookupComboboxEh;
    lcmbDevKind: TDBLookupComboboxEh;
    lcmbDevSort: TDBLookupComboboxEh;
    deUseDate: TCSdxDBDateEdit;
    deVerifyDate: TCSdxDBDateEdit;
    eManuCom: TDBEditEh;
    eDesignCom: TDBEditEh;
    eVerifyCom: TDBEditEh;
    eInstCom: TDBEditEh;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label3: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label22: TLabel;
    deAuthDate: TCSdxDBDateEdit;
    eDirectLoss: TDBEditEh;
    eIndirectLoss: TDBEditEh;
    eDeadNum: TDBEditEh;
    eHighHarmNum: TDBEditEh;
    eLightHarmNum: TDBEditEh;
    eSpecKind: TDBEditEh;
    lcmbAcctKind: TDBLookupComboboxEh;
    lcmbAcctReason: TDBLookupComboboxEh;
    lcmbReasonDetail: TDBLookupComboboxEh;
    lcmbAcctType: TDBLookupComboboxEh;
    lcmbAcctChar: TDBLookupComboboxEh;
    GroupBox6: TGroupBox;
    mAcctDuty: TdxDBMemo;
    GroupBox7: TGroupBox;
    mAcctMeasure: TdxDBMemo;
    GroupBox8: TGroupBox;
    mAcctIdea: TdxDBMemo;
    GroupBox9: TGroupBox;
    mDevCircs: TdxDBMemo;
    GroupBox10: TGroupBox;
    mTechParam: TdxDBMemo;
    eDevDiagram: TdxDBGraphicEdit;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    DevKind: TCSADOQuery;
    DevKindd: TDataSource;
    DevCategory: TCSADOQuery;
    DevCategoryd: TDataSource;
    DevSort: TCSADOQuery;
    DevSortd: TDataSource;
    AcctKind: TCSADOQuery;
    AcctKindd: TDataSource;
    AcctReason: TCSADOQuery;
    AcctReasond: TDataSource;
    ReasonDetail: TCSADOQuery;
    ReasonDetaild: TDataSource;
    AcctType: TCSADOQuery;
    AcctTyped: TDataSource;
    AcctChar: TCSADOQuery;
    AcctChard: TDataSource;
    Generalsysid: TStringField;
    Generalacct_no: TStringField;
    Generalacct_com: TStringField;
    Generalacct_reg_no: TStringField;
    Generalchief_dept: TStringField;
    Generalorg_property: TStringField;
    Generalcontact: TStringField;
    Generaltel: TStringField;
    Generalfax: TStringField;
    Generalemail: TStringField;
    Generalzip: TStringField;
    Generalprovince_id: TStringField;
    Generalprovince: TStringField;
    Generalcity_id: TStringField;
    Generalcity: TStringField;
    Generalborough_id: TStringField;
    Generalborough: TStringField;
    Generaltown: TStringField;
    Generalorg_address: TStringField;
    Generalacct_address: TStringField;
    Generalacct_date: TStringField;
    Generalauth_date: TStringField;
    Generaldev_name: TStringField;
    Generaldev_reg_no: TStringField;
    Generaldev_cert_no: TStringField;
    Generaldev_inner_no: TStringField;
    Generaldev_type: TStringField;
    Generaldev_purpose_id: TStringField;
    Generaldev_purpose: TStringField;
    Generaldev_kind_id: TStringField;
    Generaldev_kind: TStringField;
    Generaldev_category_id: TStringField;
    Generaldev_category: TStringField;
    Generaldev_sort_id: TStringField;
    Generaldev_sort: TStringField;
    Generalmanu_com: TStringField;
    Generalinst_com: TStringField;
    Generaluse_date: TStringField;
    Generaldesign_com: TStringField;
    Generalverify_com: TStringField;
    Generalverify_date: TStringField;
    Generalacct_kind_id: TStringField;
    Generalacct_kind: TStringField;
    Generalacct_reason_id: TStringField;
    Generalacct_reason: TStringField;
    Generalreason_detail_id: TStringField;
    Generalreason_detail: TStringField;
    Generalacct_type_id: TStringField;
    Generalacct_type: TStringField;
    Generalacct_char_id: TStringField;
    Generalacct_char: TStringField;
    Generalspec_kind: TStringField;
    Generaldirect_loss: TBCDField;
    Generalindirect_loss: TBCDField;
    Generaldead_num: TIntegerField;
    Generalhigh_harm_num: TIntegerField;
    Generallight_harm_num: TIntegerField;
    Generaltech_param: TStringField;
    Generaldev_diagram: TBlobField;
    Generaldev_circs: TStringField;
    Generalacct_course: TStringField;
    Generaldestroy_circs: TStringField;
    Generalspot_photo1: TBlobField;
    Generalpic_type1: TStringField;
    Generalspot_photo2: TBlobField;
    Generalpic_type2: TStringField;
    Generalspot_photo3: TBlobField;
    Generalpic_type3: TStringField;
    Generalspot_photo4: TBlobField;
    Generalpic_type4: TStringField;
    Generalacct_result: TStringField;
    Generalacct_duty: TStringField;
    Generalacct_idea: TStringField;
    Generalacct_measure: TStringField;
    Generalinquiry_manager: TStringField;
    Generalinquiry_date: TStringField;
    Generalinquiry_differ_idea: TStringField;
    Generalinquiry_differ_persons: TStringField;
    Generalinquiry_differ_date: TStringField;
    Generalinquiry_dept_idea: TStringField;
    Generalinquiry_dept_manager: TStringField;
    Generalinquiry_dept_date: TStringField;
    Generalpass_circs: TStringField;
    Generalacct_remark: TStringField;
    Generaloutflag: TIntegerField;
    DeathDetailsysid: TStringField;
    DeathDetailacct_sysid: TStringField;
    DeathDetailacct_no: TStringField;
    DeathDetailacct_date: TStringField;
    DeathDetailno: TIntegerField;
    DeathDetailname: TStringField;
    DeathDetailsex: TStringField;
    DeathDetailage: TStringField;
    DeathDetailoccup: TStringField;
    DeathDetailremark: TStringField;
    DeathDetailoutflag: TIntegerField;
    InquiryDetailsysid: TStringField;
    InquiryDetailacct_sysid: TStringField;
    InquiryDetailacct_no: TStringField;
    InquiryDetailacct_date: TStringField;
    InquiryDetailno: TIntegerField;
    InquiryDetailname: TStringField;
    InquiryDetailduty: TStringField;
    InquiryDetailcompany: TStringField;
    InquiryDetailtel: TStringField;
    InquiryDetailoccup: TStringField;
    InquiryDetailremark: TStringField;
    InquiryDetailoutflag: TIntegerField;
    LogDetailsysid: TStringField;
    LogDetailacct_sysid: TStringField;
    LogDetailacct_no: TStringField;
    LogDetailacct_date: TStringField;
    LogDetailwork_date: TStringField;
    LogDetailwork_content: TStringField;
    LogDetailremark: TStringField;
    LogDetailgzdw: TStringField;
    LogDetailoutflag: TIntegerField;
    DevPurposeid: TStringField;
    DevPurposecode: TStringField;
    DevPurposename: TStringField;
    DevPurposeoutflag: TIntegerField;
    DevKindid: TStringField;
    DevKindparent_id: TStringField;
    DevKindname: TStringField;
    DevKindcode_level: TStringField;
    DevKindcode: TStringField;
    DevKindoutflag: TIntegerField;
    DevCategoryid: TStringField;
    DevCategoryparent_id: TStringField;
    DevCategoryname: TStringField;
    DevCategorycode_level: TStringField;
    DevCategorycode: TStringField;
    DevCategoryoutflag: TIntegerField;
    DevSortid: TStringField;
    DevSortparent_id: TStringField;
    DevSortname: TStringField;
    DevSortcode_level: TStringField;
    DevSortcode: TStringField;
    DevSortoutflag: TIntegerField;
    AcctKindid: TStringField;
    AcctKindcode: TStringField;
    AcctKindname: TStringField;
    AcctKindoutflag: TIntegerField;
    AcctReasonid: TStringField;
    AcctReasoncode: TStringField;
    AcctReasonname: TStringField;
    AcctReasonoutflag: TIntegerField;
    ReasonDetailid: TStringField;
    ReasonDetailcode: TStringField;
    ReasonDetailname: TStringField;
    ReasonDetailoutflag: TIntegerField;
    AcctTypeid: TStringField;
    AcctTypecode: TStringField;
    AcctTypename: TStringField;
    AcctTypeoutflag: TIntegerField;
    AcctCharid: TStringField;
    AcctCharcode: TStringField;
    AcctCharname: TStringField;
    AcctCharoutflag: TIntegerField;
    Panel29: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    eSpotPhoto1: TdxDBGraphicEdit;
    eSpotPhoto2: TdxDBGraphicEdit;
    eSpotPhoto3: TdxDBGraphicEdit;
    eSpotPhoto4: TdxDBGraphicEdit;
    eInquiryDifferPersons: TDBEditEh;
    deInquiryDifferDate: TCSdxDBDateEdit;
    eInquiryDeptManager: TDBEditEh;
    eInquiryManager: TDBEditEh;
    ListFind: TCSDBdxGrdFind;
    ListFilter: TCSADOdxGrdFilter;
    ListColCtrl: TCSdxGrdColCtrl;
    Generaldev_diagram_type: TStringField;
    Generalstate: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcmbProvinceKeyValueChanged(Sender: TObject);
    procedure lcmbCityKeyValueChanged(Sender: TObject);
    procedure DeathDetailAfterInsert(DataSet: TDataSet);
    procedure GeneralAfterInsert(DataSet: TDataSet);
    procedure InquiryDetailAfterInsert(DataSet: TDataSet);
    procedure LogDetailAfterInsert(DataSet: TDataSet);
    procedure bbtnAddDeathDetailClick(Sender: TObject);
    procedure bbtnAddInquiryDetailClick(Sender: TObject);
    procedure bbtnAddLogDetailClick(Sender: TObject);
    procedure bbtnDeleteLogDetailClick(Sender: TObject);
    procedure bbtnDeleteInquiryDetailClick(Sender: TObject);
    procedure bbtnDeleteDeathDetailClick(Sender: TObject);
    procedure bbtnListFindClick(Sender: TObject);
    procedure bbtnListFilterClick(Sender: TObject);
    procedure bbtnListColumnClick(Sender: TObject);
    procedure bbtnSaveClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure eSpotPhoto1AssignPicture(Sender: TObject;
      var Picture: TPicture);
    procedure eSpotPhoto1GetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
    procedure eSpotPhoto2AssignPicture(Sender: TObject;
      var Picture: TPicture);
    procedure eSpotPhoto3AssignPicture(Sender: TObject;
      var Picture: TPicture);
    procedure eSpotPhoto4AssignPicture(Sender: TObject;
      var Picture: TPicture);
    procedure eSpotPhoto2GetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
    procedure eSpotPhoto3GetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
    procedure eSpotPhoto4GetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
    procedure eDevDiagramAssignPicture(Sender: TObject;
      var Picture: TPicture);
    procedure eDevDiagramGetGraphicClass(Sender: TObject;
      var GraphicClass: TGraphicClass);
  private
    Fs_CurOrganId, Fs_CurCertId: string;
    Fb_DataModified, Fb_GeneralChanged, Fb_DetailChanged,
    Fb_DisableSetChange: Boolean;
    Fs_ACGeneralId, Fs_ACAcctNo, Fs_PrevBWCustomId: string;
    function prif_CheckSaved: Boolean;
    function prif_Save: Boolean;
    function prif_Validate: Boolean;
    function prif_GenerateAcctNo: string;
    procedure prip_Reset;
    procedure prip_AfterEdit(DataSet: TDataSet);
    procedure prip_Cancel;
    procedure prip_Confirm;
    procedure prip_IniData;
    procedure prip_GetDevKind;
    procedure prip_GetAcctKind;
    procedure prip_GetAddressKind;
    procedure prip_GetGeneralData;
    procedure prip_GetDetailData;
    procedure prip_RefreshCity;
    procedure prip_RefreshBorough;
    procedure prip_AddGeneral;
    procedure prip_AddDeathDetail;
    procedure prip_AddInquiryDetail;
    procedure prip_AddLogDetail;
    procedure prip_DeleteDeathDetail;
    procedure prip_DeleteInquiryDetail;
    procedure prip_DeleteLogDetail;
    function prif_CheckBlank(Ac_DataSet: TDataSet;
      Ac_Fields: array of TField): Boolean;
  protected
    Rs_BeginWorkReport, Rs_DetailTableName, Rs_CustomIdHead,
    Rs_DevCodeId: string;
   public
    procedure pubp_Ini(const Ai_ActMode: Integer; Ac_Args: TStrings);
    property DataModified: Boolean read Fb_DataModified;
    property ACGeneralId: string read Fs_ACGeneralId;
  end;

var
  frmAcctManage: TfrmAcctManage;

implementation

uses
  Jpeg, udmData, CommonLib;

const
  SAVE_STATE = 0;
  CONFIRM_STATE = 1;

{$R *.dfm}

{ TfrmAcctManage }

procedure TfrmAcctManage.FormCreate(Sender: TObject);
begin
  Fb_DataModified := False;
  Fb_GeneralChanged := False;
  Fb_DetailChanged := False;
  Fb_DisableSetChange := False;
  Fs_ACGeneralId := '';
  Fs_PrevBWCustomId := '';
  Fs_CurOrganId := '';
  Fs_CurCertId := '';
end;

procedure TfrmAcctManage.bbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAcctManage.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := prif_CheckSaved;
end;

procedure TfrmAcctManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

function TfrmAcctManage.prif_CheckSaved: Boolean;
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
          DeathDetail.CancelBatch;
          InquiryDetail.CancelBatch;
          LogDetail.CancelBatch;
          General.Cancel;
          Result := True;
        end;
      IDCANCEL: Result := False;
    end;
  end;
end;

function TfrmAcctManage.prif_Save: Boolean;
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
      if State <> dsBrowse then Post;
      Fb_DisableSetChange := True;
    end;

    with DeathDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with InquiryDetail do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    with LogDetail do
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

function TfrmAcctManage.prif_Validate: Boolean;
begin
  with General do
  begin
    Result := prif_CheckBlank(General, [FieldByName('acct_com'),FieldByName('acct_reg_no'),
                FieldByName('province_id') ,FieldByName('city_id') ,
                FieldByName('borough_id') ,FieldByName('town') ,
                FieldByName('acct_address') ,FieldByName('acct_date') ,
                FieldByName('dev_name') ,FieldByName('dev_type') ,
                FieldByName('dev_purpose_id') ,FieldByName('dev_kind_id') ,
                FieldByName('dev_category_id') ,FieldByName('dev_sort_id') ,
                FieldByName('manu_com') ,FieldByName('inst_com') ,
                FieldByName('design_com') ,FieldByName('verify_com') ,
                FieldByName('acct_kind_id') ,FieldByName('acct_reason_id') ,
                FieldByName('reason_detail_id') ,FieldByName('acct_type_id') ,
                FieldByName('acct_char_id') ]);
    if not Result then Exit;

    Edit;
    FieldValues['province'] := Province.FieldValues['name'];
    FieldValues['city'] := City.FieldValues['name'];
    FieldValues['borough'] := Borough.FieldValues['name'];
    FieldValues['dev_purpose'] := DevPurpose.FieldValues['name'];
    FieldValues['dev_kind'] := DevKind.FieldValues['name'];
    FieldValues['dev_category'] := DevCategory.FieldValues['name'];
    FieldValues['dev_sort'] := DevSort.FieldValues['name'];
    FieldValues['acct_kind'] := AcctKind.FieldValues['name'];
    FieldValues['acct_reason'] := AcctReason.FieldValues['name'];
    FieldValues['reason_detail'] := ReasonDetail.FieldValues['name'];
    FieldValues['acct_type'] := AcctType.FieldValues['name'];
    FieldValues['acct_char'] := AcctChar.FieldValues['name'];

    if DeathDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入事故死亡情况一览表，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if InquiryDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入事故调查组成员一览表，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if LogDetail.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入事故调查工作情况记载，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

  end;
end;

procedure TfrmAcctManage.prip_IniData;
begin
  prip_GetDevKind;
  prip_GetAcctKind;
  prip_GetAddressKind;
  prip_GetGeneralData;
  prip_GetDetailData;
end;

procedure TfrmAcctManage.pubp_Ini(const Ai_ActMode: Integer;
  Ac_Args: TStrings);
begin
  ScrChild.SetSecurity(Self);
  try
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    prip_IniData;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmAcctManage.prip_GetAcctKind;
begin
  with AcctKind do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.code_acct_kind';
    Open;
  end;

  with AcctReason do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.code_acct_reason';
    Open;
  end;

  with ReasonDetail do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.code_acct_reasondetail';
    Open;
  end;

  with AcctType do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.code_acct_type';
    Open;
  end;

  with AcctChar do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.code_acct_char';
    Open;
  end;
end;

procedure TfrmAcctManage.prip_GetAddressKind;
begin
  with Province do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE ' +
      'code LIKE ''%s'' AND code_level = %d', [TOPAREACODE, PROVINCELEVEL]);
    Open;
  end;

  with City do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level = %d',
      [CITYLEVEL]);
    Open;
  end;

  with Borough do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_area WHERE code_level in ' +
      '(%d, %d)', [BOROUTHLEVEL, RESERVEDLEVEL]);
    Open;
  end;
end;

procedure TfrmAcctManage.prip_GetDevKind;
begin
//ToDo 与取设备种类等的相关操作
end;

procedure TfrmAcctManage.prip_GetDetailData;
begin
  with DeathDetail do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.acct_death_info';
    Open;
  end;

  with InquiryDetail do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.acct_inquiry_info';
    Open;
  end;

  with LogDetail do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.acct_log_info';
    Open;
  end;
end;

procedure TfrmAcctManage.prip_GetGeneralData;
begin
  with General do
  begin
    if not Active then Close;
    SQL.Text := 'select * from device.acct_info';
    Open;
  end;
end;

procedure TfrmAcctManage.prip_RefreshBorough;
var
  ls_CityId: string;
begin
  with General do
    if State = dsBrowse then ls_CityId := VarToStr(FieldValues['city_id'])
    else begin
      ls_CityId := VarToStr(lcmbCity.Value);
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

procedure TfrmAcctManage.prip_RefreshCity;
var
  ls_ProvinceId: string;
begin
  with General do
    if State = dsBrowse then
      ls_ProvinceId := VarToStr(FieldValues['province_id'])
    else begin
      ls_ProvinceId := VarToStr(lcmbProvince.Value);
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

procedure TfrmAcctManage.lcmbProvinceKeyValueChanged(Sender: TObject);
begin
  prip_RefreshCity;
end;

procedure TfrmAcctManage.lcmbCityKeyValueChanged(Sender: TObject);
begin
  prip_RefreshBorough;
end;

procedure TfrmAcctManage.DeathDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('acct_sysid').AsString := Fs_ACGeneralId;
    FieldByName('acct_no').AsString := Fs_ACAcctNo;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmAcctManage.GeneralAfterInsert(DataSet: TDataSet);
begin
  Fs_ACGeneralId := Gf_GenSysId;
  Fs_ACAcctNo := prif_GenerateAcctNo;
  with DataSet do
  begin
    FieldByName('sysid').AsString := ACGeneralId;
    FieldByName('acct_no').AsString := Fs_ACAcctNo;
  end;
end;

procedure TfrmAcctManage.prip_AfterEdit(DataSet: TDataSet);
begin
  if Fb_DisableSetChange then Exit;

  if DataSet = General then Fb_GeneralChanged := True;
  if DataSet = DeathDetail then Fb_DetailChanged := True;
  if DataSet = InquiryDetail then Fb_DetailChanged := True;
  if DataSet = LogDetail then Fb_DetailChanged := True;
  if not bbtnSave.Enabled then bbtnSave.Enabled := True;
  if not bbtnCancel.Enabled then bbtnCancel.Enabled := True;
end;

procedure TfrmAcctManage.prip_AddDeathDetail;
begin
  with General do if not IsEmpty then DeathDetail.Append;
end;

procedure TfrmAcctManage.prip_AddGeneral;
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

procedure TfrmAcctManage.prip_AddInquiryDetail;
begin
  with General do if not IsEmpty then InquiryDetail.Append;
end;

procedure TfrmAcctManage.prip_AddLogDetail;
begin
  with General do if not IsEmpty then LogDetail.Append;
end;

procedure TfrmAcctManage.InquiryDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('acct_sysid').AsString := Fs_ACGeneralId;
    FieldByName('acct_no').AsString := Fs_ACAcctNo;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmAcctManage.LogDetailAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldByName('acct_sysid').AsString := Fs_ACGeneralId;
    FieldByName('acct_no').AsString := Fs_ACAcctNo;
  end;
  prip_AfterEdit(DataSet);
end;

procedure TfrmAcctManage.bbtnAddDeathDetailClick(Sender: TObject);
begin
  prip_AddDeathDetail;
end;

procedure TfrmAcctManage.bbtnAddInquiryDetailClick(Sender: TObject);
begin
  prip_AddInquiryDetail;
end;

procedure TfrmAcctManage.bbtnAddLogDetailClick(Sender: TObject);
begin
  prip_AddLogDetail;
end;

procedure TfrmAcctManage.bbtnDeleteLogDetailClick(Sender: TObject);
begin
  prip_DeleteLogDetail;
end;

procedure TfrmAcctManage.bbtnDeleteInquiryDetailClick(Sender: TObject);
begin
  prip_DeleteInquiryDetail;
end;

procedure TfrmAcctManage.bbtnDeleteDeathDetailClick(Sender: TObject);
begin
  prip_DeleteDeathDetail;
end;

procedure TfrmAcctManage.prip_DeleteDeathDetail;
begin
  with DeathDetail do if not IsEmpty then Delete;
end;

procedure TfrmAcctManage.prip_DeleteInquiryDetail;
begin
  with InquiryDetail do if not IsEmpty then Delete;
end;

procedure TfrmAcctManage.prip_DeleteLogDetail;
begin
  with LogDetail do if not IsEmpty then Delete;
end;

procedure TfrmAcctManage.bbtnListFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmAcctManage.bbtnListFilterClick(Sender: TObject);
begin
  ListFilter.FilterDlg;
end;

procedure TfrmAcctManage.bbtnListColumnClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmAcctManage.bbtnSaveClick(Sender: TObject);
begin
  prif_Save;
end;

procedure TfrmAcctManage.bbtnCancelClick(Sender: TObject);
begin
  prip_Cancel;
end;

procedure TfrmAcctManage.bbtnConfirmClick(Sender: TObject);
begin
  prip_Confirm;
end;

procedure TfrmAcctManage.prip_Cancel;
begin
  Gp_ProgressHint('正在取消，请稍候...');
  try
    DeathDetail.CancelBatch;
    InquiryDetail.CancelBatch;
    LogDetail.CancelBatch;
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

procedure TfrmAcctManage.prip_Confirm;
begin
  if Application.MessageBox('是否真的要执行确认?', PChar(Caption),
    MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;

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

procedure TfrmAcctManage.eSpotPhoto1AssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with General, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('pic_type1').Clear
    else FieldByName('pic_type1').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmAcctManage.eSpotPhoto1GetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with General.FieldByName('pic_type1') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

procedure TfrmAcctManage.eSpotPhoto2AssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with General, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('pic_type2').Clear
    else FieldByName('pic_type2').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmAcctManage.eSpotPhoto3AssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with General, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('pic_type3').Clear
    else FieldByName('pic_type3').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmAcctManage.eSpotPhoto4AssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with General, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('pic_type4').Clear
    else FieldByName('pic_type4').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmAcctManage.eSpotPhoto2GetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with General.FieldByName('pic_type2') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

procedure TfrmAcctManage.eSpotPhoto3GetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with General.FieldByName('pic_type3') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

procedure TfrmAcctManage.eSpotPhoto4GetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with General.FieldByName('pic_type4') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

procedure TfrmAcctManage.prip_Reset;
begin
  Fb_GeneralChanged := False;
  Fb_DetailChanged := False;
  bbtnSave.Enabled := False;
  bbtnCancel.Enabled := False;
end;

function TfrmAcctManage.prif_CheckBlank(Ac_DataSet: TDataSet;
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

function TfrmAcctManage.prif_GenerateAcctNo: string;
begin
//ToDo 得到AcctNo的值
end;

procedure TfrmAcctManage.eDevDiagramAssignPicture(Sender: TObject;
  var Picture: TPicture);
begin
  with General, Picture do
  begin
    Edit;
    if Graphic = nil then FieldByName('dev_diagram_type').Clear
    else FieldByName('dev_diagram_type').AsString := Graphic.ClassName;
  end;
end;

procedure TfrmAcctManage.eDevDiagramGetGraphicClass(Sender: TObject;
  var GraphicClass: TGraphicClass);
begin
  with General.FieldByName('dev_diagram_type') do
    if IsNull then Exit else GraphicClass := TGraphicClass(GetClass(AsString));
end;

initialization

RegisterClasses([TIcon, TMetafile, TBitmap, TJPEGImage]);

end.
