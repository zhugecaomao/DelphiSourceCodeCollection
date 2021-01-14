unit Popedom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, DBCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
  Clipbrd, StdCtrls ,db, QuickRpt, dbtables, dbclient, comedit, ActnList,
  buttons, Variants;

type
  TfrmPopedom = class(TForm)
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
    btnAll: TToolButton;
    Image1: TImage;
    ActionList1: TActionList;
    aNew: TAction;
    aModify: TAction;
    aDel: TAction;
    aExit: TAction;
    Panel2: TPanel;
    sgMenu: TStringGrid;
    sgAction: TStringGrid;
    ilsSub: TImageList;
    aCopy: TAction;
    aClear: TAction;
    aAll: TAction;
    btnCopy: TToolButton;
    mnuAll: TMenuItem;
    mnuCopy: TMenuItem;
    mnuClear: TMenuItem;
    aSelect: TAction;
    btnSelect: TToolButton;
    ToolButton2: TToolButton;
    N1: TMenuItem;
    S1: TMenuItem;
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
    procedure sgMenuSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgMenuDblClick(Sender: TObject);
    procedure sgMenuEnter(Sender: TObject);
    procedure sgMenuExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure sgMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aAllExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function HavePopedom(strmName, straName, strfName: string): boolean; //判断用户是否有此权限
  private
    { Private declarations }
    procedure SetButton;
    procedure ClearAll;
    procedure SetSgAction(mName, strCheck: string);
    procedure dsJbzlAfterScroll(DataSet: TDataSet);
  public
    { Public declarations }
    dsJbzl:Tclientdataset;
    frmEdit:TfrmComEdit;
  end;

var
  frmPopedom: TfrmPopedom;

implementation

uses
  Main, Filter, Dm, UserGroupEdit, PopedomCopy, Common;

{$R *.DFM}

