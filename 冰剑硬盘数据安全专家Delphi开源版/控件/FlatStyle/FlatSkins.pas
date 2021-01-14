unit FlatSkins;

interface

{$I FlatStyle.inc}

uses Classes, Messages, Graphics, Controls, FlatUtils, Forms;

Type
  { TFlatSkin }
  TFlatSkin = class(TGraphicsObject)
  private
    FBarStartColor: TColor;
    FBarStopColor: TColor;
    FBackStartColor: TColor;
    FBackStopColor: TColor;
    FItemStartColor: TColor;
    FItemStopColor: TColor;
    FBarOrien: TStyleOrien;
    FBackdropOrien: TStyleOrien;
    FItemOrien: TStyleOrien;
    FNotify: IChangeNotifier;
    FItemRectColor: TColor;
    FBorderColor: TColor;
    FItemSelectColor: TColor;
    FBarColor: TColor;
    FTransparent: TTransparentMode;
    FBarArrowColor: TColor;
    FItemFrameColor: TColor;
    FBackdropColor: TColor;
    FTitleColor: TColor;
    FTitleStartColor: TColor;
    FTitleStopColor: TColor;
    FTitleOrien: TStyleOrien;
    FTitleAlignment: TAlignmentText;
    FBarTopBitmap: TBitmap;
    FBarDownBitmap: TBitmap;
    FBackBitmap: TBitmap;
    FTitleBitmap: TBitmap;
    FBarUseBitmap: boolean;
    FBackUseBitmap: boolean;
    FTitleUseBitmap: boolean;
    FItemLineHas: boolean;
    FItemLineColor: TColor;
    FUserFace: TStyleFace;
    FBarsHeight: integer;
    FItemHeight: integer;
    FTitleHeight: integer;
    FTitlePosition: TTitlePosition;
    FTitleHas: boolean;
    FScrollBars: Boolean;
    FTitleFont: TFont;
    FParentFont: boolean;
    FParent: TControl;
    FBackFocusColor: TColor;
    procedure SetColors(const Index: Integer; const Value: TColor);
    procedure SetOriens(const Index: Integer; const Value: TStyleOrien);
    procedure SetTransparent(const Value: TTransparentMode);
    procedure SetTitleAlignment(const Value: TAlignmentText);
    procedure SetBitmaps(const Index: Integer; const Value: TBitmap);
    procedure SetUseBitmap(const Index: Integer; const Value: boolean);
    procedure SetUserFace(const Value: TStyleFace);
    procedure SetHeights(Index, Value: integer);
    procedure SetTitlePosition(const Value: TTitlePosition);
    procedure SetTitleHas(const Value: boolean);
    procedure SetScrollBars(const Value: Boolean);
    procedure SetTitleFont(const Value: TFont);
    procedure FontChanged(Sender: TObject);
    procedure SetParentFont(const Value: boolean);
    function GetParent: TControl;
  protected
    property StyleNotify: IChangeNotifier read FNotify write FNotify;
  public
    procedure Changed; override;
    procedure Assign(Source: TPersistent); override;
    constructor Create;
    destructor Destroy;override;
    property Parent: TControl read GetParent write FParent;
  published
    property BarStopColor: TColor index 0 read FBarStopColor write SetColors default DefaultColorStop;
    property BarStartColor: TColor index 1 read FBarStartColor write SetColors default DefaultColorStart;
    property BackStopColor: TColor index 2 read FBackStopColor write SetColors default DefaultColorStop;
    property BackStartColor: TColor index 3 read FBackStartColor write SetColors default DefaultColorStart;
    property ItemStopColor: TColor index 4 read FItemStopColor write SetColors default DefaultItemColorStop;
    property ItemStartColor: TColor index 5 read FItemStartColor write SetColors default DefaultItemColorStart;
    property ItemSelectColor: TColor index 7 read FItemSelectColor write SetColors default $009CDEF7;
    property BorderColor: TColor index 8 read FBorderColor write SetColors default DefaultBorderColor;
    property BarColor: TColor index 9 read FBarColor write SetColors default DefaultBarColor;
    property BarArrowColor: TColor index 10 read FBarArrowColor write SetColors default clBlack;
    property ItemFrameColor: TColor index 11 read FItemFrameColor write SetColors default DefaultBorderColor;
    property BackdropColor: TColor index 12 read FBackdropColor write SetColors default DefaultBackdropColor;
    property TitleStartColor: TColor index 13 read FTitleStartColor write SetColors default DefaultColorStart;
    property TitleStopColor: TColor index 14 read FTitleStopColor write SetColors default DefaultColorStop;
    property TitleColor: TColor index 15 read FTitleColor write SetColors default defaultTitleColor;
    property ItemLineColor: TColor index 16 read FItemLineColor write SetColors default DefaultItemLineColor;
    property BackFocusColor: TColor index 17 read FBackFocusColor write SetColors default DefaultFlatColor;

    property BarOrien: TStyleOrien index 0 read FBarOrien write SetOriens default DefaultStyleVertical;
    property BackdropOrien:TStyleOrien index 1 read FBackdropOrien write SetOriens default DefaultStyleHorizontal;
    property ItemOrien: TStyleOrien index 2 read FItemOrien write SetOriens default DefaultStyleVertical;
    property TitleOrien: TStyleOrien index 3 read FTitleOrien write SetOriens default bsVertical;

    property BarTopBitmap: TBitmap index 0 read FBarTopBitmap write SetBitmaps;
    property BarDownBitmap: TBitmap index 1 read FBarDownBitmap write SetBitmaps;
    property BackBitmap: TBitmap index 2 read FBackBitmap write SetBitmaps;
    property TitleBitmap: TBitmap index 3 read FTitleBitmap write SetBitmaps;

    property BarUseBitmap: boolean index 0 read FBarUseBitmap write SetUseBitmap default false;
    property BackUseBitmap: boolean index 1 read FBackUseBitmap write SetUseBitmap default false;
    property TitleUseBitmap: boolean index 2 read FTitleUseBitmap write SetUseBitmap default false;
    property ItemLineHas: boolean index 3 read FItemLineHas write SetUseBitmap default false;

    property TitleAlignment: TAlignmentText read FTitleAlignment write SetTitleAlignment default stCenter;
    property Transparent: TTransparentMode read FTransparent write SetTransparent default tmNone;
    property UserFace: TStyleFace read FUserFace write SetUserFace default DefaultStyleFace;
    property TitlePosition: TTitlePosition read FTitlePosition write SetTitlePosition default tsTop; 

    property BarsHeight: integer index 0 read FBarsHeight write SetHeights default DefaultBarsHeight;
    property ItemHeight: integer index 1 read FItemHeight write SetHeights default DefaultItemHeight;
    property TitleHeight: integer index 2 read FTitleHeight write SetHeights default DefaultTitleHeight;
    property TitleHas: boolean read FTitleHas write SetTitleHas default true;
    property ScrollBars: Boolean read FScrollBars write SetScrollBars default True;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property ParentFont: boolean read FParentFont write SetParentFont default true;
  end;

  { TListStyle }
  TListStyle = class(TFlatSkin)
  private
    FItemAlignment: TAlignmentText;
    procedure SetItemAlignment(const Value: TAlignmentText);
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create;
  published
    property ItemAlignment: TAlignmentText read FItemAlignment write SetItemAlignment default stLeft;
  end;

  { TCheckStyle }
  TCheckStyle = class(TFlatSkin)
  private
    FSelectPosition: TCheckPosition;
    FSelectColor: TColor;
    FSelectBackdropColor: TColor;
    FSelectBorderColor: TColor;
    FSelectSize: Integer;
    FSelectStartColor: TColor;
    FSelectStopColor: TColor;
    FSelectOrien: TStyleOrien;
    FSelectCheckColor: TColor;
    procedure SetColors(const Index: Integer; const Value: TColor);
    procedure SetSelectPosition(const Value: TCheckPosition);
    procedure SetSelectSize(Value: Integer);
    procedure SetSelectOrien(const Value: TStyleOrien);
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create;
  published
    property SelectPosition: TCheckPosition read FSelectPosition write SetSelectPosition default bpLeft;
    property SelectColor: TColor index 0 read FSelectColor write SetColors default clPurple;
    property SelectBackdropColor: TColor index 1 read FSelectBackdropColor write SetColors default DefaultCheckBackColor;
    property SelectBorderColor: TColor index 2 read FSelectBorderColor write SetColors default DefaultCheckBorderColor;
    property SelectStartColor: TColor index 3 read FSelectStartColor write SetColors default DefaultSelectStartColor;
    property SelectStopColor: TColor index 4 read FSelectStopColor write SetColors  default DefaultSelectStopColor;
    property SelectCheckColor: TColor index 5 read FSelectCheckColor  write SetColors default DefaultFlatColor;
    property SelectOrien: TStyleOrien read FSelectOrien write SetSelectOrien default bsVertical;
    property SelectSize: Integer read FSelectSize write SetSelectSize default 12;
  end;

