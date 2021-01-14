unit rytj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
  uses Dataa;
{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  s,m: String;
  i: integer;
begin
  s:= 'Y'+ FormatDateTime('yyyymmdd',Now());
  With Data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(员工编号) as ss From 员工基础信息表 ');
    Open;
  end;
  If Data3.ADOQuery1.FieldByName('ss').Value = null then
    s := s + '001'
  else
  begin
    m:= Trim(Data3.ADOQuery1.FieldByName('ss').Value) ;
    i:= StrToInt(Trim(Copy(m,10,8))) ;
    if i<9 then
      s:= s + '00'+ InttoStr(i +1)
    else if i<99 then
      s:= s + '0'+ InttoStr(i +1)
    else
      s:= s +InttoStr(i +1);
  end;
  Edit2.Text := s;
  Edit1.SetFocus;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Edit2.Clear;
  Edit1.Clear;
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  if (Trim(Edit2.Text)<>'')and(Trim(Edit1.Text)<>'')and(Trim(ComboBox1.Text)<>'')
    and (Trim(ComboBox2.Text)<>'') then
  begin
    Try
    with Data3.ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('insert 员工基础信息表 values(:a,:b,:c,:d)');
      Parameters.ParamByName('a').Value := Trim(Edit2.Text);
      Parameters.ParamByName('b').Value := Trim(Edit1.Text);
      Parameters.ParamByName('c').Value := Trim(ComboBox1.Text);
      Parameters.ParamByName('d').Value := Trim(ComboBox2.Text);
      ExecSQL;
    end;
    Application.MessageBox('添加成功。','提示',64);
    BitBtn3.OnClick(Sender);
    Except
      Application.MessageBox('系统出错。','提示',64);
      Close;
    end;
  end;
end;

procedure TForm2.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TBitBtn(Sender).Font.Color := clRed;
end;

procedure TForm2.BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TBitBtn(Sender).Font.Color := clBlue;
end;

procedure TForm2.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
