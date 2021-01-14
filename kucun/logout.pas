unit logout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  Tlogofm = class(TForm)
    lgpl: TPanel;
    logotimer: TTimer;
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure logotimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logofm: Tlogofm;

implementation

{$R *.dfm}

procedure Tlogofm.FormCreate(Sender: TObject);
begin
alphablend:=true;
borderstyle:=bsnone;
//clientheight:=400;
//clientwidth:=600;
position:=poMainFormCenter;
windowstate:=wsNormal;
lgpl.Caption:='';
lgpl.Align:=alClient;
//lgimage.Picture.LoadFromFile('../image/logo.jpg');
//glabel.AutoSize:=false;
//lglabel.Font.Size:=36;
//lglabel.Font.Name:='隶书';
//lglabel.Font.Style:=[fsbold];
//lglabel.Font.color:=clblue;
//lglabel.Caption:='万水进销存管理系统v1.0';
logotimer.Interval:=4000;  //闪屏时间设置
logotimer.Enabled:=true;
end;

procedure Tlogofm.logotimerTimer(Sender: TObject);
begin
enabled:=false;
logofm.Close;   //关闭闪屏窗口
end;

procedure Tlogofm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Shift>=[ssAlt] then
showmessage('操作非法!')
end;

end.
