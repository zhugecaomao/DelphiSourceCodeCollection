{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid TtsDbGrid Print routine                 }
{                                                       }
{       Copyright (c) 1997 - 2001, ObjectSight          }
{                                                       }
{*******************************************************}

unit tsPrintDbGrid;

{$INCLUDE TSCmpVer}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, ExtCtrls, Qrctrls, Printers, TsGrid, TsDbGrid,
  StdCtrls, ImgList, db, ComCtrls, qrprntr
  {$IFDEF TSVER_V6} , Variants {$ENDIF};

type
  TtsBaseGrid_ = class(TtsBaseGrid) end;
  TtsCustomGrid_ = class(TtsCustomGrid) end;
  TtsCustomDBGrid_ = class(TtsCustomDBGrid) end;

  TosReportTotal = class(TObject)
  private
    FColumn   : Integer;
    FLabel    : TQRLabel;
    FDataType : TFieldType;
    FTotal    : Double;
    FIsNegative : Boolean;
  public
    procedure ShowTotal;
  end;

  TfmPrintDbGrid = class(TForm)
    qrGrid: TQuickRep;
    bnColumnHeader: TQRBand;
    bnDetail: TQRBand;
    ilImages: TImageList;
    bnPageHeader: TQRBand;
    qlDateTimeLabel: TQRLabel;
    qsDateTime: TQRSysData;
    qrReportTitle: TQRSysData;
    qsPageNo: TQRSysData;
    qlPageLabel: TQRLabel;
    bnSummary: TQRBand;
    qlEndOfReport: TQRLabel;
    laRecordCount: TQRLabel;
    RichEdit1: TRichEdit;
    qiTitleImage: TQRImage;
    procedure qrGridNeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrGridAfterPrint(Sender: TObject);
    procedure qrGridAfterPreview(Sender: TObject);
    procedure qrGridBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    FGrid : TtsDBGrid;
    FRow, FMaxCols, FDetailHeight, FRowCount : Integer;
    FHorzScale : Double;
    FcellDrawInfo : TtsDrawInfo;
    FCheckedBitmap : TBitmap;
    FUnCheckedBitmap : TBitmap;
    FContractBitmap, FExpandBitmap : TBitmap;
    FControls, FTotalControls : TList;
    FGroupCnt, FRecCnt : Integer;
    FBookmarks : TStringList;
    FTitle, FEndOfReportText : String;
    FPrinterOrientation : TPrinterOrientation;
    FDetailColor : TColor;
    FColumnSpacing : Integer;

    function  GetReportWidth : Integer;
    function  GetColumnSeparation : Integer;
    function  NextColumnPos(Left : Integer; aColumn : TtsCol) : Integer;
    function  ColWidth(Width : Integer) : Integer;
    procedure ComputeHorzScale;
    procedure ClearDrawInfo;
    procedure LoadBookmarks;
    function  GetOrientation : Integer;
    procedure SetOrientation(Value : Integer);
    procedure IncrementColumnTotal(iCol : Integer; theLabel : TQRLabel);
    function  ColumnReportTotal(iCol : Integer) : TosReportTotal;
    procedure ShowReportTotals;
    procedure ApplyCustomSettings;
  public
    { Public declarations }
    procedure Initialize;
    procedure ConfigureColumns(aGrid : TtsBaseGrid);
    procedure PreView;
    procedure Print;
    procedure SetGrid(aCustomDbGrid : TtsCustomDbGrid);

    property ContractBitmap: TBitmap read FContractBitmap write FContractBitmap;
    property ExpandBitmap: TBitmap read FExpandBitmap write FExpandBitmap;
    property Title : String read FTitle write FTitle;
    property EndofReportText : String read FEndOfReportText write FEndOfReportText;
    property PrinterOrientation : TPrinterOrientation read FPrinterOrientation write FPrinterOrientation;
    property Orientation : Integer read GetOrientation write SetOrientation;

    property Grid : TtsDBGrid read FGrid;
    property ColumnSeparation : Integer read GetColumnSeparation;
    property ReportWidth : Integer read GetReportWidth;
  end;

var
  fmPrintDbGrid: TfmPrintDbGrid;

implementation

{$R *.DFM}

function TfmPrintDbGrid.GetReportWidth : Integer;
begin
  Result := Round(qrGrid.Page.Width - qrGrid.Page.LeftMargin - qrGrid.Page.RightMargin);
