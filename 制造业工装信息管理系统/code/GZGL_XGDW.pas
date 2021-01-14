unit GZGL_XGDW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, DBCtrls;

type
  TFrmGZGL_XGDW = class(TForm)
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
  FrmGZGL_XGDW: TFrmGZGL_XGDW;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_XGDW.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd.tbl_DW do begin
    if active then
      //refresh
    else
      open;
    s:=' 当前单位共有 '+inttostr(recordcount)+' 个';
    pnl1.caption:=s;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

end.
