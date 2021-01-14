{*******************************************************}
{                                                       }
{       Top Support Delphi Library                      }
{       TopGrid cell text drawing routines              }
{                                                       }
{       Copyright (c) 1997 - 1999, Top Support          }
{                                                       }
{*******************************************************}

unit TSGLib;

interface

uses
    Windows, SysUtils, Graphics, Classes, TSSetLib, TSCommon;

const
    RIGHT_PRINT_MARGIN = 1;

function  IsSpaceChar(PText: PChar; Index: Integer) : Boolean;
function  IsTextChar(PText: PChar; Index: Integer) : Boolean;
function  NextWordCount(PText : PChar; Offset : Integer) : Integer;
function  PrevWordCount(PText : PChar; Offset : Integer) : Integer;
function  IsLeadByte(Key: Char): Boolean;
function  StrRNSpaceScan(Text : PChar; Chars : Cardinal) : PChar;
function  StrNSkipSpace(Text: PChar; Chars: Cardinal): PChar;
function  StrRNTextScan(Text : PChar; Chars : Cardinal) : PChar;
function  StrNScanEol(Text: PChar; Chars: Integer): PChar;
function  LastCharIsEofLine(PText : PChar; Offset : Integer) : Boolean;
procedure GetPrintCharWidth(Canvas : TCanvas; Metric: TTextMetric; Text : PChar;
                            Chars : Integer; MultiLine : Boolean; WithOverhang: Boolean; var Width : Integer);
function  IsMultiLineText(RowHeight : Integer; TextHeight : Integer) : Boolean;
procedure PCountChars(Text: PChar; MaxChars, TextLen: Integer; var CharCount, ByteCount: Integer; Reverse: Boolean);
function  PCharToByteLen(Text: PChar; MaxChars, TextLen: Integer; Reverse: Boolean): Integer;
function  PByteToCharLen(Text: PChar; MaxLen, TextLen: Integer): Integer;
function  GetNextLine(Dc : Hdc; Metric : TTextMetric; Text : PChar; DrawWidth : Integer;
                      Align : TAlignment; var Chars : Integer) : Boolean;
procedure GetTextLines(Dc : Hdc; Text : PChar; RowHeight : Integer; DrawWidth : Integer;
                       Align : TAlignment; CanWordWrap: Boolean; var Lines : TtsIntegerList; MaxLines: Integer);
procedure GetTextHeight(Dc : Hdc; Text : PChar; DrawWidth : Integer; Align : TAlignment;
                        CanWordWrap: Boolean; var TextLines, TextHeight: Integer);
function  TextLineSpacing(const Metric: TTextMetric): Integer;
function  GetVertTopOffset(Top: Integer; TextRect: TRect; TextLines: TtsIntegerList;
                           LineSpacing: Integer; VertAlign: TtsVertAlignment; const Metric: TTextMetric): Integer;
procedure DisplayText(Canvas : TCanvas; Text : PChar; RowHeight : Integer; TextRect : TRect;
                      Left, Top : Integer; Align : TAlignment; VertAlign: TtsVertAlignment;
                      CanWordWrap: Boolean; AccelPos: Integer);
procedure DisplayTextLines(Canvas : TCanvas; Text : PChar; RowHeight : Integer;
                           TextRect : TRect; Left, Top : Integer; FirstChar, FirstRow : Integer;
                           Lines : TtsIntegerList; SelStart, SelLength : Integer;
                           SelColor, SelFontColor : TColor; Align : TAlignment;
                           VertAlign: TtsVertAlignment; CanWordWrap: Boolean);

implementation

uses
    TSMbcs;

const
    RETURN_DISPLAY_CHAR = ' ';
    RETURN_DISPLAY_LEN = 1;

type
    TPolyRect = array[1..10] of TPoint;

var
    OverhangIncluded: Boolean;

function GetTextExtent(Dc: Hdc; Metric: TTextMetric; Text: PChar;
                       Chars: Integer; var TextSize: TSize): Boolean;
begin
    Result := GetTextExtentPoint32(Dc, Text, Chars, TextSize);
    if (OverhangIncluded) and (TextSize.CX > 0) then Dec(TextSize.CX, Metric.tmOverhang);
end;

procedure TextOutAccel(Canvas: TCanvas; const Metric: TTextMetric; X, Y: Integer;
                       Options: Longint; Rect: PRect; Str: PChar; Count: Longint;
                       Dx: PInteger; AccelPos: Integer);
var
    OldStyle: TFontStyles;
    StartTextSize, AccelKeySize: TSize;
    AccelChars: Integer;
begin
    if (AccelPos <= 0) or (AccelPos > Count) then
        ExtTextOut(Canvas.Handle, X, Y, Options, Rect, Str, Count, Dx)
    else
    begin
        AccelChars := NextCharCount(Str + AccelPos - 1, 0);
        GetTextExtent(Canvas.Handle, Metric, Str, AccelPos - 1, StartTextSize);
        GetTextExtent(Canvas.Handle, Metric, Str + AccelPos - 1, AccelChars, AccelKeySize);

        if AccelPos - 1 > 0 then
        begin
            ExtTextOut(Canvas.Handle, X, Y, Options, Rect, Str, AccelPos - 1, Dx);
            X := X + StartTextSize.CX;
            Rect.Left := X;
        end;

        if Rect.Right > Rect.Left then
        begin
            OldStyle := Canvas.Font.Style;
            Canvas.Font.Style := OldStyle + [fsUnderline];
            ExtTextOut(Canvas.Handle, X, Y, Options, Rect, Str + AccelPos - 1, AccelChars, Dx);
            Canvas.Font.Style := OldStyle;
        end;

        if AccelPos + AccelChars <= Count then
        begin
            X := X + AccelKeySize.CX;
            Rect.Left := X;
            if Rect.Right > Rect.Left then
            begin
                ExtTextOut(Canvas.Handle, X, Y, Options, Rect, Str + AccelPos - 1 + AccelChars,
                           Count - (AccelPos - 1) - AccelChars, Dx);
            end;
        end;
    end;
