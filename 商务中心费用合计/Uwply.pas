unit Uwply;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DB,Uwpxs;

type
  TF_wpxm = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    dswp: TDataSource;
    procedure wwDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_wpxm: TF_wpxm;

implementation
uses UDM;
{$R *.dfm}

procedure TF_wpxm.wwDBGrid1DblClick(Sender: TObject);
begin
   if Caption='领用' then
   begin
    with F_wuxs do
    begin
      edtmc.Text:=dm.Qwpszmc.Value;
      dxCurrencyEdit1.Value:=dm.Qwpszdanja.Value;
      edtsl.SetFocus;
    end;
   end
   else
   if Caption='销售' then
   begin
    with F_wuxs do
    begin
      edtxmc.Text:=dm.Qwpszmc.Value;
      dxCurrencyEdit2.Value:=dm.Qwpszdanja.Value;
      edtxsl.SetFocus;
    end;
   end;

  Self.Close;
end;

end.
