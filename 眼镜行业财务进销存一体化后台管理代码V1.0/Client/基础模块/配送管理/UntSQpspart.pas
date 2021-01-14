unit UntSQpspart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TdlgSQpspart = class(TfmBase)
    dsview: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBGrid1: TDBGrid;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure readdata;
  public
    { Public declarations }
  end;

var
  dlgSQpspart: TdlgSQpspart;

implementation

uses untdatadm, func;

{$R *.dfm}
procedure TdlgSQpspart.readdata;
var
  sql:widestring;
  datas:olevariant;
begin
  sql:='select b.part_no,b.part_name,b.storageid from stock_manager as a ,part as b where b.storageid=a.storageid and a.managerid='+''''+trim(shopid)+'''';
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  datas:=null;
  try
    datas:=adisp.execSql (sql);
    if not varisnull(datas) then
    begin
    dmmain.CDSdata.Data:=datas ;
    dmmain.CDSdata.Open;
    datas:=null;
    end else
    begin
      application.MessageBox(pchar('没有设定[配送地区管辖]，请到[基本信息]中设置！'),pchar(application.Title),mb_iconwarning);
      exit;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
procedure TdlgSQpspart.btnCancelClick(Sender: TObject);
begin
  inherited;
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  close;
end;

procedure TdlgSQpspart.FormShow(Sender: TObject);
begin
  inherited;
  readdata;
end;

procedure TdlgSQpspart.btnOkClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TdlgSQpspart.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnok.Click;
end;

end.
