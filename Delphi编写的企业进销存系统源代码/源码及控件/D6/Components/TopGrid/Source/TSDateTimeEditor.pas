{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       TopGrid TtsDateTime component editor            }
{                                                       }
{       Copyright (c) 1999, Top Support                 }
{                                                       }
{*******************************************************}

unit TSDateTimeEditor;

{$INCLUDE TSCmpVer}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TSDateTimeDef, TSDateTime, StdCtrls, TsDesign, Grids_ts, TSGrid, TSCommon, ExtCtrls,
  {$IFDEF TSVER_V6} DesignIntf, DesignEditors, VCLEditors, {$ELSE} DsgnIntf, {$ENDIF}
  TypInfo, ComCtrls {$IFDEF TSVER_V3}, Toolwin {$ELSE}, TSD3EditorControls {$ENDIF};

const
    MaxDisplayModeIndex = 1;

type
    TtsDateTimeEditor = class(TComponentEditor)
    public
        procedure Edit; override;
        function GetVerbCount: Integer; override;
        function GetVerb(Index: integer): string; override;
        procedure ExecuteVerb(Index: integer); override;
    end;

    {$IFDEF TSVER_V3}
    TtsDateTimeDateProperty = class(TDateProperty)
    {$ELSE}
    TtsDateTimeDateProperty = class(TPropertyEditor)
    {$ENDIF}
        function  GetValue: string; override;
        procedure SetValue(const Value: string); override;
    end;

  TfrmCalEditor = class(TForm)
    pnlInspectorGrid: TPanel;
    Panel10: TPanel;
    grdHeading: TtsGrid;
    grdInspector: TtsGridInspector;
    tsComponentEditor: TtsComponentEditor;
    Splitter1: TSplitter;
    pnlDateTime: TPanel;
    scrDateTime: TScrollBox;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sepSizer: TToolButton;
    butOK: TButton;
    ToolButton3: TToolButton;
    butCancel: TButton;
    datExample: TtsDateTimeDef;
    procedure Button1Click(Sender: TObject);
    procedure tsComponentEditorGetComponentId(Sender: TObject;
      Component: TPersistent; var ComponentId: String);
    procedure tsComponentEditorGetComponentSelection(Sender: TObject;
      var ComponentSelection: Pointer; var ComponentCount: Integer);
    procedure tsComponentEditorGetComponentSelectionChanged(
      Sender: TObject; CurSelection: Pointer; var Changed: Boolean);
    procedure tsComponentEditorGetComponentWithId(Sender: TObject;
      ComponentId: String; var Component: TPersistent);
    procedure tsComponentEditorGetFirstSelectedComponent(Sender: TObject;
      var Component: TPersistent);
    procedure RegisterPropEditors;

    procedure InitgrdHeading;
    procedure grdHeadingComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdHeadingComboCellLoaded(Sender: TObject;
      Combo: TtsComboGrid; DataCol, DataRow: Longint; var Value: Variant);
    procedure grdHeadingComboRollUp(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure grdHeadingCellLoaded(Sender: TObject; DataCol,
      DataRow: Longint; var Value: Variant);
    procedure grdHeadingColResized(Sender: TObject; RowColnr: Longint);
    procedure FormActivate(Sender: TObject);
    procedure grdInspectorColResized(Sender: TObject; RowColnr: Longint);

    procedure SetDisplayModes;
    procedure FormResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure grdInspectorResize(Sender: TObject);
    procedure tsComponentEditorGetComponentInfo(Sender: TObject;
      DisplayMode: TtsGroupElement);
    procedure tsComponentEditorSetValues(Sender: TObject;
      State: tsScanObjectsState; Component: TPersistent;
      PropertyElement: TtsPropertyElement; strValue: String;
      Value: Variant; ValueSource: tsValueSource; ValueSet: Boolean;
      var Cancel: Boolean);
    procedure grdInspectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function GetHelpKey: string;
    procedure butOKClick(Sender: TObject);
    procedure butCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  protected
    FComponentName: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    frmCalEditor: TfrmCalEditor;
    DateTimeDefExample: TtsDateTimeDef;
    CurDateTimeDef: TtsDateTimeDef = nil;
    CurDateTimeDefName: string;

implementation

{$R *.DFM}

var
    grdInspectorFirstColShare: Single = -1;
    pnlInspectorGridAutoWidthMax: integer = -1;
    FirstActivate: Boolean = True;

    DisplayModeNames: array[0..MaxDisplayModeIndex] of string;
    CurDisplayModeIndex: integer = 1;
    PrevDisplayModeIndex: integer;
    sepSizerWidthDif: integer = -1;

    DesignActivatesFirstTime: Boolean = True;
    PrevLeft: Integer = 0;
    PrevTop: integer = 0;

    ButtonedExit: Boolean = False;
    SaveResult: Boolean = False;


{TtsDateTimeEditor}

procedure TtsDateTimeEditor.Edit;
begin
    FirstActivate := True;
    TsDesign.Designer := Designer;
    Screen.Cursor := crHourglass;
    try
        frmCalEditor := TfrmCalEditor.Create(Application);
    except
        Screen.Cursor := crDefault;
        frmCalEditor.Free;
        frmCalEditor := nil;
        raise;
    end;

    try
        frmCalEditor.FComponentName := Component.Name;
        {$IFDEF TSVER_V6}
          frmCalEditor.Caption := Designer.Root.Name + '.' + Component.Name + ' - TsDateTime Editor';
        {$ELSE}
          frmCalEditor.Caption := Designer.Form.Name + '.' + Component.Name + ' - TsDateTime Editor';
        {$ENDIF}
        if DesignActivatesFirstTime then
        begin
            frmCalEditor.Left := Trunc((Screen.Width - frmCalEditor.Width)/2);
            frmCalEditor.Top := Trunc((Screen.Height - frmCalEditor.Height)/2);
            CurDisplayModeIndex := 1;

            DesignActivatesFirstTime := False;
        end
        else
        begin
            frmCalEditor.Left := PrevLeft;
            frmCalEditor.Top := PrevTop;
            CurDisplayModeIndex := PrevDisplayModeIndex;
        end;

        CurDateTimeDef := TtsDateTimeDef(Component);
        CurDateTimeDefName := CurDateTimeDef.Name;

        ShowMessage('Open Date Editor');
        frmCalEditor.ShowModal;
        ShowMessage('Close Date Editor');

        PrevLeft := frmCalEditor.Left;
        PrevTop := frmCalEditor.Top;
        PrevDisplayModeIndex := CurDisplayModeIndex;

        if SaveResult then
        begin
            CurDateTimeDef.Assign(DateTimeDefExample);
            CurDateTimeDef.Name := CurDateTimeDefName;
            TsDesign.Designer.Modified;
        end;
    finally
        TsDesign.Designer := nil;

        FreeNil(TObject(frmCalEditor));
        Screen.Cursor := crDefault;
    end;
end;

function TtsDateTimeEditor.GetVerbCount: Integer;
begin
    result := 1;
end;

function TtsDateTimeEditor.GetVerb(Index: integer): string;
begin
    result := '&DateTime Editor'
end;

procedure TtsDateTimeEditor.ExecuteVerb(Index: integer);
begin
    Edit;
end;

{TtsDateTimeDateProperty}

function TtsDateTimeDateProperty.GetValue: string;
var
    Fmt: string;
    DateValue: TDateTime;
begin
    DateValue := GetFloatValue;
    Fmt := LongYearFormat(ShortDateFormat);
    DateTimeToString(Result, Fmt, DateValue);
end;

procedure TtsDateTimeDateProperty.SetValue(const Value: string);
var
    DateValue: TDateTime;
begin
    if Value = '' then
        DateValue := 0.0
    else
    begin
        DateValue := StringToDateTime(Value);
    end;
    SetFloatValue(DateValue);
end;

{TfrmCalEditor}

procedure TfrmCalEditor.Button1Click(Sender: TObject);
begin
    DateTimeDefExample.DateTimeProps.Font.Color := clRed;
end;

procedure TfrmCalEditor.tsComponentEditorGetComponentId(Sender: TObject;
  Component: TPersistent; var ComponentId: String);
begin
    if Component <> nil then
        ComponentId := DateTimeDefExample.Name
    else
        ComponentId := '';
end;

procedure TfrmCalEditor.tsComponentEditorGetComponentSelection(
  Sender: TObject; var ComponentSelection: Pointer;
  var ComponentCount: Integer);
begin
    ComponentCount := 1;
    ComponentSelection := nil;
end;

procedure TfrmCalEditor.tsComponentEditorGetComponentSelectionChanged(
  Sender: TObject; CurSelection: Pointer; var Changed: Boolean);
begin
    Changed := False;
end;

procedure TfrmCalEditor.tsComponentEditorGetComponentWithId(
  Sender: TObject; ComponentId: String; var Component: TPersistent);
begin
    Component := DateTimeDefExample.DateTimeProps;
end;

procedure TfrmCalEditor.tsComponentEditorGetFirstSelectedComponent(
  Sender: TObject; var Component: TPersistent);
begin
    Component := DateTimeDefExample.DateTimeProps;
end;

procedure TfrmCalEditor.RegisterPropEditors;
begin
    RegisterPropertyEditor(TypeInfo(TFont), nil, '', TFontProperty);
    RegisterPropertyEditor(TypeInfo(TFontName), nil, '', TFontNameProperty);
    RegisterPropertyEditor(TypeInfo(TColor), nil, '', TColorProperty);

    RegisterPropertyEditor(TypeInfo(TDate), TtsDateTimeDefProps, 'MinDate', TtsDateTimeDateProperty);
    RegisterPropertyEditor(TypeInfo(TDate), TtsDateTimeDefProps, 'MaxDate', TtsDateTimeDateProperty);
end;

procedure TfrmCalEditor.FormActivate(Sender: TObject);
var
    TextHeight: Integer;
begin
    if FirstActivate then
    begin
        ShowMessage('FirstActivate');
        if CurDateTimeDef = nil then
        begin
            ShowMessage('RegisterPropEditors');
            RegisterPropEditors;
            CurDateTimeDef := datExample;
            FComponentName := datExample.Name;
        end;
        ShowMessage('RegisterPropEditors DONE');
        DateTimeDefExample := TtsDateTimeDef.Create(Self);
        DateTimeDefExample.Assign(CurDateTimeDef);
        DateTimeDefExample.DateTimeControl.Parent := scrDateTime;
        DateTimeDefExample.DateTimeControl.Visible := True;
        ShowMessage('SetDisplayModes');
        SetDisplayModes;

        ShowMessage('initgrdHeading');
        initgrdHeading;
        TextHeight := grdHeading.CellTextHeight[1,1] + 1;
        grdHeading.DefaultRowHeight := CalcMax(grdHeading.DefaultRowHeight, TextHeight + 1);
        grdHeading.ClientHeight := grdHeading.DefaultRowHeight;
        grdHeading.HeadingHeight := CalcMax(grdHeading.HeadingHeight, grdHeading.DefaultRowHeight);
        grdInspector.DefaultRowHeight := CalcMax(grdInspector.DefaultRowHeight, TextHeight);
        grdInspector.HeadingHeight := CalcMax(grdInspector.HeadingHeight, grdInspector.DefaultRowHeight);

        pnlInspectorGridAutoWidthMax := pnlInspectorGrid.Width;
        grdInspectorFirstColShare := grdInspector.Col[1].Width / grdInspector.Width;
        sepSizerWidthDif := ClientWidth - sepSizer.Width;

        ShowMessage('DateTimeDefExample.DateTimeProps');
        tsComponentEditor.Component := DateTimeDefExample.DateTimeProps;
        grdInspector.ComponentEditor := tsComponentEditor;
        grdInspector.DisplayModeName := DisplayModeNames[CurDisplayModeIndex];
        grdHeading.Refresh;

        ShowMessage('ButtonedExit');
        ButtonedExit := False;
        SaveResult := False;
        TsDesign.ChangesMade := False;

        FirstActivate := False;

        grdInspector.Col[2].Width := grdInspector.ClientWidth - grdInspector.Col[1].Width - grdInspector.RowBarWidth + 1;
    end;
end;

procedure TfrmCalEditor.InitgrdHeading;
begin
    grdHeading.Col[2].Width := Screen.Width;
    grdHeading.Col[2].ReadOnly := true;

    grdHeading.ButtonEdgeWidth := 3;
    grdHeading.InactiveButtonState := ibsBackGround;
    grdHeading.FlatButtons := false;

    grdHeading.Col[1].Align:= true;
    grdHeading.Col[1].Alignment := taCenter;
    grdHeading.Col[1].ButtonType := btCombo;
    grdHeading.Col[1].DropDownStyle := ddDropDownList;

    grdHeading.CurrentCell.MoveTo(3, 1);
end;

procedure TfrmCalEditor.grdHeadingComboInit(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    Combo.DropDownRows := 5;
    Combo.ValueCol := 1;

    Combo.AutoSearch := asTop;

    Combo.Grid.HeadingOn := False;
    Combo.Grid.RowBarOn := False;
    Combo.DropDownCols := 1;
    Combo.Grid.Cols := 1;
    Combo.Grid.Rows := 2;
end;

procedure TfrmCalEditor.grdHeadingComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint; var Value: Variant);
begin
    if DataRow = 1 then
        Value := 'Alphabetical'
    else
        Value := 'Structured';
end;

procedure TfrmCalEditor.grdHeadingComboRollUp(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint);
begin
    Screen.Cursor := crHourGlass;
    try
        grdInspector.DisplayModeName := grdHeading.CurrentCell.Value;
        grdHeading.CurrentCell.MoveTo(3, 1);
        grdInspector.SetFocus;
    finally
        Screen.Cursor := crDefault;
    end;
end;

procedure TfrmCalEditor.grdHeadingCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    if DataCol = 1 then
        Value := grdInspector.DisplayModeName;
end;


procedure TfrmCalEditor.grdInspectorColResized(Sender: TObject;
  RowColnr: Longint);
begin
    if RowColnr = 1 then
        grdInspectorFirstColShare := grdInspector.Col[1].Width / grdInspector.Width;

    if RowColnr >= 0 then
    begin
        grdHeading.RowBarWidth := grdInspector.RowBarWidth;
        grdHeading.Col[1].Width := grdInspector.Col[1].Width;
    end;
end;

procedure TfrmCalEditor.grdHeadingColResized(Sender: TObject;
  RowColnr: Longint);
begin
    if not Assigned(grdInspector) then
        Exit;

    if RowColnr >= 0 then
    begin
        grdHeading.EnablePaint := False;
        try
            grdInspector.RowBarWidth := grdHeading.RowBarWidth;
            grdInspector.Col[1].Width := grdHeading.Col[1].Width;
            grdInspector.Update;
        finally
            grdHeading.EnablePaint := True;
        end;
    end;
end;

procedure TfrmCalEditor.SetDisplayModes;
begin
    DisplayModeNames[0] := 'Alphabetical';
    DisplayModeNames[1] := 'Structured';
end;

procedure TfrmCalEditor.FormResize(Sender: TObject);
begin
    if sepSizerWidthDif <> -1 then
    begin
        sepSizer.Width := CalcMax(1, ClientWidth - sepSizerWidthDif);
        pnlInspectorGrid.Width := CalcMin(ClientWidth, pnlInspectorGridAutoWidthMax);
        grdInspector.Col[1].Width := Round(grdInspectorFirstColShare * grdInspector.Width);
    end;
end;

procedure TfrmCalEditor.Splitter1Moved(Sender: TObject);
begin
    pnlInspectorGridAutoWidthMax := pnlInspectorGrid.Width;
    FormResize(Sender);
end;

procedure TfrmCalEditor.grdInspectorResize(Sender: TObject);
begin
    grdInspector.Col[2].Width := grdInspector.ClientWidth - grdInspector.Col[1].Width - grdInspector.RowBarWidth + 1;
    grdInspector.Refresh;
end;

procedure TfrmCalEditor.tsComponentEditorGetComponentInfo(Sender: TObject;
  DisplayMode: TtsGroupElement);
begin
    if not tsComponentEditor.DesignValuePropertiesInitialized then
        tsComponentEditor.DesignValuePropertiesInitialized := True;

    if DisplayMode.Name = 'Structured' then
    begin
        tsComponentEditor.AddProperty(DisplayMode, '', 'ShowSingleMonth');
        tsComponentEditor.AddProperty(DisplayMode, '', 'CalendarRows');
        tsComponentEditor.AddProperty(DisplayMode, '', 'MaxDate');
        tsComponentEditor.AddProperty(DisplayMode, '', 'MinDate');

        DisplayMode.AddGroup('', 'Options', True);
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'DateTimeDisplay');
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'SelectSaturday');
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'SelectSunday');
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'ShowSeconds');
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'ShowToday');
        tsComponentEditor.AddProperty(DisplayMode, 'Options', 'FirstDayOfWeek');

        DisplayMode.AddGroup('', 'Appearance', False);
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance', 'ShowDayNames');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance', 'ShowWeeknumbers');

        DisplayMode.AddGroup('', 'Captions', False);
        tsComponentEditor.AddProperty(DisplayMode, 'Captions', 'Caption');
        tsComponentEditor.AddProperty(DisplayMode, 'Captions', 'OkCaption');
        tsComponentEditor.AddProperty(DisplayMode, 'Captions', 'CancelCaption');

        DisplayMode.AddGroup('Appearance', 'Font', False);
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance', 'Font');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance', 'ParentFont');

        DisplayMode.AddGroup('Appearance', 'Color', False);
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'Color');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'LineColor');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'MonthColor');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'MonthFontColor');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'WeekFontColor');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'DayNameFontColor');
        tsComponentEditor.AddProperty(DisplayMode, 'Appearance.Color', 'DisabledFontColor');

    end;
