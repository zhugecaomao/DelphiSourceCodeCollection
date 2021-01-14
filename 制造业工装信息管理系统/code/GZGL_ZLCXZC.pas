unit GZGL_ZLCXZC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls;

type
  TFrmGZGL_ZLCXZC = class(TForm)
    Panel2: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label18: TLabel;
    DBGrid1: TDBGrid;
    Pnl1: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_ZLCXZC: TFrmGZGL_ZLCXZC;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_ZLCXZC.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd.tbl_LB do begin
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
