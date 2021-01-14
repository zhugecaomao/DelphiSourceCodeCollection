unit Untbatchiput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls,
  Buttons;

type
  TfmBatchinput = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtp1: TDateTimePicker;
    DBGrid1: TDBGrid;
    dsbatch: TDataSource;
    Label3: TLabel;
    dtp2: TDateTimePicker;
    btnSelect: TSpeedButton;
    RDG: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RDGClick(Sender: TObject);
  private
    { Private declarations }
    Bstates:string;
    procedure redata(BILLStates:string);
  public
    { Public declarations }
  end;

var
  fmBatchinput: TfmBatchinput;

implementation

uses untdatadm, func, UntPosQuestBillStr;

{$R *.dfm}
procedure tfmbatchinput.redata;
var
  temp:widestring;
  quedata:olevariant;
begin
  temp:='select VCSENDBILLID,billno,vcSendStockID,dtDrawDate from SendMasterTable as a ,receipt as b where a.billno=b.receipt_no and b.Check_Result=6 and iBIlltype=501 and SendStatus=3 and dtDrawDate>='+''''+formatdatetime('yyyy''-''mm''-''dd',dtp1.Date)+''''+' and dtDrawDate<='+''''+formatdatetime('yyyy''-''mm''-''dd',dtp2.Date)+''''+' and vcRecvStockID='+''''+trim(shopid)+''''+' and BillStatus='+Billstates;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
  quedata:=null;
  try
    ipubtemp.ty_query(temp,quedata);
    if  not varisnull(quedata) then
    begin
      dmmain.dsquery.Data :=quedata;
      dmmain.dsquery.Open;
      dbgrid1.Hint:='双击显示收货单据';
    end;
  except
  end;
end;
procedure TfmBatchinput.FormShow(Sender: TObject);
begin
  inherited;
  dtp1.Date:=date-10;
  dtp2.Date:=date;
  Bstates:=inttostr(rdg.ItemIndex);
  redata(BStates);
end;

procedure TfmBatchinput.btnSelectClick(Sender: TObject);
begin
  inherited;
  redata(Bstates);
end;

procedure TfmBatchinput.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not dmmain.dsquery.IsEmpty then
  BEGIN
    ShowPosQuestBillFmStrGrid(trim(dmmain.dsquery.fieldbyname('VCSENDBILLID').AsString),'',501); //配送退货出库;
    DBGRID1.DataSource.DataSet.DisableControls;
    dmmain.dsquery.Refresh;
    DBGRID1.Refresh;
    DBGRID1.DataSource.DataSet.EnableControls;
  END;
end;

procedure TfmBatchinput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
end;

procedure TfmBatchinput.RDGClick(Sender: TObject);
begin
  inherited;
  CASE RDG.ItemIndex OF
  0: BSTATES:='0';
  1: BSTATES:='5';
  END;
  redata(bstates);
end;

end.
