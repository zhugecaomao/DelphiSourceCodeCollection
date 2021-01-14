unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

const
  MessageID=WM_User+100;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure WndProc(var Message:TMessage);override;
  end;

var
  Form1: TForm1;
  num:integer;

implementation

{$R *.dfm}

function OpenGetKeyHook(sender:HWND;MessageID:WORD):BOOL;stdCall;external'GetKey.DLL';
function CloseGetKeyHook:BOOL;stdCall;external'GetKey.DLL';
function GetX:integer;stdcall;external'GetKey.DLL';
function GetY:integer;stdcall;external'GetKey.DLL';

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenGetKeyHook(Form1.Handle,MessageID) then  {挂接钩子过程}
    Memo1.Lines.Add('开始记录');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if CloseGetKeyHook then                        {接触钩子过程挂接}
 begin
    Memo1.Lines.Add('结束记录');
    Memo1.Lines.Add(' ');
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.WndProc(var Message:TMessage);
begin
  if Message.Msg=MessageID then
  begin
    with Memo1.Lines do
      case Message.WParam  of
        WM_LBUTTONDOWN:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）按下左键!');
        end;
        WM_LBUTTONUP:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）释放左键!');
        end;
        WM_LBUTTONDBLCLK:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）双击左键!');
        end;
        WM_RBUTTONDOWN:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）按下右键!');
        end;
        WM_RBUTTONUP:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）释放右键!');
        end;
        WM_RBUTTONDBLCLK:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）双击左键!');
        end;
        WM_MBUTTONDOWN:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）按下中键!');
        end;
        WM_MBUTTONUP:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）释放中键!');
        end;
        WM_MBUTTONDBLCLK:
        begin
          Add('在（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）双击中键!');
        end;
        WM_NCMouseMove,WM_MOUSEMOVE:
        begin
          Add('鼠标移动到（'+ IntToStr(GetX) + ','+ IntToStr(GetY ) + '）!');
        end;
      end;
  end;
  Inherited;
end;

end.

 
