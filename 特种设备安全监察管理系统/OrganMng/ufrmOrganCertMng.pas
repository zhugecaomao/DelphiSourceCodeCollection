unit ufrmOrganCertMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxmdaset, DB, ADODB, CSADOQuery, CSAdxDBDateEdit,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls,
  ExtCtrls, DBCtrlsEh, dxEdLib, dxDBELib, dxEditor, CSCustomdxDateEdit,
  CSdxDBDateEdit, Mask, DBLookupEh, DBCtrls, CSDBNavigator, ComCtrls,
  Buttons, ufrmOrganMng;

const
  CM_GRIDCLICK = WM_USER + 500;
  CM_LEVEL1CHANGED = WM_USER + 501;
  CM_LEVEL2CHANGED = WM_USER + 502;
  CM_LEVEL3CHANGED = WM_USER + 503;
  CM_LEVEL4CHANGED = WM_USER + 504;
  CM_LEVEL5CHANGED = WM_USER + 505;

type
  TfrmOrganCertMng = class(TForm)
    Panel1: TPanel;
    CertPrj: TCSADOQuery;
    CertPrjd: TDataSource;
    Requirement: TCSADOQuery;
    Requirementd: TDataSource;
    CertPrjModal: TCSADOQuery;
    CertPrjModald: TDataSource;
    Temp: TCSADOQuery;
    CertPrjsysid: TStringField;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    pagCert: TPageControl;
    tsBaseInfo: TTabSheet;
    tsDetailInfo: TTabSheet;
    GroupBox1: TGroupBox;
    panItem: TPanel;
    Panel7: TPanel;
    bbtnPrjInsert: TBitBtn;
    bbtnPrjDelete: TBitBtn;
    navItem: TCSDBNavigator;
    CertInfo: TCSADOQuery;
    CertInfod: TDataSource;
    Panel3: TPanel;
    Panel5: TPanel;
    CSDBNavigator1: TCSDBNavigator;
    mOrganInfo: TdxMemData;
    mOrganInfod: TDataSource;
    mOrganInfoorgan_sysid: TStringField;
    mOrganInfoorgan_name: TStringField;
    mOrganInfoauth_organ_sysid: TStringField;
    mOrganInfoauth_organ_name: TStringField;
    CertLevel1: TCSADOQuery;
    CertLevel1d: TDataSource;
    CertState: TCSADOQuery;
    CodeCertStated: TDataSource;
    grdCertPrj: TdxDBGrid;
    CertLevel2: TCSADOQuery;
    CertLevel3: TCSADOQuery;
    CertLevel4: TCSADOQuery;
    CertLevel5: TCSADOQuery;
    deApplyDateA: TCSAdxDBDateEdit;
    deAuthDateA: TCSAdxDBDateEdit;
    deEndDateA: TCSAdxDBDateEdit;
    Requirementsysid: TStringField;
    Requirementcert_sysid: TStringField;
    Requirementchapter: TStringField;
    Requirementitem: TStringField;
    Requirementcontent: TStringField;
    CertPrjModalsysid: TStringField;
    mOrganInfoBak: TdxMemData;
    mOrganInfoBakorgan_sysid: TStringField;
    mOrganInfoBakorgan_name: TStringField;
    mOrganInfoBakissueorgan_sysid: TStringField;
    mOrganInfoBakissueorgan_name: TStringField;
    mOrganInfoBakpzorgan_sysid: TStringField;
    mOrganInfoBakpzorgan_name: TStringField;
    bbtnLogout: TBitBtn;
    Requirementrequirement: TStringField;
    bbtnDiscard: TBitBtn;
    CertPrjcert_sysid: TStringField;
    CertPrjlevel4_id: TStringField;
    CertLevel6: TCSADOQuery;
    CertLevel2d: TDataSource;
    CertLevel3d: TDataSource;
    CertPrjlevel4: TStringField;
    CertPrjlevel5_id: TStringField;
    CertPrjlevel5: TStringField;
    CertPrjapply_date: TStringField;
    CertPrjauth_date: TStringField;
    CertPrjend_date: TStringField;
    CertPrjstate: TStringField;
    CertPrjstate_name: TStringField;
    CertPrjauth_organ_sysid: TStringField;
    CertPrjauth_organ: TStringField;
    CertPrjremark: TStringField;
    OrganPrjState: TCSADOQuery;
    CertPrjModalprj_sysid: TStringField;
    CertPrjModallevel6_id: TStringField;
    CertPrjModallevel6: TStringField;
    CertPrjModaltypical_prd: TStringField;
    CertPrjModalIsOld: TStringField;
    CertPrjModalIsModal: TStringField;
    CertPrjModalmodal_com: TStringField;
    CertPrjModalremark: TStringField;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    lcmbOrgan: TDBLookupComboboxEh;
    lcmbAuthOrgan: TDBLookupComboboxEh;
    deAuthDate: TCSdxDBDateEdit;
    deEndDate: TCSdxDBDateEdit;
    lcmbState: TDBLookupComboboxEh;
    lcmbLevel1: TDBLookupComboboxEh;
    mRemark: TdxDBMemo;
    eCertNo: TDBEditEh;
    Label10: TLabel;
    eAcceptNo: TDBEditEh;
    Label11: TLabel;
    eAcceptType: TDBEditEh;
    Label12: TLabel;
    deApplyDate: TCSdxDBDateEdit;
    lcmbLevel2: TDBLookupComboboxEh;
    Label13: TLabel;
    lcmbLevel3: TDBLookupComboboxEh;
    gbMiscInfo: TGroupBox;
    Label14: TLabel;
    eComArea: TDBNumberEditEh;
    Label15: TLabel;
    eWorkshopArea: TDBNumberEditEh;
    Label16: TLabel;
    eExposalArea: TDBNumberEditEh;
    Label17: TLabel;
    eDesignerNum: TDBNumberEditEh;
    Label18: TLabel;
    eCheckerNum: TDBNumberEditEh;
    Label19: TLabel;
    eInspectorNum: TDBNumberEditEh;
    Label20: TLabel;
    eWelderNum: TDBNumberEditEh;
    Label21: TLabel;
    eOtherNum: TDBNumberEditEh;
    Label22: TLabel;
    eDesignType: TDBEditEh;
    Label23: TLabel;
    eYearValue: TDBNumberEditEh;
    gbAgent: TGroupBox;
    Label24: TLabel;
    cmbAgentName: TDBComboBoxEh;
    Label25: TLabel;
    eAgentRegno: TDBEditEh;
    Label26: TLabel;
    eAgentLegalperson: TDBEditEh;
    Label27: TLabel;
    eAgentAddr: TDBEditEh;
    Label28: TLabel;
    eAgentZip: TDBEditEh;
    Label29: TLabel;
    eAgentTel: TDBEditEh;
    Label30: TLabel;
    eAgentFax: TDBEditEh;
    Label31: TLabel;
    eAgentEmail: TDBEditEh;
    Label32: TLabel;
    mChargeRemark: TdxDBMemo;
    Label33: TLabel;
    mLocalSuperviseRemark: TdxDBMemo;
    Label34: TLabel;
    mAcceptSuperviseRemark: TdxDBMemo;
    grdCertPrjsysid: TdxDBGridColumn;
    grdCertPrjcert_sysid: TdxDBGridColumn;
    grdCertPrjlevel4_id: TdxDBGridColumn;
    grdCertPrjlevel4: TdxDBGridLookupColumn;
    grdCertPrjlevel5_id: TdxDBGridColumn;
    grdCertPrjlevel5: TdxDBGridLookupColumn;
    grdCertPrjapply_date: TdxDBGridColumn;
    grdCertPrjauth_date: TdxDBGridColumn;
    grdCertPrjend_date: TdxDBGridColumn;
    grdCertPrjstate: TdxDBGridColumn;
    grdCertPrjstate_name: TdxDBGridLookupColumn;
    grdCertPrjauth_organ_sysid: TdxDBGridColumn;
    grdCertPrjremark: TdxDBGridBlobColumn;
    grdCertPrjauth_organ: TdxDBGridButtonColumn;
    mPrjOrganInfo: TdxMemData;
    mPrjOrganInfoBak: TdxMemData;
    mPrjOrganInfoauth_organ_sysid: TStringField;
    mPrjOrganInfoauth_organ: TStringField;
    mPrjOrganInfoBakauth_organ_sysid: TStringField;
    mPrjOrganInfoBakauth_organ: TStringField;
    tsPrdConst: TTabSheet;
    AuthInfo: TCSADOQuery;
    AuthInfosysid: TStringField;
    AuthInfoorgan_sysid: TStringField;
    AuthInfoname: TStringField;
    AuthInfoorgan_name: TStringField;
    AuthInfoauth_date: TStringField;
    AuthInfovalid_date: TStringField;
    AuthInforemark: TStringField;
    AuthInfod: TDataSource;
    CertPrd: TCSADOQuery;
    CertPrdsysid: TStringField;
    CertPrdcert_sysid: TStringField;
    CertPrdyear: TStringField;
    CertPrdlevel4_id: TStringField;
    CertPrdlevel4: TStringField;
    CertPrdquantity: TIntegerField;
    CertPrdvalue: TBCDField;
    CertPrdremark: TStringField;
    CertPrdd: TDataSource;
    tsAuthDoc: TTabSheet;
    GroupBox3: TGroupBox;
    grdCertPrd: TdxDBGrid;
    grdCertPrdsysid: TdxDBGridColumn;
    grdCertPrdcert_sysid: TdxDBGridColumn;
    grdCertPrdyear: TdxDBGridColumn;
    grdCertPrdlevel4_id: TdxDBGridColumn;
    grdCertPrdlevel4: TdxDBGridLookupColumn;
    grdCertPrdquantity: TdxDBGridColumn;
    grdCertPrdvalue: TdxDBGridColumn;
    grdCertPrdremark: TdxDBGridBlobColumn;
    Panel11: TPanel;
    Splitter4: TSplitter;
    CertDept: TCSADOQuery;
    CertDeptsysid: TStringField;
    CertDeptcert_sysid: TStringField;
    CertDeptname: TStringField;
    CertDeptmanager: TStringField;
    CertDeptquantity: TIntegerField;
    CertDeptremark: TStringField;
    CertDeptd: TDataSource;
    Panel13: TPanel;
    bbtnPrdInsert: TBitBtn;
    bbtnPrdDelete: TBitBtn;
    navCertPrd: TCSDBNavigator;
    tsDeptPsn: TTabSheet;
    tsEquip: TTabSheet;
    grdCertEquip: TdxDBGrid;
    grdCertEquipsysid: TdxDBGridColumn;
    grdCertEquipcert_sysid: TdxDBGridColumn;
    grdCertEquipserial_no: TdxDBGridColumn;
    grdCertEquipname: TdxDBGridColumn;
    grdCertEquippower: TdxDBGridColumn;
    grdCertEquipquantity: TdxDBGridColumn;
    grdCertEquipis_instru: TdxDBGridColumn;
    grdCertEquipis_selfcheck: TdxDBGridColumn;
    grdCertEquipcheck_range: TdxDBGridColumn;
    grdCertEquipremark: TdxDBGridBlobColumn;
    CertEquip: TCSADOQuery;
    CertEquipsysid: TStringField;
    CertEquipcert_sysid: TStringField;
    CertEquipserial_no: TIntegerField;
    CertEquipname: TStringField;
    CertEquippower: TStringField;
    CertEquipquantity: TIntegerField;
    CertEquipis_instru: TStringField;
    CertEquipis_selfcheck: TStringField;
    CertEquipcheck_range: TStringField;
    CertEquipremark: TStringField;
    CertEquipd: TDataSource;
    Panel15: TPanel;
    Panel16: TPanel;
    bbtnEqpInsert: TBitBtn;
    bbtnEqpDelete: TBitBtn;
    navCertEquip: TCSDBNavigator;
    GroupBox4: TGroupBox;
    Panel12: TPanel;
    Panel14: TPanel;
    bbtnDeptInsert: TBitBtn;
    bbtnDeptDelete: TBitBtn;
    navCertDept: TCSDBNavigator;
    grdCertDept: TdxDBGrid;
    grdCertDeptsysid: TdxDBGridColumn;
    grdCertDeptcert_sysid: TdxDBGridColumn;
    grdCertDeptname: TdxDBGridColumn;
    grdCertDeptmanager: TdxDBGridColumn;
    grdCertDeptquantity: TdxDBGridColumn;
    grdCertDeptremark: TdxDBGridBlobColumn;
    Splitter5: TSplitter;
    GroupBox6: TGroupBox;
    grdCertPsn: TdxDBGrid;
    CertPsn: TCSADOQuery;
    CertPsnsysid: TStringField;
    CertPsncert_sysid: TStringField;
    CertPsnpsn_sysid: TStringField;
    CertPsnlicns_sysid: TStringField;
    CertPsnlicns_prj_sysid: TStringField;
    CertPsnremark: TStringField;
    CertPsnd: TDataSource;
    GroupBox7: TGroupBox;
    grdCertConst: TdxDBGrid;
    grdCertConstsysid: TdxDBGridColumn;
    grdCertConstcert_id: TdxDBGridColumn;
    grdCertConstname: TdxDBGridColumn;
    grdCertConstorgan_regno: TdxDBGridColumn;
    grdCertConstremark: TdxDBGridBlobColumn;
    CertConst: TCSADOQuery;
    CertConstsysid: TStringField;
    CertConstcert_sysid: TStringField;
    CertConstname: TStringField;
    CertConstorgan_name: TStringField;
    CertConstorgan_regno: TStringField;
    CertConstremark: TStringField;
    CertConstd: TDataSource;
    Panel17: TPanel;
    Panel18: TPanel;
    bbtnCnsInsert: TBitBtn;
    bbtnCnsDelete: TBitBtn;
    navCertConst: TCSDBNavigator;
    GroupBox8: TGroupBox;
    grdAuthInfo: TdxDBGrid;
    grdAuthInfosysid: TdxDBGridColumn;
    grdAuthInfoorgan_sysid: TdxDBGridColumn;
    grdAuthInfoname: TdxDBGridColumn;
    grdAuthInfoorgan_name: TdxDBGridButtonColumn;
    grdAuthInfoauth_date: TdxDBGridColumn;
    grdAuthInfovalid_date: TdxDBGridColumn;
    grdAuthInforemark: TdxDBGridBlobColumn;
    Panel10: TPanel;
    Splitter3: TSplitter;
    GroupBox9: TGroupBox;
    grdCertDoc: TdxDBGrid;
    grdCertDocsysid: TdxDBGridColumn;
    grdCertDoccert_sysid: TdxDBGridColumn;
    grdCertDocserial_no: TdxDBGridColumn;
    grdCertDocname: TdxDBGridColumn;
    grdCertDocquantity: TdxDBGridColumn;
    grdCertDocremark: TdxDBGridBlobColumn;
    CertDoc: TCSADOQuery;
    CertDocsysid: TStringField;
    CertDoccert_sysid: TStringField;
    CertDocserial_no: TIntegerField;
    CertDocname: TStringField;
    CertDocquantity: TStringField;
    CertDocremark: TStringField;
    CertDocd: TDataSource;
    Panel19: TPanel;
    bbtnAuthInsert: TBitBtn;
    bbtnAuthDelete: TBitBtn;
    navAuthInfo: TCSDBNavigator;
    Panel20: TPanel;
    Panel21: TPanel;
    bbtnDocInsert: TBitBtn;
    bbtnDocDelete: TBitBtn;
    navCertDoc: TCSDBNavigator;
    grdCertConstorgan_name: TdxDBGridButtonColumn;
    Panel22: TPanel;
    Panel23: TPanel;
    bbtnPsnInsert: TBitBtn;
    bbtnPsnDelete: TBitBtn;
    nabCertPsn: TCSDBNavigator;
    deAIAuthDateA: TCSAdxDBDateEdit;
    deAIValidDateA: TCSAdxDBDateEdit;
    tsRequirement: TTabSheet;
    grdRequirement: TdxDBGrid;
    panRequirement: TPanel;
    Panel8: TPanel;
    bbtnReqGenerate: TBitBtn;
    navRequirement: TCSDBNavigator;
    GroupBox5: TGroupBox;
    grdCertPrjModal: TdxDBGrid;
    grdCertPrjModalsysid: TdxDBGridColumn;
    grdCertPrjModalprj_sysid: TdxDBGridColumn;
    grdCertPrjModallevel6_id: TdxDBGridColumn;
    grdCertPrjModallevel6: TdxDBGridLookupColumn;
    grdCertPrjModaltypical_prd: TdxDBGridColumn;
    grdCertPrjModalIsOld: TdxDBGridPickColumn;
    grdCertPrjModalIsModal: TdxDBGridColumn;
    grdCertPrjModalmodal_com: TdxDBGridButtonColumn;
    grdCertPrjModalremark: TdxDBGridBlobColumn;
    panProdRange: TPanel;
    Panel9: TPanel;
    bbtnModalInsert: TBitBtn;
    bbtnModalDelete: TBitBtn;
    navProdRange: TCSDBNavigator;
    Splitter1: TSplitter;
    Requirementtemp_sysid: TStringField;
    Requirementsegment: TStringField;
    Requirementexamination: TStringField;
    Requirementdata: TStringField;
    Requirementresult: TStringField;
    grdRequirementsysid: TdxDBGridColumn;
    grdRequirementcert_sysid: TdxDBGridColumn;
    grdRequirementtemp_sysid: TdxDBGridColumn;
    grdRequirementsegment: TdxDBGridColumn;
    grdRequirementchapter: TdxDBGridMemoColumn;
    grdRequirementitem: TdxDBGridMemoColumn;
    grdRequirementrequirement: TdxDBGridMemoColumn;
    grdRequirementexamination: TdxDBGridMemoColumn;
    grdRequirementestimate: TdxDBGridMemoColumn;
    grdRequirementdata: TdxDBGridMemoColumn;
    grdRequirementresult: TdxDBGridColumn;
    CertPsnname: TStringField;
    CertPsncardid: TStringField;
    CertPsneducation: TStringField;
    CertPsneducation_name: TStringField;
    CertPsnspeciality: TStringField;
    CertPsntitleofpost: TStringField;
    CertPsnlicns_category: TStringField;
    CertPsnlicns_category_name: TStringField;
    CertPsnpsnlicns_levelcode: TStringField;
    CertPsnpsnlicns_level: TStringField;
    CertPsnlicns_prj: TStringField;
    grdCertPsnsysid: TdxDBGridColumn;
    grdCertPsncert_sysid: TdxDBGridColumn;
    grdCertPsnpsn_sysid: TdxDBGridColumn;
    grdCertPsnname: TdxDBGridColumn;
    grdCertPsncardid: TdxDBGridColumn;
    grdCertPsneducation: TdxDBGridColumn;
    grdCertPsneducation_name: TdxDBGridColumn;
    grdCertPsnspeciality: TdxDBGridColumn;
    grdCertPsntitleofpost: TdxDBGridColumn;
    grdCertPsnlicns_sysid: TdxDBGridColumn;
    grdCertPsnlicns_category: TdxDBGridColumn;
    grdCertPsnlicns_category_name: TdxDBGridColumn;
    grdCertPsnlicns_prj_sysid: TdxDBGridColumn;
    grdCertPsnlicns_prj: TdxDBGridColumn;
    grdCertPsnpsnlicns_levelcode: TdxDBGridColumn;
    grdCertPsnpsnlicns_level: TdxDBGridColumn;
    Requirementrec_no: TIntegerField;
    bbtnExpand: TBitBtn;
    bbtnCollapse: TBitBtn;
    grdRequirementrec_no: TdxDBGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcmbOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbAuthOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure CertInfoAfterPost(DataSet: TDataSet);
    procedure CertInfoAfterCancel(DataSet: TDataSet);
    procedure CertPrjAfterPost(DataSet: TDataSet);
    procedure CertPrjAfterScroll(DataSet: TDataSet);
    procedure CertInfoAfterInsert(DataSet: TDataSet);
    procedure CertInfoBeforeEdit(DataSet: TDataSet);
    procedure bbtnLogoutClick(Sender: TObject);
    procedure lcmbLevel1KeyValueChanged(Sender: TObject);
    procedure grdCertPrjlevel4Change(Sender: TObject);
    procedure CertPrjBeforeEdit(DataSet: TDataSet);
    procedure CertInfoBeforePost(DataSet: TDataSet);
    procedure CertPrjBeforePost(DataSet: TDataSet);
    procedure CertPrjAfterInsert(DataSet: TDataSet);
    procedure CertPrjModalAfterInsert(DataSet: TDataSet);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnPrjInsertClick(Sender: TObject);
    procedure bbtnPrjDeleteClick(Sender: TObject);
    procedure bbtnReqGenerateClick(Sender: TObject);
    procedure bbtnModalInsertClick(Sender: TObject);
    procedure bbtnModalDeleteClick(Sender: TObject);
    procedure grdCertPrjClick(Sender: TObject);
    procedure grdCertPrjLevel5EditButtonClick(
      Sender: TObject);
    procedure grdCertPrjlevel5CloseUp(Sender: TObject;
      var Value: Variant; var Accept: Boolean);
    procedure grdProdRangeprdrange_nameCloseUp(Sender: TObject;
      var Value: Variant; var Accept: Boolean);
    procedure pagCertChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure CertPrjExit(Sender: TObject);
    procedure bbtnDiscardClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CertInfodDataChange(Sender: TObject; Field: TField);
    procedure CertPrjModalBeforePost(DataSet: TDataSet);
    procedure lcmbLevel2KeyValueChanged(Sender: TObject);
    procedure lcmbLevel3KeyValueChanged(Sender: TObject);
    procedure grdCertPrjlevel5Change(Sender: TObject);
    procedure grdCertPrjauth_organButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdCertPrjModalmodal_comButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CertPrjAfterCancel(DataSet: TDataSet);
    procedure cmbAgentNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure bbtnPrdInsertClick(Sender: TObject);
    procedure bbtnPrdDeleteClick(Sender: TObject);
    procedure bbtnDeptInsertClick(Sender: TObject);
    procedure bbtnDeptDeleteClick(Sender: TObject);
    procedure bbtnAuthInsertClick(Sender: TObject);
    procedure bbtnAuthDeleteClick(Sender: TObject);
    procedure bbtnDocInsertClick(Sender: TObject);
    procedure bbtnDocDeleteClick(Sender: TObject);
    procedure bbtnCnsInsertClick(Sender: TObject);
    procedure bbtnCnsDeleteClick(Sender: TObject);
    procedure bbtnPsnInsertClick(Sender: TObject);
    procedure bbtnPsnDeleteClick(Sender: TObject);
    procedure bbtnEqpInsertClick(Sender: TObject);
    procedure bbtnEqpDeleteClick(Sender: TObject);
    procedure grdAuthInfoorgan_nameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdCertConstorgan_nameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdAuthInfoClick(Sender: TObject);
    procedure AuthInfoAfterInsert(DataSet: TDataSet);
    procedure AbortDropDown(Sender: TObject);
    procedure pagCertChange(Sender: TObject);
    procedure CommonAfterInsert(DataSet: TDataSet);
    procedure bbtnExpandClick(Sender: TObject);
    procedure bbtnCollapseClick(Sender: TObject);
  private
    Fb_DataChanged, Fb_DataModified: Boolean;
    Fi_ActMode: Integer;
    Fs_CertId, Fs_OrganId, Fs_PrevCertNo, Fs_OldLevel1, Fs_OldLevel2,
    Fs_OldLevel3, Fs_OldLevel4, Fs_OldLevel5: string;
    
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_GetOrganInfo(Asa_Ids: array of string);
    procedure prip_GetPrjOrganInfo;
    procedure prip_LoadCertPrj;
    procedure prip_LoadRequirement;
    procedure prip_LoadCertPrjModal;

    procedure prip_MoreForManu;
    procedure prip_LoadAuthInfo;
    procedure prip_LoadCertDoc;
    procedure prip_LoadCertPrd;
    procedure prip_LoadCertConst;
    procedure prip_LoadCertDept;
    procedure prip_LoadCertPsn;
    procedure prip_LoadCertEquip;

    procedure prip_SelectOrgan(Ac_DataSet: TDataSet; const As_Field: string;
      const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng);
    procedure prip_OrganDialog(Ac_Sender: TObject; Ac_DataSource: TDataSource;
      const Ai_Category: Integer; Ac_Requestor: TfrmOrganMng = nil);
    procedure prip_RefreshListSource;
    function prif_ChangeWarning(Ac_Src: TDataSet;
      Aca_Related: array of TDataSet; const As_New, As_Old, As_Field, As_Label,
      As_Related: string): Integer;
    procedure prip_DeleteCertPrj;
    procedure prip_GenerateRequirement;
    procedure prip_ClearValue(Ac_Sender: TdxDBGridButtonColumn;
      Ac_DataSet: TDataSet);

    function prif_CheckBlank(Ac_DataSet: TDataSet; const Asa_Fields,
      Asa_Labels: array of string): Boolean;
    procedure prip_CertBeforePost;
    procedure prip_CertPrjBeforePost;
    procedure prip_Logout;
    procedure prip_Discard;
    procedure prip_DeleteRecord(Ac_DataSet: TDataSet);
    procedure prip_AddPerson;
    procedure prip_DelPerson;

    procedure CMGridClick(var Msg: TMessage); message CM_GRIDCLICK;
    procedure CMLevel1Changed(var Msg: TMessage); message CM_LEVEL1CHANGED;
    procedure CMLevel2Changed(var Msg: TMessage); message CM_LEVEL2CHANGED;
    procedure CMLevel3Changed(var Msg: TMessage); message CM_LEVEL3CHANGED;
    procedure CMLevel4Changed(var Msg: TMessage); message CM_LEVEL4CHANGED;
    procedure CMLevel5Changed(var Msg: TMessage); message CM_LEVEL5CHANGED;
  public
    procedure pubp_Ini(const Ai_ActMode: Integer; Ac_Args: TStrings);
    property DataModified: Boolean read Fb_DataModified;
  end;

