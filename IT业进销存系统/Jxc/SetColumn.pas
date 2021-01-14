unit SetColumn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls;

type
  TfrmSetColumn = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnDown: TSpeedButton;
    btnUp: TSpeedButton;
    cbSave: TCheckBox;
    CheckListBox1: TCheckListBox;
    btnIni: TBitBtn;
    Bevel3: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Image1: TImage;
    Bevel1: TBevel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIniClick(Sender: TObject);
    procedure CheckListBox1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    strSpace: string;
    IsLbzl: boolean;
    tmpLbzl: TForm;
    function GetFileName: string;
  public
    dbgSC: TDBGrid;
    strFormName: string;
    { Public declarations }
  end;

var
  frmSetColumn: TfrmSetColumn;

implementation

uses Main, Dm, ComLbzl, ComJbzl;

{$R *.DFM}

//Form.Show
procedure TfrmSetColumn.FormShow(Sender: TObject);
var
  i, j: integer;
begin
  if Screen.ActiveForm is TfrmComLbzl then
  begin
    IsLbzl := Screen.ActiveForm is TfrmComLbzl;
    tmpLbzl := TfrmComLbzl(Screen.ActiveForm);
  end;
  strSpace := '';
  for i := 1 to 50 do
    strSpace := strSpace + ' ';
  CheckListBox1.Items.Clear;
  for i := 0 to dbgSC.Columns.Count - 1 do
    if dbgSC.Columns[i].Visible then
    begin
      j := CheckListBox1.Items.Add(dbgSC.Columns[i].Title.Caption +
        Copy(strSpace, 1, 50 - Length(dbgSC.Columns[i].Title.Caption)) +
        dbgSC.Columns[i].FieldName);
      if dbgSC.Columns[i].Width > 0 then
        CheckListBox1.State[j] := cbChecked
      else
        CheckListBox1.State[j] := cbUnchecked;
    end;
  CheckListBox1.ItemIndex := 0;
  CheckListBox1.SetFocus;
end;

//btnOk.Click
procedure TfrmSetColumn.btnOkClick(Sender: TObject);
var
  i, j: integer;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
    for j := 0 to dbgSC.Columns.Count - 1 do
      if CheckListBox1.Items[i] = (dbgSC.Columns[j].Title.Caption +
        Copy(strSpace, 1, 50 - Length(dbgSC.Columns[j].Title.Caption)) +
        dbgSC.Columns[j].FieldName) then
      begin
        dbgSC.Columns[j].Index := i;
        if CheckListBox1.State[i] = cbUnchecked then
        begin
          if dbgSC.Columns[j].Width <> 0 then
            dbgSC.Columns[j].Width := 0;
        end
        else
        begin
          if dbgSC.Columns[j].Width = 0 then
            dbgSC.Columns[j].Width := dbgSC.Columns[j].Field.DisplayWidth * 8;
        end;
        break;
      end;
  if self.cbSave.State = cbChecked then
    dbgSC.Columns.SaveToFile(GetFileName + '.cur');
end;

//btnIni.Click
procedure TfrmSetColumn.btnIniClick(Sender: TObject);
var
  strFileName: string;
begin
  if IsLbzl then
    TfrmComLbzl(tmpLbzl).pnlList.Width := screen.Width div 2;
  strFileName := GetFileName;
  if FileExists(strFileName + '.int') then
    dbgSC.Columns.LoadFromFile(strFileName + '.int');
  if FileExists(strFileName + '.cur') then
    DeleteFile(strFileName + '.cur');
end;

//GetFileName
function TfrmSetColumn.GetFileName: string;
begin
  result := ExtractFilePath(Application.ExeName) + 'Column\' +
    FormatFloat('0000', pintUserID) +
    strFormName +
    dbgSC.Name;
end;

//btnUp.Click
procedure TfrmSetColumn.btnUpClick(Sender: TObject);
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

//btnDown.Click
procedure TfrmSetColumn.btnDownClick(Sender: TObject);
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

//Form.KeyDown
procedure TfrmSetColumn.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSetColumn.CheckListBox1DragDrop(Sender, Source: TObject; X,
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

procedure TfrmSetColumn.CheckListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source is TCheckListBox then
    Accept := true;
end;

end.
