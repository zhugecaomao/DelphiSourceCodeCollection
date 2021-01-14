unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,shellapi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  isenable:boolean;
  function backfunc(AhWnd:hwnd;AlParam:lParam):boolean;stdcall;

implementation

{$R *.dfm}
function backfunc(AhWnd:hwnd;AlParam:lParam):boolean;stdcall;
var
wndcn:array [0..255] of char;
wndcp:array [0..255] of char;
begin
  getclassname(ahwnd,wndcn,255);
  getwindowtext(ahwnd,wndcp,255);

  if isenable then
  enablewindow(ahwnd,true)  //激活
  else
  enablewindow(ahwnd,false);    //激死

  if (pos('停止&',strpas(wndcp)) > 0) or (pos('激活&',strpas(wndcp)) > 0) then
    enablewindow(ahwnd,true);
  result:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    if button1.Tag = 0 then
    begin
      isenable:=true;
      button1.Tag:=1;
      button1.Caption:='停止&';
      button2.Tag:=0;
      button2.Caption:= '激死';
      timer1.Enabled:=true;
    end  else
    begin
      button1.Tag:= 0;
      button1.Caption:='激活&';
      timer1.Enabled:=false;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
h:thandle;
cp:array [0..255] of char;
begin
  h:=getforegroundwindow();
  if h <> 0 then
  begin
    edit1.Text:=inttostr(h);  //返回句柄显示
    getwindowtext(h,cp,255);  //  获取标题
    edit2.Text:=strpas(cp);
    enumchildwindows(h,@backfunc,0);   //枚举窗口所有控件句柄
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if button2.Tag = 0 then
   begin
     isenable:=false;
     button2.Tag:=1;
     button2.Caption:='停止&';
     button1.Caption:='激活&';
     button1.Tag:=0;
     timer1.Enabled:=true;
   end else
   begin
     button2.Tag:=0;
     button2.Caption:= '激死';
     timer1.Enabled:=false;
     button1.Enabled:=true;
   end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   timer1timer(form1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage('灰色按钮激活_源码爱好者整理!');
   ShellExecute(Application.Handle, nil, 'http://www.codefans.net', nil, nil, SW_SHOWNORMAL);
end;

end.
