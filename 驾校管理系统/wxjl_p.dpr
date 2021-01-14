program wxjl_p;

uses
  Forms,
  wxjl_u in 'wxjl_u.pas' {wxjl};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Twxjl, wxjl);
  Application.Run;
end.
