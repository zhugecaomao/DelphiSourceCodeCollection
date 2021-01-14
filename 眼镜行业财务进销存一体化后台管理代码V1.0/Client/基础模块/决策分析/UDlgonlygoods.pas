unit UDlgonlygoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, DB, DBClient, ExtCtrls;

type
  TDlgOnlyGoods = class(TfmBase)
    GroupBox1: TGroupBox;
    ckbnewDate: TCheckBox;
    Cbstorage: TCheckBox;
    cmbstorage: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cmbyear: TComboBox;
    cdspart: TClientDataSet;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    CBType: TComboBox;
    ckbtype: TCheckBox;
    cbBrand: TComboBox;
    ckbbrand: TCheckBox;
    CbBreed: TComboBox;
    ckbbreed: TCheckBox;
    RDg: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure CbstorageClick(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
    procedure RDgClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure cmbyearKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    pt,bz:boolean;

  public
    { Public declarations }
  end;

var
  DlgOnlyGoods: TDlgOnlyGoods;

implementation

uses untdatadm, func, onlygoods;

{$R *.dfm}

procedure TDlgOnlyGoods.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
  pt:=true;

  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
   ////////////////仓库
  t_sql:='select storageid from  [stock_manager] where managerid='+''''+trim(shopid)+'''';
  GetDataToComBoX(cmbstorage,t_sql,'storageid');
  cmbstorage.Items.Add('本仓库'+shopid);
  t_sql:='select managerid from  [stock_manager] where storageid='+''''+trim(shopid)+'''';
  cdspart.Close;
  cdspart.Data:=null;
  datas:=null;
  ipubtemp.ty_query(t_sql,datas);
  if not varisnull(datas) then
  begin
    cdspart.Data:=datas;
    cdspart.Open;
    datas:=null;
    cdspart.Close;
    cdspart.Data:=null;
    localb:=true;//是否有配送仓库；
  end else
  begin
    pt:=false; //
    localb:=pt;
  end;
  cmbstorage.ItemIndex := -1;
  cmbyear.Text:=formatdatetime('yyyy',date);
  RDgClick(rdg);
end;

procedure TDlgOnlyGoods.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure TDlgOnlyGoods.btnOkClick(Sender: TObject);
begin
  inherited;
  if (not ckbnewdate.Checked) then
  begin
    application.MessageBox('请选择销售年份！',pchar(application.Title),mb_iconinformation);
    ckbnewdate.SetFocus;
    exit;
  end;
  if bz then
  begin
    if not ckbbreed.Checked then
    begin
      application.MessageBox('请选择品种！',pchar(application.Title),mb_iconinformation);
      ckbbreed.SetFocus;
      exit;
    end;
  end else
  begin
    if not ckbcode.Checked then
    begin
      application.MessageBox('请输入商品编号！',pchar(application.Title),mb_iconinformation);
      ckbcode.SetFocus;
      exit;
    end;
  end;
  if cbstorage.Checked then fmonlygoods.stockid:=trim(cmbstorage.Text);
  fmonlygoods.Fb:=bz;
  fmonlygoods.typed:=trim(cbtype.text);
  fmonlygoods.brand:=trim(cbbrand.text);
  fmonlygoods.breed:=trim(cbbreed.text);
  fmonlygoods.no:=trim(edtcode.Text);
  fmonlygoods.years:=trim(cmbyear.Text);
  close;
end;

procedure TDlgOnlyGoods.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TDlgOnlyGoods.CbstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbstorage,cmbstorage);
end;

procedure TDlgOnlyGoods.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbnewdate,cmbyear);
end;

procedure TDlgOnlyGoods.RDgClick(Sender: TObject);
var
  t_sql:widestring;
begin
  inherited;
  case rdg.ItemIndex of
  0:
  begin
    ckbCode.Enabled:=false;
    ckbtype.Enabled:=true;
    ckbbrand.Enabled:=true;
    ckbbreed.Enabled:=true;
    bz:=true;
    t_sql:='select * from  [goods_type]';
    GetDataToComBoX(cbtype,t_sql,'type');
    cbtype.ItemIndex := -1;
  end;
  1:
  begin
    ckbtype.Enabled:=false;
    ckbbrand.Enabled:=false;
    ckbbreed.Enabled:=false;
    ckbcode.Enabled:=true;
    ckbcode.Checked:=true;
    bz:=false;
  end;
  end;
end;

procedure TDlgOnlyGoods.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;
end;

procedure TDlgOnlyGoods.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TDlgOnlyGoods.ckbtypeClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbtype,cbtype);
  CBTypeChange(cbtype);
end;

procedure TDlgOnlyGoods.ckbbrandClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TDlgOnlyGoods.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TDlgOnlyGoods.cmbyearKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key<>#13 then key:=#0;
end;

end.