implementation

uses
  CSDBUtils, udmData, CommonLib;

{$R *.dfm}

const
  LEVEL1TO3WARNING = '许可证项目、许可证项目型式及评审记录';
  LEVEL4TO5WARNING = '许可证项目型式';
  
procedure TfrmOrganCertMng.FormCreate(Sender: TObject);
begin
  Fb_DataModified := False;
  Fi_ActMode := 0;
  Fs_CertId := '';
  Fs_PrevCertNo := '';
  Fs_OldLevel1 := '';
  Fs_OldLevel2 := '';
  Fs_OldLevel3 := '';
  Fs_OldLevel4 := '';
  Fs_OldLevel5 := '';
end;

procedure TfrmOrganCertMng.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmOrganCertMng.prip_OrganDialog(Ac_Sender: TObject;
  Ac_DataSource: TDataSource; const Ai_Category: Integer;
  Ac_Requestor: TfrmOrganMng);
begin
  with Ac_DataSource do if not AutoEdit then Exit;

  if Ac_Sender is TDBLookupComboboxEh then
    with Ac_Sender as TDBLookupComboboxEh do
    begin
      if ReadOnly then Exit;
      try
        prip_SelectOrgan(Ac_DataSource.DataSet, DataField, Ai_Category,
          Ac_Requestor);
        ListSource := nil;
        ListSource := mOrganInfod;
      finally
        if Ac_Requestor <> nil then Ac_Requestor.Free;
      end;
    end;

  if Ac_Sender is TDBComboBoxEh then
    with Ac_Sender as TDBComboBoxEh do
    begin
      if ReadOnly then Exit;
      try
        prip_SelectOrgan(Ac_DataSource.DataSet, DataField, Ai_Category,
          Ac_Requestor);
      finally
        if Ac_Requestor <> nil then Ac_Requestor.Free;
      end;
    end;

  if Ac_Sender is TdxDBGridButtonColumn then
    with Ac_Sender as TdxDBGridButtonColumn do
    begin
      if DisableEditor then Exit;
      try
        if Ac_DataSource.DataSet.FieldByName(FieldName).FieldKind =
            fkLookup then
          prip_SelectOrgan(Ac_DataSource.DataSet, FieldName + '_sysid',
            Ai_Category, Ac_Requestor)
        else
          prip_SelectOrgan(Ac_DataSource.DataSet, FieldName, Ai_Category,
            Ac_Requestor);
      finally
        if Ac_Requestor <> nil then Ac_Requestor.Free;
      end;
    end;
