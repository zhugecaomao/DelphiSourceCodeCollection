unit ufrmSuprExam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, CSDBEhGrdStore,
  CSScrCtrlChild, CSBarMDIChild, CSGrdColCtrl, CSEhGrdColCtrl, CSADOFilter,
  CSADOEhGrdFilter, CSDBBase, CSDBFind, CSDBEhGrdFind, dxmdaset, DB, ADODB,
  CSADOQuery, DBCtrls, CSDBNavigator, Mask, DBCtrlsEh, dxCntner, dxEditor,
  dxEdLib, dxDBELib, dxExEdtr, CSCustomdxDateEdit, CSdxDBDateEdit, dxDBEdtr,
  dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, FR_Class, FR_DSet, FR_DBSet,
  ufrmOrganMng;

type
  TfrmSuprExam = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbtnClose: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnConfirm: TBitBtn;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnPrint: TBitBtn;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ScrollBox1: TScrollBox;
    Panel4: TPanel;
    Panel5: TPanel;
    bbtnInsert: TBitBtn;
    bbtnDelete: TBitBtn;
    navList: TCSDBNavigator;
    bbtnListFind: TBitBtn;
    bbtnListFilter: TBitBtn;
    bbtnListColumn: TBitBtn;
    List: TCSADOQuery;
    Listd: TDataSource;
    ExamInfod: TDataSource;
    Temp: TCSADOQuery;
    mComInfo: TdxMemData;
    mComInfoBak: TdxMemData;
    ListFind: TCSDBEhGrdFind;
    ListFilter: TCSADOEhGrdFilter;
    ListColCtrl: TCSEhGrdColCtrl;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    mComInfod: TDataSource;
    ListEhGrdStore: TCSDBEhGrdStore;
    grdList: TDBGridEh;
    Label3: TLabel;
    ExamInfo: TCSADOQuery;
    ExamContent: TCSADOQuery;
    ExamContentd: TDataSource;
    ExamInfosysid: TStringField;
    ExamInfoexam_no: TStringField;
    ExamInfoexam_date: TStringField;
    ExamInfoexamcom_sysid: TStringField;
    ExamInfoexam_manager: TStringField;
    ExamInfoexam_com_persons: TStringField;
    ExamInfoexam_com_idea: TStringField;
    ExamInfoexam_circs: TStringField;
    ExamInfodev_num: TIntegerField;
    ExamInfodev_reg_num: TIntegerField;
    ExamInforeg_percent: TBCDField;
    ExamInforeq_verify_num: TIntegerField;
    ExamInfofin_verify_num: TIntegerField;
    ExamInfoverify_percent: TBCDField;
    ExamInfooperator_num: TIntegerField;
    ExamInfocert_operator_num: TIntegerField;
    ExamInfocert_percent: TBCDField;
    eExamNo: TdxDBEdit;
    StyleController: TdxEditStyleController;
    Label1: TLabel;
    eDevNum: TdxDBEdit;
    Label2: TLabel;
    eDevRegNum: TdxDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    eReqVerifyNum: TdxDBEdit;
    Label6: TLabel;
    eFinVerifyNum: TdxDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    eOperatorNum: TdxDBEdit;
    Label9: TLabel;
    eCertOperatorNum: TdxDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    deExamDate: TCSdxDBDateEdit;
    Label12: TLabel;
    Label13: TLabel;
    eExamManager: TdxDBEdit;
    mExamComIdea: TdxDBMemo;
    Label14: TLabel;
    Label15: TLabel;
    mExamCircs: TdxDBMemo;
    Label16: TLabel;
    eExamComPersons: TdxDBEdit;
    ExamContentsysid: TStringField;
    ExamContentexam_sysid: TStringField;
    ExamContentreq_exam_content: TStringField;
    ExamContentfact_exam_circs: TStringField;
    grdExamContent: TdxDBGrid;
    panRequirement: TPanel;
    Panel8: TPanel;
    bbtnExamGenerate: TBitBtn;
    navExamContent: TCSDBNavigator;
    Listsysid: TStringField;
    Listexam_no: TStringField;
    Listexam_date: TStringField;
    Listexamcom_sysid: TStringField;
    Listexamcom_name: TStringField;
    Listexam_manager: TStringField;
    Listexam_com_persons: TStringField;
    Listdev_num: TIntegerField;
    Listdev_reg_num: TIntegerField;
    Listreg_percent: TBCDField;
    Listreq_verify_num: TIntegerField;
    Listfin_verify_num: TIntegerField;
    Listverify_percent: TBCDField;
    Listoperator_num: TIntegerField;
    Listcert_operator_num: TIntegerField;
    Listcert_percent: TBCDField;
    Liststate: TIntegerField;
    ExamInfostate: TIntegerField;
    grdExamContentreq_exam_content: TdxDBGridMemoColumn;
    grdExamContentfact_exam_circs: TdxDBGridMemoColumn;
    dxEditStyleController1: TdxEditStyleController;
    ExamContentexam_no: TIntegerField;
    grdExamContentexam_no: TdxDBGridColumn;
    frPrintExam: TfrReport;
    frDBExamContent: TfrDBDataSet;
    eExamCom: TdxDBButtonEdit;
    ExamInfoexamcom_name: TStringField;
    eRegPercent: TdxDBButtonEdit;
    eVerifyPercent: TdxDBButtonEdit;
    eCertPercent: TdxDBButtonEdit;
    mComInfoexamcom_sysid: TStringField;
    mComInfoexamcom_name: TStringField;
    mComInfoBakexamcom_sysid: TStringField;
    mComInfoBakexamcom_name: TStringField;
    procedure ListAfterScroll(DataSet: TDataSet);
    procedure ExamInfoAfterScroll(DataSet: TDataSet);
    procedure ExamInfoAfterInsert(DataSet: TDataSet);
    procedure bbtnInsertClick(Sender: TObject);
    procedure bbtnListFindClick(Sender: TObject);
    procedure bbtnListFilterClick(Sender: TObject);
    procedure bbtnListColumnClick(Sender: TObject);
    procedure bbtnExamGenerateClick(Sender: TObject);
    procedure bbtnSaveClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCloseClick(Sender: TObject);
    procedure ExamInfoBeforeEdit(DataSet: TDataSet);
    procedure navListBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure bbtnPrintMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure eRegPercentButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure eVerifyPercentButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure eCertPercentButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure eExamComButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdListGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    Fs_PrevExamNo: string;
    Fb_ExamInfoChanged, Fb_ExamContentChanged, Fb_DisableSetChange: Boolean;
    procedure prip_IniData;
    procedure prip_IniInterface;
    procedure prip_SetInterface;    
    procedure prip_GetExamInfo(const As_Id: string = '');
    procedure prip_GetExamContent(const As_Id: string = '');
    procedure prip_GetComInfo(Asa_Ids: array of string);
    procedure prip_SelectCompany(const Ai_Category: Integer;
      const As_Field: string; Ac_Requestor: TfrmOrganMng);
    procedure prip_GenerateExamContent;
    procedure prip_PrintExam(Ab_IsDesign: Boolean);
    procedure prip_AfterEdit(DataSet: TDataSet);
    procedure prip_Delete;
    procedure prip_Refresh(const As_ID: string = '');
    procedure prip_Confirm;
    procedure prip_Cancel;
		function prif_CheckBlank(Ac_DataSet: TDataSet;
      Ac_Fields: array of TField): Boolean;
    function prif_Validate: Boolean;
    function prif_CheckSaved: Boolean;
    function prif_Save: Boolean;
  public
    procedure pubp_Ini;
  end;

