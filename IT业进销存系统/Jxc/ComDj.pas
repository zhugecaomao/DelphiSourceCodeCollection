unit ComDj;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, DBCtrls, ImgList, ComCtrls, Menus, ToolWin, Grids, DBGrids,
	StdCtrls, Mask,Clipbrd,db, Buttons, DBTables, QuickRpt, DBClient,
	ActnList, Common, iniFiles, Variants;

type
  TfrmComDj = class(TForm)
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnSave: TMenuItem;
    smnCancel: TMenuItem;
    N3: TMenuItem;
    smnPreview: TMenuItem;
    smnPrint: TMenuItem;
    N1: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    smnInsert: TMenuItem;
    smnDelete: TMenuItem;
    PopupMenu1: TPopupMenu;
    pmnSave: TMenuItem;
    pmnCancel: TMenuItem;
    smnDel: TMenuItem;
    Stool: TMenuItem;
    Panel1: TPanel;
    ControlBar1: TControlBar;
		ToolBar1: TToolBar;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    ToolButton3: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    ToolButton9: TToolButton;
    btnInsert: TToolButton;
    btnDelete: TToolButton;
    btnNew: TToolButton;
    btnDel: TToolButton;
    ToolButton13: TToolButton;
    smnNew: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    smnPrior: TMenuItem;
    smnNext: TMenuItem;
    N2: TMenuItem;
    smnFirst: TMenuItem;
    smnLast: TMenuItem;
    smmCalendar: TMenuItem;
		smmCalculator: TMenuItem;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    pmnNew: TMenuItem;
    pmnDel: TMenuItem;
    N6: TMenuItem;
    pmnInsert: TMenuItem;
    pmnDelete: TMenuItem;
    N10: TMenuItem;
    pmnFirst: TMenuItem;
    pmnPrior: TMenuItem;
    pmnNext: TMenuItem;
    pmnLast: TMenuItem;
    ActionList1: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aPreview: TAction;
    aPrint: TAction;
		aExit: TAction;
    aNew: TAction;
    aDel: TAction;
    aDelete: TAction;
    aFirst: TAction;
    aPrior: TAction;
    aNext: TAction;
    aLast: TAction;
    aInsert: TAction;
    aCalendar: TAction;
    aCalculator: TAction;
    aSetColumn: TAction;
    N4: TMenuItem;
    O1: TMenuItem;
    N5: TMenuItem;
    O2: TMenuItem;
    ToolBar3: TToolBar;
    btnExit: TToolButton;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);virtual;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);virtual;
    procedure sZbStateChange(Sender: TObject);virtual;
		procedure SetCanSave(Can: boolean);virtual;
    procedure sZbDataChange(Sender: TObject; Field: TField);virtual;
    procedure sMxDataChange(Sender: TObject; Field: TField);virtual;
    procedure ZbOnNewRecord(DataSet: TDataSet);virtual;
    procedure ZbBeforeEdit(DataSet: TDataSet);virtual;
    procedure ZbBeforePost(DataSet: TDataSet);virtual;
    procedure ZbAfterPost(DataSet: TDataSet);virtual;
    procedure ZbBeforeScroll(DataSet: TDataSet);virtual;
    procedure ZbAfterScroll(DataSet: TDataSet);virtual;
    procedure MxBeforeApplyUpdates;virtual;
    procedure MxBeforeInsert(DataSet: TDataSet);virtual;
    procedure MxOnNewRecord(DataSet: TDataSet);virtual;
    procedure MxAfterInsert(DataSet: TDataSet);virtual;
    procedure MxBeforeEdit(DataSet: TDataSet);virtual;
    procedure MxBeforePost(DataSet: TDataSet);virtual;
    procedure MxAfterPost(DataSet: TDataSet);virtual;
    procedure MxBeforeDelete(DataSet: TDataSet);virtual;
    procedure MxAfterDelete(DataSet: TDataSet);virtual;
    procedure MxBeforeCancel(DataSet: TDataSet);virtual;
    procedure MxAfterCancel(DataSet: TDataSet);virtual;
    procedure aSaveExecute(Sender: TObject);virtual;
    procedure aCancelExecute(Sender: TObject);virtual;
    procedure aPreviewExecute(Sender: TObject);virtual;
		procedure aPrintExecute(Sender: TObject);virtual;
    procedure aExitExecute(Sender: TObject);virtual;
    procedure aNewExecute(Sender: TObject);virtual;
    procedure aDelExecute(Sender: TObject);virtual;
    procedure aInsertExecute(Sender: TObject);virtual;
    procedure aDeleteExecute(Sender: TObject);virtual;
    procedure aFirstExecute(Sender: TObject);virtual;
    procedure aPriorExecute(Sender: TObject);virtual;
    procedure aNextExecute(Sender: TObject);virtual;
    procedure aLastExecute(Sender: TObject);virtual;
    procedure aCalendarExecute(Sender: TObject);virtual;
    procedure aCalculatorExecute(Sender: TObject);virtual;
    procedure DBGrid1EditButtonClick(Sender: TObject);virtual;
    //自定义
    procedure IniRecord; virtual;
    function SaveQuery:Boolean;virtual;
    procedure SetButton;virtual;
    procedure LoadPrintForm;virtual;
    procedure TotalField(Kind: char; Field: TField);virtual;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure aSetColumnExecute(Sender: TObject);
    procedure DBEditExit(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);virtual;
  private
		{ Private declarations }
		cdsZbEve: cdsEventsArray;
		cdsMxEve: cdsEventsArray;
		CanSave1: boolean;
    CanDataChange: boolean;
    wcTmp: TWinControl;
    CancelEdit: Boolean;
    blnPreview: boolean;
    procedure SaveColumnQuery;
    function GetColumnInfo(FileName: string): string;
  public
    { Public declarations }
    ReportName: string;
    dsZb : TClientDataSet;
    dsMx : TClientDataSet;
    arrMx : Variant;
    strState : String;
    rpt1 : TQuickRep;
		blnStopSetColumn: boolean;
    blnSetZbID: boolean;
    blnStopScroll: boolean;
		strAutoScale: string;
    strZbKeyFields, strMxKeyFields: string;
    strZbHelpFields, strMxHelpFields: string;
    strZbDetailTables, strZbDetailWheres: string;
    strMxDetailTables, strMxDetailWheres: string;
		strZbMxKey: string;  //设置明细与总表相同的字段 例：'总表字段1,明细字段1; 总表字段2,明细字段2'
    strMxHh: string;
    property CanSave :Boolean read CanSave1 write SetCanSave;
    function arMx(FileName: string): Variant;
  end;