end;

function TfmPrintDbGrid.GetColumnSeparation : Integer;
var iLeftMargin : Double;
begin
  // ColumnSpacing is in MM so we need to translate MM to Pixels...
  if (FColumnSpacing = 0) and
     (FGrid.GridReport.ColumnSpacing > 0) then
  begin
    iLeftMargin := qrGrid.Page.LeftMargin;  // Save to restore...
    qrGrid.Units := MM;
    try
      qrGrid.Page.LeftMargin := FGrid.GridReport.ColumnSpacing;
    finally
      qrGrid.Units := Pixels;
      FColumnSpacing := Round(qrGrid.Page.LeftMargin);
      qrGrid.Page.LeftMargin := iLeftMargin; // Reset back !
    end;
  end;
  Result := FColumnSpacing;
end;

function  TfmPrintDbGrid.GetOrientation : Integer;
begin
  Result := Integer(FPrinterOrientation);
end;

procedure TfmPrintDbGrid.SetOrientation(Value : Integer);
begin
  FPrinterOrientation := TPrinterOrientation(Value);
end;

procedure TfmPrintDbGrid.ComputeHorzScale;
var iGridWidth, i, printCol, AvailableReportWidth : Integer;
    aColumn : TtsCol;
begin
  // Fit FMaxCols columns on the page horizontally...
  FHorzScale := 1.0;
  iGridWidth := 0; //Round(4/100 * ReportWidth);
  printCol := 0;
  for i := 1 to FGrid.Cols do
  begin
    aColumn := FGrid.Col[FGrid.DataColnr[i]];
    if (aColumn <> Nil) and
       (aColumn.Visible) and
       (((aColumn.Selected) and (FGrid.ColSelectMode = csMulti)) or
        (FGrid.ColSelectMode = csNone) or (FGrid.SelectedCols.Count = 0))  then
    begin
       iGridWidth := iGridWidth + aColumn.Width;
       Inc(printCol);
    end;
    if (FGrid.PrintCols > 0) and
       (printCol >= FGrid.PrintCols) then
       break;
  end;
  AvailableReportWidth := ReportWidth - 4 - Round(Self.ColumnSeparation * (printCol - 1));
  qrGrid.Page.Columns := 1;
  if (iGridWidth > AvailableReportWidth) and
     (AvailableReportWidth > 0) then
     FHorzScale := Abs(iGridWidth / AvailableReportWidth)
  //else
  //   qrGrid.Page.Columns := Trunc(ReportWidth /
  //                    (Round(Self.ColumnSeparation * (printCol - 1)) + iGridWidth));
end;

procedure TfmPrintDbGrid.Initialize;
var i : Integer;
begin
  FGrid := Nil;
  FGroupCnt := 0;
  FRecCnt := 0;
  for i := FTotalControls.Count - 1 downto 0 do
  begin
    TosReportTotal(FTotalControls.Items[i]).FLabel.Free;
    TosReportTotal(FTotalControls.Items[i]).Free;
  end;
  for i := FControls.Count - 1 downto 0 do
    TObject(FControls.Items[i]).Free;
  FControls.Clear;
  FTotalControls.Clear;
  FBookmarks := TStringList.Create;
  FColumnSpacing := 0;
end;

