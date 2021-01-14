program hrm;

uses
  Forms,
  MainDlg in 'MainDlg.pas' {main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '人力资源管理';
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
