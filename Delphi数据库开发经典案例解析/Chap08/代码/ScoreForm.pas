unit ScoreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TScore = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Edit4: TEdit;
    BitBtn4: TBitBtn;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure showscore();
  end;

var
  Score: TScore;
  courseNum:string;//保存课程编号
implementation

{$R *.dfm}



//------------显示某课程学生的分数-------------------
procedure TScore.BitBtn2Click(Sender: TObject);
begin
showscore();
end;

//--------------修改选课学生的成绩--------------
procedure TScore.BitBtn4Click(Sender: TObject);
var
num:string;
begin
 if edit4.Text='' then
 begin
  showmessage('必须输入有效成绩');
  exit;
 end;

 num:=trim(dbgrid1.Fields[0].Text);
 if num='' then
  begin
   showmessage('请先选中一个选课学生');
   exit;
  end;
 //修改学生成绩
 adocommand1.CommandText:='update 成绩表 set 成绩='''+trim(edit4.Text)+''' where 编号='''+num+'''';
 adocommand1.Execute;
 showscore();
end;

//------------显示某课程学生的分数-------------------
procedure TScore.showscore;
var
pyCode,courseID,courseName:string;//保存输入的拼音码和课程名称，课程编号
begin
 courseNum:='';//清空保存在全局变量中的课程编号
 pyCode:=trim(edit1.Text);
 courseID:=trim(edit2.Text);
 courseName:=trim(edit3.Text);
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select a.编号,b.课程名称,a.学号,c.姓名,a.成绩 from 成绩表 a,课程信息 b,学生信息 c');
 adoquery1.SQL.Add('where (a.课程编号 like ''%'+courseID+'%'')and(b.拼音码 like ''%'+pyCode+'%'')and(b.课程名称 like ''%'+courseName+'%'')');
 adoquery1.SQL.Add('and(a.课程编号=b.课程编号)and(a.学号=c.学号)and(a.是否已确定成绩=''N'')');
 adoquery1.Open;
 if adoquery1.RecordCount>0 then //如果有查询结果，则保存课程编号
  courseNum:=courseID;
end;

//----------【成绩】文本框中只允许输入数字，小数点--------
procedure TScore.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#13,#8]) then
 key:=#0;
end;
//---------调用储存过程，提交成绩--------------
procedure TScore.BitBtn3Click(Sender: TObject);
begin
adocommand1.CommandText:='exec sf_成绩提交 '''+courseNum+'''';
adocommand1.Execute;
showscore();
end;
//---------调用储存过程，结束选课--------------
procedure TScore.BitBtn1Click(Sender: TObject);
begin
adocommand1.CommandText:='exec sf_终止选课';
adocommand1.Execute;
showmessage('结束选课成功，请选择输入要输入成绩的课程');
end;

procedure TScore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;
end.
