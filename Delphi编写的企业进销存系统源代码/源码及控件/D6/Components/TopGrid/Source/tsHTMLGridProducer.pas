{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid HTML Grid Producer                      }
{                                                       }
{       Copyright (c) 1997 - 2001, ObjectSight          }
{                                                       }
{*******************************************************}

unit tsHTMLGridProducer;

interface

{$INCLUDE TSCmpVer}

uses
  Windows, Messages, SysUtils, Classes, StdCtrls, Graphics, Controls, Forms, Dialogs,
  HTTPApp, DbWeb, TsGrid, TsDbGrid, TsCommon
  {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TtsCustomHTMLGridProducer = class;

  TtsHTMLTableAttributes = class(TPersistent)
  private
    FBorder      : Integer;
    FCellPadding : Integer;
    FCellSpacing : Integer;
    FCustom      : String;
    FFrame       : String;
    FImageFilePath : String;
    FBorderColor : TColor;

  protected
  public
    constructor Create(Producer: TtsCustomHTMLGridProducer);
  published
    property Border: Integer read FBorder write FBorder;
    property BorderColor : TColor read FBorderColor write FBorderColor default clNone;
    property CellPadding: Integer read FCellPadding write FCellPadding;
    property CellSpacing: Integer read FCellSpacing write FCellSpacing;
    property Custom: String read FCustom write FCustom;
    property Frame: String read FFrame write FFrame;
    property ImageFilePath: String read FImageFilePath write FImageFilePath;
  end;

  TtsCustomHTMLGridProducer = class(TCustomContentProducer)
  private
    FGrid : TtsBaseGrid;
    FHeader: TStrings;
    FFooter: TStrings;
    FMaxRows : Integer;
    FDrawInfo : TtsDrawInfo;
    FTableAttributes: TtsHTMLTableAttributes;
    FOnCreateContent : TCreateContentEvent;
  protected
    procedure SetHeader(Value : TStrings);
    procedure SetFooter(Value : TStrings);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetTableAttributes(Value: TtsHTMLTableAttributes);
    function DoCreateContent: Boolean;
    function GenerateHTMLTable : String;
    function HeadingHTML : String;

    property DrawInfo: TtsDrawInfo read FDrawInfo write FDrawInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Content : String; override;

    function GridFontName : String;
    function GridWidth(aGrid : TtsBaseGrid) : Integer;
    function HTMLFont(aGrid : TtsBaseGrid) : String;
    function GridFontColor : TColor;
    function GridColor : TColor;
    function GridHeadingColor : TColor;
    function GridHeadingFontColor : TColor;
    function GridHeadingFont : TFont;
    function GridCols : Integer;
    function GridHeadingHeight : Integer;
    function CellFont(dataCol : Integer; dataRow : Variant) : TFont;
    function CellFontName(dataCol : Integer; dataRow : Variant) : String;
    function CellFontColor(dataCol : Integer; dataRow : Variant) : TColor;
    function CellColor(dataCol : Integer; dataRow : Variant) : TColor;
    procedure ConfigDrawInfo;
    function TextCellHTML(iCol : Integer; dataRow : Variant) : String;
    function HTMLHeader(aCol : TtsCol) : String;
    function HTMLCell(aCol : TtsCol; forValue : String) : String;
    function ImageCellHTML(iCol : Integer; dataRow : Variant) : String;
    function CheckCellHTML(iCol : Integer; dataRow : Variant) : String;
    function AdjustCellFormat(sHTML : String; dataCol : Integer; dataRow : Variant) : String;
    function AdjustCellFormatForDrawInfo(sHTML : String) : String;
        
    property Grid: TtsBaseGrid read FGrid write FGrid;
    property Header: TStrings read FHeader write SetHeader;
    property MaxRows: Integer read FMaxRows write FMaxRows default 100;
    property Footer: TStrings read FFooter write SetFooter;
    property TableAttributes: TtsHTMLTableAttributes read FTableAttributes write SetTableAttributes;

    property OnCreateContent: TCreateContentEvent read FOnCreateContent write FOnCreateContent;
  end;

  TtsHTMLGridProducer = class(TtsCustomHTMLGridProducer)
  published
    property Grid;
    property Header;
    property MaxRows;
    property Footer;
    property TableAttributes;

    property OnCreateContent;
  end;

const
    StsHTMLFontStyle = ' style="font-family: ''FONTNAME''; font-size: FNSIZE; background: BGCOLOR; color: FNCOLOR; font-weight: FNBOLD; height: HDHEIGHTpx;"';
    StsHTMLTable     = '<Table cellspacing=CELLSPACE cellpadding=CELLPAD border="BORDERWIDTH" bordercolor= "BORDERCOLOR" frame="TABFRAME" width=TABWIDTH FONTSTYLE>';
    StsHTMLCellStyle = ' style="background-color: BGCOLOR; color: FNCOLOR;"';

function TranslateColor(aColor : TColor) : TColor;
function ColorToHex(Color: TColor): string;

//procedure Register;

implementation

{$R *.dcr}

{procedure Register;
begin
  RegisterComponents('TopGrid', [TtsHTMLGridProducer]);
end; }

function ColorToHex(Color: TColor): string;
var r,g,b: byte;
begin
  r:=GetRValue(Integer(Color));
  g:=GetGValue(Integer(Color));
  b:=GetBValue(Integer(Color));
  Result:=IntToHex(r,2)+IntToHex(g,2)+IntToHex(b,2);
end;

function TranslateColor(aColor : TColor) : TColor;
begin
  Result := aColor;
  case aColor of    //
    clBackGround    : Result := clAqua;
    clBtnFace       : Result := clSilver;
    clActiveCaption : Result := clBlack;
    clInActiveCaption : Result := clBlue;
    clMenu            : Result := clDkGray;
    clWindow          : Result := clWhite;
    clWindowFrame     : Result := clGray;
    clMenuText        : Result := clGreen ;
    clWindowText      : Result := clBlack;
    clCaptionText     : Result := clLtGray ;
    clActiveBorder    : Result := clMaroon;
    clInactiveBorder  : Result := clNavy;
    clAppWorkSpace    : Result := clOlive;
    clHighlight       : Result := clPurple;
    clHighlightText    : Result := clRed;
    clBtnShadow       : Result := clTeal;
    clGrayText        : Result := clWhite;
    clBtnText         : Result := clBlack;
    clInactiveCaptionText  : Result := clYellow;
    clBtnHighlight    : Result := clYellow;
    cl3DdkShadow      : Result := clYellow;
    cl3DLight         : Result := clYellow;
    clInfoText        : Result := clYellow;
    clInfoBk          : Result := clYellow;
  end;    // case
end;

  { TtsHTMLTableAttributes }
constructor TtsHTMLTableAttributes.Create(Producer: TtsCustomHTMLGridProducer);
begin
  inherited Create;
  FBorder := -1;
  FCellPadding := -1;
  FCellSpacing := -1;
  FFrame := 'border';
  FBorderColor := clNone;
end;

  { TtsHTMLGridProducer }
constructor TtsCustomHTMLGridProducer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFooter := TStringList.Create;
  FHeader := TStringList.Create;
  FTableAttributes := TtsHTMLTableAttributes.Create(Self);
  FDrawInfo.Font := TFont.Create;
end;

destructor TtsCustomHTMLGridProducer.Destroy;
begin
  FFooter.Free;
  FHeader.Free;
  FTableAttributes.Free;
  FDrawInfo.Font.Free;
  inherited Destroy;
end;

procedure TtsCustomHTMLGridProducer.SetHeader(Value : TStrings);
begin
  FHeader.Assign(Value);
end;

procedure TtsCustomHTMLGridProducer.SetFooter(Value : TStrings);
begin
  FFooter.Assign(Value);
end;

procedure TtsCustomHTMLGridProducer.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent = FGrid) and (FGrid <> nil) then
       FGrid := Nil;
  end;
