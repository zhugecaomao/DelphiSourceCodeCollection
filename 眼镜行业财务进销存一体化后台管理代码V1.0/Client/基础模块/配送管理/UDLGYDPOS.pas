unit UDLGYDPOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TDlgYdPos = class(TfmBase)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBGrid1: TDBGrid;
    dsview: TDataSource;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function ReadData(No:string):boolean;
  public
    { Public declarations }
    p_no,SHOPNO:string;
  end;

var
  DlgYdPos: TDlgYdPos;

implementation

uses func, untdatadm;

{$R *.dfm}
function TDlgYdPos.ReadData(No:string):boolean;
var
  temp:widestring;
  datas:olevariant;
begin
  result:=false;
  temp:=' select distinct memo,VcGetGoodsPlanID,vcbillno,VCOfficeID,DGetDate from GetGoodsPlanMaster  where  IPlanStatus=5 '+
  'and VCOfficeID='+''''+trim(no)+''''+' and vcstockid='+''''+trim(SHOPid)+'''';
  with dmmain.cdsyddata do
  begin
    close;
    data:=null;
    datas:=null;
    try
      datas:=adisp.execSql(temp);
      if not varisnull(datas) then
      begin
        data:=datas;
        datas:=null;
        open;
      end;
      result:=true;
    except
    end;
  end;

end;
procedure TDlgYdPos.btnOkClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TDlgYdPos.btnCancelClick(Sender: TObject);
begin
  inherited;
  dmmain.cdsyddata.Close;
  dmmain.cdsyddata.Data:=null;
end;

procedure TDlgYdPos.FormShow(Sender: TObject);
begin
  inherited;
  readdata(p_no);
end;

end.
