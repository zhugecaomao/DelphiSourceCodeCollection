unit Untbatchmanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB,
  DBClient;

type
  TfmBatchmanager = class(TfmBase)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Cmbmanager: TComboBox;
    Label2: TLabel;
    edtremark: TLabeledEdit;
    dsview: TDataSource;
    cdsview: TClientDataSet;
    cmb_no: TComboBox;
    btnSave: TBitBtn;
    cdsbase: TClientDataSet;
    procedure btnExitClick(Sender: TObject);
    procedure CmbmanagerChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    pcol,prow:integer;
    procedure forminit;
    procedure Model(bl:Boolean);
    procedure iniredata;
    procedure readdata;
    procedure deleted;
  public
    { Public declarations }
  end;

var
  fmBatchmanager: TfmBatchmanager;

implementation

uses untdatadm, func, Unt_PubStrGrid;

{$R *.dfm}
///////////////////////////
procedure tfmBatchmanager.forminit;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='仓库编号';
  stringgrid1.Cells[2,0]:='仓库名称';
  stringgrid1.Cells[3,0]:='所属地区';
  stringgrid1.ColWidths[0]:=30;
  stringgrid1.ColWidths[1]:=90;
  stringgrid1.ColWidths[2]:=100;
  stringgrid1.ColWidths[3]:=80;
  model(true);
  iniredata;
  readdata;
end;
procedure tfmBatchmanager.Model(bl:Boolean);
var
  i:Integer;
begin
  btnAdd.Enabled:=bl;
  btnEdit.Enabled:=bl;
  if bl then
  begin
    btnDelete.Caption:='删除';
  end else
  begin
    btnDelete.Caption:='取消';
  end;
  btnSave.Enabled:=not bl;
end;
procedure tfmBatchmanager.iniredata;
var
  sql:widestring;
  i:integer;
begin
  sql:='select storage_no,storage_name from storage where storage_type='+''''+'配送中心'+''''+' or storage_type='+''''+'地区级仓库'+'''';
  cdsbase.Close;
  cdsbase.Data:=null;
  try
  cdsbase.Data:=adisp.execSql(sql);
  except
  end;
  cmbmanager.Clear;
  for i:=1 to cdsbase.RecordCount do
  begin
    cmbmanager.Items.Add(cdsbase.fieldbyname('storage_name').AsString);
    cmb_no.Items.Add(cdsbase.fieldbyname('storage_no').AsString);
    cdsbase.Next;
  end;
  cmbmanager.ItemIndex:=0;
  cmb_no.ItemIndex:=0;
  cdsbase.Data:=null;
end;
procedure TfmBatchmanager.readdata;
var
  sql:widestring;
  i:integer;
begin
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    stringgrid1.Rows[i].Clear;
  end;
  stringgrid1.RowCount:=2;
  sql:='select storage_no,storage_name,area_no from storage  where  not storage_no  in ('+' select storageid from stock_manager where managerid='+''''+trim(cmb_no.Text)+''''+')';
  cdsview.Close;
  cdsview.Data:=null;
  try
  cdsview.Data:=adisp.execSql(sql);
  cdsview.Open;
  sql:=' select * from stock_manager where managerid='+''''+trim(cmb_no.Text)+'''';
  cdsbase.Close;
  cdsbase.Data:=null;
  cdsbase.Data:=adisp.execSql(sql);
  if cdsbase.RecordCount>0 then
  begin
    stringgrid1.RowCount:= cdsbase.RecordCount+1;
    for i:=1 to cdsbase.RecordCount do
    begin
      stringgrid1.Cells[0,i]:=inttostr(i);
      stringgrid1.Cells[1,i]:=trim(cdsbase.fieldbyname('storageid').AsString);
      stringgrid1.Cells[2,i]:=trim(cdsbase.fieldbyname('storagename').AsString);
      stringgrid1.Cells[3,i]:=trim(cdsbase.fieldbyname('area_no').AsString);
      cdsbase.Next;
    end;
    cdsbase.data:=null;
  end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
procedure  TfmBatchmanager.deleted;
var
  sql:widestring;
begin
  sql:='delete from stock_manager where managerid='+''''+trim(cmb_no.Text)+'''';
  try
  ipubtemp.scrapsate(sql);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
///////////////////////
procedure TfmBatchmanager.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBatchmanager.CmbmanagerChange(Sender: TObject);
begin
  inherited;
  cmb_no.ItemIndex:=cmbmanager.ItemIndex;
  readdata;