var
  frmSuprExam: TfrmSuprExam;

implementation

uses
  Math, CSVCLUtils, udmData, CommonLib;

const
  SAVE_STATE = 0;
  CONFIRM_STATE = 1;

{$R *.dfm}

{ TfrmSuprExam }

procedure TfrmSuprExam.FormCreate(Sender: TObject);
begin
  Fb_ExamInfoChanged := False;
  Fb_ExamContentChanged := False;
  Fb_DisableSetChange := False;
  Fs_PrevExamNo := '';
end;

procedure TfrmSuprExam.pubp_Ini;
begin
  ScrChild.SetSecurity(Self);
  try
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    prip_IniData;

    ExamInfo.AfterEdit := prip_AfterEdit;
    
    with ExamContent do
    begin
      AfterEdit := prip_AfterEdit;
      AfterDelete := prip_AfterEdit;
    end;
    
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
    prip_IniInterface;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmSuprExam.prip_IniData;
begin
  with List do
  begin
    if Active then Close;
    SQL.Text := 'device.usp_getsuprexaminfo';
    Open;

    if IsEmpty then prip_GetExamInfo;
  end;

  if ExamInfo.IsEmpty then prip_GetExamContent;
end;

procedure TfrmSuprExam.prip_IniInterface;
var
  li_State: Integer;
