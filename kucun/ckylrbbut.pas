unit ckylrbbut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  Tlrbbfm = class(TForm)
    Panel1: TPanel;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    ADOQuery: TADOQuery;
    bt: TQRLabel;
    QRLabel10: TQRLabel;
    zbrq: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    clmc: TQRMemo;
    xslr: TQRMemo;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    zlr: TQRLabel;
    ADOQuery1: TADOQuery;
    QRLabel2: TQRLabel;
    xmcb: TQRMemo;
    QRLabel3: TQRLabel;
    xmsj: TQRMemo;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lrbbfm: Tlrbbfm;

implementation

uses mainut;

{$R *.dfm}

procedure Tlrbbfm.FormCreate(Sender: TObject);
var
  Present,Present1: TDateTime;
  Year, Month, Day,year1, Month1, Day1: Word;
  sumsl:integer;
  sumje,sumlr:double;
  vdjbh:string;
  vlr:double;
  vjd:integer;
begin
//sumje:=0;
//sumsl:=0;
sumlr:=0;
zbrq.Caption:=datetostr(date());
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from cpckdb');
open;
present:=fieldbyname('出库日期').AsDateTime;
DecodeDate(Present, Year, Month, Day);
present1:=now;
DecodeDate(Present1, Year1, Month1, Day1);
bt.Caption:=inttostr(month1)+'月份成品毛利润报表';
first;
if mainfm.sxz='本月报表' then
begin
if (month=month1) and (year1=year) then
begin
while not eof do
begin
 vdjbh:=fieldbyname('单据编号').AsString;
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select sum(总金额)  as zje from cpckb where 单据编号=:djbh');
     Parameters.ParamByName('djbh').Value:=vdjbh;
     open;
     vlr:=fieldbyname('zje').AsFloat;
   end;
 clmc.Lines.Add(fieldbyname('客户名称').AsString);
 xmcb.Lines.Add(fieldbyname('项目成本').AsString);
 xmsj.Lines.Add(floattostr(vlr));
 xslr.Lines.Add(floattostr(vlr-fieldbyname('项目成本').AsFloat));
 sumlr:=sumlr+vlr-fieldbyname('项目成本').AsFloat;
 next;
 end;
end;
bt.Caption:='本月毛利润报表';
 end;


 if mainfm.sxz='本季度报表' then
   begin
if (month1>=1) and (month1<=3) then
 vjd:=1;
 if (month1>=4) and (month1<=6) then
 vjd:=4;
 if (month1>=7) and (month1<=9) then
 vjd:=7;
 if (month1>=10) and (month1<=12) then
 vjd:=10;
 begin
while not eof do

if (month>=vjd) and (month<=vjd+3) then
begin
 vdjbh:=fieldbyname('单据编号').AsString;
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select sum(总金额)  as zje from cpckb where 单据编号=:djbh');
     Parameters.ParamByName('djbh').Value:=vdjbh;
     open;
     vlr:=fieldbyname('zje').AsFloat;
   end;

   clmc.Lines.Add(fieldbyname('客户名称').AsString);
xmcb.Lines.Add(fieldbyname('项目成本').AsString);
xmsj.Lines.Add(floattostr(vlr));
xslr.Lines.Add(floattostr(vlr-fieldbyname('项目成本').AsFloat));
sumlr:=sumlr+vlr-fieldbyname('项目成本').AsFloat;
next;
end;
bt.Caption:='本季度毛利润报表';
    end;
      end;
   if mainfm.sxz='本年报表' then
   begin
   if (year1=year) then

   begin
while not eof do
begin

 vdjbh:=fieldbyname('单据编号').AsString;
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select sum(总金额)  as zje from cpckb where 单据编号=:djbh');
     Parameters.ParamByName('djbh').Value:=vdjbh;
     open;
     vlr:=fieldbyname('zje').AsFloat;
   end;

   clmc.Lines.Add(fieldbyname('客户名称').AsString);
xmcb.Lines.Add(fieldbyname('项目成本').AsString);
xmsj.Lines.Add(floattostr(vlr));
xslr.Lines.Add(floattostr(vlr-fieldbyname('项目成本').AsFloat));
sumlr:=sumlr+vlr-fieldbyname('项目成本').AsFloat;
next;
end;
end;
bt.Caption:='本年毛利润报表';
   end;
   if mainfm.sxz='按月份' then
    begin
    if (month=mainfm.iyf) and (year1=year) then
begin
while not eof do
begin

 vdjbh:=fieldbyname('单据编号').AsString;
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select sum(总金额)  as zje from cpckb where 单据编号=:djbh');
     Parameters.ParamByName('djbh').Value:=vdjbh;
     open;
     vlr:=fieldbyname('zje').AsFloat;
   end;
clmc.Lines.Add(fieldbyname('客户名称').AsString);
xmcb.Lines.Add(fieldbyname('项目成本').AsString);
xmsj.Lines.Add(floattostr(vlr));
xslr.Lines.Add(floattostr(vlr-fieldbyname('项目成本').AsFloat));
sumlr:=sumlr+vlr-fieldbyname('项目成本').AsFloat;
next;
end;
end;
bt.Caption:=inttostr(mainfm.iyf)+'月份毛利润报表';
    end;
if mainfm.sxz='按季度' then
  begin
  if (month>=mainfm.iyf) and (month<=mainfm.iyf+3) then
begin
while not eof do
begin
 vdjbh:=fieldbyname('单据编号').AsString;
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select sum(总金额)  as zje from cpckb where 单据编号=:djbh');
     Parameters.ParamByName('djbh').Value:=vdjbh;
     open;
     vlr:=fieldbyname('zje').AsFloat;
   end;
clmc.Lines.Add(fieldbyname('客户名称').AsString);
xmcb.Lines.Add(fieldbyname('项目成本').AsString);
xmsj.Lines.Add(floattostr(vlr));
xslr.Lines.Add(floattostr(vlr-fieldbyname('项目成本').AsFloat));
sumlr:=sumlr+vlr-fieldbyname('项目成本').AsFloat;
next;
end;
 end;
 bt.Caption:=mainfm.s_jd+'季度毛利润报表';
   end;



end;
//zsl.Caption:='总数量：'+inttostr(sumsl);
//zje.Caption:='销售总金额：'+floattostr(sumje);
zlr.Caption:='总利润：'+floattostr(sumlr);

end;

end.
