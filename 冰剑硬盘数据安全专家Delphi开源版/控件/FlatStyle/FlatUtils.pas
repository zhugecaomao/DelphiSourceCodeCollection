unit FlatUtils;

interface

{$I FlatStyle.inc}

uses Windows, Classes, Graphics, Messages, Controls,
     StdCtrls, ComCtrls, SysUtils, DBGrids, Grids;

const
  FileVersion = '4.42.8.0';
  //定义 控件标签 开关 值:True为显示,False为禁止
  DefaultHasTicket = True;

type
  TButtonLayout = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);
  TButtonState  = (bsUp, bsDisabled, bsDown, bsExclusive);
  TButtonStyle  = (bsAutoDetect, bsWin31, bsNew);
  TNumGlyphs    =  1..4;
  TAdvColors    =  0..100;
  //定义颜色语言结构
  TColorItems = packed record
    Value: TColor;
    cnName, enName: PAnsiChar;
  end;
  TIPChar = string[3];
  //定义IP分段函数
  TIP = packed Record
    NO1, NO2, NO3, NO4:TIPChar;
  end;
  TBarsRect = packed record
    PrevRect:TRect;
    DownRect:TRect;
  end;
  TWaterColor = packed record
    Value: TColor;
    enName: PAnsiChar;
  end;
  TBorderAttrib = packed record
    Ctrl: TWinControl;
    BorderColor: TColor;
    FlatColor: TColor;
    FocusColor: TColor;
    MouseState: Boolean;
    DesignState: TComponentState;
    FocusState: boolean;
    HasBars: boolean;
  end;
  TOtherParam = packed record
    Color: TColor;
    Name: TFontName;
    Pitch: TFontPitch;
    Size: Integer;
    Style: TFontStyles;
    Row: Integer;
    Draw3D: Boolean;
  end;
  TScrollType        = (stUp, stDown);
  TColorCalcType     = (lighten, darken);
  TLayoutPosition    = (lpLeft, lpRight);
  TFlatTabPosition   = (fpTop, fpBottom);
  TArrowPos          = (NE, NW, SE, SW);
  TGroupBoxBorder    = (brFull, brOnlyTopLine);
  TTransparentMode   = (tmAlways, tmNotFocused, tmNone);
  TLanguage          = (lgChinese, lgEnglish);
  TStyleOrien        = (bsHorizontal, bsVertical);
  TStyleFace         = (fsDefault, fsCustom);
  TAlignmentText     = (stLeft, stCenter, stRight);
  TCheckPosition     = (bpLeft, bpRight);
  TTitlePosition     = (tsTop, tsBottom);
  TTicketPosition    = (poLeft, poTop, poRight, poBottom);
  TSplitterStatus    = (ssIn, ssOut);
  TListState         = (lsClear,lsFree);

  TNotifyChange    = procedure(Sender: TObject; Text:TCaption) of object;
  TNotifyClick     = procedure(Sender: TObject; Text:TCaption) of object;
  TValidateEvent   = Procedure(Sender: TObject) of Object;
  TOnFrameChange   = procedure(Sender: TObject; FrameNumber: Integer) of object;
  TAnimationLayout = (alAcross, alDown);

