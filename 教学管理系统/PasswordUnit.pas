unit PasswordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPasswordForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordForm: TPasswordForm;

implementation

uses ComeInUnit;

{$R *.dfm}

procedure TPasswordForm.Button1Click(Sender: TObject);
begin
  if Edit1.Text=ComeInForm.Memo1.Lines.Text   then
  begin
    if  Edit2.Text=Edit3.Text  then
    begin
      ComeInForm.Memo1.Lines.Text:=Edit2.Text ;
      ComeInForm.Memo1.Lines.SaveToFile(application.GetNamePath +'aaa.mia');
      ShowMessage('密码修改成功!');
  end
  else  ShowMessage('新密码不相等!');
end else   ShowMessage('原密码错误!');
end;

procedure TPasswordForm.Button2Click(Sender: TObject);
begin
 close;
end;

end.
