unit Ndsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm;

type
  TfrmNdsz = class(TfrmComForm)
    btnCancel: TBitBtn;
    labRq: TLabel;
    btnOk: TBitBtn;
    dtpRq: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNdsz: TfrmNdsz;

implementation

{$R *.DFM}

procedure TfrmNdsz.FormShow(Sender: TObject);
begin
  dtpRq.Date := Date;
end;

procedure TfrmNdsz.btnOkClick(Sender: TObject);
begin
  Close;
  self.ModalResult := MROK;
end;

end.