begin
  li_State := ExamInfo.FieldByName('state').AsInteger;
  Fb_ExamInfoChanged := False;
  Fb_ExamContentChanged := False;
  bbtnSave.Enabled := False;
  bbtnCancel.Enabled := False;
  bbtnExamGenerate.Enabled := not (ExamInfo.IsEmpty or
    (li_State = CONFIRM_STATE));
  bbtnDelete.Enabled := not (ExamInfo.IsEmpty or (li_State = CONFIRM_STATE));
end;

procedure TfrmSuprExam.prip_GetExamContent(const As_Id: string);
begin
  with ExamContent do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.supr_exam_content ' +
        'WHERE exam_sysid = ''%s''', [As_ID]);
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmSuprExam.prip_GetExamInfo(const As_Id: string);
begin
  with ExamInfo do
  begin
    DisableControls;
    try
      if Active then Close;
      SQL.Text := Format('SELECT * FROM device.supr_exam_info ' +
        'WHERE sysid = ''%s''', [As_ID]);
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmSuprExam.ListAfterScroll(DataSet: TDataSet);
var
  ls_ExamID: string;
begin
  with DataSet do ls_ExamID := FieldByName('sysid').AsString;
  prip_GetExamInfo(ls_ExamID);
  prip_SetInterface;
end;

procedure TfrmSuprExam.ExamInfoAfterScroll(DataSet: TDataSet);
var
  ls_ExamID: string;
begin
  with DataSet do
  begin
    ls_ExamID := FieldByName('sysid').AsString;
    
    if State <> dsInsert then
      prip_GetComInfo([VarToStr(FieldValues['examcom_sysid'])]);
  end;

  prip_GetExamContent(ls_ExamID);
end;

procedure TfrmSuprExam.ExamInfoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldValues['sysid'] := Gf_GenSysId;
    FieldValues['state'] := SAVE_STATE;
  end;
  prip_AfterEdit(DataSet);
  prip_SetInterface;
end;

procedure TfrmSuprExam.bbtnInsertClick(Sender: TObject);
begin
  if prif_CheckSaved then ExamInfo.Append;
end;

procedure TfrmSuprExam.bbtnListFindClick(Sender: TObject);
begin
	ListFind.FindDlg;  
end;

procedure TfrmSuprExam.bbtnListFilterClick(Sender: TObject);
begin
	ListFilter.FilterDlg;
end;

procedure TfrmSuprExam.bbtnListColumnClick(Sender: TObject);
begin
	with ListColCtrl do
  begin
    InitColumns;
  	SetupDlg;
  end;
end;

procedure TfrmSuprExam.prip_GenerateExamContent;
var
  li_RecNo, li_End: Integer;
  ls_SysId: string;
