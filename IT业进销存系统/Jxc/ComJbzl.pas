unit ComJbzl;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	Menus, ExtCtrls, DBCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
	Clipbrd, StdCtrls ,db, QuickRpt,dbtables,dbclient,comedit, ActnList,
	mconnect, Common, iniFiles, Variants;

type
  TfrmComJbzl = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
		Image2: TImage;
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnPreview: TMenuItem;
    smnPrint: TMenuItem;
    smnPrinterSetup: TMenuItem;
    N1: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    smnNew: TMenuItem;
    smnModify: TMenuItem;
    smnDel: TMenuItem;
		smnRefresh: TMenuItem;
    N2: TMenuItem;
    smnSearch: TMenuItem;
    smnAll: TMenuItem;
		PopupMenu1: TPopupMenu;
    pmnNew: TMenuItem;
    pmnModify: TMenuItem;
		pmnDel: TMenuItem;
    pmnRefresh: TMenuItem;
    smnTotal: TMenuItem;
    pmnTotal: TMenuItem;
    Image1: TImage;
    ActionList1: TActionList;
    aPreview: TAction;
    aPrint: TAction;
    aNew: TAction;
    aModify: TAction;
    aDel: TAction;
    aTotal: TAction;
		aRefresh: TAction;
    aSearch: TAction;
    aAll: TAction;
    aPrinterSetup: TAction;
    aExit: TAction;
    aSetColumn: TAction;
    N9: TMenuItem;
		mnuSetColumn: TMenuItem;
		aSetSort: TAction;
    mnuSetSort: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    pmnSetColumn: TMenuItem;
    pmnSetSort: TMenuItem;
    pmnSearch: TMenuItem;
    pmnAll: TMenuItem;
    labSort: TLabel;
    ControlBar1: TControlBar;
    ToolBar2: TToolBar;
		DBNavigator1: TDBNavigator;
    ToolBar1: TToolBar;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    ToolButton3: TToolButton;
    btnNew: TToolButton;
    btnModify: TToolButton;
		btnDel: TToolButton;
    ToolButton10: TToolButton;
    btnTotal: TToolButton;
    btnSearch: TToolButton;
    btnAll: TToolButton;
		labSearch: TLabel;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);virtual;
    procedure SetButton;virtual;
    procedure LoadEditForm(strState:string);virtual;
    procedure LoadPrintForm;virtual;
    procedure FormCreate(Sender: TObject);virtual;
    procedure dsOnNewRecord(DataSet: TDataSet);virtual;
    procedure dsAfterScroll(DataSet: TDataSet);virtual;
    procedure sDataChange(Sender: TObject; Field: TField);virtual;
    procedure OpenDataSet;virtual;
    procedure FormShow(Sender: TObject);virtual;
    procedure aPreviewExecute(Sender: TObject);virtual;
		procedure aPrintExecute(Sender: TObject);virtual;
		procedure aPrinterSetupExecute(Sender: TObject);virtual;
    procedure aExitExecute(Sender: TObject);virtual;
    procedure aNewExecute(Sender: TObject);virtual;
    procedure aModifyExecute(Sender: TObject);virtual;
    procedure aDelExecute(Sender: TObject);virtual;
    procedure aTotalExecute(Sender: TObject);virtual;
		procedure aRefreshExecute(Sender: TObject);virtual;
		procedure aSearchExecute(Sender: TObject);virtual;
		procedure aAllExecute(Sender: TObject);virtual;
		procedure FormActivate(Sender: TObject);virtual;
		procedure aSetColumnExecute(Sender: TObject);virtual;
		procedure aSetSortExecute(Sender: TObject);virtual;
		procedure FormResize(Sender: TObject);virtual;
		procedure FormKeyDown(Sender: TObject; var Key: Word;
			Shift: TShiftState);virtual;
	private
		{ Private declarations }
		blnPreview: boolean;
		cdsEve :cdsEventsArray;
		procedure SaveColumnQuery;
		function GetColumnInfo(FileName: string): string;
	public
		{ Public declarations }
		dsJbzl: Tclientdataset;
		rpt1: TQuickRep;
    ReportName: string;
		blnMyRpt: boolean;
		blnStopSetColumn: boolean;
		frmEdit: TfrmComEdit;
		strAutoScale: string;
    strSql: string;
		strTotalFields: string;
		strDetailTables: string;
		strDetailWheres: string;
	end;

var
	frmComJbzl: TfrmComJbzl;

implementation

uses
	Main, Filter, Dm, SetColumn, SetSort, SetPrint;

