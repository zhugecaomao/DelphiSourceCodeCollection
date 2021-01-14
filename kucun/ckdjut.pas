unit ckdjut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB;

type
  Tchbbfm = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    djbh: TQRLabel;
    QRShape1: TQRShape;
    dyrq: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    jbr: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    ADOQuery: TADOQuery;
    spmc: TQRMemo;
    spgg: TQRMemo;
    spks: TQRMemo;
    sppl: TQRMemo;
    spsl: TQRMemo;
    spdw: TQRMemo;
    spdj: TQRMemo;
    spzje: TQRMemo;
    zje1: TQRLabel;
    QRLabel17: TQRLabel;
    zsl: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chbbfm: Tchbbfm;
  mypath,str:string;
implementation

uses mainut;

{$R *.dfm}

procedure Tchbbfm.FormCreate(Sender: TObject);
var
num1,num2:double;
begin
num1:=0;
num2:=0;
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
 with adoquery do
 begin
 close;
 sql.clear;
 sql.add('select * from fhddb');
 open;
 first;
 while not eof do
   begin
   spmc.Lines.Add(fieldbyname('名称').asstring);
   spgg.Lines.Add(fieldbyname('规格').AsString);
   sppl.Lines.Add(fieldbyname('品类').AsString);
   spks.Lines.Add(fieldbyname('款式').AsString);
   spsl.Lines.Add(fieldbyname('数量').AsString);
   spdw.Lines.Add(fieldbyname('单位').AsString);
   spdj.Lines.Add(fieldbyname('销售单价').AsString);
   spzje.Lines.Add(fieldbyname('销售总金额').AsString+'元');
   num1:=num1+fieldbyname('数量').AsFloat;
   num2:=num2+fieldbyname('销售总金额').AsFloat;
    next;
   end;
   djbh.Caption:=djbh.Caption+fieldbyname('单据编号').AsString;
  
 end;
{dyrq.Caption:=datetostr(date());
;
spmc.Caption:=mainfm.spmc;
spgg.Caption:=mainfm.spgg;
spks.Caption:=mainfm.spks;
sppl.Caption:=mainfm.sppl;
spsl.Caption:=inttostr(mainfm.spsl);
dw.Caption:=mainfm.spdw; }

dyrq.Caption:=datetostr(date());
zsl.Caption:=floattostr(num1);
zje1.Caption:=floattostr(num2)+'元';
jbr.Caption:=mainfm.username;
end;

end.