implementation

{ TFlatSkin }

procedure TFlatSkin.Assign(Source: TPersistent);
begin
  if Source is TFlatSkin then
  begin
     FBarTopBitmap    := TFlatSkin(Source).BarTopBitmap;
     FBarDownBitmap   := TFlatSkin(Source).BarDownBitmap;
     FBackBitmap      := TFlatSkin(Source).BackBitmap;
     FTitleBitmap     := TFlatSkin(Source).TitleBitmap;
     FTitleFont       := TFlatSkin(Source).TitleFont;
     
     fBarStopColor    := TFlatSkin(Source).BarStopColor;
     fBarStartColor   := TFlatSkin(Source).BarStartColor;
     fBarOrien        := TFlatSkin(Source).BarOrien;
     fBarColor        := TFlatSkin(Source).BarColor;
     FBarArrowColor   := TFlatSkin(Source).BarArrowColor;

     fBackStopColor   := TFlatSkin(Source).BackStopColor;
     fBackStartColor  := TFlatSkin(Source).BackStartColor;
     fBackdropOrien   := TFlatSkin(Source).BackdropOrien;
     FBackdropColor   := TFlatSkin(Source).BackdropColor;
     FBackFocusColor  := TFlatSkin(Source).BackFocusColor;

     FItemStopColor   := TFlatSkin(Source).ItemStopColor;
     fItemStartColor  := TFlatSkin(Source).ItemStartColor;
     fItemOrien       := TFlatSkin(Source).ItemOrien;
     FItemSelectColor := TFlatSkin(Source).ItemSelectColor;
     FItemFrameColor  := TFlatSkin(Source).ItemFrameColor;
     FItemLineColor   := TFlatSkin(Source).ItemLineColor;
     FItemLineHas     := TFlatSkin(Source).ItemLineHas;

     FTitleOrien      := TFlatSkin(Source).TitleOrien;
     FTitleStartColor := TFlatSkin(Source).TitleStartColor;
     FTitleStopColor  := TFlatSkin(Source).TitleStopColor;
     FTitleColor      := TFlatSkin(Source).TitleColor;
     FTitleAlignment  := TFlatSkin(Source).TitleAlignment;

     FBarUseBitmap    := TFlatSkin(Source).BarUseBitmap;
     FBackUseBitmap   := TFlatSkin(Source).BackUseBitmap;
     FTitleUseBitmap  := TFlatSkin(Source).TitleUseBitmap;

     FTransparent     := TFlatSkin(Source).Transparent;
     FUserFace        := TFlatSkin(Source).UserFace;
     FBarsHeight      := TFlatSkin(Source).BarsHeight;
     FItemHeight      := TFlatSkin(Source).ItemHeight;
     FTitleHeight     := TFlatSkin(Source).TitleHeight;
     FTitlePosition   := TFlatSkin(Source).TitlePosition;
     FTitleHas        := TFlatSkin(Source).TitleHas;
     FScrollBars      := TFlatSkin(Source).ScrollBars;
     FParentFont      := TFlatSkin(Source).ParentFont;
     Changed;
     Exit;
  end;
  inherited Assign(Source);
