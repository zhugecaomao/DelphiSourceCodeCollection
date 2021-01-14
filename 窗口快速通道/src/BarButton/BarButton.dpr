program BarButton;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmBar in 'ufrmBar.pas' {frmBar},
  uUtils in '..\Common\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bar Button';
  Application.CreateForm(TfrmMain, frmMain);
  //Application.CreateForm(TfrmBar, frmBar);
  frmBar := TfrmBar.Create(nil);
  Application.Run;
end.
