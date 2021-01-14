unit entergoo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, ADODB, StdCtrls;

type
  TenterFrom = class(TForm)
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1p_id: TSmallintField;
    ADOQuery1p_name: TWideStringField;
    ADOQuery1p_price: TBCDField;
    ADOQuery1p_unit: TWideStringField;
    ADOQuery1p_type: TSmallintField;
    ADOQuery1p_sale: TSmallintField;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  enterFrom: TenterFrom;

implementation

uses datamodule;

{$R *.dfm}

procedure TenterFrom.Button1Click(Sender: TObject);
begin
 if not adoquery1.active then
  adoquery1.open
  else
  adoquery1.close;
end;

procedure TenterFrom.FormActivate(Sender: TObject);
begin
  if not datamodule1.adoconnection1.connected then
    datamodule1.adoconnection1.connected:=true;
  adoquery1.close;
  adoquery1.open;
end;

procedure TenterFrom.Button2Click(Sender: TObject);
begin
adoquery1.close;
datamodule1.adoconnection1.connected:=false;
close;
end;

end.
