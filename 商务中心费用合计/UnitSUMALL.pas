unit UnitSUMALL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, DB, ADODB;

type
  TFormSUMALL = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ADOStoredProc1: TADOStoredProc;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure change_to_zero;
    { Private declarations }
  public
    procedure sumzzhj;
    procedure sumzzjehj;
    procedure sumkrjehj;
    procedure sumkrzzhj;
    procedure bmmx;
    { Public declarations }
  end;

var
  FormSUMALL: TFormSUMALL;

implementation
USES UDM,Unitqbbb, Unitsummoneyreport;
{$R *.dfm}
procedure tformsumall.change_to_zero;
begin
   ADOStoredProc1.Close;
   ADOStoredProc1.ExecProc;
end;

procedure tformsumall.sumzzjehj;
 begin
    //部门报表最底层合技数显示
   with DM.ADOTEMP do
     begin
     Close;
     SQL.Clear;
     SQL.Add('select sum(npage)*0.3,sum(wpage)*0.2,sum(B5)*0.15,sum(k16)*0.15,sum(A4)*0.15,sum(B4)*0.2,');
     SQL.Add('sum(K8)*0.2,sum(A3)*0.2,sum(A42)*0.13,sum(K82)*0.13,sum(LABAN)*2.5,sum(SENDOUTSIDE)*8.4,');
     SQL.Add('sum(sendinside)*1.1,sum(sendprive)*0.55,sum(resivdpage)*0.4,sum(chinacall),sum(nationcall),sum(hgcall) from center');
     SQL.Add('where t_time between :Begin and :End');
     Parameters.ParamByName('begin').Value:=DateTimePicker1.Date;
     Parameters.ParamByName('end').Value:=DateTimePicker2.Date;
     Prepared;
     Open;
     end;
    Formqbbb.QRzjehj.Caption:=CurrToStr(dm.ADOTEMP.Fields[0].AsCurrency+dm.ADOTEMP.Fields[1].AsCurrency
    +dm.ADOTEMP.Fields[2].AsCurrency+dm.ADOTEMP.Fields[3].AsCurrency+dm.ADOTEMP.Fields[4].AsCurrency
    +dm.ADOTEMP.Fields[5].AsCurrency+dm.ADOTEMP.Fields[6].AsCurrency+dm.ADOTEMP.Fields[7].AsCurrency+
    dm.ADOTEMP.Fields[8].AsCurrency+dm.ADOTEMP.Fields[9].AsCurrency+dm.ADOTEMP.Fields[10].AsCurrency+
    dm.ADOTEMP.Fields[11].AsCurrency+dm.ADOTEMP.Fields[12].AsCurrency+dm.ADOTEMP.Fields[13].AsCurrency+dm.ADOTEMP.Fields[14].AsCurrency
    +dm.ADOTEMP.Fields[15].AsCurrency+dm.ADOTEMP.Fields[16].AsCurrency+dm.ADOTEMP.Fields[17].AsCurrency); //部门总金额合计显示

   dm.ADOTEMP.Close;
 end;
