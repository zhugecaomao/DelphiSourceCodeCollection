unit GZGL_ZLCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TFrmGZGL_ZLCP = class(TForm)
    DBGrid1: TDBGrid;
    Pnl1: TPanel;
    Panel2: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_ZLCP: TFrmGZGL_ZLCP;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_ZLCP.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd.tbl_CP do begin
    if active then
      //Refresh   //为什么不行???
    else
      open;
    s:='当前工装共有产品信息 '+inttostr(recordcount)+' 条';
    pnl1.caption:=s;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

end.
