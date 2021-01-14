unit UpdateStudentsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Spin;

type
  TUpdateStudentsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpinEdit1: TSpinEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit1Exit(Sender:TObject);
    procedure SpinEdit1KeyPress(Sender:TObject;var Key:Char);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateStudentsForm: TUpdateStudentsForm;

implementation

uses UpDateDataModuleUnit;

{$R *.dfm}

procedure TUpdateStudentsForm.BitBtn1Click(Sender: TObject);
begin
   
 With  UpDateDataModule.StudentsTable  do
 begin
   IndexFieldNames:='SNo';
   if  SpinEdit1.Text='' then
   begin
    ShowMessage('请输入学号:');
    SpinEdit1.SetFocus;
    exit;
   end;
   if  not  FindKey([SpinEdit1.Text])  then
   begin
     ShowMessage('无此记录，不能修改!');
     exit;
   end;
   Edit;
   FieldByName('Name').AsString:=Edit1.Text;
   FieldByName('SNo').AsString:=SpinEdit1.Text;
   FieldByName('Sex').AsString:=Edit2.Text;
   FieldByName('Age').AsString:=Edit3.Text;
   FieldByName('Entrance').AsDateTime:=DateTimePicker1.Date;
   Post;
   ShowMessage('修改成功!');
 end;
end;

procedure TUpdateStudentsForm.BitBtn2Click(Sender: TObject);
begin
   

With  UpDateDataModule.StudentsTable  do
 begin
 IndexFieldNames:='SNo';
 if((SpinEdit1.Text<>'')and (Edit1.Text<>'')) then
 begin
   if FindKey([SpinEdit1.Text])
   then  begin
      ShowMessage('此学生已经存在!');
      exit;
    end;
   try
     Append;
     FieldByName('Name').AsString:=Edit1.Text;
     FieldByName('SNo').AsString:=SpinEdit1.Text;
     FieldByName('Sex').AsString:=Edit2.Text;
     FieldByName('Age').AsString:=Edit3.Text;
     FieldByName('Entrance').AsDateTime:=DateTimePicker1.Date;
     Post;
     ShowMessage('添加成功!');
   except
   begin
     Active:=false;
     ShowMessage('输入编号的范围应在:10000000-19999999之间!');
     Active:=true;
     exit;
   end;
 end;
 end  else  ShowMessage('姓名和编号不能为空!');
end;
end;

procedure TUpdateStudentsForm.BitBtn3Click(Sender: TObject);
begin
 

 With  UpDateDataModule.StudentsTable  do
 begin
   IndexFieldNames:='SNo';
   if  FindKey([SpinEdit1.Text])
   then begin
     Delete;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     ShowMessage('删除成功!');
     end  else  ShowMessage('无此记录!');
 end;
end;

procedure TUpdateStudentsForm.SpinEdit1Change(Sender: TObject);
begin

 UpdateStudentsForm.SpinEdit1Exit(Sender);
end;
procedure  TUpdateStudentsForm.SpinEdit1Exit(Sender:TObject);
begin
  if(length(SpinEdit1.Text)<>8) then
  begin
    ShowMessage('请输入8个字符!');
    SpinEdit1.SetFocus;
    exit;
  end;
  With UpDateDataModule.StudentsTable  do
  begin
  IndexFieldNames:='SNo';
  if  FindKey([SpinEdit1.Text])  then
  begin
    Edit1.Text:=FieldByName('Name').AsString ;
    Spinedit1.Text:=FieldByName('SNo').AsString ;
    Edit2.Text:=FieldByName('Sex').AsString ;
    Edit3.Text:=FieldByName('Age').AsString ;
    DateTimePicker1.Date:=FieldByName('Entrance').AsDateTime ;
  end else
  begin
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
  end;
 end;
end;
procedure  TUpdateStudentsForm.SpinEdit1KeyPress(Sender:TObject;
var Key:Char);
begin
  if  Key=#13  then
     UpdateStudentsForm.SpinEdit1Exit(Sender);
end;

procedure TUpdateStudentsForm.BitBtn4Click(Sender: TObject);
begin
 close;
end;

end.