end;

procedure TfrmOrganCertMng.prip_IniData;
begin
  with CertLevel1 do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_cert WHERE code_level = 1';
    Open;
  end;

  with CertLevel2 do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_cert WHERE code_level = 2';
    Open;
  end;

  with CertLevel3 do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_cert WHERE code_level = 3';
    Open;
  end;

  with CertState do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_cert_state';
    Open;
  end;

  with CertInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert WHERE sysid = ''%s''',
      [Fs_CertId]);
    Open;

    if Fi_ActMode = AM_OCMADD then Insert;

    if not IsEmpty then
    begin
      prip_GetOrganInfo([VarToStr(FieldValues['organ_sysid']),
        VarToStr(FieldValues['auth_organ_sysid'])]);

      prip_LoadCertPrj;
      prip_LoadRequirement;
    end;
  end;
end;

procedure TfrmOrganCertMng.prip_IniInterface;
var
  li_i: Integer;
begin
  case Fi_ActMode of
    AM_OCMADD: Caption := '取证登记';
    AM_OCMCHANGE: Caption := '许可证变更';
    AM_OCMEXCHANGE: Caption := '换证';
    AM_OCMLOGOUT: Caption := '注销许可证';
    AM_OCMVIEW: Caption := '查看许可证';
  end;

  eCertNo.ReadOnly := Fi_ActMode <> AM_OCMADD;
  lcmbOrgan.Enabled := Fi_ActMode = AM_OCMADD;
  lcmbLevel1.ReadOnly := Fi_ActMode <> AM_OCMADD;
  lcmbLevel2.ReadOnly := Fi_ActMode <> AM_OCMADD;
  lcmbLevel3.ReadOnly := Fi_ActMode <> AM_OCMADD;
  eAcceptNo.ReadOnly := Fi_ActMode <> AM_OCMADD;
  eAcceptType.ReadOnly := Fi_ActMode <> AM_OCMADD;
  deApplyDate.ReadOnly := not (Fi_ActMode in [AM_OCMADD, AM_OCMEXCHANGE]);
  lcmbAuthOrgan.Enabled := Fi_ActMode = AM_OCMADD;
  deAuthDate.ReadOnly := not (Fi_ActMode in [AM_OCMADD, AM_OCMEXCHANGE]);
  deEndDate.ReadOnly := not (Fi_ActMode in [AM_OCMADD, AM_OCMEXCHANGE]);

  with gbMiscInfo do
    for li_i := 0 to ControlCount - 1 do
      if Controls[li_i] is TCustomDBEditEh then
        TCustomDBEditEh(Controls[li_i]).ReadOnly := Fi_ActMode <> AM_OCMADD;

  with gbAgent do
    for li_i := 0 to ControlCount - 1 do
      if Controls[li_i] is TCustomDBEditEh then
        TCustomDBEditEh(Controls[li_i]).ReadOnly := Fi_ActMode <> AM_OCMADD;

  mChargeRemark.ReadOnly := Fi_ActMode in [AM_OCMLOGOUT, AM_OCMVIEW];
  mLocalSuperviseRemark.ReadOnly := Fi_ActMode in [AM_OCMLOGOUT, AM_OCMVIEW];
  mAcceptSuperviseRemark.ReadOnly := Fi_ActMode in [AM_OCMLOGOUT, AM_OCMVIEW];
  
  bbtnLogout.Visible := Fi_ActMode = AM_OCMLOGOUT;
  bbtnDiscard.Visible := Fi_ActMode = AM_OCMADD;

  if not (Fi_ActMode in [AM_OCMADD, AM_OCMCHANGE]) then
  begin
    with grdCertPrj do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnPrjInsert.Enabled := False;
    bbtnPrjDelete.Enabled := False;

    with grdRequirement do OptionsBehavior := OptionsBehavior - [edgoEditing];
    bbtnReqGenerate.Enabled := False;

    with grdCertPrjModal do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnModalInsert.Enabled := False;
    bbtnModalDelete.Enabled := False;

    with grdAuthInfo do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnAuthInsert.Enabled := False;
    bbtnAuthDelete.Enabled := False;

    with grdCertDoc do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnDocInsert.Enabled := False;
    bbtnDocDelete.Enabled := False;

    with grdCertPrd do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnPrdInsert.Enabled := False;
    bbtnPrdDelete.Enabled := False;

    with grdCertConst do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnCnsInsert.Enabled := False;
    bbtnCnsDelete.Enabled := False;

    with grdCertDept do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnDeptInsert.Enabled := False;
    bbtnDeptDelete.Enabled := False;

    bbtnPsnInsert.Enabled := False;
    bbtnPsnDelete.Enabled := False;

    with grdCertEquip do
      for li_i := 0 to ColumnCount - 1 do
        if Columns[li_i].FieldName = 'remark' then
          Columns[li_i].ReadOnly := True
        else Columns[li_i].DisableEditor := True;
    bbtnEqpInsert.Enabled := False;
    bbtnEqpDelete.Enabled := False;
  end;

  if (Fi_ActMode = AM_OCMADD) and (Fs_OrganId <> '') then
    lcmbOrgan.Enabled := False;
  
  prip_MoreForManu;
end;

procedure TfrmOrganCertMng.prip_SelectOrgan(Ac_DataSet: TDataSet;
  const As_Field: string; const Ai_Category: Integer;
  Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevVal, ls_CurVal: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
begin
  with Ac_Requestor, Ac_DataSet do
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
      if Pos('sysid', As_Field) > 0 then
        if Ac_DataSet = CertPrj then
        begin
          if mPrjOrganInfo.Locate(As_Field, ls_PrevVal, []) then
            mPrjOrganInfo.Delete;
          if not mPrjOrganInfo.Locate(As_Field, ls_CurVal, []) then
          begin
            mPrjOrganInfo.Insert;
            mPrjOrganInfo.FieldByName('auth_organ_sysid').AsString :=
              CurOrganId;
            mPrjOrganInfo.FieldByName('auth_organ').AsString := CurOrganName;
            mPrjOrganInfo.Post;
          end;
        end else begin
          li_Index := mOrganInfo.FieldByName(As_Field).Index;
          mOrganInfo.Edit;
          mOrganInfo.Fields[li_Index].AsString := CurOrganId;
          mOrganInfo.Fields[li_Index + 1].AsString := CurOrganName;
          mOrganInfo.Post;
        end;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := ls_CurVal;
    end;
  end;
end;

procedure TfrmOrganCertMng.pubp_Ini(const Ai_ActMode: Integer;
  Ac_Args: TStrings);
begin
  Fi_ActMode := Ai_ActMode;
  with Ac_Args do
  begin
    Fs_CertId := Strings[0];
    Fs_OrganId := Strings[1];
  end;

  Gp_ProgressHint('正在打开许可证，请稍候...');
  try
    prip_IniData;
  finally
    Fb_DataChanged := False;
    Gp_ProgressHint;
  end;

  prip_IniInterface;

  if MAXIMIZEMODALBYDEF then WindowState := wsMaximized;
end;

procedure TfrmOrganCertMng.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(lcmbOrgan, CertInfod, 0, TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.lcmbAuthOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(lcmbAuthOrgan, CertInfod, SUPERVISOR_SIGN,
    TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.prip_RefreshListSource;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mOrganInfod;
  end;
  with lcmbAuthOrgan do
  begin
    ListSource := nil;
    ListSource := mOrganInfod;
  end;
end;

procedure TfrmOrganCertMng.prip_GetOrganInfo(Asa_Ids: array of string);
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
      'WHERE sysid = ''%s''',
      [Asa_Ids[0], Asa_Ids[1]]);
    Open;
    if not mOrganInfo.IsEmpty then mOrganInfo.Delete;
    mOrganInfo.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mOrganInfo.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mOrganInfo.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mOrganInfo.Post;
    mOrganInfoBak.LoadFromDataSet(mOrganInfo);
    Close;
  end;
  prip_RefreshListSource;
