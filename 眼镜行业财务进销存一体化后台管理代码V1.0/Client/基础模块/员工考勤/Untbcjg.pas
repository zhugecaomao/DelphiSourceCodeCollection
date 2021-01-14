unit Untbcjg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, DB;

type
  TfmBcJg = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    btnpagedown: TBitBtn;
    Label3: TLabel;
    cmbtop: TComboBox;
    dsview: TDataSource;
    procedure btnExitClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    LocalCount:integer;
    tables,temp,tj:string;
    function readdata():boolean;
  public
    { Public declarations }
  end;

var
  fmBcJg: TfmBcJg;

implementation

uses untdatadm, func, Unitbcjglr;

{$R *.dfm}
//////////////////////////
function  TfmBcJg.readdata():boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  tables:=' bc_no,bc_name,id,convert(varchar(20),swsb,14) as swsb,convert(varchar(20),swxb,14) as swxb,convert(varchar(20),xwsb,14) as xwsb,convert(varchar(20),xwxb,14) as xwxb,convert(varchar(20),wssb,14) as wssb,convert(varchar(20),wsxb,14) as wsxb,'+
  'convert(varchar(20),jbsb,14) as jbsb,convert(varchar(20),jbxb,14) as jbxb from dp_bcjg';
  temp:='select top '+trim(cmbtop.Text);
  sql:=temp+tables+tj;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
    datas:=null;
    datas:=adisp.GetRecord(sql);
    if not varisnull(datas) then
    begin
      dmmain.CDSquery.Data:=datas;
      dmmain.CDSquery.Open;
      datas:=null;
    end ;
    LocalCount:=GetKeyFieldValue('id',dmmain.cdsquery);
    result:=true;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit; 
  end;
end;
////////////////////////////////
procedure TfmBcJg.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBcJg.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid1,column);
end;

procedure TfmBcJg.FormShow(Sender: TObject);
begin
  inherited;
  cmbtop.ItemIndex:=0;
  tj:='';
  readdata;
end;

procedure TfmBcJg.btnpagedownClick(Sender: TObject);
begin
  inherited;
  tj:=' where id >'+inttostr(LocalCount);
  readdata;
end;

procedure TfmBcJg.btnAddClick(Sender: TObject);
begin
  inherited;
  frmbcjglr:=tfrmbcjglr.Create(self);
  frmbcjglr.bmbh:='@';
  frmbcjglr.ShowModal;
  frmbcjglr.Free;
  if not dmmain.CDSquery.Active then exit;
  dmmain.CDSquery.Refresh;
  dbgrid1.Refresh;
end;

procedure TfmBcJg.btnEditClick(Sender: TObject);
begin
  inherited;
  frmbcjglr:=tfrmbcjglr.Create(self);
  frmbcjglr.bmbh:=trim(dmmain.CDSquery.fieldbyname('bc_no').AsString);
  frmbcjglr.edtbcmc.text:=dmmain.CDSquery.fieldbyname('bc_name').asstring;
  frmbcjglr.dtswsb.Time:=dmmain.CDSquery.fieldbyname('swsb').asdatetime;
  frmbcjglr.dtswxb.Time:=dmmain.CDSquery.fieldbyname('swxb').asdatetime;
  frmbcjglr.dtxwsb.Time:=dmmain.CDSquery.fieldbyname('xwsb').asdatetime;
  frmbcjglr.dtxwxb.Time:=dmmain.CDSquery.fieldbyname('xwxb').asdatetime;
  frmbcjglr.dtwssb.Time:=dmmain.CDSquery.fieldbyname('wssb').asdatetime;
  frmbcjglr.dtwsxb.Time:=dmmain.CDSquery.fieldbyname('wsxb').asdatetime;
  frmbcjglr.dtjbsb.Time:=dmmain.CDSquery.fieldbyname('jbsb').asdatetime;
  frmbcjglr.dtjbxb.Time:=dmmain.CDSquery.fieldbyname('jbxb').asdatetime;
  frmbcjglr.ShowModal;
  frmbcjglr.Free;
  if not dmmain.CDSquery.Active then exit;
  dmmain.CDSquery.Refresh;
  dbgrid1.Refresh;
end;

procedure TfmBcJg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

procedure TfmBcJg.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnedit.Click;
end;

end.