const
  //定义Style属性的初始化值
  DefaultBarColor         = TColor($00C5D6D9);
  DefaultBorderColor      = TColor($00FF8000);
  DefaultShadowColor      = TColor($00C6C600);
  DefaultFlatColor        = TColor($00E1EAEB);
  DefaultTitleFaceColor   = TColor($0000CECE);
  DefaultTitleCheckColor  = TColor($00FF8000);
  DefaultFocusedColor     = TColor($00FBBE99);
  DefaultCheckBorderColor = TColor($008396A0);
  DefaultCheckColor       = TColor($00FF0080);
  DefaultDownColor        = TColor($00C5D6D9);
  DefaultItemRectColor    = clWhite;
  DefaultBackdropColor    = clWhite;
  DefaultCheckBackColor   = clWhite;
  DefaultCheckSelectColor = clPurple;
  DefaultSelectStartColor = clBlack;
  DefaultSelectStopColor  = clWhite;
  DefaultColorStart       = clGray;
  DefaultColorStop        = clWhite;
  DefaultItemColorStart   = clOlive;
  DefaultTitleColor       = clBtnFace;
  DefaultItemLineColor    = clGray;
  DefaultItemColorStop    = clWhite;
  DefaultStyleVertical    = bsVertical;
  DefaultStyleHorizontal  = bsHorizontal;
  DefaultStyleFace        = fsDefault;
  DefaultItemHeight       = 17;
  DefaultBarsHeight       = 12;
  DefaultTitleHeight      = 18;
  //定义键盘控制
  vk_selall               = $41;//全选 Ctrl+A
  vk_selcancel            = $5A;//取消全选 Ctrl+Z
  //定义颜色语言默认
  clCustom                = TColor($4080FF);
  StdColorCount           = 18;
  StdCustomCN             = '自定';
  StdCustomEN             = 'Custom';
  StdColorCN              = '颜色:';
  StdColorEN              = 'Color:';  
  StdColors: array [0..StdColorCount] of TColorItems = (
  {00}(Value:clBlack;       cnName:'黑色';  enName:'Black'  ),
  {01}(Value:clWhite;       cnName:'白色';  enName:'White'  ),
  {02}(Value:clYellow;      cnName:'黄色';  enName:'Yellow' ),
  {03}(Value:clRed;         cnName:'红色';  enName:'Red'    ),
  {04}(Value:clFuchsia;     cnName:'紫红';  enName:'Fuchsia'),
  {05}(Value:clMaroon;      cnName:'栗色';  enName:'Maroon' ),
  {06}(Value:clGreen;       cnName:'绿色';  enName:'Green'  ),
  {07}(Value:clAqua;        cnName:'浅绿';  enName:'Aqua'   ),
  {08}(Value:clMoneyGreen;  cnName:'金绿';  enName:'MoneyGreen'),
  {09}(Value:clBlue;        cnName:'蓝色';  enName:'Blue'   ),
  {10}(Value:clTeal;        cnName:'深蓝';  enName:'Teal'   ),
  {11}(Value:clSkyBlue;     cnName:'天蓝';  enName:'SkyBlue'),
  {12}(Value:clOlive;       cnName:'橄榄';  enName:'Olive'  ),
  {13}(Value:clNavy;        cnName:'藏青';  enName:'Navy'   ),
  {14}(Value:clPurple;      cnName:'紫色';  enName:'Purple' ),
  {15}(Value:clGray;        cnName:'灰色';  enName:'Gray'   ),
  {16}(Value:clSilver;      cnName:'银灰';  enName:'Silver' ),
  {17}(Value:clLime;        cnName:'青色';  enName:'Lime'   ),
  {18}(Value:clCustom;      cnName:'自定';  enName:'Custom'));

  //定义 输入类控件 的输入位置
  Aligns:array[TAlignment] of word =(ES_LEFT,ES_RIGHT,ES_CENTER);

  ecDarkBlue    = TColor($00996633);
  ecBlue        = TColor($00CF9030);
  ecLightBlue   = TColor($00CFB78F);
  ecDarkRed     = TColor($00302794);
  ecRed         = TColor($005F58B0);
  ecLightRed    = TColor($006963B6);
  ecDarkGreen   = TColor($00385937);
  ecGreen       = TColor($00518150);
  ecLightGreen  = TColor($0093CAB1);
  ecDarkYellow  = TColor($004EB6CF);
  ecYellow      = TColor($0057D1FF);
  ecLightYellow = TColor($00B3F8FF);
  ecDarkBrown   = TColor($00394D4D);
  ecBrown       = TColor($00555E66);
  ecLightBrown  = TColor($00829AA2);
  ecDarkKaki    = TColor($00D3D3D3);
  ecKaki        = TColor($00C8D7D7);
  ecLightKaki   = TColor($00E0E9EF);

  { Encarta & FlatStyle Interface Color Constants }
  ecBtnHighlight      = clWhite;
  ecBtnShadow         = clBlack;
  ecBtnFace           = ecLightKaki;
  ecBtnFaceDown       = ecKaki;
  ecFocused           = clWhite;
  ecScrollbar         = ecLightKaki;
  ecScrollbarThumb    = ecLightBrown;
  ecBackground        = clWhite;
  ecHint              = ecYellow;
  ecHintArrow         = clBlack;
  ecDot               = clBlack;
  ecTick              = clBlack;
  ecMenuBorder        = ecDarkBrown;
  ecMenu              = clBlack;
  ecMenuSelected      = ecDarkYellow;
  ecProgressBlock     = ecBlue;
  ecUnselectedTab     = ecBlue;
  ecSelection         = clNavy;
  ecCaptionBackground = clBlack;
  ecActiveCaption     = clWhite;
  ecInactiveCaption   = ecLightBrown;

  BS_XP_BTNFRAMECOLOR  = 8388608;
  BS_XP_BTNACTIVECOLOR = 13811126;
  BS_XP_BTNDOWNCOLOR   = 11899781;
  //define ipmaskedit
  IPMaskStr = '999\.999\.999\.999;1;'#32;
  IPStart   = '0.0.0.0';
  //定义水波字幕控制脚本
  TitleStart  = '<Title>';
  TitleEnd    = '</Title>';
  TitleSize   = '[Size:';
  TitleName   = '[Name:';
  TitleStyle  = '[Style:';
  TitleColor  = '[Color:';
  TitleLow    = '[Row:';
  TitlePitch  = '[Pitch:';
  TitleDraw3D = '[Draw3D:';
  WaterColor: array [0..17] of TWaterColor = (
  {00}(Value:clBlack;       enName:'clBlack'  ),
  {01}(Value:clWhite;       enName:'clWhite'  ),
  {02}(Value:clYellow;      enName:'clYellow' ),
  {03}(Value:clRed;         enName:'clRed'    ),
  {04}(Value:clFuchsia;     enName:'clFuchsia'),
  {05}(Value:clMaroon;      enName:'clMaroon' ),
  {06}(Value:clGreen;       enName:'clGreen'  ),
  {07}(Value:clAqua;        enName:'clAqua'   ),
  {08}(Value:clMoneyGreen;  enName:'clMoneyGreen'),
  {09}(Value:clBlue;        enName:'clBlue'   ),
  {10}(Value:clTeal;        enName:'clTeal'   ),
  {11}(Value:clSkyBlue;     enName:'clSkyBlue'),
  {12}(Value:clOlive;       enName:'clOlive'  ),
  {13}(Value:clNavy;        enName:'clNavy'   ),
  {14}(Value:clPurple;      enName:'clPurple' ),
  {15}(Value:clGray;        enName:'clGray'   ),
  {16}(Value:clSilver;      enName:'clSilver' ),
  {17}(Value:clLime;        enName:'clLime'   ));
  
//define components main version infomation
type
  { TVersionControl }
  TVersionControl = Class(TCustomControl)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
    property Font;
  end;

  { TVersionComboBox }
  TVersionComboBox = Class(TCustomComboBox)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionGraphic = class(TGraphicControl)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionTreeView = class(TCustomTreeView)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionListView = class(TCustomListView)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionMemo = class(TCustomMemo)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionEdit = class(TCustomEdit)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionComponent = class(TComponent)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionListBoxExt = class(TCustomListBox)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionDBGrid = class(TDBGrid)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;

  TVersionDrawGrid = class(TCustomDrawGrid)
  private
    FVersion: String;
    function GetVersion: String;
  published
    property Version: String read GetVersion write FVersion;
  end;
//定义 重画控件边界函数
function  DrawEditBorder(Border:TBorderAttrib; const Clip: HRGN=0):TColor;
procedure DrawButtonBorder(Canvas: TCanvas;Rect: TRect; Color: TColor; Width: Integer);
function  DrawViewBorder(ViewBorder: TBorderAttrib;const oVal:Byte=1):TColor;
procedure DrawInCheck(Canvas:TCanvas; Rect:TRect; Color:TColor);
//定义 重画透明背景
procedure DrawTransBitBlt(Cnv: TCanvas; x, y: Integer; Bmp: TBitmap; clTransparent: TColor);
//定义 画父背景图像
procedure DrawParentImage(Control: TControl; Dest: TCanvas);
function  CreateDisabledBitmap(FOriginal: TBitmap; OutlineColor, BackColor, HighlightColor, ShadowColor: TColor;
                               DrawHighlight: Boolean): TBitmap;
