unit UNewShopQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Buttons, Mask;

type
  TfmNewShopQuery = class(TfmBase)
    Panel3: TPanel;
    Label12: TLabel;
    Label7: TLabel;
    SpeedButton10: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    BtnSelPayComponey: TSpeedButton;
    zdr: TComboBox;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
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
    SpeedButton1: TSpeedButton;
    edtshop: TLabeledEdit;
    Edtcode: TEdit;
    SPBDetail: TSpeedButton;
    DBGrid2: TDBGrid;
    DsDview: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SPBDetailClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bm,Qshop:string;
  public
    { Public declarations }
  end;

var
  fmNewShopQuery: TfmNewShopQuery;

implementation

uses UntSQpspart, untdatadm, func;

{$R *.dfm}

procedure TfmNewShopQuery.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dlgSQpspart:=tdlgSQpspart.Create(self);
  dlgSQpspart.Caption:='选择部门';
  dlgSQpspart.ShowModal;
  dlgSQpspart.Free;
  if dmmain.CDSdata.IsEmpty  then exit;
  edtShop.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
  Qshop:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
  dmmain.cdsdata.Close;
  dmmain.cdsdata.data:=null;
end;

procedure TfmNewShopQuery.BtnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmNewShopQuery.BtnSelPayComponeyClick(Sender: TObject);
begin
  inherited;
  dlgSQpspart:=tdlgSQpspart.Create(self);
  dlgSQpspart.Caption:='选择部门';
  dlgSQpspart.ShowModal;
  dlgSQpspart.Free;
  if dmmain.CDSdata.IsEmpty  then exit;
  edtpart.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
  bm:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
  dmmain.cdsdata.Close;
  dmmain.cdsdata.data:=null;
end;

procedure TfmNewShopQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  inherited;

end;

procedure TfmNewShopQuery.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select a.*,b.type,b.brand,b.breed,b.goods_name from [storage_jion_Detail] as a,goods_code as b where a.goods_no=b.goods_no and a.stock_no='+''''+trim(dmmain.CDSquery.fieldbyname('stock_no').AsString)+'''';
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

procedure TfmNewShopQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF DBGRID1.Visible THEN
  BEGIN
    if key=vk_Escape then
    begin
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=false;
      db.Visible:=true;
    end;
  END ELSE
  BEGIN
    IF (KEY=VK_F1) and (db.Visible) THEN
    begin
      DBDblClick(DB);
      db.Visible:=false;
      dbgrid2.Visible:=false;
    end;
    IF (KEY=VK_F2) and (db.Visible) THEN
    begin
      spbdetailclick(nil);
      db.Visible:=false;
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=true;
    end;
   if (key=vk_Escape) and (dbgrid2.Visible) then
    begin
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=false;
      db.Visible:=true;
    end;
  END;
end;

procedure TfmNewShopQuery.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  sqlpub:='select * from [storage_jion] where 1=1 ';
  if trim(edtcode.Text)<>'' then sqlpub:=sqlpub+' and  stock_no='+''''+trim(edtcode.Text)+'''';
  if trim(edtshop.Text)<>'' then sqlpub:=sqlpub+'  and retailstock_no='+''''+trim(Qshop)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and proposer='+''''+trim(zdr.Text)+'''';
  if trim(edtpart.Text)<>'' then sqlpub:=sqlpub+' and part_no='+''''+trim(bm)+'''';
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
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=false;
  db.Visible:=true;
end;

procedure TfmNewShopQuery.SPBDetailClick(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  sqlpub:='select sum(a.amount) as cd_ccount,a.goods_no as cd_ccode,c.type,c.goods_name as cd_cname,c.breed from [storage_jion_detail] as a ,[storage_jion] as b,goods_code as c  where a.stock_no=b.stock_no and a.goods_no=c.goods_no ';
  if trim(edtcode.Text)<>'' then sqlpub:=sqlpub+' and  a.stock_no='+''''+trim(edtcode.Text)+'''';
  if trim(edtshop.Text)<>'' then sqlpub:=sqlpub+'  and b.retailstock_no='+''''+trim(Qshop)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and b.proposer='+''''+trim(zdr.Text)+'''';
  if trim(edtpart.Text)<>'' then sqlpub:=sqlpub+' and b.part_no='+''''+trim(bm)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and b.copy_date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  sqlpub:=sqlpub+' group by a.goods_no ,c.type,c.goods_name ,c.breed';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(sqlpub);
  dmmain.CDSexecsql.Open;
  DB.Visible:=false;
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=true;
end;

procedure TfmNewShopQuery.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSexecsql,dbgrid2,column);
end;

procedure TfmNewShopQuery.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure TfmNewShopQuery.DBTitleClick(Column: TColumn);
begin
  inherited;
  if (not db.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,db,column);
end;

procedure TfmNewShopQuery.FormShow(Sender: TObject);
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

end.
