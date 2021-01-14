unit ComHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls,db, ComCtrls, Buttons,comEdit,Dbclient, ExtCtrls,
  dbctrls, mconnect, Variants;

type
  TfrmComHelp = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Edit2: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnNew: TBitBtn;
    btnModify: TBitBtn;
    btnDel: TBitBtn;
    Animate1: TAnimate;
    Bevel1: TBevel;
    Label1: TLabel;
    btnSetColumn: TBitBtn;
    Bevel3: TBevel;
    Bevel2: TBevel;
    procedure btnDelClick(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);virtual;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure SetFilter(Sender: TObject);virtual;
    function GetFilter: string;virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);virtual;
    procedure dsAfterOpen(DataSet: TDataSet);virtual;
    procedure dsAfterScroll(DataSet: TDataSet);virtual;
    procedure btnNewClick(Sender: TObject);virtual;
    procedure btnModifyClick(Sender: TObject);virtual;
    procedure LoadEditForm(strState:string);virtual;
    procedure OpenDataSet;virtual;
    procedure DBGrid1DblClick(Sender: TObject);virtual;
    procedure btnSetColumnClick(Sender: TObject);
  private
    { Private declarations }
    IsActive: boolean;
    IsFormShow: boolean;
    procedure SaveColumnQuery;
    function GetColumnInfo(FileName: string): string;
  public
    { Public declarations }
    frmEdit: TfrmComEdit;
    dsHelp: TClientdataset;
    dsEditing: TClientdataset;
		blnStopSetColumn: boolean;
    strEditFieldName:string;  //字段列表，用 ; 格开
    strHelpFieldName:string;
    strDetailTables:string;
    strDetailWheres:string;
  end;

var
  frmComHelp: TfrmComHelp;

implementation

uses
  Dm, Main, SetColumn, Common;

{$R *.DFM}

//Form.Show
procedure TfrmComHelp.FormShow(Sender: TObject);
var
  i, j: integer;
  c: TControl;
  strFileName: string;
begin
  IsFormShow := True;
  self.Top := frmMain.Top + frmMain.Height - self.Height - 4;
  self.Left := 0;
  //DBGrid
  for i := 0 to self.ComponentCount - 1 do
    if (self.Components[i] is TDBGrid) then
    begin
      //Width
      with TDBGrid(self.Components[i]) do
      begin
        for j := 0 to Columns.Count - 1 do
					Columns[j].Title.Alignment := taCenter;
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
  dsHelp := TCLientDataSet(DBGrid1.DataSource.DataSet);
  OpenDataSet;
  IsActive := false;
  if not ( dsHelp.Active ) then
    dsHelp.Open
  else
    IsActive := true;
  dsHelp.AfterOpen := dsAfterOpen;
  dsHelp.AfterScroll := dsAfterScroll;
  for i := 0 to self.ComponentCount - 1 do
  begin
    c := TControl(self.Components[i]);
    if c is TEdit then
      if not Assigned(TEdit(c).OnChange) then
        TEdit(c).OnChange := SetFilter;
    if c is TComboBox then
      if not Assigned(TComboBox(c).OnChange) then
        TComboBox(c).OnChange := SetFilter;
  end;
  btnNew.Enabled := (btnNew.Tag = 0) and (dsEditing <> nil);
  btnModify.Enabled := (btnModify.Tag = 0) and (dsEditing <> nil);
  btnDel.Enabled := (btnDel.Tag = 0) and (dsEditing <> nil);
  if Edit1.Enabled then Edit1.SetFocus;
  SetFilter(nil);
  dsAfterScroll(nil);
  IsFormShow := False;
end;

//Form.KeyDown
procedure TfrmComHelp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  c: TWinControl;
begin
  case Key of
    VK_RETURN:
      if Shift = [ssCtrl] then
      begin
        Key := 0;
        Perform(WM_NEXTDLGCTL, 0, 0)
      end
      else if Shift = [ssShift] then
      begin
        Key := 0;
        Perform(WM_NEXTDLGCTL, 1, 0)
      end;
    VK_LEFT, VK_RIGHT:
      if Shift = [ssCtrl] then
      begin
        c := screen.ActiveControl;
        if Key = VK_LEFT then
          DBGrid1.Perform(WM_HSCROLL, 0, 0)
        else
          DBGrid1.Perform(WM_HSCROLL, 1, 0);
        Key := 0;
        c.SetFocus;
      end;
    VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, VK_HOME, VK_END:
      begin
        self.KeyPreview := false;
        DBGrid1.Perform(WM_KEYDOWN, Key, 0);
        Key := 0;
        self.KeyPreview := true;
      end;
  end;
