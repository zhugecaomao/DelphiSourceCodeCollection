unit Usysteminit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls, DB,inifiles;

type
  Tfrmsysteminit = class(Tfrmbase)
    Panel1: TPanel;
    TVstock: TTreeView;
    DBGrid1: TDBGrid;
    dsstock: TDataSource;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVstockClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    f:tinifile;
    company:string;//公司名
    procedure treevinit; //加载；
    function treestring:boolean;//显示详细内容
  public
    { Public declarations }
  end;

var
  frmsysteminit: Tfrmsysteminit;

implementation

uses func, untdatadm, Ustockinit;

{$R *.dfm}
function tfrmsysteminit.treestring:boolean;
var
  temp:widestring;
begin
  if tvstock.Selected<> nil then
  begin
    temp:='select * from storage where storage_no='+''''+trim(copy(tvstock.Selected.Text,1,pos('__',trim(tvstock.Selected.Text))-1))+'''';
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    dmmain.CDSquery.Data:=adisp.GetRecord(temp);
    dmmain.CDSquery.Open;
  end;
end;
procedure tfrmsysteminit.treevinit;
var
  temp:widestring;
  node1,node2,node3:ttreenode;
begin
  f:=TIniFile.Create(ExtractFileDir(application.Exename)+'\Base_Set.ini');
  //f.WriteString('CompanyInformation','Company_Name',trim(E2.Text));
  company:=f.ReadString('CompanyInformation','Company_Name',''); 
  tvstock.Items.Clear;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  temp:='select storage_no,storage_name from storage where f_no='+''''+''+'''';
  dmmain.CDSquery.Data :=adisp.GetRecord(temp);
  try
  dmmain.CDSquery.Open;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  node1:=tvstock.Items.Add(nil,company);
  while not dmmain.CDSquery.Eof do
  begin
    temp:='select storage_no,storage_name from storage where f_no ='+''''+trim(dmmain.CDSquery.fieldbyname('storage_no').AsString)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Data:=adisp.resultrecord(temp);
    try
    dmmain.CDSquery2.Open;
    except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
    end;
    node2:=tvstock.Items.AddChild(node1,trim(dmmain.CDSquery.fieldbyname('storage_no').AsString)+'__'+trim(dmmain.CDSquery.fieldbyname('storage_name').AsString));
    while not dmmain.CDSquery2.Eof do
    begin
      node3:=tvstock.Items.AddChild(node2,trim(dmmain.CDSquery2.fieldbyname('storage_no').AsString)+'__'+trim(dmmain.CDSquery2.fieldbyname('storage_name').AsString));
      dmmain.CDSquery2.Next;
    end;
    dmmain.CDSquery.Next;
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery2.Close;
end;
procedure Tfrmsysteminit.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrmsysteminit.BitBtn3Click(Sender: TObject);
var
  temp:widestring;
  flag:olevariant;
begin
  inherited;
  if tvstock.Selected<>nil then
  begin
    if application.MessageBox('是否确定删除仓库信息？',pchar(application.Title),mb_iconinformation+mb_yesno)=idyes then
    begin
      temp:='delete from storage where storage_no='+''''+trim(copy(tvstock.Selected.Text,1,pos('__',trim(tvstock.Selected.Text))-1))+'''';
      flag:=adisp.updatesql(temp);
      if vartostr(flag)='1' then
      begin
        temp:='update storage set f_no='+''''+''+''''+' where f_no='+''''+trim(copy(tvstock.Selected.Text,1,pos('__',trim(tvstock.Selected.Text))-1))+'''';
        flag:=adisp.updatesql(temp);
      end;
      if vartostr(flag)='1' then
      begin
        TVstock.Items.Delete(TVstock.Selected );
        application.MessageBox('操作成功！',pchar(application.Title),mb_iconinformation);
        exit;
      end else
      begin
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
    end;
  end;
  treevinit;
end;

procedure Tfrmsysteminit.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if tvstock.Selected<> nil then
  if (tvstock.Selected.Parent<>nil) then
  begin
    if (trim(tvstock.Selected.Parent.Text)<>company) then exit;
  end;
  frmstockinit:=tfrmstockinit.Create(self);
  frmstockinit.flag:=1;
  if tvstock.Selected.Parent<>nil then
  BEGIN
    if trim(tvstock.Selected.Parent.Text)=company then
    frmstockinit.f_no.Text:=trim(copy(tvstock.Selected.Text,1,pos('__',trim(tvstock.Selected.Text))-1));
  end;
  frmstockinit.ShowModal;
  treevinit;
  tvstock.FullExpand;
end;

procedure Tfrmsysteminit.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if tvstock.Selected<>nil then
  begin
    frmstockinit:=tfrmstockinit.Create(self);
    frmstockinit.flag:=2;
    frmstockinit.edtno.Text:=dmmain.CDSquery.fieldbyname('storage_no').AsString;
    frmstockinit.edtname.Text:=dmmain.CDSquery.fieldbyname('storage_name').AsString;
    frmstockinit.edtfax.Text:=dmmain.CDSquery.fieldbyname('fax').AsString;
    frmstockinit.edtzip.Text:=dmmain.CDSquery.fieldbyname('zip').AsString;
    frmstockinit.edtaddress.Text:=dmmain.CDSquery.fieldbyname('address').AsString;
    frmstockinit.edtdx.Text:=dmmain.CDSquery.fieldbyname('volume').AsString;
    frmstockinit.cmbry.Text:=dmmain.CDSquery.fieldbyname('manager').AsString;
    frmstockinit.cmbtype.Text:=dmmain.CDSquery.fieldbyname('storage_type').AsString;
    frmstockinit.cmbdq.Text:=dmmain.CDSquery.fieldbyname('area_no').AsString;
    frmstockinit.edtphone.Text:=dmmain.CDSquery.fieldbyname('telphone').AsString;
    frmstockinit.f_no.Text:=dmmain.CDSquery.fieldbyname('f_no').AsString;
    frmstockinit.edtno.Enabled:=false;
    if dmmain.CDSquery.fieldbyname('Type_Flag').AsString='0' then
    begin
      frmstockinit.R1.Checked:=true;
    end else
    begin
      frmstockinit.R1.Checked :=false;
    end;
    frmstockinit.ShowModal;
  end;
end;

procedure Tfrmsysteminit.FormShow(Sender: TObject);
begin
  inherited;
  treevinit;
end;

procedure Tfrmsysteminit.TVstockClick(Sender: TObject);
begin
  inherited;
  treestring;
end;

procedure Tfrmsysteminit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   f.Free;
  f:=nil;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=NULL;
  inherited;
end;

procedure Tfrmsysteminit.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnedit.Click;
end;

end.
