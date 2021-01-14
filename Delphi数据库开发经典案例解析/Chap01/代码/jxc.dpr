program jxc;

uses
  Forms,
  FormLogin in 'FormLogin.pas' {login},
  FormManage in 'FormManage.pas' {manage},
  FormInfo in 'FormInfo.pas' {Info},
  FormRights in 'FormRights.pas' {rights},
  FormStore in 'FormStore.pas' {store},
  FormReport in 'FormReport.pas' {report},
  FormInput in 'FormInput.pas' {input},
  FormOutput in 'FormOutput.pas' {output};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '进销存管理系统';
  Application.CreateForm(Tlogin, login);
  Application.CreateForm(Tmanage, manage);
  Application.CreateForm(TInfo, Info);
  Application.CreateForm(Trights, rights);
  Application.CreateForm(Tstore, store);
  Application.CreateForm(Treport, report);
  Application.CreateForm(Tinput, input);
  Application.CreateForm(Toutput, output);
  Application.Run;
end.
