unit Stock_Enter_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  Mask, DB;

type
  Tfrm_Stock_Enter_Report = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    js: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    SpeedButton10: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    jsr: TComboBox;
    zdr: TComboBox;
    djbh: TComboBox;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
    DB: TDBGrid;
    Label5: TLabel;
    ckmc: TComboBox;
    Label6: TLabel;
    zdbm: TComboBox;
    dscheck: TDataSource;
    DBGrid1: TDBGrid;
    dsdetail: TDataSource;
    SPBDetail: TSpeedButton;
    DBGrid2: TDBGrid;
    DsDview: TDataSource;
    procedure SpeedButton10Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPBDetailClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    flag:integer;
  end;

var
  frm_Stock_Enter_Report: Tfrm_Stock_Enter_Report;

implementation

uses Data, untdatadm, func;

{$R *.dfm}

procedure Tfrm_Stock_Enter_Report.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
   dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  if flag=0 then
  begin
    sqlpub:='select * from [Stock_Jion] where Stock_Name='+''''+trim('采购入库单')+'''';
  end else
  begin
     sqlpub:='select * from [Stock_Jion] where Stock_Name='+''''+trim('非营业性入库单')+'''';
  end;
  if trim(ckmc.Text)<>'' then sqlpub:=sqlpub+' and storage_NO='+''''+trim(ckmc.Text)+'''';
  if trim(zdbm.Text)<>'' then sqlpub:=sqlpub+'  and part_no='+''''+trim(zdbm.Text)+'''';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' and Stock_NO='+''''+trim(djbh.Text)+'''';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and Transactor='+''''+trim(jsr.Text)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and proposer='+''''+trim(zdr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and Copy_Date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+''''+' and';
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

procedure Tfrm_Stock_Enter_Report.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Stock_Enter_Report.FormShow(Sender: TObject);

begin
  Label1.Caption:=caption;
  dmmain.CDSquery.Close;
  dmmain.CDSquery2.Close;
end;

procedure Tfrm_Stock_Enter_Report.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [stock_Jion_detail] where stock_no='+''''+trim(dmmain.CDSquery.fieldbyname('stock_no').AsString)+'''';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    dbgrid1.Visible:=true;
  except
    application.MessageBox('服务器终止服务！',pchar(application.Title),mb_iconwarning);
    exit;
  end;

end;

procedure Tfrm_Stock_Enter_Report.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
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

procedure Tfrm_Stock_Enter_Report.SPBDetailClick(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  if flag=0 then
  begin
    sqlpub:='select a.goods_no as cd_ccode,a.goods_name as cd_cname,sum(a.amount) as cd_ccount,c.type,c.breed from [Stock_Jion_detail] as a ,stock_jion as b,goods_code as c where a.stock_no=b.stock_no and a.goods_no=c.goods_no and b.Stock_Name='+''''+trim('采购入库单')+'''';
  end else
  begin
    sqlpub:='select a.goods_no as cd_ccode,a.goods_name as cd_cname,sum(a.amount) as cd_ccount,c.type,c.breed from [Stock_Jion_detail] as a ,stock_jion as b,goods_code as c where a.stock_no=b.stock_no and a.goods_no=c.goods_no and b.Stock_Name='+''''+trim('非营业性入库单')+'''';
  end;
  if trim(ckmc.Text)<>'' then sqlpub:=sqlpub+' and b.storage_NO='+''''+trim(ckmc.Text)+'''';
  if trim(zdbm.Text)<>'' then sqlpub:=sqlpub+'  and b.part_no='+''''+trim(zdbm.Text)+'''';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' and b.Stock_NO='+''''+trim(djbh.Text)+'''';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and b.Transactor='+''''+trim(jsr.Text)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and b.proposer='+''''+trim(zdr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and b.Copy_Date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+''''+' and';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  sqlpub:=sqlpub+'group by a.goods_no ,a.goods_name ,c.type,c.breed';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSexecsql.Open;
  DB.Visible:=false;
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=true;
end;

procedure Tfrm_Stock_Enter_Report.DBGrid2TitleClick(Column: TColumn);
begin
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSexecsql,dbgrid2,column);
end;

procedure Tfrm_Stock_Enter_Report.DBGrid1TitleClick(Column: TColumn);
begin
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure Tfrm_Stock_Enter_Report.DBTitleClick(Column: TColumn);
begin
  if (not db.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,db,column);
end;

procedure Tfrm_Stock_Enter_Report.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
   dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  action:=cafree;
end;

end.
