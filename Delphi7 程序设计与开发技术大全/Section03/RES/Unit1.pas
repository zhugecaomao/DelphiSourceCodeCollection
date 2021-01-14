unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MMSystem;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1     : TForm1;
  PtrSound  : PChar;
  hRes      : THandle;

implementation

{$R *.dfm}
{$R Sound.res}               //在此声明了Sound.res资源文件

procedure TForm1.FormCreate(Sender: TObject);
var
  hResInfo  :THandle;
begin
  hResInfo := FindResource(HInstance,'Sound','wav');
  hRes := LoadResource(HInstance, hResInfo);
  If hRes > 32 Then
    begin
      PtrSound :=LockResource(hRes);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SndPlaySound(PtrSound,Snd_Async or Snd_Memory);
end;

end.