end;

//Form.Close
procedure TfrmComHelp.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
  c: TControl;
  strEdit, strEdits: string;
begin
  SaveColumnQuery;
  dsHelp.AfterOpen := nil;
//  dsHelp.Close;
  TDcomConnection(Data.FindComponent(dsHelp.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsHelp.ProviderName, 2, Length(dsHelp.ProviderName) - 1), '']));
  if IsActive then
    dsHelp.Open;
  for i := 0 to self.ComponentCount - 1 do
  begin
    c := TControl(self.Components[i]);
    if c is TEdit then
      TEdit(c).OnChange := nil;
    if c is TComboBox then
      TComboBox(c).OnChange := nil;
  end;
  if (ModalResult <> MROK) and (strEditFieldName <> '') and
    (dsEditing.State in [dsInsert, dsEdit])then
  begin
    strEdits := strEditFieldName;
    while strEdits <> '' do
    begin
      if Pos(';', strEdits) <> 0 then
      begin
        strEdit := Copy(strEdits, 1, Pos(';', strEdits) - 1);
        strEdits := Copy(strEdits, Pos(';', strEdits) + 1, Length(strEdits));
      end else
      begin
        strEdit := strEdits;
        strEdits := '';
      end;
{
      if dsEditing.FieldByName(strEdit) is TStringField then
        dsEditing.FieldByName(strEdit).AsString := ''
      else if dsEditing.FieldByName(strEdit) is TNumericField then
        dsEditing.FieldByName(strEdit).AsFloat := 0;
}        
    end;
  end;
end;

//DBGrid1Dbl.Click
procedure TfrmComHelp.DBGrid1DblClick(Sender: TObject);
begin
  self.btnOk.Perform(WM_LBUTTONDBLCLK, 0, 0);
end;

//btnOk.Click
procedure TfrmComHelp.btnOkClick(Sender: TObject);
var
  i, j: integer;
  strEdit, strEdits, strHelp, strHelps: string;
begin
  if (btnOk.Enabled) and (dsEditing <> nil) then
  begin
    dsEditing.Edit;
    if strEditFieldName = '' then
    begin
      for i := 0 to dsHelp.Fields.Count - 1 do
        for j := 0 to dsEditing.Fields.Count - 1 do
          if (dsHelp.Fields[i].FieldName = dsEditing.Fields[j].FieldName) and
            (dsEditing.Fields[j].FieldKind = fkData) then
          begin
            dsEditing.FieldByName(dsEditing.Fields[j].FieldName).AsString :=
              dsHelp.FieldByName(dsEditing.Fields[j].FieldName).AsString;
            break;
          end;
    end
    else
    begin
      strEdits := strEditFieldName;
      strHelps := strHelpFieldName;
      while strEdits <> '' do
      begin
        if Pos(';', strEdits) <> 0 then
        begin
          strEdit := copy(strEdits, 1, Pos(';', strEdits) - 1);
          strEdits := copy(strEdits, Pos(';', strEdits) + 1, length(strEdits));
        end else
        begin
          strEdit := strEdits;
          strEdits := '';
        end;
        if Pos(';', strHelps) <> 0 then
        begin
          strHelp := copy(strHelps, 1, Pos(';', strHelps) - 1);
          strHelps := copy(strHelps, Pos(';', strHelps) + 1, length(strHelps));
        end else
        begin
          strHelp := strHelps;
          strHelps := '';
        end;
        if strHelp = '' then
          strHelp := strEdit;
        if dsEditing.FieldByName(strEdit).AsString <> dsHelp.FieldByName(strHelp).AsString then
          dsEditing.FieldByName(strEdit).AsString :=
            dsHelp.FieldByName(strHelp).AsString;
      end;
    end;
  end;
end;

//btnNew.Click
procedure TfrmComHelp.btnNewClick(Sender: TObject);
begin
  LoadEditForm('A');
end;

//btnModify.Click
procedure TfrmComHelp.btnModifyClick(Sender: TObject);
begin
  LoadEditForm('M');
end;

