unit ComEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBClient, Common, Variants;

type
	TfrmComEdit = class(TForm)
		Bevel1: TBevel;
    btnInsert: TBitBtn;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
		Label1: TLabel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);virtual;
    procedure btnInsertClick(Sender: TObject);virtual;
		procedure btnOkClick(Sender: TObject);virtual;
		procedure btnCancelClick(Sender: TObject);virtual;
		procedure FormKeyDown(Sender: TObject; var Key: Word;
			Shift: TShiftState);virtual;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);virtual;
		procedure dsOnNewRecord(DataSet: TDataSet);virtual;
		procedure dsAfterInsert(DataSet: TDataSet);virtual;
		procedure dsBeforeEdit(DataSet: TDataSet);virtual;
		procedure dsBeforePost(DataSet: TDataSet);virtual;
		procedure dsAfterPost(DataSet: TDataSet);virtual;
		procedure dsBeforeScroll(DataSet: TDataSet);virtual;
		procedure dsAfterScroll(DataSet: TDataSet);virtual;
    procedure dsAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);virtual;
		procedure sDataChange(Sender: TObject; Field: TField);virtual;
		procedure DBNavigator1BeforeAction(Sender: TObject;
			Button: TNavigateBtn);virtual;
    procedure MyAfterApplyUpdates;virtual;
    function OldValue(FileName: string): Variant;virtual;
	private
		{ Private declarations }
		cdsEve: cdsEventsArray;
		IsActive: boolean;
  public
    { Public declarations }
    strState: string;
    dsEdits: TClientDataSet;
    strKeyFields: string;
    blnSetID: boolean;
    dsNew: TDataSource;
    arrEdits: Variant;
	end;

var
  frmComEdit: TfrmComEdit;

implementation

uses Main, Dm, Select, SetDate, SetCal;

{$R *.DFM}

//Form.Show
procedure TfrmComEdit.FormShow(Sender: TObject);
var
  i: integer;
  dsOld: TDataSource;
