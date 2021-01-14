program PosMisClt;

uses
  Forms,
  Windows,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  ufrmSelectMain in 'ufrmSelectMain.pas' {frmSelectMain},
  ufrmBeginning in 'ufrmBeginning.pas' {frmBeginning},
  ufrmFrontPay in 'ufrmFrontPay.pas' {frmFrontPay},
  ufrmTradeInfo in 'ufrmTradeInfo.pas' {frmTradeInfo},
  udmData in 'udmData.pas' {dmData: TDataModule},
  upubCommon in '..\public\upubCommon.pas',
  ufrmCheckPower in 'ufrmCheckPower.pas' {frmCheckPower},
  ufrmDiscount in 'ufrmDiscount.pas' {frmDiscount},
  uPubClient in 'uPubClient.pas',
  ufrmDataDeliver in 'ufrmDataDeliver.pas' {frmDataDeliver},
  ufrmPosSet in 'ufrmPosSet.pas' {frmPosSet},
  ufrmSoftReg in 'ufrmSoftReg.pas' {frmSoftReg};

{$R *.res}
var
  lh_Handle: THandle;
begin
  if Windows.OpenMutex(MUTANT_ALL_ACCESS, True, '800105') <> 0 then
  begin
    AppMsg('程序正在运行,不能重复运行!', '系统提示', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  lh_Handle := CreateMutex(nil, True, '800105');
  Application.Initialize;
  Application.Title := '餐饮管理';
  Application.CreateForm(TfrmSelectMain, frmSelectMain); 
  if frmSelectMain.pubf_Ini then
  begin
    frmSelectMain.pubp_Ini;
    Application.Run;
  end else
  begin
    frmSelectMain.Free;
    ShutDownMachines;
  end; 
  ReleaseMutex(lh_Handle);
end.
