unit Unitaddpreson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls,
  ComCtrls, Buttons;

type
  TF_addpreson = class(TForm)
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dxCurrencyEdit3: TdxCurrencyEdit;
    dxCurrencyEdit4: TdxCurrencyEdit;
    dxCurrencyEdit5: TdxCurrencyEdit;
    dxCurrencyEdit6: TdxCurrencyEdit;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dxCurrencyEdit1: TdxCurrencyEdit;
    dxCurrencyEdit2: TdxCurrencyEdit;
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
    grp6: TGroupBox;
    lbl18: TLabel;
    lbl19: TLabel;
    dxCurrencyEdit18: TdxCurrencyEdit;
    dxCurrencyEdit19: TdxCurrencyEdit;
    grp5: TGroupBox;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    dxCurrencyEdit15: TdxCurrencyEdit;
    dxCurrencyEdit16: TdxCurrencyEdit;
    dxCurrencyEdit17: TdxCurrencyEdit;
    grp4: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    dxCurrencyEdit13: TdxCurrencyEdit;
    dxCurrencyEdit14: TdxCurrencyEdit;
    pnl2: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    lbl20: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    lbl21: TLabel;
    dxCurrencyEdit20: TdxCurrencyEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_addpreson: TF_addpreson;

implementation
uses UDM;

{$R *.dfm}

procedure TF_addpreson.btn1Click(Sender: TObject);
begin
   try
     DM.adocon1.BeginTrans;
      with dm.ADOTEMP do
      begin
        Close;
        sql.Clear;
        sql.Add('update tableforpeople set czy=''贺艳芳''');
        sql.Add('where czy=''贺''');
        ExecSQL;
      end;
      with dm.ADOTEMP do
      begin
        Close;
        sql.Clear;
        sql.Add('update tableforpeople set czy=''刘菁梅''');
        sql.Add('where czy=''刘''');
        ExecSQL;
      end;
      with dm.ADOTEMP do
      begin
        Close;
        sql.Clear;
        sql.Add('update tableforpeople set czy=''常春''');
        sql.Add('where czy=''常''');
        ExecSQL;
      end;
     DM.adocon1.CommitTrans;
     except
      dm.adocon1.RollbackTrans;
   end;
   dm.ADOTEMP.Close;
   Self.Close;
end;

procedure TF_addpreson.btn2Click(Sender: TObject);
var
  sj:string;
begin
  sj:=FormatDateTime('hh:mm:ss',Now);
  with dm.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     SQL.Add('insert into tableforpeople');
     SQL.Add('(chinsepage,englishpage,a4,k16,b5,a3,k8,b4,sendoutside,sendinside,sendprive,resivd,print1,sacn,nationcall,hgcall,chinacall,intenet,land,preson,neibuje,rq,lx,czy,xtsj)');
     SQL.Add('values(:chinsepage,:englishpage,:A4,:K16,:B5,:A3,:K8,:B4,:sendoutside,:sendinside,:sendprive,:resivd,:print1,:sacn,:nationcall,:hgcall,:chinacall,:intenet,:land,''客人'',:neibuje,:rq,''0'',:czy,:xtsj)');
     Parameters.ParamByName('chinsepage').Value:=dxCurrencyEdit1.Value;
     Parameters.ParamByName('englishpage').Value:=dxCurrencyEdit2.Value;
     Parameters.ParamByName('A4').Value:=dxCurrencyEdit7.Value;
     Parameters.ParamByName('K16').Value:=dxCurrencyEdit9.Value;
     Parameters.ParamByName('B5').Value:=dxCurrencyEdit8.Value;
     Parameters.ParamByName('A3').Value:=dxCurrencyEdit12.Value;
     Parameters.ParamByName('K8').Value:=dxCurrencyEdit11.Value;
     Parameters.ParamByName('B4').Value:=dxCurrencyEdit10.Value;
     Parameters.ParamByName('sendoutside').Value:=dxCurrencyEdit3.Value;
     Parameters.ParamByName('sendinside').Value:=dxCurrencyEdit4.Value;
     Parameters.ParamByName('sendprive').Value:=dxCurrencyEdit5.Value;
     Parameters.ParamByName('resivd').Value:=dxCurrencyEdit6.Value;
     Parameters.ParamByName('nationcall').Value:=dxCurrencyEdit16.Value;
     Parameters.ParamByName('print1').Value:=dxCurrencyEdit14.Value;
     Parameters.ParamByName('sacn').Value:=dxCurrencyEdit13.Value;
     Parameters.ParamByName('hgcall').Value:=dxCurrencyEdit17.Value;
     Parameters.ParamByName('chinacall').Value:=dxCurrencyEdit15.Value;
     Parameters.ParamByName('intenet').Value:=dxCurrencyEdit18.Value;
     Parameters.ParamByName('land').Value:=dxCurrencyEdit19.Value;
     Parameters.ParamByName('neibuje').Value:=dxCurrencyEdit20.Value;
     Parameters.ParamByName('rq').Value:=DateTimePicker1.Date;
     Parameters.ParamByName('czy').Value:=DM.hname;
     Parameters.ParamByName('xtsj').Value:=sj;
     try
       ExecSQL;
       dxCurrencyEdit1.Value:=0;
       dxCurrencyEdit2.Value:=0;
       dxCurrencyEdit7.Value:=0;
       dxCurrencyEdit9.Value:=0;
       dxCurrencyEdit8.Value:=0;
       dxCurrencyEdit12.Value:=0;
       dxCurrencyEdit11.Value:=0;
       dxCurrencyEdit10.Value:=0;
       dxCurrencyEdit3.Value:=0;
       dxCurrencyEdit4.Value:=0;
       dxCurrencyEdit5.Value:=0;
       dxCurrencyEdit6.Value:=0;
       dxCurrencyEdit16.Value:=0;
       dxCurrencyEdit14.Value:=0;
       dxCurrencyEdit13.Value:=0;
       dxCurrencyEdit17.Value:=0;
       dxCurrencyEdit15.Value:=0;
       dxCurrencyEdit18.Value:=0;
       dxCurrencyEdit19.Value:=0;
       dxCurrencyEdit20.Value:=0;
       except
      MessageBox(Handle,'插入数据失败!','系统提示',MB_ICONINFORMATION+MB_OK);
      Exit;
     end;
   end;
  DM.qrykr.Close;
  DM.qrykr.Open;
