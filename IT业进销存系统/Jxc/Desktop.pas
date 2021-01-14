unit Desktop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, DBCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
  Clipbrd, StdCtrls ,db, QuickRpt,dbtables,dbclient,comedit, ActnList,
  buttons, Variants;

type
  TfrmDesktop = class(TForm)
    DBGrid1: TDBGrid;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    Label1: TLabel;
    Image2: TImage;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnModify: TToolButton;
    btnDel: TToolButton;
    ToolButton10: TToolButton;
    btnClear: TToolButton;
    ToolButton13: TToolButton;
    btnExit: TToolButton;
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    smnNew: TMenuItem;
    smnModify: TMenuItem;
    smnDel: TMenuItem;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    pmnNew: TMenuItem;
    pmnModify: TMenuItem;
    pmnDel: TMenuItem;
    Image1: TImage;
    ActionList1: TActionList;
    aNew: TAction;
    aModify: TAction;
    aDel: TAction;
    aExit: TAction;
    sgMenu: TStringGrid;
    ilsSub: TImageList;
    aClear: TAction;
    mnuClear: TMenuItem;
    Label2: TLabel;
    aSetViewMode: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ComboBox1: TComboBox;
    procedure aExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LoadEditForm(strState:string);virtual;
    procedure aNewExecute(Sender: TObject);
    procedure aModifyExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgMenuDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgMenuDblClick(Sender: TObject);
    procedure sgMenuEnter(Sender: TObject);
    procedure sgMenuExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure sgMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aAllExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aSetViewModeExecute(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure SetButton;
    procedure dsJbzlAfterScroll(DataSet: TDataSet);
    procedure OpendataSet;
  public
    { Public declarations }
    dsJbzl:Tclientdataset;
    frmEdit:TfrmComEdit;
  end;

var
  frmDesktop: TfrmDesktop;

implementation

uses
  Main, Filter, Dm, UserGroupEdit, PopedomCopy, GroupDesktopClassEdit,
  Popedom;

{$R *.DFM}

//Form.Create
procedure TfrmDesktop.FormCreate(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select gName from AppUserGroup';
    Open;
    ComboBox1.Items.Clear;
    ComboBox1.Hint := Fields[0].AsString;
    while not Eof do
    begin
      ComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
    ComboBox1.Text := ComboBox1.Hint;
    combobox1.ItemIndex := 0;
    Close;
  end;
end;

//Form.Show
procedure TfrmDesktop.FormShow(Sender: TObject);
var
  i: integer;
  s: string;
  tb: TToolButton;
begin
  //Add ToolButton
  tb := TToolButton.Create(self);
  tb.Caption := self.Caption;
  tb.Hint := self.Name;
  tb.OnClick := frmMain.ToolButtonClick;
  tb.Parent := frmMain.tlbAForm;
  sgMenu.Cells[0,0] := '选中';
  sgMenu.Cells[1,0] := '项目';
  //SetMenu
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select mIsParent, mName, mCaption, mLevel,mIndex ' +
      'from AppMenu ' +
      'order by mIndex';
    Open;
    Last;
    First;
    self.sgMenu.RowCount := RecordCount + 1;
    while not Eof do
    begin
      s := FieldByName('mCaption').AsString;
      for i := 1 to FieldByName('mLevel').AsInteger do
        s := '    ' + s;
      if FieldByName('mIsParent').AsBoolean then
        self.sgMenu.Cells[0, RecNo] := '  -'
      else
        self.sgMenu.Cells[0, RecNo] := '';
      self.sgMenu.Cells[1, RecNo] := s;
      self.sgMenu.Cells[2, RecNo] := FieldByName('mName').AsString;
      Next;
    end;
  end;
  //Set dsJbzl
  dsJbzl := TClientDataSet(DBGrid1.DataSource.DataSet);
  dsJbzl.AfterScroll := dsJbzlAfterScroll;
  dsJbzl.Close;
  dsJbzl.Open;
  OpenDataSet;
  screen.Cursor := crDefault;
end;

//Form.Activate
procedure TfrmDesktop.FormActivate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to frmMain.tlbAForm.ButtonCount - 1 do
    if frmMain.tlbAForm.Buttons[i].Hint <> self.Name then
      frmMain.tlbAForm.Buttons[i].ImageIndex := 0
    else
      frmMain.tlbAForm.Buttons[i].ImageIndex := 1;
end;

//Form.Close
procedure TfrmDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmDesktop := nil;
  dsJbzl.Close;
  dsJbzl := nil;
  Action := caFree;
end;

//aExit.Execute
procedure TfrmDesktop.aExitExecute(Sender: TObject);
begin
  Close;
end;

//aNew.Execute
procedure TfrmDesktop.aNewExecute(Sender: TObject);
begin
  LoadEditForm('A');
end;

//aModify.Execute
procedure TfrmDesktop.aModifyExecute(Sender: TObject);
begin
  LoadEditForm('M');
end;

//aDel.Execute
procedure TfrmDesktop.aDelExecute(Sender: TObject);
begin
  If not dsJbzl.IsEmpty Then
  begin
    if Application.MessageBox('确定要删除此桌面分类吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dsJbzl.Delete;
      dsJbzl.ApplyUpdates(0);
      SetButton;
    end;
  end;
end;

//LoadEditForm
procedure TfrmDesktop.LoadEditForm(strState: string);
begin
  frmEdit := TfrmComEdit( TfrmGroupDesktopClassEdit.Create( Application ) ) ;
  frmEdit.strState := strState;
  frmEdit.ShowModal;
  frmEdit.Free;
end;

//SetButton
procedure TfrmDesktop.SetButton;
begin
  aModify.Enabled := not dsJbzl.IsEmpty;
  aDel.Enabled := not dsJbzl.IsEmpty;
  aClear.Enabled := not dsJbzl.IsEmpty;
end;

//sgMenuKeyDown
procedure TfrmDesktop.sgMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DELETE) or (Key = VK_SPACE) then
    TStringGrid(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
end;

//sgMenu.DblClick
procedure TfrmDesktop.sgMenuDblClick(Sender: TObject);
begin
  with TStringGrid(Sender) do
  begin
    if (dsJbzl.IsEmpty) or (Trim(Cells[0, Row]) = '-') then exit;
    if Trim(Cells[0, Row]) = 'V' then
      Cells[0, Row] := ''
    else
      Cells[0, Row] := '  V';
   Cells[1, Row] := Cells[1, Row];
  end;
  //Save to DataBase
  if Sender = sgMenu then
    with Data.Tmp, sgMenu do
    begin
      Close;
      CommandText := 'delete ' +
        'from AppGroupDesktop ' +
        'where gName = ''' + ComboBox1.Text + ''' and ' +
        'cName = ''' + dsJbzl.FieldByName('cName').AsString + ''' and ' +
        'mName = ''' + Cells[2, Row] + '''';
      Execute;
      if Trim(Cells[0, Row]) = 'V' then
      begin
        Close;
        CommandText := 'insert into AppGroupDesktop ' +
          '(gName, cName, mName) values ' +
          '(''' + ComboBox1.Text + ''',''' + dsJbzl.FieldByName('cName').AsString + ''',''' + Cells[2, Row] + ''')';
        Execute;
      end;
    end;
end;

//sgMenu.DrawCell
procedure TfrmDesktop.sgMenuDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
    with TStringGrid(Sender), TStringGrid(Sender).Canvas do
    begin
      if Trim(Cells[0, ARow]) = '-' then
      begin
        Brush.Color := $00D7D7AE;
        Pen.Color := clWindowText;
      end
      else if Trim(Cells[0, ARow]) = 'V' then
      begin
        Brush.Color := clInfoBk;
        Pen.Color := clWindowText;
      end
      else
      begin
        Brush.Color := clWhite;
        Pen.Color := clWindowText;
      end;
      if (ARow = Row) then
        if (ACol = 0) and (Sender = sgMenu)  then
          Brush.Color := clNavy
        else
          Font.Color := clBlack;
      TextRect(rect, rect.Left + 2, rect.Top + 2, Cells[ACol, ARow]);
    end;
end;

//DBGrid1.Enter
procedure TfrmDesktop.DBGrid1Enter(Sender: TObject);
begin
  DBGrid1.Columns[0].Title.Color := $00999999;
end;

//DBGrid1.Exit
procedure TfrmDesktop.DBGrid1Exit(Sender: TObject);
begin
  DBGrid1.Columns[0].Title.Color := clBtnFace;
end;

//sgMenu.Enter
procedure TfrmDesktop.sgMenuEnter(Sender: TObject);
begin
  TStringGrid(Sender).FixedColor := $00999999;
end;

//sgMenu.Exit
procedure TfrmDesktop.sgMenuExit(Sender: TObject);
begin
  TStringGrid(Sender).FixedColor := clBtnFace;
end;

//dsJbzlBeforeScroll
procedure TfrmDesktop.dsJbzlAfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  screen.Cursor := crHourGlass;
  with Data.Tmpl, sgMenu do
  begin
    Close;
    CommandText := 'select * ' +
      'from AppGroupDesktop ' +
      'where gName = ''' + ComboBox1.Text + ''' and ' +
      'cName = ''' + dsJbzl.FieldByName('cName').AsString + '''';
    Open;
    for i := 1 to RowCount - 1 do
    begin
      if Trim(Cells[0, i]) <> '-' then
      begin
        if Locate('mName', sgMenu.Cells[2, i], []) then
          Cells[0, i] := '  V'
        else
          Cells[0, i] := '';
        Cells[1, i] := Cells[1, i];
      end;
    end;
  end;
  screen.Cursor := crDefault;
end;

procedure TfrmDesktop.aAllExecute(Sender: TObject);
begin
end;

//aClear.Execute
procedure TfrmDesktop.aClearExecute(Sender: TObject);
begin
  if Application.MessageBox(Pchar('确定取消已分配给''' + dsJbzl.FieldByName('gName').AsString + '''的所有桌面项目吗?'),
    '桌面布局', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    screen.Cursor := crHourGlass;
    with Data.Tmp do
    begin
      Close;
      CommandText := 'delete from AppGroupDesktop ' +
        'where cName = ''' + dsJbzl.FieldByName('cName').AsString + '''';
      Execute;
    end;
    dsJbzlAfterScroll(dsJbzl);
    screen.Cursor := crDefault;
    Application.MessageBox(Pchar('已取消分配给''' + dsJbzl.FieldByName('gName').AsString + '''的所有功能!'),
      '权限分配', MB_OK + MB_ICONWARNING );
  end;
end;

procedure TfrmDesktop.aSetViewModeExecute(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TfrmDesktop.ComboBox1Enter(Sender: TObject);
begin
  aModify.ShortCut := 0;
end;

procedure TfrmDesktop.ComboBox1Exit(Sender: TObject);
begin
  if dsJbzl <> nil then
    OpenDataSet;
  dsJbzlAfterScroll(nil);
  DBGrid1.SetFocus;
end;

procedure TfrmDesktop.ComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN then
  begin
    Key := 0;
    ComboBox1Exit(nil);
  end;
end;

procedure TfrmDesktop.OpendataSet;
begin
  dsjbzl.Close;
  if (VarToStr(ComboBox1.Text) <> '') then
  begin
    dsJbzl.CommandText := 'select * from AppGroupDesktopClass where gName =''' + ComboBox1.Text + '''';
    dsJbzl.Open;
  end;
end;

end.
