unit login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  Tlogin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Database1: TDatabase;
    Table1: TTable;
    Table1Userid: TStringField;
    Table1name: TStringField;
    Table1Password: TStringField;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image2: TImage;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;
  user_v: variant;
  i: integer;

implementation

uses main_u;

{$R *.dfm}
procedure checkpwd(sender:tobject);
begin
   if i>=3 then
   begin
     messagedlg('对不起，您输入超过三次！',mtWarning	,[mbok],0);
     login.hide;
     login.Free;
     //application.Terminate;
   end;
end;

procedure Tlogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edit2.SetFocus;
end;

procedure Tlogin.Edit1Exit(Sender: TObject);
begin
   checkpwd(sender);
   if (edit1.text<>'') and table1.Locate('userid',edit1.Text,[]) then
   begin
      user_v:=table1.fieldvalues['name'];
      label3.Caption:=table1.FieldValues['name'];
   end
   else
   begin
     if edit1.text<>'' then
     begin
        i:=i+1;
        messagedlg('用户名错误，请重新输入！',mtWarning	,[mbok],0);
     end;
   end;
end;



procedure Tlogin.Edit2Exit(Sender: TObject);
begin
   checkpwd(sender);
   if (edit2.text<>'') and table1.Locate('password',edit2.Text,[]) then
   begin  //密码正确进入
     login.hide;
     login.free;
     application.CreateForm(tmain,main);
     application.Run;
   end
   else
   begin
     if edit2.text<>'' then
     begin
        i:=i+1;
        messagedlg('密码错误，请重新输入！',mtWarning	,[mbok],0);
     end;
   end;
end;

procedure Tlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then edit2exit(sender);
end;

procedure Tlogin.FormCreate(Sender: TObject);
begin
  if table1.state<>dsedit then table1.Open;
end;

procedure Tlogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {if messagedlg('是否要删除本记录!',mtWarning,[mbYes,mbNo],0)=mrYes then
      application.Terminate;
   }

  if Application.MessageBox('请确认是否退出本系统', '提示信息', mb_iconinformation + mb_YesNo) = id_yes then
     application.Terminate
  else
     canclose:=false;
end;

procedure Tlogin.BitBtn1Click(Sender: TObject);
begin
  edit2exit(sender);
end;

procedure Tlogin.BitBtn2Click(Sender: TObject);
begin
  if Application.MessageBox('请确认是否退出本系统', '提示信息', mb_iconinformation + mb_YesNo) = id_yes then
     application.Terminate
end;

end.
