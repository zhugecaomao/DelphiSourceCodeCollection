unit ufrmSuprNotice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DBCtrls, CSDBNavigator, StdCtrls, ExtCtrls,
  Buttons, DB, ADODB, CSADOQuery, CSScrCtrlChild, CSBarMDIChild,
  CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter, CSADOEhGrdFilter, CSDBBase,
  CSDBFind, CSDBEhGrdFind, Mask, DBCtrlsEh, DBLookupEh, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, CSCustomdxDateEdit, CSdxDBDateEdit, dxmdaset,
  ufrmOrganMng, FR_Class, CSDBEhGrdStore;

type
  TfrmSuprNotice = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    ScrollBox1: TScrollBox;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel4: TPanel;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    navList: TCSDBNavigator;
    navInfo: TCSDBNavigator;
    bbtnListFind: TBitBtn;
    bbtnListFilter: TBitBtn;
    bbtnListColumn: TBitBtn;
    grdList: TDBGridEh;
    Label1: TLabel;
    Label9: TLabel;
    lcmbRecOrg: TDBLookupComboboxEh;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    List: TCSADOQuery;
    Listd: TDataSource;
    NoticeInfo: TCSADOQuery;
    NoticeInfod: TDataSource;
    NoticeInfosysid: TStringField;
    NoticeInfonotice_no: TStringField;
    NoticeInforecorg_sysid: TStringField;
    NoticeInfodev_name: TStringField;
    NoticeInfoend_date: TStringField;
    NoticeInfomatter: TStringField;
    NoticeInfosendorg_sysid: TStringField;
    NoticeInfosend_date: TStringField;
    NoticeInforeturn_idea: TStringField;
    NoticeInforeturn_date: TStringField;
    labUseCertId: TLabel;
    eNoticeNo: TDBEditEh;
    Label2: TLabel;
    mMatter: TdxDBMemo;
    Label3: TLabel;
    lcmbSendOrg: TDBLookupComboboxEh;
    labDevKind: TLabel;
    eDevKind: TdxDBPickEdit;
    Label4: TLabel;
    mReturnIdea: TdxDBMemo;
    Label8: TLabel;
    deSendDate: TCSdxDBDateEdit;
    Label5: TLabel;
    deReturnDate: TCSdxDBDateEdit;
    Label6: TLabel;
    deEndDate: TCSdxDBDateEdit;
    Label7: TLabel;
    NoticeInfostate: TIntegerField;
    Listsysid: TStringField;
    Listnotice_no: TStringField;
    Listrecorg_sysid: TStringField;
    Listrecorg_name: TStringField;
    Listdev_name: TStringField;
    Listend_date: TStringField;
    Listsend_date: TStringField;
    Listreturn_date: TStringField;
    Listsendorg_sysid: TStringField;
    Listsendorg_name: TStringField;
    Liststate: TIntegerField;
    Liststate_name: TStringField;
    Temp: TCSADOQuery;
    mComInfo: TdxMemData;
    mComInforecorg_sysid: TStringField;
    mComInforecorg_name: TStringField;
    mComInfosendorg_sysid: TStringField;
    mComInfosendorg_name: TStringField;
    mComInfod: TDataSource;
    mComInfoBak: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    bbtnConfirm: TBitBtn;
    bbtnPrint: TBitBtn;
    frPrintNotice: TfrReport;
    ListEhGrdStore: TCSDBEhGrdStore;
    procedure ListAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure navInfoBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure bbtnInsertClick(Sender: TObject);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure NoticeInfoAfterInsert(DataSet: TDataSet);
    procedure NoticeInfoAfterDelete(DataSet: TDataSet);
    procedure bbtnListFindClick(Sender: TObject);
    procedure bbtnListFilterClick(Sender: TObject);
    procedure bbtnListColumnClick(Sender: TObject);
    procedure NoticeInfoAfterScroll(DataSet: TDataSet);
    procedure lcmbRecOrgEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcmbSendOrgEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure NoticeInfoAfterPost(DataSet: TDataSet);
    procedure grdListGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure NoticeInfoBeforeInsert(DataSet: TDataSet);
    procedure NoticeInfoBeforeEdit(DataSet: TDataSet);
    procedure NoticeInfoBeforePost(DataSet: TDataSet);
    procedure bbtnPrintMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure NoticeInfoAfterCancel(DataSet: TDataSet);
    procedure lcmbRecOrgDropDown(Sender: TObject);
    procedure lcmbSendOrgDropDown(Sender: TObject);
  private
    Fs_PrevNoticeNo: string;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_SetInterface;
    procedure prip_Delete;
    procedure prip_GetDevKind;
    procedure prip_GetNoticeInfo(const As_Id: string = '');
    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_RefreshNoticeInfo(const As_ID: string = '');
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_CompanyDialog(const Ai_Category: Integer;
      Ac_LookupComboBox: TDBLookupComboBoxEh; Ac_Requestor: TfrmOrganMng = nil);
    procedure prip_RefreshListSource;
    procedure prip_PrintNotice(Ab_IsDesign: Boolean);
    procedure prip_Confirm;
		function prif_CheckBlank(Ac_DataSet: TDataSet;
      Ac_Fields: array of TField): Boolean;
    function prif_Validate(Ac_DataSet: TDataSet): Boolean;
  public
    procedure pubp_Ini(const As_ID: string = '');
  end;

