unit GZGL_XGCXZC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, DBCtrls;

type
  TFrmGZGL_XGCXZC = class(TForm)
    Panel2: TPanel;
    Label16: TLabel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Pnl1: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_XGCXZC: TFrmGZGL_XGCXZC;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_XGCXZC.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd.tbl_LB do begin
    if active then
      //refresh
    else
      open;
    s:=' 当前车型总成共有 '+inttostr(recordcount)+' 个';
    pnl1.caption:=s;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

end.
