program Promanerge;

uses
  Forms,
  Unlogin in 'Unlogin.pas' {Loginfrm},
  Undm in 'Undm.pas' {DataModule1: TDataModule},
  Unmain in 'Unmain.pas' {MainFrm},
  Unchengji in 'Unchengji.pas' {chengjifrm},
  Unstudent in 'Unstudent.pas' {studentfrm},
  Unfenpei in 'Unfenpei.pas' {fenpeifrm},
  Unview in 'Unview.pas' {viewfrm},
  Unexam in 'Unexam.pas' {tikufrm},
  Unmanerge in 'Unmanerge.pas' {Operatorfrm},
  Unpass in 'Unpass.pas' {passfrm},
  Unabout in 'Unabout.pas' {aboutfrm},
  Unchengjiprint in 'Unchengjiprint.pas' {reportfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Taboutfrm, aboutfrm);
  Application.CreateForm(TLoginfrm, Loginfrm);
  Application.CreateForm(Tpassfrm, passfrm);
  Application.CreateForm(Treportfrm, reportfrm);
  Application.Run;
end.
