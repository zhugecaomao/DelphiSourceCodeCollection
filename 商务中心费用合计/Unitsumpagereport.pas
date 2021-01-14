unit Unitsumpagereport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls, StdCtrls, Buttons,
  dxDBELib, DBCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, ComCtrls;

type
  TF_changeinformation = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dxDBCurrencyEdit9: TdxDBCurrencyEdit;
    dxDBCurrencyEdit10: TdxDBCurrencyEdit;
    dxDBCurrencyEdit11: TdxDBCurrencyEdit;
    grp2: TGroupBox;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl22: TLabel;
    dxDBCurrencyEdit3: TdxDBCurrencyEdit;
    dxDBCurrencyEdit4: TdxDBCurrencyEdit;
    dxDBCurrencyEdit5: TdxDBCurrencyEdit;
    dxDBCurrencyEdit6: TdxDBCurrencyEdit;
    dxDBCurrencyEdit7: TdxDBCurrencyEdit;
    dxDBCurrencyEdit8: TdxDBCurrencyEdit;
    grp3: TGroupBox;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    dxDBCurrencyEdit12: TdxDBCurrencyEdit;
    dxDBCurrencyEdit13: TdxDBCurrencyEdit;
    dxDBCurrencyEdit14: TdxDBCurrencyEdit;
    dxDBCurrencyEdit15: TdxDBCurrencyEdit;
    lbl35: TLabel;
    ds1: TDataSource;
    GroupBox1: TGroupBox;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    dxDBCurrencyEdit16: TdxDBCurrencyEdit;
    dxDBCurrencyEdit17: TdxDBCurrencyEdit;
    dxDBCurrencyEdit18: TdxDBCurrencyEdit;
    GroupBox2: TGroupBox;
    dxDBCurrencyEdit2: TdxDBCurrencyEdit;
    lbl7: TLabel;
    dxDBCurrencyEdit1: TdxDBCurrencyEdit;
    lbl6: TLabel;
    GroupBox3: TGroupBox;
    dbcbb1: TDBComboBox;
    lbl5: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    intr:Integer;
    { Public declarations }
  end;

var
  F_changeinformation: TF_changeinformation;

implementation
USES UDM;

{$R *.dfm}

procedure TF_changeinformation.btn2Click(Sender: TObject);
begin
    Close;
end;

procedure TF_changeinformation.btn1Click(Sender: TObject);
begin
  if dm.ADOq1.RecordCount>=0 then
  begin
    dm.ADOq1.Edit;
     dm.ADOq1.fieldbyname('npage').Value:=dxDBCurrencyEdit1.Value;
     DM.ADOq1.fieldbyname('wpage').Value:=dxDBCurrencyEdit2.Value;
     DM.ADOq1.fieldbyname('department').AsString:=dbcbb1.Text;
     DM.ADOq1.fieldbyname('B5').Value:=dxDBCurrencyEdit3.Value;
     DM.ADOq1.fieldbyname('K16').Value:=dxDBCurrencyEdit4.Value;
     DM.ADOq1.fieldbyname('A4').Value:=dxDBCurrencyEdit5.Value;
     DM.ADOq1.fieldbyname('B4').Value:=dxDBCurrencyEdit6.Value;
     DM.ADOq1.fieldbyname('K8').Value:=dxDBCurrencyEdit7.Value;
     DM.ADOq1.fieldbyname('A3').Value:=dxDBCurrencyEdit8.Value;
     DM.ADOq1.fieldbyname('A42').Value:=dxDBCurrencyEdit9.Value;
     DM.ADOq1.fieldbyname('K82').Value:=dxDBCurrencyEdit10.Value;
     DM.ADOq1.fieldbyname('LABAN').Value:=dxDBCurrencyEdit11.Value;
     DM.ADOq1.fieldbyname('SENDOUTSIDE').Value:=dxDBCurrencyEdit12.Value;
     DM.ADOq1.fieldbyname('SENDINSIDE').Value:=dxDBCurrencyEdit13.Value;
     DM.ADOq1.fieldbyname('sendprive').Value:=dxDBCurrencyEdit14.Value;
     DM.ADOq1.fieldbyname('resivdpage').Value:=dxDBCurrencyEdit15.Value;
     DM.ADOq1.fieldbyname('nationcall').Value:=dxDBCurrencyEdit16.Value;
     DM.ADOq1.fieldbyname('chinacall').Value:=dxDBCurrencyEdit17.Value;
     DM.ADOq1.fieldbyname('hgcall').Value:=dxDBCurrencyEdit18.Value;
     dm.ADOq1.Post;
  end
  else
  showmessage('没有可修该的信息，请退出系统!');
  close;

end;

procedure TF_changeinformation.FormShow(Sender: TObject);
begin
   with DM.qry1 DO
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from bumen_table');
     Prepared;
     Open;
   end;
   dbcbb1.Items.Clear;
   while not dm.qry1.Eof do
   begin
     dbcbb1.Items.Append(dm.qry1.Fields[1].AsString);
     dm.qry1.Next;
   end;

end;

end.