end;

procedure TFlatSkin.Changed;
begin
  inherited Changed;
  if FNotify <> nil then FNotify.Changed;
end;

procedure TFlatSkin.FontChanged(Sender: TObject);
begin
  Changed;
end;

constructor TFlatSkin.Create;
begin
  inherited Create;
  FBarTopBitmap       := TBitmap.Create;
  FBarDownBitmap      := TBitmap.Create;
  FBackBitmap         := TBitmap.Create;
  FTitleBitmap        := TBitmap.Create;
  FTitleFont          := TFont.Create;
  FTitleFont.OnChange := FontChanged;
  FBarStopColor    := DefaultColorStop;
  FBarStartColor   := DefaultColorStart;
  FBarColor        := DefaultBarColor;
  FBarArrowColor   := clBlack;
  FBarOrien        := DefaultStyleVertical;

  FBackStopColor   := DefaultColorStop;
  FBackStartColor  := DefaultColorStart;
  FBackdropOrien   := DefaultStyleHorizontal;
  FBackdropColor   := DefaultBackdropColor;
  FBackFocusColor  := DefaultFlatColor;
  
  FItemStopColor   := DefaultItemColorStop;
  FItemStartColor  := DefaultItemColorStart;
  FItemRectColor   := DefaultItemRectColor;
  FItemSelectColor := $009CDEF7;
  FItemOrien       := DefaultStyleVertical;
  FItemFrameColor  := DefaultBorderColor;
  FItemLineColor   := DefaultItemLineColor;
  FItemLineHas     := False;

  FTitleOrien      := bsVertical;
  FTitleStartColor := DefaultColorStart;
  FTitleStopColor  := DefaultColorStop;
  FTitleColor      := defaultTitleColor;
  FTitleAlignment  := stCenter;
  FTitlePosition   := tsTop;

  FBorderColor     := DefaultBorderColor;

  FBarUseBitmap    := false;
  FBackUseBitmap   := false;
  FTitleUseBitmap  := false;

  FUserFace        := DefaultStyleFace;
  FTransparent     := tmNone;
  FBarsHeight      := DefaultBarsHeight;
  FItemHeight      := DefaultItemHeight;
  FTitleHeight     := DefaultTitleHeight;
  FTitleHas        := true;
  FScrollBars      := True;
  FParentFont      := True;
