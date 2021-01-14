unit ChooseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ADODB, DB;

type
  Tchoose = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  choose: Tchoose;

implementation

uses MainForm;

{$R *.dfm}

procedure Tchoose.DBGrid1DblClick(Sender: TObject);
begin
if main.bomflag=1 then
 begin
//取物料的编号和名称，存到主程序声明的公共变量中去
  main.str:=dbgrid1.Fields[0].AsString;
  main.str2:=dbgrid1.Fields[1].AsString;
//清除标志,关闭窗体
   main.bomflag:=0;
   main.BOM1Click(Sender);
   close;
 end;

 if main.bomflag=2 then
    begin
//取物料的编号和名称，存到主程序声明的公共变量中去
  main.str:=dbgrid1.Fields[0].AsString;
  main.str2:=dbgrid1.Fields[1].AsString;
//清除标志,关闭窗体
   main.bomflag:=0;
   main.N6Click(Sender);
   close;
 end;

  if main.bomflag=4 then
    begin
//取物料的编号和名称，存到主程序声明的公共变量中去
  main.str:=dbgrid1.Fields[0].AsString;
  main.str2:=dbgrid1.Fields[1].AsString;
//清除标志,关闭窗体
   main.bomflag:=0;
   main.MPS1.Click;
   close;
 end;
end;

procedure Tchoose.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tchoose.BitBtn1Click(Sender: TObject);
begin
//查询数据
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 物料主文件 where (物料编号 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(物料名称 like ''%'+edit2.Text+'%'')and(拼音编码 like ''%'+edit3.Text+'%'')');
adoquery1.Open;
//将查询得到的数据通过clone命令复制到adotable中去
adotable1.Clone(adoquery1,ltUnspecified);

end;

procedure Tchoose.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn1.Click;
end;

procedure Tchoose.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn1.Click;
end;

procedure Tchoose.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn1.Click;
end;

end.