end;

procedure TfrmOrganCertMng.prip_LoadCertPrj;
var
  ls_CertId, ls_Level3: string;
begin
  with CertInfo do
    if IsEmpty then
    begin
      ls_CertId := '';
      ls_Level3 := '';
    end else begin
      ls_CertId := FieldByName('sysid').AsString;
      ls_Level3 := VarToStr(FieldValues['level3_id']);
    end;

  with CertLevel4 do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_organ_cert WHERE ' +
      'parent_id = ''%s'' AND code_level = 4', [ls_Level3]);
    Open;
  end;

  with CertLevel5 do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_cert WHERE code_level = 5';
    Open;
  end;

  with OrganPrjState do
  begin
    if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_organ_prj_state';
    Open;
  end;

  prip_GetPrjOrganInfo;

  with CertPrj do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_prj WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertPrjModal;
var
  ls_CertPrjId, ls_Level5: string;
begin
  with CertPrj do
  begin
    ls_CertPrjId := FieldByName('sysid').AsString;
    ls_Level5 := VarToStr(FieldValues['level5_id']); 
  end;

  with CertLevel6 do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_organ_cert WHERE ' +
      'parent_id = ''%s'' AND code_level = 6', [ls_Level5]);
    Open;
  end;

  with CertPrjModal do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.organ_cert_prj_modal WHERE ' +
        'prj_sysid = ''%s''', [ls_CertPrjId]);
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadRequirement;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with Requirement do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.organ_requirement WHERE ' +
        'cert_sysid = ''%s'' ORDER BY rec_no', [ls_CertId]);
      Open;
    finally
      EnableControls;
    end;
  end;
  with grdRequirement do
  begin
    FullExpand;
    GotoFirst;
  end;