{$R *.DFM}

//Form.Create
procedure TfrmComJbzl.FormCreate(Sender: TObject);
begin
	screen.Cursor := crHourGlass;
end;

//Form.Show
procedure TfrmComJbzl.FormShow(Sender: TObject);
var
  i, j: integer;
  intWid: integer;
	tb: TToolButton;
  strFileName: string;
  c: TComponent;
begin
  //Log
  with Data.Tmp do
  begin
    Close;
    CommandText := 'insert into AppLog (uName, cName, CZ, RQ, SJ) ' +
      'values (''' + pstrUserName + ''', ' +
      '''' + pstrComputerName + ''', ' +
      '''' + self.Caption + ''', ' +
      '''' + FormatDateTime('yyyy-mm-dd', Date) + ''', ' +
      '''' + FormatDateTime('hh:nn', Time) + ''')';
    Execute;
  end;
  //Add ToolButton
  tb := TToolButton.Create(self);
  tb.Caption := self.Caption;
  tb.Hint := self.Name;
  tb.OnClick := frmMain.ToolButtonClick;
  tb.Parent := frmMain.tlbAForm;
  //Popedom
  if UpperCase(pstrUserCode) <> 'SYS' then
    with Data.Tmpl do
    begin
      Close;
      CommandText := 'select * from AppGroupAction ' +
        'where gName = ''' + pstrUserGroup + ''' and ' +
        'fName = ''' + self.Name + '''';
      Open;
      while not Eof do
      begin
        c := self.FindComponent(FieldByName('aName').AsString);
        if c <> nil then
        begin
          c.Tag := 1;
          if c is TCustomAction then
            TCustomAction(c).Enabled := false;
          if c is TControl then
            TControl(c).Enabled := false;
        end;
        Next;
      end;
    end;
  //DBGrid
  for i := 0 to self.ComponentCount - 1 do
    if (self.Components[i] is TDBGrid) then
    begin
      //Width
      with TDBGrid(self.Components[i]) do
      begin
        intWid := 0;
        for j := 0 to Columns.Count - 1 do
        begin
					Columns[j].Title.Alignment := taCenter;
          if Columns[j].Visible then
						intWid := intWid + Columns[j].Width;
        end;
        if intWid < Screen.Width Div 2 then
          for j := 0 to Columns.Count - 1 do
            Columns[j].Width := Trunc(Columns[j].Width * 1.5);
        //Auto Scale
        if (Pos(UpperCase(Name), UpperCase(strAutoScale)) > 0) then
          for j := 0 to Columns.Count - 1 do
            Columns[j].Width := Round(Columns[j].Width * (790 - GetSystemMetrics(SM_CXVSCROLL)) / intWid) - 1;
      end;
      //Save DBGrid1.Columns
      strFileName := ExtractFilePath(Application.ExeName) + 'Column\' +
        FormatFloat('0000', pintUserID) +
        self.Name + TDBGrid(self.Components[i]).Name;
      TDBGrid(self.Components[i]).Columns.SaveToFile(strFileName + '.int');
      if not blnStopSetColumn and (self.Components[i].Tag = 0) and
        (UpperCase(pstrUserCode) <> 'SYS') then
      begin
        //Set DBGrid1.Columns
        if FileExists(strFileName + '.cur') then
        begin
          strFileName := ExtractFilePath(Application.ExeName) + 'Column\' +
						FormatFloat('0000', pintUserID) +
            self.Name + TDBGrid(self.Components[i]).Name;
					TDBGrid(self.Components[i]).Columns.LoadFromFile(strFileName + '.cur');
        end
        else
          CopyFile(PChar(strFileName + '.int'), PChar(strFileName + '.cur'), True);
      end;
    end;
 //
	Label1.Caption := self.Caption;
	dsJbzl := TClientDataSet(DBGrid1.DataSource.DataSet);
	cdsEve := SaveCDSEvents(dsJbzl);
	dsJbzl.OnNewRecord := dsOnNewRecord;
	dsJbzl.AfterScroll := dsAfterScroll;
	DBGrid1.DataSource.OnDataChange := sDataChange;
	DBNavigator1.DataSource := DBGrid1.DataSource;
//  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([dsJbzl.Name,'']));
  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsJbzl.ProviderName, 2, Length(dsJbzl.ProviderName) - 1), '']));
  OpenDataSet;
  //Set Sort
  with CurDs do
  begin
    Close;
    CommandText := 'select * from AppSort ' +
      'where uID = ' + IntToStr(pintUserId) + ' and ' +
      'FormCaption = ''' + self.Name + DBGrid1.Name + '''';
    Open;
    if not IsEmpty then
    begin
      labSort.Caption := '排序方式: ' + FieldByName('iCaption').AsString;
			frmSetSort.AddIndexDef(TClientDataSet(DBGrid1.DataSource.DataSet),
        FieldByName('iFields').AsString,
				FieldByName('iDescFields').AsString);
		end
		else
		begin
			labSort.Caption := '排序方式: .';
//			frmSetSort.AddIndexDef(TClientDataSet(DBGrid1.DataSource.DataSet), '', '')
		end;
	end;
	screen.Cursor := crDefault;
end;

procedure TfrmComJbzl.FormActivate(Sender: TObject);
var
	i: integer;
begin
  ControlBar1.Visible := frmMain.mnuToolBar.Checked;
  for i := 0 to frmMain.tlbAForm.ButtonCount - 1 do
		if frmMain.tlbAForm.Buttons[i].Hint <> self.Name then
      frmMain.tlbAForm.Buttons[i].ImageIndex := 0
    else
      frmMain.tlbAForm.Buttons[i].ImageIndex := 1;
  //dsJbzl.CommandText
  if dsJbzl.CommandText <> strSql then
    OpenDataSet
  else
    dsJbzl.Refresh;
end;

//Form.Close
procedure TfrmComJbzl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	SaveColumnQuery;
	RestoreCDSEvents(dsJbzl, cdsEve);
  DBGrid1.DataSource.OnDataChange := nil;
  dsJbzl.Close;
//  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([dsJbzl.Name,'']));
  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsJbzl.ProviderName, 2, Length(dsJbzl.ProviderName) - 1), '']));
  Action := caFree;
end;

//Form.Resize
procedure TfrmComJbzl.FormResize(Sender: TObject);
begin
  ToolBar2.Left := ControlBar1.Left + ControlBar1.Width - ToolBar2.Width - ToolBar3.Width;
  ToolBar3.Left := ControlBar1.Left + ControlBar1.Width - ToolBar3.Width;
end;

//aPreview.Execute
procedure TfrmComJbzl.aPreviewExecute(Sender: TObject);
var
  bmJbzl: TBookMark;
begin
  screen.Cursor := crHourGlass;
  blnPreview := true;
  aExit.ShortCut := 0;
  ReportName := '';
  with dsJbzl do
  begin
    bmJbzl := GetBookmark;
    DisableControls;
    LoadPrintForm;
    if rpt1 <> nil then
    begin
      rpt1.Preview;
      rpt1.Free;
      rpt1 := nil;
    end;
    try
      GotoBookmark(bmJbzl);
    finally
      FreeBookmark(bmJbzl);
      EnableControls;
    end;
  end;
  aExit.ShortCut := VK_ESCAPE;
  screen.Cursor := crDefault;
end;

//aPrint.Execute
procedure TfrmComJbzl.aPrintExecute(Sender: TObject);
var
  bmJbzl: TBookMark;
  iniFile: TIniFile;
begin
  screen.Cursor := crHourGlass;
  blnPreview := false;
  aExit.ShortCut := 0;
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\DefRpt.ini');
  ReportName := iniFile.ReadString(self.Name, 'Name', '');
  iniFile.Free;
  with dsJbzl do
  begin
    bmJbzl := GetBookmark;
    DisableControls;
    LoadPrintForm;
    if rpt1 <> nil then
    begin
      rpt1.Print;
      rpt1.Free;
      rpt1 := nil;
    end;
    try
      GotoBookmark(bmJbzl);
    finally
      FreeBookmark(bmJbzl);
      EnableControls;
    end;
  end;
  aExit.ShortCut := VK_ESCAPE;
  screen.Cursor := crDefault;
end;

//aPrinterSetup.Execute
procedure TfrmComJbzl.aPrinterSetupExecute(Sender: TObject);
begin
  frmMain.PrinterSetupDialog1.Execute;
end;

//aExit.Execute
procedure TfrmComJbzl.aExitExecute(Sender: TObject);
begin
  Close;
end;

//aNew.Execute
procedure TfrmComJbzl.aNewExecute(Sender: TObject);
begin
  if aNew.Hint = 'A' then
    LoadEditForm('A')
  else
    LoadEditForm('I');
end;

//aModify.Execute
procedure TfrmComJbzl.aModifyExecute(Sender: TObject);
begin
  if aModify.Enabled then
    LoadEditForm('M');
end;

//aDel.Execute
procedure TfrmComJbzl.aDelExecute(Sender: TObject);
begin
  if not dsJbzl.IsEmpty Then
    if HaveDetail(dsJbzl, strDetailTables, strDetailWheres) Then
      Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
    else if Application.MessageBox('确定要删除此项资料吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dsJbzl.Delete;
      dsJbzl.ApplyUpdates(0);
      SetButton;
    end;
end;

//aTotal.Execute
procedure TfrmComJbzl.aTotalExecute(Sender: TObject);
var
  evnTmp: TDataSetNotifyEvent;
  bmJbzl: TBookMark;
  strValues: string;
  i: integer;
begin
  if not (Screen.ActiveControl is TDBGrid) then exit;
  evnTmp := nil;
  if (strTotalFields = '') or (Copy(strTotalFields, Length(strTotalFields), 1) <> ';') then
    strTotalFields := strTotalFields + ';';
  strValues := '';
  with TClientDataSet(TDBGrid(Screen.ActiveControl).DataSource.DataSet) do
  begin
    screen.Cursor := crHourGlass;
    bmJbzl := GetBookmark;
    DisableControls;
    try
      evnTmp := OnCalcFields;
      //取消此事件再统计后，DBGrid中的计算字段就不能显示
      //OnCalcFields := nil;
      Last;
      strValues := '总记录数 : ' + IntToStr(RecordCount);
      for i := 0 to TDBGrid(Screen.ActiveControl).Columns.Count - 1 do
        with TDBGrid(Screen.ActiveControl).Columns[i] do
          if Visible and
            (TDBGrid(Screen.ActiveControl).DataSource.DataSet.FindField(FieldName) <> nil) and
            (Field.FieldKind = fkData) and
            (Width > 0) and
            (Field is TNumericField) and
            (UpperCase(strTotalFields) <> 'EMPTY') and
            ((strTotalFields = ';') or (Pos(UpperCase(FieldName) + ';', UpperCase(strTotalFields)) > 0)) then
          begin
            strValues := strValues + #13#10#13#10 + Title.Caption + ' : ';
            with Aggregates.Add do
            begin
              Expression := 'sum(' + FieldName + ')';
              Active := true;
              if Value = null then
                strValues := strValues +
                  FormatFloat(TNumericField(Field).DisplayFormat, 0)
              else
                strValues := strValues +
                  FormatFloat(TNumericField(Field).DisplayFormat, Value);
            end;
          end;
      Aggregates.Clear;
      GotoBookmark(bmJbzl);
    finally
      FreeBookmark(bmJbzl);
      EnableControls;
      OnCalcFields := evnTmp;
      screen.Cursor := crdefault;
    end;
  end;
  Application.MessageBox(Pchar(strValues), '资料统计', MB_OK);
end;

//aRefresh.Execute
procedure TfrmComJbzl.aRefreshExecute(Sender: TObject);
begin
	screen.Cursor := crHourGlass;
  try
    dsJbzl.Refresh;
  finally
  	screen.Cursor := crDefault;
  end;
end;

//aSearch.Execute
procedure TfrmComJbzl.aSearchExecute(Sender: TObject);
begin
  frmFilter.dbgFt := DBGrid1;
  if aSearch.Tag = 1 then
    frmFilter.dsFt := dsJbzl;
  frmFilter.ShowModal;
  If frmFilter.strFt <> '' Then
  begin
//    TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([dsJbzl.Name, frmFilter.strFt]));
    TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsJbzl.ProviderName, 2, Length(dsJbzl.ProviderName) - 1), frmFilter.strFt]));
    dsJbzl.Refresh;
    dsJbzl.First;
    SetButton;
  end;
end;

//aAll.Execute
procedure TfrmComJbzl.aAllExecute(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  labSearch.Caption := '查询项目: .';
//  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([dsJbzl.Name,'']));
  TDcomConnection(Data.FindComponent(dsJbzl.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsJbzl.ProviderName, 2, Length(dsJbzl.ProviderName) - 1), '']));
  dsJbzl.Refresh;
  SetButton;
  screen.Cursor := crDefault;
end;

//aSetColumn.Execute
procedure TfrmComJbzl.aSetColumnExecute(Sender: TObject);
begin
  if not (Screen.ActiveControl is TDBGrid) then exit;
  frmSetColumn.strFormName := self.Name;
  frmSetColumn.dbgSC := TDBGrid(Screen.ActiveControl);
  frmSetColumn.ShowModal;
end;

//aSetSort.Execute
procedure TfrmComJbzl.aSetSortExecute(Sender: TObject);
begin
  if not (Screen.ActiveControl is TDBGrid) then exit;
  frmSetSort.dbgSS := TDBGrid(Screen.ActiveControl);
  frmSetSort.ShowModal;
end;

{*****自定义过程*****}

//LoadEditForm
procedure TfrmComJbzl.LoadEditForm(strState:string);
begin
  frmEdit.strState := strState;
  frmEdit.ShowModal;
  frmEdit.Free;
  SetButton;
end;

//LoadPrintForm
procedure TfrmComJbzl.LoadPrintForm;
begin
  if frmSetPrint = nil then
    frmSetPrint := TfrmSetPrint.Create(application);
  with frmSetPrint do
  begin
    AForm := TfrmComJbzl(self);
    AGrid := TDBGrid(Screen.ActiveControl);
    ADataSet := TClientDataSet(TDBGrid(Screen.ActiveControl).DataSource.DataSet);
    blnPreview := self.blnPreview;
    ShowModal;
    self.ReportName := ReportName;
    Free;
  end;
  frmSetPrint := nil;
end;

//SetButton
procedure TfrmComJbzl.SetButton;
begin
  aPrint.Enabled := aPrint.Tag = 0;
  aPreview.Enabled := aPrint.Enabled;
  aNew.Enabled := aNew.Tag = 0;
  aModify.Enabled := (aModify.Tag = 0) and not (dsJbzl.IsEmpty);
  aDel.Enabled := (aDel.Tag = 0) and not (dsJbzl.IsEmpty);
  aTotal.Enabled := aTotal.Tag = 0;
end;

//OpenDataSet
procedure TfrmComJbzl.OpenDataSet;
var
  SaveCursor: TCursor;
begin
  SaveCursor := screen.Cursor;
  screen.Cursor := crHourGlass;
  dsJbzl.Close;
  dsJbzl.Open;
  strSql := dsJbzl.CommandText;
  SetButton;
  screen.Cursor := SaveCursor;
end;

//dsOnNewRecord
procedure TfrmComJbzl.dsOnNewRecord(DataSet: TDataSet);
begin
//
end;

//sDataChange
procedure TfrmComJbzl.sDataChange(Sender: TObject; Field: TField);
begin
//
end;

//SaveColumnQuery
procedure TfrmComJbzl.SaveColumnQuery;
var
  i: integer;
  strFileName: string;
  strOld, strNew: string;
begin
  if blnStopSetColumn then exit;
  for i := 0 to self.ComponentCount - 1 do
    if (self.Components[i] is TDBGrid) and (self.Components[i].Tag = 0) and
      (UpperCase(pstrUserCode) <> 'SYS') then
    begin
      strFileName := ExtractFilePath(Application.ExeName) + 'Column\' +
        FormatFloat('0000', pintUserID) +
        self.Name + TDBGrid(self.Components[i]).Name;
      TDBGrid(self.Components[i]).Columns.SaveToFile(strFileName + '.new');
      strOld := self.GetColumnInfo(strFileName + '.cur');
      strNew := self.GetColumnInfo(strFileName + '.new');
      if strOld <> strNew then
        if Application.MessageBox('是否保存对栏目布局的更改?',
          '栏目布局', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
          TDBGrid(self.Components[i]).Columns.SaveToFile(strFileName + '.cur');
    end;
end;

//GetColumnInfo
function TfrmComJbzl.GetColumnInfo(FileName: string): string;
var
  strTmp, strTxt: string;
  f: TextFile;
begin
  if FileExists(FileName) then
  begin
    strTxt := '';
    AssignFile(f, FileName);
    Reset(f);
    try
      while not Eof(f) do
      begin
        Readln(f, strTmp);
        strTxt := strTxt + strTmp;
      end;
    finally
      CloseFile(f);
    end;
    result := strTxt;
  end
  else
    result := '';
end;

procedure TfrmComJbzl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Char(Key) in ['f', 'F']) then
    aSearch.Execute;
  if Screen.ActiveControl is TDBGrid then
  begin
    case Key of
      VK_DELETE :
        begin
          Key := 0;
          aDel.Execute;
        end;
      VK_LEFT :
        begin
          Key := 0;
          TDBGrid(Screen.ActiveControl).Perform(WM_HSCROLL, 0, 0);
        end;
      VK_RIGHT :
        begin
          Key := 0;
          TDBGrid(Screen.ActiveControl).Perform(WM_HSCROLL, 1, 0);
        end;
    end;
  end;
end;

procedure TfrmComJbzl.dsAfterScroll(DataSet: TDataSet);
begin
//
end;

end.
