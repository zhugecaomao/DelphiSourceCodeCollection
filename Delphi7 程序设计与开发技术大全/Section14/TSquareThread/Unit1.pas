unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Ball1, Ball2, Ball3: TSquareThread;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//第1个线程（红色）
procedure TForm1.CheckBox1Click(Sender: TObject);
Var
  X,Y:Integer;
begin
  if (CheckBox1.Checked)=True then
  begin
    X:=160;                                         //移动范围X坐标的左边界
    Y:=CheckBox1.Top+CheckBox1.Height div 2;        //Y坐标
    Edit1.Text:='2';
    Ball1:=TSquareThread.Create(clRed,X,Y);         //创建线程
    Ball1.Resume;                                   //唤醒该线程
  end
  else
    Ball1.Terminate;                                //结束该线程
  Edit1.OnChange(Sender);
end;

//第2个线程（黄色）
procedure TForm1.CheckBox2Click(Sender: TObject);
var
  X,Y:Integer;
begin
  if(CheckBox2.Checked)=True then
  begin
    X:=160;
    Y:=CheckBox2.Top+CheckBox2.Height div 2;
    Edit2.Text:='3';
    Ball2:=TSquareThread.Create (clYellow, X, Y);
    Ball2.Resume;
  End
  Else
    Ball2.Terminate;
  Edit2.OnChange(Sender);
end;

//第3个线程（蓝色）
procedure TForm1.CheckBox3Click(Sender: TObject);
Var
  X, Y: Integer;
Begin
  If (CheckBox3.Checked)=True then
  Begin
    X:=160;
    Y:=CheckBox3.Top+CheckBox3.Height div 2;
    Edit3.Text:='4';
    Ball3:=TSquareThread.Create (clBlue, X,Y);
    Ball3.Resume;
  End
  Else
    Ball3.Terminate;
  Edit3.OnChange(Sender);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  If ((Edit1.Text='2') and (Ball1<>nil)) then
    Ball1.Priority:=tpLowest;  //比tpNormal低两级
  If ((Edit1.Text='3') and (Ball1<>nil)) then
    Ball1.Priority:=tpLower;   //比tpNormal低一级
  If ((Edit1.Text='4') and (Ball1<>nil)) then
    Ball1.Priority:=tpNormal;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  If ((Edit2.Text='2') and (Ball2<>nil)) then
    Ball2.Priority:=tpLowest;
  If ((Edit2.Text='3') and (Ball2<>nil)) then
    Ball2.Priority:=tpLower;
  If ((Edit2.Text='4') and (Ball2<>nil)) then
    Ball2.Priority:=tpNormal;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  If ((Edit3.Text='2') and (Ball3<>nil)) then
    Ball3.Priority:=tpLowest;
  If ((Edit3.Text='3') and (Ball3<>nil)) then
    Ball3.Priority:=tpLower;
  If ((Edit3.Text='4') and (Ball3<>nil)) then
    Ball3.Priority:=tpNormal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If ((Ball1<>nil)) then        //第1个线程（红色）
    Ball1.X2:=160;
  If ((Ball2<>nil)) then        //第2个线程（黄色）
    Ball2.X2:=160;
  If ((Ball3<>nil)) then        //第3个线程（蓝色）
    Ball3.X2:=160;
end;

end.
