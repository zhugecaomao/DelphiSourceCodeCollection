unit MsgEdtAdv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmAdvancedOptions = class(TForm)
    lblSender: TLabel;
    edtSender: TEdit;
    mmoExtraHeaders: TMemo;
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    Label1: TLabel;
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  frmAdvancedOptions: TfrmAdvancedOptions;

implementation

{$R *.DFM}

end.