end;

destructor TFlatSkin.Destroy;
begin
  FTitleFont.Free;
  FTitleBitmap.Free;
  FBarTopBitmap.Free;
  FBarDownBitmap.Free;
  FBackBitmap.Free;
  inherited Destroy;
end;

procedure TFlatSkin.SetBitmaps(const Index: Integer; const Value: TBitmap);
begin
  case index of
   0:FBarTopBitmap.Assign(Value);
   1:FBarDownBitmap.Assign(Value);
   2:FBackBitmap.Assign(Value);
   3:FTitleBitmap.Assign(Value);
  end;
  Changed;
end;

procedure TFlatSkin.SetColors(const Index: Integer; const Value: TColor);
begin
  case index of
    0:FBarStopColor     := Value;
    1:FBarStartColor    := Value;
    2:FBackStopColor    := Value;
    3:FBackStartColor   := Value;
    4:FItemStopColor    := Value;
    5:FItemStartColor   := Value;
    6:FItemRectColor    := Value;
    7:FItemSelectColor  := Value;
    8:FBorderColor      := Value;
    9:FBarColor         := Value;
   10:FBarArrowColor    := Value;
   11:FItemFrameColor   := Value;
   12:FBackdropColor    := Value;
   13:FTitleStartColor  := Value;
   14:FTitleStopColor   := Value;
   15:FTitleColor       := Value;
   16:FItemLineColor    := Value;
   17:FBackFocusColor   := Value;
  end;
  Changed;
end;

procedure TFlatSkin.SetHeights(Index, Value: integer);
begin
  case index of
    0:begin
      if Value < 12 then
         Value := 12;
      FBarsHeight  := value;
      end;
    1:begin
      if Value < 17 then
         Value := 17;
      FItemHeight  := value;
      end;
    2:begin
      if Value < 18 then
         value := 18;
      FTitleHeight := Value;
      end;
  end;
  Changed;
end;

procedure TFlatSkin.SetOriens(const Index: Integer; const Value: TStyleOrien);
begin
  case index of
    0:FBarOrien      := Value;
    1:FBackdropOrien := Value;
    2:FItemOrien     := Value;
    3:FTitleOrien    := Value;
  end;
  Changed;
end;

procedure TFlatSkin.SetScrollBars(const Value: Boolean);
begin
  if FScrollBars <> value then begin
     FScrollBars := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetTitleAlignment(const Value: TAlignmentText);
begin
  if FTitleAlignment <> value then begin
     FTitleAlignment := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetTitleFont(const Value: TFont);
begin
  if FTitleFont <> Value then
  begin
     FTitleFont.Assign(Value);
     FParentFont := false;
  end;