end;

procedure TfrmCalEditor.tsComponentEditorSetValues(Sender: TObject;
  State: tsScanObjectsState; Component: TPersistent;
  PropertyElement: TtsPropertyElement; strValue: String; Value: Variant;
  ValueSource: tsValueSource; ValueSet: Boolean; var Cancel: Boolean);
var
    ComponentId: string;
    OldName: string;
    Success: Boolean;
begin
    if State = soStart then
    begin
        if (PropertyElement.Parent = nil) and (PropertyElement.Name = 'Name')then
        begin
            OldName := DateTimeDefExample.Name;
            Success := True;
            try
                if (ValueSource = vsValue) then
                    strValue := Value;
                DateTimeDefExample.Name := strValue
            except
                raise;
                Success := False;
            end;
            DateTimeDefExample.Name := OldName;
            if Success then
            begin
                CurDateTimeDefName := strValue;

                tsComponentEditor.DoGetComponentId(DateTimeDefExample, ComponentId);
                PropertyElement := tsComponentEditor.PropertySet.GetItem(['Name']);
                if PropertyElement <> nil then
                    tsComponentEditor.SetActualValue(ComponentId, PropertyElement, CurDateTimeDefName);
            end;

            Cancel := true;
        end
    end
    else if (State = soEnd) and (PropertyElement.Name = 'CalendarRows') then
    begin
        if DateTimeDefExample.DateTimeProps.ShowSingleMonth then
            ShowMessage('The property CalandarRows only applies when ''ShowSingleMonth = False''');
    end;
