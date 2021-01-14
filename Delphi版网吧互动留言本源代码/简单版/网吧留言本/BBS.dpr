program BBS;

uses
  Forms,
  BBS_Unit in 'BBS_Unit.pas' {B};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Õ¯∞…¡Ù—‘±æ';
  Application.CreateForm(TB, B);
  Application.Run;
end.