end;

procedure TtsCustomHTMLGridProducer.SetTableAttributes(Value: TtsHTMLTableAttributes);
begin
  FTableAttributes.Assign(Value);
end;

function TtsCustomHTMLGridProducer.Content: string;
begin
  Result := '';
  if (FGrid <> nil) then
  begin
    if DoCreateContent then
       Result := FHeader.Text + GenerateHTMLTable + FFooter.Text;
  end;
end;

function TtsCustomHTMLGridProducer.GridFontName : String;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).Font.Name
  else
     Result := TtsDbGrid(FGrid).Font.Name;
end;

function TtsCustomHTMLGridProducer.GridColor : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).Color
  else
     Result := TtsDbGrid(FGrid).Color;
end;

function TtsCustomHTMLGridProducer.GridFontColor : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).Font.Color
  else
     Result := TtsDbGrid(FGrid).Font.Color;
end;

function TtsCustomHTMLGridProducer.GridHeadingColor : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).HeadingColor
  else
     Result := TtsDbGrid(FGrid).HeadingColor;
end;

function TtsCustomHTMLGridProducer.GridHeadingFontColor : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).HeadingFont.Color
  else
     Result := TtsDbGrid(FGrid).HeadingFont.Color;
end;

function TtsCustomHTMLGridProducer.GridHeadingFont : TFont;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).HeadingFont
  else
     Result := TtsDbGrid(FGrid).HeadingFont;
