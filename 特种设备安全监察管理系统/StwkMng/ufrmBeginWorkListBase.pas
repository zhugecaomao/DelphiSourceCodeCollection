unit ufrmBeginWorkListBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CSScrCtrlChild, CSBarMDIChild, CSGrdColCtrl, CSdxGrdColCtrl,
  CSADOFilter, CSADOdxGrdFilter, CSDBBase, CSDBFind, CSDBdxGrdFind, DB,
  ADODB, CSADOQuery, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxEditor, dxEdLib, StdCtrls, Buttons, ExtCtrls, CSRowCountPanel,
  CSdxDateEdit, CSCustomdxDateEdit, dxDBTLCl, dxGrClms;

type
  TfrmBeginWorkListBase = class(TForm)
    List: TCSADOQuery;
    Listd: TDataSource;
    ListFind: TCSDBdxGrdFind;
    ListFilter: TCSADOdxGrdFilter;
    ListColCtrl: TCSdxGrdColCtrl;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbtnFind: TBitBtn;
    bbtnFilter: TBitBtn;
    bbtnColCtrl: TBitBtn;
    deStartDate: TCSdxDateEdit;
    deEndDate: TCSdxDateEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    bbtnClose: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnAddReport: TBitBtn;
    bbtnEditReport: TBitBtn;
    bbtnDeleteReport: TBitBtn;
    bbtnRefresh: TBitBtn;
    grdList: TdxDBGrid;
    Temp: TCSADOQuery;
    bbtnCollapse: TBitBtn;
    bbtnExpand: TBitBtn;
    CSRowCountPanel1: TCSRowCountPanel;
    Listsysid: TStringField;
    Listreport_no: TStringField;
    Listdev_kind: TStringField;
    Listconst_kind: TStringField;
    Listappraise_date: TStringField;
    Listproject_name: TStringField;
    Listproperty_com: TStringField;
    Listproperty_address: TStringField;
    Listproperty_manager: TStringField;
    Listmanager_tel: TStringField;
    Listprj_design_com: TStringField;
    Listcontract_no: TStringField;
    Listcontract_date: TStringField;
    Listbuild_project: TStringField;
    Listdev_num: TIntegerField;
    Liststart_date: TStringField;
    Listend_date: TStringField;
    Listbuild_charge: TBCDField;
    Listdev_charge: TBCDField;
    Listconst_com: TStringField;
    Listconst_address: TStringField;
    Listconst_reg_no: TStringField;
    Listconst_deputy: TStringField;
    Listconst_lics_no: TStringField;
    Listconst_lics_date: TStringField;
    Listconst_group: TStringField;
    Listconst_group_address: TStringField;
    Listconst_group_tel: TStringField;
    Listconst_group_fax: TStringField;
    Listconst_manager: TStringField;
    Listconst_manager_tel: TStringField;
    Listconst_instructor: TStringField;
    Listconst_instructor_tel: TStringField;
    Listidea_content: TStringField;
    Listnotice_no: TStringField;
    Listnotice_date: TStringField;
    Listremark: TStringField;
    Listoutflag: TIntegerField;
    Liststate: TIntegerField;
    grdListreport_no: TdxDBGridMaskColumn;
    grdListdev_kind: TdxDBGridMaskColumn;
    grdListconst_kind: TdxDBGridMaskColumn;
    grdListappraise_date: TdxDBGridMaskColumn;
    grdListproject_name: TdxDBGridMaskColumn;
    grdListproperty_com: TdxDBGridMaskColumn;
    grdListproperty_address: TdxDBGridMaskColumn;
    grdListproperty_manager: TdxDBGridMaskColumn;
    grdListmanager_tel: TdxDBGridMaskColumn;
    grdListprj_design_com: TdxDBGridMaskColumn;
    grdListcontract_no: TdxDBGridMaskColumn;
    grdListcontract_date: TdxDBGridMaskColumn;
    grdListbuild_project: TdxDBGridMaskColumn;
    grdListdev_num: TdxDBGridMaskColumn;
    grdListstart_date: TdxDBGridMaskColumn;
    grdListend_date: TdxDBGridMaskColumn;
    grdListbuild_charge: TdxDBGridCurrencyColumn;
    grdListdev_charge: TdxDBGridCurrencyColumn;
    grdListconst_com: TdxDBGridMaskColumn;
    grdListconst_address: TdxDBGridMaskColumn;
    grdListconst_reg_no: TdxDBGridMaskColumn;
    grdListconst_deputy: TdxDBGridMaskColumn;
    grdListconst_lics_no: TdxDBGridMaskColumn;
    grdListconst_lics_date: TdxDBGridMaskColumn;
    grdListconst_group: TdxDBGridMaskColumn;
    grdListconst_group_address: TdxDBGridMaskColumn;
    grdListconst_group_tel: TdxDBGridMaskColumn;
    grdListconst_group_fax: TdxDBGridMaskColumn;
    grdListconst_manager: TdxDBGridMaskColumn;
    grdListconst_manager_tel: TdxDBGridMaskColumn;
    grdListconst_instructor: TdxDBGridMaskColumn;
    grdListconst_instructor_tel: TdxDBGridMaskColumn;
    grdListidea_content: TdxDBGridMaskColumn;
    grdListnotice_no: TdxDBGridMaskColumn;
    grdListnotice_date: TdxDBGridMaskColumn;
    grdListstate: TdxDBGridMaskColumn;
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFindClick(Sender: TObject);
    procedure bbtnFilterClick(Sender: TObject);
    procedure bbtnColCtrlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnAddReportClick(Sender: TObject);
    procedure bbtnEditReportClick(Sender: TObject);
    procedure bbtnDeleteReportClick(Sender: TObject);
    procedure bbtnRefreshClick(Sender: TObject);
    procedure grdListCustomDraw(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure grdListChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure bbtnCollapseClick(Sender: TObject);
    procedure bbtnExpandClick(Sender: TObject);
  private
    procedure prip_SetBtnState;
    procedure prip_IniInterface;
    procedure prip_Refresh(const As_Id: string = '');
    procedure prip_AddReport;
    procedure prip_EditReport;
    procedure prip_DeleteReport;
  protected
    Rs_DetailTable: string;
    function prof_CreateManage: TForm; virtual;
    procedure prop_IniData; virtual;
  public
    procedure pubp_Ini;
  end;

implementation

uses
  DateUtils, CSVCLUtils, CSScrCtrlMaster, udmData, CommonLib,
  ufrmBeginWorkManageBase;

const
  CONFIRM_STATE = 1;
{$R *.dfm}

{ TfrmBeginWorkListBase }

procedure TfrmBeginWorkListBase.prip_AddReport;
var
  ls_Id: string;
  lc_Args: TStrings;
  lc_BeginWorkManage: TfrmBeginWorkManageBase;
begin
  ls_Id := '';

  lc_Args := TStringList.Create;
  try
    lc_Args.Add(ls_Id);
    lc_BeginWorkManage := TfrmBeginWorkManageBase(prof_CreateManage);
    with lc_BeginWorkManage do
    begin
      try
        pubp_Ini(AM_VMADDREPORT, lc_Args);
        ShowModal;
        if DataModified then prip_Refresh(BWGeneralId);
      finally
        Free;
      end;
    end;
  finally
    lc_Args.Free;
  end;
end;

procedure TfrmBeginWorkListBase.prip_DeleteReport;
var
  ls_Id: string;
  lc_Args: TStrings;
  lc_BeginWorkManage: TfrmBeginWorkManageBase;

  procedure PerformDelete;
  begin
    Gp_ProgressHint('正在执行删除，请稍候...');
    with dmData.adocon do
    begin
      BeginTrans;
      try
        Execute(Format('DELETE FROM device.equipment_stwk_report WHERE ' +
          'sysid = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_device ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_person ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_build ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_const ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_doc ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));
        Execute(Format('DELETE FROM device.equipment_stwk_supr ' +
          'WHERE stwk_id = ''%s''', [ls_Id]));

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

begin
  with List do
  begin
    if (not Active) or IsEmpty then Exit;
    ls_Id := FieldByName('sysid').AsString;
  end;
  lc_Args := TStringList.Create;
  try
    lc_Args.Add(ls_Id);
    lc_BeginWorkManage := TfrmBeginWorkManageBase(prof_CreateManage);
    with lc_BeginWorkManage do
      try
        pubp_Ini(AM_VMDELETEREPORT, lc_Args);
        ShowModal;
        if ModalResult = mrOK then PerformDelete;
      finally
        Free;
      end;
  finally
    lc_Args.Free;
  end;
end;

procedure TfrmBeginWorkListBase.prip_EditReport;
var
  ls_Id: string;
  lc_Args: TStrings;
  lc_BeginWorkManage: TfrmBeginWorkManageBase;
begin
  with List do
  begin
    if (not Active) or IsEmpty then Exit;
    ls_Id := FieldByName('sysid').AsString;
  end;
  lc_Args := TStringList.Create;
  try
    lc_Args.Add(ls_Id);
    lc_BeginWorkManage := TfrmBeginWorkManageBase(prof_CreateManage);
    with lc_BeginWorkManage do
    begin
      try
        pubp_Ini(AM_VMEDITREPORT, lc_Args);
        ShowModal;
        if DataModified then prip_Refresh(BWGeneralId);
      finally
        Free;
      end;
    end;
  finally
    lc_Args.Free;
  end;
end;

procedure TfrmBeginWorkListBase.prop_IniData;
var
  ls_StartDate, ls_EndDate: string;
begin
  ls_StartDate := deStartDate.Text;
  ls_EndDate := deEndDate.Text;
  with List do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT * FROM device.equipment_stwk_report WHERE ' +
      '(start_date >= ''%s'' AND start_date <=  ''%s'') OR state <> ' +
      IntToStr(CONFIRM_STATE), [ls_StartDate, ls_EndDate]);
    Open;
  end;
end;

procedure TfrmBeginWorkListBase.prip_IniInterface;
begin
  prip_SetBtnState;
  with grdList do
  begin
    FullExpand;
    GotoFirst;
  end;
end;

procedure TfrmBeginWorkListBase.prip_Refresh(const As_Id: string);
begin
  prop_IniData;
  prip_SetBtnState;
  grdList.FullExpand;
  if not List.Locate('sysid', As_Id, []) then grdList.GotoFirst;
end;

procedure TfrmBeginWorkListBase.pubp_Ini;
begin
  ScrChild.SetSecurity(Self);
  Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
  try
    prop_IniData;
    Position := poScreenCenter;
    BorderIcons := BorderIcons -[biMinimize];
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
    prip_IniInterface;
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmBeginWorkListBase.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBeginWorkListBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBeginWorkListBase.bbtnFindClick(Sender: TObject);
begin
  ListFind.FindDlg;
end;

procedure TfrmBeginWorkListBase.bbtnFilterClick(Sender: TObject);
begin
  ListFilter.FilterDlg;
end;

procedure TfrmBeginWorkListBase.bbtnColCtrlClick(Sender: TObject);
begin
  with ListColCtrl do
  begin
    InitColumns;
    SetupDlg;
  end;
end;

procedure TfrmBeginWorkListBase.FormCreate(Sender: TObject);
begin
  with grdList do
  begin
    IniFileName := Gs_AppPath + USERCONFIG_NAME;
    LoadFromIniFile(IniFileName);
  end;

  Rs_DetailTable := '';
  
  deStartDate.Date := IncDay(ToDay, -60);
  deEndDate.Date := IncDay(ToDay, 60);
end;

procedure TfrmBeginWorkListBase.bbtnAddReportClick(Sender: TObject);
begin
  prip_AddReport;  
end;

procedure TfrmBeginWorkListBase.bbtnEditReportClick(Sender: TObject);
begin
  prip_EditReport;
end;

procedure TfrmBeginWorkListBase.bbtnDeleteReportClick(Sender: TObject);
begin
  prip_DeleteReport;
end;

procedure TfrmBeginWorkListBase.bbtnRefreshClick(Sender: TObject);
begin
  prip_Refresh;
end;

procedure TfrmBeginWorkListBase.grdListCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
var
  li_StateIndex, li_State: Integer;
begin
  if ANode.HasChildren then Exit;
  li_StateIndex := grdList.ColumnByFieldName('state').Index;
  if ANode.Strings[li_StateIndex] = '' then Exit;
  li_State := StrToInt(ANode.Strings[li_StateIndex]);
  if li_State = CONFIRM_STATE then AFont.Color := CL_CONFIRM;
end;

procedure TfrmBeginWorkListBase.grdListChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var
  li_StateIndex, li_State: Integer;
begin
  if Node.HasChildren then li_State := List.FieldByName('state').AsInteger
  else begin
    li_StateIndex := grdList.ColumnByFieldName('state').Index;
    li_State := StrToInt(Node.Strings[li_StateIndex]);
  end;
  if li_State = CONFIRM_STATE then
  begin
    bbtnEditReport.Caption := '查看报告';
    bbtnEditReport.Enabled := True;
    bbtnDeleteReport.Enabled := False;
  end else begin
    bbtnEditReport.Caption := '修改报告';
    bbtnEditReport.Enabled := True;
    bbtnDeleteReport.Enabled := True;
  end;
end;

procedure TfrmBeginWorkListBase.prip_SetBtnState;
begin
  bbtnEditReport.Caption := '修改报告';
  if List.IsEmpty then
  begin
    bbtnEditReport.Enabled := False;
    bbtnDeleteReport.Enabled := False;
  end else with grdList do
    OnChangeNode(grdList, TopVisibleNode, TopVisibleNode);
end;

procedure TfrmBeginWorkListBase.bbtnCollapseClick(Sender: TObject);
begin
  grdList.FullCollapse;
end;

procedure TfrmBeginWorkListBase.bbtnExpandClick(Sender: TObject);
begin
  grdList.FullExpand;
end;

function TfrmBeginWorkListBase.prof_CreateManage: TForm;
begin
  Result := nil;
end;

end.
