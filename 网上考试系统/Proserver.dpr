program Proserver;

uses
  Forms,
  Proserver_TLB in 'Proserver_TLB.pas',
  Unserver in 'Unserver.pas' {examserver: TRemoteDataModule} {examserver: CoClass},
  server in 'server.pas' {Form3};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
