program bpaspr;

uses
  Forms,
  abfComponents,
  ufrmSplash in 'ufrmSplash.pas' {frmSplash},
  ufrmMain in 'ufrmMain.pas' {frmMain};

var
  lc_abfOneInstance: TabfOneInstance;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '特种设备监察管理系统';
  lc_abfOneInstance := TabfOneInstance.Create(nil);
  try
    if lc_abfOneInstance.AlreadyRun then Exit;
    Application.CreateForm(TfrmMain, frmMain);
    if frmMain.pubf_Ini then Application.Run else frmMain.Free;
  finally
    lc_abfOneInstance.Free;
  end;
end.
