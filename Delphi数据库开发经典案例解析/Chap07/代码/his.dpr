program his;

uses
  Forms,
  ParentForm in 'ParentForm.pas' {Parent},
  MedInfoForm in 'MedInfoForm.pas' {MedInfo},
  ChargeItmForm in 'ChargeItmForm.pas' {ChargeItm},
  MainForm in 'MainForm.pas' {Main},
  ClinicRegForm in 'ClinicRegForm.pas' {ClinicReg},
  PriceConfirmForm in 'PriceConfirmForm.pas' {PriceConfirm},
  CashForm in 'CashForm.pas' {Cash},
  StoreSearchForm in 'StoreSearchForm.pas' {StoreSearch},
  RegSearchForm in 'RegSearchForm.pas' {RegSearch},
  MedSendForm in 'MedSendForm.pas' {MedSend};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '医院管理系统';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
