unit Fptools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, cxDBEdit, cxMaskEdit, cxSpinEdit;

type
  Tptools = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    Label3: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    DBMemo1: TDBMemo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ptools: Tptools;

implementation

uses Fpworks;

{$R *.dfm}

procedure Tptools.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  pworks.p_tools.Cancel;
end;

procedure Tptools.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tptools.Button2Click(Sender: TObject);
begin
  if trim(self.dbEdit1.Text)='' then
    begin
      MessageBox(handle,'工作用品名称是必须的！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.dbEdit1.SetFocus;
      exit;
    end;
  pworks.p_tools.Post;
  pworks.p_tools.Close;
  pworks.p_tools.Open;
  self.Close;
end;

end.