end;

procedure TfmBatchmanager.btnDeleteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if trim(btnDelete.Caption)='取消' then
  begin
    readdata;
    model(true);
  end else
  begin
    deleted;
    for i:=1 to stringgrid1.RowCount-1 do
    begin
      cdsview.Append;
     cdsview.fieldbyname('storage_no').AsString:=stringgrid1.Cells[1,i];
     cdsview.fieldbyname('storage_name').AsString:=stringgrid1.Cells[2,i];
     cdsview.fieldbyname('area_no').AsString:=stringgrid1.Cells[3,i];
     stringgrid1.Rows[i].Clear;
     cdsview.Post;
    end;
    stringgrid1.RowCount:=2;
  end;
end;

procedure TfmBatchmanager.btnAddClick(Sender: TObject);
begin
  inherited;
  model(false);

end;

procedure TfmBatchmanager.btnEditClick(Sender: TObject);
begin
  inherited;
  model(false);
end;

procedure TfmBatchmanager.btnSaveClick(Sender: TObject);
var
  i:integer;
  exesql:widestring;
begin
  inherited;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    if stringgrid1.Cells[1,i]='' then
    begin
      application.MessageBox('请选择管辖仓库！',pchar(application.Title),mb_iconinformation);
      stringgrid1.SetFocus;
      exit;
    end;
  end;
  deleted;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    exesql:='insert into stock_manager (managerid,storageid,managername,storagename,area_no) values ('+''''+trim(cmb_no.Text)+''''+','+''''+trim(stringgrid1.Cells[1,i])+''''+','+''''+trim(cmbmanager.Text)+''''+','+''''+trim(stringgrid1.Cells[2,i])+''''+','+''''+trim(stringgrid1.Cells[3,i])+''''+')';
    try
      ipubtemp.scrapsate(exesql);
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
    end;
  end;
  application.MessageBox('设置成功！',pchar(application.Title),mb_iconinformation);
  model(true);
end;

procedure TfmBatchmanager.DBGrid1DblClick(Sender: TObject);
var
  p:integer;
begin
  inherited;
  if not btnsave.Enabled then exit;
  if application.MessageBox('是否确定选中仓库为被配送管辖仓库？',pchar(application.Title),mb_iconinformation+mb_yesno)=idyes then
  begin
    p:= stringgrid1.RowCount;
    if trim(stringgrid1.Cells[1,1])<>'' then
    begin
      stringgrid1.RowCount := stringgrid1.RowCount+1;
      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=trim(cdsview.fieldbyname('storage_no').AsString);
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=trim(cdsview.fieldbyname('storage_name').AsString);
      stringgrid1.Cells[3,stringgrid1.RowCount-1]:=trim(cdsview.fieldbyname('area_no').AsString);
    end else
    begin
      stringgrid1.Cells[0,p-1]:=inttostr(p-1);
      stringgrid1.Cells[1,p-1]:=trim(cdsview.fieldbyname('storage_no').AsString);
      stringgrid1.Cells[2,p-1]:=trim(cdsview.fieldbyname('storage_name').AsString);
      stringgrid1.Cells[3,p-1]:=trim(cdsview.fieldbyname('area_no').AsString);
    end;
    cdsview.Delete;
    dbgrid1.Refresh;
  end;
end;

procedure TfmBatchmanager.StringGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not btnsave.Enabled then exit;
  if application.MessageBox('是否取消选中仓库为被配送管辖仓库？',pchar(application.Title),mb_iconinformation+mb_yesno)=idyes then
  begin
    cdsview.Append;
    cdsview.fieldbyname('storage_no').AsString:=stringgrid1.Cells[1,prow];
    cdsview.fieldbyname('storage_name').AsString:=stringgrid1.Cells[2,prow];
    cdsview.fieldbyname('area_no').AsString:=stringgrid1.Cells[3,prow];
    cdsview.Post;
    deletegridrows(stringgrid1,prow);
    dbgrid1.Refresh;
  end;
end;

procedure TfmBatchmanager.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmBatchmanager.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
end;

procedure TfmBatchmanager.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
  with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
  Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
  if gdFocused in State then
  Canvas.DrawFocusRect(Rect);
  end;

//不但水平居中，还垂直居中
  with Sender as Tstringgrid do
  begin
    Canvas.FillRect(Rect);
    s:=Cells[ACol,ARow];
    r:=Rect;
    DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;
end;

end.