begin
  screen.Cursor := crHourGlass;
  self.Top := frmMain.Top + frmMain.Height - self.Height - 4;
  self.left := frmMain.Width - self.Width - 8;
  dsOld := DBEdit1.DataSource;
  if dsNew = nil then
    dsNew := dsOld;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) then
    begin
  		if (TEdit(self.Components[i]).ReadOnly) or not (TEdit(self.Components[i]).Enabled) then
      begin
				TEdit(self.Components[i]).Color := cl3DLight;
				TEdit(self.Components[i]).TabStop := False;
      end;
    end else
    if (Components[i] is TDBEdit) then
    begin
      if (TDBEdit(Components[i]).DataSource = nil) or
         (TDBEdit(Components[i]).DataSource = dsOld) then
        TDBEdit(self.Components[i]).DataSource := dsNew;
  		if (TDBEdit(self.Components[i]).ReadOnly) or not (TDBEdit(self.Components[i]).Enabled) then
      begin
				TDBEdit(self.Components[i]).Color := cl3DLight;
				TDBEdit(self.Components[i]).TabStop := False;
      end;
    end else
    if (Components[i] is TDBText) then
    begin
      if (TDBText(Components[i]).DataSource = nil) or
         (TDBText(Components[i]).DataSource = dsOld) then
        TDBText(self.Components[i]).DataSource := dsNew;
    end else
    if (Components[i] is TDBComboBox) then
    begin
      if (TDBComboBox(Components[i]).DataSource = nil) or
         (TDBComboBox(Components[i]).DataSource = dsOld) then
        TDBComboBox(self.Components[i]).DataSource := dsNew;
    end else
    if (Components[i] is TDBRadioGroup) then
    begin
      with TDBRadioGroup(Components[i]) do
        ItemIndex := Values.IndexOf(Field.AsString);
    end;
  end;
  dsEdits := TClientdataset(DBEdit1.DataSource.DataSet);
  IsActive := false;
  if not ( dsEdits.Active ) then
    dsEdits.Open
  else
    IsActive := true;
 	arrEdits := VarArrayCreate([0, dsEdits.FieldCount - 1], varVariant);
  if strKeyFields = null then
    strKeyFields := ''
  else
    strKeyFields := UpperCase(strKeyFields);
  if strKeyFields <> '' then
    strKeyFields := strKeyFields + ';';
  if (strState = 'A') or (strState = 'I') then
  begin
    if Self.Caption <> Self.Name then
      self.Caption := self.Caption + '资料增加'
    else
      self.Caption := '资料增加';
    self.btnInsert.Visible := True;
		self.DBNavigator1.Visible := False;
    if strState = 'A' then
      dsEdits.Append
    else
			dsEdits.Insert;
    frmMain.ilsSub.GetIcon(3, self.Icon);
	end else
	begin
    if Self.Caption <> Self.Name then
      self.Caption := self.Caption + '资料修改'
    else
      self.Caption := '资料修改';
		self.btnInsert.Visible := False;
		DBNavigator1.DataSource := DBEdit1.DataSource;
		self.DBNavigator1.Visible := True;
		frmMain.ilsSub.GetIcon(4, self.Icon);
	end;
	cdsEve := SaveCDSEvents(dsEdits);
	dsEdits.OnNewRecord := dsOnNewRecord;
	dsEdits.AfterInsert := dsAfterInsert;
	dsEdits.BeforeEdit := dsBeforeEdit;
	dsEdits.BeforePost := dsBeforePost;
	dsEdits.AfterPost := dsAfterPost;
	dsEdits.BeforeScroll := dsBeforeScroll;
	dsEdits.AfterScroll := dsAfterScroll;
	dsEdits.AfterApplyUpdates := dsAfterApplyUpdates;
	DBEdit1.DataSource.OnDataChange := sDataChange;
	if (strState = 'A') or (strState = 'I') then
		dsOnNewRecord(dsEdits);
  if DBEdit1.Visible then
    DBEdit1.SetFocus;
  screen.Cursor := crDefault;
end;

//Form.Close
procedure TfrmComEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if IsActive then
		dsEdits.Open;
	RestoreCDSEvents(dsEdits, cdsEve);
	DBEdit1.DataSource.OnDataChange := nil;
end;