end;

procedure TFlatSkin.SetTitleHas(const Value: boolean);
begin
  if FTitleHas <> value then begin
     FTitleHas := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetTitlePosition(const Value: TTitlePosition);
begin
  if FTitlePosition <> Value then begin
     FTitlePosition := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetTransparent(const Value: TTransparentMode);
begin
  if FTransparent <> Value then begin
     FTransparent := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetUseBitmap(const Index: Integer; const Value: boolean);
begin
  case index of
   0:FBarUseBitmap   := Value;
   1:FBackUseBitmap  := Value;
   2:FTitleUseBitmap := Value;
   3:FItemLineHas    := Value;
  end;
  Changed;
end;

procedure TFlatSkin.SetUserFace(const Value: TStyleFace);
begin
  if FUserFace <> Value then begin
     FUserFace := Value;
     Changed;
  end;
end;

procedure TFlatSkin.SetParentFont(const Value: boolean);
begin
  if FParentFont <> Value then begin
     FParentFont := Value;
     if (FParentFont)and(FParent<>nil) then begin
         FTitleFont.Assign(TVersionControl(Parent).Font);
     end;
     Changed;
  end;
end;

function TFlatSkin.GetParent: TControl;
begin
  Result := FParent;
end;

{ TCheckStyle }

procedure TCheckStyle.Assign(Source: TPersistent);
begin
  if Source is TCheckStyle then
  begin
     FSelectColor         := TCheckStyle(Source).SelectColor;
     FSelectBackdropColor := TCheckStyle(Source).SelectBackdropColor;
     FSelectBorderColor   := TCheckStyle(Source).SelectBorderColor;
     FSelectPosition      := TCheckStyle(Source).SelectPosition;
     FSelectSize          := TCheckStyle(Source).SelectSize;
     FSelectCheckColor    := TCheckStyle(Source).SelectCheckColor;
     FSelectStartColor    := TCheckStyle(Source).SelectStartColor;
     FSelectStopColor     := TCheckStyle(Source).SelectStopColor;
     FSelectOrien         := TCheckStyle(Source).SelectOrien;
     Changed;
     Exit;
  end;
  inherited Assign(Source);
end;

constructor TCheckStyle.Create;
begin
  inherited Create;
  FSelectColor         := DefaultCheckSelectColor;
  FSelectBackdropColor := DefaultCheckBackColor;
  FSelectBorderColor   := DefaultCheckBorderColor;
  FSelectStartColor    := DefaultSelectStartColor;
  FSelectStopColor     := DefaultSelectStopColor;
  FSelectOrien         := bsVertical;
  FSelectSize          := 12;
  FSelectCheckColor    := DefaultFlatColor;
end;

procedure TCheckStyle.SetColors(const Index: Integer; const Value: TColor);
begin
  case index of
   0:FSelectColor         := Value;
   1:FSelectBackdropColor := Value;
   2:FSelectBorderColor   := Value;
   3:FSelectStartColor    := Value;
   4:FSelectStopColor     := Value;
   5:FSelectCheckColor    := Value;
  end;
  Changed;
end;

procedure TCheckStyle.SetSelectPosition(const Value: TCheckPosition);
begin
  if FSelectPosition <> value then begin
     FSelectPosition := Value;
     Changed;
  end;
end;

procedure TCheckStyle.SetSelectOrien(const Value: TStyleOrien);
begin
  if FSelectOrien <> value then begin
     FSelectOrien := Value;
     Changed;
  end;
end;

procedure TCheckStyle.SetSelectSize(Value: Integer);
begin
  if FSelectSize <> value then begin
     if Value  < 12 then
        Value := 12;
     FSelectSize := Value;
     Changed;
  end;
end;

{ TListStyle }

procedure TListStyle.Assign(Source: TPersistent);
begin
  if Source is TListStyle then
  begin
     FItemAlignment := TListStyle(Source).ItemAlignment;
     Changed;
     exit;
  end;
  inherited Assign(Source);
end;

constructor TListStyle.Create;
begin
  inherited Create;
  FItemAlignment := stLeft;
end;

procedure TListStyle.SetItemAlignment(const Value: TAlignmentText);
begin
  if FItemAlignment <> Value then begin
     FItemAlignment := Value;
     Changed;
  end;
end;

end.
