program MainProject;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  HUANYINUnit in 'HUANYINUnit.pas' {HUANYINForm},
  DENLUUnit in 'DENLUUnit.pas' {DENLUForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  BangZhuUnit in 'BangZhuUnit.pas' {BangZhuForm},
  YHGLUnit in 'YHGLUnit.pas' {YHGLForm},
  XGKLUnit in 'XGKLUnit.pas' {XGKLForm},
  HYUnit in 'HYUnit.pas' {HYForm},
  KUUnit in 'KUUnit.pas' {KHForm},
  CDUnit in 'CDUnit.pas' {CDForm},
  BFHFUnit in 'BFHFUnit.pas' {BFHFForm},
  FHXXUnit in 'FHXXUnit.pas' {FHXXForm},
  SHXXUnit in 'SHXXUnit.pas' {SHXXForm},
  HYDJUnit in 'HYDJUnit.pas' {HYDJForm},
  DLUnit in 'DLUnit.pas' {DLForm},
  YWYUnit in 'YWYUnit.pas' {YWYForm},
  LYQUERYUnit in 'LYQUERYUnit.pas' {LYQUERYForm},
  KHQUERYUnit in 'KHQUERYUnit.pas' {KUQUERYForm},
  DLQUERYUnit in 'DLQUERYUnit.pas' {DLQUERYForm},
  FHXXQUERYUnit in 'FHXXQUERYUnit.pas' {FHXXQUERYForm},
  SHXXQUERYUnit in 'SHXXQUERYUnit.pas' {SHXXQUeryForm},
  HYDJQUERYUnit in 'HYDJQUERYUnit.pas' {HYDJQUeryForm},
  KHFYUnit in 'KHFYUnit.pas' {KHFYForm},
  PrintUnit in 'PrintUnit.pas' {PrintForm},
  CallPrint in 'CallPrint.pas',
  HYFYQueryUnit in 'HYFYQueryUnit.pas' {HYFYQueryForm},
  LYFYQueryUnit in 'LYFYQueryUnit.pas' {LYFYQueryForm},
  DLFYQueryUnit in 'DLFYQueryUnit.pas' {DLFYQueryForm},
  OTHQueryUnit in 'OTHQueryUnit.pas' {OTHQueryForm},
  KHFYQueryUnit in 'KHFYQueryUnit.pas' {KHFYQueryForm},
  MonthUnit in 'MonthUnit.pas' {MonthForm},
  YEARUnit in 'YEARUnit.pas' {YEARForm},
  YBCXUnit in 'YBCXUnit.pas' {YBCXForm},
  NBCXUnit in 'NBCXUnit.pas' {NBCXForm};

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  HUANYINForm:=THUANYINForm.Create(Application);
  HUANYINForm.ShowModal;
  Application.Run;
end.
