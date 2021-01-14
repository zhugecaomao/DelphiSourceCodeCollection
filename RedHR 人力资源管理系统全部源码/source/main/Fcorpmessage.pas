unit Fcorpmessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, ADODB, Mask, DBCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxCurrencyEdit, ExtCtrls;

type
  Tcorpmessage = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    ADOTable1: TADOTable;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label4: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  corpmessage: Tcorpmessage;

implementation

uses fmain;
{$R *.dfm}

procedure Tcorpmessage.FormShow(Sender: TObject);
begin
  self.ADOTable1.Open;
  corpmessage.ADOTable1.Edit;
  self.PageControl1.ActivePageIndex:=0;
  self.DBEdit1.SetFocus;
end;

procedure Tcorpmessage.FormDestroy(Sender: TObject);
begin
  self.ADOTable1.Close;
end;

procedure Tcorpmessage.Button2Click(Sender: TObject);
begin
  self.ADOTable1.Cancel;
  close;
end;

procedure Tcorpmessage.Button1Click(Sender: TObject);
begin
  if trim(self.dbEdit1.Text)='' then
    begin
      MessageBox(handle,'请输入公司名称！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.dbEdit1.SetFocus;
      exit;
    end;
  self.ADOTable1.Post;
  close;
end;

end.
