unit untScrap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  Tfm_Scrap_Query = class(TfmBase)
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
    dscheck: TDataSource;
    dsdetail: TDataSource;
    DBGrid1: TDBGrid;
    edtpart: TLabeledEdit;
    BtnSelPayComponey: TSpeedButton;
    SPBDetail: TSpeedButton;
    DBGrid2: TDBGrid;
    DsDview: TDataSource;
    procedure SpeedButton10Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure SPBDetailClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBTitleClick(Column: TColumn);
  private
    { Private declarations }
    bm:string;
  public
    { Public declarations }
  end;

var
  fm_Scrap_Query: Tfm_Scrap_Query;

implementation

uses untdatadm, Data, func, UntSQpspart;
{$R *.dfm}

procedure Tfm_Scrap_Query.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  sqlpub:='select * from [DP_Scrap] where';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' S_Code='+''''+trim(djbh.Text)+''''+' and';
  //if trim(edtshr.Text)<>'' then sqlpub:=sqlpub+' S_Auditer='+''''+trim(edtshr.Text)+''''+' and';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' S_Operater='+''''+trim(jsr.Text)+''''+' and';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' S_NewMan='+''''+trim(zdr.Text)+''''+' and';
  if trim(edtpart.Text)<>'' then sqlpub:=sqlpub+' s_shop='+''''+trim(bm)+''''+' and';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' S_NewDate between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+''''+' and';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  sqlpub:=copy(sqlpub,0,length(sqlpub)-4);
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSquery.Open;
   dbgrid1.Visible:=false;
  dbgrid2.Visible:=false;
  db.Visible:=true;
end;

procedure Tfm_Scrap_Query.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfm_Scrap_Query.FormShow(Sender: TObject);
begin
  inherited;
  dmmain.CDSquery.Close;
end;

procedure Tfm_Scrap_Query.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [DP_ScrapDetail] where SD_sCode='+''''+trim(dmmain.CDSquery.fieldbyname('S_Code').AsString)+'''';
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

procedure Tfm_Scrap_Query.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfm_Scrap_Query.FormClose(Sender: TObject;
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

procedure Tfm_Scrap_Query.BtnSelPayComponeyClick(Sender: TObject);
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

procedure Tfm_Scrap_Query.SPBDetailClick(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  sqlpub:='select a.sd_ccode  as cd_ccode,a.sd_cname as sd_cname,sum(a.sd_ccount) as cd_ccount,c.type,c.breed from [DP_scrapdetail] as a,[DP_scrap] as b,goods_code as c  where b.s_code=a.sd_scode and a.sd_ccode=c.goods_no ';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' and b.s_Code='+''''+trim(djbh.Text)+'''';
  //if trim(edtshr.Text)<>'' then sqlpub:=sqlpub+' O_Auditer='+''''+trim(edtshr.Text)+''''+' and';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and b.s_Operater='+''''+trim(jsr.Text)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and b.s_NewMan='+''''+trim(zdr.Text)+''''+' and';
  if trim(edtpart.Text)<>'' then sqlpub:=sqlpub+' and b.s_shop='+''''+trim(bm)+''''+' and';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and b.s_NewDate between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  sqlpub:= sqlpub+'group by a.sd_ccode ,a.sd_cname ,c.type,c.breed';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(sqlpub);
  dmmain.CDSexecsql.Open;
  DB.Visible:=false;
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=true;

end;

procedure Tfm_Scrap_Query.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSexecsql,dbgrid2,column);
end;

procedure Tfm_Scrap_Query.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure Tfm_Scrap_Query.DBTitleClick(Column: TColumn);
begin
  inherited;
  if (not db.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,db,column);
end;

end.