end;

procedure TF_addpreson.FormShow(Sender: TObject);
begin
   DateTimePicker1.Date:=Date;

   dxCurrencyEdit3.Enabled:=False;
   dxCurrencyEdit3.Color:=clScrollBar;

   dxCurrencyEdit2.Enabled:=False;
   dxCurrencyEdit2.Color:=clScrollBar;

   dxCurrencyEdit8.Enabled:=False;
   dxCurrencyEdit8.Color:=clScrollBar;

   dxCurrencyEdit10.Enabled:=False;
   dxCurrencyEdit10.Color:=clScrollBar;

   dxCurrencyEdit9.Enabled:=False;
   dxCurrencyEdit9.Color:=clScrollBar;

   dxCurrencyEdit13.Enabled:=False;
   dxCurrencyEdit13.Color:=clScrollBar;

   dxCurrencyEdit19.Enabled:=False;
   dxCurrencyEdit19.Color:=clScrollBar;

   dxCurrencyEdit16.Enabled:=False;
   dxCurrencyEdit16.Color:=clScrollBar;

   dxCurrencyEdit17.Enabled:=False;
   dxCurrencyEdit17.Color:=clScrollBar;
end;

procedure TF_addpreson.CheckBox1Click(Sender: TObject);
begin
   dxCurrencyEdit2.Enabled:=True;
   dxCurrencyEdit2.Color:=clWindow;
end;

procedure TF_addpreson.CheckBox2Click(Sender: TObject);
begin
   dxCurrencyEdit8.Enabled:=True;
   dxCurrencyEdit8.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox3Click(Sender: TObject);
begin
   dxCurrencyEdit10.Enabled:=True;
   dxCurrencyEdit10.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox4Click(Sender: TObject);
begin
   dxCurrencyEdit9.Enabled:=True;
   dxCurrencyEdit9.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox5Click(Sender: TObject);
begin
   dxCurrencyEdit13.Enabled:=True;
   dxCurrencyEdit13.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox6Click(Sender: TObject);
begin
   dxCurrencyEdit19.Enabled:=True;
   dxCurrencyEdit19.Color:=clWindow;  
end;

procedure TF_addpreson.CheckBox8Click(Sender: TObject);
begin
   dxCurrencyEdit16.Enabled:=True;
   dxCurrencyEdit16.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox7Click(Sender: TObject);
begin
   dxCurrencyEdit17.Enabled:=True;
   dxCurrencyEdit17.Color:=clWindow;   
end;

procedure TF_addpreson.CheckBox9Click(Sender: TObject);
begin
   dxCurrencyEdit3.Enabled:=True;
   dxCurrencyEdit3.Color:=clWindow;

end;

procedure TF_addpreson.CheckBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit2.Enabled:=False;
   dxCurrencyEdit2.Color:=clScrollBar; 
end;

procedure TF_addpreson.CheckBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit8.Enabled:=False;
   dxCurrencyEdit8.Color:=clScrollBar;  
end;

procedure TF_addpreson.CheckBox3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit10.Enabled:=False;
   dxCurrencyEdit10.Color:=clScrollBar;
end;

procedure TF_addpreson.CheckBox4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit9.Enabled:=False;
   dxCurrencyEdit9.Color:=clScrollBar;  
end;

procedure TF_addpreson.CheckBox5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit13.Enabled:=False;
   dxCurrencyEdit13.Color:=clScrollBar;   
end;

procedure TF_addpreson.CheckBox6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit19.Enabled:=False;
   dxCurrencyEdit19.Color:=clScrollBar;
end;

procedure TF_addpreson.CheckBox8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit16.Enabled:=False;
   dxCurrencyEdit16.Color:=clScrollBar; 
end;

procedure TF_addpreson.CheckBox7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit17.Enabled:=False;
   dxCurrencyEdit17.Color:=clScrollBar;   
end;

procedure TF_addpreson.CheckBox9MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxCurrencyEdit3.Enabled:=False;
   dxCurrencyEdit3.Color:=clScrollBar;
end;

procedure TF_addpreson.DateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=$0D  then
  dxCurrencyEdit1.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=$0D  then
dxCurrencyEdit7.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key=$0D  then
dxCurrencyEdit12.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit12KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=$0D  then
 dxCurrencyEdit11.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit11KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D  then
 dxCurrencyEdit14.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit14KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D  then
 dxCurrencyEdit18.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit18KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D  then
 dxCurrencyEdit15.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit15KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D  then
 dxCurrencyEdit4.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D  then
  dxCurrencyEdit5.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D  then
 dxCurrencyEdit6.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=$0D then
  dxCurrencyEdit20.SetFocus;
end;

procedure TF_addpreson.dxCurrencyEdit20KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key=13 then
   btn2Click(Sender);  
end;

end.
