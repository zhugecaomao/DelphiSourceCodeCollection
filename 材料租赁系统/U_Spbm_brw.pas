unit U_Spbm_brw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmSpbm_brw = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpbm_brw: TfrmSpbm_brw;

implementation
     USES u_dm,u_public;
{$R *.dfm}

procedure TfrmSpbm_brw.DBGrid1DblClick(Sender: TObject);
begin
BitBtnOk.Click ;
end;

procedure TfrmSpbm_brw.BitBtn2Click(Sender: TObject);
begin
CurrentParam.tmpFind :=false;
end;

procedure TfrmSpbm_brw.BitBtnOkClick(Sender: TObject);
begin
CurrentParam.tmpFind :=true;
end;

end.
