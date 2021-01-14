unit Fpayedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxCurrencyEdit,
  cxCheckBox, cxCalendar, cxMemo, DBCtrls, ExtCtrls;

type
  Tpayedit = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBMemo1: TcxDBMemo;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    cxDBImageComboBox2: TcxDBImageComboBox;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxDBCurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;//1.新建 2。增加
  end;

var
  payedit: Tpayedit;

implementation

uses fmain;
{$R *.dfm}

procedure Tpayedit.Button1Click(Sender: TObject);
begin
  main.r_staffpay.Cancel;
  close
end;

procedure Tpayedit.Button2Click(Sender: TObject);
begin
  if self.cxDBTextEdit1.Text='' then
    begin
      MessageBox(handle,'请输入类别名称！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBTextEdit1.SetFocus;
      exit;
    end;
  if self.cxDBImageComboBox1.ItemIndex=-1 then
    begin
      MessageBox(handle,'请选择类别类型，它将用于计算所选职工的薪资！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBImageComboBox1.SetFocus;
      exit;
    end;
  if self.cxDBCurrencyEdit1.Text='' then
    begin
      MessageBox(handle,'金额是必须的，它将用于计算所选职工的薪资！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBCurrencyEdit1.SetFocus;
      exit;
    end;
  if self.cxDBImageComboBox2.ItemIndex=-1 then
    begin
      MessageBox(handle,'请选择计算方式，它将用于计算所选职工的薪资！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBImageComboBox2.SetFocus;
      exit;
    end;
  if (self.cxDBDateEdit1.Text='') or (self.cxDBDateEdit2.Text='') then
    begin
      self.PageControl1.ActivePageIndex:=0;
      MessageBox(handle,'请选择起止日期！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  if self.cxDBDateEdit1.Date>self.cxDBDateEdit2.Date then
    begin
      self.PageControl1.ActivePageIndex:=0;
      MessageBox(handle,'结束日期必须大于起始日期！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  main.r_staffpay.Post;
  close;
end;

procedure Tpayedit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  main.r_staffpay.Cancel;
end;

procedure Tpayedit.FormShow(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex:=0;
  self.cxDBTextEdit1.SetFocus;
end;

procedure Tpayedit.cxDBCurrencyEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9', '.', DecimalSeparator,#8]) then
  begin
    key:=#0;     // 强制输入的字符类型
    beep;
  end;
end;

end.
