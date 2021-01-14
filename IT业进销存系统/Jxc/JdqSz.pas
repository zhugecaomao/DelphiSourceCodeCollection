unit JdqSz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm, Spin;

type
  TfrmJdqSz = class(TfrmComForm)
    btnCancel: TBitBtn;
    labRq: TLabel;
    btnOk: TBitBtn;
    TS1: TSpinEdit;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJdqSz: TfrmJdqSz;

implementation

uses ComFun;

{$R *.DFM}

procedure TfrmJdqSz.btnOkClick(Sender: TObject);
begin
  Close;
  self.ModalResult := MROK;
end;

end.