end;

procedure TfrmOrganCertMng.CertInfoAfterPost(DataSet: TDataSet);
begin
  mOrganInfoBak.LoadFromDataSet(mOrganInfo);
  Fb_DataModified := True;
end;

procedure TfrmOrganCertMng.CertInfoAfterCancel(DataSet: TDataSet);
begin
  mOrganInfo.LoadFromDataSet(mOrganInfoBak);
  prip_RefreshListSource;
  if Fi_ActMode = AM_OCMADD then DataSet.Insert;
end;

procedure TfrmOrganCertMng.CertPrjAfterPost(DataSet: TDataSet);
begin
  mPrjOrganInfoBak.LoadFromDataSet(mPrjOrganInfo);
end;

procedure TfrmOrganCertMng.CertPrjAfterScroll(DataSet: TDataSet);
begin
  prip_LoadCertPrjModal;
end;

procedure TfrmOrganCertMng.CMLevel1Changed(var Msg: TMessage);
var
  ls_Level1: string;
begin
  with CertInfo do
    if State = dsBrowse then ls_Level1 := VarToStr(FieldValues['level1_id'])
    else begin
      ls_Level1 := VarToStr(lcmbLevel1.Value);
      if prif_ChangeWarning(CertInfo, [CertPrj, CertPrjModal, Requirement],
        ls_Level1, Fs_OldLevel1, 'level1_id', '许可性质', LEVEL1TO3WARNING) =
        IDCANCEL then Exit;
      FieldByName('level2_id').Clear;
    end;

  with CertLevel2 do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM code_organ_cert WHERE ' +
      'parent_id = ''%s'' AND code_level = 2', [ls_Level1]);
    Open;
  end;

  prip_MoreForManu;
end;

procedure TfrmOrganCertMng.CMLevel2Changed(var Msg: TMessage);
var
  ls_Level2: string;
begin
  with CertInfo do
    if State = dsBrowse then ls_Level2 := VarToStr(FieldValues['level2_id'])
    else begin
      ls_Level2 := VarToStr(lcmbLevel2.Value);
      if prif_ChangeWarning(CertInfo, [CertPrj, CertPrjModal, Requirement],
        ls_Level2, Fs_OldLevel2, 'level2_id', '设备大类', LEVEL1TO3WARNING) =
        IDCANCEL then Exit;
      FieldByName('level3_id').Clear;
    end;

  with CertLevel3 do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM code_organ_cert WHERE ' +
      'parent_id = ''%s'' AND code_level = 3', [ls_Level2]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.CMLevel3Changed(var Msg: TMessage);
var
  ls_Level3: string;
begin
  with CertInfo do
    if State = dsBrowse then ls_Level3 := VarToStr(FieldValues['level3_id'])
    else begin
      ls_Level3 := VarToStr(lcmbLevel3.Value);
      if prif_ChangeWarning(CertInfo, [CertPrj, CertPrjModal, Requirement],
        ls_Level3, Fs_OldLevel3, 'level3_id', '设备种类', LEVEL1TO3WARNING) =
        IDCANCEL then Exit;
    end;

  with CertLevel4 do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM code_organ_cert WHERE ' +
      'parent_id = ''%s'' AND code_level = 4', [ls_Level3]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.CMLevel4Changed(var Msg: TMessage);
var
  ls_Level4: string;
begin
  with CertPrj do if State = dsBrowse then Exit;

  ls_Level4 := VarToStr(CertPrj.FieldValues['level4_id']);

  if prif_ChangeWarning(CertPrj, [Requirement, CertPrjModal], ls_Level4,
      Fs_OldLevel4, 'level4_id', '设备类型', LEVEL4TO5WARNING) = IDCANCEL then
    Exit;

  CertPrj.FieldByName('level5_id').Clear;
end;

procedure TfrmOrganCertMng.CMLevel5Changed(var Msg: TMessage);
var
  ls_Level5: string;
begin
  with CertPrj do if State = dsBrowse then Exit;

  ls_Level5 := VarToStr(CertPrj.FieldValues['level5_id']);

  if prif_ChangeWarning(CertPrj, [Requirement, CertPrjModal], ls_Level5,
      Fs_OldLevel5, 'level5_id', '许可等级', LEVEL4TO5WARNING) = IDCANCEL then
    Exit;
end;

procedure TfrmOrganCertMng.CertInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    if Fs_OrganId <> '' then FieldByName('organ_sysid').AsString := Fs_OrganId;
    FieldByName('state').AsString := OCS_NORMAL;
  end;
end;

procedure TfrmOrganCertMng.CMGridClick(var Msg: TMessage);
var
  lc_Grid: TComponent;
begin
  lc_Grid := Pointer(Msg.LParam);

  if lc_Grid = grdCertPrj then
    with grdCertPrj do
    begin
      if not ColumnByFieldName('apply_date').DisableEditor then
        deApplyDateA.PopupDate(grdCertPrj);
      if not ColumnByFieldName('auth_date').DisableEditor then
        deAuthDateA.PopupDate(grdCertPrj);
      if not ColumnByFieldName('end_date').DisableEditor then
        deEndDateA.PopupDate(grdCertPrj);
    end;
    
  if lc_Grid = grdAuthInfo then
    with grdAuthInfo do
    begin
      if not ColumnByFieldName('auth_date').DisableEditor then
        deAIAuthDateA.PopupDate(grdAuthInfo);
      if not ColumnByFieldName('valid_date').DisableEditor then
        deAIValidDateA.PopupDate(grdAuthInfo);
    end;
end;

procedure TfrmOrganCertMng.CertInfoBeforeEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Fs_PrevCertNo := VarToStr(FieldValues['certno']);
    Fs_OldLevel1 := VarToStr(FieldValues['level1_id']);
    Fs_OldLevel2 := VarToStr(FieldValues['level2_id']);
    Fs_OldLevel3 := VarToStr(FieldValues['level3_id']);
  end;
end;

procedure TfrmOrganCertMng.prip_CertBeforePost;
var
  lb_Exists: Boolean;
  ls_CertId, ls_Level1, ls_Level2, ls_Level3, ls_CertNo: string;
