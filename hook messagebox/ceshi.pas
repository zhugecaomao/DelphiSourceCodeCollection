unit ceshi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  procedure StartHook(pid: DWORD); stdcall; external 'hookdll.dll';
  procedure EndHook; stdcall; external 'hookdll.dll';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
StartHook(GetCurrentProcessId);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
EndHook;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 MessageBox(0, 'abdfadfasdf', nil, 0);
end;

end.
