unit zhuangkuangUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, BusinessSkinForm,
  bsSkinCtrls;

type
  Tzhuangkuangfenxi = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    GroupBox5: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    GroupBox6: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Panel1: TPanel;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit35: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Edit83: TEdit;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    Edit89: TEdit;
    Edit36: TEdit;
    Label84: TLabel;
    Label85: TLabel;
    Edit29: TEdit;
    Edit34: TEdit;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Edit44: TEdit;
    Edit54: TEdit;
    Edit64: TEdit;
    Edit74: TEdit;
    Edit84: TEdit;
    Edit90: TEdit;
    Edit91: TEdit;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    BitBtn1: TbsSkinButton;
    BitBtn2: TbsSkinButton;
    BitBtn3: TbsSkinButton;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function  floatformat(var strnum:string):string;
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zhuangkuangfenxi: Tzhuangkuangfenxi;

implementation
uses dataunit,mainunit,zkreportunit;

{$R *.dfm}

procedure Tzhuangkuangfenxi.BitBtn1Click(Sender: TObject);
var
  best,good,pass,nopass:Double;  //总体情况
  zctz,ai,gao,qin,zhong:Double;   //身高标准体重统计
  best5,good5,pass5,nopass5,count5:Double;    //50米跑
  best8,good8,pass8,nopass8,count8:Double;     //800米跑
  best1,good1,pass1,nopass1,count1:Double;     //1000米跑
  bestw,goodw,passw,nopassw,countw:Double;     //握力
  bestf,goodf,passf,nopassf,countf:Double;      //肺活量
  bestl,goodl,passl,nopassl,countl:Double;      //立定跳远
  besty,goody,passy,nopassy,county:Double;      //仰卧起坐
  temps:string;
