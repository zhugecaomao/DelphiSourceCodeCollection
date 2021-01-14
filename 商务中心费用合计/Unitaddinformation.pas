unit Unitaddinformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, DBCtrls, DB;

type
  TF_addinformation = class(TForm)
    ds1: TDataSource;
    grp1: TGroupBox;
    lbl4: TLabel;
    dxDBCurrencyEdit15: TdxDBCurrencyEdit;
    GroupBox3: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dxDBCurrencyEdit12: TdxDBCurrencyEdit;
    dxDBCurrencyEdit13: TdxDBCurrencyEdit;
    dxDBCurrencyEdit14: TdxDBCurrencyEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dxDBCurrencyEdit3: TdxDBCurrencyEdit;
    dxDBCurrencyEdit4: TdxDBCurrencyEdit;
    dxDBCurrencyEdit5: TdxDBCurrencyEdit;
    dxDBCurrencyEdit6: TdxDBCurrencyEdit;
    dxDBCurrencyEdit7: TdxDBCurrencyEdit;
    dxDBCurrencyEdit8: TdxDBCurrencyEdit;
    Panel2: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dxDBCurrencyEdit9: TdxDBCurrencyEdit;
    dxDBCurrencyEdit10: TdxDBCurrencyEdit;
    dxDBCurrencyEdit11: TdxDBCurrencyEdit;
    GroupBox4: TGroupBox;
    dxDBCurrencyEdit18: TdxDBCurrencyEdit;
    lbl10: TLabel;
    dxDBCurrencyEdit17: TdxDBCurrencyEdit;
    lbl9: TLabel;
    dxDBCurrencyEdit16: TdxDBCurrencyEdit;
    lbl8: TLabel;
    GroupBox5: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    dxDBCurrencyEdit1: TdxDBCurrencyEdit;
    dxDBCurrencyEdit2: TdxDBCurrencyEdit;
    GroupBox6: TGroupBox;
    dbcbb1: TDBComboBox;
    dxDBDateEdit1: TdxDBDateEdit;
    lbl5: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxDBDateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBCurrencyEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure checked;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_addinformation: TF_addinformation;

implementation
uses UDM;

{$R *.dfm}
procedure TF_addinformation.checked;
begin
   if CheckBox1.Checked then
   begin
    dxDBCurrencyEdit1.Enabled:=True;
    dxDBCurrencyEdit1.Color:=clWindow;
   end;

   if CheckBox8.Checked then
   begin
   dxDBCurrencyEdit3.Enabled:=True;
   dxDBCurrencyEdit3.Color:=clWindow;
   end;

   if CheckBox3.Checked then
   begin
   dxDBCurrencyEdit4.Enabled:=True;
   dxDBCurrencyEdit4.Color:=clWindow;
   end;


   if CheckBox4.Checked then
   begin
   dxDBCurrencyEdit6.Enabled:=True;
   dxDBCurrencyEdit6.Color:=clWindow;
   end;


   if CheckBox2.Checked then
   begin
   dxDBCurrencyEdit10.Enabled:=True;
   dxDBCurrencyEdit10.Color:=clWindow;
   end;


   if CheckBox5.Checked then
   begin
   dxDBCurrencyEdit12.Enabled:=True;
   dxDBCurrencyEdit12.Color:=clWindow;
   end;


  if CheckBox6.Checked then
   begin
   dxDBCurrencyEdit16.Enabled:=True;
   dxDBCurrencyEdit16.Color:=clWindow;
   end;

   if CheckBox7.Checked then
   begin
   dxDBCurrencyEdit18.Color:=clWindow;
   dxDBCurrencyEdit18.Enabled:=True;
   end;

end;
procedure TF_addinformation.btn2Click(Sender: TObject);
begin
   DM.ADOq1.CancelUpdates;
   Close;
end;

procedure TF_addinformation.FormShow(Sender: TObject);

begin
  DM.ADOq1.Open;
  DM.qrykr.Open;

  dxDBCurrencyEdit12.Enabled:=False;
  dxDBCurrencyEdit12.Color:=clScrollBar;

  dxDBCurrencyEdit3.Enabled:=False;
  dxDBCurrencyEdit3.Color:=clScrollBar;

  dxDBCurrencyEdit1.Enabled:=False;
  dxDBCurrencyEdit1.Color:=clScrollBar;

  dxDBCurrencyEdit4.Enabled:=False;
  dxDBCurrencyEdit4.Color:=clScrollBar;

  dxDBCurrencyEdit6.Enabled:=False;
  dxDBCurrencyEdit6.Color:=clScrollBar;

  dxDBCurrencyEdit10.Enabled:=False;
  dxDBCurrencyEdit10.Color:=clScrollBar;

  dxDBCurrencyEdit16.Enabled:=False;
  dxDBCurrencyEdit16.Color:=clScrollBar;

  dxDBCurrencyEdit18.Enabled:=False;
  dxDBCurrencyEdit18.Color:=clScrollBar;

  dxDBDateEdit1.Date:=Date;


  with dm.qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from bumen_table');
    Prepared;
    Open;
  end;
  while not dm.qry1.Eof do
  begin
    dbcbb1.Items.Append(dm.qry1.FieldValues['bumen']);
    dm.qry1.Next;
  end;