end;

function TtsCustomHTMLGridProducer.GridCols : Integer;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).Cols
  else
     Result := TtsDbGrid(FGrid).Cols;
end;

function TtsCustomHTMLGridProducer.GridHeadingHeight : Integer;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).HeadingHeight
  else
     Result := TtsDbGrid(FGrid).HeadingHeight;
end;

function TtsCustomHTMLGridProducer.CellFont(dataCol : Integer; dataRow : Variant) : TFont;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).CellFont[dataCol, dataRow]
  else
     Result := TtsDbGrid(FGrid).CellFont[dataCol, dataRow];
end;

function TtsCustomHTMLGridProducer.CellFontName(dataCol : Integer; dataRow : Variant) : String;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).CellFont[dataCol, dataRow].Name
  else
     Result := TtsDbGrid(FGrid).CellFont[dataCol, dataRow].Name;
end;

function TtsCustomHTMLGridProducer.CellColor(dataCol : Integer; dataRow : Variant) : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).CellColor[dataCol, dataRow]
  else
     Result := TtsDbGrid(FGrid).CellColor[dataCol, dataRow];
end;

function TtsCustomHTMLGridProducer.CellFontColor(dataCol : Integer; dataRow : Variant) : TColor;
begin
  if FGrid is TtsGrid then
     Result := TtsGrid(FGrid).CellFont[dataCol, dataRow].Color
  else
     Result := TtsDbGrid(FGrid).CellFont[dataCol, dataRow].Color;
end;

function TtsCustomHTMLGridProducer.DoCreateContent: Boolean;
begin
  Result := True;
  if Assigned(FOnCreateContent) then
     FOnCreateContent(Self, Result);
end;

procedure TtsCustomHTMLGridProducer.ConfigDrawInfo;
begin
  FDrawInfo.Color := GridColor;
  FDrawInfo.Font.Color := GridFontColor;
  FDrawInfo.Font.Name := GridFontName;
end;

function TtsCustomHTMLGridProducer.CheckCellHTML(iCol : Integer; dataRow : Variant) : String;
var sChecked, sCloseP : String;
    theCol : TtsCol;
begin
  Result := '<td>';
  sChecked := '';
  sCloseP := '';
  if FGrid is TtsGrid then
  begin
    theCol := TtsGrid(FGrid).Col[iCol];
    if TtsGrid(FGrid).CellCheckBoxState[iCol, dataRow] = cbChecked then
       sChecked := 'Checked';
  end
  else
  begin
    theCol := TtsDbGrid(FGrid).Col[iCol];
    if (VarToStr(TtsDbGrid(FGrid).Cell[iCol, dataRow]) <> '') and
       (VarToStr(TtsDbGrid(FGrid).Cell[iCol, dataRow]) <> '0') then
       sChecked := 'Checked';
  end;
  if theCol.Alignment = taCenter then
  begin
     Result := Result + '<p align="center">';
     sCloseP := '</p>';
  end
  else if theCol.Alignment = taRightJustify then
  begin
     Result := Result + '<p align="right">';
     sCloseP := '</p>';
  end;
  Result := Result + '<input type="Checkbox" ' + sChecked + ' ReadOnly>' + sCloseP + '</td>';
end;

function TtsCustomHTMLGridProducer.ImageCellHTML(iCol : Integer; dataRow : Variant) : String;
var sCloseP, cellValue : String;
    theCol : TtsCol;
