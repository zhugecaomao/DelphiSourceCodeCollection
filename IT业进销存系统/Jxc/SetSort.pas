unit SetSort;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls,
  Buttons, ExtCtrls, dbgrids, db, DBClient, CheckLst;

type
  TfrmSetSort = class(TForm)
    SrcList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    btnRight: TSpeedButton;
    btnLeft: TSpeedButton;
    Bevel1: TBevel;
    DstList: TCheckListBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnIni: TBitBtn;
    Bevel3: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure DstListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DstListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnLeftClick(Sender: TObject);
    procedure SrcListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SrcListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnIniClick(Sender: TObject);
    procedure AddIndexDef(ADataSet: TClientDataSet; AFields,
      ADescFields: string);
  private
    { Private declarations }
    strSpace: string;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  public
    { Public declarations }
    dbgSS: TDBGrid;
  end;

var
  frmSetSort: TfrmSetSort;

implementation

uses Dm, ComJbzl, Main;

{$R *.DFM}

//Form.Show
procedure TfrmSetSort.FormShow(Sender: TObject);
var
  i: integer;
begin
  strSpace := '';
  for i := 1 to 50 do
    strSpace := strSpace + ' ';
  SrcList.Items.Clear;
  DstList.Items.Clear;
  for i := 0 to dbgSS.Columns.Count - 1 do
    if (dbgSS.Columns[i].Visible) and
      (dbgSS.Columns[i].Field.FieldKind = fkData) then
      SrcList.Items.Add(dbgSS.Columns[i].Title.Caption +
        Copy(strSpace, 1, 50 - Length(dbgSS.Columns[i].Title.Caption)) +
        dbgSS.Columns[i].FieldName);
  SrcList.ItemIndex := 0;
  SrcList.SetFocus;
  SetButtons;
end;

//Form.KeyDown
procedure TfrmSetSort.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
    case Key of
      VK_LEFT:
        begin
          Key := 0;
          if self.btnLeft.Enabled then
            self.btnLeft.Click;
        end;
      VK_RIGHT:
        begin
          Key := 0;
          if self.btnRight.Enabled then
            self.btnRight.Click;
        end;
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

//btnLeft.Click
procedure TfrmSetSort.btnLeftClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(TListBox(DstList), Index);
end;

//btnRight.Click
procedure TfrmSetSort.btnRightClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

//btnUp.Click
procedure TfrmSetSort.btnUpClick(Sender: TObject);
var
  i: integer;
begin
  with DstList do
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
procedure TfrmSetSort.btnDownClick(Sender: TObject);
var
  i: integer;
begin
  with DstList do
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

procedure TfrmSetSort.btnOkClick(Sender: TObject);
var
  i: integer;
  strTmp, strFields, strDescFields, strCaptions: string;
begin
  screen.Cursor := crHourGlass;
  strFields := '';
  strDescFields := '';
  strCaptions := '';
  if DstList.Items.Count = 0 then
    Application.MessageBox('没有选择有效的排序栏目, 本次操作将被取消.', '数据排序', MB_OK + MB_ICONWARNING)
  else
  begin
    for i := 0 to DstList.Items.Count - 1 do
    begin
      //Fields
      strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
      if strFields <> '' then
        strFields := strFields + ';' + strTmp
      else
        strFields := strTmp;
      if DstList.State[i] = cbChecked then
        if strDescFields <> '' then
          strDescFields := strDescFields + ';' + strTmp
        else
          strDescFields := strTmp;
      //Captions
      strTmp := Trim(Copy(DstList.Items[i], 1, 50));
      if strCaptions <> '' then
        strCaptions := strCaptions + ';' + strTmp
      else
        strCaptions := strTmp;
      if DstList.State[i] = cbChecked then
        strCaptions := strCaptions + '<降>';
    end;
    //Save To AppSort
    with Data.Tmp do
    begin
      Close;
      CommandText := 'select * from AppSort ' +
        'where uID = ' + IntToStr(pintUserId) + ' and ' +
        'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + dbgSS.Name + '''';
      Open;
      if IsEmpty then
      begin
        Close;
        CommandText := 'Insert into AppSort ' +
          '(uID, FormCaption, iFields, iDescFields, iCaption) ' +
          'select ' + IntToStr(pintUserId) + ', ''' +
          Application.MainForm.ActiveMDIChild.Name + dbgSS.Name + ''', ''' +
          strFields + ''', ''' +
          strDescFields + ''', ''' +
          strCaptions + '''';
      end
      else
      begin
        Close;
        CommandText := 'update AppSort ' +
          'set iFields = ''' + strFields + ''', ' +
          'iDescFields = ''' + strDescFields + ''', ' +
          'iCaption = ''' + strCaptions + ''' ' +
          'where uID = ' + IntToStr(pintUserId) + ' and ' +
          'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + dbgSS.Name + '''';
      end;
      Execute;
    end;
    //Begin Sort
    self.AddIndexDef(TClientDataSet(dbgSS.DataSource.DataSet),
      strFields, strDescFields);
    if Application.MainForm.ActiveMDIChild is TfrmComJbzl then
      TfrmComJbzl(Application.MainForm.ActiveMDIChild).labSort.Caption :=
        '排序方式: ' + strCaptions;
  end;
  screen.Cursor := crDefault;
