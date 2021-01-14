{*******************************************************}
{       作者:独孤九剑					}
{	QQ:54729891					}
{	EMail:rhcgrys@sina.com	                        }
{       定时提醒                                        	}
{                                                       }
{       版权所有 (C) 2006 未来科技                      }
{                                                       }
{*******************************************************}

unit timer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CoolTrayIcon, Menus, WinSkinData, StdCtrls, ExtCtrls, RzButton,
  MMSYSTEM, ImgList;

type
  TForm1 = class(TForm)
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    A1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Timer1: TTimer;
    SkinData1: TSkinData;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Edit3: TEdit;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    ImageList1: TImageList;
    ImageList2: TImageList;
    procedure N2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    SessionEnding: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses printscreen;

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
  SessionEnding:=True;
  close;
end;

procedure TForm1.A1Click(Sender: TObject);
begin
  Application.MessageBox('　　所有每天在电脑前工作起过八小时的朋友们为了' +
    #13#10 + '您自己和家人的幸福，请注意您的身体健康！' + #13#10#13#10 +
    '                      ' + #13#10 + 
    '　　　　　　　　　　　　　　　　孤独九剑' + #13#10 + 
    '　　　　　　　　　　　　　　　2006－01－07', '关于', MB_OK + 
    MB_ICONINFORMATION);

end;

procedure TForm1.S1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.RzBitBtn1Click(Sender: TObject);
begin
  //Application.Minimize;
  Timer1.Interval:=StrToInt(Edit1.Text) * 1000;
  Timer1.Enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  snd:PAnsiChar;
  tim1:string;
  tim2:Double;
begin
  snd:=PChar(Edit3.Text);
  if StrToInt(Edit1.Text)<60 then begin
    tim1:=Edit1.Text;
    CoolTrayIcon1.ShowBalloonHint('真情提示',
        '您已在电脑前工作了'+tim1+'秒钟了,'+edit2.Text,
        bitInfo, 10);
    SndPlaySound(snd,SND_ASYNC);
    end
  else
    begin
      tim2:=(StrToInt(Edit1.Text)/60);
      tim1:=FloatToStr(tim2);
      CoolTrayIcon1.ShowBalloonHint('真情提示',
        '您已在电脑前工作了'+tim1+'分钟了,'+edit2.Text,
        bitInfo, 10);
      SndPlaySound(snd,SND_ASYNC);
    end;
  Form2.Show;
  //Timer1.Enabled:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Interval:=StrToInt(Edit1.Text) * 1000;
  Timer1.Enabled:=True;
  SessionEnding:=False;
end;

procedure TForm1.CoolTrayIcon1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.RzBitBtn2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
     Button1.Enabled:=true;
     Edit3.Enabled:=true;
     end
  else
    begin
      Button1.Enabled:=false;
      Edit3.Enabled:=False;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
     Edit3.Text:=OpenDialog1.FileName;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := SessionEnding;
  if not CanClose then
  begin
    CoolTrayIcon1.HideMainForm;
  end;
end;

end.



