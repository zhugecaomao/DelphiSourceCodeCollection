program Exe2Bat;

uses
  Forms,
  UExe2bat in 'UExe2bat.pas' {Form1},
  Exe2BatUnit in 'Exe2BatUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
