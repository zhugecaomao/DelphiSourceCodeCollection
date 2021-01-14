unit U_print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DBGrids, ComCtrls, ExtCtrls, Buttons,ADODB, DB,
  Excel97;

type
  TfrmPrint = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    edtTitle: TLabeledEdit;
    Panel1: TPanel;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    edtPname: TLabeledEdit;
    edtDate: TLabeledEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
//  varexcel:variant;//变体变量
//  range:variant;
//  procedure ExportDataToExecel(dbgrid: TDBGrid;qytmp:TDataSource;sTitle:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrint: TfrmPrint;
implementation
   uses main,u_public,comobj;//,excel97;
{procedure TfrmPrint.ExportDataToExecel(dbgrid: TDBGrid;qytmp:TDataSource;sTitle:string);
var
//Excel,WrkBook,WrkSheet:olevariant;

i,j,k:integer;
xxxl:string;
xr:string;
begin
 frmMain.StatusBar1.panels[0].text:='正在载入Execel,请销候！......';
 frmMain.StatusBar1.refresh;
 try
 screen.Cursor :=crHourGlass;
    try
    //创建Excel对象
      varexcel:=CreateOleObject('Excel.Application');
    except
    end;
 finally
 screen.Cursor :=crarrow;
 end;
end;   }

{$R *.dfm}

procedure TfrmPrint.btnCancelClick(Sender: TObject);
begin
CurrentParam.bprint :=false;
close;
end;

procedure TfrmPrint.FormCreate(Sender: TObject);
begin
edtpname.Text :=CurrentParam.UserName ;
EDTTITLE.Text :=CurrentParam.PrintTitle ;
//edtdate.Text :=formatdatetime('yyyy"年"mm"月"dd"日"',date);
edtdate.Text :=formatdatetime('yyyy''年''mm''月''dd''日''',date);

end;

procedure TfrmPrint.btnPrintClick(Sender: TObject);
begin
CurrentParam.printDate :=edtdate.Text ;
CurrentParam.bprint :=true;
CurrentParam.PrintTitle:=trim(EDTTITLE.Text);
close;
end;

end.
