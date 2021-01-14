unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IdHTTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



function GetPublicIP: string;
var
  strIP, URL: string;
  iStart, iEnd: Integer;
  MyIdHTTP: TIdHTTP;


begin
  Result := '';
  MyIdHTTP := TIdHTTP.Create(nil);
  MyIdHTTP.ReadTimeout:=1000;

  try
    try
      URL := MyIdHTTP.Get('http://www.kuai115.com/shijian.php');
    except
      Exit;
    end;
  finally
    MyIdHTTP.Free;
  end;

  if Length(URL) <> 0 then
  begin
    iStart := Pos('[', URL);
    iEnd := Pos(']', URL);
    if (iStart <> 0) and (iEnd <> 0) then
    begin
      strIP := Trim(Copy(URL, iStart + 1, iEnd - iStart - 1));
      if strIP <> '' then
        Result := strIP;
    end;
  end;

end;



function SetSystemtime(ATime: TDateTime) : boolean;
Var
  ADateTime:TSystemTime;
  yy,mon,dd,hh,min,ss,ms : Word;
Begin
  decodedate(ATime ,yy,mon,dd);
  decodetime(ATime ,hh,min,ss,ms);
  With ADateTime Do
    Begin
      wYear:=yy;
      wMonth:=mon;
      wDay:=dd;
      wHour:=hh;
      wMinute:=min;
      wSecond:=ss;
      wMilliseconds:=ms;
    End;
   Result:=SetLocalTime(ADateTime);
   SendMessage(HWND_BROADCAST,WM_TIMECHANGE,0,0) ;
   If Result then ShowMessage('成功改变时间!');
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
   SetSystemTime(StrTodateTime(GetPublicIP) );


end;
end.