procedure TfmPrintDbGrid.ApplyCustomSettings;
begin
  if FGrid.GridReport = Nil then
  begin
    qlDateTimeLabel.Caption := 'DateTime:';
    qlPageLabel.Caption := 'Page:';
    qlEndOfReport.Caption := '*** END OF REPORT ***';
    qlDateTimeLabel.Font.Color := clBlack;
    qsDateTime.Font.Color := clBlack;
    qlPageLabel.Font.Color := clBlack;
    qsPageNo.Font.Color := clBlack;
    qlEndOfReport.Font.Color := clBlack;
    laRecordCount.Font.Color := clBlack;
    qrReportTitle.Font.Name := 'Aria';
    qrReportTitle.Font.Size := 14;
    qrReportTitle.Font.Style := [fsBold];
    qrReportTitle.Font.Color := clBlack;
    qiTitleImage.Picture.Assign(Nil);
    qiTitleImage.Left := Round(ReportWidth / 2) - Round(qiTitleImage.Width / 2);
    bnPageHeader.Height := 58;

    exit;
  end;

  // Switch to Millimeters briefly...
  qrGrid.Units := MM;
  qrGrid.Page.LeftMargin   := FGrid.GridReport.Margins.LeftMargin;
  qrGrid.Page.RightMargin  := FGrid.GridReport.Margins.RightMargin;
  qrGrid.Page.TopMargin    := FGrid.GridReport.Margins.TopMargin;
  qrGrid.Page.BottomMargin := FGrid.GridReport.Margins.BottomMargin;
  qrGrid.Units := Pixels;
  FDetailColor := FGrid.GridReport.PrintBandColor;
  if FGrid.GridReport.PrintLineMode = lmBanded then
     bnDetail.Color := FDetailColor
  else
     bnDetail.Color := clWhite;
  qrGrid.Page.PaperSize := TQRPaperSize(FGrid.GridReport.PaperSize);
  qlDateTimeLabel.Caption := FGrid.GridReport.DateTimeLabel;
  qsDateTime.Left := qlDateTimeLabel.Left + qlDateTimeLabel.Width + 5;
  qlPageLabel.Caption := FGrid.GridReport.PageLabel;
  qlPageLabel.Left := ReportWidth - qlPageLabel.Width - 25;
  qlEndOfReport.Caption := FGrid.GridReport.EndOfReportLabel;

  if not FGrid.GridReport.ShowDateTime then
  begin
    qlDateTimeLabel.Font.Color := clWhite;
    qsDateTime.Font.Color := clWhite;
  end
  else
  begin
    qlDateTimeLabel.Font.Color := clBlack;
    qsDateTime.Font.Color := clBlack;
  end;
  if not FGrid.GridReport.ShowPageCount then
  begin
    qlPageLabel.Font.Color := clWhite;
    qsPageNo.Font.Color := clWhite;
  end
  else
  begin
    qlPageLabel.Font.Color := clBlack;
    qsPageNo.Font.Color := clBlack;
  end;
  if not FGrid.GridReport.ShowEndOfReport then
     qlEndOfReport.Font.Color := clWhite
  else
     qlEndOfReport.Font.Color := clBlack;
  if not FGrid.GridReport.ShowRecordCount then
     laRecordCount.Font.Color := clWhite
  else
     laRecordCount.Font.Color := clBlack;
  if (not FGrid.GridReport.ShowTitleSection) then
     bnPageHeader.Height := 0;

  qrReportTitle.Font.Assign(FGrid.GridReport.TitleFont);
  if FGrid.GridReport.TitleImage <> Nil then
  begin
     qiTitleImage.Picture.Assign(FGrid.GridReport.TitleImage);
     qiTitleImage.Left := Round(ReportWidth / 2) - Round(qiTitleImage.Width / 2);
  end;
  bnDetail.Frame.DrawTop := (FGrid.GridReport.PrintLineMode = lmLine);
end;

