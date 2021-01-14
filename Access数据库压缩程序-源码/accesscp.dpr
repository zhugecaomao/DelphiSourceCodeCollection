program accesscp;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '压缩Access数据库的程序 V1.0';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
