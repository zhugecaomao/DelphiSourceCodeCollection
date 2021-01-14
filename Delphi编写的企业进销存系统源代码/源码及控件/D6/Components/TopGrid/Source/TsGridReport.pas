unit TsGridReport;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
   db, dbtables, TsGrid, TsDbGrid, TsPrintGrid, tsPrintDbGrid;

type
    TosGridReport = class(TosCustomGridReport)
    private
    protected
      function PrintConfig(theGrid : TtsGrid) : Boolean; dynamic;
      function DbPrintConfig(theGrid : TtsDbGrid) : Boolean; dynamic;
    public
      constructor Create(aOwner : TComponent); override;
      destructor  Destroy; override;

      procedure Print(forGrid : TtsBaseGrid); override;
      procedure PrintPreview(forGrid : TtsBaseGrid); override;

      procedure PrintDataBoundGrid(theGrid : TtsDbGrid); dynamic;
      procedure PrintUnboundGrid(theGrid : TtsGrid); dynamic;
      procedure PreviewDataBoundGrid(theGrid : TtsDbGrid); dynamic;
      procedure PreviewUnboundGrid(theGrid : TtsGrid); dynamic;
    published
      property DateTimeLabel;
      property PageLabel;
      property PaperSize;
      property EndOfReportLabel;
      property RecordCountLabel;
      property TitleFont;
      property ShowDateTime;
      property ShowPageCount;
      property ShowEndOfReport;
      property ShowRecordCount;
      property ShowTitleSection;
      property ProvideGridMenu;
      property TitleImage;
      property MenuOptionsText;
      property ColumnSpacing;
      property Margins;
      property PrintLineMode;
      property PrintBandColor;
      property MinFontSize;
    end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TopGrid', [TosGridReport]);
end;

constructor TosGridReport.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);
end;

destructor  TosGridReport.Destroy;
begin
  if Assigned(fmPrintGrid) then
     FreeAndNil(fmPrintGrid);
  if Assigned(fmPrintDbGrid) then
     FreeAndNil(fmPrintDbGrid);
  inherited Destroy;
end;

procedure TosGridReport.Print(forGrid : TtsBaseGrid);
begin
  if forGrid is TtsGrid then
     PrintUnboundGrid(TtsGrid(forGrid))
  else
     PrintDataBoundGrid(TtsDbGrid(forGrid)); 
end;

procedure TosGridReport.PrintPreview(forGrid : TtsBaseGrid);
begin
  if forGrid is TtsDbGrid then
     PreviewDataBoundGrid(TtsDbGrid(forGrid))
  else
     PreviewUnboundGrid(TtsGrid(forGrid));
end;

function TosGridReport.DbPrintConfig(theGrid : TtsDbGrid) : Boolean;
var sTitle, sEndText : String;
    bCancel : Boolean;
    mode : TtsPrintMode;
begin
  Result := False;
  sEndText := '';  
  sTitle   := theGrid.PrintTitle;
  mode     := theGrid.PrintOrientation;
  bCancel  := False;
  if Assigned(theGrid.OnPrintGrid) then
     theGrid.OnPrintGrid(Self, bCancel, sTitle, sEndText, mode);
  if bCancel then exit;

  Result := True;
  if not Assigned(fmPrintDbGrid) then
     fmPrintDbGrid := TfmPrintDbGrid.Create(Self);
  fmPrintDbGrid.Title := sTitle;
  fmPrintDbGrid.EndofReportText := sEndText;
  fmPrintDbGrid.Orientation := Integer(mode);
  fmPrintDbGrid.SetGrid(theGrid);
end; 

function TosGridReport.PrintConfig(theGrid : TtsGrid) : Boolean;
var sTitle, sEndText : String;
    bCancel : Boolean;
    mode : TtsPrintMode;
begin
  Result := False;
  sEndText := '';
  sTitle := theGrid.PrintTitle;
  mode   := theGrid.PrintOrientation;
  if Assigned(theGrid.OnPrintGrid) then
     theGrid.OnPrintGrid(Self, bCancel, sTitle, sEndText, mode);

  if bCancel then exit;

  Result := True;
  if not Assigned(fmPrintGrid) then
     fmPrintGrid := TfmPrintGrid.Create(Self);
  fmPrintGrid.Title := sTitle;
  fmPrintGrid.EndofReportText := sEndText;
  fmPrintGrid.Orientation := Integer(mode);
  fmPrintGrid.SetGrid(theGrid);
end;

procedure TosGridReport.PreviewUnboundGrid(theGrid : TtsGrid);
var currRow : Integer;
begin
  currRow := theGrid.CurrentDataRow;
  if PrintConfig(theGrid) then
  begin
    fmPrintGrid.PreView;
    theGrid.CurrentDataRow := currRow;
    theGrid.CurrentCell.PutInView;
    if (theGrid.GridMode = gmListBox) then
       theGrid.SelectRows(theGrid.CurrentDataRow, theGrid.CurrentDataRow, True);
  end;
end;

procedure TosGridReport.PreviewDataBoundGrid(theGrid : TtsDbGrid);
var currBookmark : TBookmarkStr;
begin
  if (theGrid.DataSource = Nil) or
     (theGrid.DataSource.Dataset = Nil)  then
     raise Exception.Create('No active Dataset to Preview!');

  currBookmark := theGrid.DataSource.DataSet.Bookmark;
  if not DbPrintConfig(theGrid) then
     exit;
  try
    fmPrintDbGrid.PreView;
  except on E:Exception do
    raise Exception.Create('PrintPreview Error - ' + E.Message);
  end;
  theGrid.CurrentDataRow := currBookmark;
  theGrid.CurrentCell.PutInView;
  if (theGrid.GridMode = gmListBox) then
     theGrid.SelectRows(theGrid.CurrentDataRow, theGrid.CurrentDataRow, True);
end;

procedure TosGridReport.PrintUnboundGrid(theGrid : TtsGrid);
var currRow : Integer;
begin
  currRow := theGrid.CurrentDataRow;
  if PrintConfig(theGrid) then
  begin
    fmPrintGrid.Print;
    theGrid.CurrentDataRow := currRow;
    theGrid.CurrentCell.PutInView;
    if (theGrid.GridMode = gmListBox) then
       theGrid.SelectRows(theGrid.CurrentDataRow, theGrid.CurrentDataRow, True);
  end;
end;

procedure TosGridReport.PrintDataBoundGrid(theGrid : TtsDbGrid);
var currBookmark : TBookmarkStr;
begin
  if (theGrid.DataSource = Nil) or
     (theGrid.DataSource.Dataset = Nil)  then
     raise Exception.Create('No active Dataset to Preview!');

  currBookmark := theGrid.DataSource.DataSet.Bookmark;
  if not DbPrintConfig(theGrid) then
     exit;
  try
    fmPrintDbGrid.Print;
  except on E:Exception do
    raise Exception.Create('PrintPreview Error - ' + E.Message);
  end;
  theGrid.CurrentDataRow := currBookmark;
  theGrid.CurrentCell.PutInView;
  if (theGrid.GridMode = gmListBox) then
     theGrid.SelectRows(theGrid.CurrentDataRow, theGrid.CurrentDataRow, True);
end; 

end.
 