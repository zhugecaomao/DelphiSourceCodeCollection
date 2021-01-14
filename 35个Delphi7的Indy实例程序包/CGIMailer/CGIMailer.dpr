program CGIMailer;

{$APPTYPE CONSOLE}
{$I IdCompilerDefines.inc}

uses
  {$IFDEF VCL5ORABOVE}
   WebBroker,
  {$ELSE}
    httpApp,
  {$ENDIF}
  CGIApp,
  fMain in 'fMain.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
