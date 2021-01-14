unit FeaturesMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, StdCtrls, Buttons, Menus, ExtCtrls, ToolWin, ComCtrls,
  ImgList, cxSSheet, cxSSTypes, cxSSUtils, cxSSRes, cxGraphics,
  cxExcelAccess, StdActns, ActnList,Registry,shellapi;

type
  TStyleValue = (svAlign, svFontName, svSize, svBold, svItalic, svUnderline, svStrikeOut);
  TStyleValueSet = set of TStyleValue;

  TFeaturesMainForm = class(TForm)
    alMain: TActionList;
    actNew: TAction;
    actDeleteCells: TAction;
    actOpenSpreadSheet: TAction;
    actSaveSpeadSheet: TAction;
    actInsertCells: TAction;
    actExit: TAction;
    actAutomaticCalc: TAction;
    actRecalcFormulas: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actBeveledLookandFeel: TAction;
    actBufferedpaint: TAction;
    actShowcaptions: TAction;
    actShowgrid: TAction;
    actShowheaders: TAction;
    actShowformulas: TAction;
    actR1C1Referencestyle: TAction;
    actCells: TAction;
    actRow: TAction;
    actColumn: TAction;
    actSheet: TAction;
    actWindowClose: TWindowClose;
    actWindowCascade: TWindowCascade;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowArrange: TWindowArrange;
    actCellLeftAlign: TAction;
    actCellRightAlign: TAction;
    actCellCenterAlign: TAction;
    actBold: TAction;
    actItalic: TAction;
    actUnderline: TAction;
    actStrikeOut: TAction;
    actMergeCells: TAction;
    actSplitCells: TAction;
    actSortAscending: TAction;
    actSortDescending: TAction;
    actSum: TAction;
    actFont: TAction;
    actFontSize: TAction;
    actAverage: TAction;
    actCount: TAction;
    actMax: TAction;
    actMin: TAction;
    actFormatCells: TAction;
    actHideCells: TAction;
    actShowCells: TAction;
    actHideCol: TAction;
    actShowCol: TAction;
    actHideRow: TAction;
    actShowRow: TAction;
    mnuMain: TMainMenu;
    mnuFile: TMenuItem;
    miNew: TMenuItem;
    N2: TMenuItem;
    miOpenSpreadSheet: TMenuItem;
    miSaveSpreadSheet: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    mnuEdit: TMenuItem;
    miAutomaticcalculation: TMenuItem;
    miRecalcformulas: TMenuItem;
    N3: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    N7: TMenuItem;
    miCells: TMenuItem;
    miFormat: TMenuItem;
    miHide: TMenuItem;
    miShow: TMenuItem;
    miDeletecells: TMenuItem;
    Insertcells1: TMenuItem;
    miColumns: TMenuItem;
    Hide2: TMenuItem;
    Show2: TMenuItem;
    miRows: TMenuItem;
    Hide3: TMenuItem;
    Show3: TMenuItem;
    mnuInsert: TMenuItem;
    miCells1: TMenuItem;
    miRow: TMenuItem;
    miColumn: TMenuItem;
    N12: TMenuItem;
    miSheet: TMenuItem;
    mnuConfig: TMenuItem;
    miBeveledLookandFeel: TMenuItem;
    miBufferedpaint: TMenuItem;
    N4: TMenuItem;
    miShowcaptions: TMenuItem;
    miShowgrid: TMenuItem;
    miShowheaders: TMenuItem;
    miShowformulas: TMenuItem;
    N5: TMenuItem;
    miR1C1Referencestyle: TMenuItem;
    mnuWindow: TMenuItem;
    Arrange1: TMenuItem;
    Cascade1: TMenuItem;
    Close1: TMenuItem;
    MinimizeAll1: TMenuItem;
    TileHorizontally1: TMenuItem;
    TileVertically1: TMenuItem;
    pmSheetPopup: TPopupMenu;
    pmiCut: TMenuItem;
    pmiCopy: TMenuItem;
    pmiPaste: TMenuItem;
    N6: TMenuItem;
    pmiDelete: TMenuItem;
    pmiInsert: TMenuItem;
    N10: TMenuItem;
    pmiCols: TMenuItem;
    pmiColsHide: TMenuItem;
    pmiColsShow: TMenuItem;
    pmiRows: TMenuItem;
    pmiRowsHide: TMenuItem;
    pmiRowsShow: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    pmiFormatCells: TMenuItem;
    pmSummary: TPopupMenu;
    Sum: TMenuItem;
    Average1: TMenuItem;
    Count1: TMenuItem;
    Max1: TMenuItem;
    Min1: TMenuItem;
    pmBorders: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    imgFormatting: TImageList;
    imgBordersImages: TImageList;
    imgStandart: TImageList;
    cbMain: TControlBar;
    tbsFormatting: TToolBar;
    tbLeftAlign: TToolButton;
    tbCenterAlign: TToolButton;
    tbRightAlign: TToolButton;
    ToolButton10: TToolButton;
    tbBold: TToolButton;
    tbItalic: TToolButton;
    tbUnderline: TToolButton;
    tbStrikeOut: TToolButton;
    ToolButton11: TToolButton;
    tbMerge: TToolButton;
    tgSplit: TToolButton;
    ToolButton16: TToolButton;
    tbSummary: TToolButton;
    tbSortAscending: TToolButton;
    tbSortDescending: TToolButton;
    ToolButton18: TToolButton;
    tbBorderStyle: TToolButton;
    tbsStandart: TToolBar;
    tbsNew: TToolButton;
    tbsOpen: TToolButton;
    tbsSave: TToolButton;
    ToolButton7: TToolButton;
    tbsCut: TToolButton;
    tbsCopy: TToolButton;
    tbsPaste: TToolButton;
    pnCell: TPanel;
    edtCellEdit: TEdit;
    pnCellText: TPanel;
    pnCellRect: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    actUndo: TAction;
    actRedo: TAction;
    tlbHistory: TToolBar;
    tbUndo: TToolButton;
    pmRedo: TPopupMenu;
    pmUndo: TPopupMenu;
    ToolButton1: TToolButton;
    imgHistory: TImageList;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    cbxFont: TComboBox;
    cbxSize: TComboBox;
    N8: TMenuItem;
    N9: TMenuItem;
    N13: TMenuItem;
    procedure cxSpreadBookSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure edtCellEditChange(Sender: TObject);
    procedure edtCellEditExit(Sender: TObject);
    procedure edtCellEditKeyPress(Sender: TObject; var Key: Char);
    procedure tbsSummaryClick(Sender: TObject);
    procedure mnuBordersDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure mnuBordersMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure mnuBordersClick(Sender: TObject);
    procedure cbxSizeKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSizeChange(Sender: TObject);
    procedure tbCenterAlignClick(Sender: TObject);
    procedure tbRightAlignClick(Sender: TObject);
    procedure actBoldClick(Sender: TObject);
    procedure actItalicClick(Sender: TObject);
    procedure actUnderlineClick(Sender: TObject);
    procedure actStrikeOutClick(Sender: TObject);
    procedure tbMergeSplitClick(Sender: TObject);
    procedure tbBorderStyleClick(Sender: TObject);
    procedure SummaryItemClick(Sender: TObject);
    procedure cbxFontKeyPress(Sender: TObject; var Key: Char);
    procedure actSheetExecute(Sender: TObject);
    procedure actColumnExecute(Sender: TObject);
    procedure actRowExecute(Sender: TObject);
    procedure actCellsExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actOpenSpreadSheetExecute(Sender: TObject);
    procedure actSaveSpeadSheetExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure AlwaysEnabled(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actAutomaticCalcExecute(Sender: TObject);
    procedure actRecalcFormulasExecute(Sender: TObject);
    procedure actBeveledLookandFeelExecute(Sender: TObject);
    procedure actCellLeftAlignExecute(Sender: TObject);
    procedure actCellRightAlignExecute(Sender: TObject);
    procedure actCellCenterAlignExecute(Sender: TObject);
    procedure actFormatCellsExecute(Sender: TObject);
    procedure actHideCellsExecute(Sender: TObject);
    procedure actShowCellsExecute(Sender: TObject);
    procedure actHideColExecute(Sender: TObject);
    procedure actShowColExecute(Sender: TObject);
    procedure actBufferedpaintExecute(Sender: TObject);
    procedure actShowcaptionsExecute(Sender: TObject);
    procedure actShowgridExecute(Sender: TObject);
    procedure actShowheadersExecute(Sender: TObject);
    procedure actShowformulasExecute(Sender: TObject);
    procedure actR1C1ReferencestyleExecute(Sender: TObject);
    procedure actMergeCellsExecute(Sender: TObject);
    procedure actSplitCellsExecute(Sender: TObject);
    procedure actFontExecute(Sender: TObject);
    procedure actFontSizeExecute(Sender: TObject);
    procedure actSumExecute(Sender: TObject);
    procedure actSortExecute(Sender: TObject);
    procedure actHideRowExecute(Sender: TObject);
    procedure actShowRowExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure actRedoUpdate(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
    procedure pmUndoPopup(Sender: TObject);
    procedure pmRedoPopup(Sender: TObject);
    procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width,
      Height: Integer);
    procedure DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure IsEditorMode(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    FIsUpdate: Boolean;
    FSummaryItemHeight: Integer;
    Procedure LoadForm(Form:TForm); 
    Procedure SaveForm(Form:TForm);
    procedure SetTokenStyle(AToolButton: TToolButton; AStyleValue: TStyleValue; AFontStyle: TFontStyle);
    function GetCellText(SelectionRect: TRect; R1C1: Boolean): String;
    procedure RedoItemClick(Sender: TObject);
    procedure UndoItemClick(Sender: TObject);
    procedure DrawUndoRedoItem(PopupMenu: TPopupMenu; Sender: TMenuItem;
      ACanvas: TCanvas; ARect: TRect; Selected: Boolean; InfoStr: String);
  protected
    procedure CalculateSummary(AType: Byte);
    function GetSpreadBook: TcxSpreadSheetBook;
    procedure OpenSpreadSheet;
    procedure SaveSpreadSheet;
    procedure SetCellsStyle(AValuesSet: TStyleValueSet; AAlign: TcxHorzTextAlign;
      AFontSize: Integer; const AFontName: string; AStyles: TFontStyles);
    procedure SetStates;
    property IsUpdate: Boolean read FIsUpdate write FIsUpdate;
  public
    constructor Create(AOwner: TComponent); override;
    procedure NewSheet(const ASheetName: string = '');
    property cxSpreadBook: TcxSpreadSheetBook read GetSpreadBook;
  end;

var
  FeaturesMainForm: TFeaturesMainForm;

implementation

{$IFDEF VER140}{$DEFINE DELPHI6}{$ENDIF}
{$IFDEF VER150}{$DEFINE DELPHI6}{$DEFINE DELPHI7}{$ENDIF}

{$R *.dfm}

uses
  FeatureChild, FeatureModify, Flogo;

type
  TcxSSBookAccess = class(TcxCustomSpreadSheetBook);
  TcxSSBookSheetAccess = class(TcxSSBookSheet);
  TcxSheetAccess = class(TcxSSBookSheet);

constructor TFeaturesMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  cbxFont.Items.Assign(Screen.Fonts);
  cbxFont.Text := '宋体';
  cbxSize.Text := '9';
  FSummaryItemHeight := 9;
  {$IFDEF DELPHI6}
  pmRedo.AutoHotkeys := maManual;
  pmUndo.AutoHotkeys := maManual;
  {$ENDIF}
end;

Procedure TFeaturesMainForm.LoadForm(Form:TForm);
Var 
  MyFormSettings:TRegistry; 
Begin 
  MyFormSettings:=TRegistry.Create; 
  Try
    MyFormSettings.OpenKey('\Software\'+ ExtractFileName(Application.Exename)+ '\WinPos', TRUE); 
    If MyFormSettings.ValueExists(Form.Name) Then 
    Begin 
      If (MyFormSettings.ReadInteger(Form.Name+'_ScrWidth')=Screen.Width) Or  (MyFormSettings.ReadInteger(Form.Name+'_ScrHeight')=Screen.Height) Then 
      Begin 
        Case MyFormSettings.ReadInteger(Form.Name+'_WindowState') Of 
          1:Form.WindowState:=wsNormal; 
          2:Form.WindowState:=wsMinimized; 
          3:Form.WindowState:=wsMaximized; 
        End; 
        if Form.WindowState<>wsMaximized then 
        begin 
          Form.Top:=MyFormSettings.ReadInteger(Form.Name+'_Top'); 
          Form.Left:=MyFormSettings.ReadInteger(Form.Name+'_Left'); 
          Form.Width:=MyFormSettings.ReadInteger(Form.Name+'_Width'); 
          Form.Height:=MyFormSettings.ReadInteger(Form.Name+'_Height') 
        end 
      End 
    End
  Finally 
    MyFormSettings.Free 
  End 
End; 

Procedure TFeaturesMainForm.SaveForm(Form:TForm);
Var 
  MyFormSettings:TRegistry; 
Begin 
  MyFormSettings:=TRegistry.Create; 
  Try 
    MyFormSettings.OpenKey( '\Software\'+ 
                       ExtractFileName(Application.Exename)+ 
                       '\WinPos', TRUE); 
    MyFormSettings.WriteInteger(Form.Name+'_ScrWidth',Screen.Width); 
    MyFormSettings.WriteInteger(Form.Name+'_ScrHeight',Screen.Height); 
    Case Form.WindowState Of 
      wsNormal:MyFormSettings.WriteInteger(Form.Name+'_WindowState',1); 
      wsMinimized:MyFormSettings.WriteInteger(Form.Name+'_WindowState',2); 
      wsMaximized:MyFormSettings.WriteInteger(Form.Name+'_WindowState',3) 
    End; 
    MyFormSettings.WriteInteger(Form.Name+'_Width',Form.Width); 
    MyFormSettings.WriteInteger(Form.Name+'_Height',Form.Height); 
    MyFormSettings.WriteInteger(Form.Name+'_Left',Form.Left); 
    MyFormSettings.WriteInteger(Form.Name+'_Top',Form.Top); 
    MyFormSettings.WriteBool(Form.Name,True) 
  Finally 
    MyFormSettings.Free 
  End 
End;

procedure TFeaturesMainForm.NewSheet(const ASheetName: string = '');
begin
  TFeatureChildForm.Create(Self);
  if ASheetName <> '' then
    ActiveMDIChild.Caption :=  ASheetName
  else
    ActiveMDIChild.Caption :=  '新文件 - ' + IntToStr(Self.MDIChildCount);
  with cxSpreadBook do
    OnSetSelection := cxSpreadBookSetSelection;
end;

procedure TFeaturesMainForm.CalculateSummary(AType: Byte);

  function SelRect(const ARect: TRect): string;
  begin
    Result := cxSpreadBook.CellsNameByRef(cxSpreadBook.ActivePage, ARect, False);
  end;
var
  S: string;
  ARect: TRect;
  ACell: TcxssCellObject;
const
  AFunc: array[0..4] of string = (sxlfSum, sxlfAverage, sxlfCount, sxlfMax, sxlfMin);
begin
  with cxSpreadBook do
  try
    ARect := SelectionRect;
    S := SelRect(ARect);
    ACell := ActiveSheet.GetCellObject(ARect.Right, ARect.Bottom + 1);
    try
      ACell.Text := '=' + AFunc[AType] + '(' + S + ')';
    finally
      ACell.Free;
    end;
  finally
    UpdateControl;
  end;
end;

function TFeaturesMainForm.GetSpreadBook: TcxSpreadSheetBook;
begin
  Result := (ActiveMDIChild as TFeatureChildForm).cxSpreadBook;
end;

procedure TFeaturesMainForm.OpenSpreadSheet;
begin
  if OpenDialog.Execute then
  begin
    NewSheet(OpenDialog.FileName);
    try
      try
        cxSpreadBook.LoadFromFile(OpenDialog.FileName);
        self.StatusBar1.Panels[1].Text:='打开文件：'+opendialog.FileName;
      except
        ActiveMDIChild.Close;
        raise ESpreadSheetError.CreateFmt('打开文件错误 %s',
          [OpenDialog.FileName])
      end;
    finally
      actShowGrid.Checked := cxSpreadBook.ShowGrid;
    end;
  end;
end;

procedure TFeaturesMainForm.SaveSpreadSheet;
var
  AFileName: string;
begin
  if SaveDialog.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog.FileName, '.xls');
    cxSpreadBook.SaveToFile(AFileName );
    ActiveMDIChild.Caption := AFileName;
  end;
end;

procedure TFeaturesMainForm.SetCellsStyle(AValuesSet: TStyleValueSet; AAlign: TcxHorzTextAlign;
  AFontSize: Integer; const AFontName: string; AStyles: TFontStyles);

  procedure SetValue(AFlag: TStyleValue; ANeedStyle: TFontStyle;
    var ASetStyles: TFontStyles);
  begin
    if AFlag in AValuesSet then
    begin
      if ANeedStyle in AStyles then
        Include(ASetStyles, ANeedStyle)
      else
        Exclude(ASetStyles, ANeedStyle);
    end;
  end;

var
  I, J: Integer;
  AStyle: TFontStyles;

begin
  with cxSpreadBook do
  try
    BeginUpdate;
    with ActiveSheet do
    begin
      for I := SelectionRect.Left to SelectionRect.Right do
        for J := SelectionRect.Top to SelectionRect.Bottom do
        with GetCellObject(I, J) do
        try
          with Style do
          begin
            AStyle := Font.Style;
            if svFontName in AValuesSet then
              Font.Name := AFontName;
            if svSize in AValuesSet then
              Font.Size := AFontSize;
            if svAlign in AValuesSet then
              HorzTextAlign := AAlign;
            SetValue(svBold, fsBold, AStyle);
            SetValue(svItalic, fsItalic, AStyle);
            SetValue(svUnderline, fsUnderline, AStyle);
            SetValue(svStrikeOut, fsStrikeOut, AStyle);
            Font.Style := AStyle;
          end;
        finally
          Free;
        end;
    end;
  finally
    EndUpdate;
    UpdateControl;
  end;
end;

procedure TFeaturesMainForm.SetStates;
var
  AStyle: TFontStyles;
begin
  with cxSpreadBook do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left,
      ActiveSheet.SelectionRect.Top) do
    try
      tbLeftAlign.Down := DisplayTextAlignment in [dtaLEFT, dtaFILL, dtaJUSTIFY];
      tbCenterAlign.Down := DisplayTextAlignment in [dtaCenter];
      tbRightAlign.Down := DisplayTextAlignment in [dtaRight];
      AStyle := Style.Font.Style;
      tbBold.Down := fsBold in AStyle;
      tbItalic.Down := fsItalic in AStyle;
      tbUnderline.Down := fsUnderline in AStyle;
      tbStrikeOut.Down := fsStrikeOut in AStyle;
      edtCellEdit.Text := Text;
      cbxFont.Text := Style.Font.Name;
      cbxSize.Text := IntToStr(Style.Font.Size);
    finally
      Free;
    end;
    actBeveledLookandFeel.Checked := PainterType = ptOfficeXPStyle;
    actBufferedpaint.Checked := BufferedPaint;
    actShowcaptions.Checked := ShowCaptionBar;
    actShowgrid.Checked := ShowGrid;
    actShowheaders.Checked := ShowHeaders;
    actShowformulas.Checked := ShowFormulas;
    actR1C1Referencestyle.Checked := R1C1ReferenceStyle;
    actAutomaticcalc.Checked := AutoRecalc;
  end;
end;

function TFeaturesMainForm.GetCellText(SelectionRect: TRect; R1C1: Boolean): String;
begin
  Result := cxSpreadBook.CellsNameByRef(cxSpreadBook.ActivePage, SelectionRect);
end;

procedure TFeaturesMainForm.cxSpreadBookSetSelection(Sender: TObject;
  ASheet: TcxSSBookSheet);
begin
  try
    FIsUpdate := True;
    SetStates;
    pnCellRect.Caption := GetCellText(ASheet.SelectionRect, cxSpreadBook.R1C1ReferenceStyle);
  finally
    FIsUpdate := False;
  end;
end;

procedure TFeaturesMainForm.edtCellEditChange(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSpreadBook do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left, ActiveSheet.SelectionRect.Top) do
      SetCellText((Sender as TEdit).Text);
    UpdateControl;
  end;
end;

procedure TFeaturesMainForm.edtCellEditExit(Sender: TObject);
begin
  with cxSpreadBook do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left, ActiveSheet.SelectionRect.Top) do
    begin
      Text := Text;
      Free;
    end;
    UpdateControl;
    SetFocus;
  end;
  cxSpreadBookSetSelection(Self, cxSpreadBook.ActiveSheet);
