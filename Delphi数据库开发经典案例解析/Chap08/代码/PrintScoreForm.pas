unit PrintScoreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ADODB, Buttons;

type
  TPrintScore = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure showscore();
  end;

var
  PrintScore: TPrintScore;
  id:string;
implementation

{$R *.dfm}
uses ReportForm;
//--------------输入学号后回车，显示学生信息-----------------
procedure TPrintScore.Edit1KeyPress(Sender: TObject; var Key: Char);
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
  adoquery1.SQL.Add('where (a.学号='''+id+''')and(a.班级编号=b.班级编号)');
  adoquery1.Open;

  if adoquery1.RecordCount=0 then
   begin
    showmessage('学号输入错误');
    bitbtn1.Enabled:=false;//学号输入错误的情况下表格为空，不允许打印
    exit;
   end
   else
    bitbtn1.Enabled:=true;

  edit2.Text:=trim(adoquery1.fieldbyname('姓名').AsString);
  edit3.Text:=trim(adoquery1.fieldbyname('班级名称').AsString);
  showscore();
 end;
end;

//-----------将学生的成绩列在表中-------------------
procedure TPrintScore.showscore;
begin
 
 adoquery2.SQL.Clear;
 adoquery2.SQL.Add('select a.编号,b.课程名称,a.成绩,b.开课系别,b.教师 from 成绩表 a,课程信息 b');
 adoquery2.SQL.Add('where (a.学号='''+id+''')and(a.课程编号=b.课程编号)');
 adoquery2.Open;
end;


//-------------------打印成绩单-------------------------
procedure TPrintScore.BitBtn1Click(Sender: TObject);
begin
 report.adoquery1.SQL.Clear;
 report.adoquery1.SQL.Add('select a.学号,a.编号,b.课程名称,c.姓名,a.成绩,b.开课系别,b.教师 from 成绩表 a,课程信息 b,学生信息 c');
 report.adoquery1.SQL.Add('where (a.学号='''+id+''')and(a.课程编号=b.课程编号)and(c.学号=a.学号)');
 report.adoquery1.Open;
 report.QuickRep1.Preview;
end;

procedure TPrintScore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
