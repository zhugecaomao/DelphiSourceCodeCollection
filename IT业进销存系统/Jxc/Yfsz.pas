unit Yfsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient;

type
  TfrmYfsz = class(TForm)                       
    btnCancel: TBitBtn;
    dtpRq: TDateTimePicker;
    labRq: TLabel;
    btnOk: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYfsz: TfrmYfsz;

implementation

{$R *.DFM}

procedure TfrmYfsz.FormShow(Sender: TObject);
begin
  dtpRq.Date := Date;
end;

procedure TfrmYfsz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if Shift = [ssShift] then
        Perform(WM_NEXTDLGCTL, 1, 0)
      else
        Perform(WM_NEXTDLGCTL, 0, 0);
    VK_F4, VK_DOWN:
      if screen.ActiveControl is TCustomEdit then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;
end;

procedure TfrmYfsz.btnOkClick(Sender: TObject);
begin
  Close;
  self.ModalResult := MROK;
end;

end.
