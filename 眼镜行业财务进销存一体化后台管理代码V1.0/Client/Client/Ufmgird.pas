unit Ufmgird;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  Tfrmgrid = class(Tfrmbase)
    DBGrid1: TDBGrid;
    btnExit: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    btnPrivew: TBitBtn;
    btnChart: TBitBtn;
    btnpagedown: TBitBtn;
    Label1: TLabel;
    cmbpage: TComboBox;
    DataSource1: TDataSource;
    procedure btnExitClick(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgrid: Tfrmgrid;

implementation

uses untdatadm, func, Uinputselect;

{$R *.dfm}

procedure Tfrmgrid.btnExitClick(Sender: TObject);
begin
  //inherited;
  close;
end;

procedure Tfrmgrid.btnpagedownClick(Sender: TObject);
var
  str:widestring;
  datas:olevariant;
begin
  inherited;
  str:='select top'+cmbpage.Text+'* from receipt as a ,stock_jion as b where a.receipt_no=b.stock_no and a.check_result=6 and stock_name='+''''+trim('采购入库单')+'''';
  try
    if dmmain.CDSquery.Active then dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    datas:=adisp.GetRecord(str);
    if not varisnull(datas) then
    begin
      dmmain.CDSquery.Data:=datas;
      dmmain.CDSquery.Open;
    end else
    begin
      application.MessageBox('没有符合条件的数据！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
  except
  end;
end;

procedure Tfrmgrid.DBGrid1DblClick(Sender: TObject);
begin
  //inherited;
  if trim(dmmain.CDSquery.fieldbyname('stock_no').AsString)<>'' then
  begin
    stockinput:=dmmain.CDSquery.fieldbyname('stock_no').AsString;
  end;
  close;
end;

procedure Tfrmgrid.btnQueryClick(Sender: TObject);
begin
  inherited;
  frmselect:=tfrmselect.Create(self);
  frmselect.ShowModal;
  frmselect.Free;
end;

procedure Tfrmgrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  inherited;

end;

procedure Tfrmgrid.FormShow(Sender: TObject);
begin
  inherited;
  stockinput:='';
end;

end.