end;

procedure TFeaturesMainForm.edtCellEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Windows.SetFocus(cxSpreadBook.Handle);
    edtCellEditExit(Sender);
  end;
end;

procedure TFeaturesMainForm.mnuBordersDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
  if Selected then
    ACanvas.Brush.Color := clHighLight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ARect);
  imgBordersImages.Draw(ACanvas, ARect.Left + 2, ARect.Top + 2, (Sender as TMenuItem).ImageIndex);
end;

procedure TFeaturesMainForm.mnuBordersMeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 14;
  Height := 24;
end;

procedure TFeaturesMainForm.mnuBordersClick(Sender: TObject);
var
  ARect: TRect;
  AKey, I: Integer;
const
  AOutBorders: array[0..11, TcxSSEdgeBorder] of TcxSSEdgeLineStyle =
    ((lsDefault, lsDefault, lsDefault, lsDefault),
     (lsNone, lsNone, lsNone, lsDouble),
     (lsNone, lsThin, lsNone, lsThick),
     (lsNone, lsNone, lsNone, lsThin),
     (lsNone, lsNone, lsNone, lsThick),
     (lsThin, lsThin, lsThin, lsThin),
     (lsThin, lsNone, lsNone, lsNone),
     (lsNone, lsThin, lsNone, lsThin),
     (lsThin, lsThin, lsThin, lsThin),
     (lsNone, lsNone, lsThin, lsNone),
     (lsNone, lsThin, lsNone, lsDouble),
     (lsThick, lsThick, lsThick, lsThick));

  AInBorders: array[Boolean] of TcxSSEdgeLineStyle = (lsDefault, lsThin);

  procedure SetHorzStyle(ARow: Integer; AStyle: TcxSSEdgeLineStyle);
  var
    I: Integer;
  begin
    if AStyle <> lsNone then
    begin
      for I := ARect.Left to ARect.Right do
      begin
        with cxSpreadBook.ActiveSheet.GetCellObject(I, ARow) do
        try
          Style.Borders[eTop].Style := AStyle;
        finally
          Free;
        end;
      end;
    end;
  end;

  procedure SetVertStyle(ACol: Integer; AStyle: TcxSSEdgeLineStyle);
  var
    I: Integer;
  begin
    if AStyle <> lsNone then
    begin
      for I := ARect.Top to ARect.Bottom do
      begin
        with cxSpreadBook.ActiveSheet.GetCellObject(ACol, I) do
        try
          Style.Borders[eLeft].Style := AStyle;
        finally
          Free;
        end;
      end;
    end;
  end;