var
  frmComDj: TfrmComDj;
  intGCIdx: Integer;

implementation

uses
	Dm, Main, Wnl, SetColumn, SetPrint, ComDjzb, Select, ComJbzl, SetDate,
  SetCal;

{$R *.DFM}

//Form.Create
procedure TfrmComDj.FormCreate(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  if self.icon.Empty then
    self.icon := screen.ActiveForm.Icon;
end;

//Form.Show
procedure TfrmComDj.FormShow(Sender: TObject);
var
  i, j: integer;
  intWid: integer;
  ctrTmp: TControl;
  CShape: TShape;
  strFileName: string;
  c: TComponent;
begin
	if DBNavigator1.DataSource <> nil then
		dsZb := TClientDataSet(DBNavigator1.DataSource.DataSet);
 	DBNavigator1.DataSource.OnStateChange := sZbStateChange;
	DBNavigator1.DataSource.OnDataChange := sZbDataChange;
  DBNavigator1.Enabled := not blnStopScroll;
	dsMx := TClientDataSet(DBGrid1.DataSource.DataSet);
	DBGrid1.DataSource.OnStateChange := sZbStateChange;
	DBGrid1.DataSource.OnDataChange := sMxDataChange;
	cdsZbEve := SaveCDSEvents(dsZb);
	cdsMxEve := SaveCDSEvents(dsMx);
  with dsZb do
  begin
    OnNewRecord := ZbOnNewRecord;
    BeforeEdit := ZbBeforeEdit;
    BeforePost := ZbBeforePost;
    AfterPost := ZbAfterPost;
    BeforeScroll := ZbBeforeScroll;
    AfterScroll := ZbAfterScroll;
  end;
	with dsMx do
	begin
		BeforeInsert := MxBeforeInsert;
		OnNewRecord := MxOnNewRecord;
		AfterInsert := MxAfterInsert;
		BeforeEdit := MxBeforeEdit;
		BeforePost := MxBeforePost;
		AfterPost := MxAfterPost;
		BeforeDelete := MxBeforeDelete;
		AfterDelete := MxAfterDelete;
		BeforeCancel := MxBeforeCancel;
		AfterCancel := MxAfterCancel;
	end;
	arrMx := VarArrayCreate([0, dsMx.FieldCount - 1], varVariant);
	for i := 0 to dsMx.FieldCount - 1 do
		if dsMx.Fields[i] is TNumericField then
			arrMx[i] := 0;
  //Popedom
  if UpperCase(pstrUserCode) <> 'SYS' then
    with Data.Tmpl do
    begin
      Close;
      CommandText := 'select * from AppGroupAction ' +
        'where gName = ''' + pstrUserGroup + ''' and ' +
        'fName = ''' + self.Name + '''';
      Open;
      while not Eof do
      begin
        c := self.FindComponent(FieldByName('aName').AsString);
        if c <> nil then
        begin
          c.Tag := 1;
          if c is TCustomAction then
            TCustomAction(c).Enabled := false;
          if c is TControl then
            TControl(c).Enabled := false;
        end;
        Next;
      end;
    end;
  //KeyFields
  if strZbKeyFields = null then
    strZbKeyFields := ''
  else
    strZbKeyFields := UpperCase(strZbKeyFields);
  if strZbKeyFields <> '' then
    strZbKeyFields := strZbKeyFields + ';';
  if strMxKeyFields = '' then
    strMxKeyFields := DBGrid1.Columns[0].FieldName
  else if strMxKeyFields = null then
    strMxKeyFields := ''
  else
    strMxKeyFields := UpperCase(strMxKeyFields);
  if strMxKeyFields <> '' then
    strMxKeyFields := strMxKeyFields + ';';
  //HelpFields
  if strZbHelpFields = null then
    strZbHelpFields := ''
  else
    strZbHelpFields := UpperCase(strZbHelpFields) + ';';
  if strMxHelpFields = null then
    strMxHelpFields := ''
  else
    strMxHelpFields := UpperCase(strMxHelpFields) + ';';
  //DBGrid
  for i := 0 to self.ComponentCount - 1 do
    if self.Components[i] is TDBGrid then
    begin
      //Title.Alignment , Color
      with TDBGrid(self.Components[i]) do
      begin
        intWid := 0;
        for j := 0 to Columns.Count - 1 do
        begin
          Columns[j].Title.Alignment := taCenter;
          if (Columns[j].ReadOnly) and (strState <> 'V') then
            Columns[j].Color := $00EFEFEF;
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
		if (ctrTmp is TSpeedButton) and (strState = 'V') then
			TSpeedButton(ctrTmp).Enabled := false;
		if (ctrTmp is TDBEdit) or (ctrTmp is TDBText) or (ctrTmp is TEdit)then
		begin
			if (ctrTmp is TDBEdit) then
      begin
        if strZbHelpFields <> '' then
          //OnExit Even
          if Assigned(TDBEdit(ctrTmp).OnDblClick) and
            not Assigned(TDBEdit(ctrTmp).OnExit) and
            (Pos(UpperCase(TDBEdit(ctrTmp).DataField), strZbHelpFields) > 0) and
            (strState <> 'V') then
            TDBEdit(ctrTmp).OnExit := DBEditExit;
        //Color
				if TDBEdit(ctrTmp).ReadOnly and (strState <> 'V') then
					TDBEdit(ctrTmp).Color := $00EFEFEF
        else if TDBEdit(ctrTmp).Color = cl3DLight then
  				TDBEdit(ctrTmp).Color := TPanel(ctrTmp.Parent).Color;
      end;
			if (ctrTmp is TDBText) then
				if TDBText(ctrTmp).Color = cl3DLight then
					TDBText(ctrTmp).Color := TPanel(ctrTmp.Parent).Color;
			if (ctrTmp is TEdit) then
				if TEdit(ctrTmp).Color = cl3DLight then
					TEdit(ctrTmp).Color := TPanel(ctrTmp.Parent).Color;
			if ctrTmp.Visible and (UpperCase(Copy(ctrTmp.Parent.Name, 1 , 5)) = 'PANEL') then
			begin
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
    if (ctrTmp is TLabel) and (ctrTmp.Tag = 1) then
    begin
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
  ToolBar2.Left := ControlBar1.Left + ControlBar1.Width - ToolBar2.Width - ToolBar3.Width;
  ToolBar3.Left := ControlBar1.Left + ControlBar1.Width - ToolBar3.Width;
  CanSave := false;
//HaveDetail
  if frmMain.ActiveMDIChild is TfrmComJbzl then
  begin
    strZbDetailTables := TfrmComJbzl(frmMain.ActiveMDIChild).strDetailTables;
    strZbDetailWheres := TfrmComJbzl(frmMain.ActiveMDIChild).strDetailWheres;
  end;
//State
  dsZb.ReadOnly := strState = 'V';
  dsMx.ReadOnly := strState = 'V';
  if (strState = 'A') or (strState = 'I') then
    aNew.Execute;
  if strState = 'V' then
  begin
    aSave.Tag := 1;
    aCancel.Tag := 1;
    aNew.Tag := 1;
    aDel.Tag := 1;
		aInsert.Tag := 1;
    aDelete.Tag := 1;
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end
  else
    DBGrid1.Options := DBGrid1.Options + [dgEditing];
  IniRecord;
  if strState = 'V' then
  begin
    DBGrid1.SetFocus;
    DBGrid1.Options := DBGrid1.Options + [dgRowSelect];
  end
  else
    DBEdit1.SetFocus;
  screen.Cursor := crdefault;
end;

//DBGrid1EditButtonClick
procedure TfrmComDj.DBGrid1EditButtonClick(Sender: TObject);
begin
  if strState = 'V' then Exit;
  intGCIdx := DBGrid1.SelectedIndex;
end;

//Form.KeyDown
procedure TfrmComDj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  intLastEditCol: integer;
  intTop, intLeft: integer;
begin
  case Key of
    VK_RETURN:
      if not (ActiveControl is TDBGrid) then   // not TDBGrid
      begin
        Key := 0;
        if Shift = [ssShift] then
        begin
          Perform(WM_NEXTDLGCTL, 1, 0);
          while (ActiveControl is TDBEdit) and (TDBEdit(ActiveControl).ReadOnly) do
            Perform(WM_NEXTDLGCTL, 1, 0);
        end
        else if Shift = [ssCtrl] then
        begin
          wcTmp := ActiveControl;
          DBGrid1.SetFocus;
        end
        else
        begin
          Perform(WM_NEXTDLGCTL, 0, 0);
          while (ActiveControl is TDBEdit) and (TDBEdit(ActiveControl).ReadOnly) do
            Perform(WM_NEXTDLGCTL, 0, 0);
        end;
      end
      else // is TDBGrid
        if Shift = [ssCtrl] then  // Ctrl + Return
					if wcTmp <> nil then
            wcTmp.SetFocus
          else
            Perform(WM_NEXTDLGCTL, 0, 0)
        else                      // Return
          with TDBGrid(ActiveControl) do
          begin
            if not (Shift = [ssShift]) then
            begin
              for intLastEditCol := FieldCount - 1 downto 0 do
                if not Columns[intLastEditCol].ReadOnly then
                  break;
              if (Columns[SelectedIndex].ReadOnly) or (DBGrid1.EditorMode) then
              begin
                Key := 0;
                repeat
                  SelectedIndex := SelectedIndex + 1;
                until (SelectedIndex >= intLastEditCol) or not (Columns[SelectedIndex].ReadOnly);
              end;
              if (SelectedIndex > intLastEditCol) or ((SelectedIndex = intLastEditCol) and DBGrid1.EditorMode) then
              begin
                DataSource.DataSet.Next;
                if DataSource.DataSet.Eof then
                  Datasource.DataSet.Append;
                for intLastEditCol := 0 to FieldCount - 1 do
                  if not Columns[intLastEditCol].ReadOnly then
                  begin
                    SelectedIndex := intLastEditCol;
                    Break;
                  end;
              end;
            end
            else
              repeat
                SelectedIndex := SelectedIndex - 1;
              until (SelectedIndex <= 0) or not (Columns[SelectedIndex].ReadOnly);
          end;
    VK_F4, VK_DOWN:
      begin
        if ActiveControl is TDBEdit then
          if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          begin
            Key := 0;
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
            end;
          end;
        if ActiveControl is TDBLookupComboBox then
          if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
            TDBLookupComboBox(ActiveControl).DropDown;
        if ActiveControl is TDBGrid then
          if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          begin
            Key := 0;
            if DBGrid1.Columns[DBGrid1.SelectedIndex].ButtonStyle = cbsEllipsis then
              DBGrid1EditButtonClick(ActiveControl)
            else if DBGrid1.Columns[DBGrid1.SelectedIndex].Field is TStringField then
            begin
              frmSelect.DataSet := DBGrid1.DataSource.DataSet;
              frmSelect.FieldName := DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName;
              frmSelect.ShowModal;
            end
            else if DBGrid1.Columns[DBGrid1.SelectedIndex].Field is TDateTimeField then
            begin
              intTop := Panel1.ClientOrigin.y;
              intLeft := Panel1.ClientOrigin.x + Panel1.Width - frmSetDate.Width - DBGrid1.Left - 2;
              frmSetDate.Top := intTop;
              frmSetDate.Left := intLeft;
              frmSetDate.DataSet := DBGrid1.DataSource.DataSet;
              frmSetDate.FieldName := DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName;
              frmSetDate.CurDate := DBGrid1.Columns[DBGrid1.SelectedIndex].Field.AsDateTime;
              frmSetDate.ShowModal;
            end
            else if DBGrid1.Columns[DBGrid1.SelectedIndex].Field is TNumericField then
            begin
              intTop := Panel1.ClientOrigin.y;
              intLeft := Panel1.ClientOrigin.x + Panel1.Width - frmSetCal.Width - DBGrid1.Left - 2;
              frmSetCal.Top := intTop;
              frmSetCal.Left := intLeft;
              frmSetCal.DataSet := DBGrid1.DataSource.DataSet;
              frmSetCal.FieldName := DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName;
              frmSetCal.ShowModal;
            end;
          end;
      end;
    VK_LEFT, VK_RIGHT:
      if strState = 'V' then
        case Key of
          VK_LEFT:
            begin
              Key := 0;
              TDBGrid(Screen.ActiveControl).Perform(WM_HSCROLL, 0, 0);
            end;
          VK_RIGHT:
            begin
              Key := 0;
              TDBGrid(Screen.ActiveControl).Perform(WM_HSCROLL, 1, 0);
            end;
        end;
  end;
end;

//Form.Close
procedure TfrmComDj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	SaveColumnQuery;
	DBNavigator1.DataSource.OnStateChange := nil;
	DBNavigator1.DataSource.OnDataChange := nil;
	DBGrid1.DataSource.OnStateChange := nil;
	DBGrid1.DataSource.OnDataChange := nil;
	RestoreCDSEvents(dsZb, cdsZbEve);
	RestoreCDSEvents(dsMx, cdsMxEve);
	dsMx.Close;
end;

//Form.CloseQuery
procedure TfrmComDj.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CanSave then
    CanClose := SaveQuery;
end;

//aSave.Execute
procedure TfrmComDj.aSaveExecute(Sender: TObject);
var
  blnPost: boolean;
  i: integer;
begin
  screen.Cursor := crHourGlass;
  try
    if dsMx.State in [dsInsert] then
    begin
      blnPost := True;
      for i := 0 to dsMx.FieldCount - 1 do
        if (strMxKeyFields <> '') and (Pos(UpperCase(dsMx.Fields[i].FieldName) + ';', strMxKeyFields) <> 0) then
          if (dsMx.Fields[i] is TStringField) and (dsMx.Fields[i].AsString = '')
            or (dsMx.Fields[i] is TNumericField) and (dsMx.Fields[i].AsFloat = 0)
            or (dsMx.Fields[i] is TDateTimeField) and (dsMx.Fields[i].value = null) then
            blnPost := false;
      if blnPost then
        dsMx.Post
      else
        dsMx.Cancel;
    end else if dsMx.State in [dsEdit] then
      dsMx.Post;
    if dsZb.State in [dsEdit, dsInsert] then
      dsZb.Post;
    if dsZb.ApplyUpdates(0) > 0 then
      Abort;
    MxBeforeApplyUpdates;
    if dsMx.ApplyUpdates(0) > 0 then
      Abort;
    CanSave := False;
    IniRecord;
  finally
    screen.Cursor := crdefault;
  end;
  if (strState = 'A') or (strState = 'I') then
    strState := 'M';
end;

//aCancel.Execute
procedure TfrmComDj.aCancelExecute(Sender: TObject);
var
  dsebScroll: TDataSetNotifyEvent;
begin
  dsebScroll := dszb.BeforeScroll;
  dszb.BeforeScroll := nil;
  try
    dsMx.CancelUpdates;
    dsZb.CancelUpdates;
    CanSave := false;
    IniRecord;
  finally
    dszb.BeforeScroll := dsebScroll;
  end;
end;

//aPreview.Execute
procedure TfrmComDj.aPreviewExecute(Sender: TObject);
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
procedure TfrmComDj.aPrintExecute(Sender: TObject);
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

//aExit.Execute
procedure TfrmComDj.aExitExecute(Sender: TObject);
begin
  Close;
end;

//aNew.Execute
procedure TfrmComDj.aNewExecute(Sender: TObject);
begin
  if (CanSave) and (dsZb.State in [dsInsert]) then
    SaveQuery;
  dsZb.Insert;
  strState := 'A';
  DBEdit1.SetFocus;
end;

//aDel.Execute
procedure TfrmComDj.aDelExecute(Sender: TObject);
begin
  if dsZb.State in [Dsinsert] then
  begin
    if Application.MessageBox( '确定要删除此张单吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
      aCancel.Execute
  end else
  begin
    If HaveDetail(dsZb, strZbDetailTables, strZbDetailWheres) Then
      Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
    else
    begin
      if Application.MessageBox( '确定要删除此张单吗?',
        '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
      begin
        CanSave := false;
        dsZb.Delete;
        dsZb.ApplyUpdates(0);
      end;
    end;
  end;
end;

//aInsert.Execute
procedure TfrmComDj.aInsertExecute(Sender: TObject);
begin
  dsMx.Insert;
  DBGrid1.SetFocus;
end;

//aDelete.Execute
procedure TfrmComDj.aDeleteExecute(Sender: TObject);
begin
  If HaveDetail(dsMx, strMxDetailTables, strMxDetailWheres) Then
    Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
  else
  begin
    if Application.MessageBox( '确定要删除此项资料吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
    dsMx.delete;
  end;
end;

//aSetColumn.Execute
procedure TfrmComDj.aSetColumnExecute(Sender: TObject);
begin
  frmSetColumn.strFormName := self.Name;
  if not (Screen.ActiveControl is TDBGrid) then
    frmSetColumn.dbgSC := DBGrid1
  else
    frmSetColumn.dbgSC := TDBGrid(Screen.ActiveControl);
  frmSetColumn.ShowModal;
end;

//aFirst.Execute
procedure TfrmComDj.aFirstExecute(Sender: TObject);
begin
  dsZb.First;
end;

//aPrior.Execute
procedure TfrmComDj.aPriorExecute(Sender: TObject);
begin
  dsZb.Prior;
end;

//aNext.Execute
procedure TfrmComDj.aNextExecute(Sender: TObject);
begin
  dsZb.Next;
end;

//aLast.Execute
procedure TfrmComDj.aLastExecute(Sender: TObject);
begin
  dsZb.Last;
end;

//aCalendar.Execute
procedure TfrmComDj.aCalendarExecute(Sender: TObject);
begin
  if frmWnl = nil then
    frmWnl := TfrmWnl.Create(self);
  frmWnl.MonthCalendar1.Date := Date();
  frmWnl.Show;
end;

//aCalculator.Execute
procedure TfrmComDj.aCalculatorExecute(Sender: TObject);
begin
  WinExec( 'Calc.exe', SW_SHOWDEFAULT );
end;

{*****自定义过程*****}

//Inirecord
procedure TfrmComDj.Inirecord;
var
  SaveCursor: TCursor;
  i: integer;
begin
  SaveCursor := screen.Cursor;
  screen.Cursor := crHourGlass;
  dsMx.Close;
  dsMx.Open;
  dsMx.First;
  for i := 0 to DbGrid1.Columns.Count - 1 do
    if DbGrid1.Columns[i].Visible and not (DbGrid1.Columns[i].ReadOnly) then
      Break;
  if i > DbGrid1.Columns.Count - 1 then
    i := 0;
  DbGrid1.SelectedIndex := i;
  SetButton;
  screen.Cursor := SaveCursor;
end;

//SaveQuery
function TfrmComDj.SaveQuery: boolean;
begin
  result := true;
  case Application.MessageBox('是否保存对当前资料的修改?', '资料保存',
    MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON1 ) of
    IDYES: aSave.Execute;
    IDNO: aCancel.Execute;
  else
    begin
      result := false;
      abort;
    end;
  end;
end;

//SetButton
procedure TfrmComDj.SetButton;
begin
  aPrint.Enabled := aPrint.Tag = 0;
  aPreview.Enabled := aPrint.Enabled;
  aNew.Enabled := aNew.Tag = 0;
  aDel.Enabled := (aDel.Tag = 0) and not (dsZb.IsEmpty);
  aInsert.Enabled := (aInsert.Tag = 0) and not (dsZb.IsEmpty) and not(DBGrid1.ReadOnly);
  aDelete.Enabled := (aDelete.Tag = 0) and not (dsMx.IsEmpty) and not(DBGrid1.ReadOnly);
  aFirst.Enabled := not blnStopScroll and (dsZb <> nil) and not(dsZb.Bof) and not (dsZb.IsEmpty);
  aPrior.Enabled := not blnStopScroll and (dsZb <> nil) and not(dsZb.Bof) and not (dsZb.IsEmpty);
  aNext.Enabled := not blnStopScroll and (dsZb <> nil) and not(dsZb.Eof) and not (dsZb.IsEmpty);
  aLast.Enabled := not blnStopScroll and (dsZb <> nil) and not(dsZb.Eof) and not (dsZb.IsEmpty);
end;

//SetCanSave
procedure TfrmComDj.SetCanSave(Can:Boolean);
begin
  CanSave1 := Can;
  aSave.Enabled := Can;
  aCancel.Enabled := aSave.Enabled;
  aPreview.Enabled := not(Can) and not (dsZb.IsEmpty) ;
  aPrint.Enabled := aPreview.Enabled;
end;

//LoadPrintForm
procedure TfrmComDj.LoadPrintForm;
begin
  //ComPrint
  if frmSetPrint = nil then
    frmSetPrint := TfrmSetPrint.Create(application);
  with frmSetPrint do
  begin
    AForm := TfrmComDj(self);
    AGrid := DBGrid1;
    ADataSet := TClientDataSet(DBGrid1.DataSource.DataSet);
    blnPreview := self.blnPreview;
    ShowModal;
    self.ReportName := ReportName;
    Free;
  end;
  frmSetPrint := nil;
end;

//TotalField
procedure TfrmComDj.TotalField(Kind:char; Field:TField);
begin
//
end;

//sMxDataChange
procedure TfrmComDj.sMxDataChange(Sender: TObject; Field: TField);
begin
  if CanDataChange and ( Field <> nil ) then
    if TDataSource(Sender).State In [dsEdit, dsInsert] then
      TotalField('E', Field);
end;

//MxBeforeInsert
procedure TfrmComDj.MxBeforeInsert(DataSet: TDataSet);
begin
  CanDataChange := false;
end;

//MxOnNewRecord
procedure TfrmComDj.MxOnNewRecord(DataSet: TDataSet);
var
  i : integer;
  intDef: integer;
  strS: TStringList;
begin
  DBGrid1.SelectedIndex := 0;
  for i := 0 to dsMx.FieldCount - 1 do
    if (dsMx.Fields[i] is TNumericField) then
      dsMx.Fields[i].Value := 0;
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    if pblnLoadAppSelect then
      if DBGrid1.Columns[i].Field.DataType in [ftString,ftWideString] then
      begin
        Data.AppSelect.Close;
        Data.AppSelect.CommandText := 'select * from AppSelect where DataSet = ''' +
          DataSet.Name + ''' and FieldName = ''' +
          DBGrid1.Columns[i].FieldName + '''';
        Data.AppSelect.Open;
        intdef := Data.AppSelect.FieldByName('DefaultRow').AsInteger;
        if intDef > 0 then
        begin
          strS := TStringList.Create;
          strS.Text := Data.AppSelect.FieldByName('DataSelect').Value;
          if intDef <= strS.Count then
            DBGrid1.Columns[i].Field.AsString := strS[intDef-1];
        end;
        Data.AppSelect.CLose;
      end;
    if DBGrid1.Columns[i].Field.DataType in [ftDate, ftDateTime] then
      with CurDs do
      begin
        CommandText := 'select * from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
          'DATASET = ''' + DataSet.Name + ''' and ' +
          'FIELDNAME = ''' + DBGrid1.Columns[i].FieldName + '''';
        Open;
        if not IsEmpty then
          if FieldByName('DEFAULDATE').AsInteger = 1 then
            DBGrid1.Columns[i].Field.AsDateTime := Date
          else
            DBGrid1.Columns[i].Field.AsDateTime := FieldByName('SETDATE').AsDateTime;
        Close;
      end;
  end;
end;

//MxAfterInsert
procedure TfrmComDj.MxAfterInsert(DataSet: TDataSet);
var
  i : integer;
begin
  for i := 0 to dsMx.FieldCount - 1 do
  begin
    arrMx[i] := dsMx.Fields[i].Value;
    if (arrMx[i] = null) and (dsMx.Fields[i] is TNumericField) then
      arrMx[i] := 0;
  end;
  CanDataChange := true;
end;

//MxBeforeEdit
procedure TfrmComDj.MxBeforeEdit(DataSet: TDataSet);
var
  i : integer;
begin
  for i := 0 to dsMx.FieldCount - 1 do
  begin
    arrMx[i] := dsMx.Fields[i].Value;
    if (arrMx[i] = null) and (dsMx.Fields[i] is TNumericField) then
      arrMx[i] := 0;
  end;
  CanDataChange := true;
end;

//MxBeforePost
procedure TfrmComDj.MxBeforePost(DataSet: TDataSet);
var
  i, j : integer;
begin
  for i := 0 to dsMx.FieldCount - 1 do
  begin
//处理数值字段
    if (dsMx.Fields[i] is TNumericField) and not (dsMx.Fields[i] is TAutoIncField) then
      if dsMx.Fields[i].Value = null then
        dsMx.Fields[i].Value := 0
      else if TNumericField(dsMx.Fields[i]).DisplayFormat <> '' then
        dsMx.Fields[i].AsString := FormatFloat(StringReplace(TNumericField(dsMx.Fields[i]).DisplayFormat, ',', '', [rfReplaceAll]), dsMx.Fields[i].Value);
//处理必填字段
    if (strMxKeyFields <> '') and (Pos(UpperCase(dsMx.Fields[i].FieldName) + ';', strMxKeyFields) <> 0) then
      if (dsMx.Fields[i] is TStringField) and (dsMx.Fields[i].AsString = '')
        or (dsMx.Fields[i] is TNumericField) and (dsMx.Fields[i].AsFloat = 0)
        or (dsMx.Fields[i] is TDateTimeField) and (dsMx.Fields[i].value = null) then
      begin
        Application.MessageBox(Pchar('''' + dsMx.Fields[i].DisplayLabel + '''未录入, 请继续录入!'), '录入错误', MB_OK + MB_ICONWARNING);
        for j := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[j].Field = dsMx.Fields[i] then
          begin
            DBGrid1.SelectedIndex := j;
            break;
          end;
        abort;
      end;
  end;
end;

//MxAfterPost
procedure TfrmComDj.MxAfterPost(DataSet: TDataSet);
var
  i, intIndex: integer;
  strS: TStringList;
begin
  CanSave := true;
  SetButton;
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    if pblnSaveAppSelect then
      if (DBGrid1.Columns[i].Field.DataType in [ftString,ftWideString]) and
         (DBGrid1.Columns[i].Field.AsString <> '') then
      begin
        Data.AppSelect.Close;
        Data.AppSelect.CommandText := 'select * from AppSelect where DataSet = ''' +
          DataSet.Name + ''' and FieldName = ''' +
          DBGrid1.Columns[i].FieldName + '''';
        Data.AppSelect.Open;
        if Data.AppSelect.FieldByName('DataSet').AsString <> '' then
        begin
          if Data.AppSelect.FieldByName('AutoUpdate').AsBoolean then
          begin
            strS := TStringList.Create;
            strS.Text := Data.AppSelect.FieldByName('DataSelect').Value;
            intIndex := strS.IndexOf(DBGrid1.Columns[i].Field.AsString);
            if intIndex <> -1 then
              strS.Delete(intIndex);
            for intIndex := 19 to strS.Count - 1 do
              strS.Delete(intIndex);
            strS.Insert(0, DBGrid1.Columns[i].Field.AsString);
            SqlExec('update AppSelect set DataSelect = ''' + strS.Text +
              ''' where DataSet = ''' +
              DataSet.Name + ''' and FieldName = ''' +
              DBGrid1.Columns[i].FieldName + '''');
          end;
        end else
          SqlExec('insert into AppSelect (DataSet,FieldName,DataSelect,AutoUpdate) values ' +
          '(''' + DataSet.Name + ''',''' +
            DBGrid1.Columns[i].FieldName + ''',''' + DBGrid1.Columns[i].Field.AsString + ''',1)' );
        Data.AppSelect.CLose;
      end;
    if (DBGrid1.Columns[i].Field.DataType in [ftDate, ftDateTime]) and
       (DBGrid1.Columns[i].Field.AsString <> '') then
      if pDataBaseType = 'SERVER' then
        SqlExec('update AppDate set SETDATE = ''' + DBGrid1.Columns[i].Field.AsString + ''' ' +
          'where uId = ' + IntToStr(pintUserId) + ' and ' +
          'DATASET = ''' + DataSet.Name + ''' and ' +
          'FIELDNAME = ''' + DBGrid1.Columns[i].FieldName + ''' and ' +
          'DEFAULDATE = 2')
      else
        SqlExec('update AppDate set SETDATE = #' + DBGrid1.Columns[i].Field.AsString + '# ' +
          'where uId = ' + IntToStr(pintUserId) + ' and ' +
          'DATASET = ''' + DataSet.Name + ''' and ' +
          'FIELDNAME = ''' + DBGrid1.Columns[i].FieldName + ''' and ' +
          'DEFAULDATE = 2');
  end;
end;

//MxBeforeDelete
procedure TfrmComDj.MxBeforeDelete(DataSet: TDataSet);
var
  i : integer;
begin
  for i := 0 to dsMx.FieldCount - 1 do
  begin
    arrMx[i] := dsMx.Fields[i].Value;
    if (arrMx[i] = null) and (dsMx.Fields[i] is TNumericField) then
      arrMx[i] := 0;
  end;
end;

//MxAfterDelete
procedure TfrmComDj.MxAfterDelete(DataSet: TDataSet);
begin
  CanSave := true;
  SetButton;
  TotalField('D',nil);
end;

//MxBeforeCancel
procedure TfrmComDj.MxBeforeCancel(DataSet: TDataSet);
begin
  if DBGrid1.DataSource.State = Dsinsert then
  begin
    CancelEdit := False;
    TotalField('D',nil);
  end  else
    CancelEdit := true;
end;

//MxAfterCancel
procedure TfrmComDj.MxAfterCancel(DataSet: TDataSet);
begin
  if CancelEdit then
    TotalField('C',nil);
  CanSave := true;
  SetButton;
end;

//MxBeforeApplyUpdates
procedure TfrmComDj.MxBeforeApplyUpdates;
var
  bmMx: TBookMark;
  i, intHh: integer;
  strFields, strField: String;
  slZb, slMx: TStringList;
begin
	if (strZbMxKey = null) or (strZbMxKey = '') then
		Exit;
  strFields := strZbMxKey;
  slZb := TStringList.Create;
  slMx := TStringList.Create;
	while strFields <> '' do
  begin
		if Pos(';', strFields) <> 0 then
    begin
      strField := Copy(strFields, 1, Pos(';', strFields) - 1);
      strFields := Copy(strFields, Pos(';', strFields) + 1, Length(strFields));
    end else
    begin
      strField := strFields;
			strFields := '';
		end;
    slZb.Add(Trim(Copy(strField, 1, Pos(',', strField) - 1)));
    slMx.Add(Trim(Copy(strField, Pos(',', strField) + 1, Length(strField))));
  end;
  with dsMx do
  begin
    DisableControls;
    bmMx := GetBookmark;
    try
      First;
      intHh := 1;
      while not Eof do
      begin
        for i := 0 to slZb.Count - 1 do
          if FieldByName(slMx[i]).Value <> dsZb.FieldByName(slZb[i]).Value then
          begin
            Edit;
            FieldByName(slMx[i]).Value := dsZb.FieldByName(slZb[i]).Value;
            Post;
          end;
        if (strMxHh <> null) and (strMxHh <> '') then
          if FieldByName(strMxHh).AsInteger <> intHh then
          begin
            Edit;
            FieldByName(strMxHh).AsInteger := intHh;
            Post;
          end;
        inc(intHh);
        Next;
      end;
      GotoBookmark(bmMx);
    finally
      EnableControls;
      FreeBookmark(bmMx);
    end;
  end;
end;

//sZbStateChange
procedure TfrmComDj.sZbStateChange(Sender: TObject);
begin
  if TDatasource(Sender).State in [dsEdit, dsInsert] then
    CanSave := true;
end;

//sZbDataChange
procedure TfrmComDj.sZbDataChange(Sender: TObject; Field: TField);
begin
//
end;

//ZbOnNewRecord
procedure TfrmComDj.ZbOnNewRecord(DataSet: TDataSet);
var
  i : integer;
  strS: TStringList;
  intdef: integer;
begin
  for i := 0 to dsZb.FieldCount - 1 do
  begin
    if dsZb.Fields[i] is TNumericField then
      dsZb.Fields[i].Value := 0;
    if pblnLoadAppSelect then
      if dsZb.Fields[i].DataType in [ftString,ftWideString] then
      begin
        Data.AppSelect.Close;
        Data.AppSelect.CommandText := 'select * from AppSelect where DataSet = ''' +
          DataSet.Name + ''' and FieldName = ''' +
          dsZb.Fields[i].FieldName + '''';
        Data.AppSelect.Open;
        intdef := Data.AppSelect.FieldByName('DefaultRow').AsInteger;
        if intDef > 0 then
        begin
          strS := TStringList.Create;
          strS.Text := Data.AppSelect.FieldByName('DataSelect').Value;
          if intDef <= strS.Count then
            dsZb.Fields[i].AsString := strS[intDef-1];
        end;
        Data.AppSelect.CLose;
      end;
    if dsZb.Fields[i].DataType in [ftDate, ftDateTime] then
      with CurDs do
      begin
        CommandText := 'select * from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
          'DATASET = ''' + DataSet.Name + ''' and ' +
          'FIELDNAME = ''' + dsZb.Fields[i].FieldName + '''';
        Open;
        if not IsEmpty then
          if FieldByName('DEFAULDATE').AsInteger = 1 then
            dsZb.Fields[i].AsDateTime := Date
          else
            dsZb.Fields[i].AsDateTime := FieldByName('SETDATE').AsDateTime;
        Close;
      end;
  end;
end;

//ZbBeforeEdit
procedure TfrmComDj.ZbBeforeEdit(DataSet: TDataSet);
begin
//
end;

//ZbBeforePost
procedure TfrmComDj.ZbBeforePost(DataSet: TDataSet);
var
  i : integer;
  dsField: TField;
begin
  for i := 0 to dsZb.FieldCount - 1 do
  begin
    if (dsZb.Fields[i] is TNumericField) and not (dsZb.Fields[i] is TAutoIncField) then
      if dsZb.Fields[i].Value = null then
        dsZb.Fields[i].Value := 0
      else if TNumericField(dsZb.Fields[i]).DisplayFormat <> '' then
        dsZb.Fields[i].AsString := FormatFloat(StringReplace(TNumericField(dsZb.Fields[i]).DisplayFormat, ',', '', [rfReplaceAll]), dsZb.Fields[i].Value)
  end;
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
    if (dsField <> nil) and (dsField.DataSet = dsZb) then
    begin
      if (Pos(UpperCase(dsField.FieldName) + ';', strZbKeyFields) <> 0) then
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
  if blnSetZbID then
    if DataSet.State in [dsInsert] then
      SetFieldValue('select iif(isnull(max(ID)), 1, max(ID)+1) from ' +
        Copy(TClientDataSet(DataSet).ProviderName, 2, Length(TClientDataSet(DataSet).ProviderName) - 1) + ' where ID > 0', DataSet, 'ID');
end;

//ZbAfterPost
procedure TfrmComDj.ZbAfterPost(DataSet: TDataSet);
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
          SqlExec('update AppDate set SETDATE = #' + DBEditTmp.Text + '# ' +
            'where uId = ' + IntToStr(pintUserId) + ' and ' +
            'DATASET = ''' + DBEditTmp.DataSource.DataSet.Name + ''' and ' +
            'FIELDNAME = ''' + DBEditTmp.DataField + ''' and ' +
            'DEFAULDATE = 2');
    end;
  end;
end;

//ZbBeforeScroll
procedure TfrmComDj.ZbBeforeScroll(DataSet: TDataSet);
begin
  if CanSave then
    SaveQuery;
end;

//ZbAfterScroll
procedure TfrmComDj.ZbAfterScroll(DataSet: TDataSet);
begin
  IniRecord;
end;

//SaveColumnQuery
procedure TfrmComDj.SaveColumnQuery;
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
function TfrmComDj.GetColumnInfo(FileName: string): string;
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

function TfrmComDj.arMx(FileName: string): Variant;
begin
  Result := arrMx[ dsMx.FieldByName(FileName).Index ];
end;

//DBEdit.Exit
//ZB没有输入值时，自动弹出选择窗口
procedure TfrmComDj.DBEditExit(Sender: TObject);
begin
  if TDBEdit(Sender).Text = '' then
    TDBEdit(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
end;

//DBGrid1.ColExit
//MX没有输入值时，自动弹出选择窗口
procedure TfrmComDj.DBGrid1ColExit(Sender: TObject);
begin
  if strMxHelpFields <> '' then
    if (DBGrid1.Columns[DBGrid1.SelectedIndex].ButtonStyle = cbsEllipsis) and
      (Pos(UpperCase(DBGrid1.SelectedField.FieldName) + ';', strMxHelpFields) > 0) and
      (DBGrid1.SelectedField.Text = '') then
      DBGrid1EditButtonClick(nil);
end;

end.