begin
  if not prif_CheckBlank(CertInfo, ['certno', 'organ_sysid', 'level1_id',
    'level2_id', 'level3_id', 'auth_organ_sysid', 'auth_date', 'end_date'],
    ['许可证编号', '所属机构', '许可性质', '设备大类', '设备种类', '批准机构',
    '批准日期', '有效日期']) then Abort;

  with CertInfo do
  begin
    ls_CertId := FieldByName('sysid').AsString;
    ls_CertNo := FieldByName('certno').AsString;
    ls_Level1 := VarToStr(FieldValues['level1_id']);
    ls_Level2 := VarToStr(FieldValues['level2_id']);
    ls_Level3 := VarToStr(FieldValues['level3_id']);
  end;

  if Fs_PrevCertNo <> ls_CertNo then
    with Temp do
    begin
      if Active then Close;
      SQL.Text := Format('SELECT COUNT(*) FROM device.organ_cert WHERE ' +
        'certno = ''%s''', [ls_CertNo]);
      Open;
      lb_Exists := Fields[0].AsInteger > 0;
      Close;
      if lb_Exists then
      begin
        Application.MessageBox('您输入的许可证编号已存在，请重新输入。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
        Abort;
      end;
    end;

  if Fs_OldLevel1 <> '' then
    if prif_ChangeWarning(CertInfo, [CertPrj, Requirement], ls_Level1,
        Fs_OldLevel1, 'level1_id', '许可性质', LEVEL1TO3WARNING) = IDCANCEL then
      Abort;
  if (Fs_OldLevel2 <> '') and (ls_Level1 = Fs_OldLevel1) then
    if prif_ChangeWarning(CertInfo, [CertPrj, Requirement], ls_Level2,
        Fs_OldLevel2, 'level2_id', '设备大类', LEVEL1TO3WARNING) = IDCANCEL then
      Abort;
  if (Fs_OldLevel3 <> '') and (ls_Level1 = Fs_OldLevel1) and
      (ls_Level2 = Fs_OldLevel2) then
    if prif_ChangeWarning(CertInfo, [CertPrj, Requirement], ls_Level3,
        Fs_OldLevel3, 'level3_id', '设备种类', LEVEL1TO3WARNING) = IDCANCEL then
      Abort;

  if ((ls_Level1 <> Fs_OldLevel1) and (Fs_OldLevel1 <> '')) or
    ((ls_Level2 <> Fs_OldLevel2) and (Fs_OldLevel2 <> '')) or
    ((ls_Level3 <> Fs_OldLevel3) and (Fs_OldLevel3 <> '')) then
  begin
    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj_modal ' +
      'WHERE EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_cert_prj_modal.prj_sysid = A.sysid AND ' +
      'A.cert_sysid = ''%s'')', [ls_CertId]));
    with CertPrjModal do
      if Active then
      begin
        Close;
        Open;
      end;
    dmData.adocon.Execute(Format('DELETE FROM device.organ_requirement WHERE ' +
      'EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_requirement.prj_sysid = A.sysid AND ' +
      'A.cert_sysid = ''%s'')', [ls_CertId]));
    with Requirement do
      if Active then
      begin
        Close;
        Open;
      end;
    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]));
    with CertPrj do
      if Active then
      begin
        Close;
        Open;
      end;
  end;
end;

procedure TfrmOrganCertMng.prip_Logout;
begin
  if Application.MessageBox('您确定要注销这张许可证吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
  
  with CertInfo do
  begin
    Edit;
    FieldByName('state').AsString := OCS_LOGOUT;
    Post;
  end;

  Close;
end;

function TfrmOrganCertMng.prif_CheckBlank(Ac_DataSet: TDataSet; const Asa_Fields,
  Asa_Labels: array of string): Boolean;
var
  li_i: Integer;
begin
  Result := True;

  for li_i := Low(Asa_Fields) to High(Asa_Fields) do
    if VarToStr(Ac_DataSet.FieldValues[Asa_Fields[li_i]]) = '' then
    begin
      Result := False;
      Application.MessageBox(PChar(Asa_Labels[li_i] + '不能为空'),
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;
end;

procedure TfrmOrganCertMng.bbtnLogoutClick(Sender: TObject);
begin
  prip_Logout;
end;

procedure TfrmOrganCertMng.lcmbLevel1KeyValueChanged(Sender: TObject);
begin
  PostMessage(Handle, CM_LEVEL1CHANGED, 0, 0);
end;

procedure TfrmOrganCertMng.grdCertPrjlevel4Change(
  Sender: TObject);
begin
  PostMessage(Handle, CM_LEVEL4CHANGED, 0, 0);
end;

function TfrmOrganCertMng.prif_ChangeWarning(Ac_Src: TDataSet;
  Aca_Related: array of TDataSet; const As_New, As_Old, As_Field, As_Label,
  As_Related: string): Integer;
var
  lb_HasRelated: Boolean;
  li_i: Integer;
begin
  Result := IDOK;

  lb_HasRelated := False;
  for li_i := Low(Aca_Related) to High(Aca_Related) do
    if Aca_Related[li_i].RecordCount > 0 then
    begin
      lb_HasRelated := True;
      Break;
    end;

  with Ac_Src do
    if (State <> dsBrowse) and (As_New <> As_Old) and lb_HasRelated then
    begin
      Result := Application.MessageBox(PChar(Format('注意，改变%s将导致已有的' +
        '%s全部被删除且不可恢复。您确定要改变%s吗?', [As_Label, As_Related,
        As_Label])), PChar(Caption), MB_OKCANCEL + MB_ICONQUESTION +
        MB_DEFBUTTON2);
      if Result = IDCANCEL then FieldByName(As_Field).AsString := As_Old;
    end;
end;

procedure TfrmOrganCertMng.CertPrjBeforeEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Fs_OldLevel4 := VarToStr(FieldValues['level4_id']);
    Fs_OldLevel5 := VarToStr(FieldValues['level5_id']);
  end;
end;

procedure TfrmOrganCertMng.prip_CertPrjBeforePost;
var
  ls_PrjId, ls_Level4, ls_Level5: string;
begin
  if not prif_CheckBlank(CertPrj, ['level4_id', 'level5_id', 'apply_date',
    'auth_date', 'end_date'], ['设备类型', '许可级别', '申请日期', '批准日期',
    '有效日期']) then Abort;

  with CertPrj do
  begin
    ls_PrjId := FieldByName('sysid').AsString;
    ls_Level4 := VarToStr(FieldValues['level4_id']);
    ls_Level5 := VarToStr(FieldValues['level5_id']);
  end;

  if Fs_OldLevel4 <> '' then
    if prif_ChangeWarning(CertPrj, [CertPrjModal], ls_Level4,  Fs_OldLevel4,
      'level4_id', '设备类型', LEVEL4TO5WARNING) = IDCANCEL then Abort;

  if (Fs_OldLevel5 <> '') and (ls_Level4 = Fs_OldLevel4) then
    if prif_ChangeWarning(CertPrj, [CertPrjModal], ls_Level5, Fs_OldLevel5,
      'level5_id', '许可级别', LEVEL4TO5WARNING) = IDCANCEL then Abort;

  if ((ls_Level4 <> Fs_OldLevel4) and (Fs_OldLevel4 <> '')) or
    ((ls_Level5 <> Fs_OldLevel5) and (Fs_OldLevel5 <> '')) then
  begin
    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj_modal ' +
      'WHERE prj_sysid = ''%s''', [ls_PrjId]));
    with CertPrjModal do
      if Active then
      begin
        Close;
        Open;
      end;
  end;
end;

procedure TfrmOrganCertMng.CertInfoBeforePost(DataSet: TDataSet);
begin
  prip_CertBeforePost;
end;

procedure TfrmOrganCertMng.CertPrjBeforePost(DataSet: TDataSet);
begin
  prip_CertPrjBeforePost;
end;

procedure TfrmOrganCertMng.CertPrjAfterInsert(DataSet: TDataSet);
var
  ls_AuthOrganId, ls_AuthOrgan: string;
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldValues['cert_sysid'] := CertInfo.FieldValues['sysid'];
    FieldByName('auth_date').AsString := FormatDateTime('yyyy-mm-dd', Now);
  end;

  ls_AuthOrganId := VarToStr(CertInfo.FieldValues['auth_organ_sysid']);
  if ls_AuthOrganId <> '' then
  begin
    ls_AuthOrgan := lcmbAuthOrgan.Text;

    mPrjOrganInfoBak.LoadFromDataSet(mPrjOrganInfo);

    with mPrjOrganInfo do
      if not Locate('auth_organ_sysid', ls_AuthOrganId, []) then
      begin
        Insert;
        FieldByName('auth_organ_sysid').AsString := ls_AuthOrganId;
        FieldByName('auth_organ').AsString := ls_AuthOrgan;
        Post;
      end;

    with DataSet do
      FieldByName('auth_organ_sysid').AsString := ls_AuthOrganId;
  end;
end;

procedure TfrmOrganCertMng.CertPrjModalAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldValues['prj_sysid'] := CertPrj.FieldValues['sysid'];   
  end;
end;

procedure TfrmOrganCertMng.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrganCertMng.bbtnPrjInsertClick(Sender: TObject);
begin
  CertPrj.Insert;
end;

procedure TfrmOrganCertMng.bbtnPrjDeleteClick(Sender: TObject);
begin
  prip_DeleteCertPrj;
end;

procedure TfrmOrganCertMng.prip_DeleteCertPrj;
var
  ls_CertPrjId: string;
begin
  with CertPrj do
  begin
    if (not Active) or IsEmpty then Exit;

    if Application.MessageBox('删除许可证项目将导致相应的许可证项目型式全部' +
      '被删除，您确定要删除当前记录吗?', '确认', MB_OKCANCEL + MB_DEFBUTTON2 +
      MB_ICONQUESTION) = IDCANCEL then Exit;

    ls_CertPrjId := FieldByName('sysid').AsString;
    dmData.adocon.BeginTrans;
    try
      dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj_modal ' +
        'WHERE prj_sysid = ''%s''', [ls_CertPrjId]));
      Delete;
      dmData.adocon.CommitTrans;
    except
      dmData.adocon.RollbackTrans;
      raise;
    end;
  end;
end;

procedure TfrmOrganCertMng.bbtnReqGenerateClick(Sender: TObject);
begin
  prip_GenerateRequirement;
end;

procedure TfrmOrganCertMng.bbtnModalInsertClick(Sender: TObject);
begin
  with CertPrj do if (not Active) or IsEmpty then Exit;
  with CertPrjModal do if Active then Insert;
end;

