unit tjyusc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    DataSource1: TDataSource;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Const
  a = 2;
var
  Form4: TForm4;

implementation
  uses  Dataa;
{$R *.dfm}

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  ComboBox1.ItemIndex:= 0;
end;

procedure TForm4.BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  TBitBtn(Sender).Font.Color := clRed;
  Screen.Cursor := a;
end;

procedure TForm4.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  BitBtn1.Font.Color := clBlue;
  BitBtn2.Font.Color := clBlue;
  BitBtn3.Font.Color := clBlue;
  BitBtn4.Font.Color := clBlue;
  BitBtn5.Font.Color := clBlue;
  Screen.Cursor := -2;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor := -2;
end;

procedure TForm4.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Screen.Cursor := -2;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
  s,m: String;
  i: integer;
begin
  s:= 'CY'+ FormatDateTime('yyyymmdd',Now());
  With data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(操作员编号) as ss From 操作员信息表 ');
    Open;
  end;
  If data3.ADOQuery1.FieldByName('ss').Value = null then
    s := s + '001'
  else
  begin
    m:= Trim(data3.ADOQuery1.FieldByName('ss').Value) ;
    i:= StrToInt(Trim(Copy(m,11,5))) ;
    if i<9 then
      s:= s + '00'+ InttoStr(i +1)
    else if i<99 then
      s:= s + '0'+ InttoStr(i +1)
    else
      s:= s +InttoStr(i +1);
  end;
  Edit1.Text := s;
  Edit2.Clear;
  Edit3.Clear ;
  Edit2.SetFocus;

end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    Edit2.SetFocus;
end;

procedure TForm4.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    Edit3.SetFocus;
  if key = vk_up then
    Edit1.SetFocus;
end;

procedure TForm4.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    ComboBox1.SetFocus;
  if Key = vk_up then
    Edit2.SetFocus;
end;

procedure TForm4.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return)and(BitBtn5.Enabled = True) then
    BitBtn5.SetFocus;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
  with data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 操作员信息表 where 操作员编号= :a');
    Parameters.ParamByName('a').Value  := Trim(Edit1.Text);
    Open;
  end;
  If data3.ADOQuery1.RecordCount >0 then
  begin
    Application.MessageBox('操作员已经存在，请重新输入。','提示',0+64);
    BitBtn4.OnClick(Sender);
    Exit;
  end;
  Try
  with data3.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Insert  操作员信息表 Values(:a , :b , :c , :d ,Default)');
    Parameters.ParamByName('a').Value := Trim(Edit1.Text);
    Parameters.ParamByName('b').Value := Trim(Edit2.Text);
    Parameters.ParamByName('c').Value := Trim(Edit3.Text);
    if Trim(ComboBox1.Text) ='系统管理员' then
      Parameters.ParamByName('d').Value := '1'
    else
      Parameters.ParamByName('d').Value := '2';
    ExecSQL;
  end;
    Application.MessageBox(Pchar('添加成功，操作员密码为“'+ Trim(Edit3.Text)+'”'),'提示',0+64);
    BitBtn4.OnClick(Sender);
  Except
  begin
    Application.MessageBox('系统出错。','提示',0+64);
    Close;
  end;
  end;
  with data3.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 操作员信息表' );
    Open;
  end;
end;

procedure TForm4.Edit2Change(Sender: TObject);
begin
  if (Trim(Edit1.Text)<>'')and(Trim(Edit2.Text)<>'')and(Trim(Edit3.Text)<>'')
    and(Trim(ComboBox1.Text )<>'')then
    begin
      BitBtn2.Enabled := True;
      BitBtn5.Enabled := True;
    end
  else
    begin
    BitBtn5.Enabled := False;
    BitBtn2.Enabled := False;
  end;
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
  if data3.ADOQuery2.RecordCount>0 then
  begin
    Edit1.Text := data3.ADOQuery2.FieldByName('操作员编号').AsString;
    Edit2.Text := data3.ADOQuery2.FieldByName('操作员姓名').AsString;
    Edit3.Text := data3.ADOQuery2.FieldByName('操作员密码').AsString;
    ComboBox1.Text := data3.ADOQuery2.FieldByName('操作员级别').AsString;
  end;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  with data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 操作员信息表 where 操作员编号= :a');
    Parameters.ParamByName('a').Value  := Trim(Edit1.Text);
    Open;
  end;
  If data3.ADOQuery1.RecordCount <1 then
  begin
    Application.MessageBox('操作员不存在，请在列表中选择操作员。','提示',0+64);
    BitBtn4.OnClick(Sender);
    Exit;
  end
  Else
  begin
    Try
    with data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete  操作员信息表 where 操作员编号 = :a');
      Parameters.ParamByName('a').Value := Trim(Edit1.Text);
      if Application.MessageBox(pchar('确实要删除编号为'+ Edit1.Text + '的操作员吗?'),'提示',MB_YESNO )= ID_Yes then
      begin
        ExecSQL;
        Application.MessageBox('删除成功。','提示',0+64);
        BitBtn4.OnClick(Sender);
      end
      else
      begin
        Close;
        SQL.Clear;
        BitBtn4.OnClick(Sender);
      end;
    end;
    Except
    begin
      Application.MessageBox('系统出错。','提示',0+64);
      Self.Close;
    end;
    end;
  end;
  with data3.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 操作员信息表');
    Open;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  with data3.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 操作员编号,操作员姓名,操作员密码,操作员级别 = Case 操作员级别 when 1 then ''系统管理员'' when 2 then ''普通管理员'' end from 操作员信息表');
    Open;
  end;
  if Data3.ADOQuery2.RecordCount>0 then
    DataSource1.DataSet := Data3.ADOQuery2
  else
    DataSource1.DataSet := Nil;
  Combobox1.ItemIndex := 0 ;
  Screen.Cursors[a]:= LoadCursorFromFile('C:\My Documents\Cur1.cur');
  BitBtn1.SetFocus;
end;
   
procedure TForm4.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
