program LfHotelJf;

uses
  Forms,
  C_JfMain in 'ProgramJf\C_JfMain.pas' {JfMainForm},
  C_Flwh in 'ProgramJf\C_Flwh.pas' {FlwhForm},
  C_Cswh in 'ProgramJf\C_Cswh.pas' {CswhForm},
  C_Bjsz in 'ProgramJf\C_Bjsz.pas' {BjszForm},
  C_JfDefine in 'ProgramJf\C_JfDefine.pas',
  C_ComBuf in 'ProgramJf\C_ComBuf.pas',
  C_Condition in 'ProgramJf\C_Condition.pas' {ConditionForm},
  C_JfData in 'ProgramJf\C_JfData.pas' {JfData: TDataModule},
  C_Tj in 'ProgramJf\C_Tj.pas' {TjForm},
  C_JfDel in 'ProgramJf\C_JfDel.pas' {JfDelForm},
  C_PassWord in 'ProgramJf\C_PassWord.pas' {PasswordDlg},
  C_About in 'ProgramJf\C_About.pas' {AboutForm},
  C_Xtsz in 'ProgramJf\C_Xtsz.pas' {XtszForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '立方电话计费管理系统';
  Application.CreateForm(TJfMainForm, JfMainForm);
  Application.CreateForm(TJfData, JfData);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TXtszForm, XtszForm);
  Application.Run;
end.
