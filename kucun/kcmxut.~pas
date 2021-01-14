unit kcmxut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  Tkcmxfm = class(TForm)
    Panel1: TPanel;
    kcmx: TQuickRep;
    PageHeaderBand1: TQRBand;
    bt: TQRLabel;
    QRLabel10: TQRLabel;
    zbrq: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape35: TQRShape;
    DetailBand1: TQRBand;
    ADOQuery: TADOQuery;
    id: TQRMemo;
    xh: TQRMemo;
    id1: TQRMemo;
    clmc: TQRMemo;
    gg: TQRMemo;
    dw: TQRMemo;
    qqkc: TQRMemo;
    bqjh: TQRMemo;
    bqxh: TQRMemo;
    qmkc: TQRMemo;
    zje: TQRMemo;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kcmxfm: Tkcmxfm;

implementation

{$R *.dfm}

procedure Tkcmxfm.FormCreate(Sender: TObject);
var
mypath:string;
sumje,sumsl:integer;
Present: TDateTime;
  Year, Month, Day: Word;
  i:integer;
begin
sumje:=0;
sumsl:=0;
i:=1;
present:=now;
DecodeDate(Present, Year, Month, Day);
bt.Caption:=inttostr(Month)+'月份库存物资盘存报表';
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
zbrq.Caption:=datetostr(date());

with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from kcb');
open;
first;
while not eof do
begin
id.Lines.Add('');
id1.Lines.Add('');
xh.Lines.Add(inttostr(i));
clmc.Lines.Add(fieldbyname('名称').AsString);
gg.Lines.Add(fieldbyname('规格').AsString);
dw.Lines.Add(fieldbyname('单位').AsString);
qqkc.Lines.Add(fieldbyname('前期库存').AsString);
bqjh.Lines.Add(fieldbyname('本期进货').AsString);
bqxh.Lines.Add(fieldbyname('本期消耗').AsString);
qmkc.Lines.Add(fieldbyname('期末库存').AsString);
zje.Lines.Add(fieldbyname('总金额').AsString);
id.Lines.Add('');
id1.Lines.Add('');
xh.Lines.Add('');
clmc.Lines.Add('');
gg.Lines.Add('');
zje.Lines.Add('');
dw.Lines.Add('');
qqkc.Lines.Add('');
bqjh.Lines.Add('');
bqxh.Lines.Add('');
qmkc.Lines.Add('');
i:=i+1;
next;
end;
end;
end;

end.
