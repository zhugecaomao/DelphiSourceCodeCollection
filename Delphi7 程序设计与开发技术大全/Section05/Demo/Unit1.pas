unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    UserTxt: TEdit;
    PSWTxt: TEdit;
    Panel1: TPanel;
    CancelBtn: TButton;
    OKBtn: TButton;
    Label3: TLabel;
    procedure UserTxtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CancelBtnClick(Sender: TObject);
    procedure PSWTxtKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.UserTxtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then         //利用OnKeyDown事件中的Key参数判断是否按下回车键
    PSWTxt.SetFocus;     //利用SetFocus方法将焦点移动到“密码”编辑框
end;

procedure TForm1.CancelBtnClick(Sender: TObject);
begin
  UserTxt.Text:='';      //利用Text属性将“用户名”编辑框清空
  PSWTxt.Clear;          //利用Clear方法将“密码”编辑框清空
  UserTxt.SetFocus;      //利用SetFocus方法将焦点移动到“用户名”编辑框
end;

procedure TForm1.PSWTxtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then        //利用KeyPress事件的Key参数判断是否按下回车键
  begin
    OKBtn.SetFocus;      //利用SetFocus方法将焦点移动到“确定”按钮
    Exit;                //退出此事件
  end;

  {利用KeyPress事件中的Key参数判断用户按键值，如果不是数字键，
   则将Key值设置为#0，相当于没有键按下}
  if (Key<#48) or (Key>#57) then
    Key:=#0;
end;

procedure TForm1.OKBtnClick(Sender: TObject);
begin
  {判断用户输入的用户名及密码是否正确：如果正确，显示“登录成功”字样；
   如果不正确，显示“错误”字样，并调用“重置”按钮的OnClick事件将用户
   名和密码编辑框清空}

  if (UserTxt.Text='Admin') and (PSWTxt.Text='123') then
    Label3.Caption:='登录成功！'+#13+'欢迎使用Delphi 7'
  else
  begin
    Label3.Caption:='错误！。'+#13+'用户名为：Admin'+#13
                    +'密码为：123'+#13+'注意大小写，请重新再试。';
    CancelBtn.Click;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label3.Caption:='用户名：Admin'+#13+'密码：123';    //设置Label3的Caption属性
end;

end.
