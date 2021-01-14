unit yzcx_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, XPMenu;

type
  Tyzcx = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    XPMenu1: TXPMenu;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  yzcx: Tyzcx;

implementation

uses bqcxtj_, sscxtj_, zfcxtj_;

{$R *.dfm}

procedure Tyzcx.BitBtn2Click(Sender: TObject);
begin
  bqcxtj.ShowModal;
end;

procedure Tyzcx.BitBtn3Click(Sender: TObject);
begin
    sscxtj.ShowModal;
end;

procedure Tyzcx.BitBtn1Click(Sender: TObject);
begin
   zfcxtj.ShowModal;
end;

end.
