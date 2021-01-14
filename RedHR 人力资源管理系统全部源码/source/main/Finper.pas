unit Finper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Mask, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit;

type
  Tinper = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit2: TDBEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBEdit5: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBComboBox6: TDBComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  inper: Tinper;

implementation
uses fmain,fperson;
{$R *.dfm}

procedure Tinper.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  person.r_person.Cancel;
end;

procedure Tinper.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tinper.FormShow(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex:=0;
  self.DBEdit1.SetFocus;
end;

procedure Tinper.Button2Click(Sender: TObject);
begin
  if trim(self.DBEdit1.Text)='' then
    begin
      MessageBox(handle,'姓名项是必须填写的！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.DBEdit1.SetFocus;
      exit;    
    end;
  if trim(self.DBEdit2.Text)='' then
    begin
      MessageBox(handle,'身份证是必须填写的！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.DBEdit2.SetFocus;
      exit;    
    end;
  if trim(self.DBComboBox1.Text)='' then
    begin
      MessageBox(handle,'请选择登记人员性别，这是必须的！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.DBComboBox1.SetFocus;
      exit;    
    end;
  person.p_inperson.Post;
  person.p_inperson.Close;
  person.p_inperson.Open;
  self.Close;
end;

procedure Tinper.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',DecimalSeparator,#8]) then
  begin
    key:=#0;     // 强制输入的字符类型
    beep;
  end;
end;

end.
