unit Urbb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TF_rbb = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure rbbcsh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_rbb: TF_rbb;

implementation
uses UDM,Uxsrbb;
{$R *.dfm}
procedure TF_rbb.rbbcsh;
begin
  with dm.qrydatereport do
  begin
    close;
    sql.Clear;
    sql.Add('select * from datereport');
    sql.Add('where rq=:vrq and lx=''客人''');
    Parameters.ParamByName('vrq').Value:=DateTimePicker1.Date;
    Prepared;
    Open;
  end;
  ProgressBar1.Position:=5;
  //复印金额为3元的项目部参加循环
  with dm.ADOTEMP do
  begin
    Close;
    sql.Clear;
    sql.Add('select sum(shuliang),sum(je) from datereport');
    sql.Add('where rq=:vrq and lx=''客人'' and (mc=''a4'' or mc=''k16'' or mc=''b5'')');
    Parameters.ParamByName('vrq').Value:=DateTimePicker1.Date;
    Prepared;
    Open;
  end;
  F_xsrbb.QRfys.Caption:=IntToStr(dm.ADOTEMP.Fields[0].AsInteger);
  F_xsrbb.QRfyj.caption:=CurrToStr(dm.ADOTEMP.Fields[1].AsCurrency);
  ProgressBar1.Position:=10;

 //复印金额为5元的项目
  with dm.ADOTEMP do
  begin
    Close;
    sql.Clear;
    sql.add('select sum(shuliang),sum(je) from datereport');
    SQL.Add('where rq=:vtm and lx=''客人'' and (mc=''a3'' or mc=''k8'' or mc=''b4'')');
    Parameters.ParamByName('vtm').Value:=DateTimePicker1.Date;
    Prepared;
    Open;
  end;
  F_xsrbb.QRfyss.Caption:=IntToStr(dm.ADOTEMP.Fields[0].AsInteger);
  F_xsrbb.QRfysj.Caption:=CurrToStr(DM.ADOTEMP.Fields[1].AsCurrency);

  with dm.ADOCODE do
  begin
    Close;
    sql.Clear;
    sql.Add('select sum(je) from datereport');
    sql.Add('where lx=''客人'' and rq=:vrq');
    Parameters.ParamByName('vrq').Value:=DateTimePicker1.Date;
    Prepared;
    Open;
  end;
  F_xsrbb.qrbmhj.Caption:=CurrToStr(dm.ADOCODE.Fields[0].AsCurrency);
  ProgressBar1.Position:=15;
  //循环显示客人明细信息
  dm.qrydatereport.First;
  while not dm.qrydatereport.Eof do
  begin
       with F_xsrbb do
       begin
         with QuickRep1 do
         begin
          if (DM.qrydatereportmc.Value='chinsepage') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRdzs.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRdzj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='sendoutside') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRczgjs.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRcgjj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='sendprive') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRcsns.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRcsnj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='resivd') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRrws.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRswj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='sendinside') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRcgns.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRcgnj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='print1') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRdys.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRdyj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='sacn') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRsms.Caption:=IntToStr(dm.qrydatereportshuliang.AsInteger);
            QRsmj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='nationcal') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRgjhj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='hgcall') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRgatj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='chinacall') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRgnhj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='intenet') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRitj.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (DM.qrydatereportmc.Value='land') and (DM.qrydatereportlx.Value='客人') then
          begin
             QRLand.Caption:=CurrToStr(DM.qrydatereportje.Value);
          end;
          if (dm.qrydatereportmc.Value='neibuje') and (DM.qrydatereportlx.Value='客人') then
          begin
            QRneibu.Caption:=CurrToStr(dm.qrydatereportje.Value);
          end;
          dm.qrydatereport.Next;
         end;
       end;
  end;
  ProgressBar1.Position:=20;
  with dm.ADOQbm do
  begin
   Close;
   sql.Clear;
   sql.add('select * from datereport');
   sql.Add('where rq=:vrq and lx=''部门''');
   Parameters.ParamByName('vrq').Value:=DateTimePicker1.Date;
   Prepared;
   Open;
  end;

  ProgressBar1.Position:=25;
 //循环显示部门明细信息
 dm.ADOQbm.First;
 while not dm.ADOQbm.Eof do
 begin
   with F_xsrbb do
   begin
     with QuickRep1 do
     begin
       if dm.ADOQbmmc.Value='wpage' then
       begin
        QRdz.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
       end;
       if dm.ADOQbmmc.Value='A3' then
       begin
         if dm.ADOQbmshuliang.AsInteger <> 0 then
         begin
         QRa3.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
         end
         else
         QRA3.Caption:='0';
       end;
       if dm.ADOQbmmc.Value='A4' then
       begin
         if dm.ADOQbmshuliang.AsInteger <> 0 then
         begin
         QRA4.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
         end
         else
         QRA4.Caption:='0';
       end;
       if dm.ADOQbmmc.Value='SENDOUTSIDE' then
       begin
        QRGJCZ.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
       end;
       if dm.ADOQbmmc.Value='sendinside' then
       begin
        QRGNCZ.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
       end;
       if dm.ADOQbmmc.Value='sendprive' then
       begin
        QRSNCZ.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
       end;
       if dm.ADOQbmmc.Value='resivdpage' then
       begin
        QRSW.Caption:=IntToStr(dm.ADOQbmshuliang.AsInteger);
       end;
       if dm.ADOQbmmc.Value='chinacall' then
       begin
        QRGNCH.Caption:=CurrToStr(dm.ADOQbmje.AsCurrency);
       end;
       if dm.ADOQbmmc.Value='hgcall' then
       begin
        QRgat.Caption:=CurrToStr(dm.ADOQbmje.AsCurrency);
       end;
       if dm.ADOQbmmc.Value='nationcall' then
       begin
        QRGJCH.Caption:=CurrToStr(dm.ADOQbmje.AsCurrency);
       end;
       if dm.ADOQbmmc.Value='A42' then
       begin
         QRyouyi.Caption:=intToStr(dm.ADOQbmshuliang.AsInteger);
       end;
     end;
   end;
    dm.ADOQbm.Next;
 end;
 ProgressBar1.Position:=30;
