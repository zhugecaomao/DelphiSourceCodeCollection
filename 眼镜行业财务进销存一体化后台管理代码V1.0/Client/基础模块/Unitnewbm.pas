unit Unitnewbm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XPMenu,db,DBClient;

type
  Tfrmnewbm = class(TForm)
    Panel1: TPanel;
    edtbmdm: TLabeledEdit;
    edtbmmc: TLabeledEdit;
    edtksjc: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    mremark: TMemo;
    cmbsjbm: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cmbstock: TComboBox;
    edtyb: TLabeledEdit;
    edtphone: TLabeledEdit;
    edtFzr: TLabeledEdit;
    edtaddress: TLabeledEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtbmmcExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbsjbmKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure onebm(p:tstringlist);
  public
    { Public declarations }
    flag:integer;
  end;

var
  frmnewbm: Tfrmnewbm;
  ybm:string;
implementation

uses func, Data, untdatadm, Unitdwzy;


{$R *.dfm}
procedure tfrmnewbm.onebm(p:tstringlist);
var
  i:integer;
begin
  if p.Count<>0 then
  begin
    for i:=0 to p.Count-1 do
    begin
      cmbsjbm.Items.Add(p.Strings[i]);
    end;
  end;

end;
procedure Tfrmnewbm.BitBtn2Click(Sender: TObject);
begin
  flag:=0;
  close;
end;

procedure Tfrmnewbm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmnewbm.BitBtn1Click(Sender: TObject);
var
  sqlpubs:widestring;
begin
  if (edtbmmc.Text ='') or (edtbmdm.Text ='') then
  begin
    if edtbmmc.Text='' then
    begin
      application.MessageBox('请输入部门名称！',pchar(application.Title),mb_iconwarning);
      edtbmmc.SetFocus;
      exit;
    end;
    if edtbmdm.Text='' then
    begin
      application.MessageBox('请输入部门编号！',pchar(application.Title),mb_iconwarning);
      edtbmdm.SetFocus;
      exit;
    end;
  end else
  begin
    if flag=1 then
    begin
      dmmain.cdspart.Params.ParamByName('no').AsString:='0';
    end else
    begin
      dmmain.cdspart.Params.ParamByName('no').AsString:=trim(edtbmdm.text);
    end;
    try
      dmmain.cdspart.Open;
    except
       application.MessageBox('服务器故障！',pchar(application.Title),mb_iconwarning);
       exit;
    end;
    if flag=1 then   //新增部门信息
    begin
      dmmain.cdspart.Insert;
      dmmain.cdspart.FieldByName('part_no').AsString:=trim(edtbmdm.Text);
      /////////////////////\
    end else
    begin
      dmmain.cdspart.Edit;
    end;
    dmmain.cdspart.FieldByName('part_name').AsString:=trim(edtbmmc.Text);
    dmmain.cdspart.FieldByName('part_code').AsString:=trim(edtksjc.Text);
    dmmain.cdspart.FieldByName('remark').AsString:=trim(mremark.Text);
    dmmain.cdspart.FieldByName('one_partname').AsString:=trim(cmbsjbm.Text);
    dmmain.cdspart.FieldByName('storageid').AsString:=trim(cmbstock.Text);
    dmmain.cdspart.FieldByName('yzbm').AsString:=trim(edtyb.Text);
    dmmain.cdspart.FieldByName('phone').AsString:=trim(edtphone.Text);
    dmmain.cdspart.FieldByName('fzr').AsString:=trim(edtfzr.Text);
    dmmain.cdspart.FieldByName('address').AsString:=trim(edtaddress.Text);
    if cmbsjbm.ItemIndex>=0 then
    dmmain.cdspart.FieldByName('one_partno').AsString:=trim(p_name.Strings[cmbsjbm.itemindex]);
    dmmain.cdspart.Post;
    try
      dmmain.cdspart.ApplyUpdates(-1);
      if flag=1 then   //新增时，创建部门财务主帐；
      begin
        sqlpubs:='insert accountshoptable (accountid,accountname,accounttype,usercode,total,level,parid,soncount,issysrow,deleted,comment,ShopNo)'
  +'select accountid,accountname,accounttype,usercode,0,level,parid,soncount,issysrow,deleted,comment,'+''''+trim(edtbmdm.Text)+''''+' from accounttable';
        adisp.updatesql(sqlpubs);
      end;
    except
       application.MessageBox('服务器故障，更新失败！',pchar(application.Title),mb_iconwarning);
       exit;
    end;
    flag:=0;
    frmzyll.EditBM:=1;
    close;
  end;
end;

procedure Tfrmnewbm.FormShow(Sender: TObject);
var
  temp:widestring;
  cds:tclientdataset;
begin
  ybm:=trim(edtbmmc.Text);
   temp:='select * from storage ';
  cds:=TClientDataSet.Create(nil);
  cds.Data:=adisp.execSql(temp);
  cds.Open;
  while not cds.Eof do
  begin
    cmbstock.Items.Add(cds.fieldbyname('storage_no').AsString);
    cds.Next;
  end;
  cds.Free;
  cds:=nil;
  if flag=1 then onebm(partname);
end;

procedure Tfrmnewbm.edtbmmcExit(Sender: TObject);
begin
  edtksjc.Text:=selectpy(trim(edtbmmc.Text)); //拼音转换;
end;

procedure Tfrmnewbm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    VK_ESCAPE: Close;
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if screen.ActiveControl is TCustomEdit then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;

end;

procedure Tfrmnewbm.cmbsjbmKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then key:=#0;
end;

end.
