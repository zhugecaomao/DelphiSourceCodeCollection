unit UFlatQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons, Mask,
  LabeledEditint;

type
  TfmFlatQuery = class(TfmBase)
    Panel3: TPanel;
    js: TLabel;
    Label7: TLabel;
    SpeedButton10: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnSelPayComponey: TSpeedButton;
    jsr: TComboBox;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
    edtshr: TComboBox;
    edtpart: TLabeledEdit;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    dsdetail: TDataSource;
    dscheck: TDataSource;
    DBGrid1: TDBGrid;
    DB: TDBGrid;
    Bevel1: TBevel;
    edtcode: TEdit;
    edtprice: TLabeledEditint;
    procedure BtnCloseClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    bm:string;
  public
    { Public declarations }
  end;

var
  fmFlatQuery: TfmFlatQuery;

implementation

uses func, untdatadm, UntSQpspart;

{$R *.dfm}

procedure TfmFlatQuery.BtnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmFlatQuery.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;
begin
  inherited;
   sqlpub:='select * from [DP_flat] where 1=1';
  if trim(edtcode.Text)<>'' then sqlpub:=sqlpub+'  AND Stock_no='+''''+trim(edtcode.Text)+'''';
  if trim(edtshr.Text)<>'' then sqlpub:=sqlpub+' and tranman='+''''+trim(edtshr.Text)+'''';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and Operater='+''''+trim(jsr.Text)+'''';
  if trim(edtprice.Text)<>'' then sqlpub:=sqlpub+' and price='+''''+trim(edtprice.Text)+'''';
  if trim(edtpart.Text)<>'' then sqlpub:=sqlpub+'  and storage='+''''+trim(bm)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and copy_date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSquery.Open;
end;

procedure TfmFlatQuery.BtnSelPayComponeyClick(Sender: TObject);
begin
  inherited;
  dlgSQpspart:=tdlgSQpspart.Create(self);
  dlgSQpspart.Caption:='选择部门';
  dlgSQpspart.ShowModal;
  dlgSQpspart.Free;
  if dmmain.CDSdata.IsEmpty  then exit;
  edtpart.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
  bm:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
  dmmain.cdsdata.Close;
  dmmain.cdsdata.data:=NULL;
end;

procedure TfmFlatQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  
  DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  inherited;
end;

procedure TfmFlatQuery.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [DP_FlatDetail] where stock_no='+''''+trim(dmmain.CDSquery.fieldbyname('Stock_no').AsString)+'''';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    dbgrid1.Visible:=true;
    db.Visible:=false;
  except
    application.MessageBox('服务器终止服务！',pchar(application.Title),mb_iconwarning);
    exit;
  end;

end;

procedure TfmFlatQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF DBGRID1.Visible THEN
  BEGIN
    if key=vk_Escape then
  DBGRID1.Visible :=FALSE;
  db.Visible:=true;
  END ELSE
  BEGIN
    IF KEY=VK_F1 THEN
    DBDblClick(DB);
  END;
end;

end.
