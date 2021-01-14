unit zysf_bb_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  Tzysf_bb = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zysf_bb: Tzysf_bb;

implementation

uses zycsf_;

{$R *.dfm}

end.
