unit Unit1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    DrawGrid1: TDrawGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  //设定网格的列数，使其等于系统字体的数目
  StringGrid1.ColCount := Screen.Fonts.Count + 1;
  StringGrid1.ColWidths [0] := 50;

  for I := 1 to Screen.Fonts.Count do
  begin
    // 设定第一行为字体的名称
    StringGrid1.Cells [I, 0] := Screen.Fonts.Strings [I-1];
    //计算需要的最大列数
    StringGrid1.Canvas.Font.Name := StringGrid1.Cells [I, 0];
    StringGrid1.Canvas.Font.Size := 32;
    StringGrid1.ColWidths [I] :=
      StringGrid1.Canvas.TextWidth ('AaBbYyZz');
  end;

  // 设定行数
  StringGrid1.RowCount := 26;
  for I := 1 to 25 do
  begin
    //在第一列写其所在的行数
    StringGrid1.Cells [0, I] := IntToStr (I+7);
    // 设定高度
    StringGrid1.RowHeights [I] := 15 + I*2;
    // 添加其他行默认的文字
    for J := 1 to StringGrid1.ColCount do
      StringGrid1.Cells [J, I] := 'AaBbYyZz'
  end;
  StringGrid1.RowHeights [0] := 25;
end;

procedure TForm1.StringGrid1DrawCell (Sender: TObject;
  Col, Row: Integer; Rect: TRect; State: TGridDrawState);
const
  colors: array[0..4] of TColor = ( //个数根你的Grid的行数一样
    clRed,
    clBlue,
    clYellow,
    clBlack,
    clGray);
begin
  with StringGrid1.Canvas do
  begin
    FillRect(Rect);
    Font.Color := colors[Row mod 5]; //修改背景颜色
    TextOut(Rect.left,Rect.top,Stringgrid1.cells[col,row]);
  end;

  //选择字体
  if (Col = 0) or (Row = 0) then
    StringGrid1.Canvas.Font.Name := 'Arial'
  else
    StringGrid1.Canvas.Font.Name := StringGrid1.Cells [Col, 0];

  // 设定字体的大小
  if Row = 0 then
    StringGrid1.Canvas.Font.Size := 14
  else
    StringGrid1.Canvas.Font.Size := Row + 7;

  // 设定背景颜色
  if gdSelected in State then
    StringGrid1.Canvas.Brush.Color := clHighlight
  else if gdFixed in State then
    StringGrid1.Canvas.Brush.Color := clBtnFace
  else
    StringGrid1.Canvas.Brush.Color := clWindow;

  // 输出文本
  StringGrid1.Canvas.TextRect (Rect, Rect.Left, Rect.Top,
    StringGrid1.Cells [Col, Row]);

  // 设定焦点
  if gdFocused in State then
    StringGrid1.Canvas.DrawFocusRect (Rect);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I,J:Integer;
  Rect:TRect;
begin
  DrawGrid1.Refresh;
  for I:=1 to DrawGrid1.RowCount -1 do
    for J:=1 to DrawGrid1.ColCount -1 do
    begin
      Rect:=DrawGrid1.CellRect(J,I);//对于每一个单元格
      DrawGrid1.Canvas.TextOut(Rect.Left,Rect.Top,'文本');//输出文本
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Bmp:TBitMap;
  Rect:TRect;
  I,J:Integer;
begin
  DrawGrid1.Refresh;
  Bmp:=TBitMap.Create;
  Bmp.LoadFromFile('1.bmp');//装载图像
  for I:=1 to DrawGrid1.RowCount -1 do
    for J:=1 to DrawGrid1.ColCount -1 do
    begin
      Rect:=DrawGrid1.CellRect(J,I);//对于每一个单元格
      DrawGrid1.Canvas.Draw(Rect.Left,Rect.Top,Bmp);//画图
    end;
end;

end.
