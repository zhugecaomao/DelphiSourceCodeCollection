{往来单位资料}

unit Untwldw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask,db;

type
  Tfmwldw = class(TfmBase)
    Panel21: TPanel;
    Panel22: TPanel;
    edtcode: TLabeledEdit;
    btnSelect: TSpeedButton;
    btnExit: TBitBtn;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    procedure btnExitClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtcodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Model(bl:Boolean);
  public
    { Public declarations }
  end;

var
  fmwldw: Tfmwldw;

implementation

uses untdatadm, func;

{$R *.dfm}
procedure Tfmwldw.Model(bl:Boolean);
var
  i:Integer;
begin
  btnAdd.Enabled:=bl;
  btnEdit.Enabled:=bl;
  btnDelete.Enabled:=bl;
  btnSelect.Enabled:=bl;
  edtCode.Enabled:=bl;
  btnSave.Enabled:=not bl;
  btnCancel.Enabled:=not bl;
  for i:=0 to self.ComponentCount-1 do
  begin
    if self.Components[i] is TDBEdit then
    begin
      TDBEdit(self.Components[i]).ReadOnly:=bl;
      if bl=false then TDBEdit(self.Components[i]).Color:=clInfoBk
      else TDBEdit(self.Components[i]).Color:=clCream;
    end;
    if self.Components[i] is TDBMemo then
    begin
      TDBMemo(self.Components[i]).ReadOnly:= bl;
      if bl=false then TDBMemo(self.Components[i]).Color:=clInfoBk
      else TDBMemo(self.Components[i]).Color:=clCream;
    end;
  end;
  dbedit2.ReadOnly:=true;
end;
procedure Tfmwldw.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmwldw.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  dbedit2.Text:=selectpy(dbedit1.Text);
end;

procedure Tfmwldw.btnAddClick(Sender: TObject);
begin
  inherited;
  Model(false);
  //dmmain.SocketConn.AppServer.batchguest(trim(sql));
  if  dmmain.cdssupply_company.Active then dmmain.cdssupply_company.close;
  dmmain.cdssupply_company.Params.ParamByName('no').AsString:='@';
  try
    dmmain.cdssupply_company.Open;
    dmmain.cdssupply_company.Append;
    dbedit1.SetFocus;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tfmwldw.btnSelectClick(Sender: TObject);
begin
  inherited;
   if edtCode.Text<>'' then
  begin
    if  dmmain.cdssupply_company.Active then dmmain.cdssupply_company.close;
    dmmain.cdssupply_company.Params.ParamByName('no').AsString:=trim(edtcode.Text);
    try
    dmmain.cdssupply_company.Open;
    if dmmain.cdssupply_company.IsEmpty then
    begin
      application.MessageBox(pchar('没有找到客户编号为：'+trim(edtcode.Text)+'的客户！'),pchar(application.Title),mb_iconinformation);
      exit; 
    end;
    except
       application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
  end;
end;

procedure Tfmwldw.btnEditClick(Sender: TObject);
begin
  inherited;
  if not dmmain.cdssupply_company.Active then
  begin
    Application.MessageBox('没有记录可以修改!','提示信息',mb_iconwarning);
    exit;
  end;
  if (dmmain.cdssupply_company.recordcount = 0)  then
  begin
    Application.MessageBox('没有记录可以修改!','提示信息',mb_iconwarning);
    exit;
  end;
  Model(false);
  dbedit3.ReadOnly:=true;
  dbedit3.Color:=clCream;
  dbedit13.ReadOnly:=true;
  dbedit14.ReadOnly:=true;
  dbedit17.ReadOnly:=true;
  dbedit18.ReadOnly:=true;
  dbedit13.Color:=clCream;
  dbedit14.Color:=clCream;
  dbedit17.Color:=clCream;
  dbedit18.Color:=clCream;
  dmmain.cdssupply_company.Edit;
  dbedit1.SetFocus;
end;

procedure Tfmwldw.btnSaveClick(Sender: TObject);
begin
  inherited;
   with dmmain.cdssupply_company do
  begin
    if state in [dsInsert] then
    begin
      if dbedit3.Text='' then
      begin
        Application.MessageBox('用户编号不能为空!','提示信息',mb_iconwarning);
        dbedit3.SetFocus;
        exit;
      end;
    end;
    Model(true);
    Post;
    try
    ApplyUpdates(-1); //
    except
       application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
  end;
end;

procedure Tfmwldw.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if not dmmain.cdssupply_company.Active then
  begin
    Application.messagebox('请指定客户编号!', '提示信息', mb_iconwarning + mb_defbutton1);
    exit;
  end;
  if dmmain.cdssupply_company.recordcount <> 0 then
  begin
    if Application.messagebox('确认要删除该记录吗？', '提示信息', mb_iconQuestion + mb_yesno) = idyes then
    begin
      dmmain.cdssupply_company.delete;
      try
      dmmain.cdssupply_company.applyupdates(-1); //applydatetime(-1);
      except
         application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
         exit;
      end;
    end;
  end
  else
  begin
    Application.messagebox('没有记录可删除!', '提示信息', mb_iconwarning + mb_defbutton1);
  end;
end;

procedure Tfmwldw.btnCancelClick(Sender: TObject);
begin
  inherited;
  Model(true);
  with dmmain.cdssupply_company do
  begin
    if state in [dsInsert,dsEdit] then
    Cancel;
  end;
end;

procedure Tfmwldw.FormShow(Sender: TObject);
begin
  inherited;
  Model(true);
 
end;

procedure Tfmwldw.edtcodeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key=#13 then btnselect.Click;
end;

procedure Tfmwldw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmmain.cdssupply_company.Close;
  dmmain.cdssupply_company.Data:=null;
  inherited;
end;

end.
