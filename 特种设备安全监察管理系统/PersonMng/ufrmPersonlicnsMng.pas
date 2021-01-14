unit ufrmPersonlicnsMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, CSDBNavigator, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  Grids, DBGridEh, CSRowCountPanel, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  CSCustomdxDateEdit, CSdxDBDateEdit, DBLookupEh, Mask, DBCtrlsEh, dxDBELib,
  DB, ADODB, CSADOQuery, CSScrCtrlChild, CSBarMDIChild, PrnDbgeh,
  CSDBEhGrdStore, CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter,
  CSADOEhGrdFilter, CSDBBase, CSDBFind, CSDBEhGrdFind, dxmdaset, ufrmPersonMng,
  ufrmOrganMng, FR_DSet, FR_DBSet, FR_Class, CSFRptFuncLib;

type
  TfrmPersonlicnsMng = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    paglicnsInfo: TPageControl;
    tsPrjInfo: TTabSheet;
    Splitter1: TSplitter;
    tsEngageInfo: TTabSheet;
    tsCheckInfo: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    bbtnPrjIns: TBitBtn;
    bbtnPrjDel: TBitBtn;
    navprjlist: TCSDBNavigator;
    CSRowCountPanel1: TCSRowCountPanel;
    grdLicnsPrj: TDBGridEh;
    scrbDetail: TScrollBox;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    Splitter3: TSplitter;
    grdEngage: TDBGridEh;
    CSRowCountPanel2: TCSRowCountPanel;
    Panel6: TPanel;
    ScrollBox3: TScrollBox;
    Splitter4: TSplitter;
    grdCheck: TDBGridEh;
    CSRowCountPanel3: TCSRowCountPanel;
    Panel10: TPanel;
    Label12: TLabel;
    eLicnsNo: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lcmbName: TDBLookupComboboxEh;
    lcmbkind: TDBLookupComboboxEh;
    lcmbcategory: TDBLookupComboboxEh;
    lcmborgan: TDBLookupComboboxEh;
    dteDate: TCSdxDBDateEdit;
    lcmbstate: TDBLookupComboboxEh;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnOperate: TBitBtn;
    Panel2: TPanel;
    bbtnEngageIns: TBitBtn;
    bbtnEngageDel: TBitBtn;
    navengagelist: TCSDBNavigator;
    Panel4: TPanel;
    bbtnCheckIns: TBitBtn;
    bbtnCheckDel: TBitBtn;
    navchecklist: TCSDBNavigator;
    Label7: TLabel;
    lcmblicnsprj: TDBLookupComboboxEh;
    Label8: TLabel;
    lcmblicnslevel: TDBLookupComboboxEh;
    Label9: TLabel;
    lcmbtestorgan: TDBLookupComboboxEh;
    Label10: TLabel;
    lcmbauthorgan: TDBLookupComboboxEh;
    Label11: TLabel;
    dteapplydate: TCSdxDBDateEdit;
    Label13: TLabel;
    dteauthdate: TCSdxDBDateEdit;
    Label14: TLabel;
    dteenddate: TCSdxDBDateEdit;
    Label15: TLabel;
    lcmbprjstate: TDBLookupComboboxEh;
    Label16: TLabel;
    elicnsprjname: TDBEditEh;
    Label17: TLabel;
    Label18: TLabel;
    lcmbengorgan: TDBLookupComboboxEh;
    Label21: TLabel;
    Label23: TLabel;
    dteengdate: TCSdxDBDateEdit;
    mengRemark: TdxDBMemo;
    Label19: TLabel;
    Label20: TLabel;
    lcmbchkorgan: TDBLookupComboboxEh;
    Label22: TLabel;
    dtechkdate: TCSdxDBDateEdit;
    Label24: TLabel;
    mchkremark: TdxDBMemo;
    Label25: TLabel;
    echkname: TDBEditEh;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    ListEhGrdStore: TCSDBEhGrdStore;
    SaveDialog: TSaveDialog;
    ListPrint: TPrintDBGridEh;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    psnlicns: TCSADOQuery;
    psnlicnsd: TDataSource;
    licnsprj: TCSADOQuery;
    licnsprjd: TDataSource;
    licnsengage: TCSADOQuery;
    licnsengaged: TDataSource;
    licnschk: TCSADOQuery;
    licnschkd: TDataSource;
    licnskind: TCSADOQuery;
    licnskindd: TDataSource;
    licnscategory: TCSADOQuery;
    licnscategoryd: TDataSource;
    licnsstate: TCSADOQuery;
    licnsstated: TDataSource;
    licnsproject: TCSADOQuery;
    licnsprojectd: TDataSource;
    licnslevel: TCSADOQuery;
    licnsleveld: TDataSource;
    prjstate: TCSADOQuery;
    prjstated: TDataSource;
    Temp: TCSADOQuery;
    mlicnscombak: TdxMemData;
    mlicnscom: TdxMemData;
    mlicnscomd: TDataSource;
    mlicnspsnbak: TdxMemData;
    mlicnspsn: TdxMemData;
    mlicnspsnd: TDataSource;
    mprjorganbak: TdxMemData;
    mprjorgan: TdxMemData;
    mprjorgand: TDataSource;
    mengagecombak: TdxMemData;
    mengagecom: TdxMemData;
    mengagecomd: TDataSource;
    mchkorganbak: TdxMemData;
    mchkorgan: TdxMemData;
    mchkorgand: TDataSource;
    mlicnspsnlicnspsn: TStringField;
    mlicnspsnlicnspsn_name: TStringField;
    mlicnspsnbaklicnspsn: TStringField;
    mlicnspsnbaklicnspsn_name: TStringField;
    mprjorgantestorgan: TStringField;
    mprjorgantestorgan_name: TStringField;
    mprjorganauthorgan: TStringField;
    mprjorganauthorgan_name: TStringField;
    mlicnscomissueorgan: TStringField;
    mlicnscomissueorgan_name: TStringField;
    mlicnscombakissueorgan: TStringField;
    mlicnscombakissueorgan_name: TStringField;
    mprjorganbaktestorgan: TStringField;
    mprjorganbaktestorgan_name: TStringField;
    mprjorganbakauthorgan: TStringField;
    mprjorganbakauthorgan_name: TStringField;
    Label26: TLabel;
    mchkresult: TdxDBMemo;
    licnsprjsysid: TStringField;
    licnsprjpsnlicns_sysid: TStringField;
    licnsprjpsnlicns_prjcode: TStringField;
    licnsprjpsnlicns_prjcode_name: TStringField;
    licnsprjpsnlicns_levelcode: TStringField;
    licnsprjpsnlicns_levelcode_name: TStringField;
    licnsprjpsnlicns_prjname: TStringField;
    licnsprjtest_organ_sysid: TStringField;
    licnsprjapply_date: TStringField;
    licnsprjauth_date: TStringField;
    licnsprjend_date: TStringField;
    licnsprjstate: TStringField;
    licnsprjstate_name: TStringField;
    licnsprjauth_organ_sysid: TStringField;
    licnsengagesysid: TStringField;
    licnsengageperson_sysid: TStringField;
    licnsengagelicns_prj_sysid: TStringField;
    licnsengagelicns_prj_name: TStringField;
    licnsengageorgan_sysid: TStringField;
    licnsengageengage_date: TStringField;
    licnsengageremark: TStringField;
    licnschksysid: TStringField;
    licnschkperson_sysid: TStringField;
    licnschklicns_prj_sysid: TStringField;
    licnschklicns_prj_name: TStringField;
    licnschkcheck_psn_name: TStringField;
    licnschkcheck_result: TStringField;
    licnschkcheck_organ_sysid: TStringField;
    licnschkcheck_date: TStringField;
    licnschkremark: TStringField;
    lcmbengprj: TDBLookupComboboxEh;
    lcmbchkprj: TDBLookupComboboxEh;
    bbtnprjPrint: TBitBtn;
    bbtnengPrint: TBitBtn;
    bbtnchkPrint: TBitBtn;
    frReport: TfrReport;
    frPsnLicns: TfrDBDataSet;
    frLicnsPrj: TfrDBDataSet;
    frLicnsEng: TfrDBDataSet;
    frLicnsChk: TfrDBDataSet;
    mengagecomorgan_sysid: TStringField;
    mengagecomorgan_sysid_name: TStringField;
    mengagecombakorgan_sysid: TStringField;
    mengagecombakorgan_sysid_name: TStringField;
    mchkorgancheck_organ_sysid: TStringField;
    mchkorgancheck_organ_sysid_name: TStringField;
    mchkorganbakcheck_organ_sysid: TStringField;
    mchkorganbakcheck_organ_sysid_name: TStringField;
    mPsnlicns: TdxMemData;
    mLicnsPrj: TdxMemData;
    mLicnsEng: TdxMemData;
    mLicnsChk: TdxMemData;
    mPsnlicnsname: TStringField;
    mPsnlicnscardid: TStringField;
    mPsnlicnslicns_category_name: TStringField;
    mPsnlicnslicnsno: TStringField;
    mPsnlicnsissueorgan_name: TStringField;
    mLicnsPrjlicnsprj_name: TStringField;
    mLicnsPrjtestorgan_name: TStringField;
    mLicnsPrjauthorgan_name: TStringField;
    mLicnsPrjauth_date: TStringField;
    mLicnsPrjend_date: TStringField;
    mlicnspsncardid: TStringField;
    mlicnspsnbakcardid: TStringField;
    mPsnlicnsd: TDataSource;
    mLicnsPrjd: TDataSource;
    mLicnsEngd: TDataSource;
    mLicnsChkd: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure licnsprjlistAfterScroll(DataSet: TDataSet);
    procedure licnsengagelistAfterScroll(DataSet: TDataSet);
    procedure licnschklistAfterScroll(DataSet: TDataSet);
    procedure bbtnSaveClick(Sender: TObject);
    procedure licnsprjAfterInsert(DataSet: TDataSet);
    procedure licnsengageAfterInsert(DataSet: TDataSet);
    procedure licnschkAfterInsert(DataSet: TDataSet);
    procedure bbtnOperateClick(Sender: TObject);
    procedure psnlicnsAfterInsert(DataSet: TDataSet);
    procedure bbtnPrjInsClick(Sender: TObject);
    procedure licnsprjAfterPost(DataSet: TDataSet);
    procedure lcmblicnsprjKeyValueChanged(Sender: TObject);
    procedure lcmblicnslevelKeyValueChanged(Sender: TObject);
    procedure bbtnEngageInsClick(Sender: TObject);
    procedure bbtnCheckInsClick(Sender: TObject);
    procedure lcmbkindKeyValueChanged(Sender: TObject);
    procedure lcmbcategoryKeyValueChanged(Sender: TObject);
    procedure lcmbchkprjKeyValueChanged(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure lcmbNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure bbtnCloseClick(Sender: TObject);
    procedure lcmborganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbtestorganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbauthorganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbengorganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbchkorganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure bbtnEngageDelClick(Sender: TObject);
    procedure bbtnCheckDelClick(Sender: TObject);
    procedure bbtnPrjDelClick(Sender: TObject);
    procedure lcmbengprjKeyValueChanged(Sender: TObject);
    procedure psnlicnsAfterScroll(DataSet: TDataSet);
    procedure bbtnchkPrintClick(Sender: TObject);
    procedure bbtnprjPrintClick(Sender: TObject);
    procedure bbtnengPrintClick(Sender: TObject);
    procedure dteauthdateChange(Sender: TObject);
    procedure licnsprjAfterScroll(DataSet: TDataSet);
    procedure licnsengageAfterScroll(DataSet: TDataSet);
    procedure licnschkAfterScroll(DataSet: TDataSet);
  private
    Fb_DataModified, Fb_GeneralChanged, Fb_DetailChanged,
    Fb_DisableSetChange: Boolean;
    Fi_ActionID: Integer;
    Fs_CurLicnsId, Fs_CurPersonId: String;
    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
    function prif_Validate: Boolean;
    function prif_Save: Boolean;

    procedure prip_IniData;
    procedure prip_IniInterface;

    procedure prip_LoadLicns;

    procedure prip_LoadPrjInfo;
    procedure prip_LoadEngageInfo;
    procedure prip_LoadCheckInfo;

    procedure prip_Issue;
    procedure prip_CallTestMdl;

    procedure prip_PersonDialog(const Ai_Kind, Ai_Category,
      Ai_Prj: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
      Ac_Requestor: TfrmPersonMng);
    procedure prip_GetPersonInfo(strPsnId: string);
    procedure prip_RefreshPersonListSource;
    procedure prip_SelectPerson(const Ai_Kind, Ai_Category,
      Ai_Prj: Integer; const As_Field: string; Ac_Requestor: TfrmPersonMng);

    procedure prip_CompanyDialog_licnscom(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectCompany_licnscom(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_GetComInfo_licnscom(Asa_Ids: array of string);
    procedure prip_RefreshComListSource_licnscom;

    procedure prip_CompanyDialog_prjorgan(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectCompany_prjorgan(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_GetComInfo_prjorgan(Asa_Ids: array of string);
    procedure prip_RefreshComListSource_prjorgan;

    procedure prip_CompanyDialog_engagecom(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectCompany_engagecom(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_GetComInfo_engagecom(Asa_Ids: array of string);
    procedure prip_RefreshComListSource_engagecom;

    procedure prip_CompanyDialog_chkorgan(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng);
    procedure prip_SelectCompany_chkorgan(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_GetComInfo_chkorgan(Asa_Ids: array of string);
    procedure prip_RefreshComListSource_chkorgan;

    procedure prip_GeneragePrjname(prjname, levelname: string);
    procedure prip_Deletelicns;
  public
    procedure pubp_Ini(const Ai_ActionID: Integer; Ac_Args: TStrings);
  end;

var
  frmPersonlicnsMng: TfrmPersonlicnsMng;

implementation

uses
  DBGrids, DateUtils, CSVCLUtils, udmData, CommonLib, ufrmPsnTrainTest,
  ufrmPsnLicnsPrtSet;
{$R *.dfm}

procedure TfrmPersonlicnsMng.prip_IniData;
begin
  with licnskind do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where code_level = 1';
    Open;
  end;

  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where code_level = 2';
    Open;
  end;

  with licnsstate do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_ry_licns_state';
    Open;
  end;

  with licnsproject do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where code_level = 3';
    Open;
  end;

  with licnslevel do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where code_level = 4';
    Open;
  end;

  with prjstate do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_ry_prj_state';
    Open;
  end;

  prip_LoadLicns;

  prip_LoadPrjInfo;
  prip_LoadEngageInfo;
  prip_LoadCheckInfo;
end;

procedure TfrmPersonlicnsMng.prip_IniInterface;
begin
  bbtnSave.Visible := False; bbtnCancel.Visible := False;
  bbtnOperate.Visible :=False;
  bbtnPrjIns.Visible := False; bbtnPrjDel.Visible := False;
  bbtnEngageIns.Visible := False; bbtnEngageDel.Visible := False;
  bbtnCheckIns.Visible := False; bbtnCheckDel.Visible := False;
  lcmbstate.ReadOnly := True; lcmbprjstate.ReadOnly := True;
  lcmbstate.Color := clSilver; lcmbprjstate.Color := clSilver;
  case Fi_ActionID of
    AM_PLMVIEW:   //查看
    begin
      Caption := '资质查看';        //clSilver
      paglicnsinfo.ActivePageIndex := 0;
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmbstate.ReadOnly := True;
      lcmblicnsprj.ReadOnly := True; lcmblicnslevel.ReadOnly := True;
      elicnsprjname.ReadOnly := True; lcmbtestorgan.ReadOnly := True;
      lcmbauthorgan.ReadOnly := True; dteapplydate.ReadOnly := True;
      dteauthdate.ReadOnly := True; dteenddate.ReadOnly := True;
      lcmbprjstate.ReadOnly := True;
      lcmbengprj.ReadOnly := True; lcmbengorgan.ReadOnly := True;
      dteengdate.ReadOnly := True; mengremark.ReadOnly := True;
      lcmbchkprj.ReadOnly := True; lcmbchkorgan.ReadOnly := True;
      echkname.ReadOnly := True; dtechkdate.ReadOnly := True;
      mchkremark.ReadOnly := True;  mchkresult.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmbstate.Color := clSilver;
      lcmblicnsprj.Color := clSilver; lcmblicnslevel.Color := clSilver;
      elicnsprjname.Color := clSilver; lcmbtestorgan.Color := clSilver;
      lcmbauthorgan.Color := clSilver; dteapplydate.Color := clSilver;
      dteauthdate.Color := clSilver; dteenddate.Color := clSilver;
      lcmbprjstate.Color := clSilver;
      lcmbengprj.Color := clSilver; lcmbengorgan.Color := clSilver;
      dteengdate.Color := clSilver; mengremark.Color := clSilver;
      lcmbchkprj.Color := clSilver; lcmbchkorgan.Color := clSilver;
      echkname.Color := clSilver; dtechkdate.Color := clSilver;
      mchkremark.Color := clSilver;  mchkresult.Color := clSilver;
    end;
    AM_PLMLOGI:   //持证登记
    begin
      Caption := '持证登记';
      paglicnsinfo.ActivePageIndex := 0;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      bbtnOperate.Visible := True; bbtnOperate.Caption := '新证';
      bbtnPrjIns.Visible := True; bbtnPrjDel.Visible := True;
      bbtnEngageIns.Visible := True; bbtnEngageDel.Visible := True;
      bbtnCheckIns.Visible := True; bbtnCheckDel.Visible := True;
    end;
    AM_PLMAPPL:   //项目申请
    begin
      Caption := '项目申请';
      paglicnsinfo.ActivePageIndex := 0;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      bbtnOperate.Visible := True; bbtnOperate.Caption := '新证';
      lcmbtestorgan.ReadOnly := True; lcmbauthorgan.ReadOnly := True;
      dteauthdate.ReadOnly := True; dteenddate.ReadOnly := True;
      lcmbengprj.ReadOnly := True; lcmbengorgan.ReadOnly := True;
      dteengdate.ReadOnly := True; mengremark.ReadOnly := True;
      lcmbchkprj.ReadOnly := True; lcmbchkorgan.ReadOnly := True;
      echkname.ReadOnly := True; dtechkdate.ReadOnly := True;
      mchkremark.ReadOnly := True; mchkresult.ReadOnly := True;
      //
      lcmbtestorgan.Color := clSilver; lcmbauthorgan.Color := clSilver;
      dteauthdate.Color := clSilver; dteenddate.Color := clSilver;
      lcmbengprj.Color := clSilver; lcmbengorgan.Color := clSilver;
      dteengdate.Color := clSilver; mengremark.Color := clSilver;
      lcmbchkprj.Color := clSilver; lcmbchkorgan.Color := clSilver;
      echkname.Color := clSilver; dtechkdate.Color := clSilver;
      mchkremark.Color := clSilver; mchkresult.Color := clSilver;
      bbtnPrjIns.Visible := True; bbtnPrjDel.Visible := True;
    end;
    AM_PLMISSU:   //项目审批
    begin
      Caption := '项目审批';
      paglicnsinfo.ActivePageIndex := 0;
      bbtnSave.Visible := True; bbtnSave.Caption := '发证';
      bbtnCancel.Visible := True; bbtnOperate.Width := 80;
      bbtnOperate.Visible :=True; bbtnOperate.Caption := '考核情况';
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmbstate.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmbstate.Color := clSilver;
      lcmblicnsprj.ReadOnly := True; lcmblicnslevel.ReadOnly := True;
      elicnsprjname.ReadOnly := True; lcmbtestorgan.ReadOnly := True;
      dteapplydate.ReadOnly := True; lcmbprjstate.ReadOnly := True;
      lcmbengprj.ReadOnly := True; lcmbengorgan.ReadOnly := True;
      dteengdate.ReadOnly := True; mengremark.ReadOnly := True;
      lcmbchkprj.ReadOnly := True; lcmbchkorgan.ReadOnly := True;
      echkname.ReadOnly := True; dtechkdate.ReadOnly := True;
      mchkremark.ReadOnly := True;  mchkresult.ReadOnly := True;
      //
      lcmblicnsprj.Color := clSilver; lcmblicnslevel.Color := clSilver;
      elicnsprjname.Color := clSilver; lcmbtestorgan.Color := clSilver;
      dteapplydate.Color := clSilver; lcmbprjstate.Color := clSilver;
      lcmbengprj.Color := clSilver; lcmbengorgan.Color := clSilver;
      dteengdate.Color := clSilver; mengremark.Color := clSilver;
      lcmbchkprj.Color := clSilver; lcmbchkorgan.Color := clSilver;
      echkname.Color := clSilver; dtechkdate.Color := clSilver;
      mchkremark.Color := clSilver;  mchkresult.Color := clSilver;
    end;
    AM_PLMLOGO:   //证书吊销
    begin
      Caption := '证书吊销';
      paglicnsinfo.ActivePageIndex := 0; lcmbstate.Color := clSkyBlue;
      lcmbstate.ReadOnly := False;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      bbtnOperate.Visible := True; bbtnOperate.Caption := '删除';
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmblicnsprj.ReadOnly := True; lcmblicnslevel.ReadOnly := True;
      elicnsprjname.ReadOnly := True; lcmbtestorgan.ReadOnly := True;
      lcmbauthorgan.ReadOnly := True; dteapplydate.ReadOnly := True;
      dteauthdate.ReadOnly := True; dteenddate.ReadOnly := True;
      lcmbprjstate.ReadOnly := True;
      lcmbengprj.ReadOnly := True; lcmbengorgan.ReadOnly := True;
      dteengdate.ReadOnly := True; mengremark.ReadOnly := True;
      lcmbchkprj.ReadOnly := True; lcmbchkorgan.ReadOnly := True;
      echkname.ReadOnly := True; dtechkdate.ReadOnly := True;
      mchkremark.ReadOnly := True;  mchkresult.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmblicnsprj.Color := clSilver; lcmblicnslevel.Color := clSilver;
      elicnsprjname.Color := clSilver; lcmbtestorgan.Color := clSilver;
      lcmbauthorgan.Color := clSilver; dteapplydate.Color := clSilver;
      dteauthdate.Color := clSilver; dteenddate.Color := clSilver;
      lcmbprjstate.Color := clSilver;
      lcmbengprj.Color := clSilver; lcmbengorgan.Color := clSilver;
      dteengdate.Color := clSilver; mengremark.Color := clSilver;
      lcmbchkprj.Color := clSilver; lcmbchkorgan.Color := clSilver;
      echkname.Color := clSilver; dtechkdate.Color := clSilver;
      mchkremark.Color := clSilver;  mchkresult.Color := clSilver;
    end;
    AM_PLMUPDA:   //项目变更
    begin
      Caption := '项目变更';
      paglicnsinfo.ActivePageIndex := 0;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      bbtnPrjDel.Visible := True;
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmbstate.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmbstate.Color := clSilver;
      lcmbprjstate.ReadOnly := False;
      lcmbprjstate.Color := clWindow;
    end;
    AM_PLMENGA:   //聘用情况
    begin
      Caption := '聘用情况';
      paglicnsinfo.ActivePageIndex := 1;
      bbtnEngageIns.Visible :=True; bbtnEngageDel.Visible := True;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmbstate.ReadOnly := True;
      lcmblicnsprj.ReadOnly := True; lcmblicnslevel.ReadOnly := True;
      elicnsprjname.ReadOnly := True; lcmbtestorgan.ReadOnly := True;
      lcmbauthorgan.ReadOnly := True; dteapplydate.ReadOnly := True;
      dteauthdate.ReadOnly := True; dteenddate.ReadOnly := True;
      lcmbprjstate.ReadOnly := True;
      lcmbchkprj.ReadOnly := True; lcmbchkorgan.ReadOnly := True;
      echkname.ReadOnly := True; dtechkdate.ReadOnly := True;
      mchkremark.ReadOnly := True;  mchkresult.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmbstate.Color := clSilver;
      lcmblicnsprj.Color := clSilver; lcmblicnslevel.Color := clSilver;
      elicnsprjname.Color := clSilver; lcmbtestorgan.Color := clSilver;
      lcmbauthorgan.Color := clSilver; dteapplydate.Color := clSilver;
      dteauthdate.Color := clSilver; dteenddate.Color := clSilver;
      lcmbprjstate.Color := clSilver;
      lcmbchkprj.Color := clSilver; lcmbchkorgan.Color := clSilver;
      echkname.Color := clSilver; dtechkdate.Color := clSilver;
      mchkremark.Color := clSilver;  mchkresult.Color := clSilver;
    end;
    AM_PLMCHEC:   //项目审查
    begin
      Caption := '审查备案';
      paglicnsinfo.ActivePageIndex := 2;
      bbtnCheckIns.Visible := True; bbtnCheckDel.Visible := True;
      bbtnSave.Visible := True; bbtnCancel.Visible := True;
      elicnsno.ReadOnly := True; lcmbname.ReadOnly := True;
      lcmbkind.ReadOnly := True; lcmbcategory.ReadOnly := True;
      lcmborgan.ReadOnly := True; dtedate.ReadOnly := True;
      lcmbstate.ReadOnly := True;
      lcmblicnsprj.ReadOnly := True; lcmblicnslevel.ReadOnly := True;
      elicnsprjname.ReadOnly := True; lcmbtestorgan.ReadOnly := True;
      lcmbauthorgan.ReadOnly := True; dteapplydate.ReadOnly := True;
      dteauthdate.ReadOnly := True; dteenddate.ReadOnly := True;
      lcmbprjstate.ReadOnly := True;
      lcmbengprj.ReadOnly := True; lcmbengorgan.ReadOnly := True;
      dteengdate.ReadOnly := True; mengremark.ReadOnly := True;
      //
      elicnsno.Color := clSilver; lcmbname.Color := clSilver;
      lcmbkind.Color := clSilver; lcmbcategory.Color := clSilver;
      lcmborgan.Color := clSilver; dtedate.Color := clSilver;
      lcmbstate.Color := clSilver;
      lcmblicnsprj.Color := clSilver; lcmblicnslevel.Color := clSilver;
      elicnsprjname.Color := clSilver; lcmbtestorgan.Color := clSilver;
      lcmbauthorgan.Color := clSilver; dteapplydate.Color := clSilver;
      dteauthdate.Color := clSilver; dteenddate.Color := clSilver;
      lcmbprjstate.Color := clSilver;
      lcmbengprj.Color := clSilver; lcmbengorgan.Color := clSilver;
      dteengdate.Color := clSilver; mengremark.Color := clSilver;
    end;
  end;
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
  Fb_GeneralChanged := False;
  Fb_DetailChanged := False;
  Fb_DisableSetChange := False;
  Fi_ActionID := 0;
  Fs_CurLicnsId := '';
  Fs_CurPersonId := '';
end;

procedure TfrmPersonlicnsMng.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmPersonlicnsMng.prip_LoadCheckInfo;
var
  ls_psnlicnsId : string;
begin
  ls_psnlicnsId := psnlicns.FieldByName('sysid').AsString;
  with licnschk do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_check_prj WHERE ' +
      'EXISTS(SELECT * FROM device.person_license_prj ' +
      'WHERE device.person_license_prj.sysid = device.person_check_prj.licns_prj_sysid ' +
      'AND device.person_license_prj.psnlicns_sysid = ''%s'')', [ls_psnlicnsId]);
    Open;
    if not IsEmpty then
    begin
      prip_GetComInfo_chkorgan([VarToStr(FieldValues['check_organ_sysid'])]);
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_LoadEngageInfo;
var
  ls_psnlicnsId : string;
begin
  ls_psnlicnsId := psnlicns.FieldByName('sysid').AsString;
  with licnsengage do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_engage_prj WHERE ' +
      'EXISTS(SELECT * FROM device.person_license_prj ' +
      'WHERE device.person_license_prj.sysid = device.person_engage_prj.licns_prj_sysid ' +
      'AND device.person_license_prj.psnlicns_sysid = ''%s'')', [ls_psnlicnsId]);
    Open;
    if not IsEmpty then
    begin
      prip_GetComInfo_engagecom([VarToStr(FieldValues['organ_sysid'])]);
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_LoadPrjInfo;
var
  ls_psnlicnsId : string;
begin
  prip_GetPersonInfo(Fs_CurPersonId);

  ls_psnlicnsId := psnlicns.FieldByName('sysid').AsString;
  with licnsprj do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_license_prj WHERE ' +
      'psnlicns_sysid = ''%s''', [ls_psnlicnsId]);
    Open;
    if not IsEmpty then
    begin
      prip_GetComInfo_prjorgan([VarToStr(FieldValues['test_organ_sysid']),
        VarToStr(FieldValues['auth_organ_sysid'])]);
    end;
  end;
end;

procedure TfrmPersonlicnsMng.licnsprjlistAfterScroll(DataSet: TDataSet);
begin
  prip_LoadPrjInfo;
end;

procedure TfrmPersonlicnsMng.licnsengagelistAfterScroll(DataSet: TDataSet);
begin
  prip_LoadEngageInfo;
end;

procedure TfrmPersonlicnsMng.licnschklistAfterScroll(DataSet: TDataSet);
begin
  prip_LoadCheckInfo;
end;

procedure TfrmPersonlicnsMng.bbtnSaveClick(Sender: TObject);
begin
  case Fi_ActionID of
    AM_PLMLOGI, AM_PLMAPPL, AM_PLMUPDA, AM_PLMENGA, AM_PLMCHEC:
    begin
      if Application.MessageBox('您确定上述数据输入无误吗?', PChar(Caption),
          MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
        prif_Save;
    end;
    AM_PLMLOGO:
    begin
      prif_Save;
      // TODO: 把证书中所有的项目 的状态设 为 ‘注销’
    end;
    AM_PLMISSU:
    begin
      if prif_Validate then prip_Issue;
    end;
  end;
end;

function TfrmPersonlicnsMng.prif_Save: Boolean;
begin
  Result := False;

  Gp_ProgressHint('正在保存数据，请稍候...');
  dmData.adocon.BeginTrans;
  try
    with psnlicns do
    begin
      Fb_DataModified := True;
      if State <> dsBrowse then Post;
    end;

    with licnsprj do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
    end;

    with licnsengage do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
    end;

    with licnschk do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
    end;

    dmData.adocon.CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      try
        with psnlicns do
        begin
          if State = dsBrowse then Requery;
        end;
      except
      end;
      Application.MessageBox(PChar('执行保存时出错，错误原因：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
  Gp_ProgressHint;
end;
procedure TfrmPersonlicnsMng.licnsprjAfterInsert(DataSet: TDataSet);
//var
//  li_prtline : Integer;
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
  DataSet.FieldByName('psnlicns_sysid').AsString := psnlicns.FieldByName('sysid').AsString;
  DataSet.FieldByName('psnlicns_prjname').AsString := '';
  case Fi_ActionID of
    AM_PLMLOGI:
      DataSet.FieldByName('state').AsString := PLS_NORMAL;
    AM_PLMAPPL:
      DataSet.FieldByName('state').AsString := PLS_APPLY;
  end;

  //打印控制
//  li_prtline := psnlicns.FieldByName('prtprjline').AsInteger;
//  if li_prtline = 12 then        //一本证书已打印完成
//    li_prtline := 1              //设置为1
//  else
//    li_prtline := li_prtline + 1;
//  if psnlicns.State <> dsEdit then
//    psnlicns.Edit;
//  psnlicns.FieldByName('prtprjline').AsInteger := li_prtline;  //项目打印行数
//  psnlicns.Post;
end;

procedure TfrmPersonlicnsMng.licnsengageAfterInsert(DataSet: TDataSet);
//var
//  li_Engline : Integer;
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
  DataSet.FieldByName('person_sysid').AsString := Fs_CurPersonId;

  //打印控制
//  li_Engline := psnlicns.FieldByName('prtengline').AsInteger;
//  if li_Engline = 8 then        //一本证书已打印完成
//    li_Engline := 1              //设置为1
//  else
//    li_Engline := li_Engline + 1;

//  if psnlicns.State <> dsEdit then
//    psnlicns.Edit;
//  psnlicns.FieldByName('prtengline').AsInteger := li_Engline;  //聘用打印行数
//  psnlicns.Post;
end;

procedure TfrmPersonlicnsMng.licnschkAfterInsert(DataSet: TDataSet);
//var
//  li_Chkline : Integer;
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
  DataSet.FieldByName('person_sysid').AsString := Fs_CurPersonId;

    //打印控制
//  li_Chkline := psnlicns.FieldByName('prtchkline').AsInteger;
//  if li_Chkline = 8 then        //一本证书已打印完成
//    li_Chkline := 1              //设置为1
//  else
//    li_Chkline := li_Chkline + 1;
//  if psnlicns.State <> dsEdit then
//    psnlicns.Edit;
//  psnlicns.FieldByName('prtchkline').AsInteger := li_Chkline;  //审查打印行数
//  psnlicns.Post;
end;

procedure TfrmPersonlicnsMng.psnlicnsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
  prip_GetPersonInfo(Fs_CurPersonId);
  DataSet.FieldByName('person_sysid').AsString := Fs_CurPersonId;
  if (Fi_ActionID = AM_PLMLOGI) or (Fi_ActionID = AM_PLMAPPL) then
  begin
    DataSet.FieldByName('state').AsString := PLS_LICNSSTATE;
  end;

  //打印控制
//  DataSet.FieldByName('prtfstflag').AsInteger := 0;  //首页打印标志
//  DataSet.FieldByName('prtprjline').AsInteger := 0;  //项目打印行数
//  DataSet.FieldByName('prtengline').AsInteger := 0;  //聘用情况打印行数
//  DataSet.FieldByName('prtchkline').AsInteger := 0;  //审查备案打印行数
end;

procedure TfrmPersonlicnsMng.bbtnOperateClick(Sender: TObject);
begin
  case Fi_ActionID of
    AM_PLMLOGI:
    begin
      psnlicns.Insert;
    end;
    AM_PLMAPPL:
    begin
      psnlicns.Insert;
    end;
    AM_PLMISSU:
    begin
      prip_CallTestMdl;
    end;
    AM_PLMLOGO:
    begin
      prip_Deletelicns;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_PersonDialog(const Ai_Kind, Ai_Category,
  Ai_Prj: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmPersonMng);
begin
  with psnlicnsd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectPerson(Ai_Kind, Ai_Category, Ai_Prj, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mlicnspsnd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
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
      'SELECT sysid, name, cardid, 1 AS ix FROM device.person_baseinfo ' +
      'WHERE sysid = ''%s''', [strPsnId]);
    Open;
    if not mlicnspsn.IsEmpty then mlicnspsn.Delete;
    mlicnspsn.Insert;
    
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mlicnspsn.Fields[li_Index * 3 - 2].Value := FieldValues['sysid'];
      mlicnspsn.Fields[li_Index * 3 - 1].Value := FieldValues['name'];
      mlicnspsn.Fields[li_Index * 3].Value := FieldValues['cardid'];
      Next;
    end;
    mlicnspsn.Post;
    mlicnspsnBak.LoadFromDataSet(mlicnspsn);
    Close;
  end;
  prip_RefreshPersonListSource;
end;

procedure TfrmPersonlicnsMng.prip_RefreshPersonListSource;
begin
  with lcmbName do
  begin
    ListSource := nil;
    ListSource := mlicnspsnd;
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
  with lc_Person, psnlicns do
  begin
    if VarToStr(FieldValues[As_Field]) <> '' then
      ls_PrevId := FieldByName(As_Field).AsString;

    lc_Arg := TStringList.Create;
    lc_Arg.Add(ls_PrevId);
    try
      pubp_ini(True, lc_Arg);
      lc_Rc := ShowModal;
      Self.Update;
    finally
      lc_Arg.Free;
    end;

    if (lc_Rc = mrOK) and (ls_PrevId <> CurPersonId) then
    begin
      li_Index := mlicnspsn.FieldByName(As_Field).Index;
      mlicnspsn.Edit;
      mlicnspsn.Fields[li_Index].AsString := CurPersonId;
      mlicnspsn.Fields[li_Index + 1].AsString := CurPersonName;
      mlicnspsn.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurPersonId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.bbtnPrjInsClick(Sender: TObject);
begin
  licnsprj.Insert;
end;

procedure TfrmPersonlicnsMng.prip_LoadLicns;
begin
  with psnlicns do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_license WHERE ' +
        'person_sysid = ''%s''',[Fs_CurPersonId]);
    Open;
    if not IsEmpty then
    begin
      Locate('sysid', Fs_CurLicnsId, []);
      prip_GetComInfo_licnscom([VarToStr(FieldValues['organ_sysid'])]);
    end;
  end;
end;

procedure TfrmPersonlicnsMng.licnsprjAfterPost(DataSet: TDataSet);
var
  ls_LicnsPrjId : string;
begin
  ls_LicnsPrjId:= DataSet.FieldByName('sysid').AsString;
end;

procedure TfrmPersonlicnsMng.lcmblicnsprjKeyValueChanged(Sender: TObject);
var
  ls_prjname, ls_levelname : string;
  ls_Licnsprj: string;
begin
  ls_prjname := lcmblicnsprj.Text ;
  ls_levelname := lcmblicnslevel.Text ;
  prip_GeneragePrjname(ls_prjname,ls_levelname);

  ls_Licnsprj := VarToStr(lcmblicnsprj.KeyValue);
  with licnslevel do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE code_level = 4 and parent_id = ''%s''', [ls_Licnsprj]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.lcmblicnslevelKeyValueChanged(
  Sender: TObject);
var
  ls_prjname, ls_levelname : string;
begin
  ls_prjname := lcmblicnsprj.Text ;
  ls_levelname := lcmblicnslevel.Text ;
  prip_GeneragePrjname(ls_prjname,ls_levelname);
end;

procedure TfrmPersonlicnsMng.prip_GeneragePrjname(prjname,
  levelname: string);
begin
  with licnsprj do
    if State in [dsEdit, dsInsert] then
      FieldByName('psnlicns_prjname').AsString := prjname + levelname;
end;

procedure TfrmPersonlicnsMng.bbtnEngageInsClick(Sender: TObject);
begin
  licnsengage.Insert;
end;

procedure TfrmPersonlicnsMng.bbtnCheckInsClick(Sender: TObject);
begin
  licnschk.Insert;
end;

procedure TfrmPersonlicnsMng.lcmbkindKeyValueChanged(Sender: TObject);
var
  ls_LicnsKind: string;
begin
  ls_LicnsKind := VarToStr(lcmbkind.KeyValue);
  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE code_level = 2 and parent_id = ''%s''', [ls_LicnsKind]);
    Open;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbcategoryKeyValueChanged(Sender: TObject);
var
  ls_LicnsCategory: string;
begin
  ls_LicnsCategory := VarToStr(lcmbcategory.KeyValue);
  with licnsproject do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'WHERE code_level = 3 and parent_id = ''%s''', [ls_LicnsCategory]);
    Open;
  end;

  with psnlicns do
    if VarToStr(lcmbcategory.KeyValue) = PLS_WELDER then
    begin
      lcmblicnsprj.Enabled := False;
      lcmblicnslevel.Enabled := False;
    end
    else
    begin
      lcmblicnsprj.Enabled := True;
      lcmblicnslevel.Enabled := True;
    end;
end;

function TfrmPersonlicnsMng.prif_CheckBlank(
  Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with licnsprj do
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

function TfrmPersonlicnsMng.prif_Validate: Boolean;
begin
  with licnsprj do
    Result := prif_CheckBlank([FieldByName('auth_organ_sysid'),
     FieldByName('psnlicns_prjname'),
     FieldByName('auth_date'), FieldByName('end_date')]);
end;

procedure TfrmPersonlicnsMng.prip_Issue;
var
  li_Result: Integer;
  ls_CurPsnId : string;
  ls_CurLcnsPrjId : string;
  ls_CurLcnsKind : string;
  ls_CurLcnsCategory : string;
  ls_CurLcnsPrj : string;
  ls_CurLcnsLevel : string;
  ls_CurLcnsPrjName : string;
  ls_ConfirmOrganId : string;
  ls_Passdate : string;
  ls_Enddate : string;
begin

  with licnsprj do
  begin
    ls_CurPsnId := psnlicns.FieldByName('person_sysid').AsString;
    ls_CurLcnsPrjId := FieldByName('sysid').AsString;
    ls_CurLcnsKind := psnlicns.FieldByName('licns_kind').AsString;
    ls_CurLcnsCategory := psnlicns.FieldByName('licns_category').AsString;
    ls_CurLcnsPrj := FieldByName('psnlicns_prjcode').AsString;
    ls_CurLcnsLevel := FieldByName('psnlicns_levelcode').AsString;
    ls_CurLcnsPrjName := FieldByName('psnlicns_prjname').AsString;
    ls_ConfirmOrganId := FieldByName('auth_organ_sysid').AsString;
    ls_Passdate := FieldByName('auth_date').AsString;
    ls_Enddate := FieldByName('end_date').AsString;

    //PLS_APPLY = '02'; {项目申请}
    //PLS_RETEST = '03'; {项目重考}  只有在此两种状态下，才能调用 发证 功能
    if (FieldByName('state').AsString <> PLS_APPLY) and
    (FieldByName('state').AsString <> PLS_RETEST) then
    begin
      Application.MessageBox('此项目的状态不允许发证！', PChar(Caption),
       MB_OK + MB_ICONWARNING);
      Abort;
    end;
  end;

  if Application.MessageBox('您确定要为此项目发证吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_issuelicense ''%s'', ''%s'', ''%s'', ' +
      '''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''',
      [ls_CurPsnId, ls_CurLcnsPrjId, ls_CurLcnsKind, ls_CurLcnsCategory,
      ls_CurLcnsPrj, ls_CurLcnsLevel, ls_CurLcnsPrjName, ls_ConfirmOrganId,
      ls_Passdate, ls_Enddate]);
    Open;
    li_Result := Fields[0].AsInteger;
    Close;
  end;

  if li_Result = 1 then
  begin
    Application.MessageBox('发证成功！', PChar(Caption), MB_OK + MB_ICONWARNING);
    prip_LoadPrjInfo;
  end
  else
    Application.MessageBox('发证未成功！', PChar(Caption), MB_OK + MB_ICONWARNING);

end;

procedure TfrmPersonlicnsMng.lcmbchkprjKeyValueChanged(Sender: TObject);
begin
  with licnschk do
    if State in [dsEdit, dsInsert] then
      FieldByName('licns_prj_name').AsString := lcmbchkprj.Text ;
end;

procedure TfrmPersonlicnsMng.bbtnCancelClick(Sender: TObject);
begin
  Gp_ProgressHint('正在取消，请稍候...');
  try
    licnsprj.CancelBatch;
    licnsengage.CancelBatch;
    licnschk.CancelBatch;
    with psnlicns do
    begin
      if State <> dsBrowse then Cancel;
    end;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmPersonlicnsMng.lcmbNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_PersonDialog(0, 0, 0, lcmbName, TfrmPersonMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.prip_CompanyDialog_chkorgan(
  const Ai_Category: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmOrganMng);
begin
  with licnschkd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany_chkorgan(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mchkorgand;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_CompanyDialog_engagecom(
  const Ai_Category: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmOrganMng);
begin
  with licnsengaged do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany_engagecom(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mengagecomd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_CompanyDialog_licnscom(
  const Ai_Category: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmOrganMng);
begin
  with psnlicnsd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany_licnscom(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mlicnscomd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_CompanyDialog_prjorgan(
  const Ai_Category: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmOrganMng);
begin
  with licnsprjd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany_prjorgan(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mprjorgand;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPersonlicnsMng.prip_GetComInfo_chkorgan(
  Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0]]);
    Open;
    if not mchkorgan.IsEmpty then mchkorgan.Delete;
    mchkorgan.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mchkorgan.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mchkorgan.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mchkorgan.Post;
    mchkorganBak.LoadFromDataSet(mchkorgan);
    Close;
  end;
  prip_RefreshComListSource_chkorgan;
end;

procedure TfrmPersonlicnsMng.prip_GetComInfo_engagecom(
  Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0]]);
    Open;
    if not mengagecom.IsEmpty then mengagecom.Delete;
    mengagecom.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mengagecom.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mengagecom.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mengagecom.Post;
    mengagecomBak.LoadFromDataSet(mengagecom);
    Close;
  end;
  prip_RefreshComListSource_engagecom;
end;

procedure TfrmPersonlicnsMng.prip_GetComInfo_licnscom(
  Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0]]);
    Open;
    if not mlicnscom.IsEmpty then mlicnscom.Delete;
    mlicnscom.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mlicnscom.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mlicnscom.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mlicnscom.Post;
    mlicnscomBak.LoadFromDataSet(mlicnscom);
    Close;
  end;
  prip_RefreshComListSource_licnscom;
end;

procedure TfrmPersonlicnsMng.prip_GetComInfo_prjorgan(
  Asa_Ids: array of string);
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
    if not mprjorgan.IsEmpty then mprjorgan.Delete;
    mprjorgan.Insert;
    while not Eof do
    begin
      li_Index := FieldByName('ix').AsInteger;
      mprjorgan.Fields[li_Index * 2 - 1].Value := FieldValues['sysid'];
      mprjorgan.Fields[li_Index * 2].Value := FieldValues['name'];
      Next;
    end;
    mprjorgan.Post;
    mprjorganBak.LoadFromDataSet(mprjorgan);
    Close;
  end;
  prip_RefreshComListSource_prjorgan;
end;

procedure TfrmPersonlicnsMng.prip_RefreshComListSource_chkorgan;
begin
  with lcmbchkOrgan do
  begin
    ListSource := nil;
    ListSource := mchkorgand;
  end;
end;

procedure TfrmPersonlicnsMng.prip_RefreshComListSource_engagecom;
begin
  with lcmbengOrgan do
  begin
    ListSource := nil;
    ListSource := mengagecomd;
  end;
end;

procedure TfrmPersonlicnsMng.prip_RefreshComListSource_licnscom;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mlicnscomd;
  end;
end;

procedure TfrmPersonlicnsMng.prip_RefreshComListSource_prjorgan;
begin
  with lcmbtestOrgan do
  begin
    ListSource := nil;
    ListSource := mprjorgand;
  end;
  with lcmbauthOrgan do
  begin
    ListSource := nil;
    ListSource := mprjorgand;
  end;
end;

procedure TfrmPersonlicnsMng.prip_SelectCompany_chkorgan(
  const Ai_Category: Integer; const As_Field: string;
  Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company, licnschk do
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
      li_Index := mchkorgan.FieldByName(As_Field).Index;
      mchkorgan.Edit;
      mchkorgan.Fields[li_Index].AsString := CurOrganId;
      mchkorgan.Fields[li_Index + 1].AsString := CurOrganName;
      mchkorgan.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_SelectCompany_engagecom(
  const Ai_Category: Integer; const As_Field: string;
  Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
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

    if (lc_Rc = mrOK) and (ls_PrevId <> CurOrganId) then
    begin
      li_Index := mengagecom.FieldByName(As_Field).Index;
      mengagecom.Edit;
      mengagecom.Fields[li_Index].AsString := CurOrganId;
      mengagecom.Fields[li_Index + 1].AsString := CurOrganName;
      mengagecom.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_SelectCompany_licnscom(
  const Ai_Category: Integer; const As_Field: string;
  Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company, psnlicns do
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
      li_Index := mlicnscom.FieldByName(As_Field).Index;
      mlicnscom.Edit;
      mlicnscom.Fields[li_Index].AsString := CurOrganId;
      mlicnscom.Fields[li_Index + 1].AsString := CurOrganName;
      mlicnscom.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.prip_SelectCompany_prjorgan(
  const Ai_Category: Integer; const As_Field: string;
  Ac_Requestor: TfrmOrganMng);
var
  li_Index: Integer;
  ls_PrevId: string;
  lc_Arg: TStrings;
  lc_Rc: TModalResult;
  lc_Company: TfrmOrganMng;
begin
  ls_PrevId := '';
  lc_Company := Ac_Requestor;
  with lc_Company, licnsprj do
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
      li_Index := mprjorgan.FieldByName(As_Field).Index;
      mprjorgan.Edit;
      mprjorgan.Fields[li_Index].AsString := CurOrganId;
      mprjorgan.Fields[li_Index + 1].AsString := CurOrganName;
      mprjorgan.Post;

      if State = dsBrowse then if IsEmpty then Insert else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmPersonlicnsMng.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPersonlicnsMng.prip_CallTestMdl;
var
  lc_Arg: TStrings;
  lc_PsnTrainTest: TfrmPsnTrainTest;
begin

  lc_PsnTrainTest := TfrmPsnTrainTest.Create(nil);
  with lc_PsnTrainTest do
    try
      lc_Arg := TStringList.Create;

      //参数数组[0] 资质证书ID
      lc_Arg.Add(Fs_CurPersonId);
      //参数数组[1] 人员系统ID
      lc_Arg.Add(Fs_CurLicnsId);
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

procedure TfrmPersonlicnsMng.lcmborganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog_licnscom((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbtestorganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog_prjorgan(ASSES_SIGN, lcmbtestOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbauthorganEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  prip_CompanyDialog_prjorgan((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbauthOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbengorganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog_engagecom(0, lcmbengOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.lcmbchkorganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog_chkorgan((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbchkOrgan, TfrmOrganMng.Create(nil));
end;

procedure TfrmPersonlicnsMng.bbtnEngageDelClick(Sender: TObject);
begin
  licnsengage.Delete;
end;

procedure TfrmPersonlicnsMng.bbtnCheckDelClick(Sender: TObject);
begin
  licnschk.Delete;
end;

procedure TfrmPersonlicnsMng.bbtnPrjDelClick(Sender: TObject);
var
  li_Result : Integer;
  ls_PsnLicnsPrjId : string;
begin
  //Todo: 检查此项目是否有被聘用或审查记录，有则原则上不于删除
  ls_PsnLicnsPrjId := licnsprj.FieldByName('sysid').AsString;
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_delete_psnlicnsprj_check ''%s''',
      [ls_PsnLicnsPrjId]);
    Open;
    li_Result := Fields[0].AsInteger;
    Close;
  end;

  if li_Result = 1 then
  begin
    if Application.MessageBox('您确定要删除此资质项目吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
    licnsprj.Delete;
  end
  else
    Application.MessageBox('此资质项目在其他数据表中有相关记录，不能删除！', PChar(Caption), MB_OK + MB_ICONWARNING);


end;

procedure TfrmPersonlicnsMng.lcmbengprjKeyValueChanged(Sender: TObject);
begin
  with licnsengage do
    if State in [dsEdit, dsInsert] then
    begin
      FieldByName('licns_prj_name').AsString := lcmbengprj.Text ;
    end;
end;

procedure TfrmPersonlicnsMng.psnlicnsAfterScroll(DataSet: TDataSet);
begin
  prip_LoadPrjInfo;
  prip_LoadEngageInfo;
  prip_LoadCheckInfo;
end;

procedure TfrmPersonlicnsMng.bbtnchkPrintClick(Sender: TObject);
var
  li_prtfstflag, li_prtChkId : Integer;
  lc_Arg: TStrings;
  lc_PsnLicnsPrtSet: TfrmPsnLicnsPrtSet;
  ls_PsnLicns, ls_LicnsChk : string;
begin

  // 读 person_license 表中打印设置标志
  with psnlicns do
  begin
    li_prtfstflag := FieldByName('prtfstflag').AsInteger;
    li_prtChkId := FieldByName('prtChkline').AsInteger;
  end;

  if Application.MessageBox('您手工调整打印设置吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  begin
    lc_PsnLicnsPrtSet := TfrmPsnLicnsPrtSet.Create(nil);
    with lc_PsnLicnsPrtSet do
      try
        lc_Arg := TStringList.Create;

        //参数数组[0] 首页打印标志
        lc_Arg.Add(IntToStr(li_prtfstflag));
        //参数数组[1] 项目行数
        lc_Arg.Add('0');
        //参数数组[2] 聘用行数
        lc_Arg.Add('0');
        //参数数组[3] 审查行数
        lc_Arg.Add(IntToStr(li_prtChkId));
        try
          pubp_Ini(lc_Arg);
          ShowModal;
          li_prtfstflag := CurPrtFstFlag; //返回新设置过的打印首页
          li_prtChkId := CurPrtChkLine;   //返回新设置过的打印聘用的行数

          //做过打印设置修改，则修改person_license数据表中的打印设置
          psnlicns.Edit;
          psnlicns.FieldByName('prtfstflag').AsInteger := li_prtfstflag;
          psnlicns.FieldByName('prtchkline').AsInteger := li_prtChkId ;
          psnlicns.Post;
        finally
          lc_Arg.Free;
        end;
      finally
        Free;
      end;
  end;

  // 调 打印
  ls_PsnLicns := Gs_AppPath + 'Reports\操作人员资格证.frf';
  ls_LicnsChk := Gs_AppPath + 'Reports\审查备案情况.frf';

  if li_prtfstflag = 1 then
    if frReport.LoadFromFile(ls_PsnLicns) then frReport.ShowReport;

  with frReport do
    if LoadFromFile(ls_LicnsChk) then
    begin
      FindObject('memoLines').Memo.Add(IntToStr(li_prtChkId));
      ShowReport;
    end;
end;

// 打印控制
procedure TfrmPersonlicnsMng.bbtnprjPrintClick(Sender: TObject);
var
  li_prtfstflag, li_prtprjId : Integer;
  lc_Arg: TStrings;
  lc_PsnLicnsPrtSet: TfrmPsnLicnsPrtSet;
  ls_PsnLicns, ls_LicnsPrj : string;
  li_Index : Integer;
  li_Line : Integer;
begin

  // 读 person_license 表中打印设置标志
  with psnlicns do
  begin
    li_prtfstflag := FieldByName('prtfstflag').AsInteger;
//    li_prtprjId := FieldByName('prtprjline').AsInteger;
  end;

  lc_PsnLicnsPrtSet := TfrmPsnLicnsPrtSet.Create(nil);
  with lc_PsnLicnsPrtSet do
    try
      lc_Arg := TStringList.Create;

      //参数数组[0] 首页打印标志
      lc_Arg.Add(IntToStr(li_prtfstflag));
      //参数数组[1] 项目行数
      //lc_Arg.Add(IntToStr(li_prtprjId));
      lc_Arg.Add('1');
      //参数数组[2] 聘用行数
      lc_Arg.Add('0');
      //参数数组[3] 审查行数
      lc_Arg.Add('0');
      try
        pubp_Ini(lc_Arg);
        ShowModal;
        li_prtfstflag := CurPrtFstFlag; //返回新设置过的打印首页
        li_prtprjId := CurPrtPrjLine;   //返回新设置过的打印项目的行数
        //做过打印设置修改，则修改person_license数据表中的打印设置
        psnlicns.Edit;
        psnlicns.FieldByName('prtfstflag').AsInteger := li_prtfstflag;
        psnlicns.FieldByName('prtprjline').AsInteger := li_prtprjId ;
        psnlicns.Post;
      finally
        lc_Arg.Free;
      end;
    finally
      Free;
    end;

  // 生成操作人员资格证第一页的数据源
  if li_prtfstflag = 1 then
  begin
    with mPsnlicns do
      if not IsEmpty then Delete;
    mPsnlicns.Insert;
    mPsnlicns.FieldByName('name').AsString := lcmbName.Text;
    mPsnlicns.FieldByName('cardid').AsString := mlicnspsn.FieldByName('cardid').AsString;
    mPsnlicns.FieldByName('licns_category_name').AsString := lcmbCategory.Text;
    mPsnlicns.FieldByName('licnsno').AsString := eLicnsNo.Text;
    mPsnlicns.FieldByName('issueorgan_name').AsString := lcmbOrgan.Text;
    mPsnlicns.Post;
    ls_PsnLicns := Gs_AppPath + 'Reports\操作人员资格证.frf';
    if frReport.LoadFromFile(ls_PsnLicns) then frReport.ShowReport
  end;

  with mLicnsPrj do
    if not IsEmpty then
    begin
      close;
      open;
    end;

  // 根据项目的待打印记录行数在报表的dataset中插入若干空行
  li_Line := li_prtprjId mod 4;
  if li_Line = 0 then li_Line := 4;

  mLicnsPrj.Insert;
  For li_Index := 1 to li_Line - 1 do
  begin
    mLicnsPrj.Append;
    mLicnsPrj.FieldByName('licnsprj_name').AsString := '';
    mLicnsPrj.FieldByName('testorgan_name').AsString := '';
    mLicnsPrj.FieldByName('authorgan_name').AsString := '';
    mLicnsPrj.FieldByName('auth_date').AsString := '';
    mLicnsPrj.FieldByName('end_date').AsString := '';
  end;
  // 然后在报表的dataset中插入待打印的记录
  with licnsprj do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      mLicnsPrj.Append;
      mLicnsPrj.FieldByName('licnsprj_name').AsString :=
        FieldByName('psnlicns_prjname').AsString;
      mLicnsPrj.FieldByName('testorgan_name').AsString :=
        mprjorgan.FieldByName('test_organ_name').AsString;
      mLicnsPrj.FieldByName('authorgan_name').AsString :=
        mprjorgan.FieldByName('auth_organ_name').AsString;
      mLicnsPrj.FieldByName('auth_date').AsString :=
        FieldByName('auth_date').AsString;
      mLicnsPrj.FieldByName('end_date').AsString :=
        FieldByName('end_date').AsString;
      Next;
    end;
    EnableControls;
  end;
  mLicnsPrj.post;
  showmessage(IntToStr(mLicnsPrj.RecordCount));
  ls_LicnsPrj := Gs_AppPath + 'Reports\批准资格.frf';
  if frReport.LoadFromFile(ls_LicnsPrj) then frReport.ShowReport;

end;


procedure TfrmPersonlicnsMng.bbtnengPrintClick(Sender: TObject);
var
  li_prtfstflag, li_prtEngId : Integer;
  lc_Arg: TStrings;
  lc_PsnLicnsPrtSet: TfrmPsnLicnsPrtSet;
  ls_PsnLicns, ls_LicnsEng : string;
begin

  // 读 person_license 表中打印设置标志
  with psnlicns do
  begin
    li_prtfstflag := FieldByName('prtfstflag').AsInteger;
    li_prtEngId := FieldByName('prtengline').AsInteger;
  end;

  if Application.MessageBox('您手工调整打印设置吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  begin
    lc_PsnLicnsPrtSet := TfrmPsnLicnsPrtSet.Create(nil);
    with lc_PsnLicnsPrtSet do
      try
        lc_Arg := TStringList.Create;

        //参数数组[0] 首页打印标志
        lc_Arg.Add(IntToStr(li_prtfstflag));
        //参数数组[1] 项目行数
        lc_Arg.Add('0');
        //参数数组[2] 聘用行数
        lc_Arg.Add(IntToStr(li_prtEngId));
        //参数数组[3] 审查行数
        lc_Arg.Add('0');
        try
          pubp_Ini(lc_Arg);
          ShowModal;
          li_prtfstflag := CurPrtFstFlag; //返回新设置过的打印首页
          li_prtEngId := CurPrtEngLine;   //返回新设置过的打印聘用的行数

          //做过打印设置修改，则修改person_license数据表中的打印设置
          psnlicns.Edit;
          psnlicns.FieldByName('prtfstflag').AsInteger := li_prtfstflag;
          psnlicns.FieldByName('prtengline').AsInteger := li_prtEngId ;
          psnlicns.Post;
        finally
          lc_Arg.Free;
        end;
      finally
        Free;
      end;
  end;

  // 调 打印
  ls_PsnLicns := Gs_AppPath + 'Reports\操作人员资格证.frf';
  ls_LicnsEng := Gs_AppPath + 'Reports\聘用情况.frf';

  if li_prtfstflag = 1 then
    if frReport.LoadFromFile(ls_PsnLicns) then frReport.ShowReport;

  with frReport do
    if LoadFromFile(ls_LicnsEng) then
    begin
      FindObject('memoLines').Memo.Add(IntToStr(li_prtEngId));
      ShowReport;
    end;
end;

procedure TfrmPersonlicnsMng.prip_Deletelicns;
var
  li_Result : Integer;
  ls_PsnLicnsId : string;
begin
  //Todo: 检查此项目是否有被聘用或审查记录，有则原则上不于删除
  ls_PsnLicnsId := psnlicns.FieldByName('sysid').AsString;
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('device.usp_delete_psnlicns_check ''%s''',
      [ls_PsnLicnsId]);
    Open;
    li_Result := Fields[0].AsInteger;
    Close;
  end;

  if li_Result = 1 then
  begin
    if Application.MessageBox('您确定要删除此资质证书吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;
    psnlicns.Delete;
  end
  else
    Application.MessageBox('此资质证书在其他数据表中有相关记录，不能删除！', PChar(Caption), MB_OK + MB_ICONWARNING);


end;

procedure TfrmPersonlicnsMng.dteauthdateChange(Sender: TObject);
begin
  with licnsprj do
    if State in [dsEdit, dsInsert] then
    begin
      if VarToStr(lcmbcategory.KeyValue) = PLS_WELDER then
        FieldByName('end_date').AsString :=
        DateToStr(IncYear(dteauthdate.Date,3))
      else
        FieldByName('end_date').AsString :=
        DateToStr(IncYear(dteauthdate.Date,2))
    end;
end;

procedure TfrmPersonlicnsMng.licnsprjAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
    prip_GetComInfo_prjorgan([VarToStr(FieldValues['test_organ_sysid']),
        VarToStr(FieldValues['auth_organ_sysid'])]);
end;

procedure TfrmPersonlicnsMng.licnsengageAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
    prip_GetComInfo_engagecom([VarToStr(FieldValues['organ_sysid'])]);
end;

procedure TfrmPersonlicnsMng.licnschkAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
    prip_GetComInfo_chkorgan([VarToStr(FieldValues['check_organ_sysid'])]);
end;

end.