function  CalcAdvancedColor(ParentColor, OriginalColor: TColor; Percent: Byte; ColorType: TColorCalcType): TColor;
procedure CalcButtonLayout(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; Layout: TButtonLayout;
                           Spacing, Margin: Integer; FGlyph: TBitmap; FNumGlyphs: Integer;
                           const Caption: string; var TextBounds: TRect; var GlyphPos: TPoint);
function  Min(const A, B: Integer): Integer;
function  Max(const A, B: Integer): Integer;
function  GetFontMetrics(Font: TFont): TTextMetric;
function  GetFontHeight(Font: TFont): Integer;
function  RectInRect(R1, R2: TRect): Boolean;
procedure DrawBackdrop(Canvas:TCanvas; StartColor, StopColor: TColor; CanRect:TRect;Style:TStyleOrien);
function  IndexInCount(Index,Count:Integer):boolean;
procedure DrawFocusRect(Canvas:TCanvas;FocusRect:TRect;Height:Integer);
procedure SetTicketPoint(Value:TTicketPosition;Self,Ticket:TControl;TicketSpace:Integer);
procedure GetStyleText(Value:TAlignmentText; var Result:UINT);
procedure GetCheckBoxPosition(Value:TCheckPosition; var Result:UINT);  
procedure DrawCheckBox(BoxRect:TRect; Position:TCheckPosition; Size:Integer; Var CheckRect:TRect);
procedure GetBarPosition(ClientRect:TRect;TitleHas:boolean;TitlePosition:TTitlePosition;
                         Var BarsRect:TBarsRect; TitleHeight, BarHeight:Integer);
procedure BoxDrawBackDrop(Canvas:TCanvas;ColorStart,ColorStop:TColor;Style:TStyleOrien;
                          ClientRect:TRect;ItemColor:TColor;Face:TStyleFace);
procedure DrawBitmap(Canvas:TCanvas; DrawRect:TRect; Source:TBitmap);
procedure FlatDrawText(Canvas: TCanvas; Enabled: Boolean; Caption: TCaption; DrawRect:TRect; Format:uint);
function  CheckValue(Value,MaxValue,MinValue: LongInt): LongInt;
function  RectWidth(R: TRect): Integer;
function  RectHeight(R: TRect): Integer;
function  DrawEllipse(Handle: HDC; Rect: TRect): BOOL;
function  RectToCenter(var R: TRect; Bounds: TRect): TRect;
procedure CorrectTextbyWidth(C: TCanvas; var S: String; W: Integer);
//定义 IP控制函数
procedure IPEmpty(Var IP:TIP);
procedure IPValue(Var IP:TIP;Inx:Word;Value:TIPChar);
//定义 释放指针列表函数
procedure RemoveList(List:TList; State:TListState=lsClear);
//定义 重设列表区域函数
procedure SetEditRect(Handle:HWnd; ClientWidth,ClientHeight,Width:Integer);
//定义 水波字幕解析函数
procedure GetTitleParam(Var Font: TOtherParam; Var Title:String);
function  GetParamColor(Value:String):TColor;
function  GetParamDraw3D(Value:String): Boolean;
function  GetParamStyle(Value:String): TFontStyles;
function  GetParamValue(Var Value:String; Param:String):String;

var
  HSLRange: integer = 240;

implementation

procedure DrawInCheck(Canvas:TCanvas; Rect:TRect; Color:TColor);
var x,y,yTop:Word;
begin
 with Canvas, Rect do
 begin
  yTop := (Right - Left - 12) div 2;
     x :=  Left + yTop;
     y :=  Top + yTop;
  Pen.Color := Color;
  PenPos  := Point(x+2, y+5);
  LineTo(x+4,y+7);
  PenPos  := Point(x+4, y+7);
  LineTo(x+10,y+1);
  PenPos  := Point(x+2, y+6);
  LineTo(x+4,y+8);
  PenPos  := Point(x+4, y+8);
  LineTo(x+10,y+2);
  PenPos  := Point(x+2, y+7);
  LineTo(x+4,y+9);
  PenPos  := Point(x+4, y+9);
  LineTo(x+10,y+3);
 end;
end;

function DrawEditBorder(Border:TBorderAttrib; const Clip: HRGN=0):TColor;
var
  DC: HDC;
  R, BarRect: TRect;
  BtnFaceBrush, WindowBrush, FocusBrush: HBRUSH;