begin
  // Cell Value will be the name of the image within the ImageList, we use
  // this to build up and use a similar image file .jpg in the image folder...
  Result := '<td>';
  sCloseP := '';
  if FGrid is TtsGrid then
  begin
    theCol := TtsGrid(FGrid).Col[iCol];
    cellValue := TtsGrid(FGrid).Cell[iCol, dataRow];
  end
  else
  begin
    theCol := TtsDbGrid(FGrid).Col[iCol];
    cellValue := VarToStr(TtsDbGrid(FGrid).Cell[iCol, dataRow]);
  end;
  if TAlignment(theCol.Alignment) = taCenter then
  begin
     Result := Result + '<p align="center">';
     sCloseP := '</p>';
  end
  else if TAlignment(theCol.Alignment) = taRightJustify then
  begin
     Result := Result + '<p align="right">';
     sCloseP := '</p>';
  end;
  if cellValue <> '' then
  begin
    Result := Result + '<img src="' + Self.TableAttributes.ImageFilePath +
               cellValue + '.jpg" border="0" alt="">' + sCloseP + '</td>';
  end;
end;

function TtsCustomHTMLGridProducer.HTMLHeader(aCol : TtsCol) : String;
  function AlignString : String;
  var useHorzAlignment : TtsHorzAlignment;
  begin
    if aCol.HeadingHorzAlignment = htaDefault then
    begin
      if (aCol is TtsDbCol) then
         useHorzAlignment := TtsDbGrid(TtsDbCol(aCol).Grid).HeadingHorzAlignment
      else
         useHorzAlignment := TtsGrid(aCol.Grid).HeadingHorzAlignment;
    end
    else
       useHorzAlignment := aCol.HeadingHorzAlignment;
    Result := ' align="' + 'left' + '">';
    case useHorzAlignment of    //
      htaLeft, htaDefault    : Result := '>';
      htaCenter  : Result := ' align="' + 'center' + '">';
      htaRight   : Result := ' align="' + 'right' + '">';
    end;    // case
  end;
begin
  Result := '<th width=' + IntToStr(aCol.Width) + AlignString + aCol.Heading + '</th>';
end;

function TtsCustomHTMLGridProducer.HTMLCell(aCol : TtsCol; forValue : String) : String;
  function AlignString : String;
  var useHorzAlignment : TtsHorzAlignment;
  begin
    if aCol.HorzAlignment = htaDefault then
    begin
      if (aCol is TtsDbCol) then
         useHorzAlignment := TtsDbGrid(TtsDbCol(aCol).Grid).HorzAlignment
      else
         useHorzAlignment := TtsGrid(aCol.Grid).HorzAlignment;
    end
    else
       useHorzAlignment := aCol.HorzAlignment;
    Result := ' align="' + 'left' + '">';
    case useHorzAlignment of    //
      htaLeft, htaDefault : Result := '>';
      htaCenter      : Result := ' align="' + 'center' + '">';
      htaRight       : Result := ' align="' + 'right' + '">';
    end;    
  end;
begin
  Result := '<td' + AlignString + forValue + '</td>';
end;

function TtsCustomHTMLGridProducer.TextCellHTML(iCol : Integer; dataRow : Variant) : String;
var sHTML : String;
    theCol : TtsCol;
begin
  if FGrid is TtsGrid then
  begin
    theCol := TtsGrid(FGrid).Col[iCol];
    sHtml := HTMLCell(theCol, TtsGrid(FGrid).Cell[iCol, dataRow]);
    if Assigned(TtsGrid(FGrid).OnGetDrawInfo) then
    begin
      ConfigDrawInfo;
      TtsGrid(FGrid).OnGetDrawInfo(TtsGrid(FGrid), iCol, dataRow, FDrawInfo);
      sHTML := AdjustCellFormatForDrawInfo(sHTML);
    end
    else
      sHTML := AdjustCellFormat(sHTML, iCol, dataRow);
  end
  else
  begin
    theCol := TtsDbGrid(FGrid).Col[iCol];
    sHtml := HTMLCell(theCol, TtsDbGrid(FGrid).Cell[iCol, dataRow]);
    if Assigned(TtsDbGrid(FGrid).OnGetDrawInfo) then
    begin
      ConfigDrawInfo;
      TtsDbGrid(FGrid).OnGetDrawInfo(TtsDbGrid(FGrid), iCol, dataRow, FDrawInfo);
      sHTML := AdjustCellFormatForDrawInfo(sHTML);
    end
    else
      sHTML := AdjustCellFormat(sHTML, iCol, dataRow);
  end;
  Result := sHTML;
end;

