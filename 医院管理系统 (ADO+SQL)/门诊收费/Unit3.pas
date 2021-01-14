unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  Typjgview = class(TForm)
    DBGrid1: TDBGrid;
    DBEmc: TDBEdit;
    DBEsj: TDBEdit;
    DBEzxjg: TDBEdit;
    DBEbh: TDBEdit;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ypjgview: Typjgview;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure Typjgview.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 begin
  mzsf.bh.Text:=DBEbh.Text;
  mzsf.mc.Text:=DbEmc.Text;
  mzsf.rq.Text:=datetostr(date);
  close;
  mzsf.sl.SetFocus;
 end;
end;

end.

