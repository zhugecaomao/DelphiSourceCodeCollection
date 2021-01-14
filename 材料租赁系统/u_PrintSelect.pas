unit u_PrintSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPrintSelect = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintSelect: TfrmPrintSelect;

implementation
    uses u_public;
{$R *.dfm}

procedure TfrmPrintSelect.BitBtn1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0:CurrentParam.bprint :=true;
1:CurrentParam.bprint :=false;
end;
CurrentParam.tmpFind :=true;
close;
end;

procedure TfrmPrintSelect.BitBtn2Click(Sender: TObject);
begin
CurrentParam.tmpFind :=false;
end;

end.
