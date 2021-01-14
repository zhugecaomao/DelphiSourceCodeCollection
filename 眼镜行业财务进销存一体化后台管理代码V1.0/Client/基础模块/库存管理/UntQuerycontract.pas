unit UntQuerycontract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, DBGrids, StdCtrls, Buttons, DB, ExtCtrls;

type
  TfmQuerycontract = class(TfmBase)
    dsview: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn11: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQuerycontract: TfmQuerycontract;

implementation

uses untdatadm, func, fm_SetColumn;

{$R *.dfm}

procedure TfmQuerycontract.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmQuerycontract.DBGrid1DblClick(Sender: TObject);
//var
  //sql:widestring;
begin
  inherited;
  {sql:='select * from Stock_contract_detail as a ,goods_code as b where a.goods_no=b.goods_no and Contract_No='+''''+trim(dmmain.CDSquery.fieldbyname('Contract_No').AsString)+'''';
  try
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    dbgrid2.Visible:=true;
  except
  end;}
end;

procedure TfmQuerycontract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  inherited;

end;

procedure TfmQuerycontract.BitBtn11Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmQuerycontract.FormShow(Sender: TObject);
begin
  inherited;
  dbgCur:=dbgrid2;
end;

procedure TfmQuerycontract.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid2,column);
end;

end.
