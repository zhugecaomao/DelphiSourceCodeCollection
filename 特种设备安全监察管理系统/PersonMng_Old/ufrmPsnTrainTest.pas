unit ufrmPsnTrainTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, Buttons, DBCtrls,
  CSDBNavigator, ExtCtrls, CSRowCountPanel, Grids, DBGridEh, dxEditor,
  dxExEdtr, dxEdLib, CSCustomdxDateEdit, CSdxDBDateEdit, dxCntner, dxDBELib,
  DB, ADODB, CSADOQuery, dxmdaset, ufrmPersonMng, ufrmComMng,
  CSScrCtrlChild, CSBarMDIChild, PrnDbgeh, CSDBEhGrdStore, CSGrdColCtrl,
  CSEhGrdColCtrl, CSADOFilter, CSADOEhGrdFilter, CSDBBase, CSDBFind,
  CSDBEhGrdFind;

type
  TfrmPsnTrainTest = class(TForm)
    scrbDetail: TScrollBox;
    Label14: TLabel;
    Label19: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label36: TLabel;
    mRemark: TdxDBMemo;
    dteStartDate: TCSdxDBDateEdit;
    Splitter1: TSplitter;
    grdTrainList: TDBGridEh;
    CSRowCountPanel1: TCSRowCountPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Navigator: TCSDBNavigator;
    bbtnEngageIns: TBitBtn;
    bbtnEngageDel: TBitBtn;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    Label1: TLabel;
    dteEndDate: TCSdxDBDateEdit;
    Label37: TLabel;
    lcmbOrgan: TDBLookupComboboxEh;
    Label2: TLabel;
    eLResult: TDBEditEh;
    Label3: TLabel;
    eOResult: TDBEditEh;
    Label4: TLabel;
    lcmbName: TDBLookupComboboxEh;
    lcmbLicnsKind: TDBLookupComboboxEh;
    lcmbLicnsCategory: TDBLookupComboboxEh;
    lcmbResult: TDBLookupComboboxEh;
    psnTrainTest: TCSADOQuery;
    psnTrainTestd: TDataSource;
    psnTrainTestsysid: TStringField;
    psnTrainTestlicns_sysid: TStringField;
    psnTrainTestorgan_sysid: TStringField;
    psnTrainTestperson_sysid: TStringField;
    psnTrainTestlicns_kind: TStringField;
    psnTrainTestcategory: TStringField;
    psnTrainTeststartdate: TStringField;
    psnTrainTestenddate: TStringField;
    psnTrainTesttrain_result: TStringField;
    psnTrainTesttheory_result: TStringField;
    psnTrainTestoperate_result: TStringField;
    psnTrainTesttrain_content: TStringField;
    psnTrainTestremark: TStringField;
    Panel1: TPanel;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    licnskind: TCSADOQuery;
    licnskindd: TDataSource;
    licnscategory: TCSADOQuery;
    licnscategoryd: TDataSource;
    trainresult: TCSADOQuery;
    trainresultd: TDataSource;
    Temp: TCSADOQuery;
    mComBak: TdxMemData;
    mCom: TdxMemData;
    mComd: TDataSource;
    mPersonBak: TdxMemData;
    mPerson: TdxMemData;
    mPersond: TDataSource;
    mComorgan_sysid: TStringField;
    mComorgan_sysid_name: TStringField;
    mComBakorgan_sysid: TStringField;
    mComBakorgan_sysid_name: TStringField;
    mPersonperson_sysid: TStringField;
    mPersonperson_sysid_name: TStringField;
    mPersonBakperson_sysid: TStringField;
    mPersonBakperson_sysid_name: TStringField;
    ScrChild: TCSScrCtrlChild;
    CSBarMDIChild1: TCSBarMDIChild;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    ListEhGrdStore: TCSDBEhGrdStore;
    SaveDialog: TSaveDialog;
    ListPrint: TPrintDBGridEh;
    list: TCSADOQuery;
    listd: TDataSource;
    listsysid: TStringField;
    listlicns_sysid: TStringField;
    listorgan_sysid: TStringField;
    listorgan_sysid_name: TStringField;
    listperson_sysid: TStringField;
    listperson_sysid_name: TStringField;
    listlicns_kind: TStringField;
    listlicns_kind_name: TStringField;
    listcategory: TStringField;
    listcategory_name: TStringField;
    liststartdate: TStringField;
    listenddate: TStringField;
    listtrain_result: TStringField;
    listtrain_result_name: TStringField;
    listtheory_result: TStringField;
    listoperate_result: TStringField;
    listtrain_content: TStringField;
    navList: TCSDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure lcmbNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure listAfterScroll(DataSet: TDataSet);
    procedure lcmbLicnsKindKeyValueChanged(Sender: TObject);
    procedure psnTrainTestAfterInsert(DataSet: TDataSet);
    procedure psnTrainTestAfterPost(DataSet: TDataSet);
    procedure psnTrainTestBeforePost(DataSet: TDataSet);
    procedure psnTrainTestAfterCancel(DataSet: TDataSet);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NavigatorBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure psnTrainTestAfterDelete(DataSet: TDataSet);
    procedure bbtnEngageInsClick(Sender: TObject);
    procedure bbtnEngageDelClick(Sender: TObject);
  private
    Fb_SelectOn: Boolean;
    Fs_CurPersonId: String;
    Fs_CurLicnsId: String;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_RefreshComListSource;
    procedure prip_RefreshPersonListSource;
    procedure prip_ListPsnTrain;
    procedure prip_CompanyDialog(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmComMng);

    procedure prip_PersonDialog(const Ai_Kind: Integer;
      const Ai_Category: Integer;const Ai_Prj: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmPersonMng);
    procedure prip_SelectPerson(const Ai_Kind: Integer;
      const Ai_Category: Integer;const Ai_Prj: Integer;
      const As_Field: string; Ac_Requestor: TfrmPersonMng);
    procedure prip_GetPsnTrainInfo;
    procedure prip_RefreshTrainTestInfo(const As_ID: string = '');
    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_GetPersonInfo(Asa_Ids: array of string);
    function prif_CheckBlank(Ac_Fields: array of TField): Boolean;
    function prif_Validate: Boolean;
  protected
  	Rb_DataModified: Boolean;

  	property SelectOn: Boolean read Fb_SelectOn;
  public
    procedure pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
    property DataModified: Boolean read Rb_DataModified;

  end;