procedure TfmPrintDbGrid.ConfigureColumns(aGrid : TtsBaseGrid);
var i, iLeft, iDataHeight, printCol : Integer;
    aColumn : TtsCol;
    aReportLabel : TQRLabel;
    aReportRichText : TQRRichText;
    aReportImage : TQRImage;

    procedure AddImage;
    begin
			aReportImage := TQRImage.Create(qrGrid);
			aReportImage.ParentReport := qrGrid;
			aReportImage.Parent := bnDetail;
			with aReportImage do
			begin
				Name := 'Col' + IntToStr(i);
				AutoSize    := False;
				Height      := bnDetail.Height - 2;
				Size.Left   := iLeft + Round(aColumn.Width/2) - 6;
				Size.Width  := ColWidth(aColumn.Width);
        Top         := 2;
			end;
			aColumn.Data := aReportImage;
      FControls.Add(aReportImage);
    end;

    procedure AddLabel;
    begin
		  aReportLabel := TQRLabel.Create(qrGrid);
		  aReportLabel.Parent := bnDetail;
		  with aReportLabel do
		  begin
				Name := 'Col' + IntToStr(i);
				Alignment   := TAlignment(aColumn.Alignment);
        if FGrid.PrintWithGridFormats then
        begin
				  Font.Style  := FGrid.Font.Style;
				  Font.Color  := FGrid.Font.Color;
				  if (aColumn.Color > 0) and
             (aColumn.Color <> clNone) then
					   Color := TColor(aColumn.Color)
				  else if aColumn.readonly then
					   Color := clSilver;
          Transparent := False;
        end
        else
        begin
          Font.Style := [];
          Font.Color := clBlack;
          Transparent := True;
        end;
				AutoSize    := False;
				AutoStretch := False;
				Height      := Abs(Font.Height);
				Size.Left   := iLeft;
				Size.Width  := ColWidth(aColumn.Width);
        Top         := Trunc(Round((bnDetail.Height - Abs(Font.Height))/2)/2);
				Caption := '';
        if (aColumn.WordWrap = wwOn) or
           ((aColumn.WordWrap = wwDefault) and (FGrid.WordWrap <> wwOff)) then
        begin
           WordWrap := True;
           AutoStretch := True;
        end
        else
           WordWrap := False;
		  end;
		  aColumn.Data := aReportLabel;
      FControls.Add(aReportLabel);
    end;

    procedure AddRichText;
    begin
		  aReportRichText := TQRRichText.Create(qrGrid);
		  aReportRichText.Parent := bnDetail;
      aReportRichText.ParentRichEdit := RichEdit1;
		  with aReportRichText do
		  begin
				Name := 'Col' + IntToStr(i);
				Alignment   := TAlignment(aColumn.Alignment);
				Font.Style  := FGrid.Font.Style;
				Font.Color  := FGrid.Font.Color;
				AutoSize    := False;
				AutoStretch := True;
				Height      :=  bnDetail.Height;
				Size.Left   := iLeft;
				Size.Top    := 1;
				Size.Width  := ColWidth(aColumn.Width);
				if aColumn.Color > 0 then
					 Color := TColor(aColumn.Color)
				else if aColumn.Readonly then
					 Color := clSilver;
				Caption := aColumn.Heading;
		  end;
		  aColumn.Data := aReportRichText;
      FControls.Add(aReportRichText);
    end;

    procedure AddReportTotal;
    var aTotalLabel : TQRLabel;
        aReportTotal : TosReportTotal;
    begin
       aTotalLabel := TQRLabel.Create(qrGrid);
       aTotalLabel.Parent := bnSummary;
       with aTotalLabel do
       begin
          Name := 'Total' + IntToStr(i);
          Alignment  := TAlignment(aColumn.Alignment);
          Font.Style := [fsBold];
          Left  := iLeft;
          Size.Top   := 4;
          Size.Width := ColWidth(aColumn.Width);
          AutoSize := False;
          Caption := '';
          Frame.DrawTop := True;
       end;
       aReportTotal := TosReportTotal.Create;
       aReportTotal.FLabel := aTotalLabel;
       aReportTotal.FColumn := FGrid.DataColnr[i];
       aReportTotal.FDataType := ftInteger;
       FTotalControls.Add(aReportTotal);
    end;

