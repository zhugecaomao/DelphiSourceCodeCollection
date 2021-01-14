unit Upersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB;

type
  TFpersonal = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    stat1: TStatusBar;
    grp1: TGroupBox;
    grp2: TGroupBox;
    grp3: TGroupBox;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    r2: TdxDBGrid;
    personid2: TdxDBGridColumn;
    personid3: TdxDBGridColumn;
    personid4: TdxDBGridColumn;
    personid5: TdxDBGridColumn;
    personid6: TdxDBGridColumn;
    personid7: TdxDBGridColumn;
    personid8: TdxDBGridColumn;
    personid9: TdxDBGridColumn;
    personid10: TdxDBGridColumn;
    personid11: TdxDBGridColumn;
    personid16: TdxDBGridColumn;
    personid17: TdxDBGridColumn;
    personidr2Column13: TdxDBGridColumn;
    personidr2Column14: TdxDBGridColumn;
    personidr2Column15: TdxDBGridColumn;
    personidr2Column16: TdxDBGridColumn;
    personidr2Column17: TdxDBGridColumn;
    personidr2Column18: TdxDBGridColumn;
    personidr2Column20: TdxDBGridColumn;
    personidr2Column21: TdxDBGridColumn;
    r3: TdxDBGrid;
    personidr3Column1: TdxDBGridColumn;
    personidr3Column2: TdxDBGridColumn;
    personidr3Column3: TdxDBGridColumn;
    personidr3Column4: TdxDBGridColumn;
    personidr3Column5: TdxDBGridColumn;
    personidr3Column6: TdxDBGridColumn;
    personidr3Column7: TdxDBGridColumn;
    personidr3Column8: TdxDBGridColumn;
    personidr3Column10: TdxDBGridColumn;
    personidr3Column12: TdxDBGridColumn;
    personidr3Column11: TdxDBGridColumn;
    personidr3Column13: TdxDBGridColumn;
    personidr3Column14: TdxDBGridColumn;
    personidr3Column15: TdxDBGridColumn;
    personidr3Column16: TdxDBGridColumn;
    personidr3Column17: TdxDBGridColumn;
    personidr3Column18: TdxDBGridColumn;
    personidr3Column19: TdxDBGridColumn;
    personidr3Column20: TdxDBGridColumn;
    personidr3Column21: TdxDBGridColumn;
    dsbmyj: TDataSource;
    dsforpepole: TDataSource;
    r3Column21: TdxDBGridColumn;
    r2Column21: TdxDBGridColumn;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    r3Column22: TdxDBGridColumn;
    CByl: TCheckBox;
    r3Column23: TdxDBGridColumn;
    r2Column22: TdxDBGridColumn;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpersonal: TFpersonal;

implementation
uses UDM;
{$R *.dfm}

procedure TFpersonal.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFpersonal.btn1Click(Sender: TObject);
begin
  grp2.TabOrder:=0;
 if chk1.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy like :vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;

 if chk2.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy like :vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if chk3.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy like :vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if CByl.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy like :vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) or(chk3.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy or czy=:vxm)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy or czy like :vxm) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) or(chk3.Checked)or (CByl.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy or czy=:vxm or czy=:vyl)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vyl').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy or czy=:vxm or czy=:vyl) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vyl').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;

 grp2.TabOrder:=0;
 if chk1.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy=:vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;

 if chk2.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy=:vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if chk3.Checked then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy=:vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if CByl.Checked then
 begin
      with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where czy=:vczy and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where czy=:vczy and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=cbyl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) or(chk3.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy or czy=:vxm)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy or czy like :vxm) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;
 if (chk1.Checked) or (chk2.Checked) or(chk3.Checked) or (CByl.Checked) then
 begin
   with dm.qrybmyj do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from center');
     sql.Add('where (czy=:vczy or czy=:czy or czy=:vxm or czy=:vxm1)and t_time between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vxm1').Value:=CByl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
   with dm.qryforpepole do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from tableforpeople');
     sql.Add('where (czy=:vczy or czy=:czy or czy like :vxm or czy like :vxm1) and rq between :vkrq and :vjrq');
     Parameters.ParamByName('vczy').Value:=chk1.Caption;
     Parameters.ParamByName('czy').Value:=chk2.Caption;
     Parameters.ParamByName('vxm').Value:=chk3.Caption;
     Parameters.ParamByName('vxm1').Value:=cbyl.Caption;
     Parameters.ParamByName('vkrq').Value:=dtp2.Date;
     Parameters.ParamByName('vjrq').Value:=dtp1.Date;
     Prepared;
     Open;
   end;
 end;

end;

procedure TFpersonal.FormShow(Sender: TObject);
begin
  dtp1.Date:=Date;
  dtp2.Date:=Date;
end;

end.
