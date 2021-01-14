unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdHTTP, IdCookieManager, IdComponent, IdBaseComponent,
  IdTCPConnection, IdTCPClient;

type
  TForm1 = class(TForm)
    idhtp1: TIdHTTP;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
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
var
  i:Integer;
  s:string;
begin
  idhtp1.CookieManager := TIdCookieManager.Create(nil);
  idhtp1.CookieManager.AddCookie('baidu=sb','baidu.com');
  idhtp1.Get('http://www.baidu.com');
  for I := 0 to idhtp1.CookieManager.CookieCollection.Count - 1 do
    s := s + idhtp1.CookieManager.CookieCollection.Items[i].CookieText;
  ShowMessage(s);
end;

end.