//btnDel.Click
procedure TfrmComHelp.btnDelClick(Sender: TObject);
begin
  If not dsHelp.IsEmpty Then
  begin
    If HaveDetail(dsHelp, strDetailTables, strDetailWheres) Then
      Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
    else
    begin
      if Application.MessageBox('确定要删除此项资料吗?',
        '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        dsHelp.Delete;
        dsHelp.ApplyUpdates(0);
        dsAfterOpen(nil);
      end;
    end;
  end;
end;

//btnSetColumn.Click
procedure TfrmComHelp.btnSetColumnClick(Sender: TObject);
begin
  frmSetColumn.strFormName := self.Name;
  frmSetColumn.dbgSC := DBGrid1;
  frmSetColumn.ShowModal;
end;

{*****自定义过程*****}

//GetFilter
function TfrmComHelp.GetFilter: string;
begin
  result := '';
end;

//SetFilter
procedure TfrmComHelp.SetFilter(Sender: TObject);
var
  i: integer;
  c: TControl;
  s: string;
  w: string;
  strFieldName: string;
begin
  screen.Cursor := crHourGlass;
  s := GetFilter;
  for i := 0 to self.ComponentCount - 1 do
  begin
    c := TControl(self.Components[i]);
    if Copy(c.Hint, 1 , 1) = '%' then
    begin
      w := '%';
      strFieldName := Copy(c.Hint, 2 , Length(c.Hint) - 1);
    end
    else
    begin
      w := '';
      strFieldName := c.Hint;
    end;
    if strFieldName <> '' then
    begin
      if pDataBaseType = 'SERVER' then
      begin
        if (c is TEdit) then
          if (TEdit(c).Tag = 0) and (TEdit(c).Text <> '') then
            s := s + ' and ' + strFieldName +
              ' = ' + #39 + TEdit(c).Text + '*' + #39;
        if (c is TComboBox) then
          if (TComboBox(c).Tag = 0) and (TComboBox(c).Text <> '') then
            s := s + ' and ' + strFieldName +
              ' = ' + #39 + TComboBox(c).Text + '*' + #39;
      end else
      begin
        if (c is TEdit) then
          if (TEdit(c).Tag = 0) and (TEdit(c).Text <> '') then
            s := s + ' and ' + strFieldName +
              ' like ' + #39 + w + TEdit(c).Text + '%' + #39;
        if (c is TComboBox) then
          if (TComboBox(c).Tag = 0) and (TComboBox(c).Text <> '') then
            s := s + ' and ' + strFieldName +
              ' like ' + #39 + w + TComboBox(c).Text + '%' + #39;
      end;
    end;
  end;
  if UpperCase(Trim(Copy(s, 1, 4))) = 'AND' then
    s := Trim(Copy(s, 5, Length(s) - 4));
  if IsFormShow then
  begin
    if s <> '' then
    begin
      TDcomConnection(Data.FindComponent(dsHelp.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsHelp.ProviderName, 2, Length(dsHelp.ProviderName) - 1), s]));
      dsHelp.Refresh;
    end;
  end
  else
  begin
    TDcomConnection(Data.FindComponent(dsHelp.RemoteServer.Name)).Appserver.SetFilter(VarArrayOf([Copy(dsHelp.ProviderName, 2, Length(dsHelp.ProviderName) - 1), s]));
    dsHelp.Refresh;
  end;
  if (Sender is TRadioGroup) or (Sender is TCheckBox) or (Sender is  TRadioButton) then
    if Edit1.Enabled then Edit1.SetFocus;
  screen.Cursor := crDefault;
end;

//dsAfterOpen
procedure TfrmComHelp.dsAfterOpen(DataSet: TDataSet);
begin
  btnNew.Enabled := (btnNew.Tag = 0) and (dsEditing <> nil);
  btnModify.Enabled := (btnModify.Tag = 0) and (not dsHelp.IsEmpty) and (dsEditing <> nil);
  btnDel.Enabled := (btnDel.Tag = 0) and (not dsHelp.IsEmpty) and (dsEditing <> nil);
  btnOk.Enabled := not dsHelp.IsEmpty;
end;

//LoadEditForm
procedure TfrmComHelp.LoadEditForm(strState: string);
begin
  frmEdit.dsNew := DBGrid1.DataSource;
  frmEdit.strState := strState;
  frmEdit.ShowModal;
  frmEdit.Free;
  dsAfterOpen(nil);
  if Edit1.Enabled then Edit1.SetFocus;
end;

//SaveColumnQuery
procedure TfrmComHelp.SaveColumnQuery;
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
function TfrmComHelp.GetColumnInfo(FileName: string): string;
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

procedure TfrmComHelp.OpenDataSet;
begin
//
end;

procedure TfrmComHelp.dsAfterScroll(DataSet: TDataSet);
begin
//
end;

end.
