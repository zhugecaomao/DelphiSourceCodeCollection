program BALL;
uses
  Forms,
  Windows,
  MyPict in 'MyPict.pas' {PictForm},
  Mydesk in 'Mydesk.pas' {DeskForm},
  BasePas in 'BasePas.pas' {BaseForm},
  MenuExec in 'MenuExec.pas' {A00Form},
  Speed1 in 'Speed1.pas' {Speed},
  GetStru in 'GetStru.pas' {ReadStru},
  Work01 in 'Work01.pas' {StateForm},
  ComePas in 'ComePas.pas' {ComeForm},
  Data in 'Data.pas' {DM: TDataModule},
  LeftPas in 'LeftPas.pas' {LeftForm},
  CMonth in 'CMonth.pas' {MMonth},
  ViewPas in 'ViewPas.pas' {ViewForm},
  PPreview in 'PPreview.pas' {Preview},
  Authors in 'Authors.pas' {Author},
  AboutPas in 'AboutPas.pas' {AboutForm},
  Xeduser in 'Xeduser.pas',
  LogVisor in 'LogVisor.pas' {LogForm},
  DataPas in 'DataPas.pas' {DataForm},
  KardPas in 'KardPas.pas' {CardForm};

{$R *.RES}

var hMutex: HWND;
  H: THandle;
begin
  Application.Initialize;
  hMutex := CreateMutex(nil, false, 'ABC');
  if GetLastError = Error_Already_Exists then
  begin
    ReleaseMutex(hMutex);
    H := Findwindow(nil, '”È¿÷ “');
    SetForeGroundWindow(H);
    ShowWindow(H, SW_SHOW);
    Exit;
  end;
  SX := Screen.Width;
  SY := Screen.Height;
//  SetRatio(640, 480);
  AboutForm := TAboutForm.Create(Application);
  AboutForm.Show;
  AboutForm.Update;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TA00Form, A00Form);
  AboutForm.Free;
  Application.Run;
  SetRatio(SX, SY);
end.
