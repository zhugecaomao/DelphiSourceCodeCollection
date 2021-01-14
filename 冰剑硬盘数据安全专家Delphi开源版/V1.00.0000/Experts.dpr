program Experts;

uses
  Forms,
  BSecurityUnit in 'BSecurityUnit.pas' {Form1},
  Core in 'Core.pas',
  Core_InterFace in 'Core_InterFace.pas',
  StringsUnit in 'StringsUnit.pas',
  GetFileLists in 'GetFileLists.pas',
  RegShell in 'RegShell.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BSE';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