begin
  Initialize;

  // Create a TQRLabel for each column in the grid and position it
  // based upon same X locations in grid...
  iLeft := 2;
  FGrid := TtsDbGrid(aGrid);
  qrGrid.Font.Name := FGrid.Font.Name;
  qrGrid.Font.Size := FGrid.Font.Size;
  qrGrid.Page.Orientation := PrinterOrientation;
  qrGrid.ReportTitle := Title;

  ApplyCustomSettings;

  qlPageLabel.Left   := ReportWidth - qlPageLabel.Width - 25;
  qsPageNo.Left      := qlPageLabel.Left + qlPageLabel.Width + 4;
  qrReportTitle.Left := Round(bnPageHeader.Width/2) - Round(qrReportTitle.Width/2);
  if FGrid.HeadingOn then
     bnColumnHeader.Height := FGrid.HeadingHeight + 4
  else
     bnColumnHeader.Height := 0;

  // Now determine the height of the detail row based upon the Lines Per Page...
  iDataHeight := qrGrid.Height - bnPageHeader.Height - bnColumnHeader.Height  - Round(qrGrid.Page.TopMargin) - Round(qrGrid.Page.BottomMargin);
  if (FGrid.PrintLinesPerPage > 0) then
     FDetailHeight := Round(iDataHeight / FGrid.PrintLinesPerPage) 
  else
     FDetailHeight := Round(iDataHeight / 40);
  bnDetail.Height := FDetailHeight;
  FMaxCols := FGrid.Cols;
  if (FGrid.PrintCols > 0) and
     (FGrid.PrintCols < FGrid.Cols) then
     FMaxCols := FGrid.PrintCols;
  // Then compute HorzScale...
  ComputeHorzScale;
  FRowCount := 0;

  bnDetail.Font.Name := FGrid.Font.Name;
  bnDetail.Font.Size := Round(FGrid.Font.Size / FHorzScale);
  if bnDetail.Font.Size < FGrid.GridReport.MinFontSize then
     bnDetail.Font.Size := FGrid.GridReport.MinFontSize;
  FcellDrawInfo.Font := TFont.Create;
  i := 1;
  printCol := 1;
  iLeft := 2;
  while (printCol <= FMaxCols) and (i <= FGrid.Cols) do
  begin
    aColumn := FGrid.Col[FGrid.DataColnr[i]];
    if (aColumn <> Nil) and
       (aColumn.Visible) and
       (((aColumn.Selected) and (FGrid.ColSelectMode = csMulti)) or
        (FGrid.ColSelectMode = csNone) or (FGrid.SelectedCols.Count = 0))  then
    begin
       if (iLeft + Round(ColWidth(aColumn.Width)/2)) > (qrGrid.Page.Width - qrGrid.Page.RightMargin) then
       begin
         FMaxCols := i - 1;
         break;
       end;
       // First create a column heading
       if FGrid.HeadingOn then
       begin
         aReportLabel := TQRLabel.Create(qrGrid);
         aReportLabel.Parent   := bnColumnHeader;
         aReportLabel.AutoSize := False;
         aReportLabel.Caption  := aColumn.Heading;
         aReportLabel.WordWrap := (aColumn.WordWrap = wwOn) or ((FGrid.WordWrap = wwOn) and (aColumn.WordWrap = wwDefault));
         aReportLabel.Height   := bnColumnHeader.Height - 2;
         with aReportLabel do
         begin
           Name := 'Header' + IntToStr(i);
           Font.Size := Round(FGrid.HeadingFont.Size / FHorzScale);
           if Font.Size < 8 then
              Font.Size := 8;
           Alignment  := TAlignment(aColumn.Alignment);
           Font.Style := [fsBold, fsUnderline];
           Left  := iLeft;
           Size.Top   := 4;
           Size.Width := ColWidth(aColumn.Width);
         end;
         FControls.Add(aReportLabel);
       end;
       
       if FGrid.PrintTotals and aColumn.PrintTotals then
          AddReportTotal;

       // Then create the label for data in the detailband...
       if (aColumn is TtsDbCol) and
          (TtsDbCol(aColumn).Field <> Nil) and
          (TtsDbCol(aColumn).Field.DatasetField <> Nil) and
          (TtsDbCol(aColumn).Field.DatasetField.DataType = ftMemo) then
          AddRichText
       else if (aColumn.ControlType = ctPicture) or
               (aColumn.ControlType = ctCheck) then
          AddImage
       else
          AddLabel;
       iLeft := NextColumnPos(iLeft, aColumn);
       Inc(printCol);
    end;
    Inc(i);
  end;
end;

function TfmPrintDbGrid.NextColumnPos(Left : Integer; aColumn : TtsCol) : Integer;
begin
  Result := Left + ColumnSeparation + ColWidth(aColumn.Width);
end;

function TfmPrintDbGrid.ColWidth(Width : Integer) : Integer;
begin
  Result := Round(Width / FHorzScale);
end;

procedure TfmPrintDbGrid.LoadBookmarks;
var sCurr : String;
begin
  FBookmarks.Clear;
  sCurr := FGrid.DataSource.DataSet.Bookmark;
  FGrid.BeginUpdate;
  FGrid.DataSource.DataSet.DisableControls;
  try
    with TtsDbGrid(FGrid).DataSource.DataSet do
    begin
      First;
      while not eof do
      begin
        FBookmarks.Add(Bookmark);
        Next;
      end;
    end;
  finally
    FGrid.DataSource.DataSet.Bookmark := sCurr;
    FGrid.EndUpdate;
    FGrid.DataSource.DataSet.EnableControls;
  end;
end;

