unit CourseElectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons;

type
  TCourseElect = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ADOQuery3: TADOQuery;
    ADOCommand1: TADOCommand;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listcourse(id:string);
  end;

var
  CourseElect: TCourseElect;
  id:string;//选课学生的学号
implementation

{$R *.dfm}
uses ScheduleForm;
//--------------输入学号后回车，显示学生信息及已经选的课程----------------
procedure TCourseElect.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then //该文本框中只能输入数字
begin
 key:=#0;
 exit;
end;
//回车输入，将在籍学生的信息显示在文本框中
if key=#13 then
 begin
  id:=trim(edit1.Text);
  //清除上一次的数据
  edit2.Clear;
  edit3.Clear;
  adoquery2.Close;

  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select a.姓名,b.班级名称,a.学籍编号 from 学生信息 a,班级信息 b');
  adoquery1.SQL.Add('where (a.学号='''+id+''')and(a.班级编号=b.班级编号)');
  adoquery1.Open;
  if trim(adoquery1.FieldByName('学籍编号').AsString)='1' then
  begin
  edit2.Text:=trim(adoquery1.fieldbyname('姓名').AsString);
  edit3.Text:=trim(adoquery1.fieldbyname('班级名称').AsString);
  listcourse(id); //列出已选课程
  //允许开始选课
  bitbtn2.Enabled:=true;
  bitbtn3.Enabled:=true;
  bitbtn4.Enabled:=true;
  end
  else
   begin
   //只有在籍学生才能选课
   showmessage('该生非在籍学生，不能选课');
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   bitbtn4.Enabled:=false;
   id:='';
   end;
 end;

end;

//--------显示学生已经选的课程----------
procedure TCourseElect.listcourse(id: string);
begin
  //将符合选课条件的学生已经选过的课程列在表中
  adoquery2.Close;
  adoquery2.SQL.Clear;
  adoquery2.SQL.Add('select a.学号,a.课序号,b.课程名称,b.教师,b.开课系别,c.上课时间天,c.上课时间节,c.上课地点');
  adoquery2.SQL.Add('from 选课表 a,课程信息 b,课程表 c');
  adoquery2.SQL.Add('where (a.学号='''+id+''')and(a.课序号=c.课序号)and(''200400000''+b.课程编号=a.课序号)');
  adoquery2.Open;
end;

//---------------课程查询-------------------
procedure TCourseElect.BitBtn1Click(Sender: TObject);
var
sql:string;
begin
sql:='';
if trim(edit4.Text)<>'' then
 sql:=sql+'拼音码 like ''%'+trim(edit4.Text)+'%'' AND ';
if trim(edit5.Text)<>'' then
 sql:=sql+'课程名称 like ''%'+trim(edit5.Text)+'%'' AND ';
if trim(edit6.Text)<>'' then
 sql:=sql+'课程编号='''+trim(edit6.Text)+''' AND ';
if trim(edit7.Text)<>'' then
 sql:=sql+'课序号 like ''%'+trim(edit7.Text)+'%'' AND ';

sql:=copy(sql,1,length(sql)-4);
adoquery3.Filtered:=false;
adoquery3.Active:=false;
adoquery3.Filter:=sql;
adoquery3.Active:=true;
adoquery3.Filtered:=true;

end;

//-----------将选择的课程添加到学生的选课表中--------------
procedure TCourseElect.BitBtn2Click(Sender: TObject);
var
num:string;
day,section:integer;
begin
//未选择课程时，不允许提交
if adoquery3.RecordCount=0 then
 begin
  showmessage('请先选择一门课程');
  exit;
 end;
num:=trim(dbgrid2.Fields[0].Text);//保存课序号

//判断所选的课程是否已选和是否与其他已经选的课程有时间冲突
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select 上课时间天,上课时间节 from 课程表');
adoquery1.SQL.Add('where 课程编号='''+dbgrid2.Fields[1].Text+'''');
adoquery1.Open;

while not adoquery1.Eof do
 begin
  day:=adoquery1.fieldbyname('上课时间天').AsInteger;
  section:=adoquery1.fieldbyname('上课时间节').AsInteger;
  adoquery2.First;
  while not adoquery2.Eof do
   begin
   //判断课程是否已选
   if (trim(adoquery2.fieldbyname('课序号').AsString)=num) then
    begin
     showmessage('所选的课程：'+trim(adoquery2.fieldbyname('课程名称').AsString)+' 已在课表中，请选择其他课程');
     exit;
    end;
   //判断课程是否与已选课程有时间冲突
   if (adoquery2.fieldbyname('上课时间天').AsInteger=day)and(adoquery2.fieldbyname('上课时间节').AsInteger=section) then
    begin
     showmessage('所选课程的上课时间与已选的 '+trim(adoquery2.fieldbyname('课程名称').AsString)+' 冲突!');
     exit;
    end;
   adoquery2.Next;
   end;
  adoquery1.Next;
 end;
//选课
adocommand1.CommandText:='insert into 选课表([学号],[课序号]) values('''+id+''','''+trim(dbgrid2.Fields[0].Text)+''')';
adocommand1.Execute;
listcourse(id);//刷新数据表
end;


//-------------删除已选课程-------------
procedure TCourseElect.BitBtn3Click(Sender: TObject);
begin
if application.MessageBox('确实删除所选课程？','确定删除',MB_OKCANCEL)=IDOK then
 begin
  adocommand1.CommandText:='delete from 选课表 where (学号='''+trim(dbgrid1.Fields[0].Text)+''')and(课序号='''+trim(dbgrid1.Fields[1].Text)+''')';
  adocommand1.Execute;
  listcourse(id);//刷现列表
 end;
end;

//--------------调用【课表查询】窗体，显示学生课表--------------
procedure TCourseElect.BitBtn4Click(Sender: TObject);
var
newform:TSchedule;
begin
  newform:=TSchedule.Create(application);
  newform.Caption:=edit2.Text+'同学课程表';
  newform.id:=id;
  //传递学号，姓名，班级等参数
  newform.Edit1.Text:=id;
  newform.Edit2.Text:=edit2.Text;
  newform.Edit3.Text:=edit3.Text;
  newform.GroupBox1.Enabled:=false;//不能再显示他人的课程表
  //显示课表
  newform.selrecord();
end;

procedure TCourseElect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

end.
