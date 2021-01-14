unit C_YdhcPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TYdhcPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitle: TQRLabel;
    qrlSub: TQRLabel;
    qrlKrxm: TQRLabel;
    qrlLxr: TQRLabel;
    qrlSysj: TQRLabel;
    QRLabel1: TQRLabel;
    qrlBz: TQRMemo;
    qrlHczj: TQRLabel;
    qrlHcmc: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qrlLxdh: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlHcrs: TQRLabel;
    qrlZxtrs: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel16: TQRLabel;
    QRShape30: TQRShape;
    QRLabel17: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel8: TQRLabel;
    qrlHt: TQRLabel;
    qrlQt: TQRLabel;
    qrlSg: TQRLabel;
    qrlXh: TQRLabel;
    qrlHf: TQRLabel;
    QRShape12: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure YdhcPrint;
  end;

var
  YdhcPrintForm: TYdhcPrintForm;

implementation

{$R *.dfm}

procedure TYdhcPrintForm.YdhcPrint;
begin
  with YdhcPrintForm do
  begin
    QuickRep1.Print;
    //QuickRep1.PreviewModal;
  end;
end;

end.
