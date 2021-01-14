program qmanagersvc;

uses
  SvcMgr,
  MainUnit in 'MainUnit.pas' {QMSVC: TService};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TQMSVC, QMSVC);
  Application.Run;
end.