begin
  with ExamInfo do if (not Active) or IsEmpty then Exit;
  with ExamContent do
  begin
    if not Active then Exit;

    if not IsEmpty then
      if Application.MessageBox('检查内容、要求已存在。重新生成将导致原有的' +
        '数据都丢失。您确定要重新生成吗?', PChar(Caption), MB_OKCANCEL +
        MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

    if Temp.Active then Temp.Close;
    Temp.SQL.Text := 'SELECT * FROM device.supr_exam_template';
    Temp.Open;

    ls_SysId := Gf_GenSysId;
    li_End := StrToInt(Copy(ls_SysId, 17, 4));
    ls_SysId := Copy(ls_SysId, 1, 16);
    li_RecNo := 1;

    DisableControls;
    try
      while not IsEmpty do Delete;

      while not Temp.Eof do
      begin
        Append;
        FieldByName('sysid').AsString := ls_SysId + Format('%.4d', [li_End]);
        FieldValues['exam_sysid'] := ExamInfo.FieldValues['sysid'];
        FieldValues['exam_no'] := li_RecNo;
        FieldValues['req_exam_content'] := Temp.FieldValues['exam_content'];
        Post;
        Inc(li_RecNo);
        Inc(li_End);
        Temp.Next;
      end;
    finally
      First;
      EnableControls;
    end;

    Temp.Close;
  end;
end;

procedure TfrmSuprExam.bbtnExamGenerateClick(Sender: TObject);
begin
  prip_GenerateExamContent;
end;

function TfrmSuprExam.prif_CheckSaved: Boolean;
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
  
  if Fb_ExamInfoChanged or Fb_ExamContentChanged then
  begin
    li_Result := Application.MessageBox('数据尚未保存，是否要保存数据?',
      PChar(Caption), MB_YESNOCANCEL + MB_ICONQUESTION);
    case li_Result of
      IDYES: Result := prif_Save;
      IDNO:
        begin
          ExamContent.CancelBatch;
          ExamInfo.CancelBatch;
          Result := True;
        end;
      IDCANCEL: Result := False;
    end;
  end;
end;

function TfrmSuprExam.prif_CheckBlank(Ac_DataSet: TDataSet;
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

function TfrmSuprExam.prif_Save: Boolean;
var
  ls_ExamID: string;
  lb_DetailUpdated: Boolean;
begin
  Result := False;
  
  if not prif_Validate then Exit;
  
  lb_DetailUpdated := False;
  Gp_ProgressHint('正在保存数据，请稍候...');
  dmData.adocon.BeginTrans;
  try
    with ExamInfo do
    begin
      Fb_DisableSetChange := True;
      ls_ExamID := FieldByName('sysid').AsString;
      try
        if State <> dsBrowse then Post;
      finally
        Fb_DisableSetChange := False;
      end;
    end;

    with ExamContent do
    begin
      if State <> dsBrowse then Post;
      UpdateBatch;
      lb_DetailUpdated := True;
    end;

    dmData.adocon.CommitTrans;

    Fb_ExamInfoChanged := False;
    Fb_ExamContentChanged := False;
    bbtnSave.Enabled := False;
    bbtnCancel.Enabled := False;

    mComInfoBak.LoadFromDataSet(mComInfo);
    
    Result := True;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      try
        with ExamInfo do
        begin
          if State = dsBrowse then Requery;
//          if IsEmpty then Append;
        end;
        if lb_DetailUpdated then prip_GetExamContent(ls_ExamID);
      except
      end;
      Application.MessageBox(PChar('执行保存时出错，错误原因：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
  Gp_ProgressHint;
end;

function TfrmSuprExam.prif_Validate: Boolean;
var
  ls_ExamNo: string;
begin
  with ExamInfo do
  begin
    Result := prif_CheckBlank(ExamInfo, [FieldByName('exam_no'),
      FieldByName('exam_date')]);
    if not Result then Exit;

    if ExamContent.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('没有输入监督检查的内容，不能保存。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      Exit;
    end;

    ls_ExamNo := VarToStr(FieldValues['exam_no']);
    if ls_ExamNo <> Fs_PrevExamNo then
    begin
      if Temp.Active then Temp.Close;
      Temp.SQL.Text := Format('SELECT sysid FROM device.supr_exam_info ' +
        'WHERE exam_no = ''%s''', [ls_ExamNo]);
      Temp.Open;
      if not Temp.IsEmpty then
      begin
        Result := False;
        eExamNo.SetFocus;
        Application.MessageBox('您输入的检查编号已存在，请修改。',
          PChar(Caption), MB_OK + MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmSuprExam.prip_Confirm;
begin
  if Application.MessageBox('是否真的要执行确认?', PChar(Caption),
    MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;

  if (Fb_ExamInfoChanged or Fb_ExamContentChanged) then
    if not prif_Save then Exit;

  Gp_ProgressHint('正在执行确认，请稍候...');
  try
    with ExamInfo do
    begin
      Fb_DisableSetChange := True;
      try
        Edit;
        FieldByName('state').AsInteger := CONFIRM_STATE;
        Post;
        prip_SetInterface;
      finally
        Fb_DisableSetChange := False;
      end;
    end;
    Gp_ProgressHint;
  except
    on E: Exception do
    begin
      Gp_ProgressHint;
      Application.MessageBox(PChar('执行确认时出错，错误原因：' + E.Message),
        PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmSuprExam.prip_Cancel;
var
  ls_ExamID: string;
begin
  Gp_ProgressHint('正在取消，请稍候...');
  try
    mComInfo.LoadFromDataSet(mComInfoBak);  
    ExamContent.CancelBatch;
    with ExamInfo do
    begin
      ls_ExamID := FieldByName('sysid').AsString;
      if State <> dsBrowse then Cancel;
    end;
    prip_GetExamContent(ls_ExamID);
    prip_IniInterface;
    prip_SetInterface;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmSuprExam.bbtnSaveClick(Sender: TObject);
var
  ls_ExamID: string;
begin
  ls_ExamID := ExamInfo.FieldbyName('sysid').AsString;
  if prif_Save then prip_Refresh(ls_ExamID);
end;

procedure TfrmSuprExam.bbtnCancelClick(Sender: TObject);
begin
  prip_Cancel;
end;

procedure TfrmSuprExam.bbtnConfirmClick(Sender: TObject);
var
  ls_ExamID: string;
begin
  prip_Confirm;
  ls_ExamID := ExamInfo.FieldbyName('sysid').AsString;
  prip_Refresh(ls_ExamID);
end;

procedure TfrmSuprExam.prip_AfterEdit(DataSet: TDataSet);
begin
  if Fb_DisableSetChange then Exit;

  if DataSet = ExamInfo then Fb_ExamInfoChanged := True;
  if DataSet = ExamContent then Fb_ExamContentChanged := True;

  if not bbtnSave.Enabled then bbtnSave.Enabled := True;
  if not bbtnCancel.Enabled then bbtnCancel.Enabled := True;
  if not bbtnDelete.Enabled then bbtnDelete.Enabled := True;
  if not bbtnExamGenerate.Enabled then bbtnExamGenerate.Enabled := True;
end;

procedure TfrmSuprExam.ExamInfoBeforeEdit(DataSet: TDataSet);
begin
  with DataSet do Fs_PrevExamNo := VarToStr(FieldValues['exam_no']);
end;

procedure TfrmSuprExam.prip_Refresh(const As_ID: string);
begin
  with List do
  begin
    Gp_ProgressHint('正在刷新，请稍候...');
    DisableControls;
    try
      if Active then Close;
      SQL.Text := 'device.usp_getsuprexaminfo';
      Open;
      if not IsEmpty then Locate('sysid', As_ID, []);
      if IsEmpty then prip_GetExamInfo;
      if ExamInfo.IsEmpty then prip_GetExamContent;
      prip_IniInterface;
    finally
      EnableControls;
      Gp_ProgressHint;
    end;
  end;
end;

procedure TfrmSuprExam.navListBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbRefresh) and (ExamInfo.State = dsBrowse) then
  begin
    prip_Refresh;
    Abort;
  end;
end;

procedure TfrmSuprExam.prip_Delete;
var
  ls_ExamID: string;
begin
  if Application.MessageBox('您确定要删除当前记录吗?', '确认',
    MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDCANCEL then Exit;

  Gp_ProgressHint('正在执行删除，请稍候...');
  ls_ExamID := ExamInfo.FieldByName('sysid').AsString;

  with dmData.adocon do
  begin
    BeginTrans;
    try
      Execute(Format('DELETE FROM device.supr_exam_info WHERE ' +
        'sysid = ''%s''', [ls_ExamID]));
      Execute(Format('DELETE FROM device.supr_exam_content ' +
        'WHERE exam_sysid = ''%s''', [ls_ExamID]));
      CommitTrans;
      prip_Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        Application.MessageBox(PChar('删除任务时出错，错误原因：' +
          E.Message), PChar(Caption), MB_OK + MB_ICONERROR);
      end;
    end;
  end;
  Gp_ProgressHint;
end;

procedure TfrmSuprExam.bbtnDeleteClick(Sender: TObject);
begin
  prip_Delete;
end;

procedure TfrmSuprExam.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := prif_CheckSaved;
end;

procedure TfrmSuprExam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSuprExam := nil;
end;

procedure TfrmSuprExam.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSuprExam.prip_PrintExam(Ab_IsDesign: Boolean);
var
  ls_PrintFile: string;
begin
  ls_PrintFile := Gs_AppPath + REPORTS_PATH + '特种设备安全监督检查表.frf';

  with frPrintExam do
  begin
    LoadFromFile(ls_PrintFile);
    if Ab_IsDesign then DesignReport else ShowReport;
  end;
end;

procedure TfrmSuprExam.bbtnPrintMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  prip_PrintExam(Shift = [ssShift, ssCtrl, ssAlt]);
end;

procedure TfrmSuprExam.prip_GetComInfo(Asa_Ids: array of string);
var
  li_Index: Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT sysid, name, 1 AS ix FROM device.organ_baseinfo ' +
      'WHERE sysid = ''%s''', [Asa_Ids[0]]);
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
    if ExamInfo.State <> dsInsert then mComInfoBak.LoadFromDataSet(mComInfo);
    Close;
  end;
end;

procedure TfrmSuprExam.eRegPercentButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  li_DevNum, li_DevRegNum: Integer;
begin
  with ExamInfo do
  begin
    li_DevNum := FieldByName('dev_num').AsInteger;
    li_DevRegNum := FieldByName('dev_reg_num').AsInteger;
    if li_DevNum <> 0 then
    begin
      Edit;
      FieldValues['reg_percent'] := RoundTo((li_DevRegNum/li_DevNum) * 100, -1);
    end else begin
      Application.MessageBox('设备台数不能为0', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      eDevNum.SetFocus;
    end;
  end;
end;

procedure TfrmSuprExam.eVerifyPercentButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  li_ReqVerifyNum, li_FinVerifyNum: Integer;
begin
  with ExamInfo do
  begin
    li_ReqVerifyNum := FieldByName('req_verify_num').AsInteger;
    li_FinVerifyNum := FieldByName('fin_verify_num').AsInteger;
    if li_ReqVerifyNum <> 0 then
    begin
      Edit;
      FieldValues['verify_percent'] :=
        RoundTo((li_FinVerifyNum/li_ReqVerifyNum) * 100, -1);
    end else begin
      Application.MessageBox('应检设备数不能为0', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      eReqVerifyNum.SetFocus;
    end;
  end;
end;

procedure TfrmSuprExam.eCertPercentButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  li_OperatorNum, li_CertOperatorNum: Integer;
begin
  with ExamInfo do
  begin
    li_OperatorNum := FieldByName('operator_num').AsInteger;
    li_CertOperatorNum := FieldByName('cert_operator_num').AsInteger;
    if li_OperatorNum <> 0 then
    begin
      Edit;
      FieldValues['cert_percent'] :=
        RoundTo((li_CertOperatorNum/li_OperatorNum) * 100, -1);
    end else begin
      Application.MessageBox('在岗操作员数不能为0', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      eOperatorNum.SetFocus;
    end;
  end;
end;

procedure TfrmSuprExam.prip_SelectCompany(const Ai_Category: Integer;
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
  with lc_Company, ExamInfo do
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

procedure TfrmSuprExam.eExamComButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  lc_OrganMng: TfrmOrganMng;
begin
  with ExamInfod do if (not AutoEdit) and (State = dsBrowse) then Exit;
  lc_OrganMng := TfrmOrganMng.Create(nil);
  try
    prip_SelectCompany(USER_SIGN, 'examcom_sysid', lc_OrganMng);
    with ExamInfo do
    begin
      Edit;
      FieldValues['examcom_sysid'] := lc_OrganMng.CurOrganId;
    end;
  finally
    if lc_OrganMng <> nil then lc_OrganMng.Free;
  end;
end;

procedure TfrmSuprExam.grdListGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  li_State: Integer;
begin
  with List do li_State := FieldByName('state').AsInteger;
  if li_State = CONFIRM_STATE then AFont.Color := clMedGray;
end;

procedure TfrmSuprExam.prip_SetInterface;
var
  li_State: Integer;
begin
  with ExamInfo do
    li_State := FieldByName('state').AsInteger;

  case li_State of
    SAVE_STATE:
      begin
        eExamNo.Enabled := True;
        deExamDate.Enabled := True;
        eExamCom.Enabled := True;
        eDevNum.Enabled := True;
        eDevRegNum.Enabled := True;
        eRegPercent.Enabled := True;
        eExamManager.Enabled := True;
        eReqVerifyNum.Enabled := True;
        eFinVerifyNum.Enabled := True;
        eVerifyPercent.Enabled := True;
        eExamComPersons.Enabled := True;
        eOperatorNum.Enabled := True;
        eCertOperatorNum.Enabled := True;
        eCertPercent.Enabled := True;
        mExamComIdea.Enabled := True;
        mExamCircs.Enabled := True;
        bbtnExamGenerate.Enabled := True;
        navExamContent.Enabled := True;
        bbtnDelete.Enabled := True;
        bbtnConfirm.Enabled := True;
        grdExamContent.OptionsBehavior :=
          grdExamContent.OptionsBehavior + [edgoEditing];
      end;
    CONFIRM_STATE:
      begin
        eExamNo.Enabled := False;
        deExamDate.Enabled := False;
        eExamCom.Enabled := False;
        eDevNum.Enabled := False;
        eDevRegNum.Enabled := False;
        eRegPercent.Enabled := False;
        eExamManager.Enabled := False;
        eReqVerifyNum.Enabled := False;
        eFinVerifyNum.Enabled := False;
        eVerifyPercent.Enabled := False;
        eExamComPersons.Enabled := False;
        eOperatorNum.Enabled := False;
        eCertOperatorNum.Enabled := False;
        eCertPercent.Enabled := False;
        mExamComIdea.Enabled := False;
        mExamCircs.Enabled := False;
        bbtnExamGenerate.Enabled := False;
        navExamContent.Enabled := False;
        bbtnDelete.Enabled := False;
        bbtnConfirm.Enabled := False;
        grdExamContent.OptionsBehavior :=
          grdExamContent.OptionsBehavior - [edgoEditing];
      end;
    else
      begin
        eExamNo.Enabled := True;
        deExamDate.Enabled := True;
        eExamCom.Enabled := True;
        eDevNum.Enabled := True;
        eDevRegNum.Enabled := True;
        eRegPercent.Enabled := True;
        eExamManager.Enabled := True;
        eReqVerifyNum.Enabled := True;
        eFinVerifyNum.Enabled := True;
        eVerifyPercent.Enabled := True;
        eExamComPersons.Enabled := True;
        eOperatorNum.Enabled := True;
        eCertOperatorNum.Enabled := True;
        eCertPercent.Enabled := True;
        mExamComIdea.Enabled := True;
        mExamCircs.Enabled := True;
        bbtnExamGenerate.Enabled := True;
        navExamContent.Enabled := True;
        bbtnDelete.Enabled := True;
        bbtnConfirm.Enabled := True;
        grdExamContent.OptionsBehavior :=
          grdExamContent.OptionsBehavior + [edgoEditing];
      end;
  end;
end;

end.
