program qmclient;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Main},
  SelCDFLOPUNIT in 'SelCDFLOPUNIT.pas' {SelPhysical},
  HelpUnit in 'HelpUnit.pas' {Help};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Qemu Manager QEMU Client';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TSelPhysical, SelPhysical);
  Application.CreateForm(THelp, Help);
  Application.Run;
end.
