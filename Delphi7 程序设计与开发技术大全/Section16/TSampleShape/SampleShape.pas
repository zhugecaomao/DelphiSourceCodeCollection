unit SampleShape;

interface

uses
  SysUtils, Classes, Controls,Graphics;

type
  TSampleShapeType = (sstRectangle, sstSquare, sstRoundRect, sstRoundSquare,
    sstEllipse, sstCircle); 
  TSampleShape = class(TGraphicControl)
  private
    { Private declarations }

    FPen: TPen;      {pen对象域}
    FBrush: TBrush;  {brush对象域}
    FShape: TSampleShapeType;  {保存属性值的域 }

    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);


    procedure SetShape(Value: TSampleShapeType);

  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;   {记住override指令}
    destructor Destroy; override;                   {记住override指令}
  published
    { Published declarations }

    procedure StyleChanged(Sender: TObject);


    property Brush: TBrush read FBrush write SetBrush;
    property Pen: TPen read FPen write SetPen;


    property Height default 65;
    property Width default 65;

    property Shape: TSampleShapeType read FShape write SetShape;

    property DragCursor;                 {拖放属性}
    property DragMode;
    property OnDragDrop;                {拖放事件}
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;              {鼠标事件}
    property OnMouseMove;
    property OnMouseUp;                  

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TSampleShape]);
end;

constructor TSampleShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);  {必须首先调用继承的构造方法}
  Width := 65;
  Height := 65;
  FPen := TPen.Create;                          {构造Pen}
  FPen.OnChange := StyleChanged;                    {指定OnChange事件的方法}
  FBrush := TBrush.Create;                           {构造Brush}
  FBrush.OnChange := StyleChanged;                  {指定OnChange事件的方法}
end;


procedure TSampleShape.SetShape(Value: TSampleShapeType);
begin
  if FShape <> Value then                           {如果不变则忽略}
  begin
    FShape := Value;                               {存储新值}
    Invalidate;                                    {强制重新绘制形状}
  end;
end;

procedure TSampleShape.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);                         {使用参数替换现存的Brush}
end;

procedure TSampleShape.SetPen(Value: TPen);
begin
  FPen.Assign(Value);                           {使用参数替换现存的Pen}
end;

destructor TSampleShape.Destroy;
begin
  FPen.Free;                                    {销毁Pen对象}
  FBrush.Free;                                  {销毁Brush对象}
  inherited Destroy;                              {必须调用继承的析构方法}
end;

procedure TSampleShape.StyleChanged(Sender: TObject);
begin
  Invalidate;                                       {删除并重画组件}
end;

procedure TSampleShape.Paint;
var
  X, Y, W, H, S: Integer;
begin
  with Canvas do
  begin
    Pen := FPen;                                    {拷贝组件的Pen }
    Brush := FBrush;                                {拷贝组件的Brush }
    W := Width;                                    {使用组件宽度}
    H := Height;                                    {使用组件高度}

    if W < H then S := W else S := H;                   {保存最短的边}
    case FShape of                                  {调整高度、宽度和位置}
      sstRectangle, sstRoundRect, sstEllipse:
        begin
          X := 0;                                   {原始位置是图形左上}
          Y := 0;
        end;
      sstSquare, sstRoundSquare, sstCircle:
        begin
          X := (W - S) div 2;                         {水平方向处于中心}
          Y := (H - S) div 2;                         {然后是垂直方向}
          W := S;                                  {宽度使用最小值}
          H := S;                                   {高度也是}
        end;
    end;
    case FShape of
      sstRectangle, sstSquare:
        Rectangle(X, Y, X + W, Y + H);
      sstRoundRect, sstRoundSquare:
        RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
      sstCircle, sstEllipse:
        Ellipse(X, Y, X + W, Y + H);
    end;
  end;  
end; 

end.