end;

//btnIni.Click
procedure TfrmSetSort.btnIniClick(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  //Clear AppSort
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppSort ' +
      'where uID = ' + IntToStr(pintUserId) + ' and ' +
      'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + dbgSS.Name + '''';
    Execute;
  end;
  //Clear Sort
  self.AddIndexDef(TClientDataSet(dbgSS.DataSource.DataSet), '', '');
  if Application.MainForm.ActiveMDIChild is TfrmComJbzl then
    TfrmComJbzl(Application.MainForm.ActiveMDIChild).labSort.Caption :=
      '排序方式: .';
  screen.Cursor := crDefault;
end;

//SrcList.DragDrop
procedure TfrmSetSort.SrcListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if Source = DstList then
    btnLeft.Click;
end;

//SrcList.DragOver
procedure TfrmSetSort.SrcListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source = DstList then
    Accept := true;
end;

//DstList.DragDrop
procedure TfrmSetSort.DstListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i: integer;
  APoint: TPoint;
begin
  if Source = SrcList then
    btnRight.Click;
  if Source = DstList then
    if (Sender is TCheckListBox) and (Source is TCheckListBox) then
      with DstList do
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

//DstList.DragOver
procedure TfrmSetSort.DstListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = SrcList) or (Source = DstList) then
    Accept := true;
end;

//自定义
procedure TfrmSetSort.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
{  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;}
  for I := 0 to List.Items.Count - 1 do
    if List.Selected[I] then
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
      List.Items.Delete(I);
end;

procedure TfrmSetSort.SetItem(List: TListBox; Index: Integer);
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
  end;
  SetButtons;
end;

function TfrmSetSort.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

//AddIndexDef
procedure TfrmSetSort.AddIndexDef(ADataSet: TClientDataSet; AFields,
  ADescFields: string);
var
  i: integer;
  f: boolean;
  strTmp: string;
begin
  if AFields <> '' then
    with TClientDataSet(ADataSet) do
    begin
      f := false;
      for i := IndexDefs.Count - 1 downto 0 do
        if Copy(IndexDefs.Items[i].Name, 1, 8 ) = 'IndexTmp' then
        begin
          f := true;
          break;
        end;
      if not f then
        with IndexDefs.AddIndexDef do
        begin
          strTmp := 'IndexTmp';
          Name := strTmp;
          Fields := AFields;
          DescFields :=  ADescFields;
          Options := [];
        end
      else
        with IndexDefs.Items[i] do
        begin
          strTmp := 'IndexTmp' + FormatFloat('0000000000', Now * 100000000);
          Name := strTmp;
          Fields := AFields;
          DescFields :=  ADescFields;
          Options := [];
        end;
      IndexName := strTmp;
      IndexDefs.Update;
    end
  else
    with ADataSet do
    begin
      IndexName := '';
      IndexDefs.Update;
    end;
end;

procedure TfrmSetSort.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  btnRight.Enabled := not SrcEmpty;
  btnLeft.Enabled := not DstEmpty;
  btnUp.Enabled := not DstEmpty;
  btnDown.Enabled := not DstEmpty;
end;

end.
