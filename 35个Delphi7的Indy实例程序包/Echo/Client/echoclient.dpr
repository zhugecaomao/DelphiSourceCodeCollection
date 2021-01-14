program echoclient;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  main in 'main.pas' {formEchoTest};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformEchoTest, formEchoTest);
  Application.Run;
end.
