unit ComMx;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, DBCtrls, ImgList, ComCtrls, Menus, ToolWin, Grids, DBGrids,
	StdCtrls, Mask,Clipbrd,db, Buttons, DBTables, QuickRpt, DBClient,
	ActnList, Common, iniFiles, mconnect, Variants;

type
  TfrmComMx = class(TForm)
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnSave: TMenuItem;
    smnCancel: TMenuItem;
    LineF1: TMenuItem;
    smnPreview: TMenuItem;
    smnPrint: TMenuItem;
    LineF2: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    PopupMenu1: TPopupMenu;
    pmnSave: TMenuItem;
    pmnCancel: TMenuItem;
    Stool: TMenuItem;
    Panel1: TPanel;
    ControlBar1: TControlBar;
		ToolBar1: TToolBar;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    ToolButton9: TToolButton;
    N11: TMenuItem;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    smmCalendar: TMenuItem;
		smmCalculator: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    aSearch: TAction;
    aAll: TAction;
    aPreview: TAction;
    aPrint: TAction;
		aExit: TAction;
    aCalendar: TAction;
    aCalculator: TAction;
    mnuSetColumn: TMenuItem;
    pmnSetColumn: TMenuItem;
    ToolBar3: TToolBar;
    btnExit: TToolButton;
    Shape2: TShape;
    aSetColumn: TAction;
    aSetSort: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    mnuSetSoft: TMenuItem;
    LineE1: TMenuItem;
    F1: TMenuItem;
    L1: TMenuItem;
    pmnSetSort: TMenuItem;
    procedure FormCreate(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);virtual;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure aPreviewExecute(Sender: TObject);virtual;
		procedure aPrintExecute(Sender: TObject);virtual;
    procedure aCalendarExecute(Sender: TObject);virtual;
    procedure aCalculatorExecute(Sender: TObject);virtual;
    procedure aExitExecute(Sender: TObject);virtual;
    procedure aSetColumnExecute(Sender: TObject);
    procedure aSetSortExecute(Sender: TObject);
    procedure LoadPrintForm;virtual;
    procedure IniRecord; virtual;
    procedure aSearchExecute(Sender: TObject);
    procedure aAllExecute(Sender: TObject);
    procedure SetButton;virtual;
  private
		{ Private declarations }
		cdsMxEve: cdsEventsArray;
    blnPreview: boolean;
    procedure SaveColumnQuery;
    function GetColumnInfo(FileName: string): string;
    procedure TotalLabel;
  public
    { Public declarations }
    ReportName: string;
    dsMx : TClientDataSet;
    rpt1 : TQuickRep;
		blnStopSetColumn: boolean;
		strAutoScale: string;
  end;

var
  frmComMx: TfrmComMx;

implementation

uses
	Dm, Main, Wnl, SetColumn, SetPrint, SetCal, SetSort, Filter;

{$R *.DFM}

