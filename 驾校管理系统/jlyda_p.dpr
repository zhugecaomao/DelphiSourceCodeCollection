program jlyda_p;

uses
  Forms,
  jlyda_u in 'jlyda_u.pas' {jlyda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tjlyda, jlyda);
  Application.Run;
end.
