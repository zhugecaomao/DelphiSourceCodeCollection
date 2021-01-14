program GLtris;

uses
  Forms,
  TMain in 'TMain.pas' {MainForm},
  TSetup in 'TSetup.pas' {GLTrisSetup},
  THelp in 'THelp.pas' {GLTrisHelp},
  TAbout in 'TAbout.pas' {GLTrisAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGLTrisAbout, GLTrisAbout);
  Application.Run;
end.