//Form.Create
procedure TfrmPopedom.FormCreate(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
end;

//Form.Show
procedure TfrmPopedom.FormShow(Sender: TObject);
var
  i: integer;
  s: string;
  tb: TToolButton;
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
  sgMenu.Cells[0,0] := '选中';
  sgMenu.Cells[1,0] := '项目';
  sgAction.Cells[0,0] := '选中';
  sgAction.Cells[1,0] := '功能';
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
  screen.Cursor := crDefault;
end;

//Form.Activate
procedure TfrmPopedom.FormActivate(Sender: TObject);
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
procedure TfrmPopedom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsJbzl.Close;
  dsJbzl := nil;
  Action := caFree;
end;

//aExit.Execute
procedure TfrmPopedom.aExitExecute(Sender: TObject);
begin
  Close;
end;

//aNew.Execute
procedure TfrmPopedom.aNewExecute(Sender: TObject);
begin
  LoadEditForm('A');
end;

//aModify.Execute
procedure TfrmPopedom.aModifyExecute(Sender: TObject);
begin
  LoadEditForm('M');
end;

//aDel.Execute
procedure TfrmPopedom.aDelExecute(Sender: TObject);
begin
  If not dsJbzl.IsEmpty Then
  begin
    if Application.MessageBox('确定要删除此用户组别吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dsJbzl.Delete;
      dsJbzl.ApplyUpdates(0);
      SetButton;
    end;
  end;
end;

//LoadEditForm
procedure TfrmPopedom.LoadEditForm(strState: string);
begin
  frmEdit := TfrmComEdit( TfrmUserGroupEdit.Create( Application ) ) ;
  frmEdit.strState := strState;
  frmEdit.ShowModal;
  frmEdit.Free;
end;

//SetButton
procedure TfrmPopedom.SetButton;
begin
  aModify.Enabled := not dsJbzl.IsEmpty;
  aDel.Enabled := not dsJbzl.IsEmpty;
  aAll.Enabled := not dsJbzl.IsEmpty;
  aCopy.Enabled := not dsJbzl.IsEmpty;
  aClear.Enabled := not dsJbzl.IsEmpty;
end;

//sgMenuKeyDown
procedure TfrmPopedom.sgMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DELETE) or (Key = VK_SPACE) then
  begin
    TStringGrid(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
    if Sender = sgMenu then
      SetSgAction(sgMenu.Cells[2, sgMenu.Row], sgMenu.Cells[0, sgMenu.Row]);
  end;
end;

//sgMenu.DblClick
procedure TfrmPopedom.sgMenuDblClick(Sender: TObject);
begin
  if (Sender = sgMenu) and not HavePopedom(sgMenu.Cells[2, sgMenu.Row],'','') or
     (Sender = sgAction) and not HavePopedom(sgMenu.Cells[2, sgMenu.Row],
       sgAction.Cells[2, sgAction.Row], sgAction.Cells[3, sgAction.Row]) then
  begin
    Application.MessageBox( '没有此权限, 不能分配!', '权限分配', MB_OK + MB_ICONWARNING);
    exit;
  end;
  if Sender = aSelect then
    if sgMenu.FixedColor = $00999999 then
      Sender := sgMenu
    else
      Sender := sgAction;
  with TStringGrid(Sender) do
  begin
    if Trim(Cells[0, Row]) = 'V' then
      Cells[0, Row] := ''
    else
      Cells[0, Row] := '  V';
   Cells[1, Row] := Cells[1, Row];
  end;
  //Save to DataBase
  if Sender = sgMenu then
  begin
    with Data.Tmp, sgMenu do
    begin
      Close;
      CommandText := 'delete ' +
        'from AppGroupMenu ' +
        'where gName = ''' + dsJbzl.FieldByName('gName').AsString + ''' and ' +
        'mName = ''' + Cells[2, Row] + '''';
      Execute;
      if Trim(Cells[0, Row]) = 'V' then
      begin
        Close;
        CommandText := 'insert into AppGroupMenu ' +
          '(gName, mName) values ' +
          '(''' + dsJbzl.FieldByName('gName').AsString + ''',''' + Cells[2, Row] + ''')';
        Execute;
        if pstrUserCode <> 'SYS' then
        begin
          Close;
          CommandText := 'insert into AppGroupAction ' +
            '(gName, mName, aName, fName) values (''' +
            dsJbzl.FieldByName('gName').AsString + ''', mName, aName, fName ' +
            'from AppGroupAction where gName = ''' +
            GetFieldValue('select gName from AppUser where ID=' +
            IntToStr(pintUserId)) + ''')';
          Execute;
        end;
      end;
    end;
    SetSgAction(sgMenu.Cells[2, sgMenu.Row], sgMenu.Cells[0, sgMenu.Row]);
  end;
  if Sender = sgAction then
    with Data.Tmp, sgAction do
    begin
      Close;
      CommandText := 'delete ' +
        'from AppGroupAction ' +
        'where gName = ''' + dsJbzl.FieldByName('gName').AsString + ''' and ' +
        'mName = ''' + sgMenu.Cells[2, sgMenu.Row] + ''' and ' +
        'aName = ''' + Cells[2, Row] + ''' and ' +
        'fName = ''' + Cells[3, Row] + '''';
      Execute;
      if Trim(Cells[0, Row]) = '' then
      begin
        Close;
        CommandText := 'insert into AppGroupAction ' +
          '(gName, mName, aName, fName) values ' +
          '(''' + dsJbzl.FieldByName('gName').AsString + ''',''' + sgMenu.Cells[2, sgMenu.Row] + ''',''' + Cells[2, Row] + ''',''' + Cells[3, Row] + ''')';
        Execute;
      end;
    end;
end;

//sgMenu.DrawCell
procedure TfrmPopedom.sgMenuDrawCell(Sender: TObject; ACol, ARow: Integer;
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
      if (Sender = sgAction) then
        if Trim(sgMenu.Cells[0, sgMenu.Row]) = '' then
          Brush.Color := $00EFEFEF;
      TextRect(rect, rect.Left + 2, rect.Top + 2, Cells[ACol, ARow]);
    end;
end;

//sgMenu.SelectCell
procedure TfrmPopedom.sgMenuSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  SetSgAction(sgMenu.Cells[2, ARow], sgMenu.Cells[0, ARow]);
end;

//SetSgAction
procedure TfrmPopedom.SetSgAction(mName, strCheck: string);
begin
  screen.Cursor := crHourGlass;
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select fName, aName, aCaption,aIndex ' +
      'from AppAction ' +
      'where mName = ''' + mName + '''' +
      'order by aIndex';
    Open;
    Last;
    First;
    if Eof then
    begin
      self.sgAction.RowCount := 2;
      self.sgAction.Cells[0, 1] := '';
      self.sgAction.Cells[1, 1] := '';
      self.sgAction.Cells[2, 1] := '';
      self.sgAction.Cells[3, 1] := '';
    end
    else
      self.sgAction.RowCount := RecordCount + 1;
    self.sgAction.FixedRows := 1;
    dm.Data.Tmpf.Close;
    dm.Data.Tmpf.CommandText := 'select * ' +
        'from AppGroupAction ' +
        'where gName = ''' + dsJbzl.FieldByName('gName').AsString + ''' and ' +
        'mName = ''' + mName + '''';
    dm.Data.Tmpf.Open;
    while not Eof do
    begin
      if (Trim(strCheck) <> '') and
        (not dm.Data.Tmpf.Locate('fName;aName', VarArrayOf([FieldByName('fName').AsString, FieldByName('aName').AsString]), [])) then
        self.sgAction.Cells[0, RecNo] := '  V'
      else
        self.sgAction.Cells[0, RecNo] := '';
      self.sgAction.Cells[1, RecNo] := FieldByName('aCaption').AsString;
      self.sgAction.Cells[2, RecNo] := FieldByName('aName').AsString;
      self.sgAction.Cells[3, RecNo] := FieldByName('fName').AsString;
      Next;
    end;
  end;
  screen.Cursor := crDefault;
end;

//DBGrid1.Enter
procedure TfrmPopedom.DBGrid1Enter(Sender: TObject);
begin
  DBGrid1.Columns[0].Title.Color := $00999999;
end;

//DBGrid1.Exit
procedure TfrmPopedom.DBGrid1Exit(Sender: TObject);
begin
  DBGrid1.Columns[0].Title.Color := clBtnFace;
end;

//sgMenu.Enter
procedure TfrmPopedom.sgMenuEnter(Sender: TObject);
begin
  TStringGrid(Sender).FixedColor := $00999999;
end;

//sgMenu.Exit
procedure TfrmPopedom.sgMenuExit(Sender: TObject);
begin
  TStringGrid(Sender).FixedColor := clBtnFace;
end;

//dsJbzlBeforeScroll
procedure TfrmPopedom.dsJbzlAfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  if sgMenu.Cells[1, 1] = '' then
    exit;
  screen.Cursor := crHourGlass;
  with Data.Tmpl, sgMenu do
  begin
    Close;
    CommandText := 'select * ' +
      'from AppGroupMenu ' +
      'where gName = ''' + dsJbzl.FieldByName('gName').AsString + '''';
    Open;
    for i := 1 to sgMenu.RowCount - 1 do
    begin
      if Trim(Cells[0, i]) <> '-' then
      begin
        if Locate('mName', sgMenu.Cells[2, i], []) then
          Cells[0, i] := '  V'
        else
          Cells[0, i] := '   ';
        Cells[1, i] := Cells[1, i];
      end;
    end;
  end;
  SetSgAction(sgMenu.Cells[2, sgMenu.Row], sgMenu.Cells[0, sgMenu.Row]);
  screen.Cursor := crDefault;
end;

//aAll.Execute
procedure TfrmPopedom.aAllExecute(Sender: TObject);
begin
  if Application.MessageBox(Pchar('确定分配所有功能给''' + dsJbzl.FieldByName('gName').AsString + '''吗?'),
    '权限分配', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    screen.Cursor := crHourGlass;
    ClearAll;
    with Data.Tmp do
    begin
      Close;
      if pDataBaseType = 'SERVER' then
        CommandText := 'insert into AppGroupMenu ' +
          '(gName, mName) ' +
          'select ''' + dsJbzl.FieldByName('gName').AsString + ''', mName ' +
          'from AppMenu Where mIsParent<>''1'''
      else
        CommandText := 'insert into AppGroupMenu ' +
          '(gName, mName) ' +
          'select ''' + dsJbzl.FieldByName('gName').AsString + ''', mName ' +
          'from AppMenu Where not mIsParent';
      Execute;
    end;
    dsJbzlAfterScroll(dsJbzl);
    screen.Cursor := crDefault;
    Application.MessageBox(Pchar('已把所有功能分配给''' + dsJbzl.FieldByName('gName').AsString + '''!'),
     '权限分配', MB_OK + MB_ICONWARNING );
  end;
end;

//aClear.Execute
procedure TfrmPopedom.aClearExecute(Sender: TObject);
begin
  if Application.MessageBox(Pchar('确定取消已分配给''' + dsJbzl.FieldByName('gName').AsString + '''的所有功能吗?'),
    '权限分配', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    screen.Cursor := crHourGlass;
    ClearAll;
    dsJbzlAfterScroll(dsJbzl);
    screen.Cursor := crDefault;
    Application.MessageBox(Pchar('已取消分配给''' + dsJbzl.FieldByName('gName').AsString + '''的所有功能!'),
      '权限分配', MB_OK + MB_ICONWARNING );
  end;
end;

//aCopy.Execute
procedure TfrmPopedom.aCopyExecute(Sender: TObject);
begin
  frmPopedomCopy := TfrmPopedomCopy.Create(self);
  frmPopedomCopy.ShowModal;
  if frmPopedomCopy.ModalResult = mrok then
  begin
    ClearAll;
    with Data.Tmp do
    begin
      Close;
      CommandText := 'insert into AppGroupMenu (gName, mName) ' +
        'select ''' + dsJbzl.FieldByName('gName').AsString + ''', mName ' +
        'from AppGroupMenu ' +
        'Where gName = ''' + frmPopedomCopy.ComboBox1.Text + '''';
      Execute;
      Close;
      CommandText := 'insert into AppGroupAction (gName, mName, aName) ' +
        'select ''' + dsJbzl.FieldByName('gName').AsString + ''', mName, aName ' +
        'from AppGroupAction ' +
        'Where gName = ''' + frmPopedomCopy.ComboBox1.Text + '''';
      Execute;
    end;
    dsJbzlAfterScroll(dsJbzl);
    Application.MessageBox(Pchar('已从''' + frmPopedomCopy.ComboBox1.Text + '''' +
      '复制权限到''' + dsJbzl.FieldByName('gName').AsString + '''!'),
      '权限分配', MB_OK + MB_ICONWARNING );
  end;
  frmPopedomCopy.Free;
end;

//ClearAll
procedure TfrmPopedom.ClearAll;
begin
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppGroupMenu ' +
      'where gName = ''' + dsJbzl.FieldByName('gName').AsString + '''';
    Execute;
    Close;
    CommandText := 'delete from AppGroupAction ' +
      'where gName = ''' + dsJbzl.FieldByName('gName').AsString + '''';
    Execute;
  end;
end;

//判断用户是否有此权限
function TfrmPopedom.HavePopedom(strmName, straName, strfName: string): boolean;
var
  strgName: string;
begin
  if pstrUserCode = 'SYS' then
  begin
    Result := True;
    exit;
  end;
  strgName := GetFieldValue('select gName from AppUser where ID=' + IntToStr(pintUserId));
  if (straName = null) or (straName = '') then
    Result := GetFieldValue('select count(*) from AppGroupMenu ' +
        'where gName = ''' + strgName + ''' and ' +
        'mName = ''' + strmName + '''' ) > 0
  else
    Result := GetFieldValue('select count(*) from AppGroupAction ' +
        'where gName = ''' + strgName + ''' and ' +
        'mName = ''' + strmName + ''' and ' +
        'aName = ''' + straName + ''' and ' +
        'fName = ''' + strfName + '''') = 0;
end;

end.

