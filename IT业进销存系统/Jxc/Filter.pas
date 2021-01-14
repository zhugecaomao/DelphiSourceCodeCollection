unit Filter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons,db, DBGrids, IniFiles;

type
  TfrmFilter = class(TForm)
    StringGrid1: TStringGrid;
    btnCancel: TBitBtn;
    cbXm: TComboBox;
    cbBjfs: TComboBox;
    cbZhfs: TComboBox;
    btnOk: TBitBtn;
    btnIni: TBitBtn;
    CheckBox1: TCheckBox;
    btnClear: TBitBtn;
    ListBox1: TListBox;
    btnSelect: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbXmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbXmExit(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnIniClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSelectClick(Sender: TObject);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox1Exit(Sender: TObject);
  private
    { Private declarations }
    slField: TStringList;
    iniPos: TIniFile;
    strFileName: string;
    function IsVisibleField(const f: TField; const b: boolean): boolean;
    function GetFilterString(const AFd: TField; const ARow: Integer): string;
    function FieldOf(Data: TDataSet; FieldCaption: string): TField;
    function IsVisibleNumber(const s: string): string;
    function IsVisibleDate(const s: string): string;
    procedure OpenListBox;
  public
    { Public declarations }
    AFormName: string;
    dsFt: TDataset;
    dbgFt: TDBGrid;
    strFt: string;
  end;

var
  frmFilter: TfrmFilter;

implementation

uses Main, Dm, ComJbzl, ComFun;

{$R *.DFM}

//Form.Create
procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  frmMain.ilsSub.GetIcon(7, self.Icon);
  StringGrid1.Cells[0,0] := '查询项目';
  StringGrid1.Cells[1,0] := '比较方式';
  StringGrid1.Cells[2,0] := '查询内容';
  StringGrid1.Cells[3,0] := '组合方式';
  slField := TStringList.Create;
end;

//Form.Show
procedure TfrmFilter.FormShow(Sender: TObject);
var
  i, j: integer;
  blFromDs: Boolean;
  arrItem: array of array of string;  //[0,0]查询项目 [0,1]比较方式 [0,2]是否日期
  arrIndex: array of integer;
begin
  strFileName := ExtractFilePath(Application.ExeName) + 'Filter\' + Screen.ActiveForm.Name + '.ini';
  strFt := '';
  blFromDs := false;
  if dsFt = nil then
    dsFt := dbgFt.DataSource.DataSet
  else
    blFromDs := true;
  if (AFormName = screen.ActiveForm.Name) and CheckBox1.Checked then
  begin
    with StringGrid1 do
    begin
      Options := Options - [goEditing];
      Col := 2;
      Row := 1;
      SetFocus;
    end;
    exit;
  end
  else begin
    AFormName := screen.ActiveForm.Name;
    CheckBox1.Checked := false;
    slField.Clear;
  end;
  cbXm.Visible := false;
  cbBjfs.Visible := false;
  cbZhfs.Visible := false;
  cbXm.Items.Clear;
  SetLength(arrItem, 0, 0);
  SetLength(arrIndex, 0);
  for i := 0 to dsFt.FieldCount-1 do
    if isVisibleField(dsFt.Fields[i], blFromDs) then
    begin
      cbXm.Items.Add(dsFt.Fields[i].DisplayLabel);
      //StringList
      slField.AddObject(dsFt.Fields[i].DisplayLabel, dsFt.Fields[i]);
      //ArrItem
      SetLength(arrItem, High(arrItem) + 2 , 3);
      arrItem[High(arrItem), 0] := dsFt.Fields[i].DisplayLabel;
      arrItem[High(arrItem), 1] := '';
      if dsFt.Fields[i].DataType in [ftDateTime, ftDate] then
        arrItem[High(arrItem), 2] := 't'
      else
        arrItem[High(arrItem), 2] := 'f';
      //ArrIndex
      SetLength(arrIndex, High(arrIndex) + 2);
      arrIndex[High(arrIndex)] := High(arrIndex);
    end;
  //Set ArrIndex
  with Data.Tmp do
  begin
    Close;
    CommandText := 'select * from AppFilter ' +
      'where uID = ' + IntToStr(pintUserId) + ' and ' +
      'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + ''' ' +
      'order by UseCount desc, FieldIndex';
    Open;
    while not Eof do
    begin
      for j := 0 to High(arrIndex) do
        if arrItem[j, 0] = FieldByName('FieldCaption').AsString then
        begin
          arrItem[j, 1] := FieldByName('Bjfs').AsString;
          { 按使用次数排
          if j <> RecNo - 1 then
          begin
            for k := j downto RecNo do
            begin
              arrIndex[k - 1] := arrIndex[k - 1] + arrIndex[k];
              arrIndex[k] := arrIndex[k - 1] - arrIndex[k];
              arrIndex[k - 1] := arrIndex[k - 1] - arrIndex[k]
            end;
          end;
          }
          break;
        end;
      Next;
    end;
  end;
  //Add StringGrid1
  with StringGrid1 do
  begin
    for i := 1 to RowCount - 1 do
      Cells[2, i] := '';
    RowCount := 1;
    for i := 0 to High(arrIndex) do
    begin
      RowCount := RowCount + 1;
      Cells[0, RowCount - 1] := arrItem[arrIndex[i], 0];
      if arrItem[arrIndex[i], 2] = 't' then
      begin
        Cells[1, RowCount - 1] := '大于等于';
        //第二个条件
        RowCount := RowCount + 1;
        Cells[0, RowCount - 1] := arrItem[arrIndex[i], 0];
        Cells[1, RowCount - 1] := '小于等于';
        Cells[2, RowCount - 1] := '';
        Cells[3, RowCount - 2] := '并且';
      end
      else
      begin
        if arrItem[arrIndex[i], 1] = '' then
          Cells[1, RowCount - 1] := '等于'
        else
          Cells[1, RowCount - 1] := arrItem[arrIndex[i], 1];
      end;
      Cells[2, RowCount - 1] := '';
      Cells[3, RowCount - 1] := '并且'
    end;
    FixedRows := 1;
    Col := 2;
    iniPos := TiniFile.Create(strFileName);
    Row := iniPos.ReadInteger('', 'Row', 1);
    iniPos.Free;
    SetFocus;
  end;
end;

//isVisibleField
function TfrmFilter.IsVisibleField(const f: TField; const b: boolean): boolean;
var
  i: integer;
begin
  result := False;
  if (f.Visible) and (f.Tag = 0) and (f.FieldKind = fkData) then
    if not b then
      for i := 0 to dbgFt.Columns.Count - 1 do
      begin
        if (dbgFt.Columns[i].Visible) and (f.FieldName = dbgFt.Columns[i].FieldName) then
        begin
          result := True;
          break;
        end
      end
    else
      Result := True;
end;

//Form.Close
procedure TfrmFilter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsFt := nil;
  dbgFt := nil;
end;

//FormKey.Down
procedure TfrmFilter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with StringGrid1 do
  begin
    if Col = 2 then
      Options := Options + [goEditing]
    else
      Options := Options - [goEditing];
    if (Key = VK_F4) and (Col = 2) then
      OpenListBox;
  end;
end;

//StringGrid1.KeyDown
procedure TfrmFilter.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  retCell: TRect;
begin
  if Key = VK_RETURN then
  begin
    cbXm.Visible := false;
    cbBjfs.Visible := false;
    cbZhfs.Visible := false;
    with StringGrid1 do
    begin
      case Col of
        0:
          begin
            btnCancel.Cancel := false;
            retCell := CellRect(Col, Row);
            cbXm.Top := Top + retCell.Top + 1;
            cbXm.Left := Left + retCell.Left;
            cbXm.Itemindex := cbXm.Items.IndexOf(Cells[Col, Row]);
            cbXm.Visible := true;
            cbXm.SetFocus;
          end;
        1:
          begin
            btnCancel.Cancel := false;
            retCell := CellRect(Col, Row);
            cbBjfs.Top := Top + retCell.Top + 1;
            cbBjfs.Left := Left + retCell.Left;
            cbBjfs.Itemindex := cbBjfs.Items.IndexOf(Cells[Col, Row]);
            cbBjfs.Visible := true;
            cbBjfs.SetFocus;
          end;
        2:
          if EditorMode and (Cells[Col, Row] <> '') and (sender <> nil) then btnOk.SetFocus;
        3:
          begin
            btnCancel.Cancel := false;
            retCell := CellRect(Col, Row);
            cbZhfs.Top := Top + retCell.Top + 1;
            cbZhfs.Left := Left + retCell.Left;
            cbZhfs.Itemindex := cbZhfs.Items.IndexOf(Cells[Col, Row]);
            cbZhfs.Visible := true;
            cbZhfs.SetFocus;
          end;
      end;
    end;
  end
  else if Key = VK_DELETE then
    with StringGrid1 do
      if Pos('空值', Cells[1, Row]) = 0 then
        Cells[2, Row] := ''
      else
        Cells[1, Row] := '等于';
end;

//cbXm.Exit
procedure TfrmFilter.cbXmExit(Sender: TObject);
begin
  btnCancel.Cancel := true;
  with StringGrid1 do
  begin
    case Col of
      0:
        begin
          Cells[Col, Row] := cbXm.Text;
          Col := Col + 1;
        end;
      1:
        begin
          Cells[Col, Row] := cbBjfs.Text;
          Col := Col + 1;
        end;
      3:
        begin
          Cells[Col, Row] := cbZhfs.Text;
          if Row = RowCount - 1 then
            btnOk.SetFocus
          else
          begin
            Col := 2;
            Row := Row + 1;
          end;
        end;
    end;
  end;
end;

//cbXm.KeyDown
procedure TfrmFilter.cbXmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then
  begin
    cbXm.Visible := false;
    cbBjfs.Visible := false;
    cbZhfs.Visible := false;
    StringGrid1.SetFocus;
  end;
end;

//StringGrid1.MouseDown
procedure TfrmFilter.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  wdKey : word;
begin
  wdKey := 13;
  FormKeyDown(nil, wdKey, []);
  StringGrid1KeyDown(nil, wdKey, []);
end;

//StringGrid1.DrawCell
procedure TfrmFilter.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  i: integer;
begin
  with StringGrid1 do
  begin
    btnSelect.Visible := Col = 2;
    if btnSelect.Visible and (ARow = Row) then
    begin
      btnSelect.Visible := True;
      btnSelect.Top := CellRect(Col, Row).Top + Top + 2;
    end;
  end;
  if not (State = [gdSelected, gdFixed]) and (ARow <> 0) Then
    with StringGrid1, StringGrid1.Canvas do
    begin
      if (Trim(Cells[2, ARow]) <> '') or (Pos('空值', Cells[1, ARow]) > 0) then
      begin
        Brush.Color := clInfoBk;
        Pen.Color := clWindowText;
      end
      else
      begin
        Brush.Color := clWhite;
        Pen.Color := clWindowText;
      end;
      if (ARow = StringGrid1.Row) and (ACol = StringGrid1.Col) then
      begin
        Brush.Color := clHighlight;
        Pen.Color := clHighlightText;
      end;
      TextRect(rect, rect.Left + 2, rect.Top + 2, Cells[ACol, ARow]);
      if ACol = 2 then
        for i := 0 to ColCount do
          if i <> 2 then
            Cells[i, ARow] := Cells[i, ARow];
    end;
end;

//btnOk.Click
procedure TfrmFilter.btnOkClick(Sender: TObject);
var
  i, j: integer;
  strNy, strCaptions, s: string;
  fdTmp: TField;
begin
  screen.Cursor := crHourGlass;
  iniPos := TiniFile.Create(strFileName);
  strFt := '';
  strCaptions := '';
  with StringGrid1 do
    for i := 1 to RowCount - 1 do
    begin
      Cells[2, i] := Trim(Cells[2, i]);
      if (Cells[2, i] <> '') or (Pos('空值', Cells[1, i]) > 0) then
      begin
        if strCaptions <> '' then
          strCaptions := strCaptions + ';' + Cells[0, i]
        else
          strCaptions := Cells[0, i];
        fdTmp := FieldOf(dsFt, Cells[0, i]);
        //Save
        if Pos('空值', Cells[1, i]) = 0 then
        begin
          iniPos.WriteInteger('', 'Row', i);
          s := iniPos.ReadString('', Cells[0, i], '');
          s := StringReplace(s, Cells[2, i] + '|', '', [rfReplaceAll, rfIgnoreCase]);
          s := Cells[2, i] + '|' + s;
          j := PosPlus('|', s, 20);
          if j > 0 then
            s := Copy(s, 1, j);
          iniPos.WriteString('', Cells[0, i], s);
        end;
        //
        if (Cells[2, i] <> '') then
          strNy := GetFilterString(fdTmp, i)
        else
          strNy := ' ';
        if (strNy <> '') or (Pos('空值', Cells[1, i]) > 0) then
        begin
          if (strNy <> '') and (Pos('空值', Cells[1, i]) = 0) then
            //Save to AppFilter
            with Data.Tmp do
            begin
              Close;
              CommandText := 'select * from AppFilter ' +
                'where uID = ' + IntToStr(pintUserId) + ' and ' +
                'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + ''' and ' +
                'FieldCaption = ''' + Cells[0, i] + '''';
              Open;
              if IsEmpty then
              begin
                Close;
                CommandText := 'Insert into AppFilter ' +
                  '(uID, FormCaption, FieldCaption, FieldIndex, Bjfs, UseCount) ' +
                  'select ' + IntToStr(pintUserId) + ', ''' +
                  Application.MainForm.ActiveMDIChild.Name + ''', ''' +
                  Cells[0, i] + ''',' +
                  IntToStr(fdTmp.Index) + ',''' +
                  Cells[1, i] + ''', 1';
              end
              else
              begin
                Close;
                CommandText := 'update AppFilter ' +
                  'set UseCount = UseCount + 1, ' +
                  'Bjfs = ''' + Cells[1, i] + ''' ' +
                  'where uID = ' + IntToStr(pintUserId) + ' and ' +
                  'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + ''' and ' +
                  'FieldCaption = ''' + Cells[0, i] + '''';
              end;
              Execute;
            end;
          case fdTmp.DataType of
            ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeInt,
            ftDateTime, ftDate:
              //数值 或 日期
              begin
                if (Cells[1, i] = '等于') or (Cells[1, i] = '全等于') then
                  strNy := '(' + fdTmp.FieldName + ' = ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '不等于' then
                  strNy := '(' + fdTmp.FieldName + ' <> ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '大于' then
                  strNy := '(' + fdTmp.FieldName + ' > ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '小于' then
                  strNy := '(' + fdTmp.FieldName + ' < ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '大于等于' then
                  strNy := '(' + fdTmp.FieldName + ' >= ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '小于等于' then
                  strNy := '(' + fdTmp.FieldName + ' <= ' + #39 + strNy + #39 + ')'
                else if Cells[1, i] = '为空值' then
                  if fdTmp.DataType in [ftDateTime, ftDate] then
                    strNy := '(' + fdTmp.FieldName + ' = null)'
                  else
                    strNy := '(' + fdTmp.FieldName + ' = 0)'
                else if Cells[1, i] = '不为空值' then
                  if fdTmp.DataType in [ftDateTime, ftDate] then
                    strNy := '(' + fdTmp.FieldName + ' <> null)'
                  else
                    strNy := '(' + fdTmp.FieldName + ' <> 0)'
                else
                begin
                  Application.MessageBox(PChar('''' + Cells[0, i] + '''不能用''' + Cells[1, i] + '''进行比较, 请重新选择.'), '资料查询', MB_OK + MB_ICONWARNING);
                  Col := 1;
                  Row := i;
                  SetFocus;
                  Abort;
                end;
              end;
          else
            //字符
            if Cells[1, i] = '等于' then
            begin
              if pDataBaseType = 'SERVER' then
                strNy := '(' + fdTmp.FieldName + ' = ' + #39 + strNy + '*' + #39 + ')'
              else
                strNy := '(' + fdTmp.FieldName + ' like ' + #39 + strNy + '%' + #39 + ')';
            end
            else if Cells[1, i] = '不等于' then
              strNy := '(' + fdTmp.FieldName + ' <> ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '全等于' then
              strNy := '(' + fdTmp.FieldName + ' = ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '大于' then
              strNy := '(' + fdTmp.FieldName + ' > ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '小于' then
              strNy := '(' + fdTmp.FieldName + ' < ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '大于等于' then
              strNy := '(' + fdTmp.FieldName + ' >= ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '小于等于' then
              strNy := '(' + fdTmp.FieldName + ' <= ' + #39 + strNy + #39 + ')'
            else if Cells[1, i] = '为空值' then
              strNy := '(' + fdTmp.FieldName + ' = null)'
            else if Cells[1, i] = '不为空值' then
              strNy := '(' + fdTmp.FieldName + ' <> null)'
            else if Cells[1, i] = '包含' then
              strNy := '(' + fdTmp.FieldName + ' like ' + #39 + '%' + strNy + '%' + #39 + ')';
          end;
          //累加
          if Cells[3, i] = '并且' Then
            strFt := strFt + ' ' + strNy + ' and'
          else
            strFt := strFt + ' ' + strNy + ' or ';
        end
        else
        begin
          screen.Cursor := crDefault;
          Col := 2;
          Row := i;
          SetFocus;
          Abort;
        end;
      end;
    end;
  strFt := trim(strFt);
  if strFt = '' then
    Application.MessageBox('没有输入有效的查询条件, 本次查询将被取消.', '资料查询', MB_OK + MB_ICONWARNING)
  else
    if (Copy(strFt, Length(strFt) - 2, 3) = 'and') or (Copy(strFt,Length(strFt) - 2, 3) = 'or ') Then
      Delete(strFt, Length(strFt) - 2, 3);
  if Application.MainForm.ActiveMDIChild is TfrmComJbzl then
    TfrmComJbzl(Application.MainForm.ActiveMDIChild).labSearch.Caption :=
      '查询项目: ' + strCaptions;
  iniPos.Free;
  screen.Cursor := crDefault;
  Close;
end;

//btnIni.Click
procedure TfrmFilter.btnIniClick(Sender: TObject);
begin
  AFormName := '';
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppFilter ' +
      'where uID = ' + IntToStr(pintUserId) + ' and ' +
      'FormCaption = ''' + Application.MainForm.ActiveMDIChild.Name + '''';
    Execute;
  end;
end;

//GetFilterString
function TfrmFilter.GetFilterString(const AFd: TField; const ARow: Integer): string;
var
  i: integer;
begin
  result := '';
  with StringGrid1 do
  begin
    case AFd.DataType of
      ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeInt:
        begin
          result := Cells[2, ARow];
          while Pos(',', result) > 0 do
            result := Copy(result, 1, Pos(',', result) - 1 )
              + Copy(result, Pos(',', result) + 1, Length(result) - Pos(',', result) );
          result := IsVisibleNumber(result);
          if result = '' then
            Application.MessageBox(PChar('在''' + Cells[0, ARow] + '''中输入的''' + Cells[2, ARow] + '''不是有效数值, 请重新输入.'), '资料查询', MB_OK + MB_ICONWARNING);
        end;
      ftDateTime, ftDate:
        begin
          result := Cells[2, ARow];
          for i := 1 to Length(result) do
            if result[i] in ['/','.'] then
              result[i] := '-';
          result := IsVisibleDate(result);
          if result = '' then
            Application.MessageBox(PChar('在''' + Cells[0, ARow] + '''中输入的''' + Cells[0, ARow] + '''不是有效日期, 请重新输入.'), '资料查询', MB_OK + MB_ICONWARNING);
        end;
    else
      if (Length(Cells[2, ARow]) > AFd.Size ) Then
        Application.MessageBox(PChar('在''' + Cells[0, ARow] + '''中输入的查询内容太长, 请重新输入.'), '资料查询', MB_OK + MB_ICONWARNING)
      else
        result := Cells[2, ARow];
    end;
  end;
end;

//FieldOf
function TfrmFilter.FieldOf(Data: TDataSet; FieldCaption: String): TField;
begin
  result := TField(slField.Objects[slField.IndexOf(FieldCaption)]);
{  for i:= 0 To Data.FieldCount - 1 do
    if Data.Fields[i].DisplayLabel = FieldCaption then
    begin
      result := Data.Fields[i];
      break;
    end;}
end;

//IsVisibleNumber
function TfrmFilter.IsVisibleNumber(const s: string): string;
begin
  try
    StrToFloat(s);
    result := s;
  except
    result := '';
  end;
end;

//IsVisibleDate
function TfrmFilter.IsVisibleDate(const s: string): string;
begin
  try
    StrToDate(s);
    result := s;
  except
    result := '';
  end;
end;

//btnClear.Click
procedure TfrmFilter.btnClearClick(Sender: TObject);
var
  i: integer;
begin
  with StringGrid1 do
    for i := 1 to RowCount - 1 do
      Cells[2, i] := '';
end;

//CheckBox1.Click
procedure TfrmFilter.CheckBox1Click(Sender: TObject);
begin
  StringGrid1.SetFocus;
end;

//OpenListBox
procedure TfrmFilter.OpenListBox;
var
  i: integer;
  s, t: string;
begin
  if StringGrid1.Col <> 2 then Exit;
  iniPos := TiniFile.Create(strFileName);
  with StringGrid1 do
  begin
    btnCancel.Cancel := False;
    ListBox1.Top := CellRect(Col, Row).Top + Top + DefaultRowHeight + 1;
    if ListBox1.Top + ListBox1.Height + 22 >= self.Height then
      ListBox1.Top := CellRect(Col, Row).Top + Top - ListBox1.Height - 1;
    //Load
    ListBox1.Items.Clear;
    s := iniPos.ReadString('', Cells[0, Row], '');
    repeat
      i := Pos('|', s);
      t := Copy(s, 1, i - 1);
      s := Copy(s, i + 1, Length(s));
      ListBox1.Items.Add(t);
    until (Pos('|', s) = 0) or (Length(s) = 1);
    ListBox1.Visible := True;
    ListBox1.SetFocus;
    if (ListBox1.ItemIndex < 0) and (ListBox1.Items.Count > 0) then
      ListBox1.ItemIndex := 0;
  end;
  iniPos.Free;
end;

//ListBox1.KeyDown
procedure TfrmFilter.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ListBox1.ItemIndex >= 0) then
    with StringGrid1 do
      Cells[Col, Row] := ListBox1.Items.Strings[ListBox1.ItemIndex];
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then
  begin
    btnCancel.Cancel := True;
    ListBox1.Visible := False;
    if (Key = VK_RETURN) then
      btnOk.SetFocus
    else
      StringGrid1.SetFocus;
  end;
end;

//ListBox1.MouseDown
procedure TfrmFilter.ListBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  wdKey : word;
begin
  wdKey := 13;
  ListBox1KeyDown(nil, wdKey, []);
end;

//btnSelect.Click
procedure TfrmFilter.btnSelectClick(Sender: TObject);
begin
  OpenListBox;
end;

//ListBox1.MouseMove
procedure TfrmFilter.ListBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  P: TPoint;
begin
  P.x := X;
  P.y := Y;
  ListBox1.ItemIndex := ListBox1.ItemAtPos(P, True);
end;

//ListBox1.Exit
procedure TfrmFilter.ListBox1Exit(Sender: TObject);
var
  wdKey : word;
begin
  wdKey := 27;
  ListBox1KeyDown(nil, wdKey, []);
end;

end.
