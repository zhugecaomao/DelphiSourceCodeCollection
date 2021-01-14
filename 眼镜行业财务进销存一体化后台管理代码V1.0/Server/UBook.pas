unit UBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids,Registry,ADODB;

type
  TFmBook = class(TForm)
    Label1: TLabel;
    dataGrid: TStringGrid;
    BtnSelect: TBitBtn;
    BitBtn4: TBitBtn;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    Btnback: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dataGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dataGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnbackClick(Sender: TObject);
  private
    { Private declarations }
    pcol,prow:integer;
    MODEL:STRING;
    function ReadData():boolean;
    function PingData(DataB:string):boolean;
  public
    { Public declarations }
    DBname,DBREmark:string;
  end;

var
  FmBook: TFmBook;

implementation

uses Chain_Data, UNewDb, Unitpubsub;

{$R *.dfm}
////////////////////////////
function tfmbook.ReadData():boolean;
var
  AdoQ:TAdoquery;
  i:integer;
begin
  result:=false;
  AdoQ:=TAdoquery.Create(nil);
  adoq.Connection:=frm_Chain_Data.ADOConnMaster;
  AdoQ.SQL.Clear;
  AdoQ.SQL.Text:='select * from Mbooks';
  try
    AdoQ.Open;
    if not adoq.IsEmpty then
    begin
      datagrid.RowCount:=adoq.RecordCount+1;
      for i:=1 to adoq.RecordCount do
      begin
        datagrid.Cells[0,i]:=inttostr(i);
        datagrid.Cells[1,i]:=trim(adoq.fieldbyname('SysDBname').AsString);
        datagrid.Cells[2,i]:=trim(adoq.fieldbyname('SysDBremark').AsString);
        if adoq.fieldbyname('SysUse').AsBoolean then
        begin
          datagrid.Cells[3,i]:=trim('是');
        end else
        begin
          datagrid.Cells[3,i]:=trim('否');
        end;
        adoq.Next;
      end;
    end;
    adoq.Close;
    adoq.Free;
    adoq:=nil;
    result:=true;
  except
  end;
end;

function tfmbook.pingdata(DataB:string):boolean;
var
  reg:treginifile;
  fwqm,yhm,mm,sjkm,ms:string;
begin
  result:=false;
  //if (pcol=0) and (prow=0) then exit;
  reg:=treginifile.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;
  fwqm:=reg.ReadString('\software\manager_sales','服务器名','');                                  //;User ID='+trim(yhm)+';password='+trim(mm)+'
  yhm:=reg.ReadString('\software\manager_sales','用户名称','');
  mm:=reg.ReadString('\software\manager_sales','用户密码','');
  ms:= reg.ReadString('\software\manager_sales','连接模式','');
  model:=ms;
  with frm_Chain_Data do
  begin
    if ADO_Connection.Connected then  ADO_Connection.Connected:=false;
    ADO_Connection.DefaultDatabase:=trim(DataB);
    if trim(ms)='2' then
    begin
      ADO_Connection.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+trim(yhm)+';password='+trim(mm)+';Initial Catalog='+trim(DataB)+';Data Source='+trim(fwqm);
    end;
    if trim(ms)='1' then
    begin
      ADO_Connection.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+trim(DataB)+';Data Source='+trim(fwqm);
    end;
    try
    ADO_Connection.Connected:=true;
    result:=true;
    except
      Application.MessageBox('数据库连接错误,请重新注册!','错误',mb_iconwarning);
      reg.Free;
      exit;
    end;
  end;

end;
////////////////////////////
procedure TFmBook.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFmBook.BtnSelectClick(Sender: TObject);
var
  adoB:TAdoquery;
  reg:treginifile;
begin
  if (prow=0) or (trim(datagrid.Cells[1,prow])='') then exit;
  if pingdata(trim(datagrid.Cells[1,prow])) then
  begin
  adob:=TAdoquery.Create(nil);
  adob.Connection:=frm_Chain_Data.ADOConnMaster;
  adob.Close;
  adob.SQL.Clear;
  adob.SQL.Text:='update mbooks set Sysuse=0';
  aDOB.ExecSQL;
  ADOB.Close;
  ADOB.SQL.Clear;
  adob.SQL.Text:='update mbooks set Sysuse=1 WHERE sysdbname='+''''+trim(datagrid.Cells[1,prow])+'''';
  aDOB.ExecSQL;
  ADOB.Close;
  adob.Free;
  adob:=nil;
  ////////////////////////////
  reg:=treginifile.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;
  reg.WriteString('\software\manager_DB','数据库名称',trim(datagrid.Cells[1,prow]));
  reg.WriteString('\software\manager_DB','连接模式',model);
  reg.free;
  ////////////////////////////
  Application.MessageBox('成功选择帐套','提示',mb_iconinformation);
  close;
  end;