var
  frmSuprNotice: TfrmSuprNotice;

implementation

uses
  CSVCLUtils, udmData, CommonLib;

const
  SAVE_STATE = 0;
  CONFIRM_STATE = 1;

{$R *.dfm}

{ TfrmSuprNotice }

procedure TfrmSuprNotice.prip_GetNoticeInfo(const As_ID: string);
begin
  with NoticeInfo do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.supr_notice ' +
        'WHERE sysid = ''%s''', [As_ID]);
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmSuprNotice.prip_IniData;
begin
  with List do
  begin
    if Active then Close;
    SQL.Text := 'device.usp_getsuprnotice';
    Open;

    if IsEmpty then prip_GetNoticeInfo;

    prip_GetDevKind;
  end;
end;

procedure TfrmSuprNotice.prip_IniInterface;
begin

end;

procedure TfrmSuprNotice.pubp_Ini(const As_ID: string);
begin
  ScrChild.SetSecurity(Self);
  try
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    prip_IniData;
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
    prip_IniInterface;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmSuprNotice.ListAfterScroll(DataSet: TDataSet);
var
  ls_NoticeID: string;
begin
  with DataSet do ls_NoticeID := FieldByName('sysid').AsString;
  prip_GetNoticeInfo(ls_NoticeID);
  prip_SetInterface;
end;

procedure TfrmSuprNotice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmSuprNotice := nil;
  end else Action := caHide;
end;

procedure TfrmSuprNotice.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSuprNotice.prip_RefreshNoticeInfo(const As_ID: string);
begin
  with List do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := 'device.usp_getsuprnotice';
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmSuprNotice.navInfoBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbRefresh) and (NoticeInfo.State = dsBrowse) then
  begin
    Gp_ProgressHint('正在刷新，请稍候...');
    try
      prip_RefreshNoticeInfo;
    finally
      Gp_ProgressHint;
    end;
    Abort;
  end;
end;

