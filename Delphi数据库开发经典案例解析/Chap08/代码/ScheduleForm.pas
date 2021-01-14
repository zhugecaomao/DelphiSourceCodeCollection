unit ScheduleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, DB, ADODB, StdCtrls;

type
  TSchedule = class(TForm)
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    id:string;
    procedure selrecord();//查询学生的课程记录
  end;

var
  Schedule: TSchedule;

implementation

{$R *.dfm}
//------------------设置表格---------------------
procedure TSchedule.FormShow(Sender: TObject);
var
i,j:integer;
begin
stringgrid1.Cells[0,0]:='星期一';
stringgrid1.Cells[1,0]:='星期二';
stringgrid1.Cells[2,0]:='星期三';
stringgrid1.Cells[3,0]:='星期四';
stringgrid1.Cells[4,0]:='星期五';

stringgrid1.RowHeights[0]:=25;
for i:=0 to 4 do
 stringgrid1.ColWidths[i]:=120;
for i:=1 to 7 do
 stringgrid1.RowHeights[i]:=50;

end;


//-----------------------根据输入的学号显示学生信息和课表-------------------------
procedure TSchedule.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then //该文本框中只能输入数字
 begin
 key:=#0;
 exit;
 end;

//回车输入，将学生的信息显示在文本框中
if key=#13 then
 begin
  id:=trim(edit1.Text);
  //清除上一次的数据
  edit2.Clear;
  edit3.Clear;

  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select a.姓名,b.班级名称,a.学籍编号 from 学生信息 a,班级信息 b');
  adoquery1.SQL.Add('where (a.学号='''+id+''')and(a.班级编号=b.班级编号)and(a.学籍编号=''1'')');
  adoquery1.Open;

  if adoquery1.RecordCount=0 then
   begin
    showmessage('学号输入错误');
    exit;
   end;
  edit2.Text:=trim(adoquery1.fieldbyname('姓名').AsString);
  edit3.Text:=trim(adoquery1.fieldbyname('班级名称').AsString);
  selrecord();
 end;


end;


//----------------在表中显示课程信息-------------------
procedure TSchedule.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
i,j:integer;
rt:Trect;
begin

  stringgrid1.Canvas.Brush.Style:=bsClear;
  //指向学生课表的第一个记录
  if adoquery1.SQL.Text<>'' then adoquery1.First;
  while not adoquery1.Eof do
   begin
   i:=adoquery1.fieldbyname('上课时间天').AsInteger-1;
   j:=adoquery1.fieldbyname('上课时间节').AsInteger;

   //stringgrid控件中不能换行，因此要编程将我们需要的文字放到合适的地方
   rt:=stringgrid1.CellRect(i,j);
   stringgrid1.Canvas.TextOut(rt.Left+5,rt.Top+5,trim(adoquery1.fieldbyname('课程名称').AsString));
   stringgrid1.Canvas.TextOut(rt.Left+5,rt.Top+25,trim(adoquery1.fieldbyname('上课地点').AsString));
   adoquery1.Next;
   end;

end;

//---------根据输入的学号查询课程信息-----------
procedure TSchedule.selrecord;
var
i,j:integer;
begin
   //清空原来的表格
  for i:=0 to 4 do
   for j:=1 to 7 do
    stringgrid1.Cells[i,j]:='';
  //将学生的课程列在课程表中
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select b.课程名称,b.教师,c.上课时间天,c.上课时间节,c.上课地点');
  adoquery1.SQL.Add('from 选课表 a,课程信息 b,课程表 c');
  adoquery1.SQL.Add('where (a.学号='''+id+''')and(a.课序号=c.课序号)and(''200400000''+b.课程编号=a.课序号)');
  adoquery1.Open;
end;

procedure TSchedule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
