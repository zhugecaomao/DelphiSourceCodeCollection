unit UnitDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialog, DsFancyButton, ExtCtrls, ComCtrls, MenuBar, ToolWin,
  StdCtrls, DBCtrls;

type
  TfrmDetail = class(TBaseDialogFrm)
    DBMemo1: TDBMemo;
    Button1: TButton;
    procedure FormResize(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetail: TfrmDetail;

implementation

{$R *.dfm}

procedure TfrmDetail.FormResize(Sender: TObject);
begin
  inherited;
OKbtn.Left:=(Bevel_button.Width div 2)-60;
CancelBtn.Left:=OKbtn.Left+100;

end;

procedure TfrmDetail.OKBtnClick(Sender: TObject);
begin
  inherited;
Button1.SetFocus;
Close;
end;

end.
