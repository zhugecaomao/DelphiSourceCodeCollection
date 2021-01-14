unit fm_Splash;
/////启动显示窗口
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, ComCtrls,WinInet;

type
  TFmSplash = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
     OnNet:boolean;
     procedure CheckNet;

  end;

var
  FmSplash: TFmSplash;

implementation

{$R *.dfm}
{$R Shopyuan.Res}

procedure TFmSplash.FormShow(Sender: TObject);
begin
//此法不行，采取自定义资源加入EXE中的方法
//  Animate1.FileName :=ExtractFileDir(application.ExeName)+ 'MessageBox.avi';
  Animate1.ResName := 'StartAvi';
  Animate1.Active := true;
  CheckNet;
  //if date > strtodate('2004-9-30') then application.Terminate;    ///限制使用时间
end;

procedure  TFmSplash.CheckNet;
begin
  ///判断网络是否通      ///已放到数据模块上   //换成自己的服务器IP地址
  if not  InternetCheckConnection('http://61.53.175.253', 1, 0) then
//  if not  InternetCheckConnection('http://220.112.186.168/', 1, 0) then
  begin
   OnNet := false;
   IF application.MessageBox('请检查你的网络配置，目前你的机器不能上网，是否退出系统！',pchar(application.Title),mb_iconwarning+Mb_yesNo)=IDyes then
   begin
     application.Terminate;
     exit;
   End;
  end
  else
  OnNet := true;

end;

end.