procedure TfrmSuprNotice.prip_GetDevKind;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := 'SELECT name FROM device.code_device WHERE code_level = 1 ' +
      'ORDER BY code';
    Open;

    if not IsEmpty then
    begin
      eDevKind.Items.Clear;
      while not Eof do
      begin
        eDevKind.Items.Add(FieldByName('name').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TfrmSuprNotice.bbtnInsertClick(Sender: TObject);
begin
  NoticeInfo.Append;
end;

procedure TfrmSuprNotice.bbtnDeleteClick(Sender: TObject);
begin
  prip_Delete;
end;

procedure TfrmSuprNotice.NoticeInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldValues['sysid'] := Gf_GenSysId;
    FieldValues['state'] := SAVE_STATE;
  end;
  prip_SetInterface;
end;

procedure TfrmSuprNotice.NoticeInfoAfterDelete(DataSet: TDataSet);
begin
  prip_RefreshNoticeInfo;
end;

procedure TfrmSuprNotice.bbtnListFindClick(Sender: TObject);
begin
	ListFind.FindDlg;
end;

procedure TfrmSuprNotice.bbtnListFilterClick(Sender: TObject);
begin
	ListFilter.FilterDlg;
end;

procedure TfrmSuprNotice.bbtnListColumnClick(Sender: TObject);
begin
	with ListColCtrl do
  begin
    InitColumns;
  	SetupDlg;
  end;
end;

procedure TfrmSuprNotice.prip_CompanyDialog(
  const Ai_Category: Integer; Ac_LookupComboBox: TDBLookupComboBoxEh;
  Ac_Requestor: TfrmOrganMng);
begin
  with NoticeInfod do if (not AutoEdit) and (State = dsBrowse) then Exit;

  with Ac_LookupComboBox do
    try
      prip_SelectCompany(Ai_Category, DataField, Ac_Requestor);
      ListSource := nil;
      ListSource := mComInfod;
    finally
      if Ac_Requestor <> nil then Ac_Requestor.Free;
    end;
end;

procedure TfrmSuprNotice.prip_SelectCompany(
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
  with lc_Company, NoticeInfo do
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

      if IsEmpty then Append else Edit;
      FieldByName(As_Field).AsString := CurOrganId;
    end;
  end;
end;

procedure TfrmSuprNotice.prip_GetComInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s'' UNION ' +
      'SELECT sysid, name, 2 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''',
      [Asa_Ids[0], Asa_Ids[1]]);
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
    if NoticeInfo.State <> dsInsert then mComInfoBak.LoadFromDataSet(mComInfo);
    Close;
  end;
  prip_RefreshListSource;
end;

procedure TfrmSuprNotice.prip_RefreshListSource;
begin
  with lcmbRecOrg do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
  with lcmbSendOrg do
  begin
    ListSource := nil;
    ListSource := mComInfod;
  end;
end;

procedure TfrmSuprNotice.NoticeInfoAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if State <> dsInsert then
      prip_GetComInfo([VarToStr(FieldValues['recorg_sysid']),
        VarToStr(FieldValues['sendorg_sysid'])]);
  end;
end;

procedure TfrmSuprNotice.lcmbRecOrgEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(0, lcmbRecOrg, TfrmOrganMng.Create(nil));
end;

procedure TfrmSuprNotice.lcmbSendOrgEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  prip_CompanyDialog(SUPERVISOR_SIGN, lcmbSendOrg, TfrmOrganMng.Create(nil));
end;

procedure TfrmSuprNotice.NoticeInfoAfterPost(DataSet: TDataSet);
var
  ls_NoticeID: string;
begin
  ls_NoticeID := DataSet.FieldByName('sysid').AsString;
  Gp_ProgressHint('正在刷新，请稍候...');
  try
    mComInfoBak.LoadFromDataSet(mComInfo);
    prip_RefreshNoticeInfo(ls_NoticeID);
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmSuprNotice.grdListGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  ls_EndDate: string;
  li_State: Integer;
begin
  with List do
  begin
    ls_EndDate := FieldByName('end_date').AsString;
    li_State := FieldByName('state').AsInteger;
  end;

  if (ls_EndDate < FormatDateTime('yyyy-mm-dd', Now)) and
    (li_State = SAVE_STATE) then AFont.Color := clRed
  else if li_State = CONFIRM_STATE then AFont.Color := clMedGray;
end;

function TfrmSuprNotice.prif_CheckBlank(Ac_DataSet: TDataSet;
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

function TfrmSuprNotice.prif_Validate(Ac_DataSet: TDataSet): Boolean;
var
  ls_NoticeNo: string;
begin
  with Ac_DataSet do
    Result := prif_CheckBlank(Ac_DataSet, [FieldByName('notice_no'),
      FieldByName('recorg_sysid'), FieldByName('sendorg_sysid'),
      FieldByName('end_date'), FieldByName('send_date')]);

  if not Result then Exit;

  ls_NoticeNo := VarToStr(Ac_DataSet.FieldValues['notice_no']);

  if ls_NoticeNo <> Fs_PrevNoticeNo then
    with Temp do
    begin
      if Active then Close;
      SQL.Text := Format('SELECT sysid FROM device.supr_notice WHERE ' +
        'notice_no = ''%s''', [ls_NoticeNo]);
      Open;
      if not IsEmpty then
      begin
        Result := False;
        Application.MessageBox('您输入的通知书编号已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
        eNoticeNo.SetFocus;
      end;
      Close;
    end;
end;

procedure TfrmSuprNotice.FormCreate(Sender: TObject);
begin
  Fs_PrevNoticeNo := '';
  
  with ListEhGrdStore do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    RestoreGridLayout;
  end;
end;

procedure TfrmSuprNotice.NoticeInfoBeforeInsert(DataSet: TDataSet);
begin
  Fs_PrevNoticeNo := '';
end;

procedure TfrmSuprNotice.NoticeInfoBeforeEdit(DataSet: TDataSet);
begin
  with DataSet do Fs_PrevNoticeNo := VarToStr(FieldValues['notice_no']);
end;

procedure TfrmSuprNotice.NoticeInfoBeforePost(DataSet: TDataSet);
begin
  if not prif_Validate(DataSet) then Abort;
end;

procedure TfrmSuprNotice.prip_PrintNotice(Ab_IsDesign: Boolean);
var
  ls_PrintFile: string;
begin
  ls_PrintFile := Gs_AppPath + REPORTS_PATH + '监察意见通知书.frf';

  with frPrintNotice do
  begin
    LoadFromFile(ls_PrintFile);
    if Ab_IsDesign then DesignReport else ShowReport;
  end;
end;

procedure TfrmSuprNotice.bbtnPrintMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  prip_PrintNotice(Shift = [ssShift, ssCtrl, ssAlt]);
end;

procedure TfrmSuprNotice.prip_Confirm;
begin
  with NoticeInfo do
  begin
    if State <> dsBrowse then Post;
    if prif_CheckBlank(NoticeInfo, [FieldByName('return_date')]) then
    begin
      Edit;
      FieldByName('state').AsInteger := CONFIRM_STATE;
      Post;
      prip_SetInterface;
    end;
  end;
end;

procedure TfrmSuprNotice.bbtnConfirmClick(Sender: TObject);
begin
  prip_Confirm;
end;

procedure TfrmSuprNotice.prip_SetInterface;
var
  li_State: Integer;
begin
  with NoticeInfo do
    li_State := FieldByName('state').AsInteger;

  case li_State of
    SAVE_STATE:
      begin
        eNoticeNo.Enabled := True;
        eDevKind.Enabled := True;
        lcmbRecOrg.Enabled := True;
        lcmbSendOrg.Enabled := True;
        deEndDate.Enabled := True;
        mMatter.Enabled := True;
        mReturnIdea.Enabled := True;
        deSendDate.Enabled := True;
        deReturnDate.Enabled := True;
        bbtnDelete.Enabled := True;
        bbtnConfirm.Enabled := True;
      end;
    CONFIRM_STATE:
      begin
        eNoticeNo.Enabled := False;
        eDevKind.Enabled := False;
        lcmbRecOrg.Enabled := False;
        lcmbSendOrg.Enabled := False;
        deEndDate.Enabled := False;
        mMatter.Enabled := False;
        mReturnIdea.Enabled := False;
        deSendDate.Enabled := False;
        deReturnDate.Enabled := False;
        bbtnDelete.Enabled := False;
        bbtnConfirm.Enabled := False;
      end;
    else
      begin
        eNoticeNo.Enabled := True;
        eDevKind.Enabled := True;
        lcmbRecOrg.Enabled := True;
        lcmbSendOrg.Enabled := True;
        deEndDate.Enabled := True;
        mMatter.Enabled := True;
        mReturnIdea.Enabled := True;
        deSendDate.Enabled := True;
        deReturnDate.Enabled := True;
        bbtnDelete.Enabled := True;
        bbtnConfirm.Enabled := True;
      end;
  end;
end;

procedure TfrmSuprNotice.NoticeInfoAfterCancel(DataSet: TDataSet);
begin
  mcomInfo.LoadFromDataSet(mComInfoBak);
  prip_RefreshListSource;
  prip_SetInterface;
end;

procedure TfrmSuprNotice.lcmbRecOrgDropDown(Sender: TObject);
begin
  Abort;
end;

procedure TfrmSuprNotice.lcmbSendOrgDropDown(Sender: TObject);
begin
  Abort;
end;

procedure TfrmSuprNotice.prip_Delete;
begin
  if Application.MessageBox('您确定要删除当前记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then Exit;
  NoticeInfo.Delete;
end;

end.
