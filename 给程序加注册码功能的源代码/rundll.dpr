program rundll;

uses
  Forms,
  unt_rundll in 'unt_rundll.pas' {frm_rundll};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_rundll, frm_rundll);
  Application.Run;
end.
