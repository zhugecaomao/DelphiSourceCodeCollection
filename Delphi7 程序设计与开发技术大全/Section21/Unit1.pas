unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edt_user: TEdit;
    Label2: TLabel;
    Edt_passwd: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Pwquery: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  times:Integer;

implementation

uses Unit2, Unit3, Unit8;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
times := times+1;
//with DataModule2 do
//begin
  Pwquery.close;
  Pwquery.ParamByName('Userid').Value:=edt_user.Text;	//给query组件参数赋值
  Pwquery.Open;										//用 query组件查询记录
//end;
if Pwquery.Fields[0].value=null then				//判断用户名是否存在
begin
Application.MessageBox('请确认用户名是否正确！','用户名错误！',mb_ok);
exit;
end;
if Pwquery.Fields[0].value=edt_passwd.Text then	//判断密码是否正确
begin
if Pwquery.Fields[1].value='1' then					//判断用户权限是否正确
begin
Form1.hide;									//隐藏登录窗体
form3.show;										//显示主窗体
end
else
begin
Form1.hide;									//隐藏登录窗体
form8.show;
end;
end
else
if MessageDlg('密码输入错误。是否退出？',mtConfirmation,[mbYes,mbNo],0)
= mrYes then Close
else if times<3 then edt_passwd.SetFocus
else
begin
MessageDlg('对不起，密码输入严重错误！请退出。',mtInformation,[mbOk], 0);
application.Terminate ;
end;

end ;

{程序开始运行时，需进行初始化，
将Edit_user和Edit_passwd两个输入框清空。
这在窗体的OnCreate事件实现。}
procedure TForm1.FormCreate(Sender: TObject);
begin
edt_user.Text:='';									//清空用户名输入框
edt_passwd.Text:='';								//清空密码输入框
times:=0;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
