unit Obscure_QueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TObscure_QueryForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Obscure_QueryForm: TObscure_QueryForm;

implementation

uses QueryDataModuleUnit;

{$R *.dfm}

procedure TObscure_QueryForm.Button1Click(Sender: TObject);
var
s:string;
begin
   with  QueryDataModule  do
   begin
    case RadioGroup1.ItemIndex of
    0: with  StudentsQuery  do
      begin
       close;
       SQL.clear;
        s:='select * from student where name like'+''''+Edit1.Text+'%'+'''';
        SQL.Add(s);
       Prepare;
       Open;
       DBNavigator1.DataSource:=QueryDataModule.DSStudents ;
             DBGrid1.DataSource:=QueryDataModule.DSStudents;
      end;
    1: with TeachersQuery  do
      begin
       close;
       SQL.clear;
        s:='select * from teacher where name like'+''''+Edit1.Text+'%'+'''';
        SQL.Add(s);
       Prepare;
       Open;
       DBNavigator1.DataSource:=QueryDataModule.DSTeachers ;
             DBGrid1.DataSource:=QueryDataModule.DSTeachers;
      end;
    2: with  CourseQuery  do
      begin
       close;
       SQL.clear;
        s:='select * from course where cname like'+''''+Edit1.Text+'%'+'''';
        SQL.Add(s);
       Prepare;
       Open;
       DBNavigator1.DataSource:=QueryDataModule.DSCourse ;
              DBGrid1.DataSource:=QueryDataModule.DSCourse;
      end;
   end;
  end;
end;

procedure TObscure_QueryForm.Button2Click(Sender: TObject);
begin
 close;
end;

end.