procedure TfmPrintDbGrid.Print;
begin
  // Print without Preview...
  FRow := 1;
  Grid.BeginUpdate;
  try
    try
      qrGrid.Print;
    except on E:Exception do
      raise Exception.Create('Error previewing report ' + E.Message);
    end;
  finally
    Grid.EndUpdate;
    FRow := 1;
  end;
end;

procedure TfmPrintDbGrid.PreView;
begin
  FRow := 1;
  Grid.BeginUpdate;
  try
    try
      qrGrid.Preview;
    except on E:Exception do
      raise Exception.Create('Error previewing report ' + E.Message);
    end;
  finally
    Grid.EndUpdate;
    FRow := 1;
  end;
end;

procedure TfmPrintDbGrid.ClearDrawInfo;
begin
  FcellDrawInfo.Color := clNone;
  FcellDrawInfo.WordWrap := wwOff;
  FcellDrawInfo.Alignment := taLeftJustify;
  FcellDrawInfo.Font.Color := clNone;
  FcellDrawInfo.Font.Style := [];
  FcellDrawInfo.Font.Name := '';
  FcellDrawInfo.Font.Size := 0;
end;

function  TfmPrintDbGrid.ColumnReportTotal(iCol : Integer) : TosReportTotal;
var i : Integer;
begin
  Result := Nil;
  for i := 0 to FTotalControls.Count - 1 do
    if (TosReportTotal(FTotalControls.Items[i]).FColumn = iCol) then
    begin
      Result := TosReportTotal(FTotalControls.Items[i]);
      break;
    end;
end;

procedure TfmPrintDbGrid.IncrementColumnTotal(iCol : Integer; theLabel : TQRLabel);
var fValue : Double;
    i : Integer;
    sValue : String;
    bNegative : Boolean;
begin
  if (Trim(theLabel.Caption) <> '') and
     (ColumnReportTotal(iCol) <> Nil) then
  begin
    bNegative := False;
    // Remove commas and dollar signs first...
    sValue := Trim(theLabel.Caption);
    for i := Length(sValue) downto 1 do
      if (sValue[i] = CurrencyString) then
      begin
        System.Delete(sValue, i, 1);
        ColumnReportTotal(iCol).FDataType := ftCurrency;
      end
      else if (sValue[i] = ThousandSeparator) then
        System.Delete(sValue, i, 1)
      else if (sValue[i] = DecimalSeparator) then
        ColumnReportTotal(iCol).FDataType := ftFloat
      else if (sValue[i] = '-') then
        bNegative := True
      else if (sValue[i] = '(') or (sValue[i] = ')') then
      begin
        bNegative := True;
        System.Delete(sValue, i, 1);
      end
      else if (sValue[i] IN ['a'..'z','A'..'Z', '!', '@', '#', '%', '^', '&', '*']) then
        exit;
    try
      fValue := StrToFloat(sValue);
    except
      fValue := 0;
    end;
    ColumnReportTotal(iCol).FTotal := ColumnReportTotal(iCol).FTotal + fValue;
    if bNegative then
       ColumnReportTotal(iCol).FIsNegative := True;
  end;
end;

procedure TfmPrintDbGrid.ShowReportTotals;
var iCol, DataCol : Integer;
begin
  for iCol := 1 to FMaxCols do
  begin
    DataCol := FGrid.DataColnr[iCol];
    if FGrid.Col[DataCol].PrintTotals and
       (ColumnReportTotal(DataCol) <> Nil) then
       ColumnReportTotal(DataCol).ShowTotal;
  end;
end;

