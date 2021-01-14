program server;

uses
  Forms,
  server_tlb in 'server_tlb.pas',
  srvrdm in 'srvrdm.pas' {BriefCaseDemo: TRemoteDataModule} {BriefCaseDemo: CoClass},
  srvrfrm in 'srvrfrm.pas' {Form1};


{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
