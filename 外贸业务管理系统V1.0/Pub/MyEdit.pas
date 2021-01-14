unit MyEdit;

{$S-,W-,R-,H+,X+}
{$C PRELOAD}

interface

uses Messages, Windows, SysUtils, Classes, Controls, Forms, Menus, Graphics,
  StdCtrls,Dialogs;
const
  BWidth=5;
  BHeigh=5;
  type
  TMyEdit = class;

{the main class}
  TMyEdit = class(TCustomEdit) // TControl  TCustomLabel
  private
    FPen: TPen;
    FBrush: TBrush;
    FOnMouseEnter: TNotifyEvent;

    FCanMove:Boolean;
    FFocused:Boolean;
    FSelect:Boolean;
    FIndex:integer;
    FNum:integer;

    procedure SetPen(Value: TPen);
    procedure CMMouseEnter(var Msg:TMessage); message CM_MOUSEENTER;
    function GetCanMove:Boolean;
    procedure SetCanMove(const val:Boolean);
    procedure SetIndex(const Value: Integer);
    procedure SetSelect(const Value: Boolean);
    procedure SetFFocused(const Value: Boolean);
    procedure SetFNum(const Value: Integer);
  protected
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure DoEnter;override;
//    procedure DoExit;override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property IsFocused:Boolean read FFocused write SetFFocused;
    procedure SetFocus; virtual;
    procedure Paint;


  published
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    procedure StyleChanged(Sender: TObject);
    property Align;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption;
    property Color;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;

    property CanMove:Boolean read GetCanMove write SetCanMove;
    property ShapeIndex:Integer read FIndex write SetIndex;
    property Select:Boolean read FSelect write SetSelect;
    property Num:Integer read FNum write SetFNum;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyEdit', [TMyEdit]);
end;


procedure TMyEdit.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TMyEdit.Paint;
var
  X, Y, W, H, S: Integer;
  OldPen:TPen;
  OldBrush:TBrush;
  i:integer;
  DX,DY:array of integer;
  N:single;
begin
  //inherited Paint;
  with inherited Canvas do
  begin
    if IsFocused then begin
      Pen.Color :=clblack;
    end
    else begin
      Pen := FPen;
      Brush := FBrush;
    end;
    X := Pen.Width div 2;
    Y := X;
    W := Width - Pen.Width + 1;
    H := Height - Pen.Width + 1;
    if Pen.Width = 0 then
    begin
      Dec(W);
      Dec(H);
    end;
    if W < H then
      S := W
    else
      S := H;
    if IsFocused then
    begin
      Brush.Color:=clblack;
      Rectangle(x,y,x+5,y+5);
      Rectangle(x+w-5,y,x+w,y+5);

      Rectangle(x+(w div 2) -5, y, x+(w div 2), y+5);
      Rectangle(x+(w div 2) -5, y+h-5, x+(w div 2), y+h);

      Rectangle(x, y+(h div 2)-5, x+5, y+(h div 2));
      Rectangle(x+w -5,y+(h div 2)-5, x+w, y+(h div 2));

      Rectangle(x, y+h-5, x+5, y+h);
      Rectangle(x+w-5, y+h-5, x+w, y+h);
      Brush:=FBrush;
    end;
  end;

end;
//  TShapeType = (stNone,stPolygon,stRectangle, stSquare, stRoundRect, stRoundSquare,
//    stEllipse, stCircle,stLine);

constructor TMyEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 100;
  Height := 120;
  //Font.Color:=clred;
  Font.Name :='ËÎÌו';
  Font.Size:=12;
  FPen := TPen.Create;
  //FPen.Mode :=pmMask;
  FPen.OnChange := StyleChanged;
  FBrush := TBrush.Create;
  FNum:=5;
  FBrush.OnChange := StyleChanged;
  FIndex:=0;
  Alignment:=taLeftJustify;
  Layout :=tlCenter;
  CanMove:=true;
  Select:=False;
  IsFocused:=false;
  WordWrap:=true;
end;

destructor TMyEdit.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  inherited Destroy;
end;
procedure TMyEdit.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;
procedure TMyEdit.CMMouseEnter(var Msg: TMessage);
begin
  inherited;
  if Assigned (FOnMouseEnter) then FOnMouseEnter(Self);
end;

procedure TMyEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
//  if CanMove then begin
  IsFocused:=true;
  Select:=true;
  invalidate;
  SetFocus;
//  end;
end;
procedure TMyEdit.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //if Assigned(FOnKeyDown) then FOnKeyDown(Self, Key, Shift);
end;

procedure TMyEdit.SetCanMove(const val: Boolean);
begin
  if FCanMove<>Val then begin
    FCanMove:=val;
    invalidate;
  end;
end;

function TMyEdit.GetCanMove: Boolean;
begin
  result:=FCanMove;
end;
{
procedure TMyShape.DoEnter;
begin
  inherited;
  self.SetFocus ;
  invalidate;
end;

procedure TMyShape.DoExit;
begin
  inherited;
//  Select:=False;
  invalidate;
end;
}
procedure TMyEdit.SetIndex(const Value: Integer);
begin
  if FIndex<>value then
    FIndex := Value;
end;

procedure TMyEdit.SetSelect(const Value: Boolean);
begin
  if FSelect<>Value then begin
    FSelect := Value;
    invalidate;
  end;
end;

procedure TMyEdit.SetFFocused(const Value: Boolean);
begin
  if FFocused<>value then begin
    FFocused := Value;
    invalidate;
  end;
end;

procedure TMyEdit.SetFNum(const Value: Integer);
begin
  if FNum<>Value then begin
    if value<3 then exit;
    FNum := Value;
    invalidate;
  end;
end;
procedure TMyEdit.SetFocus;
var
  Parent: TCustomForm;
begin
  Parent := GetParentForm(Self);
  if Parent <> nil then
    //Parent.FocusControl(Self as TWinControl)
  //else if ParentWindow <> 0 then
   // Windows.SetFocus(Handle)
  else
    ValidParentForm(Self);
end;

end.
