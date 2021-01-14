unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
Const
  WM_MYMESSAGE = WM_USER+5;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure WMUser (var msg: TMessage);
      Message WM_MYMESSAGE;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Procedure TForm1.WMUser (var msg: TMessage);
begin
  ShowMessage('您好！');
end;

procedure TForm1.Button1Click(Sender: TObject);
Var
  HWnd:THandle;
Begin
  HWnd:= FindWindow('TForm1','使用自定义的Windows消息');
  If HWnd<>0 then
    PostMessage (HWnd, WM_MYMESSAGE, 0, 0);
end;

end.
