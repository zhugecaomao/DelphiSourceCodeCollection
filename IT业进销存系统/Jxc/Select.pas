unit Select;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, StdCtrls, Spin, Mask, dbclient, db;

type
  TfrmSelect = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnModify: TToolButton;
    btnDel: TToolButton;
    ToolButton10: TToolButton;
    btnUp: TToolButton;
    btnDown: TToolButton;
    ToolButton1: TToolButton;
    btnExit: TToolButton;
    Panel2: TPanel;
    ToolButton3: TToolButton;
    Label1: TLabel;
    ItemList: TListBox;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    pnlEdit: TPanel;
    Edit1: TEdit;
    labXh: TLabel;
    UpDown1: TUpDown;
    edtXh: TMaskEdit;
    btnOk: TToolButton;
    ToolButton4: TToolButton;
    Label2: TLabel;
    edtDefault: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtXhChange(Sender: TObject);
    procedure edtXhEnter(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ItemListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ItemListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDefaultChange(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure SetButtons;
    procedure SetXh;
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
  public
    { Public declarations }
		DataSet: TDataset;
    FieldName: string;
  end;

var
  frmSelect: TfrmSelect;

implementation

uses Main, Dm, Common, ComFun;

{$R *.DFM}

//Form.Show
procedure TfrmSelect.FormShow(Sender: TObject);
var
  i: integer;
  strI: string;
begin
  self.Top := frmMain.Top + frmMain.Height - self.Height - 4;
  self.Left := 0;
  with Data.AppSelect do
  begin
    Close;
    CommandText := 'select * from AppSelect where DataSet = ''' +
          DataSet.Name + ''' and FieldName = ''' +
          FieldName + '''';
    Open;
    ItemList.Items.Text := FieldByName('DataSelect').AsString;
    Checkbox1.Checked := FieldByName('AutoUpdate').AsBoolean;
    edtDefault.Text := FieldByName('DefaultRow').AsString;
    if Trim(edtDefault.Text) = '0' then
      edtDefault.Text := '';
    if IsEmpty then
      Checkbox1.Checked := True;
    for i := 0 to ItemList.Items.Count - 1 do
    begin
      str(i + 1 : 3, strI);
      ItemList.Items[i] := strI + '. ' + ItemList.Items[i];
    end;
  end;
  SetButtons;
  if ItemList.Items.Count > 0 then
    ItemList.ItemIndex := 0;
  pnlEdit.Visible := false;
  if edtXh.Enabled then
  begin
    edtXh.Text := '1';
    edtXh.SetFocus;
  end;
end;

//Form.Close
procedure TfrmSelect.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to ItemList.Items.Count - 1 do
    ItemList.Items[i] := Copy(ItemList.Items[i], 6, length(ItemList.Items[i]));
  if GetFieldValue('select count(*) from AppSelect where DataSet = ''' +
    DataSet.Name + ''' and FieldName = ''' + FieldName + '''') > 0 then
    SqlExec('update AppSelect set DataSelect = ''' + ItemList.Items.Text +
      ''', AutoUpdate=' + Iif(CheckBox1.Checked, '1', '0') +
      ', DefaultRow=' + Iif(Trim(edtDefault.Text)='', '0', edtDefault.Text) +
      ' where DataSet = ''' + DataSet.Name + ''' and FieldName = ''' + FieldName + '''')
  else
  begin
    if ItemList.Items.Text = '' then
      SqlExec('delete from AppSelect' +
        ' where DataSet = ''' + DataSet.Name + ''' and FieldName = ''' + FieldName + '''')
    else
      SqlExec('insert into AppSelect (DataSet,FieldName,DataSelect,AutoUpdate,DefaultRow) values ' +
      '(''' + DataSet.Name + ''',''' + FieldName + ''',''' + ItemList.Items.Text + ''',' +
       Iif(CheckBox1.Checked, '1', '0') + ',' +
       Iif(Trim(edtDefault.Text)='', '0', edtDefault.Text) + ')' );
  end;
end;

//edtXh.Change
procedure TfrmSelect.edtXhChange(Sender: TObject);
begin
  if screen.ActiveForm <> self then exit;
  if edtXh.Text = '0' then
    edtXh.Text := '';
  if edtXh.Text <> '' then
  begin
    if StrToInt(edtXh.Text) < 1 then
      edtXh.Text := '1';
    if StrToInt(edtXh.Text) > ItemList.Items.Count then
      edtXh.Text := IntToStr(ItemList.Items.Count);
    ItemList.ItemIndex := StrToInt(edtXh.Text) - 1;
  end;
end;

//edtXh.Enter
procedure TfrmSelect.edtXhEnter(Sender: TObject);
begin
  if ItemList.ItemIndex >= 0 then
    edtXh.Text := IntToStr(ItemList.ItemIndex + 1);
end;

//btnNew.Click
procedure TfrmSelect.btnNewClick(Sender: TObject);
var
  Index: Integer;
begin
  if ItemList.ItemIndex < 0 then
    Index := 0
  else
    Index := ItemList.ItemIndex + 1;
  ItemList.Items.Insert(Index, '');
  SetXh;
  SetButtons;
  SetItem(ItemList, Index);
  btnModify.Click;
end;

//btnModify.Click
procedure TfrmSelect.btnModifyClick(Sender: TObject);
var
  r: TRect;
begin
  r := ItemList.ItemRect(ItemList.ItemIndex) ;
  pnlEdit.Top := ItemList.Top + r.Top + 1;
  labXh.Caption := Copy(ItemList.Items[ItemList.ItemIndex], 1, 5);
  Edit1.Text := Copy(ItemList.Items[ItemList.ItemIndex], 6, 1000);
  pnlEdit.Visible := true;
  KeyPreview := false;
  if Edit1.Enabled then
    Edit1.SetFocus;
end;

//btnDel.Click
procedure TfrmSelect.btnDelClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(ItemList);
  ItemList.Items.Delete(Index);
  SetButtons;
  SetXh;
  if Index > ItemList.Items.Count - 1 then
    ItemList.ItemIndex := ItemList.Items.Count - 1
  else
    ItemList.ItemIndex := Index;
  edtXh.Text := IntToStr(ItemList.ItemIndex + 1);
  if edtXh.Enabled then
    edtXh.SetFocus;
end;

//btnUp.Click
procedure TfrmSelect.btnUpClick(Sender: TObject);
var
  i: integer;
begin
  with ItemList do
  begin
    if ItemIndex <= 0 then
    begin
      if (ItemIndex < 0) and ((Items.Count - 1) >= 0) then
        ItemIndex := 0
      else
        Beep;
      abort;
    end;
    i := ItemIndex - 1;
    Items.Move(ItemIndex, i);
    ItemIndex := i;
    edtXh.Text := IntToStr(i + 1);
  end;
  SetXh;
end;

//btnDown.Click
procedure TfrmSelect.btnDownClick(Sender: TObject);
var
  i: integer;
begin
  with ItemList do
  begin
    if (ItemIndex < 0) or (ItemIndex >= Items.Count - 1) then
    begin
      if (ItemIndex < 0) and ((Items.Count - 1) >= 0) then
        ItemIndex := 0
      else
        Beep;
      abort;
    end;
    i := ItemIndex + 1;
    Items.Move(ItemIndex, i);
    ItemIndex := i;
    edtXh.Text := IntToStr(i + 1);
  end;
  SetXh;
end;

//btnOk.Click
procedure TfrmSelect.btnOkClick(Sender: TObject);
begin
  DataSet.Edit;
  DataSet.FieldByName(FieldName).AsString := Copy(ItemList.Items[ItemList.ItemIndex], 6, length(ItemList.Items[ItemList.ItemIndex]));
  Close;
end;

//btnExit.Click
procedure TfrmSelect.btnExitClick(Sender: TObject);
begin
  Close;
end;

//Edit1.KeyDown
procedure TfrmSelect.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (Key = VK_RETURN) then
    Edit1Exit(nil);
end;

//Edit1.Exit
procedure TfrmSelect.Edit1Exit(Sender: TObject);
begin
  ItemList.Items[ItemList.ItemIndex] := Copy(ItemList.Items[ItemList.ItemIndex], 1, 5) + Edit1.Text;
  pnlEdit.Visible := false;
  edtXh.SetFocus;
  pnlEdit.Visible := false;
  KeyPreview := true;
  edtXh.SetFocus;
end;

{-My procedure-}

//SetButtons
procedure TfrmSelect.SetButtons;
var
  ItemEmpty: Boolean;
begin
  ItemEmpty := ItemList.Items.Count = 0;
  btnModify.Enabled := not ItemEmpty;
  btnDel.Enabled := not ItemEmpty;
  btnUp.Enabled := not ItemEmpty;
  btnDown.Enabled := not ItemEmpty;
  btnOk.Enabled := not ItemEmpty;
  edtXh.Enabled := not ItemEmpty;
end;

//SetXh
procedure TfrmSelect.SetXh;
var
  i: integer;
  strI: string;
begin
  with ItemList do
    for i := 0 to Items.Count - 1 do
    begin
      str(i + 1 : 3, strI);
      Items[i] := strI + '. ' + Copy(Items[i], 6, Length(Items[i]));
    end;
end;

//SetItem
procedure TfrmSelect.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    ItemIndex := Index;
    edtXh.Text := IntToStr(ItemIndex + 1);
  end;
  SetButtons;
end;

//GetFirstSelection
function TfrmSelect.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

//FormKeyDown
procedure TfrmSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
    if Key = VK_UP then
    begin
      Key := 0;
      if self.btnUp.Enabled then
        self.btnUp.Click;
    end
    else if Key = VK_DOWN then
    begin
      Key := 0;
      if self.btnDown.Enabled then
        self.btnDown.Click;
    end;
  case Key of
    VK_INSERT: if btnNew.Enabled then btnNew.Click;
    VK_RETURN: if (Shift = [ssCtrl]) and btnModify.Enabled then btnModify.Click else if btnOk.Enabled then btnOk.Click;
    VK_DELETE: if (Shift = [ssCtrl]) and btnDel.Enabled then btnDel.Click;
    VK_ESCAPE: btnExit.Click;
  end;
  case Key of
    VK_PRIOR, VK_NEXT, VK_HOME, VK_END:
    begin
      self.KeyPreview := false;
      ItemList.Perform(WM_KEYDOWN, Key, 0);
      Key := 0;
      self.KeyPreview := true;
    end;
  end;
end;

//ItemList.DragDrop
procedure TfrmSelect.ItemListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i: integer;
  APoint: TPoint;
begin
  with ItemList do
  begin
    APoint.x := X;
    APoint.y := Y;
    i := ItemAtPos(APoint, true);
    if (i >= 0) and (i <= Items.Count - 1) and (i <> ItemIndex ) then
    begin
      Items.Move(ItemIndex, i);
      ItemIndex := i;
      SetXh;
    end;
  end;
end;

//ItemList.DragOver
procedure TfrmSelect.ItemListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TfrmSelect.edtDefaultChange(Sender: TObject);
var
  i: integer;
  str1, str2: string;
begin
  str1 := edtDefault.Text;
  str2 := '';
  for i := 1 to length(str1) do
    if pos(str1[i],'0123456789') <> 0 then
      str2 := str2 + str1[i];
  if str2 <> edtDefault.Text then
    edtDefault.Text := str2;
end;

end.

