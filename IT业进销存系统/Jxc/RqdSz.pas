unit Rqdsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm;

type
  TfrmRqdsz = class(TfrmComForm)
    btnCancel: TBitBtn;
    labRq: TLabel;
    btnOk: TBitBtn;
    Label1: TLabel;
    dtpRqa: TDateTimePicker;
    dtpRqb: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRqdsz: TfrmRqdsz;

implementation

uses ComFun;

{$R *.DFM}

procedure TfrmRqdsz.FormShow(Sender: TObject);
begin
  dtpRqa.Date := BOFM(Date);
  dtpRqb.Date := Date;
end;

procedure TfrmRqdsz.btnOkClick(Sender: TObject);
begin
  if dtpRqb.Date < dtpRqa.Date then
  begin
    Application.MessageBox('结束日期不能大于起始日期，请重新输入！', '日期设置', MB_OK + MB_ICONWARNING);
    dtpRqb.SetFocus;
    abort;
  end;
  Close;
  self.ModalResult := MROK;
end;

end.
