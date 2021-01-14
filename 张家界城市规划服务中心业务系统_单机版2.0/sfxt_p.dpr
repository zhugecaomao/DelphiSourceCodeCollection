program sfxt_p;

uses
  Forms,
  chutudan in 'chutudan.pas' {ctd},
  shoufeidan in 'shoufeidan.pas' {sfd},
  dwcx_u in 'dwcx_u.pas' {frm_dwcx},
  sfxt in 'sfxt.pas' {frm_main},
  tqsfd_u in 'tqsfd_u.pas' {tqsfd},
  ctdcx_u in 'ctdcx_u.pas' {ctdcx},
  sfdcx_u in 'sfdcx_u.pas' {sfdcx},
  about_u in 'about_u.pas' {frm_About},
  LOGIN_U in 'LOGIN_U.PAS' {login},
  lock in 'lock.pas' {lock_frm},
  yhgl_u in 'yhgl_u.pas' {frm_yhgl},
  dwxx_u in 'dwxx_u.pas' {frm_dwxx};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlogin, login);
  Application.Run;
end.