//Form.Create
procedure TfrmComMx.FormCreate(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  if self.icon.Empty then
    self.icon := screen.ActiveForm.Icon;
end;

//Form.Show
procedure TfrmComMx.FormShow(Sender: TObject);
var
  i, j: integer;
  intWid: integer;
  ctrTmp: TControl;
  CShape: TShape;
  strFileName: string;
begin
	dsMx := TClientDataSet(DBGrid1.DataSource.DataSet);
	cdsMxEve := SaveCDSEvents(dsMx);
  //DBGrid
  for i := 0 to self.ComponentCount - 1 do
    if self.Components[i] is TDBGrid then
    begin
      //Title.Alignment
      with TDBGrid(self.Components[i]) do
      begin
        intWid := 0;
        for j := 0 to Columns.Count - 1 do
        begin
          Columns[j].Title.Alignment := taCenter;
          if Columns[j].Visible then
            intWid := intWid + Columns[j].Width;
        end;
{        if intWid < Screen.Width div 2 then
          for j := 0 to Columns.Count - 1 do
            Columns[j].Width := Trunc( Columns[j].Width * 1.5 );}
        //Auto Scale
        if (Pos(UpperCase(Name), UpperCase(strAutoScale)) > 0) then
        begin
          for j := 0 to Columns.Count - 1 do
            Columns[j].Width := Round(Columns[j].Width * (Width - GetSystemMetrics(SM_CXVSCROLL)) / intWid) - 1;
          Columns[0].Width := Columns[0].Width - 2;
        end;
      end;
      //Save olumns
      strFileName := ExtractFilePath(Application.ExeName) + 'Column\' +
        FormatFloat('0000', pintUserID) +
        self.Name + TDBGrid(self.Components[i]).Name;
      TDBGrid(self.Components[i]).Columns.SaveToFile(strFileName + '.int');
      if not blnStopSetColumn and (self.Components[i].Tag = 0) and
        (UpperCase(pstrUserCode) <> 'SYS') then
      begin
        //Set Columns
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
	//Set Title Space
	if Label1.Caption = 'Title' then
	begin
		Label1.Caption := '';
		for i := 1 to Length(self.Caption) div 2 do
			Label1.Caption := Label1.Caption + Copy(self.Caption, i * 2 - 1, 2) + '  ';
		Label1.Caption := Trim(Label1.Caption);
	end;
	//Create Lines, set Color, ToolBar1.Width
	for i := 0 to self.ComponentCount - 1 do
	begin
		ctrTmp := TControl(self.Components[i]);
    if (ctrTmp is TToolButton) and (ctrTmp.Parent = ToolBar1) and
      ((ctrTmp.Left + ctrTmp.Width + 1) > ToolBar1.Width) then
      ToolBar1.Width := ctrTmp.Left + ctrTmp.Width + 1;
    if (ctrTmp is TLabel) and (ctrTmp.Tag = 1) then
    begin
      if TLabel(ctrTmp).Color = cl3DLight then
        TLabel(ctrTmp).Color := TPanel(ctrTmp.Parent).Color;
      CShape := TShape.Create(self);
      with CShape do
      begin
        Parent := ctrTmp.Parent;
        Top := ctrTmp.Top + ctrTmp.Height;
        Left := ctrTmp.Left;
        Width := ctrTmp.Width;
        Height := 1;
      end;
    end;
  end;
  ToolBar3.Left := ControlBar1.Left + ControlBar1.Width - ToolBar3.Width;
  IniRecord;
  screen.Cursor := crdefault;
end;

//Form.Close
procedure TfrmComMx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	SaveColumnQuery;
	RestoreCDSEvents(dsMx, cdsMxEve);
	dsMx.Close;
end;

//Form.KeyDown
procedure TfrmComMx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Char(Key) in ['f', 'F']) then
    aSearch.Execute;
  if Screen.ActiveControl is TDBGrid then
  begin
    case Key of
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

//aPreview.Execute
procedure TfrmComMx.aPreviewExecute(Sender: TObject);
var
  bmMx: TBookMark;
begin
  screen.Cursor := crHourGlass;
  blnPreview := true;
  aExit.ShortCut := 0;
  ReportName := '';
  with dsMx do
  begin
    bmMx := GetBookmark;
    DisableControls;
    LoadPrintForm;
    if rpt1 <> nil then
    begin
      rpt1.Preview;
      rpt1.Free;
      rpt1 := nil;
    end;
    try
      GotoBookmark(bmMx);
    finally
      FreeBookmark(bmMx);
      EnableControls;
    end;
  end;
  aExit.ShortCut := VK_ESCAPE;
  screen.Cursor := crDefault;
end;

//aPrint.Execute
procedure TfrmComMx.aPrintExecute(Sender: TObject);
var
  bmMx: TBookMark;
  iniFile: TIniFile;
begin
  screen.Cursor := crHourGlass;
  blnPreview := false;
  aExit.ShortCut := 0;
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\DefRpt.ini');
  ReportName := iniFile.ReadString(self.Name, 'Name', '');
  iniFile.Free;
  with dsMx do
  begin
    bmMx := GetBookmark;
    DisableControls;
    LoadPrintForm;
    if rpt1 <> nil then
    begin
      rpt1.Print;
      rpt1.Free;
      rpt1 := nil;
    end;
    try
      GotoBookmark(bmMx);
    finally
      FreeBookmark(bmMx);
      EnableControls;
    end;
  end;
  aExit.ShortCut := VK_ESCAPE;
  screen.Cursor := crDefault;
end;

//aCalendar.Execute
procedure TfrmComMx.aCalendarExecute(Sender: TObject);
begin
  if frmWnl = nil then
    frmWnl := TfrmWnl.Create(self);
  frmWnl.MonthCalendar1.Date := Date();
  frmWnl.Show;
end;

//aCalculator.Execute
procedure TfrmComMx.aCalculatorExecute(Sender: TObject);
begin
  WinExec( 'Calc.exe', SW_SHOWDEFAULT );
