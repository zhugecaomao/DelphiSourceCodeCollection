Program Sky_Coin;

Uses
  Forms,
  Main In 'Unit\Main.pas' {FrmMain},
  Settings In 'Unit\Settings.pas' {FrmSetting},
  MyThread In 'Unit\MyThread.pas',
  AlarmFile In 'Unit\AlarmFile.pas',
  Global In 'Unit\Global.pas',
  tmSDKLib In 'SDK\tmSDKLib.pas',
  tmSDK_DataType In 'SDK\tmSDK_DataType.pas';

{$R *.res}
{$R .\Res\My.res}
Begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
  {$IFDEF NODEBUG}
  Sdk.Free;
  {$ENDIF}
End.

