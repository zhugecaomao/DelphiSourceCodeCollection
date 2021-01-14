program eis;

uses
  Forms,
  MainForm in 'MainForm.pas' {main},
  ParentForm in 'ParentForm.pas' {Parent},
  ClassInfoForm in 'ClassInfoForm.pas' {ClassInfo},
  CourseInfoForm in 'CourseInfoForm.pas' {CourseInfo},
  CourseElectForm in 'CourseElectForm.pas' {CourseElect},
  ScheduleForm in 'ScheduleForm.pas' {Schedule},
  ScoreForm in 'ScoreForm.pas' {Score},
  ReportForm in 'ReportForm.pas' {report},
  PrintScoreForm in 'PrintScoreForm.pas' {PrintScore},
  StudentInfoForm in 'StudentInfoForm.pas' {StudentInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '教务管理系统';
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Treport, report);
  Application.Run;
end.