//btnInsert.Click
procedure TfrmComEdit.btnInsertClick(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  try
    if dsEdits.State in [dsInsert, dsEdit] then
      dsEdits.Post;
    if dsEdits.ChangeCount > 0 Then
      if dsEdits.ApplyUpdates(0) > 0 then
        Abort;
    MyAfterApplyUpdates;
    if strState = 'A' then
      dsEdits.Append
    else
      dsEdits.Insert;
  finally
    screen.Cursor := crDefault;
    if DBEdit1.Visible then
      DBEdit1.SetFocus;
  end;
end;

//btnOk.Click
procedure TfrmComEdit.btnOkClick(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  try
    if dsEdits.State in [dsInsert,dsEdit] then
      dsEdits.Post;
    if dsEdits.ChangeCount > 0 Then
      if dsEdits.ApplyUpdates(0) > 0 then
        Abort;
    MyAfterApplyUpdates;
  finally
    screen.Cursor := crDefault;
  end;
  ModalResult := Mrok;
  Close;
end;

//btnCancel.Click
procedure TfrmComEdit.btnCancelClick(Sender: TObject);
begin
  dsEdits.Cancel;
  if dsEdits.ChangeCount > 0 then
    dsEdits.CancelUpdates;
  Close;
end;

//Form.KeyDown
procedure TfrmComEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  intTop, intLeft: integer;
begin
  case Key of
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
        if screen.ActiveControl is TDBEdit then
        begin
          if Assigned(TDBEdit(screen.ActiveControl).OnDblClick) then
            TDBEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0)
          else if TDBEdit(screen.ActiveControl).Field is TStringField then
          begin
            frmSelect.DataSet := TDBEdit(screen.ActiveControl).DataSource.DataSet;
            frmSelect.FieldName := TDBEdit(screen.ActiveControl).DataField;
            frmSelect.ShowModal;
          end
          else if TDBEdit(screen.ActiveControl).Field is TDateTimeField then
          begin
            intTop := screen.ActiveControl.ClientOrigin.y + screen.ActiveControl.Height;
            if intTop + frmSetDate.Height > screen.Height then
              intTop := screen.ActiveControl.ClientOrigin.y - frmSetDate.Height - 2;
            intLeft := screen.ActiveControl.ClientOrigin.x - 2;
            if intLeft + frmSetDate.Width > screen.Width then
              intLeft := screen.Width - frmSetDate.Width - 2;
            frmSetDate.Top := intTop;
            frmSetDate.Left := intLeft;
            frmSetDate.DataSet := TDBEdit(screen.ActiveControl).DataSource.DataSet;
            frmSetDate.FieldName := TDBEdit(screen.ActiveControl).DataField;
            frmSetDate.CurDate := TDBEdit(screen.ActiveControl).Field.AsDateTime;
            frmSetDate.ShowModal;
          end
          else if TDBEdit(screen.ActiveControl).Field is TNumericField then
          begin
            intTop := screen.ActiveControl.ClientOrigin.y + screen.ActiveControl.Height;
            if intTop + frmSetCal.Height > screen.Height then
              intTop := screen.ActiveControl.ClientOrigin.y - frmSetCal.Height - 2;
            intLeft := screen.ActiveControl.ClientOrigin.x - 2;
            if intLeft + frmSetCal.Width > screen.Width then
              intLeft := screen.Width - frmSetCal.Width - 2;
            frmSetCal.Top := intTop;
            frmSetCal.Left := intLeft;
            frmSetCal.DataSet := TDBEdit(screen.ActiveControl).DataSource.DataSet;
            frmSetCal.FieldName := TDBEdit(screen.ActiveControl).DataField;
            frmSetCal.ShowModal;
          end
        end
        else if screen.ActiveControl is TDBLookupComboBox then
          TDBLookupComboBox(screen.ActiveControl).DropDown;
  end;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_PRIOR: DBNavigator1.BtnClick(nbFirst);
      VK_NEXT: DBNavigator1.BtnClick(nbLast);
      VK_UP: DBNavigator1.BtnClick(nbPrior);
      VK_DOWN: DBNavigator1.BtnClick(nbNext);
    end;
    Key := 0;
  end;
end;

//dsOnNewRecord
procedure TfrmComEdit.dsOnNewRecord(DataSet: TDataSet);
var
  i: Integer;
  strS: TStringList;
  DBEditTmp: TDBEdit;
  intdef: Integer;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TDBRadioGroup) then
      with TDBRadioGroup(Components[i]) do
        ItemIndex := Tag;
    if (self.Components[i] is TDBEdit) then
    begin
      DBEditTmp := TDBEdit(self.Components[i]);
      if pblnLoadAppSelect then
        if DBEditTmp.Field.DataType in [ftString, ftWideString] then
        begin
          Data.AppSelect.Close;
          Data.AppSelect.CommandText := 'select * from AppSelect where DataSet = ''' +
            DBEditTmp.DataSource.DataSet.Name + ''' and FieldName = ''' +
            DBEditTmp.DataField + '''';
          Data.AppSelect.Open;
          intdef := Data.AppSelect.FieldByName('DefaultRow').AsInteger;
          if (intDef > 0) and (intDef < 1000) then
          begin
            strS := TStringList.Create;
            strS.Text := Data.AppSelect.FieldByName('DataSelect').Value;
            if intDef <= strS.Count then
              DBEditTmp.Field.AsString := strS[intDef-1];
          end;
          Data.AppSelect.CLose;
        end;
      if DBEditTmp.Field.DataType in [ftDate, ftDateTime] then
      begin
        with CurDs do
        begin
          CommandText := 'select * from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
            'DATASET = ''' + DBEditTmp.DataSource.DataSet.Name + ''' and ' +
            'FIELDNAME = ''' + DBEditTmp.DataField + '''';
          Open;
          if not IsEmpty then
            if FieldByName('DEFAULDATE').AsInteger = 1 then
              DBEditTmp.Field.AsDateTime := Date
            else
              DBEditTmp.Field.AsDateTime := FieldByName('SETDATE').AsDateTime;
          Close;
        end;
      end;
    end;
  end;
end;

//dsAfterInsert
procedure TfrmComEdit.dsAfterInsert(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to dsEdits.FieldCount - 1 do
    arrEdits[i] := dsEdits.Fields[i].Value;
end;

//dsBeforeEdit
procedure TfrmComEdit.dsBeforeEdit(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to dsEdits.FieldCount - 1 do
    arrEdits[i] := dsEdits.Fields[i].Value;
end;

//sDataChange
procedure TfrmComEdit.sDataChange(Sender: TObject; Field: TField);
begin
//
end;

//dsBeforePost
procedure TfrmComEdit.dsBeforePost(DataSet: TDataSet);
var
  i : integer;
  dsField: TField;
begin
  for i := 0 to dsEdits.FieldCount - 1 do
    if (dsEdits.Fields[i] is TNumericField) and not (dsEdits.Fields[i] is TAutoIncField) then
      if dsEdits.Fields[i].Value = null then
        dsEdits.Fields[i].Value := 0
      else if TNumericField(dsEdits.Fields[i]).DisplayFormat <> '' then
        dsEdits.Fields[i].AsString := FormatFloat(StringReplace(TNumericField(dsEdits.Fields[i]).DisplayFormat, ',', '', [rfReplaceAll]), dsEdits.Fields[i].Value);
//处理必填字段
  for i := 0 to self.ComponentCount - 1 do
  begin
    dsField := nil;
    if (self.Components[i] is TDBEdit) then
      dsField := TDBEdit(self.Components[i]).Field
    else if (self.Components[i] is TDBListBox) then
      dsField := TDBListBox(self.Components[i]).Field
    else if (self.Components[i] is TDBComboBox) then
      dsField := TDBComboBox(self.Components[i]).Field
    else if (self.Components[i] is TDBCheckBox) then
      dsField := TDBCheckBox(self.Components[i]).Field
    else if (self.Components[i] is TDBLookupListBox) then
      dsField := TDBLookupListBox(self.Components[i]).Field
    else if (self.Components[i] is TDBLookupComboBox) then
      dsField := TDBLookupComboBox(self.Components[i]).Field;
    if (dsField <> nil) and (dsField.DataSet = dsEdits) then
    begin
      if (Pos(UpperCase(dsField.FieldName) + ';', strKeyFields) <> 0) then
      begin
        if (dsField is TStringField) and (dsField.AsString = '')
          or (dsField is TNumericField) and (dsField.AsFloat = 0)
          or (dsField is TDateTimeField) and (dsField.value = null) then
        begin
          Application.MessageBox(Pchar('''' + dsField.DisplayLabel + '''未录入, 请继续录入!'), '录入错误', MB_OK + MB_ICONWARNING);
          TWinControl(self.Components[i]).SetFocus;
          abort;
        end;
      end;
    end
  end;
  //Set ID
  if blnSetID then
    if DataSet.State in [dsInsert] then
      SetFieldValue('select iif(isnull(max(ID)), 1, max(ID)+1) from ' +
        Copy(TClientDataSet(DataSet).ProviderName, 2, Length(TClientDataSet(DataSet).ProviderName) - 1) + ' where ID > 0', DataSet, 'ID');
  //