procedure tformsumall.sumzzhj;
 begin
   with DM.ADOTEMP do
     begin
     Close;
     SQL.Clear;
     SQL.Add('select sum(npage),sum(wpage),sum(B5),sum(k16),sum(A4),sum(B4),');
     SQL.Add('sum(K8),sum(A3),sum(A42),sum(K82),sum(LABAN),sum(SENDOUTSIDE),');
     SQL.Add('sum(sendinside),sum(sendprive),sum(resivdpage),sum(chinacall),sum(nationcall),sum(hgcall) from center');
     SQL.Add('where t_time between :Begin and :End');
     Parameters.ParamByName('begin').Value:=DateTimePicker1.Date;
     Parameters.ParamByName('end').Value:=DateTimePicker2.Date;
     Prepared;
     Open;
     end;
   Formqbbb.npage.Caption:=CurrToStr(dm.ADOTEMP.Fields[0].AsCurrency);
   Formqbbb.wpage.Caption:=CurrToStr(dm.ADOTEMP.Fields[1].AsCurrency);
   Formqbbb.QRb5.Caption:=CurrToStr(dm.ADOTEMP.Fields[2].AsCurrency);
   Formqbbb.QR16k.Caption:=CurrToStr(dm.ADOTEMP.Fields[3].AsCurrency);
   Formqbbb.QRa4.Caption:=CurrToStr(dm.ADOTEMP.Fields[4].AsCurrency);
   Formqbbb.QRb4.Caption:=CurrToStr(dm.ADOTEMP.Fields[5].AsCurrency);
   Formqbbb.QR8k.Caption:=CurrToStr(dm.ADOTEMP.Fields[6].AsCurrency);
   Formqbbb.QRa3.Caption:=CurrToStr(dm.ADOTEMP.Fields[7].AsCurrency);
   Formqbbb.QRa42.Caption:=CurrToStr(dm.ADOTEMP.Fields[8].AsCurrency);
   Formqbbb.QR8k2.Caption:=CurrToStr(dm.ADOTEMP.Fields[9].AsCurrency);
   Formqbbb.QRLaban.Caption:=CurrToStr(dm.ADOTEMP.Fields[10].AsCurrency);
   Formqbbb.sedout.Caption:=CurrToStr(dm.ADOTEMP.Fields[11].AsCurrency);
   Formqbbb.china.Caption:=CurrToStr(dm.ADOTEMP.Fields[12].AsCurrency);
   Formqbbb.periv.Caption:=CurrToStr(dm.ADOTEMP.Fields[13].AsCurrency);
   Formqbbb.resive.Caption:=CurrToStr(dm.ADOTEMP.Fields[14].AsCurrency);
   Formqbbb.inside.Caption:=CurrToStr(dm.ADOTEMP.Fields[15].AsCurrency);
   Formqbbb.nation.Caption:=CurrToStr(dm.ADOTEMP.Fields[16].AsCurrency);
   Formqbbb.hg.Caption:=CurrToStr(dm.ADOTEMP.Fields[17].AsCurrency);

   dm.ADOTEMP.Close;
 end;
procedure TFormSUMALL.sumkrzzhj;
 begin
   //客人报表显示
   with DM.ADOCODE DO
     BEGIN
       Close;
       SQL.Clear;
       SQL.add('SELECT SUM(chinsepage) AS chinsepage, SUM(englishpage) AS englishpage,');
       SQL.Add('SUM(A4) AS A4, SUM(K16) AS K16, SUM(B5) AS B5, SUM(A3) AS A3, SUM(K8) AS K8,');
       SQL.Add('sUM(B4) AS B4, SUM(sendoutside) AS SENDOUTSIDE, SUM(sendinside) AS sendinside,');
       SQL.Add('SUM(sendprive) AS sendprive, SUM(resivd) AS resivd, SUM(print1) AS print1,');
       SQL.Add('SUM(sacn) AS sacn, SUM(nationcall) AS nationcall, SUM(hgcall) AS hgcall,');
       SQL.Add('SUM(chinacall) AS chinacall, SUM(intenet) AS intenet, SUM(land) AS land,sum(neibuje) as neibuje  FROM tableforpeople');
       SQL.Add('where preson=''客人'' and rq between :krq and :jrq');
       Parameters.ParamByName('krq').Value:=DateTimePicker1.Date;
       Parameters.ParamByName('jrq').Value:=DateTimePicker2.Date;
       Prepared;
       Open;
     end;
   Formqbbb.ZW.Caption:=IntToStr(dm.ADOCODE.Fields[0].AsInteger);
   Formqbbb.YW.Caption:=IntToStr(dm.ADOCODE.Fields[1].AsInteger);
   Formqbbb.A4.Caption:=IntToStr(dm.ADOCODE.Fields[2].AsInteger);
   Formqbbb.K16.Caption:=IntToStr(dm.ADOCODE.Fields[3].AsInteger);
   Formqbbb.B5.Caption:=IntToStr(dm.ADOCODE.Fields[4].AsInteger);
   Formqbbb.A3.Caption:=IntToStr(dm.ADOCODE.Fields[5].AsInteger);
   Formqbbb.K8.Caption:=IntToStr(dm.ADOCODE.Fields[6].AsInteger);
   Formqbbb.B4.Caption:=IntToStr(dm.ADOCODE.Fields[7].AsInteger);
   Formqbbb.GJC.Caption:=IntToStr(dm.ADOCODE.Fields[8].AsInteger);
   Formqbbb.GNC.Caption:=IntToStr(dm.ADOCODE.Fields[9].AsInteger);
   Formqbbb.SNC.Caption:=IntToStr(dm.ADOCODE.Fields[10].AsInteger);
   Formqbbb.SWC.Caption:=IntToStr(dm.ADOCODE.Fields[11].AsInteger);
   Formqbbb.DY.Caption:=IntToStr(dm.ADOCODE.Fields[12].AsInteger);
   Formqbbb.SM.Caption:=IntToStr(dm.ADOCODE.Fields[13].AsInteger);
   Formqbbb.GJD.Caption:=CurrToStr(dm.ADOCODE.Fields[14].AsCurrency);
   Formqbbb.HGD.Caption:=CurrToStr(dm.ADOCODE.Fields[15].AsCurrency);
   Formqbbb.GND.Caption:=CurrToStr(dm.ADOCODE.Fields[16].AsCurrency);
   Formqbbb.NET.Caption:=IntToStr(dm.ADOCODE.Fields[17].AsInteger);
   Formqbbb.BROW.Caption:=IntToStr(dm.ADOCODE.Fields[18].AsInteger);
   Formqbbb.nbje.Caption:=CurrToStr(dm.ADOCODE.Fields[19].AsCurrency);
   dm.ADOCODE.Close;
 end;