end;

//aExit.Execute
procedure TfrmComMx.aExitExecute(Sender: TObject);
begin
  Close;
end;

//aSetColumn.Execute
procedure TfrmComMx.aSetColumnExecute(Sender: TObject);
begin
  frmSetColumn.strFormName := self.Name;
  if not (Screen.ActiveControl is TDBGrid) then
    frmSetColumn.dbgSC := DBGrid1
  else
    frmSetColumn.dbgSC := TDBGrid(Screen.ActiveControl);
  frmSetColumn.ShowModal;
end;

//aSetSort.Execute
procedure TfrmComMx.aSetSortExecute(Sender: TObject);
begin
  if not (Screen.ActiveControl is TDBGrid) then exit;
  frmSetSort.dbgSS := TDBGrid(Screen.ActiveControl);
  frmSetSort.ShowModal;
end;

//aSearch.Execute
procedure TfrmComMx.aSearchExecute(Sender: TObject);
begin
  frmFilter.dbgFt := DBGrid1;
  if aSearch.Tag = 1 then
    frmFilter.dsFt := dsMx;
  frmFilter.ShowModal;
  If frmFilter.strFt <> '' Then
  begin
    TDcomConnection(Data.FindComponent(dsMx.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsMx.ProviderName, 2, Length(dsMx.ProviderName) - 1), frmFilter.strFt]));
    dsMx.Refresh;
    TotalLabel;
    SetButton;
  end;
end;

//aAll.Execute
procedure TfrmComMx.aAllExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  TDcomConnection(Data.FindComponent(dsMx.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsMx.ProviderName, 2, Length(dsMx.ProviderName) - 1), '']));
  dsMx.Refresh;
  TotalLabel;
  SetButton;
  Screen.Cursor := crDefault;
end;

{*****自定义过程*****}

//Inirecord
procedure TfrmComMx.Inirecord;
var
  SaveCursor: TCursor;
begin
  SaveCursor := screen.Cursor;
  screen.Cursor := crHourGlass;
  dsMx.Close;
  dsMx.Open;
  dsMx.First;
  TotalLabel;
  SetButton;
  screen.Cursor := SaveCursor;
end;

//LoadPrintForm
procedure TfrmComMx.LoadPrintForm;
begin
  //ComPrint
  if frmSetPrint = nil then
    frmSetPrint := TfrmSetPrint.Create(application);
  with frmSetPrint do
  begin
    AForm := TfrmComMX(self);
    AGrid := DBGrid1;
    ADataSet := TClientDataSet(DBGrid1.DataSource.DataSet);
    blnPreview := self.blnPreview;
    ShowModal;
    self.ReportName := ReportName;
    Free;
  end;
  frmSetPrint := nil;
end;

procedure TfrmComMx.SaveColumnQuery;
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
function TfrmComMx.GetColumnInfo(FileName: string): string;
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

//Set Total Label
procedure TfrmComMx.TotalLabel;
var
  ctrTmp: TControl;
  i: integer;
  sl: TStringList;
  arrSum: Variant;
begin
  Screen.Cursor := crHourGlass;
  sl := TStringList.Create;
	for i := 0 to self.ComponentCount - 1 do
	begin
		ctrTmp := TControl(self.Components[i]);
    if (ctrTmp is TLabel) and (ctrTmp.Hint <> '') then
    begin
      ctrTmp.ShowHint := False;
      sl.AddObject(ctrTmp.Hint, ctrTmp);
    end;
  end;
  if sl.Count > 0 then
  begin
  	arrSum := VarArrayCreate([0, sl.Count - 1], varDouble);
    for i := 0 to sl.Count - 1 do
    	arrSum[i] := 0;
    with dsMx do
    begin
      First;
      while not Eof do
      begin
        for i := 0 to sl.Count - 1 do
    			arrSum[i] := arrSum[i] + dsMx.FieldByName(sl[i]).AsFloat;
        Next;
      end;
      First;
    end;
    for i := 0 to sl.Count - 1 do
    	TLabel(sl.Objects[i]).Caption := FormatFloat(TNumericField(dsMx.FieldByName(sl[i])).DisplayFormat, arrSum[i]);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmComMx.SetButton;
begin
  aPrint.Enabled := aPrint.Tag = 0;
  aPreview.Enabled := aPrint.Enabled;
end;

end.