end;

//dsAfterPost
procedure TfrmComEdit.dsAfterPost(DataSet: TDataSet);
var
  i, intIndex: integer;
  strS: TStringList;
  DBEditTmp: TDBEdit;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TDBEdit) then
    begin
      DBEditTmp := TDBEdit(self.Components[i]);
      if not DBEditTmp.Visible then
        Continue;
      if pblnSaveAppSelect then
        if (DBEditTmp.Field.DataType in [ftString,ftWideString]) and
          (DBEditTmp.Field.AsString <> '') then
        begin
          Data.AppSelect.Close;
          Data.AppSelect.CommandText := 'select * from AppSelect where DataSet = ''' +
            DBEditTmp.DataSource.DataSet.Name + ''' and FieldName = ''' +
            DBEditTmp.DataField + '''';
          Data.AppSelect.Open;
          if Data.AppSelect.FieldByName('DataSet').AsString <> '' then
          begin
            if Data.AppSelect.FieldByName('AutoUpdate').AsBoolean then
            begin
              strS := TStringList.Create;
              strS.Text := Data.AppSelect.FieldByName('DataSelect').Value;
              intIndex := strS.IndexOf(DBEditTmp.Text);
              if intIndex <> -1 then
                strS.Delete(intIndex);
              for intIndex := 19 to strS.Count - 1 do
                strS.Delete(intIndex);
              strS.Insert(0, DBEditTmp.Text);
              SqlExec('update AppSelect set DataSelect = ''' + strS.Text +
                ''' where DataSet = ''' +
                DBEditTmp.DataSource.DataSet.Name + ''' and FieldName = ''' +
                DBEditTmp.DataField + '''');
            end;
          end else
            SqlExec('insert into AppSelect (DataSet,FieldName,DataSelect,AutoUpdate) values ' +
            '(''' + DBEditTmp.DataSource.DataSet.Name + ''',''' +
              DBEditTmp.DataField + ''',''' + DBEditTmp.Text + ''',1)' );
          Data.AppSelect.CLose;
        end;
      if (DBEditTmp.Field.DataType in [ftDate, ftDateTime]) and
         (DBEditTmp.Field.AsDateTime <> 0) then
        if pDataBaseType = 'SERVER' then
          SqlExec('update AppDate set SETDATE = ''' + DBEditTmp.Text + ''' ' +
            'where uId = ' + IntToStr(pintUserId) + ' and ' +
            'DATASET = ''' + DBEditTmp.DataSource.DataSet.Name + ''' and ' +
            'FIELDNAME = ''' + DBEditTmp.DataField + ''' and ' +
            'DEFAULDATE = 2')
        else
          SqlExec('update AppDate set SETDATE = #' + DateToStr(strToDateTime(DBEditTmp.Text)) + '# ' +
            'where uId = ' + IntToStr(pintUserId) + ' and ' +
            'DATASET = ''' + DBEditTmp.DataSource.DataSet.Name + ''' and ' +
            'FIELDNAME = ''' + DBEditTmp.DataField + ''' and ' +
            'DEFAULDATE = 2');
    end;
  end;
end;

procedure TfrmComEdit.dsBeforeScroll(DataSet: TDataSet);
begin
//
end;

procedure TfrmComEdit.dsAfterScroll(DataSet: TDataSet);
begin
//
end;

procedure TfrmComEdit.dsAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
//
end;

//DBNavigator1.BeforeAction
procedure TfrmComEdit.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if dsEdits.State in [dsInsert,dsEdit] then
    dsEdits.Post;
  if dsEdits.ChangeCount > 0 Then
    case Application.MessageBox('是否保存对当前资料的修改?', '资料保存',
      MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON1 ) of
    IDYES:
      begin
        if dsEdits.State in [dsInsert,dsEdit] then
          dsEdits.Post;
        if dsEdits.ChangeCount > 0 Then
          if dsEdits.ApplyUpdates(0) > 0 then
            Abort;
        MyAfterApplyUpdates;
      end;
    IDNO:
        dsEdits.CancelUpdates;
    else
      abort;
    end;
end;


procedure TfrmComEdit.MyAfterApplyUpdates;
begin
//
end;

function TfrmComEdit.OldValue(FileName: string): Variant;
begin
  Result := arrEdits[ dsEdits.FieldByName(FileName).Index ];
end;

end.