end;

procedure TfrmCalEditor.grdInspectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    HelpKey: string;
begin
    if Key = VK_F1 then
    begin
        HelpKey := GetHelpKey;
        if HelpKey <> '' then
            ShowHelpTopic(Handle, HelpKey)
    end;
end;

function TfrmCalEditor.GetHelpKey: string;
begin
    result := '';
    if grdInspector.CurrentDataRow <= 0 then exit;

    with grdInspector.InspectorRows[grdInspector.CurrentDataRow] do
    begin
        if InspectorElementType = iePropertyElement then
            result := PropertyElement.Name;
    end;
end;

procedure TfrmCalEditor.butOKClick(Sender: TObject);
begin
    ButtonedExit := True;
    SaveResult := True;
end;

procedure TfrmCalEditor.butCancelClick(Sender: TObject);
begin
    ButtonedExit := True;
end;

procedure TfrmCalEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
    Answer: word;
begin
    if TsDesign.ChangesMade and not ButtonedExit then
    begin
        Answer := MessageDlg('Do you want to save the changes made to ' + FComponentName + '?', mtWarning, [mbYes, mbNo, mbCancel], 0);
        case Answer of
            mrYes    : SaveResult := True;
            mrCancel : CanClose := False;
        end;
    end;
end;


end.
