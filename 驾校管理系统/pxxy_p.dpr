program pxxy_p;

uses
  Forms,
  pxxy_u in 'pxxy_u.pas' {pxxy},
  public_var in 'public_var.pas',
  pub_search_u in 'pub_search_u.pas' {pub_search};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tpxxy, pxxy);
  Application.Run;
end.
