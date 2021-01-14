program md5test;

uses
  {$IFDEF LINUX}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  md5f in 'md5f.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
