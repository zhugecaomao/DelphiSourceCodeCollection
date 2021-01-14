unit ckybbut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, ADODB, QuickRpt,
  QRCtrls, Grids, DBGrids;

type
  Tckybbfm = class(TForm)
    Panel1: TPanel;
    ADOQuery: TADOQuery;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    zsl: TQRLabel;
    zgje: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    bt: TQRLabel;
    QRLabel10: TQRLabel;
    zbrq: TQRLabel;
    QRShape1: TQRShape;
    id: TQRMemo;
    clbh: TQRMemo;
    clmc: TQRMemo;
    sl: TQRMemo;
    zje: TQRMemo;
    clgg: TQRMemo;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    dj: TQRMemo;
    QRLabel2: TQRLabel;
    ADOQuery1: TADOQuery;
    QRLabel5: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ckybbfm: Tckybbfm;

implementation

uses mainut;

{$R *.dfm}

procedure Tckybbfm.FormCreate(Sender: TObject);
var
mypath:string;
str:string;
  Present,Present1: TDateTime;
  Year, Month, Day,year1, Month1, Day1: Word;
  sumsl:integer;
  sumje:double;
  vdjbh:string;
begin
sumje:=0;
sumsl:=0;
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
zbrq.Caption:=datetostr(date());

with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from ckdb');
open;
present:=fieldbyname('出库日期').AsDateTime;
DecodeDate(Present, Year, Month, Day);
present1:=now;
DecodeDate(Present1, Year1, Month1, Day1);
bt.Caption:=inttostr(month1)+'月材料出库报表';
//first;
if (month=month1) and (Year=Year1) then
begin

//vdjbh:=fieldbyname('单据编号').asstring;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from ckb');
//Parameters.ParamByName('vdjbh').Value:=vdjbh;
open;
first;
while not eof do
begin
id.Lines.Add('');
clbh.Lines.Add(fieldbyname('编号').AsString);
clmc.Lines.Add(fieldbyname('名称').AsString);
clgg.Lines.Add(fieldbyname('规格').AsString);
sl.Lines.Add(fieldbyname('数量').AsString);
dj.Lines.Add(fieldbyname('单价').AsString);
zje.Lines.Add(fieldbyname('总金额').AsString);
sumje:=sumje+fieldbyname('总金额').Asfloat;
sumsl:=sumsl+fieldbyname('数量').AsInteger;
next;
end;

end;
end;
zsl.Caption:='总数量：'+inttostr(sumsl);
zgje.Caption:='总金额：'+floattostr(sumje);


end;
end;
end.
