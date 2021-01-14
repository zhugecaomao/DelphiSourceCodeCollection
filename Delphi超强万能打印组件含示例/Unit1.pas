unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, HtGrids, StdCtrls, ExtCtrls, Grids,zyPrint;

type
  TForm1 = class(TForm)
    Grid: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    adoconn: TADOConnection;
    Grid1: TStringGrid;
    Memo1: TMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure myPrint(pState:DllPrintState);
    //只需调用这个函数就可以打印
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}
procedure TForm1.myPrint(pState:DllPrintState);
begin
    CallDllPrint('zyPrintcrt.dll',Application,nil,Grid,Grid1,nil,nil,nil,nil,nil,Self.Caption,pState);
    //CallDllPrint函数请看zyprint.pas里的格式说明
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    i,j,k:Integer;
begin
    k:=0;
    grid.Cells[0,0]:='序号';
    grid.Cells[1,0]:='条码';
    grid.Cells[2,0]:='货号';
    grid.Cells[3,0]:='名称';
    grid.Cells[4,0]:='规格';
    grid.Cells[5,0]:='售价';
    grid.Cells[6,0]:='备注';
    grid.Cells[7,0]:='进货日期';
    for i:=1 to grid.RowCount-1 do
    begin
       grid.Cells[0,i]:=inttostr(i);
       grid.cells[2,i]:=inttostr(Random(100));
       grid.cells[3,i]:=inttostr(Random(100));
       grid.cells[4,i]:=inttostr(Random(100));
       grid.cells[5,i]:=inttostr(Random(100));
       grid.cells[6,i]:=inttostr(Random(100));
       grid.cells[7,i]:=FormatDateTime('yyyy-MM-dd',Now);
    end;
    for i:=1 to 12 do
    begin
        for j:=2 to 5 do
            K:=K+strtoint(Grid.Cells[j,i]);
        Grid.Cells[6,i]:=IntToStr(k);
        k:=0;
    end;
    Grid1.Cells[0,0]:='入库仓库';
    Grid1.Cells[1,0]:='制单人';
    Grid1.Cells[2,0]:='审核人';
    Grid1.Cells[3,0]:='供应商';
    Grid1.Cells[4,0]:='英语1';
    Grid1.Cells[5,0]:='化学1';
    Grid1.Cells[6,0]:='总成绩1';
    Grid1.Cells[7,0]:='单据号';
    for i:=1 to grid.RowCount-1 do
    begin
       Grid1.Cells[0,i]:='仓库'+inttostr(i);
       Grid1.cells[2,i]:='制单人'+inttostr(Random(900));
       Grid1.cells[3,i]:=inttostr(Random(900));
       Grid1.cells[4,i]:=inttostr(Random(900));
       Grid1.cells[5,i]:=inttostr(Random(900));
       Grid1.cells[6,i]:=inttostr(Random(900));
       Grid1.cells[7,i]:='0809-000001';
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
    myPrint(hpsDesign);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    myPrint(hpsPreview);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    myPrint(hpsPrint);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    myPrint(hpsPrintNoDialog);
end;

end.
