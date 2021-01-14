program GetDemo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MyForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMyForm, MyForm);
  Application.Run;
end.