procedure TfmPrintDbGrid.qrGridNeedData(Sender: TObject; var MoreData: Boolean);
var iIndex, DataCol : integer;
    aReportLabel : TQRLabel;
    aReportImage : TQRImage;
    aReportRichText : TQRRichText;
    aHeader : TtsCol;
    FCurrentBookmark : String;
    Cancel : Boolean;

    procedure ApplyFormat(aControl : TQRLabel);
    begin
      aControl.ParentFont := True;
      aControl.Color := bnDetail.Color;
		  if FGrid.CellColor[DataCol, FCurrentBookmark] <> clNone then
			  aControl.Color := FGrid.CellColor[DataCol, FCurrentBookmark]
      else
      begin
        if (FGrid.DrawOverlap = doDrawRowOnTop) then
        begin
          if (FGrid.RowColor[FCurrentBookmark] <> clNone) then
             aControl.Color := FGrid.RowColor[FCurrentBookmark]
          else if (aHeader.Color <> clNone) then
             aControl.Color := aHeader.Color;
        end
        else
        begin
          if (aHeader.Color <> clNone) then
             aControl.Color := aHeader.Color
          else if (FGrid.RowColor[FCurrentBookmark] <> clNone) then
             aControl.Color := FGrid.RowColor[FCurrentBookmark];
        end;
      end;
			if FGrid.CellFont[DataCol, FCurrentBookmark] <> nil then
         aControl.Font.Assign(FGrid.CellFont[DataCol, FCurrentBookmark])
      else
			begin
        if (FGrid.DrawOverlap = doDrawRowOnTop) then
        begin
          if (FGrid.RowFont[FCurrentBookmark] <> Nil) then
             aControl.Font.Assign(FGrid.RowFont[FCurrentBookmark])
          else if (aHeader.Font <> Nil) then
             aControl.Font.Assign(aHeader.Font)
        end
        else
        begin
          if (aHeader.Font <> Nil) then
             aControl.Font.Assign(aHeader.Font)
          else if (FGrid.RowFont[FCurrentBookmark] <> Nil) then
             aControl.Font.Assign(FGrid.RowFont[FCurrentBookmark])
          else
             aControl.Font.Color  := FGrid.Font.Color;
        end;
			end;
			if Assigned(FGrid.OnGetDrawInfo) then
			begin
        ClearDrawInfo;
				FGrid.OnGetDrawInfo(FGrid, DataCol, FCurrentBookmark, FcellDrawInfo);
        if FCellDrawInfo.Color <> clNone then
           aControl.Color := FCellDrawInfo.Color
        else
           aControl.Color := bnDetail.Color;
        if FCellDrawInfo.Font.Color <> clNone then
				   aControl.Font.Color := FcellDrawInfo.Font.Color
        else
           aControl.Font.Color := bnDetail.Font.Color;
        if FCellDrawInfo.Font.Style <> [] then
   				 aControl.Font.Style := FcellDrawInfo.Font.Style
        else
           aControl.Font.Style := [];
			end;
    end;

    procedure ShowImage;
    begin
		  aReportImage := TQRImage(aHeader.Data);
      aReportImage.Picture.Assign(Nil);
      if not Cancel then
      begin
        if FGrid.ImageList <> Nil then
        begin
          iIndex := FGrid.ImageList.NameIndex(FGrid.Cell[DataCol, FCurrentBookmark]);
  		    if (iIndex >= 0) then
             aReportImage.Picture.Assign(FGrid.ImageList.Image[iIndex].Bitmap);
        end;
      end;
    end;

    procedure ShowCheck;
    begin
		  aReportImage := TQRImage(aHeader.Data);
      if Cancel then
         aReportImage.Picture.Assign(Nil)
      else
      begin
        if (VarType(FGrid.Cell[DataCol, FCurrentBookmark]) = varEmpty) then
           aReportImage.Picture.Assign(FUncheckedBitmap)
        else if (FGrid.CellCheckBoxState[DataCol, FCurrentBookmark] = cbChecked) then
           aReportImage.Picture.Assign(FCheckedBitmap)
        else
           aReportImage.Picture.Assign(FUncheckedBitmap);
      end;
    end;

    procedure ShowLabel;
    begin
			aReportLabel := TQRLabel(aHeader.Data);
      if FGrid.PrintWithGridFormats then
         ApplyFormat(aReportLabel);

      if Cancel then
         aReportLabel.Caption := ''
      else
         aReportLabel.Caption := FGrid.Cell[DataCol, FCurrentBookmark];
      if FGrid.Col[DataCol].PrintTotals then
         IncrementColumnTotal(DataCol, aReportLabel);
    end;

    procedure ShowRichText;
    begin
			aReportRichText := TQRRichText(aHeader.Data);
      if Cancel then
         RichEdit1.Text := ''
      else
         RichEdit1.Text := FGrid.Cell[DataCol, FCurrentBookmark];
    end;

    procedure PrintRow;
    var i : Integer;
        aColumn : TtsCol;
    begin
      Inc(FRecCnt);
      bnDetail.Height := FDetailHeight;
      i := 1;
      while (i <= FMaxCols) do
      begin
        aColumn := FGrid.Col[FGrid.DataColnr[i]];
        if aColumn.Visible and
           (((aColumn.Selected) and (FGrid.ColSelectMode = csMulti)) or
            (FGrid.ColSelectMode = csNone) or (FGrid.SelectedCols.Count = 0))  then
        begin
          // Cancel Print Cell?
          Cancel := False;
          FGrid.DoPrintCell(i, FCurrentBookmark, Cancel);

          DataCol := aColumn.DataCol;
          aHeader := FGrid.Col[DataCol];
          if TObject(aHeader.Data) is TQRRichText then
             ShowRichText
          else
          begin
            if (aHeader.Data <> Nil) then
            begin
              case aHeader.ControlType of    //
                ctPicture : ShowImage;
                ctCheck   : ShowCheck;
              else
                ShowLabel;
              end;    // case              
            end;    // if
          end;
        end;
        Inc(i);
      end;
    end;