begin
best:=0;good:=0;pass:=0;nopass:=0;
zctz:=0;ai:=0;gao:=0;qin:=0;zhong:=0;
best5:=0;good5:=0;pass5:=0;nopass5:=0;count5:=0;
best8:=0;good8:=0;pass8:=0;nopass8:=0;count8:=0;
best1:=0;good1:=0;pass1:=0;nopass1:=0;count1:=0;
bestw:=0;goodw:=0;passw:=0;nopassw:=0;countw:=0;
bestf:=0;goodf:=0;passf:=0;nopassf:=0;countf:=0;
bestl:=0;goodl:=0;passl:=0;nopassl:=0;countl:=0;
besty:=0;goody:=0;passy:=0;nopassy:=0;county:=0;
//总体状况分析
with DataModule1 do
  begin
    edit1.Text:=inttostr(xueshengxinxi.RecordCount);
    edit2.Text:=IntToStr(stugread.RecordCount);
    if stugread.RecordCount<>0 then
      begin
        stugread.First;
        while stugread.Eof<>true do
          begin
            if stugread.FieldValues['等级评定']='优' then
               best:=best+1
            else if stugread.FieldValues['等级评定']='良' then
               good:=good+1
            else if stugread.FieldValues['等级评定']='及格' then
              pass:=pass+1
            else
              nopass:=nopass+1;
            if (stugread.FieldValues['身高']<>'无')and(strtoint(stugread.FieldValues['身高'])<140) then
              ai:=ai+1
            else if (stugread.FieldValues['身高']<>'无')and(strtoint(stugread.FieldValues['身高'])>190) then
              gao:=gao+1;
            if (stugread.FieldValues['体重']<>'无')and(strtofloat(stugread.FieldValues['体重'])<23.1) then
              qin:=qin+1
            else if (stugread.FieldValues['体重']<>'无')and(strtofloat(stugread.FieldValues['体重'])>89.9) then
              zhong:=zhong+1;
            stugread.Next;
          end;
        stugread.First;
        edit3.Text:=floatToStr(nopass);
        edit5.Text:=floatToStr(pass);
        edit7.Text:=floatToStr(good);
        edit9.Text:=floatToStr(best);
        edit14.Text:=floatToStr(ai);
        edit16.Text:=floatToStr(gao);
        edit29.Text:=IntToStr(StrToInt(edit5.Text)+StrToInt(edit7.Text)+StrToInt(edit9.Text));
        if StrTofloat(edit2.Text)<>0 then
          begin
            edit15.Text:=floatToStr(ai / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit15.Text;
            edit15.Text:=floatformat(temps);
            edit17.Text:=floatTostr(gao / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit17.Text;
            edit17.Text:=floatformat(temps);
            edit18.Text:=FloatTostr(qin / StrToFloat(edit2.Text)*100)+'%';
            temps:=edit18.Text;
            edit18.Text:=floatformat(temps);
            edit19.Text:=FloatTostr(zhong / StrToFloat(edit2.Text)*100)+'%';
            temps:=edit19.Text;
            edit19.Text:=floatformat(temps);
            edit4.Text:=floatToStr(nopass / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit4.Text;
            edit4.Text:=floatformat(temps);
            edit6.Text:=floatToStr(pass / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit6.Text;
            edit6.Text:=floatformat(temps);
            edit8.Text:=floatToStr(good / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit8.Text;
            edit8.Text:=floatformat(temps);
            edit10.Text:=floatToStr(best / StrTofloat(edit2.Text)*100)+'%';
            temps:=edit10.Text;
            edit10.Text:=floatformat(temps);
            edit34.Text:=FloatToStr(StrToFloat(edit29.Text) / StrToFloat(edit2.Text)*100)+'%';
            temps:=edit34.Text;
            edit34.Text:=floatformat(temps);
          end;
      end;
        edit11.Text:=IntToStr(stugreadinfo.RecordCount);   //身高标准体重统计
    if stugreadinfo.RecordCount<>0 then
      begin
        stugreadinfo.First;
        while stugreadinfo.Eof<>true do
          begin
            if stugreadinfo.FieldValues['身高体重成绩']='15' then
              zctz:=zctz+1;
            stugreadinfo.Next;
          end;
        stugreadinfo.First;
        edit12.Text:=floatTostr(zctz);
        edit13.Text:=floatTostr(zctz / StrTofloat(edit11.Text)*100)+'%' ;
        temps:=edit13.Text;
        edit13.Text:=floatformat(temps);
      end;
    if studengji.RecordCount<>0 then
      begin
        studengji.First;
        while studengji.Eof<>true do
          begin
                       //50米跑统计//
            if studengji.FieldValues['50米跑等级']='优' then
              begin
                best5:=best5+1;
                count5:=count5+1;
              end
            else if studengji.FieldValues['50米跑等级']='良' then
              begin
                good5:=good5+1;
                count5:=count5+1;
              end
            else if studengji.FieldValues['50米跑等级']='及格' then
              begin
                pass5:=pass5+1;
                count5:=count5+1;
              end
            else  if studengji.FieldValues['50米跑等级']='不及格' then
              begin
                nopass5:=nopass5+1;
                count5:=count5+1;
              end;
                 //800米跑统计 //

            if studengji.FieldValues['800米跑等级']='优' then
              begin
                best8:=best8+1;
                count8:=count8+1;
              end
            else if studengji.FieldValues['800米跑等级']='良' then
              begin
                good8:=good8+1;
                count8:=count8+1;
              end
            else if studengji.FieldValues['800米跑等级']='及格' then
              begin
                pass8:=pass8+1;
                count8:=count8+1;
              end
            else  if studengji.FieldValues['800米跑等级']='不及格' then
              begin
                nopass8:=nopass8+1;
                count8:=count8+1;
              end;
                //1000米跑统计//

            if studengji.FieldValues['1000米跑等级']='优' then
              begin
                best1:=best1+1;
                count1:=count1+1;
              end
            else if studengji.FieldValues['1000米跑等级']='良' then
              begin
                good1:=good1+1;
                count1:=count1+1;
              end
            else if studengji.FieldValues['1000米跑等级']='及格' then
              begin
                pass1:=pass1+1;
                count1:=count1+1;
              end
            else  if studengji.FieldValues['1000米跑等级']='不及格' then
              begin
                nopass1:=nopass1+1;
                count1:=count1+1;
              end;
              //握力体重指数//

            if studengji.FieldValues['握力体重指数等级']='优' then
              begin
                bestw:=bestw+1;
                countw:=countw+1;
              end
            else if studengji.FieldValues['握力体重指数等级']='良' then
              begin
                goodw:=goodw+1;
                countw:=countw+1;
              end
            else if studengji.FieldValues['握力体重指数等级']='及格' then
              begin
                passw:=passw+1;
                countw:=countw+1;
              end
            else  if studengji.FieldValues['握力体重指数等级']='不及格' then
              begin
                nopassw:=nopassw+1;
                countw:=countw+1;
              end;
              //肺活量体重指数统计//

            if studengji.FieldValues['肺活量体重指数等级']='优' then
              begin
                bestf:=bestf+1;
                countf:=countf+1;
              end
            else if studengji.FieldValues['肺活量体重指数等级']='良' then
              begin
                goodf:=goodf+1;
                countf:=countf+1;
              end
            else if studengji.FieldValues['肺活量体重指数等级']='及格' then
              begin
                passf:=passf+1;
                countf:=countf+1;
              end
            else  if studengji.FieldValues['肺活量体重指数等级']='不及格' then
              begin
                nopassf:=nopassf+1;
                countf:=countf+1;
              end;
              //立定跳远//

            if studengji.FieldValues['立定跳远等级']='优' then
              begin
                bestl:=bestl+1;
                countl:=countl+1;
              end
            else if studengji.FieldValues['立定跳远等级']='良' then
              begin
                goodl:=goodl+1;
                countl:=countl+1;
              end
            else if studengji.FieldValues['立定跳远等级']='及格' then
              begin
                passl:=passl+1;
                countl:=countl+1;
              end
            else  if studengji.FieldValues['立定跳远等级']='不及格' then
              begin
                nopassl:=nopassl+1;
                countl:=countl+1;
              end;
              //仰卧起坐//

            if studengji.FieldValues['仰卧起坐等级']='优' then
              begin
                besty:=besty+1;
                county:=county+1;
              end
            else if studengji.FieldValues['仰卧起坐等级']='良' then
              begin
                goody:=goody+1;
                county:=county+1;
              end
            else if studengji.FieldValues['仰卧起坐等级']='及格' then
              begin
                passy:=passy+1;
                county:=county+1;
              end
            else  if studengji.FieldValues['仰卧起坐等级']='不及格' then
              begin
                nopassy:=nopassy+1;
                county:=county+1;
              end;
            studengji.Next;
          end;
        studengji.First;
        edit20.Text:=floatToStr(count5);
        edit21.Text:=floatToStr(nopass5);
        edit23.Text:=floatToStr(pass5);
        edit25.Text:=floatToStr(good5);
        edit27.Text:=floatToStr(best5);
        if count5<>0 then
          begin
            edit22.Text:=floatToStr(nopass5 / count5 *100)+'%';
            temps:=edit22.Text;
            edit22.Text:=floatformat(temps);
            edit24.Text:=floatToStr(pass5 /count5 *100)+'%';
            temps:=edit24.Text;
            edit24.Text:=floatformat(temps);
            edit26.Text:=floatToStr(good5 / count5 *100)+'%';
            temps:=edit26.Text;
            edit26.Text:=floatformat(temps);
            edit28.Text:=floatToStr(best5 / count5 *100)+'%';
            temps:=edit28.Text;
            edit28.Text:=floatformat(temps);
            edit44.Text:=FloatToStr((count5-nopass5)/count5*100)+'%';
            temps:=edit44.Text;
            edit44.Text:=floatformat(temps);
          end;

        edit35.Text:=floattostr(count8);
        edit36.Text:=floatToStr(nopass8);
        edit38.Text:=floatToStr(pass8);
        edit30.Text:=floatToStr(good8);
        edit32.Text:=floatToStr(best8);
        if count8<>0 then
          begin
            edit37.Text:=floatToStr(nopass8 / count8 *100)+'%';
            temps:=edit37.Text;
            edit37.Text:=floatformat(temps);
            edit39.Text:=floatToStr(pass8 / count8 *100)+'%';
            temps:=edit39.Text;
            edit39.Text:=floatformat(temps);
            edit31.Text:=floatToStr(good8 / count8 *100)+'%';
            temps:=edit31.Text;
            edit31.Text:=floatformat(temps);
            edit33.Text:=floatToStr(best8 / count8 *100)+'%';
            temps:=edit33.Text;
            edit33.Text:=floatformat(temps);
            edit54.Text:=FloatToStr((count8-nopass8)/count8*100)+'%';
            temps:=edit54.Text;
            edit54.Text:=floatformat(temps);
          end;

        edit45.Text:=floatToStr(count1);
        edit46.Text:=floatToStr(nopass1);
        edit48.Text:=floatToStr(pass1);
        edit40.Text:=floatToStr(good1);
        edit42.Text:=floatToStr(best1);
        if count1<>0 then
          begin
            edit47.Text:=floatToStr(nopass1 / count1 *100)+'%';
            temps:=edit47.Text;
            edit47.Text:=floatformat(temps);
            edit49.Text:=floatToStr(pass1 / count1 *100)+'%';
            temps:=edit49.Text;
            edit49.Text:=floatformat(temps);
            edit41.Text:=floatToStr(good1 / count1 *100)+'%';
            temps:=edit41.Text;
            edit41.Text:=floatformat(temps);
            edit43.Text:=floatToStr(best1 / count1 *100)+'%';
            temps:=edit43.Text;
            edit43.Text:=floatformat(temps);
            edit64.Text:=FloatToStr((count1-nopass1)/count1*100)+'%';
            temps:=edit64.Text;
            edit64.Text:=floatformat(temps);
          end;

        edit55.Text:=floatToStr(countw);
        edit56.Text:=floatToStr(nopassw);
        edit58.Text:=floatToStr(passw);
        edit50.Text:=floatToStr(goodw);
        edit52.Text:=floatToStr(bestw);
        if countw<>0 then
          begin
            edit57.Text:=floatToStr(nopassw / countw *100)+'%';
            temps:=edit57.Text;
            edit57.Text:=floatformat(temps);
            edit59.Text:=floatToStr(passw / countw *100)+'%';
            temps:=edit59.Text;
            edit59.Text:=floatformat(temps);
            edit51.Text:=floatToStr(goodw / countw *100)+'%';
            temps:=edit51.Text;
            edit51.Text:=floatformat(temps);
            edit53.Text:=floatToStr(bestw / countw *100)+'%';
            temps:=edit53.Text;
            edit53.Text:=floatformat(temps);
            edit74.Text:=FloatToStr((countw-nopassw)/countw*100)+'%';
            temps:=edit74.Text;
            edit74.Text:=floatformat(temps);
          end;

        edit65.Text:=floatToStr(countf);
        edit66.Text:=floatToStr(nopassf);
        edit68.Text:=floatToStr(passf);
        edit60.Text:=floatToStr(goodf);
        edit62.Text:=floatToStr(bestf);
        if countf<>0 then
          begin
            edit67.Text:=floatToStr(nopassf / countf *100)+'%';
            temps:=edit67.Text;
            edit67.Text:=floatformat(temps);
            edit69.Text:=floatToStr(passf / countf *100)+'%';
            temps:=edit69.Text;
            edit69.Text:=floatformat(temps);
            edit61.Text:=floatToStr(goodf / countf *100)+'%';
            temps:=edit61.Text;
            edit61.Text:=floatformat(temps);
            edit63.Text:=floatToStr(bestf / countf *100)+'%';
            temps:=edit63.Text;
            edit63.Text:=floatformat(temps);
            edit84.Text:=FloatToStr((countf-nopassf)/countf*100)+'%';
            temps:=edit84.Text;
            edit84.Text:=floatformat(temps);
          end;

        edit75.Text:=floatToStr(countl);
        edit76.Text:=floatToStr(nopassl);
        edit78.Text:=floatToStr(passl);
        edit70.Text:=floatToStr(goodl);
        edit72.Text:=floatToStr(bestl);
        if countl<>0 then
          begin
            edit77.Text:=floatToStr(nopassl / countl *100)+'%';
            temps:=edit77.Text;
            edit77.Text:=floatformat(temps);
            edit79.Text:=floatToStr(passl / countl *100)+'%';
            temps:=edit79.Text;
            edit79.Text:=floatformat(temps);
            edit71.Text:=floatToStr(goodl / countl *100)+'%';
            temps:=edit71.Text;
            edit71.Text:=floatformat(temps);
            edit73.Text:=floatToStr(bestl / countl *100)+'%';
            temps:=edit73.Text;
            edit73.Text:=floatformat(temps);
            edit90.Text:=FloatToStr((countl-nopassl)/countl*100)+'%';
            temps:=edit90.Text;
            edit90.Text:=floatformat(temps);
          end;

        edit85.Text:=floatToStr(county);
        edit86.Text:=floatToStr(nopassy);
        edit88.Text:=floatToStr(passy);
        edit80.Text:=floatToStr(goody);
        edit82.Text:=floatToStr(besty);
        if county<>0 then
          begin
            edit87.Text:=floatToStr(nopassy / county *100)+'%';
            temps:=edit87.Text;
            edit87.Text:=floatformat(temps);
            edit89.Text:=floatToStr(passy / county *100)+'%';
            temps:=edit89.Text;
            edit89.Text:=floatformat(temps);
            edit81.Text:=floatToStr(goody / county *100)+'%';
            temps:=edit81.Text;
            edit81.Text:=floatformat(temps);
            edit83.Text:=floatToStr(besty / county *100)+'%';
            temps:=edit83.Text;
            edit83.Text:=floatformat(temps);
            edit91.Text:=FloatToStr((county-nopassy)/county*100)+'%';
            temps:=edit91.Text;
            edit91.Text:=floatformat(temps);
          end;

      end;
  end;
end;

procedure Tzhuangkuangfenxi.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure Tzhuangkuangfenxi.BitBtn2Click(Sender: TObject);
begin
with zkreport do
  begin
    QRLabel93.Caption:=edit1.Text;
    QRLabel94.Caption:=edit2.Text;
    QRLabel95.Caption:=edit3.Text;
    QRLabel96.Caption:=edit4.Text;
    QRLabel97.Caption:=edit5.Text;
    QRLabel98.Caption:=edit6.Text;
    QRLabel99.Caption:=edit7.Text;
    QRLabel100.Caption:=edit8.Text;
    QRLabel101.Caption:=edit9.Text;
    QRLabel102.Caption:=edit10.Text;

    QRLabel103.Caption:=edit11.Text;
    QRLabel104.Caption:=edit12.Text;
    QRLabel105.Caption:=edit13.Text;
    QRLabel106.Caption:=edit14.Text;
    QRLabel107.Caption:=edit15.Text;
    QRLabel108.Caption:=edit16.Text;
    QRLabel109.Caption:=edit17.Text;
    QRLabel110.Caption:=edit18.Text;
    QRLabel111.Caption:=edit19.Text;

    QRLabel112.Caption:=edit20.Text;
    QRLabel113.Caption:=edit21.Text;
    QRLabel114.Caption:=edit22.Text;
    QRLabel115.Caption:=edit23.Text;
    QRLabel116.Caption:=edit24.Text;
    QRLabel117.Caption:=edit25.Text;
    QRLabel118.Caption:=edit26.Text;
    QRLabel119.Caption:=edit27.Text;
    QRLabel120.Caption:=edit28.Text;
    
    QRLabel121.Caption:=edit33.Text;
    QRLabel122.Caption:=edit32.Text;
    QRLabel123.Caption:=edit31.Text;
    QRLabel124.Caption:=edit30.Text;
    QRLabel125.Caption:=edit39.Text;
    QRLabel126.Caption:=edit38.Text;
    QRLabel127.Caption:=edit37.Text;
    QRLabel128.Caption:=edit36.Text;
    QRLabel129.Caption:=edit35.Text;

    QRLabel130.Caption:=edit43.Text;
    QRLabel131.Caption:=edit42.Text;
    QRLabel132.Caption:=edit41.Text;
    QRLabel133.Caption:=edit40.Text;
    QRLabel134.Caption:=edit49.Text;
    QRLabel135.Caption:=edit48.Text;
    QRLabel136.Caption:=edit47.Text;
    QRLabel137.Caption:=edit46.Text;
    QRLabel138.Caption:=edit45.Text;

    QRLabel139.Caption:=edit55.Text;
    QRLabel140.Caption:=edit56.Text;
    QRLabel141.Caption:=edit57.Text;
    QRLabel142.Caption:=edit58.Text;
    QRLabel143.Caption:=edit59.Text;
    QRLabel144.Caption:=edit50.Text;
    QRLabel145.Caption:=edit51.Text;
    QRLabel146.Caption:=edit52.Text;
    QRLabel147.Caption:=edit53.Text;

    QRLabel148.Caption:=edit65.Text;
    QRLabel149.Caption:=edit66.Text;
    QRLabel150.Caption:=edit67.Text;
    QRLabel151.Caption:=edit68.Text;
    QRLabel152.Caption:=edit69.Text;
    QRLabel153.Caption:=edit60.Text;
    QRLabel154.Caption:=edit61.Text;
    QRLabel155.Caption:=edit62.Text;
    QRLabel156.Caption:=edit63.Text;
    
    QRLabel157.Caption:=edit75.Text;
    QRLabel158.Caption:=edit76.Text;
    QRLabel159.Caption:=edit77.Text;
    QRLabel160.Caption:=edit78.Text;
    QRLabel161.Caption:=edit79.Text;
    QRLabel162.Caption:=edit70.Text;
    QRLabel163.Caption:=edit71.Text;
    QRLabel164.Caption:=edit72.Text;
    QRLabel165.Caption:=edit73.Text;

    QRLabel166.Caption:=edit85.Text;
    QRLabel167.Caption:=edit86.Text;
    QRLabel168.Caption:=edit87.Text;
    QRLabel169.Caption:=edit88.Text;
    QRLabel170.Caption:=edit89.Text;
    QRLabel171.Caption:=edit80.Text;
    QRLabel172.Caption:=edit81.Text;
    QRLabel173.Caption:=edit82.Text;
    QRLabel174.Caption:=edit83.Text;

    QRLabel191.Caption:=edit29.Text;
    QRLabel192.Caption:=edit34.Text;
    QRLabel176.Caption:=edit44.Text;
    QRLabel178.Caption:=edit54.Text;
    QRLabel180.Caption:=edit64.Text;
    QRLabel181.Caption:=edit74.Text;
    QRLabel183.Caption:=edit84.Text;
    QRLabel185.Caption:=edit90.Text;
    QRLabel187.Caption:=edit91.Text;

  end;
zkreport.QuickRep1.Preview;
end;

procedure Tzhuangkuangfenxi.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
mainform.Show;
end;

function tzhuangkuangfenxi.floatformat(var strnum:string):string;
begin
  if pos('.',strnum)<>0 then
     begin
       delete(strnum,pos('.',strnum)+3,length(strnum)-pos('.',strnum)+3);
       floatformat:=strnum+'%';
     end
  else
    floatformat:=strnum;
end;

procedure Tzhuangkuangfenxi.FormCreate(Sender: TObject);
begin
mainform.dataref;
zhuangkuangfenxi.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-zhuangkuangfenxi.Width div 2;
zhuangkuangfenxi.Top:=GetSystemMetrics(SM_CYSCREEN) div 2-zhuangkuangfenxi.Height div 2;
end;

procedure tzhuangkuangfenxi.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(735,594);//  限定大小
      ptMaxTrackSize:=point(735,494); // 限定大小
    end;
end;

procedure Tzhuangkuangfenxi.FormShow(Sender: TObject);
begin
mainform.dataref;
end;

end.
