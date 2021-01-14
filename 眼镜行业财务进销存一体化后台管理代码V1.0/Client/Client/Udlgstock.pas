{查询条件}
unit Udlgstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons;

type
  Tdlgstock = class(TfmBase)
    GroupBox1: TGroupBox;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    ckbName: TCheckBox;
    edtName: TEdit;
    ckbtype: TCheckBox;
    ckbbrand: TCheckBox;
    edtbrand: TEdit;
    edttype: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Cbbreed: TCheckBox;
    Edtbreed: TEdit;
    Cbprovider: TCheckBox;
    Edtprovider: TEdit;
    Cbstorage: TCheckBox;
    Edtstorage: TEdit;
    cbamount: TCheckBox;
    edtamount: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbNameClick(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure CbbreedClick(Sender: TObject);
    procedure CbproviderClick(Sender: TObject);
    procedure CbstorageClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure edtamountKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    showmode:integer;
  end;

var
  dlgstock: Tdlgstock;

implementation

uses untdatadm, func, Ustockstates, Untwarn_limit, Untlimitgoods, Ustocking;

{$R *.dfm}

procedure Tdlgstock.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgstock.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure Tdlgstock.ckbNameClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbname,edtname);
end;

procedure Tdlgstock.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbtype,edttype);
end;

procedure Tdlgstock.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbbrand,edtbrand);
end;

procedure Tdlgstock.CbbreedClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbbreed,edtbreed);
end;

procedure Tdlgstock.CbproviderClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbprovider,edtprovider);
end;

procedure Tdlgstock.CbstorageClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbstorage,edtstorage);
end;

procedure Tdlgstock.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure Tdlgstock.edtamountKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8,#13]) then key:=#0;
end;

procedure Tdlgstock.btnOkClick(Sender: TObject);
var
  str,str1:string;
  temp:widestring;
begin
  inherited;
    str:='';
    if ckbCode.Checked then str:=str+'and goods_no='+''''+trim(edtCode.Text)+'''';
    if ckbNaME.Checked then str:=str+'and goods_name='+''''+trim(edtname.Text)+'''';
    //if ckbShop.Checked then str:=str+'and OI_Shop='+''''+trim(edtShop.Text)+'''';
    if ckbtype.Checked then str:=str+'and type='+''''+trim(edttype.Text)+'''';
    if ckbbrand.Checked then str:=str+'and brand='+''''+trim(edtbrand.Text)+'''';
    if cbbreed.Checked then str:=str+'and breed='+''''+trim(edtbreed.Text)+'''';
    if cbprovider.Checked then str:=str+'and provider='+''''+trim(edtprovider.Text)+'''';
    if cbstorage.Checked then
    begin
      str:=str+'and storage_no='+''''+trim(edtstorage.Text)+'''';
      str1:=trim(edtstorage.Text);
    end;
    if cbamount.Checked then str:=str+'and stock_amount='+trim(edtamount.Text);
  screen.Cursor :=  crHourGlass;
  if showmode=0 then //库存状况表
  begin
    temp:=frmstockstates.tempsql+frmstockstates.tables+str;
  end;
  if showmode=1 then //库存预警表
  begin
    temp:=fmstockwarnlimit.tempsql+fmstockwarnlimit.tables+fmstockwarnlimit.tj+str;
  end;
  ///////////////////////////////////
  if showmode=2 then //库存预警明细
  begin
    temp:=fmlimitgoods.tempsql+fmlimitgoods.tables+fmlimitgoods.tj+str;
    fmlimitgoods.tj:=fmlimitgoods.tj+str;
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
  end;
  if showmode=3 then
  begin
    fmstocking.storage:=str1;
    temp:=fmstocking.tables+inttostr(fmstocking.LocalCount)+fmstocking.tempsql+','+''''+trim(fmstocking.storage)+'''';
  end;
  dmmain.cDSquery.Close;
  dmmain.cDSquery.Data:=null;
  try
  dmmain.CDSquery.Data:=adisp.GetRecord(temp);
  dmmain.CDSquery.Open;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  screen.Cursor :=  crdefault;
  close;

end;

procedure Tdlgstock.FormShow(Sender: TObject);
begin
  inherited;
  if showmode=3 then
  begin
    ckbcode.Enabled:=false;
    ckbname.Enabled:=false;
    ckbtype.Enabled:=false;
    ckbbrand.Enabled:=false;
    cbbreed.Enabled:=false;
    cbprovider.Enabled :=false;
    cbamount.Enabled:=false;
  end;
end;

end.
