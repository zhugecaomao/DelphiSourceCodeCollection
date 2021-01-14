unit Unitbbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Wwdbigrd, Wwdbgrid,db, DBClient, StdCtrls,
  Buttons, DBGrids, ComCtrls;

type
  Tfrmbbs = class(TForm)
    Panel1: TPanel;
    dsview: TDataSource;
    cdsdata: TClientDataSet;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    dsLMdata: TDataSource;
    cdsLmdata: TClientDataSet;
    Label3: TLabel;
    Label8: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure dtpBeginChange(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    tj:string;
    LocalCount:integer;
    function Read():BOOLEAN;
    function ReadData(id,lmno:string;flag:boolean):boolean;
  public
    { Public declarations }
  end;

var
  frmbbs: Tfrmbbs;

implementation

uses  Unitbbsmx, func, fm_SetColumn;

{$R *.dfm}
//////////////////////
function tfrmbbs.read():boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  sql:='select * from manager';
  datas:=null;
  cdslmdata.Close;
  cdslmdata.Data:=null;
  try
    datas:=adisp.resultrecord(sql);
    if not varisnull(datas) then
    begin
      cdslmdata.Data:=datas;
      cdslmdata.Open;
      cdslmdata.last;
    end else
    begin
      btnpagedown.Enabled:=false;
    end;
    result:=true;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
function tfrmbbs.readdata(id,lmno:string;flag:boolean):boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  if btnpagedown.Enabled then
  begin
    sql:='select top 100 * from lmmx where id>'+id+tj+' and lmno='+''''+trim(lmno)+'''';
  end else
  begin
    sql:='select top 100 * from lmmx where 1=1 '+tj+' and lmno='+''''+trim(lmno)+'''';
  end ;
  datas:=null;
  cdsdata.Close;
  if flag then
  cdsdata.Data:=null;
  try
    datas:=adisp.resultrecord(sql);
    if not varisnull(datas) then
    begin
      if flag then
      begin
        cdsdata.Data:=datas;
      end;
      cdsdata.Open;
      if not flag then
      begin
        cdsdata.AppendData(datas,true); 
      end;
      cdsdata.last;
      if not cdsdata.IsEmpty then
      begin
        LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
      end else
      begin
        application.MessageBox('没有公告数据！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end else
    begin
      btnpagedown.Enabled:=false;
    end;
    result:=true;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
procedure Tfrmbbs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmbbs.wwDBGrid1DblClick(Sender: TObject);
var
  sized:real;
begin
  if cdsdata.IsEmpty then
  begin
    application.MessageBox('没有发布的信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  frmbbsmx:=tfrmbbsmx.Create(self);
  frmbbsmx.lzt.Caption:=trim(cdsdata.fieldbyname('lmzt').AsString);
  frmbbsmx.lfjname.Caption:=trim(cdsdata.fieldbyname('fjname').AsString);
  frmbbsmx.mmemo.text:=trim(cdsdata.fieldbyname('memo').AsString);
  sized:=tblobfield(cdsdata.FieldByName('fj')).BlobSize / (1024*1024);
  if sized<1 then
  begin
    frmbbsmx.Lsize.Caption:=format('%4.2f',[sized])+'KB';
  end else
  begin
    frmbbsmx.Lsize.Caption:=format('%4.2f',[sized])+'MB';
  end;
  frmbbsmx.ShowModal;
end;

procedure Tfrmbbs.FormShow(Sender: TObject);
begin
  dbgCur:=dbgrid1;
  read;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date;
  tj:=' and date>='+''''+formatdatetime('yyyy-mm-dd',dtpbegin.Date)+''''+' and date<='+''''+formatdatetime('yyyy-mm-dd',dtpend.Date)+'''';
end;

procedure Tfrmbbs.BitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmbbs.BitBtn2Click(Sender: TObject);
begin
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure Tfrmbbs.btnpagedownClick(Sender: TObject);
begin
  readdata(inttostr(LocalCount),trim(cdslmdata.fieldbyname('lmno').AsString),false);
end;

procedure Tfrmbbs.DBGrid2DblClick(Sender: TObject);
begin
  if not cdslmdata.Active then exit;
  LocalCount:=0;
  readdata(inttostr(LocalCount),trim(cdslmdata.fieldbyname('lmno').AsString),true);
end;

procedure Tfrmbbs.dtpBeginChange(Sender: TObject);
begin
  tj:=' and date>='+''''+formatdatetime('yyyy-mm-dd',dtpbegin.Date)+''''+' and date<='+''''+formatdatetime('yyyy-mm-dd',dtpend.Date)+'''';
end;

procedure Tfrmbbs.DBGrid2TitleClick(Column: TColumn);
begin
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdslmdata,dbgrid2,column);
end;

procedure Tfrmbbs.DBGrid1TitleClick(Column: TColumn);
begin
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdsdata,dbgrid1,column);
end;

end.
