program main_p;

uses
  Forms,
  controls,
  main_u in 'main_u.pas' {main},
  jlyda_u in 'jlyda_u.pas' {jlyda},
  xyda_u in 'xyda_u.pas' {xyda},
  cyzgzda_u in 'cyzgzda_u.pas' {cyzgzda},
  wxjl_u in 'wxjl_u.pas' {wxjl},
  jlcqktjb_u in 'jlcqktjb_u.pas' {jlcqktjb},
  lkcycj_u in 'lkcycj_u.pas' {lkcycj},
  pxxy_u in 'pxxy_u.pas' {pxxy},
  qsbg_u in 'qsbg_u.pas' {qsbg},
  gzgl_u in 'gzgl_u.pas' {gzgl},
  logo_u in 'logo_u.pas' {logo},
  jlczy_u in 'jlczy_u.pas' {jlczy},
  jlcgzzt_u in 'jlcgzzt_u.pas' {jlcgzzt},
  login_u in 'login_u.pas' {login},
  pxjyz_u in 'pxjyz_u.pas' {pxjyz},
  xydt_u in 'xydt_u.pas' {xydt},
  about_u in 'about_u.pas' {about},
  kmks1hmc_u in 'kmks1hmc_u.pas' {kmks1hmc},
  kmks2hmc_u in 'kmks2hmc_u.pas' {kmks2hmc};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '平安驾校管理系统';
  //Application.CreateForm(Tmain, main);
  //Application.CreateForm(Tlogo, logo);
  logo:=tlogo.Create(application);
  logo.ShowModal;  //以模式对话框方式显示窗体
  logo.Update;
  if logo.ModalResult=mrOK then
  begin
    logo.close;
    logo.Free;
  Application.CreateForm(Tlogin, login);
  //login:=tlogin.Create(application);
    //login.ShowModal;
    application.run;
  end;
end.
