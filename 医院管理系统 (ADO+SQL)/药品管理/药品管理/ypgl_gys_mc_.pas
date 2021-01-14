unit ypgl_gys_mc_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFgysmc = class(TForm)
    DBGrid1: TDBGrid;
    DEgysbh: TDBEdit;
    DEgysmc: TDBEdit;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fgysmc: TFgysmc;

implementation

uses DMypgl_, ypgl_tj_;

{$R *.dfm}

procedure TFgysmc.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
 //将fgysmc窗体的供应商编号 赋值给 faddyp窗体的供应商编号
    Faddyp.Egysbh.Text:=Fgysmc.DEgysbh.Text;
    close;
end;

end.