procedure TFormSUMALL.sumkrjehj;
 begin
   //客人合计金额
   with DM.ADOCODE do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select SUM(chinsepage)*20 AS chinsepage, SUM(englishpage)*30 AS englishpage,');
       SQL.Add('SUM(A4)*3 AS A4, SUM(K16)*3 AS K16, SUM(B5)*3 AS B5, SUM(A3)*5 AS A3, SUM(K8)*5 AS K8,');
       SQL.Add('SUM(B4)*5 AS B4, SUM(sendoutside)*20 AS SENDOUTSIDE, SUM(sendinside)*10 AS sendinside,');
       SQL.ADD('SUM(sendprive)*5 AS sendprive, SUM(resivd)*2 AS resivd, SUM(print1)*10 AS print1,');
       SQL.Add('SUM(sacn)*3 AS sacn, SUM(nationcall) AS nationcall, SUM(hgcall) AS hgcall,');
       SQL.Add('SUM(chinacall) AS chinacall, SUM(intenet) AS intenet, SUM(land) AS land,sum(neibuje) as neibuje FROM tableforpeople');
       SQL.Add('where (rq between :krq and :Jrq) and preson=''客人''');
       Parameters.ParamByName('krq').Value:=DateTimePicker1.Date;
       Parameters.ParamByName('jrq').Value:=DateTimePicker2.Date;
       Prepared;
       Open;
     end;
    Formqbbb.dzhj.Caption:=inttostr(dm.ADOCODE.Fields[0].AsInteger+dm.ADOCODE.Fields[1].AsInteger);
    Formqbbb.fyhj.Caption:=inttostr(dm.ADOCODE.Fields[2].AsInteger+dm.ADOCODE.Fields[3].AsInteger+dm.ADOCODE.Fields[4].AsInteger+dm.ADOCODE.Fields[5].AsInteger+dm.ADOCODE.Fields[6].AsInteger+dm.ADOCODE.Fields[7].AsInteger);
    Formqbbb.smhj.Caption:=inttostr(dm.ADOCODE.Fields[12].AsInteger+dm.ADOCODE.Fields[13].AsInteger);
    Formqbbb.czhj.Caption:=inttostr(dm.ADOCODE.Fields[8].AsInteger+dm.ADOCODE.Fields[9].AsInteger+dm.ADOCODE.Fields[10].AsInteger+dm.ADOCODE.Fields[11].AsInteger);
    Formqbbb.chhj.Caption:=CurrToStr(dm.ADOCODE.Fields[14].AsCurrency+dm.ADOCODE.Fields[15].AsCurrency+dm.ADOCODE.Fields[16].AsCurrency);
    Formqbbb.swhj.Caption:=inttostr(dm.ADOCODE.Fields[17].AsInteger+dm.ADOCODE.Fields[18].AsInteger);
    Formqbbb.hj.Caption:=CurrToStr(dm.ADOCODE.Fields[0].AsInteger+dm.ADOCODE.Fields[1].AsInteger+
             dm.ADOCODE.Fields[2].AsInteger+dm.ADOCODE.Fields[3].AsInteger+dm.ADOCODE.Fields[4].AsInteger+dm.ADOCODE.Fields[5].AsInteger+dm.ADOCODE.Fields[6].AsInteger+dm.ADOCODE.Fields[7].AsInteger+
             dm.ADOCODE.Fields[12].AsInteger+dm.ADOCODE.Fields[13].AsInteger+
             dm.ADOCODE.Fields[8].AsInteger+dm.ADOCODE.Fields[9].AsInteger+dm.ADOCODE.Fields[10].AsInteger+dm.ADOCODE.Fields[11].AsInteger+
             dm.ADOCODE.Fields[14].AsCurrency+dm.ADOCODE.Fields[15].AsCurrency+dm.ADOCODE.Fields[16].AsCurrency+
             dm.ADOCODE.Fields[17].AsInteger+dm.ADOCODE.Fields[18].AsInteger+dm.ADOCODE.Fields[19].AsCurrency);

    dm.ADOCODE.Close;
 end;
