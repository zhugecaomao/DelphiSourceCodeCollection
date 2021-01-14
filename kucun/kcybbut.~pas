unit kcybbut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  Tkcybbfm = class(TForm)
    Panel1: TPanel;
    kcybb: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel10: TQRLabel;
    zbrq: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    clmc: TQRMemo;
    gg: TQRMemo;
    zje: TQRMemo;
    PageHeaderBand1: TQRBand;
    bt: TQRLabel;
    ADOQuery: TADOQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    dw: TQRMemo;
    qqkc: TQRMemo;
    bqjh: TQRMemo;
    bqxh: TQRMemo;
    qmkc: TQRMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kcybbfm: Tkcybbfm;

implementation

{$R *.dfm}

procedure Tkcybbfm.FormCreate(Sender: TObject);
var
mypath:string;
sumje,sumsl:integer;
Present: TDateTime;
  Year, Month, Day: Word;
begin
sumje:=0;
sumsl:=0;
present:=now;
DecodeDate(Present, Year, Month, Day);
bt.Caption:=inttostr(Month)+'月份库存物资盘存报表';
mypath:=extractfilepath(paramstr(0));
ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
zbrq.Caption:=datetostr(date());

with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from kcb');
//Parameters.ParamByName('rq').Value:=datetostr(date());
open;
first;
while not eof do
begin

//clbh.Lines.Add(fieldbyname('编号').AsString);
//clmc.Lines.Add(fieldbyname('名称').AsString);
//pl.Lines.Add(fieldbyname('品类').AsString);
//sl.Lines.Add(fieldbyname('期末库存').AsString);
zje.Lines.Add(fieldbyname('总金额').AsString);
//hw.Lines.Add(fieldbyname('货位').AsString);
//sumje:=sumje+fieldbyname('总金额').AsInteger;
//sumsl:=sumsl+fieldbyname('期末库存').AsInteger;

next;
end;
//zsl.Caption:='总数量：'+inttostr(sumsl);
//zgje.Caption:='总金额：'+inttostr(sumje);
end;
end;

end.