begin
  if (FGrid <> Nil) and
     (FRow <= FGrid.Rows) then
  begin
    MoreData := True;

    FGrid.DataSource.DataSet.Bookmark := FBookmarks.Strings[FRow-1];
    FCurrentBookmark := FGrid.DataSource.DataSet.Bookmark;

    if FGrid.RowVisible[FCurrentBookmark] then
    begin
      // Cancel Print Row?
      Cancel := False;
      FGrid.DoPrintRow(FCurrentBookmark, Cancel);
      if not Cancel then
      begin
        if (FGrid.GridReport.PrintLineMode = lmBanded) and
           (FGrid.GridReport.PrintBandColor <> clNone) then
        begin
          if bnDetail.Color = FDetailColor then
             bnDetail.Color := clWhite
          else
             bnDetail.Color := FDetailColor;
        end;
        PrintRow;
        Inc(FRowCount);
      end
      else
        bnDetail.Height := 0;
      if (FRow = FGrid.Rows) and
         (FGrid.PrintTotals) then
         ShowReportTotals;
    end;
  end;
  Inc(FRow);
  laRecordCount.Caption := IntToStr(FRowCount) + ' Records ';
end;

procedure TfmPrintDbGrid.FormDestroy(Sender: TObject);
begin
  FcellDrawInfo.Font.Free;
  FCheckedBitmap.Free;
  FUnCheckedBitmap.Free;
  Initialize;
  FControls.Free;
  FTotalControls.Free;
  FBookmarks.Free;
  FGrid := Nil;
end;

procedure TfmPrintDbGrid.FormCreate(Sender: TObject);
begin
  FCheckedBitmap := TBitmap.Create;
  FUnCheckedBitmap := TBitmap.Create;
  ilImages.GetBitmap(1, FCheckedBitmap);
  ilImages.GetBitmap(0, FUnCheckedBitmap);
  FControls := TList.Create;
  FTotalControls := TList.Create;
end;

procedure TfmPrintDbGrid.qrGridAfterPrint(Sender: TObject);
begin
  FRow := 1;
  FRowCount := 0;
end;

procedure TfmPrintDbGrid.qrGridAfterPreview(Sender: TObject);
begin
  FRow := 1;
  FRowCount := 0;
end;

procedure TfmPrintDbGrid.qrGridBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ConfigureColumns(FGrid);
  if (FGrid.DataSource.DataSet.RecordCount > 0) then
     LoadBookmarks;
  PrintReport := (FGrid.Rows > 0);
  FRow := 1;
  FRowCount := 0;
end;

procedure TosReportTotal.ShowTotal;
begin
  try
    case FDataType of
      ftInteger  : FLabel.Caption := IntToStr(Round(FTotal));
      ftFloat    : FLabel.Caption := FormatFloat('#,##0.00;(#,##0.00)', FTotal);
      ftCurrency : FLabel.Caption := FormatFloat(CurrencyString + '#'+ThousandSeparator+'##0'+DecimalSeparator+'00;(' + CurrencyString + '#'+ThousandSeparator+'##0'+DecimalSeparator+'00)', FTotal);
    end;
  except
  end;
end;

procedure TfmPrintDbGrid.SetGrid(aCustomDbGrid : TtsCustomDbGrid);
begin
  FGrid := TtsDbGrid(aCustomDbGrid);
end;

end.