procedure TFormSUMALL.bmmx;
begin
   with dm.qryREPORT do   //部门明细报表显示
   begin
     Close;
     SQL.Clear;
     SQL.Add('select sum(npage) as npage,sum(wpage) as wpage,sum(B5) as B5,sum(k16) as k16,sum(A4) as A4,sum(B4) as B4,');
     SQL.Add('sum(K8) as K8,sum(A3) as A3,sum(A42) as A42,sum(K82) as K82,sum(LABAN) as LABAN,sum(SENDOUTSIDE) as SENDOUTSIDE,');
     SQL.Add('sum(sendinside) as sendinside,sum(sendprive) as sendprive,sum(resivdpage) as resivdpage,sum(chinacall) as chinacall,sum(nationcall) as nationcall,sum(hgcall) as hgcall,department,');
     SQL.Add('(sum(npage)*0.3+sum(wpage)*0.2+sum(B5)*0.15+sum(k16)*0.15+sum(A4)*0.15+');
     SQL.Add('sum(B4)*0.2+sum(K8)*0.2+sum(A3)*0.2+sum(A42)*0.13+sum(K82)*0.13+sum(LABAN)*2.5+sum(SENDOUTSIDE)*8.4+sum(sendinside)*1.1+sum(sendprive)*0.55+sum(resivdpage)*0.4');
     SQL.Add('+sum(chinacall)+sum(nationcall)+sum(hgcall))as hjje from center');
     SQL.Add('where t_time between :Begin and :End');
     SQL.Add('group by department');
     Parameters.ParamByName('begin').Value:=DateTimePicker1.Date;
     Parameters.ParamByName('end').Value:=DateTimePicker2.Date;
     Prepared;
     Open;
   end;
   Formqbbb.QRxm.Caption:=dm.hname;
end;
procedure TFormSUMALL.Button2Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFormSUMALL.FormShow(Sender: TObject);
begin
   DateTimePicker1.Date:=Date;
   DateTimePicker2.Date:=Date;
end;

procedure TFormSUMALL.Button1Click(Sender: TObject);
begin
  change_to_zero;

  Formqbbb:=TFormqbbb.Create(Self);
     sumzzhj;
     sumzzjehj;
     sumkrjehj;
     sumkrzzhj;
     bmmx;
   Formqbbb.QuickRep1.Preview;
   FreeAndNil(Formqbbb);
end;

end.
