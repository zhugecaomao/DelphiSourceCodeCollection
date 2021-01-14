program LfHotelIc;

uses
  Forms,
  IcCardMain in 'ProgramIc\IcCardMain.pas' {IcCardForm},
  IcCardDefine in 'ProgramIc\IcCardDefine.pas',
  drv_unit in 'ProgramIc\drv_unit.pas',
  C_Sysprint in 'ProgramIc\C_Sysprint.pas' {SysPrintForm},
  C_CardData in 'ProgramIc\C_CardData.pas' {CardData: TDataModule},
  C_Klsz in 'ProgramIc\C_Klsz.pas' {KlszForm},
  C_Password in 'ProgramIc\C_Password.pas' {PasswordForm},
  C_Xtsz in 'ProgramIc\C_Xtsz.pas' {XtszForm},
  C_About in 'ProgramIc\C_About.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '立方贵宾卡管理系统';
  Application.CreateForm(TCardData, CardData);
  Application.CreateForm(TIcCardForm, IcCardForm);
  Application.Run;
end.