procedure TfrmOrganCertMng.bbtnModalDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertPrjModal);
end;

procedure TfrmOrganCertMng.grdCertPrjClick(Sender: TObject);
begin
  PostMessage(Handle, CM_GRIDCLICK, 0, Integer(grdCertPrj));
end;

procedure TfrmOrganCertMng.grdCertPrjLevel5EditButtonClick(
  Sender: TObject);
var
  ls_Level4: string;
begin
  ls_Level4 := VarToStr(CertPrj.FieldValues['level4_id']);
  with CertLevel5 do
  begin
    Filter := Format('parent_id = ''%s''', [ls_Level4]);
    Filtered := True;
  end;
end;

procedure TfrmOrganCertMng.grdCertPrjlevel5CloseUp(
  Sender: TObject; var Value: Variant; var Accept: Boolean);
begin
  CertLevel5.Filtered := False;
end;

procedure TfrmOrganCertMng.grdProdRangeprdrange_nameCloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
begin
  CertLevel5.Filtered := False;
end;

procedure TfrmOrganCertMng.pagCertChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  case pagCert.ActivePageIndex of
    0:
      AllowChange := CheckDBState(Self, True, [CertInfo], '必须保存您正在编辑' +
        '的基本信息才能继续操作，是否要立即保存并继续?') in CDS_GO;
    1:
      AllowChange := CheckDBState(Self, True, [CertPrj, CertPrjModal],
        '必须保存您正在编辑的详细信息才能继续操作，是否要立即保存并继续?') in
        CDS_GO;
    2:
      AllowChange := CheckDBState(Self, True, [Requirement], '必须保存您正在' +
        '编辑的评审记录才能继续操作，是否要立即保存并继续?') in CDS_GO;
    3:
      AllowChange := CheckDBState(Self, True, [AuthInfo, CertDoc], '必须保存' +
        '您正在编辑的认证情况及资料情况才能继续操作，是否要立即保存并继续?') in
        CDS_GO;
    4:
      AllowChange := CheckDBState(Self, True, [CertPrd, CertConst],
        '必须保存您正在编辑的工作情况及分包外协情况才能继续操作，是否要立即' +
        '保存并继续?') in CDS_GO;
    5:
      AllowChange := CheckDBState(Self, True, [CertDept, CertPsn], '必须保存' +
        '您正在编辑的部门情况及人员情况才能继续操作，是否要立即保存并继续?') in
        CDS_GO;
    6:
      AllowChange := CheckDBState(Self, True, [CertEquip], '必须保存您正在' +
        '编辑的生成设备及检验仪器情况才能继续操作，是否要立即保存并继续?') in
        CDS_GO;
  end;
end;

procedure TfrmOrganCertMng.CertPrjExit(Sender: TObject);
begin
  if ((ActiveControl = grdRequirement) or (ActiveControl = bbtnReqGenerate) or
    (ActiveControl = grdCertPrjModal) or (ActiveControl = bbtnModalInsert) or
    (ActiveControl = bbtnModalDelete)) and
    (CertPrj.State <> dsBrowse) then CertPrj.Post;
end;

procedure TfrmOrganCertMng.prip_GenerateRequirement;
var
  li_End: Integer;
  ls_Level1, ls_SysId: string;
begin
  with Requirement do
  begin
    if not Active then Exit;

    if not IsEmpty then
      if Application.MessageBox('评审记录已存在。重新生成将导致原有的数据都' +
        '丢失。您确定要重新生成吗?', PChar(Caption), MB_OKCANCEL +
        MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
      
    ls_Level1 := CertInfo.FieldByName('level1_id').AsString;

    if Temp.Active then Temp.Close;
    Temp.SQL.Text := Format('SELECT * FROM device.organ_requirement_templet ' +
      'WHERE level1_id = ''%s'' ORDER BY rec_no', [ls_Level1]);
    Temp.Open;

    ls_SysId := Gf_GenSysId;
    li_End := StrToInt(Copy(ls_SysId, 17, 4));
    ls_SysId := Copy(ls_SysId, 1, 16);

    DisableControls;
    try
      dmData.adocon.BeginTrans;
      try
        while not IsEmpty do Delete;

        Temp.First;
        while not Temp.Eof do
        begin
          Append;
          FieldByName('sysid').AsString := ls_SysId + Format('%.4d', [li_End]);
          FieldValues['cert_sysid'] := CertInfo.FieldValues['sysid'];
          FieldValues['temp_sysid'] := Temp.FieldValues['sysid'];
          FieldValues['rec_no'] := Temp.FieldValues['rec_no'];
          FieldValues['segment'] := Temp.FieldValues['segment'];
          FieldValues['chapter'] := Temp.FieldValues['chapter'];
          FieldValues['item'] := Temp.FieldValues['item'];
          FieldValues['requirement'] := Temp.FieldValues['requirement'];
          FieldValues['examination'] := Temp.FieldValues['examination'];
          FieldValues['estimate'] := Temp.FieldValues['estimate'];
          Post;
          Inc(li_End);
          Temp.Next;
        end;
        dmData.adocon.CommitTrans;
      except
        dmData.adocon.RollbackTrans;
        try
          Close;
          Open;
        except
        end;
        raise;
      end;
    finally
      EnableControls;
    end;

    Temp.Close;
  end;

  with grdRequirement do
  begin
    FullExpand;
    GotoFirst;
  end;
end;

procedure TfrmOrganCertMng.prip_Discard;
var
  ls_CertId: string;
begin
  with CertInfo do
  begin
    if IsEmpty or (State <> dsBrowse) then Exit;
    ls_CertId := FieldByName('sysid').AsString;
  end;

  if Application.MessageBox('作废输入将删除此新增的许可证的全部信息，' +
    '您确定要继续吗?', PChar(Caption), MB_OKCANCEL + MB_ICONQUESTION +
    MB_DEFBUTTON2) = IDCANCEL then Exit;

  dmData.adocon.BeginTrans;
  try
    dmData.adocon.Execute(Format('DELETE FROM device.organ_requirement WHERE ' +
      'EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_requirement.prj_sysid = A.sysid AND EXISTS(' +
      'SELECT * FROM device.organ_cert B WHERE A.cert_sysid = B.sysid ' +
      'AND B.sysid = ''%s''))', [ls_CertId]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj_modal ' +
      'WHERE EXISTS(SELECT * FROM device.organ_cert_prj A WHERE ' +
      'device.organ_cert_prj_modal.prj_sysid = A.sysid AND EXISTS(' +
      'SELECT * FROM device.organ_cert B WHERE A.cert_sysid = B.sysid ' +
      'AND B.sysid = ''%s''))', [ls_CertId]));

    dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_prj WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]));

    CertInfo.Delete;

    dmData.adocon.CommitTrans;
    
    Close;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      Application.MessageBox(PChar('作废输入时出错，错误信息：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmOrganCertMng.bbtnDiscardClick(Sender: TObject);
begin
  prip_Discard;
end;

procedure TfrmOrganCertMng.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  lc_PrevActive: TWinControl;
begin
  lc_PrevActive := ActiveControl;
  if lc_PrevActive <> bbtnClose then
  begin
    ActiveControl := bbtnClose;
    ActiveControl := lc_PrevActive;
  end;

  if not ((Fi_ActMode = AM_OCMADD) and (not Fb_DataChanged)) then
    CanClose := CheckDBState(Self, True, [CertInfo, CertPrj, CertPrjModal,
      Requirement, AuthInfo, CertDoc, CertPrd, CertConst, CertDept, CertPsn,
      CertEquip]) in CDS_GO;

  if CanClose and (Fi_ActMode = AM_OCMADD) and (not CertInfo.IsEmpty) and
      (CertInfo.State = dsBrowse) then
    CanClose := Application.MessageBox('您刚刚新增了一张许可证，新增的许可证' +
      '以后可以更改但不能删除，不过在关闭之前您仍然可以通过作废输入功能放弃' +
      '所输入的所有信息。您确定新增这张许可证吗? ', PChar(Caption),
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK;
end;

procedure TfrmOrganCertMng.CertInfodDataChange(Sender: TObject;
  Field: TField);
begin
  if Field <> nil then Fb_DataChanged := True;
end;

procedure TfrmOrganCertMng.CertPrjModalBeforePost(DataSet: TDataSet);
begin
  if not prif_CheckBlank(CertPrjModal, ['level6_id'], ['设备型式']) then Abort;
end;

procedure TfrmOrganCertMng.lcmbLevel2KeyValueChanged(Sender: TObject);
begin
  PostMessage(Handle, CM_LEVEL2CHANGED, 0, 0);
end;

procedure TfrmOrganCertMng.lcmbLevel3KeyValueChanged(Sender: TObject);
begin
  PostMessage(Handle, CM_LEVEL3CHANGED, 0, 0);
end;

procedure TfrmOrganCertMng.grdCertPrjlevel5Change(Sender: TObject);
begin
  PostMessage(Handle, CM_LEVEL5CHANGED, 0, 0);
end;

procedure TfrmOrganCertMng.grdCertPrjauth_organButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  case AbsoluteIndex of
    0:
      prip_OrganDialog(grdCertPrjauth_organ, CertPrjd, SUPERVISOR_SIGN,
        TfrmOrganMng.Create(nil));
    1: prip_ClearValue(grdCertPrjauth_organ, CertPrj);
  end;
end;

procedure TfrmOrganCertMng.grdCertPrjModalmodal_comButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  prip_OrganDialog(grdCertPrjModalmodal_com, CertPrjModald, 0,
    TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.prip_GetPrjOrganInfo;
var
  ls_CertId: string;
begin
  ls_CertId := VarToStr(CertInfo.FieldValues['sysid']);
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT sysid, name FROM device.organ_baseinfo A ' +
      'WHERE EXISTS(SELECT * FROM device.organ_cert_prj B WHERE ' +
      'A.sysid = B.auth_organ_sysid AND B.cert_sysid = ''%s'')', [ls_CertId]);
    Open;
    while not Eof do
    begin
      mPrjOrganInfo.Append;
      mPrjOrganInfo.FieldValues['auth_organ_sysid'] := FieldValues['sysid'];
      mPrjOrganInfo.FieldValues['auth_organ'] := FieldValues['name'];
      mPrjOrganInfo.Post;
      Next;
    end;
    Close;
    mPrjOrganInfoBak.LoadFromDataSet(mPrjOrganInfo);
  end;
end;

procedure TfrmOrganCertMng.CertPrjAfterCancel(DataSet: TDataSet);
begin
  mPrjOrganInfo.LoadFromDataSet(mPrjOrganInfoBak);
end;

procedure TfrmOrganCertMng.cmbAgentNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_OrganDialog(cmbAgentName, CertInfod, 0, TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.bbtnPrdInsertClick(Sender: TObject);
begin
  CertPrd.Insert;
end;

procedure TfrmOrganCertMng.bbtnPrdDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertPrd);
end;

procedure TfrmOrganCertMng.bbtnDeptInsertClick(Sender: TObject);
begin
  CertDept.Insert;
end;

procedure TfrmOrganCertMng.bbtnDeptDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertDept);
end;

procedure TfrmOrganCertMng.bbtnAuthInsertClick(Sender: TObject);
begin
  AuthInfo.Insert;
end;

procedure TfrmOrganCertMng.bbtnAuthDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(AuthInfo);
end;

procedure TfrmOrganCertMng.bbtnDocInsertClick(Sender: TObject);
begin
  CertDoc.Insert;  
end;

procedure TfrmOrganCertMng.bbtnDocDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertDoc);
end;

procedure TfrmOrganCertMng.bbtnCnsInsertClick(Sender: TObject);
begin
  CertConst.Insert;  
end;

procedure TfrmOrganCertMng.bbtnCnsDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertConst);
end;

