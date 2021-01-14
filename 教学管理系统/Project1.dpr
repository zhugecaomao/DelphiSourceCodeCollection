program Project1;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  UpdateStudentsUnit in 'UpdateStudentsUnit.pas' {UpdateStudentsForm},
  UpdateTeachersUnit in 'UpdateTeachersUnit.pas' {UpdateTeachersForm},
  UpdateCourseUnit in 'UpdateCourseUnit.pas' {UpdateCourseForm},
  UpdateTeachingUnit in 'UpdateTeachingUnit.pas' {UpdateTeachingForm},
  Numbers_QueryUnit in 'Numbers_QueryUnit.pas' {Numbers_QueryForm},
  Names_QueryUnit in 'Names_QueryUnit.pas' {Names_QueryForm},
  Special_QueryUnit in 'Special_QueryUnit.pas' {Special_QueryForm},
  DecisionUnit in 'DecisionUnit.pas' {DecisionForm},
  QReportUnit in 'QReportUnit.pas' {QReportForm},
  PasswordUnit in 'PasswordUnit.pas' {PasswordForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm},
  UpDateDataModuleUnit in 'UpDateDataModuleUnit.pas' {UpDateDataModule: TDataModule},
  QueryDataModuleUnit in 'QueryDataModuleUnit.pas' {QueryDataModule: TDataModule},
  ComeInUnit in 'ComeInUnit.pas' {ComeInForm},
  Obscure_QueryUnit in 'Obscure_QueryUnit.pas' {Obscure_QueryForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TComeInForm, ComeInForm);
  Application.Run;
end.