end;

procedure TF_addinformation.btn1Click(Sender: TObject);
var
  sj:string;
begin
  sj:=FormatDateTime('hh:mm:ss',Now);
 if (dxDBDateEdit1.Date=null) and (dbcbb1.Text='') then
 begin
   MessageBox(Handle,'录入时间不能为空，部门不能为空!','',MB_ICONINFORMATION+MB_OK);
   Exit;
 end
 else
 dm.ADOq1.Edit;
 dm.ADOq1.FieldByName('lx').AsString:='0';
 dm.ADOq1.FieldByName('hjje').AsInteger:=0;
 dm.ADOq1.FieldByName('czy').AsString:=dm.hname;
 dm.ADOq1.FieldByName('xtsj').AsString:=sj;
 dm.ADOq1.Post;
 close;
end;

procedure TF_addinformation.CheckBox1Click(Sender: TObject);
begin
  checked;
end;

procedure TF_addinformation.CheckBox8Click(Sender: TObject);
begin
  checked;
end;

procedure TF_addinformation.CheckBox3Click(Sender: TObject);
begin
checked;
end;

procedure TF_addinformation.CheckBox4Click(Sender: TObject);
begin
checked;
end;

procedure TF_addinformation.CheckBox2Click(Sender: TObject);
begin
checked;
end;

procedure TF_addinformation.CheckBox5Click(Sender: TObject);
begin
 checked;
end;

procedure TF_addinformation.CheckBox6Click(Sender: TObject);
begin
checked;
end;

procedure TF_addinformation.CheckBox7Click(Sender: TObject);
begin
 checked;
end;

procedure TF_addinformation.CheckBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 dxDBCurrencyEdit1.Enabled:=False;
 dxDBCurrencyEdit1.Color:=clScrollBar;
end;

procedure TF_addinformation.CheckBox8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 dxDBCurrencyEdit3.Enabled:=False;
 dxDBCurrencyEdit3.Color:=clScrollBar;

end;

procedure TF_addinformation.CheckBox3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dxDBCurrencyEdit4.Enabled:=False;
 dxDBCurrencyEdit4.Color:=clScrollBar;

end;

procedure TF_addinformation.CheckBox4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dxDBCurrencyEdit6.Enabled:=False;
  dxDBCurrencyEdit6.Color:=clScrollBar; 
end;

procedure TF_addinformation.CheckBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxDBCurrencyEdit10.Enabled:=False;
 dxDBCurrencyEdit10.Color:=clScrollBar;

end;

procedure TF_addinformation.CheckBox5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxDBCurrencyEdit12.Enabled:=False;
   dxDBCurrencyEdit12.Color:=clScrollBar;

end;

procedure TF_addinformation.CheckBox6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dxDBCurrencyEdit16.Enabled:=False;
   dxDBCurrencyEdit16.Color:=clScrollBar;
end;

procedure TF_addinformation.CheckBox7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 dxDBCurrencyEdit18.Enabled:=False;
 dxDBCurrencyEdit18.Color:=clScrollBar;

end;

procedure TF_addinformation.dxDBDateEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key=$0D then
  dbcbb1.SetFocus;
end;

procedure TF_addinformation.dbcbb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=$0D then
dxDBCurrencyEdit2.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D then
   dxDBCurrencyEdit5.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D then
   dxDBCurrencyEdit8.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit8KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D then
 dxDBCurrencyEdit7.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D then
 dxDBCurrencyEdit9.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit9KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if Key=$0D then
  dxDBCurrencyEdit11.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit11KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if Key=$0D then
   dxDBCurrencyEdit13.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit13KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D then
   dxDBCurrencyEdit14.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit17KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=$0D then
 dxDBCurrencyEdit15.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit14KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=$0D then
 dxDBCurrencyEdit17.SetFocus;
end;

procedure TF_addinformation.dxDBCurrencyEdit15KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key=13 then
   btn1Click(Sender);
end;

end.





