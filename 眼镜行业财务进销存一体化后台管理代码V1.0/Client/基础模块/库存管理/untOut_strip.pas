unit untOut_strip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  Tfrm_Out_strip_Query = class(TfmBase)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    js: TLabel;
    Label12: TLabel;
    SpeedButton10: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    jsr: TComboBox;
    zdr: TComboBox;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
    DB: TDBGrid;
    dscheck: TDataSource;
    dsdetail: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DsDview: TDataSource;
    SPBDetail: TSpeedButton;
    djbh: TLabeledEdit;
    ckck: TLabeledEdit;
    BtnSelPayComponey: TSpeedButton;
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SPBDetailClick(Sender: TObject);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBTitleClick(Column: TColumn);
  private
    { Private declarations }
    storageid:string;
  public
    { Public declarations }
  end;

var
  frm_Out_strip_Query: Tfrm_Out_strip_Query;

implementation

uses untdatadm, Data, func, Storage_Select;

{$R *.dfm}

procedure Tfrm_Out_strip_Query.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  sqlpub:='select * from [Out_strip] where out_name='+''''+trim('非营业性出库单')+'''';
  if trim(ckck.Text)<>'' then sqlpub:=sqlpub+' and  Storage_NO='+''''+trim(storageid)+'''';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' and Out_NO='+''''+trim(djbh.Text)+'''';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and Transactor='+''''+trim(jsr.Text)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and Proposer='+''''+trim(zdr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and Copy_Date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
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

procedure Tfrm_Out_strip_Query.FormShow(Sender: TObject);
begin
  inherited;
  dmmain.CDSquery.Close;
end;

procedure Tfrm_Out_strip_Query.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [Out_strip_detail] where out_no='+''''+trim(dmmain.CDSquery.fieldbyname('out_no').AsString)+'''';
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

procedure Tfrm_Out_strip_Query.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_Out_strip_Query.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_Out_strip_Query.FormClose(Sender: TObject;
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

procedure Tfrm_Out_strip_Query.SPBDetailClick(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  inherited;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  sqlpub:='select a.goods_no as cd_ccode,a.goods_name as cd_cname,sum(a.amount) as cd_ccount,c.type,c.breed from [out_strip_detail] as a ,out_strip as b,goods_code as c where a.out_no=b.out_no and a.goods_no=c.goods_no and b.out_Name='+''''+trim('非营业性出库单')+'''';
  if trim(ckck.Text)<>'' then sqlpub:=sqlpub+' and b.storage_NO='+''''+trim(storageid)+'''';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+'  and b.part_no='+''''+trim(djbh.Text)+'''';
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

procedure Tfrm_Out_strip_Query.BtnSelPayComponeyClick(Sender: TObject);
begin
  inherited;
  Check_Storage:='';Check_Storage_Result:='';
  Check_Storage:='Quality_Checkstr';
  frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
  frm_Storage_Select.ShowModal;
  storageid:=Trim(Check_Storage_Result_NO);
  ckck.Text:=Trim(Check_Storage_Result);
  frm_Storage_Select.Free;
end;

procedure Tfrm_Out_strip_Query.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSexecsql,dbgrid2,column);
end;

procedure Tfrm_Out_strip_Query.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure Tfrm_Out_strip_Query.DBTitleClick(Column: TColumn);
begin
  inherited;
  if (not db.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,db,column);
end;

end.
