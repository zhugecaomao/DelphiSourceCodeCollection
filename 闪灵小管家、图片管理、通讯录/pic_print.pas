unit pic_print;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  Tprint_form = class(TQuickRep)
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
  private

  public

  end;

var
  print_form: Tprint_form;

implementation

{$R *.DFM}

end.