begin
  cxSpreadBook.BeginUpdate;
  try
    ARect := cxSpreadBook.ActiveSheet.SelectionRect;
    AKey := (Sender as TMenuItem).ImageIndex;
    SetVertStyle(ARect.Left, AOutBorders[AKey, eLeft]);
    SetHorzStyle(ARect.Top, AOutBorders[AKey, eTop]);
    SetVertStyle(ARect.Right + 1, AOutBorders[AKey, eRight]);
    SetHorzStyle(ARect.Bottom + 1, AOutBorders[AKey, eBottom]);
    for I := ARect.Top + 1 to ARect.Bottom do
      SetHorzStyle(I, AInBorders[AKey = 5]);
    for I := ARect.Left + 1 to ARect.Right do
      SetVertStyle(I, AInBorders[AKey = 5]);
  finally
    cxSpreadBook.EndUpdate;
    cxSpreadBook.UpdateControl;
  end;
end;

procedure TFeaturesMainForm.cbxSizeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Windows.SetFocus(cxSpreadBook.Handle)
  else
    if not (Key in ['0'..'9']) then
      Key := #0;
end;

procedure TFeaturesMainForm.cbxSizeChange(Sender: TObject);
var
  ASize: Integer;
begin
  if cxTryStrToInt(cbxSize.Text, ASize) then
    SetCellsStyle([svSize], haGeneral, ASize, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.tbCenterAlignClick(Sender: TObject);
begin
  SetCellsStyle([svAlign], haCenter, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.tbRightAlignClick(Sender: TObject);
begin
  SetCellsStyle([svAlign], haRight, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.SetTokenStyle(AToolButton: TToolButton; AStyleValue: TStyleValue; AFontStyle: TFontStyle);
begin
  if AToolButton.Down then
    SetCellsStyle([AStyleValue], haGeneral, 0, '', [AFontStyle])
  else
    SetCellsStyle([AStyleValue], haGeneral, 0, '', []);
end;

procedure TFeaturesMainForm.actBoldClick(Sender: TObject);
begin
  SetTokenStyle(tbBold, svBold, fsBold);
end;

procedure TFeaturesMainForm.actItalicClick(Sender: TObject);
begin
  SetTokenStyle(tbItalic, svItalic, fsItalic);
end;

procedure TFeaturesMainForm.actUnderlineClick(Sender: TObject);
begin
  SetTokenStyle(tbUnderline, svUnderline, fsUnderline);
end;

procedure TFeaturesMainForm.actStrikeOutClick(Sender: TObject);
begin
  SetTokenStyle(tbStrikeOut, svStrikeOut, fsStrikeOut);
end;

procedure TFeaturesMainForm.tbMergeSplitClick(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    SetMergedState(SelectionRect, (Sender as TToolButton).Tag = 7);
end;

procedure TFeaturesMainForm.tbsSummaryClick(Sender: TObject);
begin
  CalculateSummary(0);
end;

procedure TFeaturesMainForm.tbBorderStyleClick(Sender: TObject);
var
  ARect: TRect;
begin
  ARect := tbBorderStyle.BoundsRect;
  ARect.TopLeft := tbsFormatting.ClientToScreen(ARect.TopLeft);
  ARect.BottomRight := tbsFormatting.ClientToScreen(ARect.BottomRight);
  tbBorderStyle.Down := True;
  pmBorders.Popup(ARect.Left, ARect.Bottom);
  tbBorderStyle.Down := False;
end;

procedure TFeaturesMainForm.SummaryItemClick(Sender: TObject);
begin
  CalculateSummary((Sender as TMenuItem).Tag)
end;

procedure TFeaturesMainForm.cbxFontKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Windows.SetFocus(cxSpreadBook.Handle);
end;

procedure TFeaturesMainForm.actSheetExecute(Sender: TObject);
begin
  with cxSpreadBook do
    PageCount := PageCount + 1;
end;

procedure TFeaturesMainForm.actColumnExecute(Sender: TObject);
begin
  with cxSpreadBook do
    ActiveSheet.InsertCells(ActiveSheet.SelectionRect, msAllCol);
end;

procedure TFeaturesMainForm.actRowExecute(Sender: TObject);
begin
  with cxSpreadBook do
    ActiveSheet.InsertCells(ActiveSheet.SelectionRect, msAllRow);
end;

procedure TFeaturesMainForm.actNewExecute(Sender: TObject);
begin
  NewSheet;
end;

procedure TFeaturesMainForm.actOpenSpreadSheetExecute(Sender: TObject);
begin
  OpenSpreadSheet;
end;

procedure TFeaturesMainForm.actSaveSpeadSheetExecute(Sender: TObject);
begin
  SaveSpreadSheet;
end;

procedure TFeaturesMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFeaturesMainForm.AlwaysEnabled(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := True;
end;

procedure TFeaturesMainForm.actPasteExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Paste(SelectionRect.TopLeft);
end;

procedure TFeaturesMainForm.actCopyExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Copy(SelectionRect, False);
end;

procedure TFeaturesMainForm.actCutExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    Copy(SelectionRect, True);
end;

procedure TFeaturesMainForm.actAutomaticCalcExecute(Sender: TObject);
begin
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.AutoRecalc := TCustomAction(Sender).Checked;
  if cxSpreadBook.AutoRecalc then
  begin
    cxSpreadBook.Recalc;
    cxSpreadBook.UpdateControl;
  end;
end;

procedure TFeaturesMainForm.actRecalcFormulasExecute(Sender: TObject);
begin
  cxSpreadBook.Recalc();
  cxSpreadBook.UpdateControl;
end;

procedure TFeaturesMainForm.actBeveledLookandFeelExecute(Sender: TObject);
begin
  if (IsUpdate) then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.PainterType := TcxSSPainterType(TCustomAction(Sender).Checked);
end;

procedure TFeaturesMainForm.actCellLeftAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haLeft, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.actCellRightAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haRight, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.actCellCenterAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haCenter, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.actCellsExecute(Sender: TObject);
var
  AForm :TFeatureModifyForm;
const
  AFormType: array[Boolean] of TcxSSModifyType = (mtDelete, mtInsert);
begin
   if IsUpdate then Exit;
   AForm := TFeatureModifyForm.Create(Self);
   AForm.Top := (Top + Height) shr 1;
   AForm.Left := (Left + Width) shr 1;
   try
     if AForm.Execute(AFormType[TCustomAction(Sender).Tag = 1]) then
       with cxSpreadBook.ActiveSheet do
         case TCustomAction(Sender).Tag of
           0:
             DeleteCells(SelectionRect, AForm.Modify);
           1:
             InsertCells(SelectionRect, AForm.Modify);
         end;
   finally
     AForm.Free;
   end;
end;

procedure TFeaturesMainForm.actFormatCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    FormatCells(SelectionRect);
end;

procedure TFeaturesMainForm.actHideCellsExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, False);
end;

procedure TFeaturesMainForm.actShowCellsExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, True);
end;

procedure TFeaturesMainForm.actHideColExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, False, False);
end;

procedure TFeaturesMainForm.actShowColExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, False, True);
end;

procedure TFeaturesMainForm.actBufferedpaintExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.BufferedPaint := TCustomAction(Sender).Checked;
end;

procedure TFeaturesMainForm.actShowcaptionsExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.ShowCaptionBar := TCustomAction(Sender).Checked;
end;

procedure TFeaturesMainForm.actShowgridExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.ShowGrid := TCustomAction(Sender).Checked;
end;

procedure TFeaturesMainForm.actShowheadersExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.ShowHeaders := TCustomAction(Sender).Checked;
end;

procedure TFeaturesMainForm.actShowformulasExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.ShowFormulas := TCustomAction(Sender).Checked;
end;

procedure TFeaturesMainForm.actR1C1ReferencestyleExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
  cxSpreadBook.R1C1ReferenceStyle := TCustomAction(Sender).Checked;
  pnCellRect.Caption := GetCellText(cxSpreadBook.ActiveSheet.SelectionRect, cxSpreadBook.R1C1ReferenceStyle);
end;

procedure TFeaturesMainForm.actMergeCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    SetMergedState(SelectionRect, True);
end;

procedure TFeaturesMainForm.actSplitCellsExecute(Sender: TObject);
begin
  with cxSpreadBook.ActiveSheet do
    SetMergedState(SelectionRect, False);
end;

procedure TFeaturesMainForm.actFontExecute(Sender: TObject);
begin
  SetCellsStyle([svFontName], haGeneral, 0, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.actFontSizeExecute(Sender: TObject);
var
  ASize: Integer;
begin
  if cxTryStrToInt(cbxSize.Text, ASize) then
    SetCellsStyle([svSize], haGeneral, ASize, cbxFont.Text, []);
end;

procedure TFeaturesMainForm.actSumExecute(Sender: TObject);
begin
  CalculateSummary(TComponent(Sender).Tag);
end;

procedure TFeaturesMainForm.actSortExecute(Sender: TObject);
const
  ASortType: array[0..1] of TcxSortType = (stAscending, stDescending);
begin
  with cxSpreadBook.ActiveSheet do
    Sort(SelectionRect, [ASortType[TCustomAction(Sender).Tag]]);
end;

procedure TFeaturesMainForm.actHideRowExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, False, True, False);
end;

procedure TFeaturesMainForm.actShowRowExecute(Sender: TObject);
begin
  if IsUpdate then Exit;
  with cxSpreadBook.ActiveSheet do
    SetVisibleState(SelectionRect, False, True, True);
end;

procedure TFeaturesMainForm.actUndoExecute(Sender: TObject);
begin
   cxSpreadBook.History.Undo(1);
end;

procedure TFeaturesMainForm.actUndoUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := (cxSpreadBook.History.UndoActions.Count > 0) and
    not (ActiveMDIChild as TFeatureChildForm).IsEditorMode;
end;

procedure TFeaturesMainForm.actRedoUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := (cxSpreadBook.History.RedoActions.Count > 0)
end;

procedure TFeaturesMainForm.actRedoExecute(Sender: TObject);
begin
  cxSpreadBook.History.Redo(1);
end;

procedure TFeaturesMainForm.pmUndoPopup(Sender: TObject);
var
  Item: TMenuItem;
  i: Integer;
begin
  while TPopUpMenu(Sender).Items.Count > 0 do
    TPopUpMenu(Sender).Items.Delete(0);
  with cxSpreadBook.History do
    for i:=0 to UndoActions.Count do
    begin
      Item := TMenuItem.Create(Sender as TComponent);
      if i < UndoActions.Count then
        Item.Caption := UndoActions[i].Description;
      Item.OnMeasureItem := MeasureItem;
      Item.OnDrawItem := DrawItem;
      Item.OnClick := UndoItemClick;
      TPopUpMenu(Sender).Items.Add(Item);
    end;
end;

procedure TFeaturesMainForm.pmRedoPopup(Sender: TObject);
var
  Item: TMenuItem;
  i: Integer;
begin
  while TPopUpMenu(Sender).Items.Count > 0 do
    TPopUpMenu(Sender).Items.Delete(0);
  with cxSpreadBook.History do
    for i:=0 to RedoActions.Count do
    begin
      Item := TMenuItem.Create(Sender as TComponent);
      if i < RedoActions.Count then
        Item.Caption := RedoActions[i].Description;
      Item.OnMeasureItem := MeasureItem;
      Item.OnDrawItem := DrawItem;
      Item.OnClick := RedoItemClick;
      TPopUpMenu(Sender).Items.Add(Item);
    end;
end;

procedure TFeaturesMainForm.UndoItemClick(Sender: TObject);
begin
  if TMenuItem(Sender).MenuIndex < TPopupMenu(TMenuItem(Sender).Owner).Items.Count - 1 then
    cxSpreadBook.History.Undo(TMenuItem(Sender).MenuIndex + 1)
end;

procedure TFeaturesMainForm.RedoItemClick(Sender: TObject);
begin
  if TMenuItem(Sender).MenuIndex < TPopupMenu(TMenuItem(Sender).Owner).Items.Count - 1 then
    cxSpreadBook.History.Redo(TMenuItem(Sender).MenuIndex + 1)
end;

procedure TFeaturesMainForm.MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 90;
  if TMenuItem(Sender).MenuIndex = TPopupMenu(TComponent(Sender).Owner).Items.Count - 1 then
    Height := ACanvas.TextHeight('W') + 10 else
  Height := ACanvas.TextHeight('W');
end;

procedure TFeaturesMainForm.DrawUndoRedoItem(PopupMenu: TPopupMenu; Sender: TMenuItem; ACanvas: TCanvas; ARect: TRect; Selected: Boolean; InfoStr: String);
  procedure UpdatePreviousItems(AIndex: Integer);
  var
    i: Integer;
    Rec: TRect;
  begin
    Rec := ARect;
    for i:=AIndex - 1 downto 0 do
    begin
      Rec := Rect(Rec.Left, ACanvas.TextHeight('W') * i, Rec.Right, ACanvas.TextHeight('W') * (i + 1));
      ACanvas.Brush.Color := clHighLight;
      ACanvas.Brush.Style := bsSolid;
      ACanvas.FillRect(Rec);
      ACanvas.TextRect(Rec, Rec.Left, Rec.Top, PopupMenu.Items[i].Caption);
    end;
  end;
  procedure DrawActionsCount();
  var
    Rec: TRect;
    Lft, Tp, ActionsCount, Btn: Integer;
    Str: String;
  begin
    if (PopupMenu.Items.Count - 1) = Sender.MenuIndex then
    begin
      Btn := (PopupMenu.Items.Count - 1) * ACanvas.TextHeight('W') - 1 + (ARect.Bottom -  ARect.Top);
      ActionsCount := Sender.MenuIndex;
    end else
    begin
      Btn := (PopupMenu.Items.Count - 1) * ACanvas.TextHeight('W') - 1 + FSummaryItemHeight + (ARect.Bottom -  ARect.Top);
      ActionsCount := Sender.MenuIndex + 1;
    end;
    Rec := Rect(ARect.Left + 1, (PopupMenu.Items.Count - 1) * ACanvas.TextHeight('W') + 1,
      ARect.Right - 1, Btn);

    ACanvas.Brush.Color := clMenu;
    ACanvas.Brush.Style := bsSolid;
    ACanvas.FillRect(Rec);

    Str := Format(InfoStr, [ActionsCount]);
    Lft := (Rec.Left + Rec.Right) div 2 - (ACanvas.TextWidth(Str) div 2);
    Tp := (Rec.Top + Rec.Bottom) div 2 - (ACanvas.TextHeight(Str) div 2);
    Frame3D(ACanvas, Rec, clBtnShadow, clBtnHighlight, 1);
    ACanvas.TextRect(Rec, Lft, Tp, Str);
  end;
  procedure UpdateNextItems(Index: Integer);
  var
    i: Integer;
    Rec: TRect;
  begin
    Rec := ARect;
    for i:=Index + 1 to PopupMenu.Items.Count - 2 do
    begin
      Rec := Rect(Rec.Left, Rec.Top + ACanvas.TextHeight('W'), Rec.Right, Rec.Bottom + ACanvas.TextHeight('W'));
      ACanvas.Brush.Color := clMenu;
      ACanvas.Brush.Style := bsSolid;
      ACanvas.FillRect(Rec);
      ACanvas.TextRect(Rec, Rec.Left, Rec.Top, PopupMenu.Items[i].Caption);
    end;
  end;
begin
  if Sender.MenuIndex = (PopupMenu.Items.Count - 1) then
  begin
    ACanvas.Brush.Color := clMenu;
    ACanvas.Brush.Style := bsSolid;
    ACanvas.FillRect(ARect);
    if Selected then
      UpdatePreviousItems(Sender.MenuIndex);
  end else
  begin
    if Selected then
    begin
      ACanvas.Brush.Color := clHighLight;
      ACanvas.Brush.Style := bsSolid;
      ACanvas.FillRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom));
      UpdatePreviousItems(Sender.MenuIndex);
    end
    else
    begin
      ACanvas.Brush.Color := clMenu;
      ACanvas.Brush.Style := bsSolid;
      ACanvas.FillRect(ARect);
      UpdateNextItems(Sender.MenuIndex);
    end;
    ACanvas.TextRect(ARect, ARect.Left, ARect.Top, Sender.Caption);
  end;
  DrawActionsCount;
end;

procedure TFeaturesMainForm.DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  Str: String;
begin
  if TComponent(Sender).Owner.Name = 'pmUndo' then
    Str := '撤消 %d '
  else
    Str := '重复 %d ';
  DrawUndoRedoItem(TPopupMenu(TComponent(Sender).Owner), TMenuItem(Sender), ACanvas, ARect, Selected, Str);
end;

procedure TFeaturesMainForm.IsEditorMode(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := not (ActiveMDIChild as TFeatureChildForm).IsEditorMode;
end;

procedure TFeaturesMainForm.FormCreate(Sender: TObject);
begin
  self.LoadForm(FeaturesMainForm);
end;

procedure TFeaturesMainForm.FormDestroy(Sender: TObject);
begin
  self.SaveForm(FeaturesMainForm);
end;

procedure TFeaturesMainForm.N9Click(Sender: TObject);
begin
      ShellExecute(handle,nil,pchar('help\help.chm'),nil,nil,sw_shownormal);
end;

procedure TFeaturesMainForm.N13Click(Sender: TObject);
begin
  logo:=tlogo.create(application);
  logo.showmodal;
end;

end.
  