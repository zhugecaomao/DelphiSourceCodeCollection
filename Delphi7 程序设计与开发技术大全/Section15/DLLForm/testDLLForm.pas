unit testDLLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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

procedure SynAPP(App:THandle);stdcall;external 'FormDLL.dll';
procedure ShowForm;stdcall;external 'FormDLL.dll';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SynApp(Application.Handle ); 
  ShowForm ;
end;



end.