function TtsCustomHTMLGridProducer.AdjustCellFormat(sHTML : String; dataCol : Integer; dataRow : Variant) : String;
var sColorHTML, sFontHTML : String;
begin
  Result := sHTML;
  sColorHTML := ''; sFontHTML := '';
  if ((CellColor(dataCol, dataRow) <> clNone) and
      (CellColor(dataCol, dataRow) <> GridColor)) then
     sColorHTML := ' background-color: ' + ColorToHex(TranslateColor(CellColor(dataCol, dataRow))) + ';';
  if (CellFont(dataCol, dataRow) <> Nil) then
  begin
    if CellFontColor(dataCol, dataRow) <> GridColor then
       sFontHTML := ' color: ' + ColorToHex(TranslateColor(CellFontColor(dataCol, dataRow))) + ';';
    if (CellFontName(dataCol, dataRow) <> '') and
       (CellFontName(dataCol, dataRow) <> GridFontName) then
       sFontHTML := sFontHTML + ' font-family: ' + CellFontName(dataCol, dataRow) + ';';
  end;
  if (Length(sColorHTML) > 0) or
     (Length(sFontHTML) > 0) then
     Insert(' style=' + '"' + sColorHTML + sFontHTML + '"', Result, 4);
end;

function TtsCustomHTMLGridProducer.AdjustCellFormatForDrawInfo(sHTML : String) : String;
var sColorHTML, sFontHTML : String;
begin
  Result := SHTML;
  sColorHTML := ''; sFontHTML := '';
  if ((DrawInfo.Color <> clNone) and
      (DrawInfo.Color <> clBlack) and
      (DrawInfo.Color <> GridColor)) then
      sColorHTML := ' background-color: ' + ColorToHex(TranslateColor(DrawInfo.Color)) + ';';
  if (DrawInfo.Font.Color <> clBlack) and
     (DrawInfo.Font.Color <> clNone) and
     (DrawInfo.Font.Color <> GridFontColor) then
     sFontHTML := ' color: ' + ColorToHex(TranslateColor(DrawInfo.Font.Color)) + ';';
  if (DrawInfo.Font.Name <> '') and
     (DrawInfo.Font.Name <> GridFontName) then
     sFontHTML := sFontHTML + ' font-family: ' + DrawInfo.Font.Name + ';';
  if (Length(sColorHTML) > 0) or
     (Length(sFontHTML) > 0) then
     Insert(' style=' + '"' + sColorHTML + sFontHTML + '"', Result, 4);
end;

function TtsCustomHTMLGridProducer.HeadingHTML : String;
var sColor, sFontColor : String;
    iCol : Integer;
begin
  sColor     := ColorToHex(TranslateColor(GridHeadingColor));
  sFontColor := ColorToHex(TranslateColor(GridHeadingFontColor));
  Result := Result + '<tr style="line-height: ' + IntToStr(GridHeadingHeight) + 'px; background-color=' + sColor + '; color=' + sFontColor;
  if (GridHeadingFont <> Nil) then
  begin
    if (GridHeadingFont.Name <> GridFontName) then
       Result := Result + '; font-family=' + GridHeadingFont.Name;
    if (fsBold in GridHeadingFont.Style) then
       Result := Result + '; font-weight : bold';
    if (fsItalic in GridHeadingFont.Style) then
       Result := Result + '; font-style : italic';
  end;

  Result := Result + '">' + #10#13;
  for iCol := 1 to GridCols do
    if (FGrid is TtsGrid) and
       (TtsGrid(FGrid).Col[TtsGrid(FGrid).DataColnr[iCol]].Visible) then
       Result := Result + HTMLHeader(TtsGrid(FGrid).Col[TtsGrid(FGrid).DataColnr[iCol]])
    else if (FGrid is TtsDbGrid) and
            (TtsDbGrid(FGrid).Col[TtsDbGrid(FGrid).DataColnr[iCol]].Visible) then
       Result := Result + HTMLHeader(TtsDbGrid(FGrid).Col[TtsDbGrid(FGrid).DataColnr[iCol]]);
  Result := Result + #10#13;
end;

function TtsCustomHTMLGridProducer.GridWidth(aGrid : TtsBaseGrid) : Integer;
var i : Integer;
begin
  Result := 0;
  if aGrid is TtsGrid then
  begin
    for i := 1 to TtsGrid(aGrid).Cols do
      if TtsGrid(aGrid).Col[i].Visible then
         Result := Result + TtsGrid(aGrid).Col[i].Width;
  end
  else
  begin
    for i := 1 to TtsDbGrid(aGrid).Cols do
      if TtsDbGrid(aGrid).Col[i].Visible then
         Result := Result + TtsDbGrid(aGrid).Col[i].Width;
  end;
