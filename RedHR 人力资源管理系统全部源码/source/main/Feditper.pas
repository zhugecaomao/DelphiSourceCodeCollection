unit Feditper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxDBEdit, cxSpinEdit;

type
  Teditper = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    cxDBSpinEdit1: TcxDBSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editper: Teditper;

implementation

uses fmain,fperson;
{$R *.dfm}

procedure Teditper.Button1Click(Sender: TObject);
begin
  close
end;

procedure Teditper.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  person.r_person.Cancel;
end;

procedure Teditper.FormShow(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex:=0;
  self.DBEdit1.SetFocus;
end;

procedure Teditper.Button2Click(Sender: TObject);
begin
  if trim(self.DBEdit1.Text)='' then
    begin
      MessageBox(handle,'请输入人才需求规划的标题！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.DBEdit1.SetFocus;
      exit;
    end;
  if trim(self.cxDBLookupComboBox1.Text)='' then
    begin
      MessageBox(handle,'请选择所需要人才的部门！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBLookupComboBox1.SetFocus;
      exit;
    end;
  if trim(self.cxDBLookupComboBox2.Text)='' then
    begin
      MessageBox(handle,'请选择需求职位！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBLookupComboBox2.SetFocus;
      exit;
    end;
  if self.cxDBSpinEdit1.Value<0 then
    begin
      MessageBox(handle,'需求人数错误！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=1;
      self.cxDBSpinEdit1.SetFocus;
      exit;
    end;
  person.r_person.Post;
  person.r_person.Close;
  person.r_person.Open;
  self.Close;
end;

end.