//报表下部分的取值
 //---上期存数------------
 dm.spsqjc.Close;
 DM.spsqjc.Parameters.ParamByName('@sqtime').Value:=DateTimePicker1.Date;
 dm.spsqjc.Open;
 ProgressBar1.Position:=35;
 //----------本期结存数------------
 dm.spbqjc.Close;
 dm.spbqjc.Parameters.ParamByName('@xstime').Value:=DateTimePicker1.Date;
 DM.spbqjc.Open;
 ProgressBar1.Position:=40;
//----------本期领用-----------
 dm.spbqly.Close;
 dm.spbqly.Parameters.ParamByName('@time').Value:=DateTimePicker1.Date;
 DM.spbqly.Open;
 ProgressBar1.Position:=45;
 //-----------本期销售-------------
 dm.spxs.Close;
 dm.spxs.Parameters.ParamByName('@MCRQ').Value:=DateTimePicker1.Date;
 DM.spxs.Open;
 ProgressBar1.Position:=50;
 //---------------本期销售金额----------------
 dm.spbqje.Close;
 dm.spbqje.Parameters.ParamByName('@bqjerq').Value:=DateTimePicker1.Date;
 DM.spbqje.Open;
 ProgressBar1.Position:=55;
 //---------------库房领用合计-------------------
 dm.sphjjeyj.Close;
 dm.sphjjeyj.Parameters.ParamByName('@xcrq').Value:=DateTimePicker1.Date;
 dm.sphjjeyj.Open;
 ProgressBar1.Position:=52;

  with F_xsrbb do
  begin
    with QuickRep1 do
    begin
      //-----上期结存数 ----------
      if dm.spsqjcsqjcdt.Value <>0 then
      begin
        QRsqdt.Caption:=IntToStr(dm.spsqjcsqjcdt.Value);
      end
      else
        QRsqdt.Caption:='--------';
      if dm.spsqjcsqjcyp5.Value <>0 then
      begin
        QRsqyp5.Caption:=IntToStr(dm.spsqjcsqjcyp5.Value);
      end
      else
        QRsqyp5.Caption:='--------';
      if dm.spsqjcsqjcmxp.Value <>0 then
      begin
        QRsqypmxp.Caption:=IntToStr(DM.spsqjcsqjcmxp.Value);
      end
      else
        QRsqypmxp.Caption:='--------';
      ProgressBar1.Position:=60;
      //------本期结存数----------
      if dm.spbqjcbqdt.Value <> 0 then
      begin
       QRbqdtjc.Caption:=IntToStr(dm.spbqjcbqdt.Value);
      end
      else
       QRbqdtjc.Caption:='--------';
      if dm.spbqjcbqmxp.Value <> 0 then
      begin
        QRbqjcmxp.Caption:=IntToStr(dm.spbqjcbqmxp.Value);
      end
      else
       QRbqjcmxp.Caption:='--------';
      if dm.spbqjcbqyp5.Value <> 0 then
      begin
        QRbqjc5.Caption:=IntToStr(dm.spbqjcbqyp5.Value);
      end
      else
        QRbqjc5.Caption:='--------';
      ProgressBar1.Position:=65;
     //--本期领用------------
     if dm.spbqlybqjcdt.Value <> 0 then
     begin
      QRbqlydt.Caption:=IntToStr(dm.spbqlybqjcdt.Value);
     end
     else
      QRbqlydt.Caption:='--------';
     if dm.spbqlybqjcmxp.Value <> 0 then
     begin
       QRbqlymxp.Caption:=IntToStr(dm.spbqlybqjcmxp.Value);
     end
     else
      QRbqlymxp.Caption:='--------';
     if dm.spbqlybqjcyp5.Value <> 0 then
     begin
      QRbqlyyp5.Caption:=IntToStr(dm.spbqlybqjcyp5.Value);
     end
     else
     QRbqlyyp5.Caption:='--------';
     ProgressBar1.Position:=70;
     //----本期销售----------
     if dm.spxsbqxsdt.Value <> 0 then
     begin
       QRbqxsdt.Caption:=IntToStr(dm.spxsbqxsdt.Value);
     end
     else
       QRbqxsdt.Caption:='--------';
     if dm.spxsbqxsmxp.Value <> 0 then
     begin
       QRbqxsmxp.Caption:=IntToStr(dm.spxsbqxsmxp.Value);
     end
     else
     QRbqxsmxp.Caption:='--------';
     if dm.spxsbqxsyp5.Value <> 0 then
     begin
        QRbqxsyp5.Caption:=IntToStr(dm.spxsbqxsyp5.Value);
     end
     else
       QRbqxsyp5.Caption:='--------';
      ProgressBar1.Position:=75 ;
      //------------本期销售金额-------------
      if dm.spbqjebqjedt.Value <> 0 then
      begin
       QRjedt.Caption:=CurrToStr(dm.spbqjebqjedt.Value);
      end
      else
       QRjedt.Caption:='--------';
      if dm.spbqjebqjcmxp.Value <> 0 then
      begin
        QRjemxp.Caption:=CurrToStr(dm.spbqjebqjcmxp.Value);
      end
      else
        QRjemxp.Caption:='--------';
      if dm.spbqjebqjeyp5.Value <> 0 then
      begin
        QRjeyp5.Caption:=CurrToStr(dm.spbqjebqjeyp5.Value);
      end
      else
       QRjeyp5.Caption:='--------';
      ProgressBar1.Position:=80;

      //--------合计统计金额-------------
      if dm.sphjjeyjSQHJ.Value <> 0 then
      begin
        QRbqhj.Caption:=IntToStr(dm.sphjjeyjSQHJ.Value);
      end
      else
        QRbqhj.Caption:='--------';
      if dm.sphjjeyjBQHJ.Value <> 0 then
      begin
        qrlyhj.Caption:=IntToStr(dm.sphjjeyjBQHJ.Value);
      end
      else
       QRlyhj.Caption:='--------';
      if dm.sphjjeyjBQXS.Value <> 0 then
      begin
        QRschj.Caption:=IntToStr(DM.sphjjeyjBQXS.Value);
      end
      else
       QRschj.Caption:='--------';
      if dm.sphjjeyjbqjc.Value <> 0 then
      begin
        QRjchj.Caption:=IntToStr(dm.sphjjeyjbqjc.Value);
      end
      else
        QRjchj.Caption:='--------';
      if dm.sphjjeyjbqje.Value <> 0 then
      begin
        QRxshjje.Caption:=IntToStr(DM.sphjjeyjbqje.Value);
      end
      else
        QRxshjje.Caption:='--------';
      ProgressBar1.Position:=85;
    end;
  end;
   dm.ADOTEMP.Close;
   ProgressBar1.Position:=90;
   F_xsrbb.QRry.Caption:=DM.hname;
   ProgressBar1.Position:=100; 
end;

procedure TF_rbb.FormShow(Sender: TObject);
begin
 DateTimePicker1.Date := Date;
 Label2.Visible:=False;
 ProgressBar1.Visible:=False;
end;

procedure TF_rbb.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TF_rbb.BitBtn1Click(Sender: TObject);
begin
 Label2.Visible:=True;
 ProgressBar1.Visible:=True;
 F_xsrbb:=TF_xsrbb.Create(Self);
 rbbcsh;
 F_xsrbb.QuickRep1.Preview;
 FreeAndNil(F_xsrbb);
 
 Self.Close;
end;

end.