end;

function TtsCustomHTMLGridProducer.HTMLFont(aGrid : TtsBaseGrid) : String;
begin
  Result := StsHTMLFontStyle;
  if aGrid is TtsGrid then
  begin
    Result := StringReplace(Result, 'FONTNAME', TtsGrid(aGrid).Font.Name, []);
    Result := StringReplace(Result, 'BGCOLOR', ColorToHex(TranslateColor(TtsGrid(aGrid).Color)), []);
    Result := StringReplace(Result, 'FNCOLOR', ColorToHex(TranslateColor(TtsGrid(aGrid).Font.Color)), []);
    Result := StringReplace(Result, 'FNSIZE', IntToStr(TtsGrid(aGrid).Font.Size), []);
    if fsBold in TtsGrid(aGrid).Font.Style then
       Result := StringReplace(Result, 'FNBOLD', 'BOLD', [])
    else
       Result := StringReplace(Result, 'FNBOLD', 'NORMAL', []);
    Result := StringReplace(Result, 'HDHEIGHT', IntToStr(TtsGrid(aGrid).HeadingHeight), []);
  end
  else
  begin
    Result := StringReplace(Result, 'FONTNAME', TtsDbGrid(aGrid).Font.Name, []);
    Result := StringReplace(Result, 'BGCOLOR', ColorToHex(TranslateColor(TtsDbGrid(aGrid).Color)), []);
    Result := StringReplace(Result, 'FNCOLOR', ColorToHex(TranslateColor(TtsDbGrid(aGrid).Font.Color)), []);
    Result := StringReplace(Result, 'FNSIZE', IntToStr(TtsDbGrid(aGrid).Font.Size), []);
    if fsBold in TtsDbGrid(aGrid).Font.Style then
       Result := StringReplace(Result, 'FNBOLD', 'BOLD', [])
    else
       Result := StringReplace(Result, 'FNBOLD', 'NORMAL', []);
    Result := StringReplace(Result, 'HDHEIGHT', IntToStr(TtsDbGrid(aGrid).HeadingHeight), []);
  end;
end;

function TtsCustomHTMLGridProducer.GenerateHTMLTable : String;
var iRow, iCol, currRow, theRow : Integer;
    theCol : TtsCol;
    currBookmark : String;
