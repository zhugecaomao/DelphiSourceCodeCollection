unit xtdl3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TFormb = class(TForm)
    Edit2: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formb: TFormb;
  i: integer = 0;
  m: Boolean = False;//防止用户关闭登录窗口进入系统

implementation
  uses gzglxt, Dataa;
{$R *.dfm}

procedure TFormb.Edit1Change(Sender: TObject);
begin
  if (Trim(Edit1.Text)<>'')and( Trim(edit2.Text)<>'') then
    BitBtn1.Enabled := True
  else
    BitBtn1.Enabled := False;

end;

procedure TFormb.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Return) or(Key = vk_Down) then
    Edit2.SetFocus;

end;

procedure TFormb.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = vk_Return) or(Key = vk_Down))and (BitBtn1.Enabled = True) then
    BitBtn1.SetFocus
  else
    Edit2.SetFocus;
  if Key = vk_Up then
    Edit1.SetFocus;

end;

procedure TFormb.BitBtn1Click(Sender: TObject);
begin
  with Data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 操作员信息表 where (操作员姓名= :a)and(操作员密码= :b)');
    Parameters.ParamByName('a').Value := Trim(Edit1.Text);
    Parameters.ParamByName('b').Value := Trim(Edit2.Text);
    Open;
  end;
  if Data3.ADOQuery1.RecordCount >0 then
  begin
    czymc := Data3.ADOQuery1.FieldByName('操作员姓名').AsString;
    m:= True;
    Form1.StatusBar1.Panels[3].Text := czymc;
    Edit1.Clear;
    Edit2.Clear;
    Close;
  end
  else
  begin
    if i <3 then
    begin
      Application.MessageBox('用户名称或密码不正确，请重新输入。','提示',0+64);
      Edit1.Clear;
      Edit2.Clear;
      Edit1.SetFocus;
      Inc(i);
    end
    else
    begin
      Application.MessageBox('对不起，您无权使用本系统。','提示',0+64);
      Application.Terminate ;
    end;
  end;
end;

procedure TFormb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if m = False then
    Application.Terminate ;
end;

end.
