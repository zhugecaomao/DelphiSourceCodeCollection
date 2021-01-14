unit Unit1;

interface

uses
  Windows, Messages,registry, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

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

procedure TForm1.Button1Click(Sender: TObject);
var 
rg:Tregistry;
begin 
   rg:=Tregistry.create; 
   rg.rootkey:=HKEY_LOCAL_MACHINE; 
   rg.openkey('SOFTWARE\MICROSOFT\INTERNET EXPLORER\EXTENSIONS\{0713E8D2-850A-101B-AFC0-4210102A8DA7}',true);
   rg.writestring('BUTTONTEXT','C:\WINNT\explorer.exe');
   rg.writestring('CLSID','{1FBA04EE-3024-11D2-8F1F-0000F87ABD16}');
   rg.writestring('DEFAULT VISIBLE','YES');
   rg.writestring('EXEC','C:\WINNT\explorer.exe');
   rg.writestring('ICON','c:\winnt\1.ico');
   rg.writestring('HOTICON','c:\winnt\2.ico');
   rg.closekey; 
   rg.free; 
end;


end.
