program Experts;

uses
  Forms,
  BSecurityUnit in 'BSecurityUnit.pas' {Form1},
 { Core in 'Core.pas',   }
  StringsUnit in 'StringsUnit.pas',
 { RegShell in 'RegShell.pas',  }
  ConfigCreate in 'ConfigCreate.pas',
  BLibrary in 'BLibrary.pas',
  BCore in 'BCore.pas',
  DecryptCore in 'DecryptCore.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BSE';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
