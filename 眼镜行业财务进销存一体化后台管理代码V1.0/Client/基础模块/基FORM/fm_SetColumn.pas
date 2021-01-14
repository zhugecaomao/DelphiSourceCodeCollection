unit fm_SetColumn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, CheckLst,DBGrids;

type
  TfmSetColumn = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure CheckListBox1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    strSpace:String;
    { Private declarations }
  public
//    dbgCur:TDBGrid;
    { Public declarations }
  end;

var
  fmSetColumn: TfmSetColumn;

implementation
uses func;

{$R *.dfm}

procedure TfmSetColumn.btnUpClick(Sender: TObject);
var
  i: integer;
begin
  with CheckListBox1 do
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
  end;
end;

procedure TfmSetColumn.btnDownClick(Sender: TObject);
var
  i: integer;
begin
  with CheckListBox1 do
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
  end;
end;

procedure TfmSetColumn.FormShow(Sender: TObject);
var
  i, j: integer;
begin
  strSpace := '';
  for i := 1 to 50 do
    strSpace := strSpace + ' ';
  CheckListBox1.Items.Clear;
  for i := 0 to dbgCur.Columns.Count - 1 do
    if dbgCur.Columns[i].Visible then
    begin
      j := CheckListBox1.Items.Add(dbgCur.Columns[i].Title.Caption +
        Copy(strSpace, 1, 50 - Length(dbgCur.Columns[i].Title.Caption)) +
        dbgCur.Columns[i].FieldName);
      if dbgCur.Columns[i].Width > 0 then
        CheckListBox1.State[j] := cbChecked
      else
        CheckListBox1.State[j] := cbUnchecked;
    end;
  CheckListBox1.ItemIndex := 0;
  CheckListBox1.SetFocus;
end;

procedure TfmSetColumn.btnOkClick(Sender: TObject);
var
  i, j: integer;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
    for j := 0 to dbgCur.Columns.Count - 1 do
      if CheckListBox1.Items[i] = (dbgCur.Columns[j].Title.Caption +
        Copy(strSpace, 1, 50 - Length(dbgCur.Columns[j].Title.Caption)) +
        dbgCur.Columns[j].FieldName) then
      begin
        dbgCur.Columns[j].Index := i;
        if CheckListBox1.State[i] = cbUnchecked then
        begin
          if dbgCur.Columns[j].Width <> 0 then
            dbgCur.Columns[j].Width := 0;
        end
        else
        begin
          if dbgCur.Columns[j].Width = 0 then
            dbgCur.Columns[j].Width := dbgCur.Columns[j].Field.DisplayWidth * 8;
        end;
        break;
      end;
end;

procedure TfmSetColumn.CheckListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i: integer;
  APoint: TPoint;
begin
  if (Sender is TCheckListBox) and (Source is TCheckListBox) then
    with CheckListBox1 do
    begin
      APoint.x := X;
      APoint.y := Y;
      i := ItemAtPos(APoint, true);
      if (i >= 0) and (i <= Items.Count - 1) and (i <> ItemIndex ) then
      begin
        Items.Move(ItemIndex, i);
        ItemIndex := i;
      end;
    end;
end;

procedure TfmSetColumn.CheckListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source is TCheckListBox then
    Accept := true;
end;

procedure TfmSetColumn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
    case Key of
      VK_UP:
        begin
          Key := 0;
          if self.btnUp.Enabled then
            self.btnUp.Click;
        end;
      VK_DOWN:
        begin
          Key := 0;
          if self.btnDown.Enabled then
            self.btnDown.Click;
        end;
    end;
end;

end.
