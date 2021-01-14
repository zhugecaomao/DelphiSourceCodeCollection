unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  Tmzsfbb = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mzsfbb: Tmzsfbb;

implementation

uses Unit1;

{$R *.dfm}


end.
