unit Unit2;

interface

uses
  Classes, Graphics, ExtCtrls;

type

{ TSortThread }

  PSortArray = ^TSortArray;
  TSortArray = array[0..MaxInt div SizeOf(Integer) - 1] of Integer;
  TSortThread = class(TThread)      //排序线程
  private
    FBox: TPaintBox;
    FSortArray: PSortArray;
    FSize: Integer;
    FA, FB, FI, FJ: Integer;
    procedure DoVisualSwap;
  protected
    procedure Execute; override;
    procedure VisualSwap(A, B, I, J: Integer);
    procedure Sort(var A: array of Integer); virtual; abstract;      //执行排序的抽象函数
  public
    constructor Create(Box: TPaintBox; var SortArray: array of Integer);
  end;

{ TBubbleSort }

  TBubbleSort = class(TSortThread)        //冒泡排序线程
  protected
    procedure Sort(var A: array of Integer); override;
  end;

{ TSelectionSort }

  TSelectionSort = class(TSortThread)    //选择排序线程
  protected
    procedure Sort(var A: array of Integer); override;
  end;

{ TQuickSort }

  TQuickSort = class(TSortThread)        //快速排序线程
  protected
    procedure Sort(var A: array of Integer); override;
  end;

procedure PaintLine(Canvas: TCanvas; I, Len: Integer);

implementation

procedure PaintLine(Canvas: TCanvas; I, Len: Integer);
//绘制线段，I标志线段的位置，Len标志线段的长度
begin
  Canvas.PolyLine([Point(0, I * 2 + 1), Point(Len, I * 2 + 1)]);
end;

{ TSortThread }

constructor TSortThread.Create(Box: TPaintBox; var SortArray: array of Integer);
//线程的构造函数，执行初始化工作
begin
  FBox := Box;
  FSortArray := @SortArray;
  FSize := High(SortArray) - Low(SortArray) + 1;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TSortThread.DoVisualSwap;
//覆盖交换前的线段
begin
  with FBox do
  begin
    Canvas.Pen.Color := clBtnFace;
    PaintLine(Canvas, FI, FA);
    PaintLine(Canvas, FJ, FB);
    //重新绘制交换后的线段
    Canvas.Pen.Color := clRed;
    PaintLine(Canvas, FI, FB);
    PaintLine(Canvas, FJ, FA);
  end;
end;

procedure TSortThread.VisualSwap(A, B, I, J: Integer);
//重绘制交换后的线段
begin
  FA := A;
  FB := B;
  FI := I;
  FJ := J;
  Synchronize(DoVisualSwap);    //通过Synchronize完成对VCL的访问
end;

procedure TSortThread.Execute;
begin
  Sort(Slice(FSortArray^, FSize));    //执行排序
end;

{ TBubbleSort }
procedure TBubbleSort.Sort(var A: array of Integer);
//选择排序
var
  I, J, T: Integer;
begin
  for I := High(A) downto Low(A) do
    for J := Low(A) to High(A) - 1 do
      if A[J] > A[J + 1] then
      begin
        VisualSwap(A[J], A[J + 1], J, J + 1);    //重新绘制交换后的线段
        T := A[J];
        A[J] := A[J + 1];
        A[J + 1] := T;
        if Terminated then Exit;
      end;
end;

{ TSelectionSort }
procedure TSelectionSort.Sort(var A: array of Integer);
//选择排序
var
  I, J, T: Integer;
begin
  for I := Low(A) to High(A) - 1 do
    for J := High(A) downto I + 1 do
      if A[I] > A[J] then
      begin
        VisualSwap(A[I], A[J], I, J);          //重新绘制交换后的线段
        T := A[I];
        A[I] := A[J];
        A[J] := T;
        if Terminated then Exit;
      end;
end;

{ TQuickSort }
procedure TQuickSort.Sort(var A: array of Integer);
//快速排序
  procedure QuickSort(var A: array of Integer; iLo, iHi: Integer);
  var
    Lo, Hi, Mid, T: Integer;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := A[(Lo + Hi) div 2];
    repeat
      while A[Lo] < Mid do Inc(Lo);
      while A[Hi] > Mid do Dec(Hi);
      if Lo <= Hi then
      begin
        VisualSwap(A[Lo], A[Hi], Lo, Hi);        //重新绘制交换后的线段
        T := A[Lo];
        A[Lo] := A[Hi];
        A[Hi] := T;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(A, iLo, Hi);
    if Lo < iHi then QuickSort(A, Lo, iHi);
    if Terminated then Exit;
  end;

begin
  QuickSort(A, Low(A), High(A));
end;

end.
