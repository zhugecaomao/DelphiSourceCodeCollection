unit untwldwgoodsquery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tfmwldwgoodsquery = class(TfmBase)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    SpeedButton10: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    mc: TComboBox;
    bh: TComboBox;
    DB: TDBGrid;
    dscheck: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure mcChange(Sender: TObject);
    procedure bhChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmwldwgoodsquery: Tfmwldwgoodsquery;

implementation

uses untdatadm,func;

{$R *.dfm}

procedure Tfmwldwgoodsquery.FormShow(Sender: TObject);
var
  sqlpub:widestring;
  i:integer;
begin
  inherited;
  sqlpub:='Select supply_NO,supply_Name from [Supply_Company]';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=adisp.resultrecord(sqlpub);
  dmmain.CDSquery2.Open;
  mc.Clear;
  bh.Clear;
  while not dmmain.CDSquery2.Eof do
  begin
    mc.Items.Add(dmmain.CDSquery2.fieldbyname('supply_Name').AsString);
    bh.Items.Add(dmmain.CDSquery2.fieldbyname('supply_NO').AsString);
    dmmain.CDSquery2.Next;
  end;
  dmmain.CDSquery2.Close;
  dmmain.CDSquery.Close;  
end;

procedure Tfmwldwgoodsquery.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close
end;

procedure Tfmwldwgoodsquery.mcChange(Sender: TObject);
begin
  inherited;
  bh.Text:='';
end;

procedure Tfmwldwgoodsquery.bhChange(Sender: TObject);
begin
  inherited;
  mc.Text:=''
end;

procedure Tfmwldwgoodsquery.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  i:integer;
begin
  inherited;
  if trim(mc.Text)<>'' then sqlpub:='select baseprice,goods_no,goods_name,barcode,type,brand,breed,sum(money) as money,sum(amount) as amount from [Vwldwgoods] where wldw='+''''+trim(mc.Text)+''''+' group by goods_no,goods_name,barcode,type,brand,breed,baseprice'
  else if trim(bh.Text)<>'' then sqlpub:='select baseprice,goods_no,goods_name,barcode,type,brand,breed,sum(money) as money,sum(amount) as amount from [Vwldwgoods] where wldw_no='+''''+trim(bh.Text)+''''+' group by goods_no,goods_name,barcode,type,brand,breed,baseprice'
       else sqlpub:='select baseprice,goods_no,goods_name,barcode,type,brand,breed,sum(money) as money,sum(amount) as amount from [Vwldwgoods]'+' group by goods_no,goods_name,barcode,type,brand,breed,baseprice';
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSquery.Open;
end;

procedure Tfmwldwgoodsquery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  inherited;

end;

end.
