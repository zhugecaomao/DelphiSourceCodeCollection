unit ufrmPsninfract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, CSADOQuery, StdCtrls, Buttons, DBCtrls,
  CSDBNavigator, ExtCtrls, CSRowCountPanel, Grids, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  CSCustomdxDateEdit, CSdxDBDateEdit, dxmdaset, ufrmPersonMng, ufrmComMng,
  CSBarMDIChild, CSScrCtrlChild, PrnDbgeh, CSDBEhGrdStore, CSGrdColCtrl,
  CSEhGrdColCtrl, CSADOFilter, CSADOEhGrdFilter, CSDBBase, CSDBFind,
  CSDBEhGrdFind;

type
  TfrmPsninfract = class(TForm)
    scrbDetail: TScrollBox;
    Label14: TLabel;
    Label19: TLabel;
    Label37: TLabel;
    Label4: TLabel;
    dteDate: TCSdxDBDateEdit;
    lcmbOrgan: TDBLookupComboboxEh;
    lcmbName: TDBLookupComboboxEh;
    lcmbPrj: TDBLookupComboboxEh;
    Splitter1: TSplitter;
    grdInfractList: TDBGridEh;
    CSRowCountPanel1: TCSRowCountPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Navigator: TCSDBNavigator;
    bbtnInfractIns: TBitBtn;
    bbtnInfractDel: TBitBtn;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColunm: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Label5: TLabel;
    lcmbReason: TDBLookupComboboxEh;
    psnInfract: TCSADOQuery;
    psnInfractd: TDataSource;
    psnInfractsysid: TStringField;
    psnInfractperson_sysid: TStringField;
    psnInfractdatetime: TStringField;
    psnInfractinfract_content: TStringField;
    psnInfractinfract_reason: TStringField;
    psnInfractactualize_organ: TStringField;
    Infractprj: TCSADOQuery;
    Infractprjd: TDataSource;
    InfractReason: TCSADOQuery;
    InfractReasond: TDataSource;
    mComBak: TdxMemData;
    mCom: TdxMemData;
    mPersonBak: TdxMemData;
    mPersonBakperson_sysid: TStringField;
    mPersonBakperson_sysid_name: TStringField;
    mPerson: TdxMemData;
    mPersonperson_sysid: TStringField;
    mPersonperson_sysid_name: TStringField;
    mComd: TDataSource;
    mPersond: TDataSource;
    Temp: TCSADOQuery;
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
    listperson_sysid: TStringField;
    listperson_sysid_name: TStringField;
    listactualize_organ: TStringField;
    listactualize_organ_name: TStringField;
    listinfract_content: TStringField;
    listinfract_content_name: TStringField;
    listinfract_reason: TStringField;
    listinfract_reason_name: TStringField;
    listinfractdatetime: TStringField;
    navList: TCSDBNavigator;
    mComactualize_organ: TStringField;
    mComactualize_organ_name: TStringField;
    mComBakactualize_organ: TStringField;
    mComBakactualize_organ_name: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure lcmbOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure psnInfractAfterInsert(DataSet: TDataSet);
    procedure listAfterScroll(DataSet: TDataSet);
    procedure psnInfractAfterPost(DataSet: TDataSet);
    procedure psnInfractBeforePost(DataSet: TDataSet);
    procedure psnInfractAfterCancel(DataSet: TDataSet);
    procedure NavigatorBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure psnInfractAfterDelete(DataSet: TDataSet);
    procedure bbtnInfractInsClick(Sender: TObject);
    procedure bbtnInfractDelClick(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fb_SelectOn: Boolean;
    Fs_CurPersonId: String;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_RefreshComListSource;
    procedure prip_RefreshPersonListSource;
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
    procedure prip_GetPsnInfractInfo;
    procedure prip_ListPsnInfratInfo;
    procedure prip_RefreshInfractlist(const As_ID: string = '');
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
  frmPsninfract: TfrmPsninfract;

implementation

uses
  CSVCLUtils, udmData, CommonLib;
{$R *.dfm}

{ TfrmPsninfract }

function TfrmPsninfract.prif_CheckBlank(
  Ac_Fields: array of TField): Boolean;
var
  li_i: Integer;
begin
  Result := True;
  with psnInfract do
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

function TfrmPsninfract.prif_Validate: Boolean;
begin
  with psnInfract do               //
    Result := prif_CheckBlank([FieldByName('person_sysid'),
    FieldByName('infractdatetime'), FieldByName('infract_content'),
    FieldByName('infract_reason'),  FieldByName('actualize_organ')]);
end;

procedure TfrmPsninfract.prip_CompanyDialog(const Ai_Category: Integer;
  Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmComMng);
begin
  with psnInfractd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mComd;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPsninfract.prip_GetComInfo(Asa_Ids: array of string);
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

procedure TfrmPsninfract.prip_GetPersonInfo(Asa_Ids: array of string);
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

procedure TfrmPsninfract.prip_IniData;
begin
  //奖惩项目
  with infractprj do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_rewardsitem';
    Open;
  end;
  //奖惩事由
  with infractReason do
  begin
		if Active then Close;
    SQL.Text := 'SELECT * FROM device.code_rewardsreason';
    Open;
  end;

  prip_ListPsnInfratInfo;

end;

procedure TfrmPsninfract.prip_IniInterface;
begin

end;

procedure TfrmPsninfract.prip_PersonDialog(const Ai_Kind, Ai_Category,
  Ai_Prj: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmPersonMng);
begin
  with psnInfractd do if (not AutoEdit) or Ac_LookupComboBox.ReadOnly then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectPerson(Ai_Kind, Ai_Category, Ai_Prj, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mPersond;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmPsninfract.prip_RefreshComListSource;
begin
  with lcmbOrgan do
  begin
    ListSource := nil;
    ListSource := mComd;
  end;
end;

procedure TfrmPsninfract.prip_RefreshPersonListSource;
begin
  with lcmbName do
  begin
    ListSource := nil;
    ListSource := mPersond;
  end;
end;

procedure TfrmPsninfract.prip_SelectCompany(const Ai_Category: Integer;
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
  with lc_Company, psnInfract do
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

procedure TfrmPsninfract.prip_SelectPerson(const Ai_Kind, Ai_Category,
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
  with lc_Person, psnInfract do
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

procedure TfrmPsninfract.pubp_Ini(const Ab_SelectOn: Boolean;
  Ac_Args: TStrings);
begin
  ScrChild.SetSecurity(Self);

  Fb_SelectOn := Ab_SelectOn;
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fs_CurPersonId := Strings[0];
    end;
  Gp_ProgressHint('正在载入人员违规信息，请稍候...');
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

procedure TfrmPsninfract.FormCreate(Sender: TObject);
begin
  Rb_DataModified := False;
  Fs_CurPersonId := '';
end;

procedure TfrmPsninfract.lcmbOrganEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog((SUPERVISOR_SIGN or VERIFY_SIGN), lcmbOrgan, TfrmComMng.Create(nil));
end;

procedure TfrmPsninfract.lcmbNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_PersonDialog(0, 0, 0, lcmbName, TfrmPersonMng.Create(nil));
end;

procedure TfrmPsninfract.prip_GetPsnInfractInfo;
var
  ls_PsnInfractId: string;
begin
  ls_PsnInfractId := List.FieldByName('sysid').AsString;
  
  with psnInfract do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.person_infraction_info WHERE ' +
      'sysid = ''%s''', [ls_PsnInfractId]);
    Open;

    if not IsEmpty then
    begin
      prip_GetComInfo([VarToStr(FieldValues['actualize_organ'])]);
      prip_GetPersonInfo([VarToStr(FieldValues['person_sysid'])]);
    end;
  end;
end;

procedure TfrmPsninfract.psnInfractAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('sysid').AsString := Gf_GenSysId;
end;

procedure TfrmPsninfract.listAfterScroll(DataSet: TDataSet);
begin
  prip_GetPsnInfractInfo;
end;

procedure TfrmPsninfract.prip_ListPsnInfratInfo;
begin
  with List do
  begin
		if Active then Close;
    SQL.Text := 'device.usp_getpsninfract';
    Open;

    if IsEmpty then prip_GetPsnInfractInfo;
  end;
end;

procedure TfrmPsninfract.psnInfractAfterPost(DataSet: TDataSet);
var ls_psnInfractID : string;
begin
  mComBak.LoadFromDataSet(mCom);
  Rb_DataModified := True;
  ls_psnInfractID:= DataSet.FieldByName('sysid').AsString;
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    prip_RefreshInfractlist(ls_psnInfractID);
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmPsninfract.psnInfractBeforePost(DataSet: TDataSet);
begin
  if not prif_Validate then Abort;
end;

procedure TfrmPsninfract.psnInfractAfterCancel(DataSet: TDataSet);
begin
  mCom.LoadFromDataSet(mComBak);
  prip_RefreshComListSource;
end;

procedure TfrmPsninfract.prip_RefreshInfractlist(const As_ID: string);
begin
  with List do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := 'device.usp_getpsninfract';
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmPsninfract.NavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
    if (Button = nbRefresh) and (psninfract.State = dsBrowse) then
  begin
    Gp_ProgressHint('正在刷新，请稍候...');
    try
      prip_RefreshInfractlist;
    finally
      Gp_ProgressHint;
    end;
    Abort;
  end;
end;

procedure TfrmPsninfract.psnInfractAfterDelete(DataSet: TDataSet);
begin
  prip_RefreshInfractlist;
end;

procedure TfrmPsninfract.bbtnInfractInsClick(Sender: TObject);
begin
  psnInfract.Insert;
end;

procedure TfrmPsninfract.bbtnInfractDelClick(Sender: TObject);
begin
  with psnInfract do if (not Active) or IsEmpty then
  begin
    Exit;
  end;

  if Application.MessageBox('警告，您确定要删除当前选择的人员违规记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then
  begin
    Exit;
  end;
  psnInfract.Delete;
end;

procedure TfrmPsninfract.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPsninfract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmPsninfract := nil;
  end else Action := caHide;
end;

end.