procedure TfrmOrganCertMng.bbtnPsnInsertClick(Sender: TObject);
begin
  prip_AddPerson;
end;

procedure TfrmOrganCertMng.bbtnPsnDeleteClick(Sender: TObject);
begin
  prip_DelPerson;
end;

procedure TfrmOrganCertMng.bbtnEqpInsertClick(Sender: TObject);
begin
  CertEquip.Insert;
end;

procedure TfrmOrganCertMng.bbtnEqpDeleteClick(Sender: TObject);
begin
  prip_DeleteRecord(CertEquip);
end;

procedure TfrmOrganCertMng.grdAuthInfoorgan_nameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  prip_OrganDialog(grdAuthInfoorgan_name, AuthInfod, 0,
    TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.grdCertConstorgan_nameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  prip_OrganDialog(grdCertConstorgan_name, CertConstd, 0,
    TfrmOrganMng.Create(nil));
end;

procedure TfrmOrganCertMng.grdAuthInfoClick(Sender: TObject);
begin
  PostMessage(Handle, CM_GRIDCLICK, 0, Integer(grdAuthInfo));
end;

procedure TfrmOrganCertMng.AuthInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldValues['organ_sysid'] := CertInfo.FieldValues['organ_sysid'];
  end;
end;

procedure TfrmOrganCertMng.prip_DeleteRecord(Ac_DataSet: TDataSet);
begin
  with Ac_DataSet do
  begin
    if (not Active) or IsEmpty then Exit;

    if Application.MessageBox('您确定要删除当前记录吗?', '确认',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

    Delete;
  end;
end;

procedure TfrmOrganCertMng.AbortDropDown(Sender: TObject);
begin
  Abort;
end;

procedure TfrmOrganCertMng.prip_LoadAuthInfo;
var
  ls_OrganId: string;
begin
  ls_OrganId := VarToStr(CertInfo.FieldValues['organ_sysid']);
  with AuthInfo do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_authinfo WHERE ' +
      'organ_sysid = ''%s''', [ls_OrganId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertConst;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with CertConst do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_const WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertDept;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with CertDept do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_dept WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertDoc;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with CertDoc do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_doc WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertEquip;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with CertEquip do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_equip WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertPrd;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  with CertPrd do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.organ_cert_prd WHERE ' +
      'cert_sysid = ''%s''', [ls_CertId]);
    Open;
  end;
end;

procedure TfrmOrganCertMng.prip_LoadCertPsn;
var
  ls_CertId: string;
begin
  ls_CertId := CertInfo.FieldByName('sysid').AsString;
  Gp_ProgressHint('正在载入人员信息，请稍候...');
  try
    with CertPsn do
    begin
      if Active then Close;
      SQL.Text := Format('device.usp_getorgancertpsn ''%s''', [ls_CertId]);
      Open;
    end;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmOrganCertMng.prip_ClearValue(Ac_Sender: TdxDBGridButtonColumn;
  Ac_DataSet: TDataSet);
var
  lc_Field: TField;
begin
  with Ac_DataSet, Ac_Sender do
  begin
    if DisableEditor then Exit;

    lc_Field := FieldByName(FieldName);
    if lc_Field.FieldKind = fkLookup then
      lc_Field := FieldByName(lc_Field.KeyFields); 
    Edit;
    lc_Field.Clear;
  end;
end;

procedure TfrmOrganCertMng.pagCertChange(Sender: TObject);
begin
  case pagCert.ActivePageIndex of
    3:
      begin
        if not AuthInfo.Active then prip_LoadAuthInfo;
        if not CertDoc.Active then prip_LoadCertDoc;
      end;
    4:
      begin
        if not CertPrd.Active then prip_LoadCertPrd;
        if not CertConst.Active then prip_LoadCertConst;
      end;
    5:
      begin
        if not CertDept.Active then prip_LoadCertDept;
        if not CertPsn.Active then prip_LoadCertPsn;
      end;
    6: if not CertEquip.Active then prip_LoadCertEquip;
  end;
end;

procedure TfrmOrganCertMng.prip_MoreForManu;
var
  lb_IsManu: Boolean;
begin
  //TODO: To be smart in future
  lb_IsManu := lcmbLevel1.Text = '制造';
  tsAuthDoc.TabVisible := lb_IsManu;
  tsPrdConst.TabVisible := lb_IsManu;
  tsDeptPsn.TabVisible := lb_IsManu;
  tsEquip.TabVisible := lb_IsManu;
end;

procedure TfrmOrganCertMng.prip_AddPerson;
var
  li_i: Integer;
  lc_Args: TStrings;
  lc_Item: TCSComnBridge;
begin
  lc_Args := TStringList.Create;
  try
    lc_Args.Add('');
    lc_Args.Add(VarToStr(CertInfo.FieldValues['organ_sysid']));

    lc_Item := nil;
    for li_i := 0 to Gc_ComnBridges.Count - 1 do
      if Gc_ComnBridges.Items(li_i).Tag = 'TCSPsnAssistant' then
      begin
        lc_Item := Gc_ComnBridges.Items(li_i);
        Break;
      end;

    if lc_Item <> nil then
    begin
      lc_Item.Proc(lc_Args);

      if StrToInt(lc_Args.Strings[0]) = mrOK then
      begin
        dmData.adocon.Execute(Format('INSERT INTO device.organ_cert_psn ' +
          'VALUES(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', NULL)', [Gf_GenSysId,
          CertInfo.FieldByName('sysid').AsString, lc_Args.Strings[1],
          lc_Args.Strings[2], lc_Args.Strings[3]]));

        prip_LoadCertPsn;
      end;
    end;
  finally
    lc_Args.Free;
  end;
end;

procedure TfrmOrganCertMng.prip_DelPerson;
var
  ls_SysId: string;
begin
  with CertPsn do if (not Active) or IsEmpty then Exit;

  if Application.MessageBox('您确定要删除当前记录吗?', '确认', MB_OKCANCEL +
    MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

  dmData.adocon.Execute(Format('DELETE FROM device.organ_cert_psn WHERE ' +
    'sysid = ''%s''', [ls_SysId]));

  prip_LoadCertPsn;
end;

procedure TfrmOrganCertMng.CommonAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('sysid').AsString := Gf_GenSysId;
    FieldValues['cert_sysid'] := CertInfo.FieldValues['sysid']; 
  end;
end;

procedure TfrmOrganCertMng.bbtnExpandClick(Sender: TObject);
begin
  grdRequirement.FullExpand;
end;

procedure TfrmOrganCertMng.bbtnCollapseClick(Sender: TObject);
begin
  grdRequirement.FullCollapse;
end;

end.