var
  frmPsnTrainTest: TfrmPsnTrainTest;

implementation

uses
  CSVCLUtils, udmData, CommonLib;
  
{$R *.dfm}

{ TfrmPsnTrainTest }

function TfrmPsnTrainTest.prif_CheckBlank(
  Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with psnTrainTest do
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

function TfrmPsnTrainTest.prif_Validate: Boolean;
begin
  with psnTrainTest do               //
    Result := prif_CheckBlank([FieldByName('person_sysid'),
    FieldByName('organ_sysid'), FieldByName('licns_kind'),  FieldByName('category'),
    FieldByName('startdate'),  FieldByName('enddate'),  FieldByName('train_result'),
    FieldByName('theory_result'),  FieldByName('operate_result')]);
end;

procedure TfrmPsnTrainTest.prip_CompanyDialog(const Ai_Category: Integer;
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
begin
  with psnTrainTestd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mComd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPsnTrainTest.prip_GetComInfo(Asa_Ids: array of string);
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

procedure TfrmPsnTrainTest.prip_GetPersonInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format(
      'SELECT sysid, name, 1 AS ix FROM device.person_baseinfo ' +
      'WHERE sysid = ''%s''', [Asa_Ids[0]]);
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

procedure TfrmPsnTrainTest.prip_IniData;
begin
  //证书性质
  with licnskind do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where licns_level = 1';
    Open;
  end;
  //证书类别
  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_person_licns where licns_level = 2';
    Open;
  end;

  with trainresult do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_trainresult';
    Open;
  end;
  prip_ListPsnTrain;
//  with psnTrainTest do
//  begin
//    if Active then Close;
//    if Fb_SelectOn then
//    begin
//      if Fs_CurLicnsId = '' then
//        SQL.Text := Format('SELECT * FROM device.person_assess WHERE ' +
//          'person_sysid = ''%s''', [Fs_CurPersonId])
//      else
//        SQL.Text := Format('SELECT * FROM device.person_assess WHERE ' +
//          'person_sysid = ''%s'' AND licns_sysid = ''%s'' ', [Fs_CurPersonId,
//          Fs_CurLicnsId]);
//    end else SQL.Text := 'SELECT * FROM device.person_assess';
//    Open;

//    prip_GetComInfo([VarToStr(FieldValues['organ_sysid'])]);
//    prip_GetPersonInfo([VarToStr(FieldValues['person_sysid'])]);
//  end;
end;

procedure TfrmPsnTrainTest.prip_IniInterface;
begin

end;

procedure TfrmPsnTrainTest.prip_PersonDialog(const Ai_Kind, Ai_Category,
  Ai_Prj: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmPersonMng);
begin
  with psnTrainTestd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectPerson(Ai_Kind, Ai_Category, Ai_Prj, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mPersond;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPsnTrainTest.prip_RefreshComListSource;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
end;

procedure TfrmPsnTrainTest.prip_RefreshPersonListSource;
begin
  with lcmbName do
  begin
    ListSource := nil;
    ListSource := mPersond;
  end;
end;

procedure TfrmPsnTrainTest.prip_SelectCompany(const Ai_Category: Integer;
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
  with lc_Company, psnTrainTest do
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

procedure TfrmPsnTrainTest.prip_SelectPerson(const Ai_Kind, Ai_Category,
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
  with lc_Person, psnTrainTest do
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

// Ac_Args[0] 当前人员系统id   Ac_Args[1] 当前资质系统id
procedure TfrmPsnTrainTest.pubp_Ini(const Ab_SelectOn: Boolean;
  Ac_Args: TStrings);
begin
  ScrChild.SetSecurity(Self);

  Fb_SelectOn := Ab_SelectOn;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_CurPersonId := Strings[0];
      if Count > 1 then Fs_CurLicnsId := Strings[1];
    end;
  Gp_ProgressHint('正在载入人员培训考核信息，请稍候...');
  try
    prip_IniData;
  finally
    Gp_ProgressHint;
  end;

  prip_IniInterface;

  if SelectOn then
  begin
    BorderIcons := BorderIcons - [BiMinimize];
    Position := poScreenCenter;
  end else begin
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
  end;
end;

procedure TfrmPsnTrainTest.FormCreate(Sender: TObject);
begin
  Rb_DataModified := False;
  Fs_CurPersonId := '';
  Fs_CurLicnsId := '';
end;

procedure TfrmPsnTrainTest.lcmbNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_PersonDialog(0, 0, 0, lcmbName, TfrmPersonMng.Create(nil));
end;

procedure TfrmPsnTrainTest.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(ASSES_SIGN, lcmbOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPsnTrainTest.prip_ListPsnTrain;
begin
  with List do
  begin
		if Active then Close;
    SQL.Text := 'device.usp_gettraininfo';
    Open;

    if IsEmpty then prip_GetPsnTrainInfo;
  end;
end;

procedure TfrmPsnTrainTest.listAfterScroll(DataSet: TDataSet);
begin
  prip_GetPsnTrainInfo;
end;

procedure TfrmPsnTrainTest.prip_GetPsnTrainInfo;
var
  ls_PsnTrainId: string;
begin
  ls_PsnTrainId := List.FieldByName('sysid').AsString;
  
  with psnTrainTest do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_assess WHERE ' +
      'sysid = ''%s''', [ls_PsnTrainId]);
    Open;

    if not IsEmpty then
    begin
      prip_GetComInfo([VarToStr(FieldValues['organ_sysid'])]);
      prip_GetPersonInfo([VarToStr(FieldValues['person_sysid'])]);
    end;
  end;
end;

procedure TfrmPsnTrainTest.lcmbLicnsKindKeyValueChanged(Sender: TObject);
var
  ls_LicnsKind: string;
begin
  ls_LicnsKind := VarToStr(lcmbLicnsKind.KeyValue);
  with licnscategory do
  begin
		if Active then Close;
    SQL.Text := Format('SELECT * FROM device.code_person_licns ' +
    'where licns_level = 2 and parent_id = ''%s''', [ls_LicnsKind]);
    Open;
  end;
end;

procedure TfrmPsnTrainTest.psnTrainTestAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
end;

procedure TfrmPsnTrainTest.psnTrainTestAfterPost(DataSet: TDataSet);
var ls_PsnTrainID: string;
begin
  mComBak.LoadFromDataSet(mCom);
  Rb_DataModified := True;
  ls_PsnTrainID:= DataSet.FieldByName('sysid').AsString;
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_RefreshTrainTestInfo(ls_PsnTrainID);
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmPsnTrainTest.psnTrainTestBeforePost(DataSet: TDataSet);
begin
  if not prif_Validate then Abort;
end;

procedure TfrmPsnTrainTest.psnTrainTestAfterCancel(DataSet: TDataSet);
begin
  mCom.LoadFromDataSet(mComBak);
  prip_RefreshComListSource;
end;

procedure TfrmPsnTrainTest.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPsnTrainTest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmPsnTrainTest := nil;
  end else Action := caHide;
end;

procedure TfrmPsnTrainTest.prip_RefreshTrainTestInfo(const As_ID: string);
begin
  with List do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := 'device.usp_gettraininfo';
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmPsnTrainTest.NavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbRefresh) and (psnTrainTest.State = dsBrowse) then
  begin
    Gp_ProgressHint('正在刷新，请稍候...');
    try
      prip_RefreshTrainTestInfo;
    finally
      Gp_ProgressHint;
    end;
    Abort;
  end;
end;

procedure TfrmPsnTrainTest.psnTrainTestAfterDelete(DataSet: TDataSet);
begin
  prip_RefreshTrainTestInfo;
end;

procedure TfrmPsnTrainTest.bbtnEngageInsClick(Sender: TObject);
begin
  psnTrainTest.Insert;
end;

procedure TfrmPsnTrainTest.bbtnEngageDelClick(Sender: TObject);
begin
  with PsnTrainTest do if (not Active) or IsEmpty then
  begin
    Exit;
  end;

  if Application.MessageBox('警告，您确定要删除当前选择的人员培训考核记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then
  begin
    Exit;
  end;
  psnTrainTest.Delete;
end;

end.
