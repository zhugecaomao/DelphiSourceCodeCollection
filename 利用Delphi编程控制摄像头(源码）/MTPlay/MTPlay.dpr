program MTPlay;

uses
  Forms,
  U_Main in 'U_Main.pas' {frm_Main},
  U_Option in 'U_Option.pas' {frm_Option};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(Tfrm_Option, frm_Option);
  Application.Run;
end.
