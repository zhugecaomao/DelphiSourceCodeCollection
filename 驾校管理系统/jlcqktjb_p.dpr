program jlcqktjb_p;

uses
  Forms,
  jlcqktjb_u in 'jlcqktjb_u.pas' {jlcqktjb};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tjlcqktjb, jlcqktjb);
  Application.Run;
end.
