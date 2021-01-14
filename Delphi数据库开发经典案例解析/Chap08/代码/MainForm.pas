unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    StatusBar1: TStatusBar;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FindForm(caption: string): bool;
  end;

var
  main: Tmain;

implementation

{$R *.dfm}
uses ClassInfoForm,StudentInfoForm,CourseInfoForm,CourseElectForm,ScheduleForm,ScoreForm,PrintScoreForm;
//-----------通过用户定义的函数，判断窗体是否已存在--------------------
function TMain.FindForm(caption: string): bool;
var
i:integer;
begin
 for i:=0 to main.MDIChildCount do
  begin
   // 通过对窗体标题判断窗体是否存在
    if main.MDIChildren[i].Caption=caption then
     begin
      //如果窗体已存在，则恢复窗体，并返回true
      SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
      mdichildren[i].Enabled:=true;
      mdichildren[i].Show;
      mdichildren[i].SetFocus;
      result:=true;
      break;
     end
     else
     //如窗体不存在，则返回false，程序将创建窗体
      result:=false;
  end
end;

//--------------显示【班级信息维护】窗体-------------------
procedure TMain.N2Click(Sender: TObject);
var
newform:TClassInfo;
begin
 if FindForm('班级信息维护')=false then
  newform:=TClassInfo.Create(application);
  newform.Caption:='班级信息维护';
end;

//--------------显示【学生信息维护】窗体-------------------
procedure Tmain.N3Click(Sender: TObject);
var
newform:TStudentInfo;
begin
 if FindForm('学生信息维护')=false then
  newform:=TStudentInfo.Create(application);
  newform.Caption:='学生信息维护';
end;
//--------------显示【课程信息维护】窗体-------------------
procedure Tmain.N4Click(Sender: TObject);
var
newform:TCourseInfo;
begin
 if FindForm('课程信息维护')=false then
  newform:=TCourseInfo.Create(application);
  newform.Caption:='课程信息维护';
end;
//--------------显示【学生选课】窗体-------------------
procedure Tmain.N6Click(Sender: TObject);
var
newform:TCourseElect;
begin
 if FindForm('学生选课')=false then
  newform:=TCourseElect.Create(application);
  newform.Caption:='学生选课';
end;
//--------------显示【课表查询】窗体-------------------
procedure Tmain.N7Click(Sender: TObject);
var
newform:TSchedule;
begin
 if FindForm('课表查询')=false then
  newform:=TSchedule.Create(application);
  newform.Caption:='课表查询';
end;
//--------------显示【成绩输入】窗体-------------------
procedure Tmain.N8Click(Sender: TObject);
var
newform:TScore;
begin
 if FindForm('成绩输入')=false then
  newform:=TScore.Create(application);
  newform.Caption:='成绩输入';
end;
//--------------显示【打印成绩单】窗体-------------------
procedure Tmain.N10Click(Sender: TObject);
var
newform:TPrintScore;
begin
 if FindForm('打印成绩单')=false then
  newform:=TPrintScore.Create(application);
  newform.Caption:='打印成绩单';
end;

end.
