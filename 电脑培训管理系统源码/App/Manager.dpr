program Manager;

uses
  Forms,
  BaseForm in 'BaseForm.pas' {BaseFrm},
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitData in 'UnitData.pas',
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  BaseDialog in 'BaseDialog.pas' {BaseDialogFrm},
  UnitLogin in 'UnitLogin.pas' {frmLogin},
  BaseDBForm in 'BaseDBForm.pas' {BaseDBFrm},
  UnitOperator in 'UnitOperator.pas' {frmOperator},
  UnitPerson in 'UnitPerson.pas' {frmPerson},
  UnitDetail in 'UnitDetail.pas' {frmDetail},
  UnitOther in 'UnitOther.pas' {frmOther},
  UnitCome in 'UnitCome.pas' {frmCome},
  UnitAdvice in 'UnitAdvice.pas' {frmAdvice},
  UnitWork_Log in 'UnitWork_Log.pas' {frmWork_Log},
  UnitDict in 'UnitDict.pas' {frmDict},
  UnitSearchAdvice in 'UnitSearchAdvice.pas' {frmSearchAdvice},
  UnitSearchWorkLog in 'UnitSearchWorkLog.pas' {frmSearchWorkLog},
  UnitAdviceGraph in 'UnitAdviceGraph.pas' {frmAdviceGraph},
  UnitSearchPerson in 'UnitSearchPerson.pas' {frmSearchPerson},
  UnitPrint_tmp in 'UnitPrint_tmp.pas' {frmPrinttmp},
  UnitPrintPersonRecord in 'UnitPrintPersonRecord.pas' {frmPrintPersonRecord},
  UnitPrintPersonCard in 'UnitPrintPersonCard.pas' {frmPrintPersonCard},
  UnitPrintOneOrMore in 'UnitPrintOneOrMore.pas' {frmPrintOneOrMore},
  UnitPrintPersonInfo in 'UnitPrintPersonInfo.pas' {frmPrintPersonInfo};

{$R *.res}

begin
  screen.Cursors[-17]:=screen.Cursors[-19];
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPrintPersonInfo, frmPrintPersonInfo);
  Application.Run;
end.
