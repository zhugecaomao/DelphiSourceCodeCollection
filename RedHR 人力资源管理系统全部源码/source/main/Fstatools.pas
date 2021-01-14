unit Fstatools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxDBEdit, cxCalendar, DBCtrls, ExtCtrls;

type
  Tstatools = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Button1: TButton;
    Button2: TButton;
    DBMemo1: TDBMemo;
    Image1: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  statools: Tstatools;

implementation

uses fmain;
{$R *.dfm}

procedure Tstatools.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  main.p_w_tools.Cancel;
end;

procedure Tstatools.Button1Click(Sender: TObject);
begin
  self.close;
end;

procedure Tstatools.Button2Click(Sender: TObject);
begin
  if trim(self.cxDBLookupComboBox1.Text)='' then
    begin
      MessageBox(handle,'请选择工作用品！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.cxDBLookupComboBox1.SetFocus;
      exit;
    end;
  main.p_w_tools.Post;
  self.Close;
end;

end.
