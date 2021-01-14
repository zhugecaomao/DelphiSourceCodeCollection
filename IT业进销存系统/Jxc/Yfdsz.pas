unit Yfdsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient;

type
  TfrmYfdsz = class(TForm)
    btnCancel: TBitBtn;
    dtpRqa: TDateTimePicker;
    labRq: TLabel;
    btnOk: TBitBtn;
    dtpRqb: TDateTimePicker;
    Label1: TLabel;
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
  frmYfdsz: TfrmYfdsz;

implementation

uses Main, Dm;

{$R *.DFM}

procedure TfrmYfdsz.FormShow(Sender: TObject);
begin
  dtpRqa.Date := Date;
  dtpRqb.Date := Date;
end;

procedure TfrmYfdsz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if screen.ActiveControl is TCustomEdit then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;
end;

procedure TfrmYfdsz.btnOkClick(Sender: TObject);
begin
  if dtpRqb.Date < dtpRqa.Date then
  begin
    Application.MessageBox('结束月份不能大于起始月份，请重新输入！', '月份设置', MB_OK + MB_ICONWARNING);
    dtpRqb.SetFocus;
    abort;
  end;
  Close;
  self.ModalResult := MROK;
end;

end.
