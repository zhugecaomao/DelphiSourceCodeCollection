unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
  //根据按下的按钮设置"状态"信息
  case Button of
    btPlay:Edit3.Text:='正在播放...';
    btPause:Edit3.Text:='暂时中断';
    btStop:Edit3.Text:='停止';
    btNext:Edit3.Text:='向后';
    btPrev:Edit3.Text:='向前';
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //对打开对话框初始化
  OpenDialog1.Filter:='声音文件(*.wav)|*.wav|Midifiles(*.mid)|*.mid|AVI文件(*.avi)|*.avi';
  if OpenDialog1.Execute then
  begin
    Edit1.Text:=OpenDialog1.FileName;
    MediaPlayer1.FileName:=OpenDialog1.FileName;
    MediaPlayer1.AutoOpen:=True;//自动打开
    MediaPlayer1.Open;
    MediaPlayer1.Notify:=True;
    //指定播放的窗口大小
    MediaPlayer1.DisplayRect:=Rect(3,3,Panel1.Width-6,Panel1.Height-6);
  end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
  //根据NotifyValue属性的数值设置消息通知信息
  case Mediaplayer1.NotifyValue of
    nvSuccessful:Edit2.Text:='成功';
    nvSuperseded:Edit2.Text:='推迟';
    nvAborted:Edit2.Text:='放弃';
    nvFailure:Edit2.Text:='失败';
  end;
  MediaPlayer1.Notify:=True;
end;

end.