end;

function  IsLeadByte(Key: Char): Boolean;
begin
    Result := Key in LeadBytes;
end;

function StrNScanEol(Text: PChar; Chars: Integer): PChar;
var
    Ptr1, Ptr2: PChar;
begin
    Ptr1 := AnsiStrNScan(Text, Chr(VK_RETURN), Chars);
    Ptr2 := AnsiStrNScan(Text, Chr(CH_LINEFEED), Chars);

    if Ptr1 = nil then
        Result := Ptr2
    else if Ptr2 = nil then
        Result := Ptr1
    else if Ptr1 < Ptr2 then
        Result := Ptr1
    else
        Result := Ptr2;
end;

function IsSpaceChar(PText: PChar; Index: Integer) : Boolean;
begin
    Result := False;
    if StrByteType(PText, Index) <> mbSingleByte then Exit;
    Result := (Ord(PText[Index]) = VK_TAB) Or (PText[Index] = ' ');
end;

function IsTextChar(PText: PChar; Index: Integer) : Boolean;
begin
    Result := (not IsSpaceChar(PText, Index)) and
              (not EofLineChar(PText, Index)) and
              (PText[Index] <> #0)
end;

function StrRNSpaceScan(Text : PChar; Chars : Cardinal) : PChar;
var
    Ptr : PChar;
begin
    Result := AnsiStrRNScan(Text, ' ', Chars);
    Ptr := AnsiStrRNScan(Text, Chr(VK_TAB), Chars);
    if Ptr > Result then Result := Ptr;
end;

function StrRNTextScan(Text : PChar; Chars : Cardinal) : PChar;
var
    CharCnt: Cardinal;
begin
    CharCnt := 0;
    Result := nil;
    while Chars >= 1 do
    begin
        CharCnt := PrevCharCount(Text, Chars);
        if IsTextChar(Text + Chars - CharCnt, 0) then Break;
        Chars := Chars - CharCnt;
    end;

    if Chars >= 1 then Result := Text + Chars - CharCnt;
end;

function StrNSkipSpace(Text: PChar; Chars: Cardinal): PChar;
var
    Count, CharCnt: Cardinal;
begin
    Count := 0;
    while Count < Chars do
    begin
        if not IsSpaceChar(Text, Count) then Break;
        CharCnt := NextCharCount(Text, Count);
        Count := Count + CharCnt
    end;
    Result := Text + Count;
end;

function NextWordCount(PText : PChar; Offset : Integer) : Integer;
var
    Pos : Integer;
    Chars : Integer;
begin
    Pos := Offset;
    while not EndOfText(PText, Pos) do
    begin
        if not IsTextChar(PText, Pos) then Break;
        Chars := NextCharCount(PText, Pos);
        Pos := Pos + Chars;
    end;

    while not EndOfText(PText, Pos) do
    begin
        if IsTextChar(PText, Pos) then Break;
        Chars := NextCharCount(PText, Pos);
        Pos := Pos + Chars;
    end;

    Result := Pos - Offset;
end;

function PrevWordCount(PText : PChar; Offset : Integer) : Integer;
var
    Pos : Integer;
    Chars : Integer;
begin
    Pos := Offset;
    while Pos > 0 do
    begin
        Chars := PrevCharCount(PText, Pos);
        if IsTextChar(PText + Pos - Chars, 0) then Break;
        Pos := Pos - Chars;
    end;

    while Pos > 0 do
    begin
        Chars := PrevCharCount(PText, Pos);
        if not IsTextChar(PText + Pos - Chars, 0) then Break;
        Pos := Pos - Chars;
    end;

    Result := Offset - Pos;
end;

procedure GetTextWidthPos(Dc : Hdc; Metric: TTextMetric; Text : PChar; TextLen : Integer;
                          DrawWidth : Integer; Step : Integer; var Chars : Integer);
var
    TextSize : TSize;
    CharCnt: Integer;
begin
    while true do
    begin
        if (Step > 0) and (Chars = TextLen) then Break;
        if (Step < 0) and (Chars = 0) then Break;
        if (Step > 0) and EofLineChar(Text, Chars) then Break;

        if Step > 0
            then CharCnt := NextCharCount(Text + Chars, 0)
            else CharCnt := -PrevCharCount(Text, Chars);

        Chars := Chars + CharCnt;
        GetTextExtent(Dc, Metric, Text, Chars, TextSize);
        if TextSize.CX > 0 then Inc(TextSize.CX, Metric.tmOverhang);

        if (Step > 0) and (TextSize.CX > DrawWidth) then
        begin
            Chars := Chars - CharCnt;
            Break;
        end
        else if (Step < 0) and (TextSize.CX <= DrawWidth) then
        begin
            Break;
        end;
    end;
end;

procedure PCountChars(Text: PChar; MaxChars, TextLen: Integer; var CharCount, ByteCount: Integer; Reverse: Boolean);
var
    CntChars, CntBytes: Integer;
    TextChars: Integer;
begin
    CharCount := 0;
    ByteCount := 0;
    if (TextLen <= 0) or (MaxChars <= 0) then Exit;

    TextChars := MaxChars;
    if Reverse then
    begin
        PCountChars(Text, TextLen, TextLen, TextChars, CntBytes, False);
        MaxChars := TextChars - MaxChars;
        if MaxChars <= 0 then MaxChars := 0;
    end;

    CntChars := 0;
    CntBytes := 0;
    while (CntBytes < TextLen) and (CntChars < MaxChars) do
    begin
        Inc(CntChars);
        Inc(CntBytes);
        if Text[CntBytes - 1] in LeadBytes then Inc(CntBytes);
    end;

    if Reverse then
    begin
        CharCount := TextChars - CntChars;
        ByteCount := TextLen - CntBytes;
    end
    else
    begin
        CharCount := CntChars;
        ByteCount := CntBytes;
    end;
end;

function PCharToByteLen(Text: PChar; MaxChars, TextLen: Integer; Reverse: Boolean): Integer;
var
    Chars: Integer;
begin
    Result := 0;
    if (MaxChars <= 0) or (TextLen <= 0) then Exit;

    if MaxChars > TextLen then MaxChars := TextLen;
    if tsIsFarEast then
    begin
        PCountChars(Text, MaxChars, TextLen, Chars, Result, Reverse);
        if Result > TextLen then Result := TextLen;
    end
    else
        Result := MaxChars;
end;

function PByteToCharLen(Text: PChar; MaxLen, TextLen: Integer): Integer;
var
    Bytes: Integer;
begin
    Result := 0;
    if (MaxLen <= 0) or (TextLen <= 0) then Exit;

    if MaxLen > TextLen then MaxLen := TextLen;
    Result := MaxLen;
    if tsIsFarEast then PCountChars(Text, MaxLen, MaxLen, Result, Bytes, False);
end;

function GetNextLine(Dc : Hdc; Metric : TTextMetric; Text : PChar; DrawWidth : Integer;
                     Align : TAlignment; var Chars : Integer) : Boolean;
var
    Step : Integer;
    TextSize : TSize;
    Ptr : PChar;
    TextLen : Integer;
    SpaceChars: Integer;
begin
    Chars := 0;
    TextLen := StrLen(Text);

    if TextLen = 0 then
    begin
        Result := false;
        Exit;
    end;

    SpaceChars := 0;
    if (Align = taRightJustify) and IsSpaceChar(Text, 0) then
    begin
        Ptr := StrNSkipSpace(Text, TextLen);
        if Ptr <> nil then
        begin
            SpaceChars := Ptr - Text;
            Text := Ptr;
            TextLen := TextLen - SpaceChars;
        end;
    end;

    Chars := DrawWidth div Metric.tmAveCharWidth;
    Chars := PCharToByteLen(Text, Chars, TextLen, False);

    Ptr := StrNScanEol(Text, Chars);
    if Ptr <> nil then
    begin
        Chars := Ptr - Text;
        GetTextExtent(Dc, Metric, Text, Chars, TextSize);
    end
    else
        GetTextExtent(Dc, Metric, Text, Chars, TextSize);

    if TextSize.CX > 0 then Inc(TextSize.CX, Metric.tmOverhang);
    if TextSize.CX <> DrawWidth then
    begin
        if TextSize.CX < DrawWidth then Step := 1 else Step := -1;
        GetTextWidthPos(Dc, Metric, Text, TextLen, DrawWidth, Step, Chars);
    end;

    if (Chars <> TextLen) and
        not IsSpaceChar(Text, Chars) and
        not EofLineChar(Text, Chars) then
    begin
        Ptr := StrRNSpaceScan(Text, Chars);
        if Ptr <> nil then Chars := Ptr - Text + 1;
    end;

    if (Align = taRightJustify) and (Chars > 0) then
    begin
        if IsSpaceChar(Text, Chars - 1) then
        begin
            Ptr := StrRNTextScan(Text, Chars);
            if Ptr <> nil then Chars := Ptr - Text + NextCharCount(Ptr, 0);
        end;
    end
    else if (Chars < TextLen) then
    begin
        Ptr := StrNSkipSpace(Text + Chars, TextLen - Chars);
        if Ptr = nil
            then Chars := TextLen
            else Chars := Ptr - Text;
    end;

    GetEofLine(Text, Chars);
    if (Chars + SpaceChars = 0) and (TextLen > 0) then Chars := NextCharCount(Text, 0);
    Chars := Chars + SpaceChars;
    Result := (Chars <> 0);
end;

procedure AdjustWidthForCRLF(Dc : HDC; Metric: TTextMetric; Text : PChar;
                             TextLen : Integer; var Width : Longint);
var
    RemainingChars : Integer;
    CharCount : Integer;
    PReturn : PChar;
    TextSize : TSize;
begin
    RemainingChars := TextLen;
    while RemainingChars > 0 do
    begin
        PReturn := StrNScanEol(Text, RemainingChars);
        if PReturn = nil then
            RemainingChars := 0
        else
        begin
            CharCount := NextCharCount(PReturn, 0);
            GetTextExtent(Dc, Metric, PReturn, CharCount, TextSize);
            Width := Width - TextSize.CX;

            GetTextExtent(Dc, Metric, RETURN_DISPLAY_CHAR, Length(RETURN_DISPLAY_CHAR), TextSize);
            Width := Width + TextSize.CX;

            RemainingChars := RemainingChars - (PReturn - Text) - CharCount;
            Text := PReturn + CharCount;
        end;
    end;
end;

procedure GetVisibleChars(Dc : HDC; Metric : TTextMetric; Text : PChar; TextLen : Integer;
                          DrawWidth : Integer; var Chars : Integer; var Width : Integer;
                          Align : TAlignment);
var
    TextSize : TSize;
    CharPos : PChar;
    CharCnt, EolPos : Integer;
begin
    if Align = taCenter then
        Chars := TextLen
    else
    begin
        Chars := DrawWidth div Metric.tmAveCharWidth;
        Chars := PCharToByteLen(Text, Chars, TextLen, (Align = taRightJustify));
    end;

    if Align in [taCenter, taLeftJustify] then
    begin
        if Chars > 0 then
        begin
            EolPos := Chars - 1;
            GetEofLine(Text, EolPos);
            if EolPos - (Chars - 1) > 1 then Chars := Chars - 1;
        end;

        GetTextExtent(Dc, Metric, Text, Chars, TextSize);
        AdjustWidthForCRLF(Dc, Metric, Text, Chars, TextSize.CX);
    end
    else
    begin
        if (Chars > 0) and (Chars < TextLen) then
        begin
            EolPos := TextLen - Chars - 1;
            GetEofLine(Text, EolPos);
            if EolPos - (TextLen - Chars - 1) > 1 then Chars := Chars - 1;
        end;

        GetTextExtent(Dc, Metric, Text + TextLen - Chars, Chars, TextSize);
        AdjustWidthForCRLF(Dc, Metric, Text + TextLen - Chars, Chars, TextSize.CX);
    end;

    Width := TextSize.CX;
    while (Width < DrawWidth) and (Chars < TextLen) do
    begin
        if Align in [taCenter, taLeftJustify] then
        begin
            CharCnt := NextCharCount(Text, Chars);
            CharPos := Text + Chars;
        end
        else
        begin
            CharCnt := PrevCharCount(Text, TextLen - Chars);
            CharPos := Text + TextLen - Chars - CharCnt;
        end;

        if EofLineChar(CharPos, 0) then
            GetTextExtent(Dc, Metric, RETURN_DISPLAY_CHAR, Length(RETURN_DISPLAY_CHAR), TextSize)
        else
            GetTextExtent(Dc, Metric, CharPos, CharCnt, TextSize);

        Width := Width + TextSize.CX;
        Chars := Chars + CharCnt;
    end;

    if Width > 0 then Width := Width + Metric.tmOverhang;
end;

procedure GetPrintCharWidth(Canvas : TCanvas; Metric: TTextMetric; Text : PChar;
                            Chars : Integer; MultiLine : Boolean;
                            WithOverhang: Boolean; var Width : Integer);
var
    PReturn : PChar;
    TextSize : TSize;
    RetChars : Integer;
begin
    Width := 0;

    while Chars > 0 do
    begin
        PReturn := StrNScanEol(Text, Chars);
        if PReturn = nil then
        begin
            GetTextExtent(Canvas.Handle, Metric, Text, Chars, TextSize);
            Width := Width + TextSize.CX;
            Chars := 0;
        end
        else
        begin
            GetTextExtent(Canvas.Handle, Metric, Text, PReturn - Text, TextSize);
            Width := Width + TextSize.CX;

            if not MultiLine then
            begin
                GetTextExtent(Canvas.Handle, Metric, RETURN_DISPLAY_CHAR, Length(RETURN_DISPLAY_CHAR), TextSize);
                Width := Width + TextSize.CX;
            end;

            RetChars := NextCharCount(PReturn, 0);
            Chars := Chars - (PReturn - Text) - RetChars;
            Text := PReturn + RetChars;
        end;
    end;

    if (Width > 0) and WithOverhang then Width := Width + Metric.tmOverhang;
end;

function LastCharIsEofLine(PText : PChar; Offset : Integer) : Boolean;
begin
    Result := false;
    if PText = nil then Exit;

    Offset := Offset - PrevCharCount(PText, Offset);
    Result := EofLineChar(PText, Offset);
end;

function IsMultiLineText(RowHeight : Integer; TextHeight : Integer) : Boolean;
begin
    Result := (RowHeight - TextHeight) >= (TextHeight div 3);
end;

procedure GetTextLines(Dc : Hdc; Text : PChar; RowHeight : Integer; DrawWidth : Integer;
                       Align : TAlignment; CanWordWrap: Boolean; var Lines : TtsIntegerList; MaxLines: Integer);
var
    Chars : Integer;
    TotalChars : Integer;
    Metric : TTextMetric;
    PText : PChar;
    TopOffset, LineSpacing: Integer;
begin
    GetTextMetrics(Dc, Metric);
    LineSpacing := TextLineSpacing(Metric);
    TopOffset := LineSpacing;

    if Text = nil then Text := '';

    Lines.Clear;
    if (not CanWordWrap) or (not IsMultiLineText(RowHeight - TopOffset, Metric.tmHeight + LineSpacing)) then
        Lines.AddItem(0)
    else
    begin
        PText := Text;
        TotalChars := 0;

        while GetNextLine(Dc, Metric, PText, DrawWidth - 1, Align, Chars) and
              ((Lines.Count < MaxLines) or (MaxLines = 0)) do
        begin
            Lines.AddItem(TotalChars);

            TotalChars := TotalChars + Chars;
            PText := PText + Chars;
        end;

        if Lines.Count = 0 then
            Lines.AddItem(0)
        else if LastCharIsEofLine(Text, TotalChars) then
            Lines.AddItem(TotalChars);
    end;
end;

procedure GetTextHeight(Dc : Hdc; Text : PChar; DrawWidth : Integer;
                        Align : TAlignment; CanWordWrap: Boolean;
                        var TextLines, TextHeight: Integer);
var
    Chars : Integer;
    TotalChars : Integer;
    Metric : TTextMetric;
    PText : PChar;
begin
    TextLines := 0;
    GetTextMetrics(Dc, Metric);
    if Text = nil then Text := '';

    if (not CanWordWrap) then
        TextLines := 1
    else
    begin
        PText := Text;
        TotalChars := 0;

        while GetNextLine(Dc, Metric, PText, DrawWidth - 1, Align, Chars) do
        begin
            Inc(TextLines);
            TotalChars := TotalChars + Chars;
            PText := PText + Chars;
        end;

        if TextLines = 0 then
            TextLines := 1
        else if LastCharIsEofLine(Text, TotalChars) then
            Inc(TextLines)
    end;

    TextHeight := TextLines * (Metric.tmHeight + TextLineSpacing(Metric));
end;

procedure FillPolyRect(Canvas: TCanvas; Metric: TTextMetric;
                       TextRect, ClipRect: TRect; SelColor: TColor);
var
    Bitmap: TBitmap;
    ToRect, FromRect: TRect;
    Overhang: Integer;
    PolyRect: TPolyRect;
begin
    Bitmap := TBitmap.Create;
    try
        Overhang := 0;
        if fsItalic in Canvas.Font.Style then Overhang := Metric.tmOverhang;
        if (Overhang > 0) and (fsBold in Canvas.Font.Style) then Dec(Overhang); 

        Bitmap.Width := TextRect.Right - TextRect.Left + Overhang;
        Bitmap.Height := TextRect.Bottom - TextRect.Top;

        FromRect := Rect(0, 0, Bitmap.Width, Bitmap.Height);
        Bitmap.Canvas.Brush := Canvas.Brush;
        Bitmap.Canvas.FillRect(FromRect);

        Bitmap.Canvas.Pen.Color := SelColor;
        Bitmap.Canvas.Pen.Width := 1;
        Bitmap.Canvas.Brush.Color := SelColor;

        PolyRect[1].X := Overhang;
        PolyRect[1].Y := 0;
        PolyRect[2].X := Bitmap.Width - 1;
        PolyRect[2].Y := 0;
        PolyRect[3].X := Bitmap.Width - 1 - Overhang;
        PolyRect[3].Y := Bitmap.Height - 1;
        PolyRect[4].X := 0;
        PolyRect[4].Y := Bitmap.Height - 1;

        Bitmap.Canvas.Polygon(Slice(PolyRect, 4));

        ToRect.Left := TextRect.Left;
        ToRect.Top := TextRect.Top;
        ToRect.Right := ToRect.Left + Bitmap.Width;
        if ToRect.Right > ClipRect.Right then
        begin
            FromRect.Right := FromRect.Right - (ToRect.Right - ClipRect.Right);
            ToRect.Right := ClipRect.Right;
        end;

        ToRect.Bottom := ToRect.Top + Bitmap.Height;
        if ToRect.Bottom > ClipRect.Bottom then
        begin
            FromRect.Bottom := FromRect.Bottom - (ToRect.Bottom - ClipRect.Bottom);
            ToRect.Bottom := ClipRect.Bottom;
        end;

        Canvas.CopyRect(ToRect, Bitmap.Canvas, FromRect);
    finally
        Bitmap.Free;
    end;
end;

procedure DisplayTextWithSelect(Canvas : TCanvas; Metric: TTextMetric;
                                Text : PChar; Chars : Integer; TextRect : TRect;
                                Left, Top : Integer; SelStart, SelLength : Integer;
                                SelColor, SelFontColor : TColor; AccelPos: Integer;
                                LineSpacing: Integer);
var
    Options : Integer;
    StartTextSize, SelTextSize : TSize;
    Rect : TRect;
    OldBkMode: Integer;
    OldFontColor: TColor;
begin
    if TextRect.Left > TextRect.Right then Exit;

    if SelStart < 0 then
    begin
        SelLength := SelLength + SelStart;
        SelStart := 0;
    end;

    OldBkMode := Windows.SetBkMode(Canvas.Handle, TRANSPARENT);
    if (SelLength <= 0) or (SelStart >= Chars) then
    begin
        Options := ETO_CLIPPED;
        TextOutAccel(Canvas, Metric, Left, Top, Options, @TextRect, Text, Chars,
                     nil, AccelPos)
    end
    else
    begin
        OldFontColor := Canvas.Font.Color;

        if SelStart + SelLength > Chars then SelLength := Chars - SelStart;
        GetTextExtent(Canvas.Handle, Metric, Text, SelStart, StartTextSize);
        GetTextExtent(Canvas.Handle, Metric, Text + SelStart, SelLength, SelTextSize);

        Rect := TextRect;
        Rect.Left := Left + StartTextSize.CX;
        Rect.Right := Rect.Left + SelTextSize.CX;
        Rect.Bottom := Rect.Top + Metric.tmHeight + LineSpacing;
        if Rect.Left < TextRect.Left then Rect.Left := TextRect.Left;
        if (SelLength > 0) and (Rect.Left <= Rect.Right) then
        begin
            FillPolyRect(Canvas, Metric, Rect, TextRect, SelColor);
        end;

        Options := ETO_CLIPPED;
        ExtTextOut(Canvas.Handle, Left, Top, Options, @TextRect, Text, SelStart, nil);

        Canvas.Font.Color := SelFontColor;
        Windows.SetBkMode(Canvas.Handle, TRANSPARENT);
        Left := Left + StartTextSize.CX;
        ExtTextOut(Canvas.Handle, Left, Top, Options, @TextRect, Text + SelStart, SelLength, nil);

        Canvas.Font.Color := OldFontColor;
        Windows.SetBkMode(Canvas.Handle, TRANSPARENT);
        Left := Left + SelTextSize.CX;
        ExtTextOut(Canvas.Handle, Left, Top, Options, @TextRect, Text + SelStart + SelLength, Chars - SelStart - SelLength, nil);
    end;

    Windows.SetBkMode(Canvas.Handle, OldBkMode);
end;

procedure DisplayTextLineSingle(Canvas : TCanvas; Metric : TTextMetric; Text : PChar;
                                TextLen : Integer; TextOffset: Integer; TextRect : TRect;
                                Left, Top : Integer; SelStart, SelLength : Integer;
                                SelColor, SelFontColor : TColor; Align : TAlignment;
                                VertAlign: TtsVertAlignment; AccelPos: Integer);
var
    Chars : Integer;
    PrintChars : Integer;
    PrintWidth : Integer;
    ARect, ClipRect : TRect;
    PReturn : PChar;
    TextSize : TSize;
    LeftOffset : Integer;
    CanCenter: Boolean;
    LineSpacing: Integer;
begin
    LineSpacing := TextLineSpacing(Metric);
    ARect := TextRect;
    ARect.Top := Top;
    ClipRect := ARect;
    if Left > ClipRect.Left then ClipRect.Left := Left;

    Canvas.FillRect(TextRect);
    if VertAlign in [vtaDefault, vtaTop] then
    begin
        if (SelLength > 0) and (ARect.Bottom > ARect.Top + Metric.tmHeight + LineSpacing) then
        begin
            ARect.Bottom := ARect.Top + Metric.tmHeight + LineSpacing;
            ClipRect.Bottom := ClipRect.Top + Metric.tmHeight + LineSpacing;
        end
    end
    else if VertAlign = vtaBottom then
    begin
        Top := ARect.Bottom - Metric.tmHeight;
        if (SelLength > 0) and (ARect.Bottom > ARect.Top + Metric.tmHeight + LineSpacing) then
        begin
            ARect.Top := Top;
            ClipRect.Top := Top;
        end;
    end
    else if VertAlign = vtaCenter then
    begin
        if ARect.Bottom - ARect.Top > Metric.tmHeight + 1 then
            Top := Top + (ARect.Bottom - ARect.Top - Metric.tmHeight) div 2;

        if (SelLength > 0) and (ARect.Bottom > Top + Metric.tmHeight + LineSpacing) then
        begin
            ARect.Top := Top;
            ARect.Bottom := ARect.Top + Metric.tmHeight + LineSpacing;
            ClipRect.Top := Top;
            ClipRect.Bottom := ClipRect.Top + Metric.tmHeight + LineSpacing;
        end;
    end;

    if Align = taLeftJustify then
    begin
        Text := Text + TextOffset;
        TextLen := TextLen - TextOffset;
        SelStart := SelStart - TextOffset;
        GetVisibleChars(Canvas.Handle, Metric, Text, TextLen, ARect.Right - Left,
                        PrintChars, PrintWidth, Align);
    end
    else if Align = taRightJustify then
    begin
        GetVisibleChars(Canvas.Handle, Metric, Text, TextLen, ARect.Right - Left,
                        PrintChars, PrintWidth, Align);
        PrintWidth := PrintWidth + RIGHT_PRINT_MARGIN;

        if (PrintWidth > ARect.Right - Left) and (Left <> ARect.Left) then
        begin
            ARect.Left := Left;
        end;

        Text := Text + TextLen - PrintChars;
        SelStart := SelStart - (TextLen - PrintChars);
        Left := ARect.Right - PrintWidth;
    end
    else if Align = taCenter then
    begin
        GetVisibleChars(Canvas.Handle, Metric, Text, TextLen, ARect.Right - Left,
                        PrintChars, PrintWidth, Align);
        LeftOffset := (ARect.Right - ARect.Left - PrintWidth) div 2;
        CanCenter := (LeftOffset >= Left - ARect.Left);

        if TextOffset > 0 then
        begin
            Text := Text + TextOffset;
            TextLen := TextLen - TextOffset;
            SelStart := SelStart - TextOffset;
            GetVisibleChars(Canvas.Handle, Metric, Text, TextLen, ARect.Right - Left,
                            PrintChars, PrintWidth, Align);
        end;

        if CanCenter then
        begin
            LeftOffset := (ARect.Right - ARect.Left - PrintWidth) div 2;
            Left := ARect.Left + LeftOffset;
        end;
    end;

    repeat
        PReturn := StrNScanEol(Text, PrintChars);
        if PReturn = nil then
        begin
            DisplayTextWithSelect(Canvas, Metric, Text, PrintChars, ClipRect, Left, Top,
                                  SelStart, SelLength, SelColor, SelFontColor, AccelPos, 0);
            PrintChars := 0;
        end
        else
        begin
            DisplayTextWithSelect(Canvas, Metric, Text, PReturn - Text, ClipRect, Left, Top,
                                  SelStart, SelLength, SelColor, SelFontColor, AccelPos, 0);

            GetTextExtent(Canvas.Handle, Metric, Text, PReturn - Text, TextSize);
            Left := Left + TextSize.CX;
            ARect.Left := ARect.Left + TextSize.CX;

            SelStart := SelStart - (PReturn - Text);
            AccelPos := AccelPos - (PReturn - Text);
            DisplayTextWithSelect(Canvas, Metric, RETURN_DISPLAY_CHAR, Length(RETURN_DISPLAY_CHAR), ClipRect, Left, Top,
                                  SelStart, SelLength, SelColor, SelFontColor, AccelPos, 0);

            GetTextExtent(Canvas.Handle, Metric, RETURN_DISPLAY_CHAR, Length(RETURN_DISPLAY_CHAR), TextSize);
            Left := Left + TextSize.CX;
            ARect.Left := ARect.Left + TextSize.CX;

            Chars := NextCharCount(PReturn, 0);
            SelStart := SelStart - Chars;
            AccelPos := AccelPos - Chars;
            PrintChars := PrintChars - (PReturn - Text) - Chars;
            Text := PReturn + Chars;
        end;
    until (PrintChars <= 0) or (ARect.Left > ARect.Right);

    if ARect.Bottom < TextRect.Bottom then
    begin
        ARect.Left := TextRect.Left;
        ARect.Top := ARect.Top + Metric.tmHeight + LineSpacing;
        ARect.Bottom := TextRect.Bottom;
        DisplayTextWithSelect(Canvas, Metric, '', 0, ClipRect, Left, Top, 0, 0,
                              SelColor, SelFontColor, AccelPos, 0);
    end;
end;

function TextLineSpacing(const Metric: TTextMetric): Integer;
begin
    Result := 0;
    if not tsIsFarEast then Exit;
    if Metric.tmExternalLeading > 0 then Result := 1;
end;

function GetVertTopOffset(Top: Integer; TextRect: TRect; TextLines: TtsIntegerList;
                          LineSpacing: Integer; VertAlign: TtsVertAlignment; const Metric: TTextMetric): Integer;
var
    CurLine: Integer;
begin
    Result := Top;
    if TextLines <> nil then
    begin
        if VertAlign = vtaBottom then
        begin
            CurLine := 1;
            Result := TextRect.Bottom - Metric.tmHeight;
            while (Result - (Metric.tmHeight + LineSpacing) >= Top) and
                  (CurLine < TextLines.Count) do
            begin
                Inc(CurLine);
                Result := Result - (Metric.tmHeight + LineSpacing);
            end;
        end
        else if VertAlign = vtaCenter then
        begin
            if TextRect.Bottom - Top > TextLines.Count * (Metric.tmHeight + LineSpacing) + 1 then
                Result := Top + (((TextRect.Bottom - Top) - (TextLines.Count * (Metric.tmHeight + LineSpacing))) div 2);
        end;
    end;
end;

procedure DisplayText(Canvas : TCanvas; Text : PChar; RowHeight : Integer;
                      TextRect : TRect; Left, Top : Integer;
                      Align : TAlignment; VertAlign: TtsVertAlignment;
                      CanWordWrap: Boolean; AccelPos: Integer);
var
    Dc : Hdc;
    Chars : Integer;
    PrintChars : Integer;
    DrawWidth : Integer;
    Options : Integer;
    Metric : TTextMetric;
    TextSize : TSize;
    LeftOffset : Integer;
    LeftMarginPos : Integer;
    TextLen : Integer;
    TopOffset, LineSpacing: Integer;
    TextLines: TtsIntegerList;
    CurLine, MaxLines: Integer;
    OldBkMode: Integer;
begin
    if TextRect.Left >= TextRect.Right then Exit;

    Dc := Canvas.Handle;
    Options := ETO_CLIPPED;
    GetTextMetrics(Canvas.Handle, Metric);
    LineSpacing := TextLineSpacing(Metric);
    TopOffset := LineSpacing;
    Top := Top + TopOffset;

    if Text = nil then Text := '';

    OldBkMode := SetBkMode(Dc, TRANSPARENT);
    try
        if (not CanWordWrap) or (not IsMultiLineText(RowHeight - TopOffset, Metric.tmHeight + LineSpacing)) then
        begin
            TextLen := StrLen(Text);
            if (Align = taLeftJustify) and (VertAlign in [vtaDefault, vtaTop]) and
               (StrNScanEol(Text, TextLen) = nil) then
            begin
                Canvas.FillRect(TextRect);
                TextOutAccel(Canvas, Metric, Left, Top, Options, @TextRect, Text,
                             TextLen, nil, AccelPos);
            end
            else
                DisplayTextLineSingle(Canvas, Metric, Text, TextLen, 0, TextRect,
                                      Left, Top, 0, 0, 0, 0, Align, VertAlign, AccelPos);
        end
        else
        begin
            DrawWidth := TextRect.Right - Left;
            Canvas.FillRect(TextRect);

            if Align = taRightJustify then
            begin
                if (TextRect.Left <> Left) then
                begin
                    Canvas.FillRect(Rect(TextRect.Left, TextRect.Top, Left, TextRect.Bottom));
                    TextRect.Left := Left;
                end;

                DrawWidth := DrawWidth - RIGHT_PRINT_MARGIN;
            end;

            LeftMarginPos := Left;

            TextLines := nil;
            try
                if not (VertAlign in [vtaDefault, vtaTop]) then
                begin
                    if Text[0] <> #0 then
                    begin
                        TextLines := TtsIntegerList.Create;
                        MaxLines := ((TextRect.Bottom - TextRect.Top) div (Metric.tmHeight + LineSpacing)) + 1;
                        GetTextLines(Canvas.Handle, Text, RowHeight, DrawWidth, Align,
                                     CanWordWrap, TextLines, MaxLines);
                    end;
                end;

                CurLine := 0;
                Top := GetVertTopOffset(Top, TextRect, TextLines, LineSpacing, VertAlign, Metric);
                while (TextRect.Top <= TextRect.Bottom) do
                begin
                    if TextLines = nil then
                    begin
                        if not GetNextLine(Canvas.Handle, Metric, Text, DrawWidth - 1, Align, Chars) then
                            Break;
                    end
                    else
                    begin
                        if CurLine > TextLines.Count - 1 then Break;
                        if CurLine < TextLines.Count - 1
                            then Chars := TextLines.Item[CurLine+1] - TextLines.Item[CurLine]
                            else Chars := StrLen(Text);
                        Inc(CurLine);
                    end;

                    PrintChars := Chars;
                    if LastCharIsEofLine(Text, Chars) then
                        PrintChars := PrintChars - PrevCharCount(Text, Chars);

                    if Align = taRightJustify then
                    begin
                        GetTextExtent(Dc, Metric, Text, PrintChars, TextSize);
                        Left := TextRect.Right - (TextSize.CX + RIGHT_PRINT_MARGIN);
                        if TextSize.CX > 0 then Left := Left - Metric.tmOverhang
                    end
                    else if Align = taCenter then
                    begin
                        GetTextExtent(Dc, Metric, Text, PrintChars, TextSize);
                        if TextSize.CX > 0 then TextSize.CX := TextSize.CX + Metric.tmOverhang;

                        LeftOffset := (TextRect.Right - TextRect.Left - TextSize.CX) div 2;
                        if LeftOffset > Left - TextRect.Left then
                            Left := TextRect.Left + LeftOffset
                    end;

                    TextOutAccel(Canvas, Metric, Left, Top, Options, @TextRect, Text, PrintChars,
                                 nil, AccelPos);

                    Top := Top + Metric.tmHeight + LineSpacing;
                    TextRect.Top := Top;

                    Text := Text + Chars;
                    AccelPos := AccelPos - Chars;
                    Left := LeftMarginPos;
                end;
            finally
                TextLines.Free;
            end;
        end;
    finally
        SetBkMode(Dc, OldBkMode);
    end;
end;

procedure DisplayTextLinesMulti(Canvas : TCanvas; Metric : TTextMetric; Text : PChar;
                                TextRect : TRect; Left, Top : Integer; FirstRow : Integer;
                                Lines : TtsIntegerList; SelStart, SelLength : Integer;
                                SelColor, SelFontColor : TColor; Align : TAlignment; VertAlign: TtsVertAlignment);
var
    I : Integer;
    Dc : Hdc;
    Chars : Integer;
    PrintChars : Integer;
    ARect : TRect;
    TextSize : TSize;
    LeftOffset : Integer;
    LeftMarginPos : Integer;
    LineSpacing: Integer;
begin
    Dc := Canvas.Handle;
    Text := Text + Lines.Item[FirstRow];
    SelStart := SelStart - Lines.Item[FirstRow];
    LineSpacing := TextLineSpacing(Metric);

    if (Align = taRightJustify) and (TextRect.Left <> Left) then
    begin
        Canvas.FillRect(Rect(TextRect.Left, TextRect.Top, Left, TextRect.Bottom));
        TextRect.Left := Left;
    end;

    Top := GetVertTopOffset(Top, TextRect, Lines, LineSpacing, VertAlign, Metric);
    ARect := TextRect;
    ARect.Top := Top;
    ARect.Bottom := ARect.Top + Metric.tmHeight + LineSpacing;
    if ARect.Bottom > TextRect.Bottom then ARect.Bottom := TextRect.Bottom;

    LeftMarginPos := Left;
    Canvas.FillRect(TextRect);

    for I := FirstRow to Lines.Count - 1 do
    begin
        Left := LeftMarginPos;
        if (ARect.Top > TextRect.Bottom) then Break;

        if I = Lines.Count - 1 then
            Chars := StrLen(Text)
        else
            Chars := Lines.Item[I + 1] - Lines.Item[I];

        PrintChars := Chars;
        if LastCharIsEofLine(Text, Chars) then
            PrintChars := PrintChars - PrevCharCount(Text, Chars);

        if Align = taRightJustify then
        begin
            GetTextExtent(Dc, Metric, Text, PrintChars, TextSize);
            if TextSize.CX > 0 then Inc(TextSize.CX, Metric.tmOverhang);
            Left := ARect.Right - (TextSize.CX + RIGHT_PRINT_MARGIN);
        end
        else if Align = taCenter then
        begin
            GetTextExtent(Dc, Metric, Text, PrintChars, TextSize);
            if TextSize.CX > 0 then Inc(TextSize.CX, Metric.tmOverhang);
            LeftOffset := (TextRect.Right - TextRect.Left - TextSize.CX) div 2;

            if LeftOffset > Left - TextRect.Left then
                Left := TextRect.Left + LeftOffset
        end;

        DisplayTextWithSelect(Canvas, Metric, Text, PrintChars, ARect, Left, Top,
                              SelStart, SelLength, SelColor, SelFontColor, 0, LineSpacing);

        Text := Text + Chars;
        SelStart := SelStart - Chars;

        Top := Top + Metric.tmHeight + LineSpacing;
        ARect.Top := Top;
        ARect.Bottom := ARect.Top + Metric.tmHeight + LineSpacing;
        if ARect.Bottom > TextRect.Bottom then ARect.Bottom := TextRect.Bottom;

        Left := LeftMarginPos;
    end;

    if Lines.Count - 1 < FirstRow then
        DisplayTextWithSelect(Canvas, Metric, '', 0, ARect, Left, Top, 0, 0,
                              SelColor, SelFontColor, 0, LineSpacing)
    else if ARect.Top < TextRect.Bottom then
    begin
        ARect.Bottom := TextRect.Bottom;
        DisplayTextWithSelect(Canvas, Metric, '', 0, ARect, Left, Top, 0, 0,
                              SelColor, SelFontColor, 0, LineSpacing)
    end;
end;

procedure DisplayTextLines(Canvas : TCanvas; Text : PChar; RowHeight : Integer;
                           TextRect : TRect; Left, Top : Integer;
                           FirstChar, FirstRow : Integer;
                           Lines : TtsIntegerList; SelStart, SelLength : Integer;
                           SelColor, SelFontColor : TColor; Align : TAlignment;
                           VertAlign: TtsVertAlignment; CanWordWrap: Boolean);
var
    Metric : TTextMetric;
    TextLen : Integer;
    TextOffset: Integer;
    TopOffset, LineSpacing: Integer;
begin
    if TextRect.Left >= TextRect.Right then Exit;
    GetTextMetrics(Canvas.Handle, Metric);
    LineSpacing := TextLineSpacing(Metric);
    TopOffset := LineSpacing;
    Top := Top + TopOffset;

    if Lines = nil then
    begin
        Canvas.FillRect(TextRect);
        DisplayTextWithSelect(Canvas, Metric, '', 0, TextRect, Left, Top, 0, 0,
                              SelColor, SelFontColor, 0, 0);
        Exit;
    end;

    if Text = nil then Text := '';
    if (not CanWordWrap) or (not IsMultiLineText(RowHeight - TopOffset, Metric.tmHeight + LineSpacing)) then
    begin
        if Align in [taLeftJustify, taCenter] then
        begin
            TextLen := StrLen(Text);
            TextOffset := FirstChar;
        end
        else
        begin
            TextLen := FirstChar;
            TextOffset := 0;
        end;

        DisplayTextLineSingle(Canvas, Metric, Text, TextLen, TextOffset,
                              TextRect, Left, Top, SelStart, SelLength,
                              SelColor, SelFontColor, Align, VertAlign, 0)
    end
    else
    begin
        DisplayTextLinesMulti(Canvas, Metric, Text, TextRect, Left, Top,
                              FirstRow, Lines, SelStart, SelLength,
                              SelColor, SelFontColor, Align, VertAlign);
    end;
end;

procedure CheckOverhangIncluded;
var
    Bmp: TBitmap;
    WidthSingle, WidthDouble: Integer;
    Size: TSize;
    CharCnt: Integer;
begin
    OverhangIncluded := False;
    Bmp := TBitmap.Create;
    try
        Bmp.Canvas.Font.Name := 'MS Sans Serif';
        Bmp.Canvas.Font.Style := [fsItalic];
        CharCnt := NextCharCount('XX', 0);
        GetTextExtentPoint32(Bmp.Canvas.Handle, 'XX', CharCnt, Size);
        WidthSingle := Size.CX;
        GetTextExtentPoint32(Bmp.Canvas.Handle, 'XX', 2 * CharCnt, Size);
        WidthDouble := Size.CX;
        OverhangIncluded := (2 * WidthSingle > WidthDouble);
    finally
        Bmp.Free;
    end;
end;

initialization
begin
    CheckOverhangIncluded;
end;

end.
