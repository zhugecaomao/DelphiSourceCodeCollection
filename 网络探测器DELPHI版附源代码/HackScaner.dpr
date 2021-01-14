program HackScaner;

uses
  Forms,
  main in 'main.pas' {frmMain},
  dict in 'dict.pas' {frmDict},
  report in 'report.pas' {frmReport},
  function_1 in 'function_1.pas',
  thread_ping in 'thread_ping.pas',
  thread_share in 'thread_share.pas',
  thread_scan_ping in 'thread_scan_ping.pas',
  thread_scan_port in 'thread_scan_port.pas',
  thread_sql_ping in 'thread_sql_ping.pas',
  thread_sql_pass in 'thread_sql_pass.pas',
  share_pass in 'share_pass.pas',
  pop3_scan in 'pop3_scan.pas',
  pop3_detect in 'pop3_detect.pas',
  Tlookup_name in 'Tlookup_name.pas',
  Spec in 'Spec.pas' {frmSpec};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDict, frmDict);
  Application.CreateForm(TfrmReport, frmReport);
  Application.CreateForm(TfrmSpec, frmSpec);
  Application.Run;
end.
