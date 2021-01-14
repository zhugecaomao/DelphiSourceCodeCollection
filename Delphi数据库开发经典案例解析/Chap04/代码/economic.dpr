program economic;

uses
  Forms,
  MainForm in 'MainForm.pas' {main},
  AccountSettingForm in 'AccountSettingForm.pas' {AccountSetting},
  SecSettingForm in 'SecSettingForm.pas' {SecSetting},
  DocuInputForm in 'DocuInputForm.pas' {DocuInput},
  TotalAccountForm in 'TotalAccountForm.pas' {TotalAccount},
  DetailAccountForm in 'DetailAccountForm.pas' {DetailAccount},
  SumAccountForm in 'SumAccountForm.pas' {SumAccount},
  FinalReportForm in 'FinalReportForm.pas' {FinalReport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '财务管理系统';
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