end;

procedure TFmBook.FormShow(Sender: TObject);
var
  adoB:TAdocommand;
  s:string;
begin
  datagrid.ColWidths[0]:=30;
  datagrid.Cells[0,0]:='序号';
  datagrid.Cells[1,0]:='帐套名称';
  datagrid.Cells[2,0]:='帐套说明';
  datagrid.Cells[3,0]:='正在使用';
  if not readdata then
  begin
    adob:=TAdocommand.Create(nil);
    adob.Connection:=frm_Chain_Data.ADOConnMaster;
    //s:=ExtractFilePath(application.ExeName)+'SysDBManager.txt';
    //adob.LoadFromFile(ExtractFilePath(application.ExeName)+'SysDBManager.txt');
    adob.CommandText:='create table Mbooks ( [ID] [int] IDENTITY (1, 1) NOT NULL ,'+
                      'sysdbname [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,'+
                      'sysdbremark [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,sysuse [bit]   NULL)' ;
    adob.Execute;
    adob.Free;
    adob:=nil;
    readdata;
  end;
end;

procedure TFmBook.dataGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
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

procedure TFmBook.btnAddClick(Sender: TObject);
var
  adob,adoc:tadoquery;
  i:integer;
  s:string;
begin
  screen.Cursor := crhourglass;
  dbname:='';
  FmNewDb:=tFmNewDb.Create(self);
  FmNewDb.ShowModal;
  FmNewDb.Free;
  if trim(dbname)<>'' then
  begin
    datagrid.RowCount:=datagrid.RowCount+1;
    datagrid.Cells[0,datagrid.RowCount-1]:= inttostr(datagrid.RowCount-1);
    datagrid.Cells[1,datagrid.RowCount-1]:= dbname;
    datagrid.Cells[2,datagrid.RowCount-1]:= dbremark;
    datagrid.Cells[3,datagrid.RowCount-1]:= '否';
    adob:=tadoquery.Create(nil);
    adob.Connection:=frm_Chain_Data.ADOConnMaster;
    adob.SQL.Text:=' create database '+trim(dbname);
    adob.ExecSQL;
    adob.Close;
    ///////////////////////
    winexec(pchar('isqlw -S ('+trim(servername)+') -d '+trim(dbname)+' -U sa -P -i '+trim(ExtractFilePath(application.ExeName)+'SysDBcreate.sql')+'  -o  '+trim(ExtractFilePath(application.ExeName)+'Flag.txt')),SW_HIDE);
    adob.Close;
    adob.SQL.Clear;
    adob.SQL.Text:=' insert into Mbooks values ('+''''+trim(dbname)+''''+','+''''+trim(dbremark)+''''+','+'0'+')';
    adob.ExecSQL;
    adob.Close;
    adob.Free;
    adob:=nil;
    //////////////////////
  end;
  screen.Cursor :=  crdefault;
end;

procedure TFmBook.btnDeleteClick(Sender: TObject);
var
  adob:tadocommand;
begin
  adob:=TAdocommand.Create(nil);
  frm_Chain_Data.ADO_Connection.Connected:=false;
  frm_Chain_Data.ADO_Connection.Close;
  adob.Connection:=frm_Chain_Data.ADOConnMaster;
  adob.CommandText:='drop database '+trim(datagrid.Cells[1,prow]);
  adob.Execute;
  adob.CommandText:='delete from Mbooks where sysdbname='+''''+trim(datagrid.Cells[1,prow])+'''';
  adob.Execute;
  adob.Free;
  adob:=nil;

end;

procedure TFmBook.dataGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure TFmBook.BtnbackClick(Sender: TObject);
var
  savedlg:tsavedialog;
  b:boolean;
begin
  if prow=0 then
  begin
    application.MessageBox('请选择备份帐套！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  savedlg:=tsavedialog.Create(nil);
  if savedlg.Execute then
  begin
    b:=backDB(frm_Chain_Data.ADOConnMaster,trim(savedlg.FileName),trim(datagrid.Cells[1,prow]));
  end;
  if b then
  begin
    application.MessageBox('备份帐套成功！',pchar(application.Title),mb_iconinformation);
  end else
  begin
    application.MessageBox('备份帐套失败，请重新备份！',pchar(application.Title),mb_iconinformation);
  end;
  savedlg.Free;
  savedlg:=nil;
end;

end.
