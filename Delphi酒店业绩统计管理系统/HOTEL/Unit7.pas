unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm7 = class(TForm)
    pnlTop: TPanel;
    imgMain: TImage;
    lblSoftWareName: TLabel;
    Label2: TLabel;
    lblCopyleft: TLabel;
    lblComment: TLabel;
    pnlBottom: TPanel;
    mmoThank: TRichEdit;
    btnOk: TButton;
    XPManifest1: TXPManifest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

end.
