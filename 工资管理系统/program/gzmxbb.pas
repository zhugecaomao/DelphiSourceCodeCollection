unit gzmxbb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mp, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB,
  RpDefine, RpBase, RpSystem;

type
  TForm85 = class(TForm41)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    CheckBox2: TCheckBox;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    DataSource1: TDataSource;
    aa: TRvSystem;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure aaPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form85: TForm85;
  year,Month,Day: Word;
implementation
  uses Dataa,gzglxt;
{$R *.dfm}

procedure TForm85.FormShow(Sender: TObject);
begin
  DataSource1.DataSet := Nil;
  CheckBox2.Checked := False;
  ComboBox2.Clear;
  DecodeDate(DateTimePicker1.DateTime,Year,Month,Day);
end;

procedure TForm85.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm85.ComboBox1Change(Sender: TObject);
begin
  if Trim(ComboBox1.Text)<>'' then
  begin
    with Data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Distinct');
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

procedure TForm85.SpeedButton1Click(Sender: TObject);
begin
  if CheckBox2.Checked = False then
  begin
    DecodeDate(DateTimePicker1.DateTime,Year,Month,Day);
    With Data3.ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from 工资发放明细表 where Year(时间)= :a and Month(时间) = :b');
      Parameters.ParamByName('a').Value := Year;
      Parameters.ParamByName('b').Value := Month;
      Open;
    end;
    if Data3.ADOQuery2.RecordCount>0 then
    begin
      DataSource1.DataSet := Data3.ADOQuery2;
      SpeedButton2.Enabled := True;
    end
    else
    begin
      DataSource1.DataSet := Nil;
      SpeedButton2.Enabled := False;
    end;
  end
  else
  begin
    if (Trim(ComboBox1.Text)<>'')and(Trim(ComboBox2.Text)<>'') then
    begin
      With Data3.ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from 工资发放明细表 where ');
        SQL.Add(Trim(ComboBox1.Text));
        SQL.Add('= :c');
        SQL.Add('and Year(时间)= :a and Month(时间) = :b');
        Parameters.ParamByName('a').Value := Year;
        Parameters.ParamByName('b').Value := Month;
        Parameters.ParamByName('c').Value := Trim(ComboBox2.Text);
        Open;
      end;
      if Data3.ADOQuery2.RecordCount>0 then
      begin
        DataSource1.DataSet := Data3.ADOQuery2;
        SpeedButton2.Enabled := True;
      end
      else
      begin
        DataSource1.DataSet := Nil;
        SpeedButton2.Enabled := False;
      end;
    end
    else
    begin
      SpeedButton2.Enabled := False;
      DataSource1.DataSet := Nil;
    end;
  end;
end;

procedure TForm85.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  aa.Execute;
end;

procedure TForm85.aaPrint(Sender: TObject);
var
  i: real;
begin
  inherited;
  with Sender as TBaseRePort do
  begin
    SetFont('宋体',16);
    TBaseRePort(Sender).Canvas.Font.Color := clRed;
    Bold := True;
    UnderLine := True;
    Ypos := 0.6;
    PrintCenter('工资条',PageHeight/2);
    SetFont('宋体',10);
    TBaseRePort(Sender).Canvas.Font.Color := clBlue;
    YPos := 0.9;
    PrintLeft('操作员:',0.4);
    PrintLeft(czymc,0.9);
    PrintLeft('时间:',PageHeight - 2);
    PrintLeft(FormatDateTime('yyyy-mm-dd',Now()),PageHeight - 1.4);
    Ypos := 1.2;
    Data3.ADOQuery2.First;
    While Not Data3.ADOQuery2.Eof do
    begin
      ClearTabs;
      SetFont('宋体',10);
      TBaseRePort(Sender).Canvas.Font.Color := clBlue;
      SetPen(clBlack,PsSolid,1,PmCopy);
      SetTab(0.4,pjCenter,0.9,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.5,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.8,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.8,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.5,0,BoxLineall,0);
      tab(-2,na,-2,-2,10);
      Print('员工编号');
      tab(na,na,-2,-2,10);
      Print('姓名');
      tab(na,na,-2,-2,10);
      Print('基本工资');
      tab(na,na,-2,-2,10);
      Print('职务工资');
      tab(na,na,-2,-2,10);
      Print('工龄工资');
      tab(na,na,-2,-2,10);
      Print('养老保险金');
      tab(na,na,-2,-2,10);
      Print('加班天数');
      tab(na,na,-2,-2,10);
      Print('加班工资');
      tab(na,na,-2,-2,10);
      Print('事假天数');
      tab(na,na,-2,-2,10);
      Print('事假扣款');
      tab(na,na,-2,-2,10);
      Print('个人所得税');
      tab(na,na,-2,-2,10);
      Print('住房补助');
      tab(na,na,-2,-2,10);
      Print('保险费');
      tab(na,na,-2,-2,10);
      Print('生活补助');
      tab(na,na,-2,-2,10);
      Print('应发金额');
      tab(na,na,-2,-2,10);
      Print('实发金额');
      tab(-2,-2,-2,-2,10);
      Print('余额');
      yPos := Ypos + 0.15;
      SetTab(0.4,pjCenter,0.9,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.5,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.8,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.8,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.6,0,BoxLineall,0);
      SetTab(Na,pjCenter,0.5,0,BoxLineall,0);
      Tab(-2,na,0,Na,0);
      print(Data3.ADOQuery2.Fields[0].Value);
      tab(na,na,0,na,0);
      print(Data3.ADOQuery2.Fields[1].Value);
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[2].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[3].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[4].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[5].Value));
      tab(na,na,0,na,0);
      print(IntToStr(Data3.ADOQuery2.Fields[6].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[7].Value));
      tab(na,na,0,na,0);
      print(IntToStr(Data3.ADOQuery2.Fields[8].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[9].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[10].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[11].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[12].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[13].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[14].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[15].Value));
      tab(na,na,0,na,0);
      print(FloatToStr(Data3.ADOQuery2.Fields[16].Value));
      Println('');
      SetPen(clBlack,psDot ,1,pmBlack	);
      i := 0.1;
      Setfont('宋体',10);
      while i<= PageHeight-1 do
      begin
        PrintLeft('.',0.3 +i);
        i := i +0.1;
      end;
      Ypos := ypos +0.3;
      Data3.ADOQuery2.Next;
    end;
  end;
end;

end.