begin
  if FGrid <> Nil then
  begin
    Result := StsHTMLTable + #10#13;
    Result := StringReplace(Result, 'CELLSPACE', IntToStr(Self.FTableAttributes.CellSpacing), []);
    Result := StringReplace(Result, 'CELLPAD', IntToStr(Self.FTableAttributes.CellPadding), []);
    Result := StringReplace(Result, 'BORDERWIDTH', IntToStr(Self.FTableAttributes.Border), []);
    if Self.FTableAttributes.BorderColor = clNone then
       Result := StringReplace(Result, 'BORDERCOLOR', 'Black', [])
    else
       try
         Result := StringReplace(Result, 'BORDERCOLOR', ColorToHex(TranslateColor(FTableAttributes.BorderColor)), []);
       except on E:Exception do
         MessageDlg('Invalid BorderColor generating grid HTML : ', mtWarning, [mbOk], 0);
       end;
    Result := StringReplace(Result, 'TABFRAME', Self.FTableAttributes.Frame, []);
    Result := StringReplace(Result, 'TABWIDTH', IntToStr(Round(GridWidth(FGrid)*1.1)), []);
    Result := StringReplace(Result, 'FONTSTYLE', HTMLFont(FGrid), []);
    Result := Result + HeadingHTML;
    
    if FGrid is TtsDbGrid then
    begin
      FGrid.BeginUpdate;
      currBookmark := TtsDbGrid(FGrid).CurrentDataRow;
      try
        with TtsDbGrid(FGrid).DataSource.DataSet do
        begin
          First;
          // Now proceed thru all records in the dataset...
          while not eof do
          begin
            Result := Result + '<tr style="line-height: ' + IntToStr(TtsDbGrid(FGrid).DefaultRowHeight) + 'px';
            if TtsDbGrid(FGrid).RowColor[Bookmark] <> clNone then
               Result := Result + '; background-color=' + ColorToHex(TranslateColor(TtsDbGrid(FGrid).RowColor[Bookmark]));
            if TtsDbGrid(FGrid).RowFont[Bookmark] <> Nil then
            begin
               Result := Result + '; font: ';
               if fsBold in TtsDbGrid(FGrid).RowFont[Bookmark].Style then
                  Result := Result + ' bold ';
               if fsItalic in TtsDbGrid(FGrid).RowFont[Bookmark].Style then
                  Result := Result + ' italic ';
               Result := Result + TtsDbGrid(FGrid).RowFont[Bookmark].Name;
               if (TtsDbGrid(FGrid).RowFont[Bookmark].Color <> clNone) then
                  Result := Result + '; color: ' + ColorToHex(TranslateColor(TtsDbGrid(FGrid).RowFont[Bookmark].Color));
            end;
            Result := Result + '">' + #10#13;
            for iCol := 1 to TtsDbGrid(FGrid).Cols do
            begin
              theCol := TtsDbGrid(FGrid).Col[TtsDbGrid(FGrid).DataColnr[iCol]];
              if theCol.Visible then
              begin
                if theCol.ControlType = ctPicture then
                   Result := Result + ImageCellHTML(TtsDbGrid(FGrid).DataColnr[iCol], TtsDbGrid(FGrid).CurrentDataRow)
                else if theCol.ControlType = ctCheck then
                   Result := Result + CheckCellHTML(TtsDbGrid(FGrid).DataColnr[iCol], TtsDbGrid(FGrid).CurrentDataRow)
                else
                   Result := Result + TextCellHTML(TtsDbGrid(FGrid).DataColnr[iCol], TtsDbGrid(FGrid).CurrentDataRow);
              end;
            end;
            Next;
            Result := Result + '</tr>' + #10#13;
          end;    // while
        end;
      finally
        TtsDbGrid(FGrid).CurrentDataRow := currBookmark;
        FGrid.EndUpdate;
      end;
    end
    else
    begin
      currRow := TtsGrid(FGrid).CurrentDataRow;
      FGrid.BeginUpdate;
      try
      with TtsGrid(FGrid) do
      begin
        for iRow := 1 to Rows do    // Iterate
        begin
          theRow := TtsGrid(FGrid).DataRownr[iRow];
          if TtsGrid(FGrid).RowVisible[theRow] then
          begin
            Result := Result + '<tr style="line-height: ' + IntToStr(TtsGrid(FGrid).DefaultRowHeight) + 'px';
            if TtsGrid(FGrid).RowColor[theRow] <> clNone then
               Result := Result + '; background-color=' + ColorToHex(TranslateColor(TtsGrid(FGrid).RowColor[theRow]));
            if TtsGrid(FGrid).RowFont[theRow] <> Nil then
            begin
               Result := Result + '; font: ';
               if fsBold in TtsGrid(FGrid).RowFont[theRow].Style then
                  Result := Result + ' bold ';
               if fsItalic in TtsGrid(FGrid).RowFont[theRow].Style then
                  Result := Result + ' italic ';
               Result := Result + TtsGrid(FGrid).RowFont[theRow].Name;
               if (TtsGrid(FGrid).RowFont[theRow].Color <> clNone) then
                  Result := Result + '; color: ' + ColorToHex(TranslateColor(TtsGrid(FGrid).RowFont[theRow].Color));
            end;
            Result := Result + '">' + #10#13;
            for iCol := 1 to TtsGrid(FGrid).Cols do
            begin
              theCol := TtsGrid(FGrid).Col[TtsGrid(FGrid).DataColnr[iCol]];
              if theCol.Visible then
              begin
                if theCol.ControlType = ctPicture then
                   Result := Result + ImageCellHTML(TtsGrid(FGrid).DataColnr[iCol], theRow)
                else if theCol.ControlType = ctCheck then
                   Result := Result + CheckCellHTML(TtsGrid(FGrid).DataColnr[iCol], theRow)
                else
                   Result := Result + TextCellHTML(TtsGrid(FGrid).DataColnr[iCol], theRow);
              end;
            end;
            Result := Result + '</tr>' + #10#13;
          end;
        end;    // for
      end;
      finally
        TtsGrid(FGrid).CurrentDataRow := currRow;
        FGrid.EndUpdate;
      end;
    end;
  end; // if
  Result := Result + '</table>';
end;

end.
