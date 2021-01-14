unit Unit1;


{***************远程控制软件QQ空间上线源码********************}

{author:林之白狼 QQ:649510174

原理：在QQ空间中发布一篇帖子，内容格式：我的IP地址是：*117.43.74.110*
      利用IDHTTP控件读取该文章网页源码
      分离出对应的IP地址
      要是是域名上线的话，直接在源代码中添加一个域名解析的函数就行，
      其他的像百度空间、网盘上线都一样的原理

      HTTP://WWW.365SEC.NET

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jpeg, ExtCtrls,ShellAPI;

type
  TForm1 = class(TForm)
    mmo1: TMemo;
    btn1: TBitBtn;
    edtip: TEdit;
    btn2: TBitBtn;
    edtUrl: TEdit;
    lbl1: TLabel;
    idhtp1: TIdHTTP;
    img1: TImage;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
   ShellExecute(0,'open',PChar(edtUrl.Text),0,0,SW_SHOWMAXIMIZED);
   Sleep(100);
  mmo1.Clear;
  mmo1.Lines.Add(idhtp1.Get(Trim(edtUrl.Text)));
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  tmpStr : WideString;
  i,j:Integer;
begin
  tmpStr := mmo1.Lines.Text;

  i:= Pos(',c:''',tmpStr);
  Delete(tmpStr,1,i+length(',c:''')-1);
  edtip.Text := Copy(tmpStr,1,Pos('''}',tmpStr)-1)


end;

procedure TForm1.img1Click(Sender: TObject);
begin
  ShellExecute(0,'open','www.365sec.net',0,0,SW_SHOWMAXIMIZED);
end;

end.
