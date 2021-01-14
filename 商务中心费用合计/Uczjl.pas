unit Uczjl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls,
  DB, ExtCtrls, dxEdLib, dxEditor,Uchangemx;

type
  TFczjl = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    Ed1: TdxCurrencyEdit;
    Ed2: TdxCurrencyEdit;
    dxEdmx: TdxEdit;
    dxEdlx: TdxEdit;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Ed1Exit(Sender: TObject);
    procedure Ed1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   { Private declarations }
  public
    { Public declarations }
  end;

var
  Fczjl: TFczjl;

implementation
uses UDM;
{$R *.dfm}

procedure TFczjl.btn2Click(Sender: TObject);
begin
  close;
end;

procedure TFczjl.FormShow(Sender: TObject);
begin
  dxEdmx.Enabled:=False;
  dxEdmx.Color:=clScrollBar;

  dxEdlx.Enabled:=False;
  dxEdlx.Color:=clScrollBar;

end;

procedure TFczjl.btn1Click(Sender: TObject);
begin
  dm.adocon1.BeginTrans;
  try
     with dm.ADOTEMP do
     begin
       Close;
       SQL.Clear;
       sql.Add('update datereport');
       SQL.Add('set shuliang=:vnum,je=:vje');
       sql.Add('where mc=:vmc and lx=:vlx and rq=:vrq');
       Parameters.ParamByName('vnum').Value:=Ed1.Value;
       Parameters.ParamByName('vje').Value:=Ed2.Value;
       Parameters.ParamByName('vmc').Value:=dm.qrydatereportmc.Value;
       Parameters.ParamByName('vlx').Value:=dxEdlx.Text;
       Parameters.ParamByName('vrq').Value:=dm.qrydatereportrq.Value;
       Prepared;
       ExecSQL;
     end;
     with dm.ADOCODE do
     begin
       Close;
       sql.Clear;
       sql.Add('insert into czjl');
       sql.Add('(czydm,czyxm,xgmc,rq,xgsl,xgje,bumen,bz)');
       sql.Add('values(:vdm,:vxm,:vmc,:vrq,:vsl,:vje,:vbm,:bz)');
       Parameters.ParamByName('vdm').Value:=dm.hma;
       Parameters.ParamByName('vxm').Value:=dm.hname;
       Parameters.ParamByName('vmc').Value:=dxEdmx.Text;
       Parameters.ParamByName('vrq').Value:=Date+time;
       Parameters.ParamByName('vsl').Value:=Ed1.Value;
       Parameters.ParamByName('vje').Value:=Ed2.Value;
       Parameters.ParamByName('vbm').Value:=dxEdlx.Text;
       Parameters.ParamByName('bz').Value:='修改';
       Prepared;
       ExecSQL;
     end;
     dm.adocon1.CommitTrans;
     ShowMessage('数据修改成功！');
   except
     dm.adocon1.RollbackTrans;
  end;
  dm.qrydatereport.Close;
  dm.qrydatereport.Open;

  DM.ADOTEMP.Close;
  DM.ADOCODE.Close;
  Self.Close;
end;

procedure TFczjl.Ed1Exit(Sender: TObject);
var
  mc:string;
begin
   with dm.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select mc,shuliang,lx,namemx,rq  from datereport');
     sql.Add('where  namemx=:vmx and rq=:vrq and lx=:vlx');
     Parameters.ParamByName('vmx').Value:=dxEdmx.Text;
     Parameters.ParamByName('vrq').Value:=Fchangemx.dtp1.Date;
     Parameters.ParamByName('vlx').Value:=Fchangemx.cbbry.Text;
     Prepared;
     Open;
   end;
   mc:=dm.ADOTEMP.Fields[0].AsString;

   with dm.ADOCODE do
   begin
    Close;
    sql.Clear;
    sql.Add('select dj from danjia');
    sql.Add('where mc=:vmc and lx=:vlx');
    Parameters.ParamByName('vmc').Value:=mc;
    Parameters.ParamByName('vlx').Value:=Fchangemx.cbbry.Text;
    Prepared;
    Open;
   end;
   Ed2.Value:=Ed1.Value*(dm.ADOCODE.Fields[0].AsCurrency);

  dm.ADOTEMP.Close;
  dm.ADOCODE.Close;
end;

procedure TFczjl.Ed1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=$0D  then
 Ed2.SetFocus;
end;

procedure TFczjl.Ed2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
 TFczjl.btn1Click(Sender);
end;

end.
