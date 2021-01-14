unit USetAgion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient,
  LabeledEditint;

type
  TfmSetAgion = class(TfmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    TreeBase: TTreeView;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cdsdata: TClientDataSet;
    edtagion: TLabeledEditint;
    edtmoney: TLabeledEditint;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeBaseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    function Empty(NO:string):integer;
    function ReadTree(Bm:string='';Tnode:TTreeNode=nil):integer;//(1：无数据，2：有数据，3：异常);
    function ReadAgion(no:string):boolean;
  public
    { Public declarations }
  end;

var
  fmSetAgion: TfmSetAgion;

implementation

uses func;

{$R *.dfm}
/////////////////////////////////
function TfmSetAgion.ReadAgion(no:string):boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  sql:='select agiomax,agiomoneymax from useragio where p_no='+''''+trim(no)+'''';
  cdsdata.Close;
  cdsdata.Data:=null;
  datas:=null;
  try
    datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      datas:=null;
      if not cdsdata.IsEmpty then
      begin
        edtagion.Text:=cdsdata.fieldbyname('agiomax').AsString;
        edtmoney.Text:=cdsdata.fieldbyname('agiomoneymax').AsString;
        result:=true;
      end;
    end
  except
  end;
  cdsdata.Close;
  cdsdata.Data:=null;
end;
function TfmSetAgion.Empty(NO:string):integer;
var
  sql:widestring;
  datas:olevariant;
  f:integer;
begin
  f:=1;
  try
    if trim(no)<>'' then
    begin
    sql:='select id from useragio where p_no='+''''+trim(No)+'''';
    end else
    begin
      sql:='select id from useragio';
    end;
    cdsdata.Close;
    cdsdata.Data:=null;
    datas:=null;
    ipubtemp.ty_query(sql,datas);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      datas:=null;
      cdsdata.Open;
      if not cdsdata.IsEmpty then
      begin
        f:=2;
      end ;
    end;
  except
    f:=3;
  end;
  result:=f;
end;
function TfmSetAgion.ReadTree(Bm:string='';Tnode:TTreeNode=nil):integer;
var
  sql:widestring;
  node:ttreenode;
  datas:olevariant;
  f:integer;
begin
  f:=1;
  if trim(bm)='' then
  begin
    sql:='select part_name as name,part_no as no from part where isnull(one_partno,'+''''+'0'+''''+')='+''''+'0'+'''';
  end else
  begin
    sql:='select p_no as no,employe_name as name from chang where part='+''''+trim(bm)+'''';
  end;
  datas:=null;
  cdsdata.Close;
  cdsdata.Data:=null;
  try
    ipubtemp.ty_query(sql,datas);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      datas:=null;
      cdsdata.Open;
      if not cdsdata.IsEmpty then
      begin
        while not cdsdata.Eof do
        begin
          if trim(bm)='' then
          begin
           node:=treebase.Items.add(tnode,trim(cdsdata.fieldbyname('no').AsString)+'_'+trim(cdsdata.fieldbyname('name').AsString));
          end else
          begin
            if (tnode.Count<cdsdata.RecordCount) and (tnode.Parent=nil) then 
            node:=treebase.Items.AddChild(tnode,trim(cdsdata.fieldbyname('no').AsString)+'_'+trim(cdsdata.fieldbyname('name').AsString));
          end;
          cdsdata.Next;
        end;
      end else
      begin
        f:=2;
      end;
    end;
  except
    f:=3;
  end;
  cdsdata.Close;
  cdsdata.Data:=null;
  result:=f;
end;

///////////////////////////////////
procedure TfmSetAgion.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmSetAgion.FormShow(Sender: TObject);
var
  i:integer;
  sql:widestring;
begin
  inherited;
  i:=empty('');
  if i=1 then
  begin
    sql:='insert into useragio (operater,p_no) select employe_name,p_no from chang';
    try
      adisp.updatesql(sql);
    except
    end;
  end;
  i:=ReadTree('',nil);
end;

procedure TfmSetAgion.TreeBaseClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if treebase.Selected<>nil then
  begin
    i:=ReadTree(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1),treebase.Selected);
    edtagion.Clear;
    edtmoney.Clear;
    if treebase.Selected.Parent<>nil then
    begin
      readagion(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1));
    end;
  end;
end;

procedure TfmSetAgion.btnOkClick(Sender: TObject);
var
  sql:widestring;
  i:integer;
begin
  inherited;
  if (trim(edtagion.Text)='') or (trim(edtmoney.Text)='') then
  begin
    application.MessageBox('请输入员工使用折扣标准！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if treebase.Selected.Parent<>nil then
   begin
      i:=empty(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1));
   end;
   case i of
    1: sql:='insert into useragio (operater,p_no,agiomax,agiomoneymax) values ('+''''+trim(copy(trim(treebase.Selected.Text),pos('_',trim(treebase.Selected.Text))+1,length(trim(treebase.Selected.Text))-pos('_',trim(treebase.Selected.Text))))+''''+','+''''+trim(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1))+''''+','+trim(edtagion.Text)+','+trim(edtmoney.Text)+')';
    2: sql:='update useragio set agiomax='+trim(edtagion.text)+',agiomoneymax='+trim(edtmoney.Text)+' where p_no='+''''+trim(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1))+'''';
   end;
  try
    adisp.updatesql(sql);
    application.MessageBox('设置成功！',pchar(application.Title),mb_iconinformation);
    exit;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

end.
