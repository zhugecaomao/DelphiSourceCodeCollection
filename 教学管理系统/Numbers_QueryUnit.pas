unit Numbers_QueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TNumbers_QueryForm = class(TForm)
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Numbers_QueryForm: TNumbers_QueryForm;

implementation

uses QueryDataModuleUnit;

{$R *.dfm}

procedure TNumbers_QueryForm.BitBtn1Click(Sender: TObject);
begin
 With  QueryDataModule  do
 begin
   case  RadioGroup1.ItemIndex   of
     0: with StudentsQuery  do
       begin
         Close;
         if  SQL.Count=3  then SQL.Delete(2);
         SQL.Append('where SNo=:tt');
         ParamByName('tt').AsString:=Edit1.Text;
         Prepare;
         Open;
         DBNavigator1.DataSource:=DSStudents;
         DBGrid1.DataSource:=DSStudents;
       end;
     1: with  TeachersQuery  do
       begin
         Close;
         if SQL.Count=3  then  SQL.Delete(2);
         SQL.Append('where  TNo=:tt');
         ParamByName('tt').AsString:=Edit1.Text ;
         Prepare;  ShowMessage(inttostr(RadioGroup1.ItemIndex));
         Open;
         DBNavigator1.DataSource:=DSTeachers;
         DBGrid1.DataSource:=DSTeachers;
       end;
     2:  with  CourseQuery  do
       begin
         Close;
         if SQL.Count=3  then  SQL.Delete(2);
         SQL.Append('where  CNo=:tt');
         ParamByName('tt').AsString:=Edit1.Text ;
         Prepare;
         Open;
         DBNavigator1.DataSource:=DSCourse;
         DBGrid1.DataSource:=DSCourse;
       end;
   end;
 end;
end;

procedure TNumbers_QueryForm.Button1Click(Sender: TObject);
begin
  close;
end;

end.
