program Traceroute;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  fmTraceRouteMainU in 'fmTraceRouteMainU.pas' {fmTracertMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmTracertMain, fmTracertMain);
  Application.Run;
end.