begin
 with Border do
 begin
  DC := GetWindowDC(Ctrl.Handle);
  try
    GetWindowRect(Ctrl.Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    BtnFaceBrush := CreateSolidBrush(ColorToRGB(BorderColor));
    WindowBrush  := CreateSolidBrush(ColorToRGB(FlatColor));
    FocusBrush   := CreateSolidBrush(ColorToRGB(FocusColor));
    BarRect      := Rect(R.Right - 20, R.Bottom - 20, R.Right - 1, R.Bottom - 1);
    if (not(csDesigning in DesignState) and (FocusState or MouseState)) then
    begin
      // Focus
      result := FocusColor;
      FrameRect(DC, R, BtnFaceBrush);
      InflateRect(R, -1, -1);
      FrameRect(DC, R, FocusBrush);
      InflateRect(R, -1, -1);
      FrameRect(DC, R, FocusBrush);
      if HasBars then FillRect(DC, BarRect , FocusBrush);
    end
    else
    begin
      // non Focus
      result := FlatColor;
      FrameRect(DC, R, BtnFaceBrush);
      InflateRect(R, -1, -1);
      FrameRect(DC, R, WindowBrush);
      InflateRect(R, -1, -1);
      FrameRect(DC, R, WindowBrush);
      if HasBars then FillRect(DC, BarRect, WindowBrush);
    end;
  finally
    ReleaseDC(Ctrl.Handle, DC);
  end;
  DeleteObject(WindowBrush);
  DeleteObject(BtnFaceBrush);
  DeleteObject(FocusBrush);
 end;
end;

procedure DrawButtonBorder(Canvas: TCanvas; Rect: TRect; Color: TColor; Width: Integer);
  procedure DoRect;
  var
    TopRight, BottomLeft: TPoint;
  begin
    with Canvas, Rect do begin
      TopRight.X   := Right;
      TopRight.Y   := Top;
      BottomLeft.X := Left;
      BottomLeft.Y := Bottom;
      Pen.Color    := Color;
      PolyLine([BottomLeft, TopLeft, TopRight]);
      Pen.Color    := Color;
      Dec(BottomLeft.X);
      PolyLine([TopRight, BottomRight, BottomLeft]);
    end;
  end;
begin
  Canvas.Pen.Width := 1;
  Dec(Rect.Bottom);
  Dec(Rect.Right);
  while Width > 0 do begin
    Dec(Width);
    DoRect;
    InflateRect(Rect, -1, -1);
  end;
  Inc(Rect.Bottom);
  Inc(Rect.Right);
end;

function  DrawViewBorder(ViewBorder: TBorderAttrib;const oVal:Byte=1):TColor;
var         
  R: TRect;
  memBmp:TControlCanvas;
begin
  memBmp:=TControlCanvas.Create;
  try
   with ViewBorder do
   begin
    memBmp.Handle := GetWindowDC(Ctrl.Handle);
    GetWindowRect(Ctrl.Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    if (not(csDesigning in DesignState) and (FocusState or MouseState)) then
    begin
      result := FocusColor;
    end
    else
    begin
      result := FlatColor;
    end;
    dec(r.Left,   oVal);
    dec(r.Top,    oVal);
    inc(r.Right,  oVal);
    inc(r.Bottom, oVal);
    InflateRect(R, -oVal, -oVal);
    DrawButtonBorder(memBmp, R, BorderColor, oVal);
   end;
  finally
    memBmp.FreeHandle;
    memBmp.Free;
  end;
end;

function  GetParamValue(Var Value:String; Param:String):String;
var
  FontS, FontL, Spliter : Integer;
  SubValue:String;
  function Find(Value:String;cur:Integer):integer;
  var inx:integer;
  begin
    result := cur;
    for inx := Cur to Length(Value) do
       if Value[inx]=']' then
       begin
          result := inx;
          exit;
       end;
  end;
begin
  if Pos(Param,Value) > 0 then
  begin
     FontS     := Pos(Param,Value);
     FontL     := FontS + Length(Param);
     Spliter   := Find(Value,FontS);
     Result    := Trim(Copy(Value,FontL,Spliter-FontL));
     SubValue  := format('%s%s]',[Param,Result]);
     Delete(Value,Pos(SubValue,Value),Length(SubValue));
  end else begin
     Result := '';
  end;
end;

function  GetParamStyle(Value:String): TFontStyles;
begin
 Result := [];
 if (Pos('BOLD', Value) > 0)or(Pos('0', Value)>0) then
    result := Result + [fsBold];
 if (Pos('ITALIC', Value) > 0)or(Pos('1', Value)>0) then
    result := Result + [fsItalic];
 if (Pos('UNDERLINE', Value) > 0)or(Pos('2', Value)>0) then
    result := Result + [fsUnderline];
 if (Pos('STRIKEOUT', Value) > 0)or(Pos('3', Value)>0) then
    result := Result + [fsStrikeOut];
end;

function  GetParamPitch(Value:String): TFontPitch;
begin
 Result := fpDefault;
 if (Pos('VARIABLE', Value) > 0)or(Pos('1', Value)>0) then
    result := fpVariable;
 if (Pos('Fixed', Value) > 0)or(Pos('2', Value)>0) then
    result := fpFixed;
end;

function  GetParamDraw3D(Value:String): Boolean;
begin
 Result := False;
 if (Pos('True', Value) > 0)or(Pos('1', Value)>0) then
    result := True;
end;

function  GetParamColor(Value:String):TColor;
var
   inx : Word;
   State: Boolean;
begin
   for inx := Low(WaterColor) to High(WaterColor) do
   begin
    State := UpperCase(WaterColor[inx].enName) = UpperCase(Value);
    if State then
    begin
       result := WaterColor[inx].Value;
       exit;
    end;
   end;
   if not State then
      result := TColor(StrToInt(Value))
   else
      Result := clBlack;
end;

procedure GetTitleParam(Var Font: TOtherParam; Var Title:String);
var
  Value, Param:String;
  FontS,FontE,Inx:Integer;
begin
 Value := Title;
 FontS := Pos(UpperCase(TitleStart), UpperCase(Value));
 FontE := Pos(UpperCase(TitleEnd), UpperCase(Value));
 Inx   := FontS + Length(TitleStart);
 Title := Copy(Value, Inx, FontE - Length(TitleEnd));
 if (FontS > 0) and (FontE > 0) then
 begin
    Inx   := FontE + Length(TitleEnd);
    Value := UpperCase(Copy(Value, Inx, Length(Value)));
    //解析 字体的大小
    Param := GetParamValue(Value, UpperCase(TitleSize));
    if Param <> '' then
       Font.Size  := StrToInt(Param)
    else
       Font.Size  := 8;
    //解析 字体的名称
    Param   := GetParamValue(Value, UpperCase(TitleName));
    if Param <> '' then
       Font.Name  := Param
    else
       Font.Name  := 'MS Sans Serif';
    //解析 字体的样式
    Param  := GetParamValue(Value, UpperCase(TitleStyle));
    if Param <> '' then
       Font.Style := GetParamStyle(Param)
    else
       Font.Style := [];
    //解析 字体的颜色
    Param  := GetParamValue(Value, UpperCase(TitleColor));
    if Param <> '' then
       Font.Color := GetParamColor(Param)
    else
       Font.Color := clWindowText;
    //解析 行距
    Param  := GetParamValue(Value, UpperCase(TitleLow));
    if Param <> '' then
       Font.Row := StrToInt(Param)
    else
       Font.Row := 0;
    Param  := GetParamValue(Value, UpperCase(TitlePitch));
    if Param <> '' then
       Font.Pitch := GetParamPitch(Param)
    else
       Font.Pitch := fpDefault;
    Param  := GetParamValue(Value, UpperCase(TitleDraw3D));
    if Param <> '' then
       Font.Draw3D := GetParamDraw3D(Param)
    else
       Font.Draw3D := False;
 end else begin
    Title := '';
 end;
end;

procedure SetEditRect(Handle:HWnd; ClientWidth,ClientHeight,Width:Integer);
var
  Loc: TRect;
begin
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
  Loc := Rect(0, 0, ClientWidth - Width - 3, ClientHeight);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
end;

procedure RemoveList(List:TList; State:TListState=lsClear);
var inx:integer;
begin
 //NO.1 free all the memory pointer
 for inx:=0 to List.Count - 1 do
     Dispose(List.Items[inx]);
 //NO.2 user select lsClear or lsFree to List;
 case State of
   lsClear : List.Clear;
   lsFree  : List.Free;
 end;
end;

procedure IPEmpty(Var IP:TIP);
begin
 IP.NO1 := ' 0 ';
 IP.NO2 := ' 0 ';
 IP.NO3 := ' 0 ';
 IP.NO4 := ' 0 ';
end;

procedure IPValue(Var IP:TIP;Inx:Word;Value:TIPChar);
begin
  case inx of
    1:IP.NO1 := Value;
    2:IP.NO2 := Value;
    3:IP.NO3 := Value;
    4:IP.NO4 := Value;
  end
end;

procedure CorrectTextbyWidth(C: TCanvas; var S: String; W: Integer);
var
  j: Integer;
begin
  j := Length(S);
  with C do
  begin
    if TextWidth(S) > w
    then
      begin
        repeat
          Delete(S, j, 1);
          Dec(j);
        until (TextWidth(S + '...') <= w) or (S = '');
        S := S + '...';
      end;
  end;
end;

function RectToCenter(var R: TRect; Bounds: TRect): TRect;
var
  OffsetLeft,OffsetTop:Integer;
begin
  OffSetLeft := (RectWidth(Bounds) - RectWidth(R)) div 2;
  OffsetTop  := (RectHeight(Bounds) - RectHeight(R)) div 2;
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, OffsetLeft, OffsetTop);
  OffsetRect(R, Bounds.Left, Bounds.Top);
  Result := R;
end;

function RectWidth(R: TRect): Integer;
begin
  Result := R.Right - R.Left;
end;

function RectHeight(R: TRect): Integer;
begin
  Result := R.Bottom - R.Top;
end;

function  CheckValue(Value,MaxValue,MinValue: LongInt): LongInt;
begin
  Result := Value;
  if (MaxValue <> MinValue) then
  begin
    if Value < MinValue then
       Result := MinValue
    else
      if Value > MaxValue then
         Result := MaxValue;
  end;
end;

procedure FlatDrawText(Canvas: TCanvas; Enabled: Boolean; Caption: TCaption; DrawRect:TRect; Format:uint);
begin
 with Canvas do begin
  brush.style := bsClear;
  InflateRect(DrawRect, -4, 0);
  if Enabled then begin
     DrawText(Handle, PChar(Caption), Length(Caption), DrawRect, Format);
  end else begin
     OffsetRect(DrawRect, 1, 1);
     Font.Color := clBtnHighlight;
     DrawText(Handle, PChar(Caption), Length(Caption), DrawRect, Format);
     OffsetRect(DrawRect, -1, -1);
     Font.Color := clBtnShadow;
     DrawText(Handle, PChar(Caption), Length(Caption), DrawRect, Format);
  end;
  InflateRect(DrawRect, +4, 0);
 end;
end;

procedure DrawBitmap(Canvas:TCanvas; DrawRect:TRect; Source:TBitmap);
begin
 Canvas.StretchDraw(DrawRect, Source);
end;

procedure BoxDrawBackdrop(Canvas:TCanvas;ColorStart,ColorStop:TColor;Style:TStyleOrien;
                          ClientRect:TRect;ItemColor:TColor;Face:TStyleFace);
begin
 if Face = fsDefault then begin
    canvas.Brush.Color := ItemColor;
    canvas.FillRect(ClientRect);
 end else begin
    DrawBackdrop(canvas,ColorStart,ColorStop,ClientRect,Style)
 end;
end;

procedure GetBarPosition(ClientRect:TRect;TitleHas:boolean;TitlePosition:TTitlePosition;
                         Var BarsRect:TBarsRect; TitleHeight, BarHeight:Integer);
begin
  with BarsRect do begin
    prevRect := ClientRect;
    downRect := ClientRect;
    if TitleHas then begin
       case TitlePosition of
        tsTop :begin
         prevRect.Top    := prevRect.Top    + TitleHeight;
         prevRect.Bottom := prevRect.Top    + BarHeight;
         downRect.Top    := downRect.Bottom - BarHeight;
        end;
        tsBottom:begin
         prevRect.Bottom := prevRect.Top + BarHeight;
         downRect.Bottom := downRect.Bottom - TitleHeight;
         downRect.Top    := downRect.Bottom - BarHeight;
        end;
       end;
    end else begin
         prevRect.Bottom := prevRect.Top    + BarHeight;
         downRect.Top    := downRect.Bottom - BarHeight;
    end;
  end;
end;

function Max(const A, B: Integer): Integer;
begin
  if A > B then
     Result := A
  else
     Result := B;
end;

procedure DrawCheckBox(BoxRect:TRect; Position:TCheckPosition; Size:Integer; Var CheckRect:TRect);
var
  RectPos:TPoint;
  xLeft,yTop,y:integer;
begin
  y := (BoxRect.Bottom - BoxRect.Top - Size) div 2;
  if Position = bpLeft then begin
     RectPos   := Point(BoxRect.Left, BoxRect.Top);
     CheckRect := Rect(RectPos.x +  3, RectPos.y + y, RectPos.x + Size, RectPos.y + Size + y);
  end else begin
     RectPos   := Point(BoxRect.Right, BoxRect.Top);
     CheckRect := Rect(RectPos.x - Size - 3 , RectPos.y + y, RectPos.x - Size-  6, RectPos.y + Size + y);
  end;
  xLeft := CheckRect.Bottom-CheckRect.Top;
  yTop  := CheckRect.Right -CheckRect.Left;
  CheckRect.Right := CheckRect.Left + Max(xLeft,yTop);
end;


procedure GetStyleText(Value:TAlignmentText; var Result:UINT);
begin
  case Value of
   stLeft   : result := DT_LEFT   or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
   stRight  : result := DT_RIGHT  or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
   stCenter : result := DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
  end;
end;

procedure GetCheckBoxPosition(Value:TCheckPosition; var Result:UINT);
begin
  case Value of
   bpLeft   : result := DT_LEFT   or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
   bpRight  : result := DT_RIGHT  or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
  end;
end;

procedure SetTicketPoint(Value:TTicketPosition;Self,Ticket:TControl;TicketSpace:Integer);
var result : TPoint;
begin
  case Value of
    poTop:    result := Point(Self.Left, Self.Top - Ticket.Height - TicketSpace);
    poBottom: result := Point(Self.Left, Self.Top + Self.Height + TicketSpace);
    poLeft :  result := Point(Self.Left - Ticket.Width - TicketSpace, Self.Top + ((Self.Height - Ticket.Height) div 2));
    poRight:  result := Point(Self.Left + Self.Width + TicketSpace, Self.Top + ((Self.Height - Ticket.Height) div 2));
  end;
  Ticket.SetBounds(result.x, result.y, Ticket.Width, Ticket.Height);
end;

procedure DrawFocusRect(Canvas:TCanvas;FocusRect:TRect;Height:Integer);
begin
  FocusRect := Rect(FocusRect.left + 2, FocusRect.top + 2, FocusRect.Right - 2, FocusRect.top + Height - 2);
  Canvas.DrawFocusRect(FocusRect);
end;

function IndexInCount(Index,Count:Integer):boolean;
begin
  result := (Index >= 0) and (Index < Count);
end;

procedure DrawBackdrop(Canvas:TCanvas; StartColor, StopColor: TColor; CanRect:TRect;Style:TStyleOrien);
   var
      iCounter, iBuffer, iFillStep: integer;
      bR1, bG1, bB1, bR2, bG2, bB2: byte;
      aColor1, aColor2: LongInt;
      dCurR, dCurG, dCurB, dRStep, dGStep, dBStep: double;
      iDrawLen, iDrawPos: integer;
      rCans : TRect;
      iLeft, iTop, iRight, iBottom: integer;
begin
      iLeft     := CanRect.Left;
      iTop      := CanRect.Top;
      iRight    := CanRect.Right;
      iBottom   := CanRect.Bottom;

      aColor1   := ColorToRGB(StartColor);
      bR1       := GetRValue(aColor1);
      bG1       := GetGValue(aColor1);
      bB1       := GetBValue(aColor1);

      aColor2   := ColorToRGB(StopColor);
      bR2       := GetRValue(aColor2);
      bG2       := GetGValue(aColor2);
      bB2       := GetBValue(aColor2);

      dCurR     := bR1;
      dCurG     := bG1;
      dCurB     := bB1;

      dRStep    := (bR2-bR1) / 31;
      dGStep    := (bG2-bG1) / 31;
      dBStep    := (bB2-bB1) / 31;

      if Style = bsHorizontal then
         iDrawLen := (iRight - iLeft)
      else
         iDrawLen := (iBottom - iTop);

      iFillStep  := (iDrawLen div 31) + 1;

      for iCounter := 0 to 31 do begin
          iBuffer            := iCounter * iDrawLen div 31;
          Canvas.Brush.Color := RGB(trunc(dCurR), trunc(dCurG), trunc(dCurB));
          dCurR              := dCurR + dRStep;
          dCurG              := dCurG + dGStep;
          dCurB              := dCurB + dBStep;
          if Style = bsHorizontal then begin
             iDrawPos    := iLeft + iBuffer + iFillStep;
             if iDrawPos > iRight then iDrawPos := iRight;
             rCans    := Rect(iLeft + iBuffer, iTop, iDrawPos, iBottom);
          end else begin
             iDrawPos := iTop + iBuffer + iFillStep;
             if iDrawPos > iBottom then iDrawPos := iBottom;
             rCans    := Rect(iLeft, iTop + iBuffer, iRight, iDrawPos);
          end;
          Canvas.FillRect(rCans);
      end;
end;

procedure DrawTransBitBlt(Cnv: TCanvas; x, y: Integer; Bmp: TBitmap; clTransparent: TColor);
var
  bmpXOR, bmpAND, bmpINV, bmpTAG: TBitmap;
  oldcol: Longint;
begin
  bmpAND    := TBitmap.Create;
  bmpINV    := TBitmap.Create;
  bmpXOR    := TBitmap.Create;
  bmpTAG := TBitmap.Create;
  try
    bmpAND.Width      := Bmp.Width;
    bmpAND.Height     := Bmp.Height;
    bmpAND.Monochrome := True;
    oldcol := SetBkColor(Bmp.Canvas.Handle, ColorToRGB(clTransparent)); 
    BitBlt(bmpAND.Canvas.Handle, 0, 0, Bmp.Width ,Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
    SetBkColor(Bmp.Canvas.Handle, oldcol);

    bmpINV.Width      := Bmp.Width;
    bmpINV.Height     := Bmp.Height;
    bmpINV.Monochrome := True;
    BitBlt(bmpINV.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, bmpAND.Canvas.Handle, 0, 0, NOTSRCCOPY);

    bmpXOR.Width  := Bmp.Width;
    bmpXOR.Height := Bmp.Height;
    BitBlt(bmpXOR.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
    BitBlt(bmpXOR.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, bmpINV.Canvas.Handle, 0, 0, SRCAND);

    bmpTAG.Width  := Bmp.Width;
    bmpTAG.Height := Bmp.Height;
    BitBlt(bmpTAG.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, Cnv.Handle, x, y, SRCCOPY);
    BitBlt(bmpTAG.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, bmpAND.Canvas.Handle, 0, 0, SRCAND);
    BitBlt(bmpTAG.Canvas.Handle, 0, 0,Bmp.Width,Bmp.Height, bmpXOR.Canvas.Handle, 0, 0, SRCINVERT);

    BitBlt(Cnv.Handle, x, y, Bmp.Width, Bmp.Height, bmpTAG.Canvas.Handle, 0, 0, SRCCOPY);
  finally 
    bmpXOR.Free;
    bmpAND.Free; 
    bmpINV.Free; 
    bmpTAG.Free; 
  end; 
end; 

procedure DrawParentImage(Control: TControl; Dest: TCanvas);
var
  SaveIndex: Integer;
  DC: HDC;
  Position: TPoint;
begin
  with Control do
  begin
    if Parent = nil then
      Exit;
    DC := Dest.Handle;
    SaveIndex := SaveDC(DC);
    {$IFDEF DFS_COMPILER_2}
    GetViewportOrgEx(DC, @Position);
    {$ELSE}
    GetViewportOrgEx(DC, Position);
    {$ENDIF}
    SetViewportOrgEx(DC, Position.X - Left, Position.Y - Top, nil);
    IntersectClipRect(DC, 0, 0, Parent.ClientWidth, Parent.ClientHeight);
    Parent.Perform(WM_ERASEBKGND, DC, 0);
    Parent.Perform(WM_PAINT, DC, 0);
    RestoreDC(DC, SaveIndex);
  end;
end;

function DrawEllipse(Handle: HDC; Rect:TRect): BOOL;
begin
  result := Ellipse(Handle, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
end;

function CreateDisabledBitmap(FOriginal: TBitmap; OutlineColor, BackColor, HighlightColor, ShadowColor: TColor; DrawHighlight: Boolean): TBitmap;
const
  ROP_DSPDxax = $00E20746;
var
  MonoBmp: TBitmap;
  IRect: TRect;
begin
  IRect := Rect(0, 0, FOriginal.Width, FOriginal.Height);
  Result := TBitmap.Create;
  try
    Result.Width := FOriginal.Width;
    Result.Height := FOriginal.Height;
    MonoBmp := TBitmap.Create;
    try
      with MonoBmp do begin
        Width := FOriginal.Width;
        Height := FOriginal.Height;
        Canvas.CopyRect(IRect, FOriginal.Canvas, IRect);
{$IFDEF DFS_DELPHI_3_UP}
        HandleType := bmDDB;
{$ENDIF}
        Canvas.Brush.Color := OutlineColor;
        if Monochrome then begin
          Canvas.Font.Color := clWhite;
          Monochrome := False;
          Canvas.Brush.Color := clWhite;
        end;
        Monochrome := True;
      end;
      with Result.Canvas do begin
        Brush.Color := BackColor;
        FillRect(IRect);
        if DrawHighlight then begin
          Brush.Color := HighlightColor;
          SetTextColor(Handle, clBlack);
          SetBkColor(Handle, clWhite);
          BitBlt(Handle, 1, 1, IRect.Right - IRect.Left, IRect.Bottom - IRect.Top, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
        end;
        Brush.Color := ShadowColor;
        SetTextColor(Handle, clBlack);
        SetBkColor(Handle, clWhite);
        BitBlt(Handle, 0, 0, IRect.Right - IRect.Left, IRect.Bottom - IRect.Top, MonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
      end;
    finally
      MonoBmp.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function HSLtoRGB (H, S, L: double): TColor;
var
  M1, M2: double;

  function HueToColourValue (Hue: double) : byte;
  var
    V : double;
  begin
    if Hue < 0 then
      Hue := Hue + 1
    else
      if Hue > 1 then
        Hue := Hue - 1;

    if 6 * Hue < 1 then
      V := M1 + (M2 - M1) * Hue * 6
    else
      if 2 * Hue < 1 then
        V := M2
      else
        if 3 * Hue < 2 then
          V := M1 + (M2 - M1) * (2/3 - Hue) * 6
        else
          V := M1;
    Result := round (255 * V)
  end;

var
  R, G, B: byte;
begin
  if S = 0 then
  begin
    R := round (255 * L);
    G := R;
    B := R
  end else begin
    if L <= 0.5 then
      M2 := L * (1 + S)
    else
      M2 := L + S - L * S;
    M1 := 2 * L - M2;
    R := HueToColourValue (H + 1/3);
    G := HueToColourValue (H);
    B := HueToColourValue (H - 1/3)
  end;

  Result := RGB (R, G, B)
end;

function HSLRangeToRGB (H, S, L : integer): TColor;
begin
  Result := HSLToRGB (H / (HSLRange-1), S / HSLRange, L / HSLRange)
end;

// Convert RGB value (0-255 range) into HSL value (0-1 values)

procedure RGBtoHSL (RGB: TColor; var H, S, L : double);

  function Max (a, b : double): double;
  begin
    if a > b then
      Result := a
    else
      Result := b
  end;

  function Min (a, b : double): double;
  begin
    if a < b then
      Result := a
    else
      Result := b
  end;

var
  R, G, B, D, Cmax, Cmin: double;
begin
  R := GetRValue (RGB) / 255;
  G := GetGValue (RGB) / 255;
  B := GetBValue (RGB) / 255;
  Cmax := Max (R, Max (G, B));
  Cmin := Min (R, Min (G, B));

// calculate luminosity
  L := (Cmax + Cmin) / 2;

  if Cmax = Cmin then  // it's grey
  begin
    H := 0; // it's actually undefined
    S := 0
  end else begin
    D := Cmax - Cmin;

// calculate Saturation
    if L < 0.5 then
      S := D / (Cmax + Cmin)
    else
      S := D / (2 - Cmax - Cmin);

// calculate Hue
    if R = Cmax then
      H := (G - B) / D
    else
      if G = Cmax then
        H  := 2 + (B - R) /D
      else
        H := 4 + (R - G) / D;

    H := H / 6;
    if H < 0 then
      H := H + 1
  end
end;

procedure RGBtoHSLRange(RGB: TColor; var H, S, L : integer);
var
  Hd, Sd, Ld: double;
begin
  RGBtoHSL (RGB, Hd, Sd, Ld);
  H := round (Hd * (HSLRange-1));
  S := round (Sd * HSLRange);
  L := round (Ld * HSLRange);
end;

function CalcAdvancedColor(ParentColor, OriginalColor: TColor; Percent: Byte; ColorType: TColorCalcType): TColor;
var
  H, S, L: integer;
begin
  if Percent <> 0 then
  begin
    RGBtoHSLRange(ColorToRGB(ParentColor), H, S, L);
    inc(L, 10);
    if ColorType = lighten then
      if L + Percent > 100 then
         L := 100
      else
        inc(L, Percent)
    else
      if L - Percent < 0 then
         L := 0
      else
         dec(L, Percent);

    Result := HSLRangeToRGB(H, S, L);
  end
  else
    Result := OriginalColor;
end;

procedure CalcButtonLayout(Canvas: TCanvas; const Client: TRect; const Offset: TPoint; Layout: TButtonLayout;
  Spacing, Margin: Integer; FGlyph: TBitmap; FNumGlyphs: Integer;
  const Caption: string; var TextBounds: TRect; var GlyphPos: TPoint);
var
  TextPos: TPoint;
  ClientSize, GlyphSize, TextSize: TPoint;
  TotalSize: TPoint;
begin
  // calculate the item sizes
  ClientSize := Point(Client.Right - Client.Left, Client.Bottom - Client.Top);

  if FGlyph <> nil then
    GlyphSize := Point(FGlyph.Width div FNumGlyphs, FGlyph.Height)
  else
    GlyphSize := Point(0, 0);

  if Length(Caption) > 0 then
    begin
      TextBounds := Rect(0, 0, Client.Right - Client.Left, 0);
      DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CALCRECT or DT_SINGLELINE);
      TextSize := Point(TextBounds.Right - TextBounds.Left, TextBounds.Bottom - TextBounds.Top);
    end
  else
    begin
      TextBounds := Rect(0, 0, 0, 0);
      TextSize := Point(0, 0);
    end;

  // If the layout has the glyph on the right or the left, then both the
  // text and the glyph are centered vertically.  If the glyph is on the top
  // or the bottom, then both the text and the glyph are centered horizontally.
  if Layout in [blGlyphLeft, blGlyphRight] then
  begin
    GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
    TextPos.Y := (ClientSize.Y - TextSize.Y + 1) div 2;
  end
  else
  begin
    GlyphPos.X := (ClientSize.X - GlyphSize.X + 1) div 2;
    TextPos.X := (ClientSize.X - TextSize.X + 1) div 2;
  end;

  // if there is no text or no bitmap, then Spacing is irrelevant
  if (TextSize.X = 0) or (GlyphSize.X = 0) then
    Spacing := 0;

  // adjust Margin and Spacing
  if Margin = -1 then
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(GlyphSize.X + TextSize.X, GlyphSize.Y + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X) div 3
      else
        Margin := (ClientSize.Y - TotalSize.Y) div 3;
      Spacing := Margin;
    end
    else
    begin
      TotalSize := Point(GlyphSize.X + Spacing + TextSize.X, GlyphSize.Y + Spacing + TextSize.Y);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X + 1) div 2
      else
        Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
    end;
  end
  else
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(ClientSize.X - (Margin + GlyphSize.X), ClientSize.Y - (Margin + GlyphSize.Y));
      if Layout in [blGlyphLeft, blGlyphRight] then
        Spacing := (TotalSize.X - TextSize.X) div 2
      else
        Spacing := (TotalSize.Y - TextSize.Y) div 2;
    end;
  end;

  case Layout of
    blGlyphLeft:
    begin
      GlyphPos.X := Margin;
      TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
    end;
    blGlyphRight:
    begin
      GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;
      TextPos.X := GlyphPos.X - Spacing - TextSize.X;
    end;
    blGlyphTop:
    begin
      GlyphPos.Y := Margin;
      TextPos.Y := GlyphPos.Y + GlyphSize.Y + Spacing;
    end;
    blGlyphBottom:
    begin
      GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
      TextPos.Y := GlyphPos.Y - Spacing - TextSize.Y;
    end;
  end;

  // fixup the result variables
  with GlyphPos do
  begin
    Inc(X, Client.Left + Offset.X);
    Inc(Y, Client.Top + Offset.Y);
  end;
  OffsetRect(TextBounds, TextPos.X + Client.Left + Offset.X, TextPos.Y + Client.Top + Offset.X);
end;

function Min(const A, B: Integer): Integer;
begin      
  if A > B then
     Result := B
  else
     Result := A;
end;

function GetFontMetrics(Font: TFont): TTextMetric;
var
  DC: HDC;
  SaveFont: HFont;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Result);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
end;

function GetFontHeight(Font: TFont): Integer;
begin
  with GetFontMetrics(Font) do
    Result := Round(tmHeight + tmHeight / 8);
end;

function RectInRect(R1, R2: TRect): Boolean;
begin
  Result := IntersectRect(R1, R1, R2);
end;

function CheckByte(Value:Byte):Byte;
begin
  result := Value;
  if Value <= Low(Byte) then
     result := 1;
  if Value >= High(Byte) then
     result := High(Byte);
end;
{ TVersionControl }

function TVersionControl.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionComboBox }

function TVersionComboBox.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionGraphic }

function TVersionGraphic.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionTreeView }

function TVersionTreeView.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionComponent }

function TVersionComponent.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionListView }

function TVersionListView.GetVersion: String;
begin
  Result := FileVersion; 
end;

{ TVersionMemo }

function TVersionMemo.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionEdit }

function TVersionEdit.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionListBoxExt }

function TVersionListBoxExt.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionDBGrid }

function TVersionDBGrid.GetVersion: String;
begin
  Result := FileVersion;
end;

{ TVersionDrawGrid }

function TVersionDrawGrid.GetVersion: String;
begin
  Result := FileVersion;
end;

end.
