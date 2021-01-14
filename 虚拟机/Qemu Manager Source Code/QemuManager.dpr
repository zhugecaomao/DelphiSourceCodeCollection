program QemuManager;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Main},
  SelMemUnit in 'SelMemUnit.pas' {SelMemory},
  SelProcUnit in 'SelProcUnit.pas' {SelProc},
  YesNoUnit in 'YesNoUnit.pas' {YesNo},
  SelSoundUnit in 'SelSoundUnit.pas' {SelSound},
  QPathUnit in 'QPathUnit.pas' {SelQPath},
  SelWindowNoUnit in 'SelWindowNoUnit.pas' {SelWindow},
  SelCDFLOPUNIT in 'SelCDFLOPUNIT.pas' {SelPhysical},
  NewDiskUnit in 'NewDiskUnit.pas' {NewDisk},
  VlanUnit in 'VlanUnit.pas' {VLan},
  InputUnit in 'InputUnit.pas' {InputFrm},
  RedirectUnit in 'RedirectUnit.pas' {Redirect},
  ListenUnit in 'ListenUnit.pas' {Listeners},
  COnnectorUnit in 'COnnectorUnit.pas' {Connectors},
  NewVlanUnit in 'NewVlanUnit.pas' {NewVLAN},
  KeybUnit in 'KeybUnit.pas' {Keyb},
  SelMachineUnit in 'SelMachineUnit.pas' {MType},
  ProcPriUnit in 'ProcPriUnit.pas' {Proc},
  NewVMUnit in 'NewVMUnit.pas' {NewVM},
  LastRunUnit in 'LastRunUnit.pas' {LastRunFrm},
  FtpSetupUnit in 'FtpSetupUnit.pas' {FTPSetup: TTntForm},
  GetDirUnit in 'GetDirUnit.pas' {SelDir: TTntForm},
  InfoUnit in 'InfoUnit.pas' {Info: TTntForm},
  AboutUnit in 'AboutUnit.pas' {AboutBox},
  OpSysUnit in 'OpSysUnit.pas' {Opsys},
  ImpExpUnit in 'ImpExpUnit.pas' {IMPEXP},
  MediaWizardUnit in 'MediaWizardUnit.pas' {MediaStoreWiz: TTntForm},
  WaitUnit in 'WaitUnit.pas' {Wait: TTntForm},
  SelPhysicalUnit in 'SelPhysicalUnit.pas' {Physical},
  NewOpsysUnit in 'NewOpsysUnit.pas' {NewOpsys},
  QMVersUnit in 'QMVersUnit.pas' {QemuVers},
  AddNewQUnit in 'AddNewQUnit.pas' {NewQVersion},
  SelQPathUnit in 'SelQPathUnit.pas' {SELQ},
  ProfileWizUnit in 'ProfileWizUnit.pas' {DefProWiz: TTntForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Qemu Manager 5.0';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TSelMemory, SelMemory);
  Application.CreateForm(TSelProc, SelProc);
  Application.CreateForm(TYesNo, YesNo);
  Application.CreateForm(TSelSound, SelSound);
  Application.CreateForm(TSelQPath, SelQPath);
  Application.CreateForm(TSelWindow, SelWindow);
  Application.CreateForm(TSelPhysical, SelPhysical);
  Application.CreateForm(TNewDisk, NewDisk);
  Application.CreateForm(TVLan, VLan);
  Application.CreateForm(TInputFrm, InputFrm);
  Application.CreateForm(TRedirect, Redirect);
  Application.CreateForm(TListeners, Listeners);
  Application.CreateForm(TConnectors, Connectors);
  Application.CreateForm(TNewVLAN, NewVLAN);
  Application.CreateForm(TKeyb, Keyb);
  Application.CreateForm(TMType, MType);
  Application.CreateForm(TProc, Proc);
  Application.CreateForm(TNewVM, NewVM);
  Application.CreateForm(TLastRunFrm, LastRunFrm);
  Application.CreateForm(TFTPSetup, FTPSetup);
  Application.CreateForm(TSelDir, SelDir);
  Application.CreateForm(TInfo, Info);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TOpsys, Opsys);
  Application.CreateForm(TIMPEXP, IMPEXP);
  Application.CreateForm(TMediaStoreWiz, MediaStoreWiz);
  Application.CreateForm(TWait, Wait);
  Application.CreateForm(TPhysical, Physical);
  Application.CreateForm(TNewOpsys, NewOpsys);
  Application.CreateForm(TQemuVers, QemuVers);
  Application.CreateForm(TNewQVersion, NewQVersion);
  Application.CreateForm(TSELQ, SELQ);
  Application.CreateForm(TDefProWiz, DefProWiz);
  Application.Run;
end.
