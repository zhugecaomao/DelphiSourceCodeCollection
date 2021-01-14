unit Unittimetoserch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, dxCntner, dxEditor,
  dxExEdtr, dxEdLib;

type
  TF_changepereson = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dxCurrencyEdit1: TdxCurrencyEdit;
    dxCurrencyEdit2: TdxCurrencyEdit;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dxCurrencyEdit3: TdxCurrencyEdit;
    dxCurrencyEdit4: TdxCurrencyEdit;
    dxCurrencyEdit5: TdxCurrencyEdit;
    dxCurrencyEdit6: TdxCurrencyEdit;
    grp3: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    dxCurrencyEdit7: TdxCurrencyEdit;
    dxCurrencyEdit8: TdxCurrencyEdit;
    dxCurrencyEdit9: TdxCurrencyEdit;
    dxCurrencyEdit10: TdxCurrencyEdit;
    dxCurrencyEdit11: TdxCurrencyEdit;
    dxCurrencyEdit12: TdxCurrencyEdit;
    grp4: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    dxCurrencyEdit13: TdxCurrencyEdit;
    dxCurrencyEdit14: TdxCurrencyEdit;
    grp5: TGroupBox;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    dxCurrencyEdit15: TdxCurrencyEdit;
    dxCurrencyEdit16: TdxCurrencyEdit;
    dxCurrencyEdit17: TdxCurrencyEdit;
    grp6: TGroupBox;
    lbl18: TLabel;
    lbl19: TLabel;
    dxCurrencyEdit18: TdxCurrencyEdit;
    dxCurrencyEdit19: TdxCurrencyEdit;
    GroupBox1: TGroupBox;
    dtp1: TDateTimePicker;
    lbl20: TLabel;
    dxCurrencyEdit20: TdxCurrencyEdit;
    Label1: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_changepereson: TF_changepereson;

implementation
uses UDM,Unitsummoneyreport;

{$R *.dfm}

procedure TF_changepereson.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_changepereson.btn1Click(Sender: TObject);
begin
   with DM.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     SQL.Add('update tableforpeople');
     SQL.Add('set chinsepage=:chinsepage,englishpage=:englishpage,');
     SQL.Add('A4=:A4,K16=:K16,B5=:B5,A3=:A3,K8=:K8,B4=:B4,');
     SQL.Add('sendoutside=:sendoutside,sendinside=:sendinside,');
     SQL.Add('sendprive=:sendprive,resivd=:resivd,print1=:print1,');
     SQL.Add('sacn=:sacn,nationcall=:nationcall,hgcall=:hgcall,');
     SQL.Add('chinacall=:chinacall,intenet=:intenet,land=:land,neibuje=:neibu');
     SQL.Add('WHERE ID=:ID');
     Parameters.ParamByName('chinsepage').Value:=dxCurrencyEdit1.Value;
     Parameters.ParamByName('englishpage').Value:=dxCurrencyEdit2.Value;
     Parameters.ParamByName('A4').Value:=dxCurrencyEdit7.Value;
     Parameters.ParamByName('B5').Value:=dxCurrencyEdit8.Value;
     Parameters.ParamByName('K16').Value:=dxCurrencyEdit9.Value;
     Parameters.ParamByName('B4').Value:=dxCurrencyEdit10.Value;
     Parameters.ParamByName('K8').Value:=dxCurrencyEdit11.Value;
     Parameters.ParamByName('A3').Value:=dxCurrencyEdit12.Value;
     Parameters.ParamByName('sendoutside').Value:=dxCurrencyEdit3.Value;
     Parameters.ParamByName('sendinside').Value:=dxCurrencyEdit4.Value;
     Parameters.ParamByName('sendprive').Value:=dxCurrencyEdit5.Value;
     Parameters.ParamByName('resivd').Value:=dxCurrencyEdit6.Value;
     Parameters.ParamByName('print1').Value:=dxCurrencyEdit14.Value;
     Parameters.ParamByName('sacn').Value:=dxCurrencyEdit13.Value;
     Parameters.ParamByName('nationcall').Value:=dxCurrencyEdit16.Value;
     Parameters.ParamByName('hgcall').Value:=dxCurrencyEdit17.Value;
     Parameters.ParamByName('chinacall').Value:=dxCurrencyEdit15.Value;
     Parameters.ParamByName('intenet').Value:=dxCurrencyEdit18.Value;
     Parameters.ParamByName('land').Value:=dxCurrencyEdit19.Value;
     Parameters.ParamByName('neibu').Value:=dxCurrencyEdit20.Value;
     Parameters.ParamByName('id').Value:=dm.prs;
     try
       ExecSQL;
       except
       MessageBox(Handle,'修改数据失败!','系统提示',MB_ICONINFORMATION+MB_OK);
       Exit;
     end;
   end;
   dm.qrykr.Close;
   dm.qrykr.Open;
   Self.Close;
end;

procedure TF_changepereson.FormShow(Sender: TObject);
begin
 dtp1.Date:=date;
end;

end.



