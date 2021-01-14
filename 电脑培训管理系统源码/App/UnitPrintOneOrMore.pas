unit UnitPrintOneOrMore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialog, DsFancyButton, ExtCtrls, ComCtrls, MenuBar, ToolWin,
  StdCtrls;

type
  TfrmPrintOneOrMore = class(TBaseDialogFrm)
    rOne: TRadioButton;
    rMore: TRadioButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintOneOrMore: TfrmPrintOneOrMore;

implementation

uses UnitPrintPersonInfo, UnitDM, UnitData;

{$R *.dfm}

procedure TfrmPrintOneOrMore.OKBtnClick(Sender: TObject);
begin
  inherited;
try
    frmPrintPersonInfo:=TfrmPrintPersonInfo.Create(nil);
    if rOne.Checked then
        frmPrintPersonInfo.QuickRep1.DataSet:=nil
    else
        frmPrintPersonInfo.QuickRep1.DataSet:=DM.Q_Person;

    frmPrintPersonInfo.qrlCompanyName.Caption:=sCompanyName;
    frmPrintPersonInfo.qrlCompanyPhone.Caption:=sCompanyPhone;
    frmPrintPersonInfo.qrlCompanyAddress.Caption:=sCompanyAddress;

    if FileExists(sPath+'Attention.txt') then
        frmPrintPersonInfo.qrmAttention.Lines.LoadFromFile(sPath+'Attention.txt');
    frmPrintPersonInfo.QuickRep1.Preview;
    frmPrintPersonInfo.Free;
except
    Msgs('window');
    frmPrintPersonInfo.Free;
end;

Close;
end;

procedure TfrmPrintOneOrMore.CancelBtnClick(Sender: TObject);
begin
  inherited;
Close;
end;

end.
