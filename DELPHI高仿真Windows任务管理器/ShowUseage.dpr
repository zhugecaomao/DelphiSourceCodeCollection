program ShowUseage;

uses
  Forms,
  CpuUseage in 'CpuUseage.pas' {MainForm},
  unitUseage in 'unitUseage.pas',
  MemInfo in 'MemInfo.pas',
  uProcInfo in 'uProcInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
