unit UpdateTeachersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TUpdateTeachersForm = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTeachersForm: TUpdateTeachersForm;

implementation

uses UpDateDataModuleUnit;

{$R *.dfm}

procedure TUpdateTeachersForm.Button4Click(Sender: TObject);
begin
   UpDateDataModule.TeachersTable.Prior;
  button1.Enabled:=true;
end;

procedure TUpdateTeachersForm.Button5Click(Sender: TObject);
begin
  UpDateDataModule.TeachersTable.Next;
  button1.Enabled:=true;
end;

procedure TUpdateTeachersForm.Button1Click(Sender: TObject);
begin
 With  UpDateDataModule.TeachersTable  do
 begin
   Insert;
   button2.Enabled:=true;
   button1.Enabled:=False;
 end;
end;

procedure TUpdateTeachersForm.Button2Click(Sender: TObject);
begin
  
 if((DBEdit2.Text='')or(DBEdit1.Text='')) then
  begin
    ShowMessage('姓名和编号不能为空! ');
    Exit;
  end;
  with  UpDateDataModule.TeachersTable  do
  begin
    try
      Post;
      ShowMessage('添加成功! ');
      button2.Enabled:=false;
      button1.Enabled:=true;
    except
    begin
      Active:=false;
      Active:=true;
      Insert;
      button1.Enabled:=true;
      button2.Enabled:=false;
      ShowMessage('添加失败! ');
      Exit;
    end;
  end;
 end;
end;

procedure TUpdateTeachersForm.Button3Click(Sender: TObject);
begin
  
 With  UpDateDataModule.TeachersTable  do
 begin
   if  DBEdit2.Text=''  then
   begin
     ShowMessage('请输入教师编号!');
     exit;
   end;
   try
     Delete;
     ShowMessage('删除成功!');
   except
   begin
     Active:=true;
     Insert;
     ShowMessage('删除失败!');
     exit;
   end;
  end;
 end;
end;

procedure TUpdateTeachersForm.Button6Click(Sender: TObject);
begin
  close;
end;

end.
