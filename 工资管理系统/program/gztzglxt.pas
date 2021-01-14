unit gztzglxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mp, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TForm84 = class(TForm41)
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure Clear;
    procedure BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    Procedure FindNext;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    Procedure EditValue;
    Function EditIsNull: Boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form84: TForm84;

implementation
  uses Dataa;
{$R *.dfm}

procedure TForm84.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TBitBtn(Sender).Font.Color := clRed;
end;

procedure TForm84.BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TBitBtn(Sender).Font.Color := clBlue;
end;

procedure TForm84.Clear;
begin
  ComboBox1.Text := '';
  ComboBox2.Clear;
  DataSource1.DataSet := Nil;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  BitBtn1.Enabled := False;
end;

procedure TForm84.FormShow(Sender: TObject);
begin
  Clear;
end;

procedure TForm84.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Clear;
end;

procedure TForm84.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TForm84.ComboBox1Change(Sender: TObject);
begin
  if Trim(ComboBox1.Text)<>'' then
  begin
    with Data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Distinct ');
      SQL.Add(Trim(ComboBox1.Text));
      SQL.Add('From 工资发放');
      Open;
    end;
    if Data3.ADOQuery1.RecordCount>0 then
    begin
      ComboBox2.Clear;
      While Not Data3.ADOQuery1.Eof do
      begin
        ComboBox2.Items.Add(Data3.ADOQuery1.Fields[0].Value);
        Data3.ADOQuery1.Next;
      end;
    end;
  end;
end;

procedure TForm84.SpeedButton1Click(Sender: TObject);
begin
  if (Trim(ComboBox1.Text)<>'')and(Trim(ComboBox2.Text)<>'')then
  begin
    with Data3.ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from 工资发放 where');
      SQL.Add(Trim(ComboBox1.Text));
      SQL.Add('= :a');
      Parameters.ParamByName('a').Value := Trim(ComboBox2.Text);
      Open;
    end;
    if Data3.ADOQuery2.RecordCount >0 then
    begin
      DataSource1.DataSet := Data3.ADOQuery2;
      EditValue;
      BitBtn1.Enabled := True;
    end
    else
    begin
      DataSource1.DataSet := Nil;
      BitBtn1.Enabled := False;
      Application.MessageBox('该员工信息不全或不存在。','提示',64);
    end;
  end;
end;
procedure TForm84.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  m: Boolean;
begin
  m := (Key <#8)or(Key>#8)and(Key<#46)or(Key>#46)and(Key<#48)or(Key>#57);
  if m then
    Key := #0;
end;

procedure TForm84.Edit1Exit(Sender: TObject);
begin
  if Trim(TEdit(Sender).Text)<>'' then
    Try
      StrToFloat(TEdit(Sender).Text);
    Except
      Application.MessageBox('请输入合法字符。','提示',64);
      TEdit(Sender).Clear;
    end; 
end;

procedure TForm84.BitBtn1Click(Sender: TObject);
begin
  if Application.MessageBox(Pchar('确实要修改员工编号为'+ Trim(Data3.ADOQuery2.FieldByName('员工编号').Value)+ '的员工数据吗？'),'提示',MB_YesNo)= ID_Yes then
  begin
    if EditIsNull = False then
    begin
      Try
        Data3.ADOConnection1.BeginTrans;
        with Data3.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update 工资发放 set 基本工资 = :a,职务工资 = :b,工龄工资 = :c,养老保险金 = :d where 员工编号 = :e');
          Parameters.ParamByName('a').Value := StrToFloat(Edit1.Text);
          parameters.ParamByName('b').Value := StrToFloat(Edit2.Text);
          parameters.ParamByName('c').Value := StrToFloat(Edit3.Text);
          parameters.ParamByName('d').Value := StrToFloat(Edit4.Text);
          Parameters.ParamByName('e').Value := Trim(Data3.ADOQuery2.FieldByName('员工编号').Value);
          ExecSQL;
        end;
        with Data3.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update 工资发放 set 住房补助 = :a,生活补助 = :b,保险费 = :c,个人所得税 = :d where 员工编号 = :e');
          Parameters.ParamByName('a').Value := StrToFloat(Edit6.Text);
          parameters.ParamByName('b').Value := StrToFloat(Edit7.Text);
          parameters.ParamByName('c').Value := StrToFloat(Edit8.Text);
          parameters.ParamByName('d').Value := StrToFloat(Edit5.Text);
          Parameters.ParamByName('e').Value := Trim(Data3.ADOQuery2.FieldByName('员工编号').Value);
          ExecSQL;
        end;
        Data3.ADOConnection1.CommitTrans;
        Application.MessageBox('修改成功.','提示',64);
        Clear;
      Except
        Data3.ADOConnection1.RollbackTrans;
        Application.MessageBox('系统出错.','提示',64);
      End;
    end;
  end;
end;

procedure TForm84.FindNext;
begin
  if FindNextControl(Activecontrol,True,False,False)is TEdit then
    TEdit(FindNextControl(Activecontrol,True,False,False)).SetFocus;
end;

procedure TForm84.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ReTurn then
    FindNext;
end;

procedure TForm84.EditValue;
begin
  Edit1.Text := FloatToStr(Data3.ADOQuery2.FieldByName('基本工资').Value);
  Edit2.Text := FloatToStr(Data3.ADOQuery2.FieldByName('职务工资').Value);
  Edit3.Text := FloatToStr(Data3.ADOQuery2.FieldByName('工龄工资').Value);
  Edit4.Text := FloatToStr(Data3.ADOQuery2.FieldByName('养老保险金').Value);
  Edit5.Text := FloatToStr(Data3.ADOQuery2.FieldByName('个人所得税').Value);
  Edit6.Text := FloatToStr(Data3.ADOQuery2.FieldByName('住房补助').Value);
  Edit7.Text := FloatToStr(Data3.ADOQuery2.FieldByName('生活补助').Value);
  Edit8.Text := FloatToStr(Data3.ADOQuery2.FieldByName('保险费').Value);
end;

procedure TForm84.DBGrid1CellClick(Column: TColumn);
begin
  if Data3.ADOQuery2.Active =True then
    if Data3.ADOQuery2.RecordCount>0 then
      EditValue;  
end;

function TForm84.EditIsNull: Boolean;
var
  i: Integer;
begin
  EditIsNull := False ;
  For i := 0 to Panel2.ControlCount-1 do
  begin
    if Panel2.Controls[i]is TEdit then
      If Trim(TEdit(Panel2.Controls[i]).Text)='' then
      begin
        EditIsNull := True;
        Break;
      end;
  end;
end;

end.
