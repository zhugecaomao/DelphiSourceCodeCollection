unit Check_Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, DBGrids, DB;

type
  TFrmCheck_Query = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    cboxjsr: TComboBox;
    cboxshr: TComboBox;
    Label5: TLabel;
    CBoxck: TComboBox;
    SpeedButton10: TSpeedButton;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    DB: TDBGrid;
    dscheck: TDataSource;
    dsdetail: TDataSource;
    DBGrid1: TDBGrid;
    CBoxdm: TLabeledEdit;
    BtnSelPayComponey: TSpeedButton;
    SPBDetail: TSpeedButton;
    DBGrid2: TDBGrid;
    DsDview: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure SPBDetailClick(Sender: TObject);
    procedure DBTitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
    bm:string;
  public
    { Public declarations }
  end;

var
  FrmCheck_Query: TFrmCheck_Query;

implementation

uses untdatadm, Data, func, UntSQpspart;

{$R *.dfm}

procedure TFrmCheck_Query.FormShow(Sender: TObject);
begin
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

procedure TFrmCheck_Query.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCheck_Query.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
   DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  Action:=caFree;
end;

procedure TFrmCheck_Query.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  sqlpub:='select * from DP_Check where 1=1';
  if trim(cboxdm.Text)<>'' then sqlpub:=sqlpub+' and c_shop='+''''+trim(bm)+'''';
  if trim(cboxjsr.Text)<>'' then sqlpub:=sqlpub+' and C_Jinshou='+''''+trim(cboxjsr.Text)+'''';
  if trim(cboxshr.Text)<>'' then sqlpub:=sqlpub+' and C_Auditer='+''''+trim(cboxshr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' c_newdate between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  //sqlpub:=copy(sqlpub,0,length(sqlpub)-4);
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSquery.Open;
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=false;
  db.Visible:=true;
end;
procedure TFrmCheck_Query.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [VQuerycheck] where cd_checkcode='+''''+trim(dmmain.CDSquery.fieldbyname('c_code').AsString)+'''';
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

procedure TFrmCheck_Query.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TFrmCheck_Query.BtnSelPayComponeyClick(Sender: TObject);
begin
  dlgSQpspart:=tdlgSQpspart.Create(self);
  dlgSQpspart.Caption:='选择部门';
  dlgSQpspart.ShowModal;
  dlgSQpspart.Free;
  if dmmain.CDSdata.IsEmpty  then exit;
  CBoxdm.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
  bm:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
  dmmain.cdsdata.Close;
  dmmain.cdsdata.data:=null;
end;

procedure TFrmCheck_Query.SPBDetailClick(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  sqlpub:='select sum(a.CD_cCount) as CD_cCount,a.CD_cCode, a.CD_cName, a.CD_Amount, a.type from VQuerycheck as a ,DP_Check as b where a.cd_checkcode=b.c_code';
  if trim(cboxdm.Text)<>'' then sqlpub:=sqlpub+' and b.c_shop='+''''+trim(bm)+'''';
  if trim(cboxjsr.Text)<>'' then sqlpub:=sqlpub+' and b.C_Jinshou='+''''+trim(cboxjsr.Text)+'''';
  if trim(cboxshr.Text)<>'' then sqlpub:=sqlpub+' and b.C_Auditer='+''''+trim(cboxshr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' b.c_newdate between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  //sqlpub:=copy(sqlpub,0,length(sqlpub)-4);
  sqlpub:=sqlpub+' group by a.CD_cCode, a.CD_cName, a.CD_Amount, a.type';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(sqlpub);
  dmmain.CDSexecsql.Open;
  DB.Visible:=false;
  dbgrid1.Visible:=false;
  dbgrid2.Visible:=true;
end;

procedure TFrmCheck_Query.DBTitleClick(Column: TColumn);
begin
  if (not db.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,db,column);
end;

procedure TFrmCheck_Query.DBGrid1TitleClick(Column: TColumn);
begin
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure TFrmCheck_Query.DBGrid2TitleClick(Column: TColumn);
begin
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSexecsql,dbgrid2,column);
end;

end.
