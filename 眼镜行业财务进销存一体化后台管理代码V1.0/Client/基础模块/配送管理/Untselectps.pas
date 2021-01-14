unit Untselectps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, DBGrids, DB, StdCtrls, Buttons;

type
  Tdlgselectps = class(TfmBase)
    dsview: TDataSource;
    DBGrid1: TDBGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
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
  dlgselectps: Tdlgselectps;

implementation

uses untdatadm, func;

{$R *.dfm}
procedure Tdlgselectps.readdata;
var
  sql:widestring;
  datas:olevariant;
begin
  sql:='select a.managerid,a.managername,b.area_no from stock_manager as a ,storage as b where b.storage_no=a.managerid and a.storageid='+''''+trim(shopid)+'''';
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  datas:=null;
  try
    datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
    dmmain.CDSdata.Data:=datas;
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
procedure Tdlgselectps.btnCancelClick(Sender: TObject);
begin
  inherited;
  dmmain.CDSdata.Close;
   dmmain.CDSdata.Data:=null;
  close;
end;

procedure Tdlgselectps.FormShow(Sender: TObject);
begin
  inherited;
  readdata;
end;

procedure Tdlgselectps.btnOkClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgselectps.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnok.Click;
end;

end.
