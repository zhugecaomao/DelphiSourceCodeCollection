unit UPosGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, Menus,
  DBClient;

type
  TfmPosGoods = class(TfmBase)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbtop: TComboBox;
    btnauto: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    dsview: TDataSource;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    Cbstorage: TCheckBox;
    cmbstorage: TComboBox;
    cdspart: TClientDataSet;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnautoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure CbstorageClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    LocalCount:integer;
  public
    { Public declarations }
     tj:string;
    tempsql,tables:string;
  end;

var
  fmPosGoods: TfmPosGoods;

implementation

uses func, untdatadm, fm_SetColumn, UdlgPosGoods;

{$R *.dfm}

procedure TfmPosGoods.BitBtn4Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
begin
  inherited;
   tables:=' id,VCOfficeID,goods_no,goods_name,stock_amount,NQty, NSendQty, totalamount,saleamount from [vpssq] where 1=1 ';//+tj+' group by VCOfficeID,goods_no,goods_name,stock_amount,NQty, NSendQty, totalamount,id';
  dmmain.cdsquery2.Close;
    dmmain.cdsquery2.Data:=null;
      tj:=' and storage_no='+''''+trim(shopid)+'''';
    if ckbtype.Checked then tj:=tj+' and type='+''''+trim(cbtype.Text)+'''';
    if ckbbrand.Checked then tj:=tj+' and brand='+''''+trim(cbbrand.Text)+'''';
    if ckbbreed.Checked then tj:=tj+' and breed='+''''+trim(cbbreed.Text)+'''';
    if cbstorage.Checked then tj:=tj+' and vcofficeid='+''''+trim(cmbstorage.Text)+'''';
    if ckbCode.Checked then tj:=tj+' and goods_no='+''''+trim(edtCode.Text)+'''';
    ///////////////////////////////////
  screen.Cursor :=  crHourGlass;
  dbgrid1.Visible:=true;
  temp:=tempsql+tables+tj+' group by VCOfficeID,goods_no,goods_name,stock_amount,NQty, NSendQty, totalamount,id,saleamount';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  datas:=null;
  try
    datas:=adisp.resultrecord(temp);
    if not varisnull(datas) then
    begin
      dmmain.CDSquery2.Data:=datas;
      dmmain.CDSquery2.Open;
      btnauto.Enabled:=true;
      datas:=null;
    end else
    begin
      application.MessageBox('没有门店申请的商品数据！',pchar(application.Title),mb_iconinformation);
      screen.Cursor :=  crdefault;
      exit;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  dmmain.CDSquery2.Last;
  LocalCount := GetKeyFieldValue('id',dmmain.cdsquery2);   //传入具体字段
  screen.Cursor :=  crdefault;

end;

procedure TfmPosGoods.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  ////////////////仓库
  t_sql:='select part_no from  [stock_manager] as a ,part as b  where a.storageid=b.storageid and managerid='+''''+trim(shopid)+'''';
  GetDataToComBoX(cmbstorage,t_sql,'part_no');
  cmbstorage.ItemIndex := -1;
  dbgCur:=dbgrid1;
  cmbtop.ItemIndex:=0;
  tempsql:=' select  top '+trim(cmbtop.Text);
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
end;

procedure TfmPosGoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
end;

procedure TfmPosGoods.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  datas:=null;
  if not dmmain.cDSquery2.Active then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.cdsquery2.DisableControls;
   temp:=tempsql+tables+tj+' and id>'+inttostr(localcount);
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Open;
  dmmain.CDSquery2.AppendData(datas,true);
  dmmain.cdsquery2.Last;
  dmmain.cdsquery2.EnableControls;
  //得到此次查询的键值
  try
  LocalCount := GetKeyFieldValue('id',dmmain.cdsquery);   //传入具体字段
  except
  end;
  end else
  begin
     //不再有数据
     dmmain.cdsquery2.EnableControls;        //ydy  必须要
     btnpagedown.Enabled := false;
     screen.Cursor :=  crdefault;
    exit;
  end;
    dmmain.cdsquery2.EnableControls;
    dbgrid1.Refresh;
   screen.Cursor :=  crdefault;
   datas:=null;
end;

procedure TfmPosGoods.btnautoClick(Sender: TObject);
begin
  inherited;
  dlgPosGoods:=tdlgPosGoods.Create(self);
  dlgPosGoods.goods_no:=trim(dmmain.CDSquery2.fieldbyname('goods_no').AsString);
  dlgPosGoods.storage_no:= trim(dmmain.CDSquery2.fieldbyname('vcofficeid').AsString);
  dlgPosGoods.edtup.Text:= trim(dmmain.CDSquery2.fieldbyname('totalamount').AsString);
  dlgPosGoods.ShowModal;
  dlgPosGoods.Free; 
  dmmain.CDSquery2.Refresh;
  dbgrid1.Refresh;
end;

procedure TfmPosGoods.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmPosGoods.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery2,dbgrid1,column);
end;

procedure TfmPosGoods.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
end;

procedure TfmPosGoods.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbrand,cbbrand);
end;

procedure TfmPosGoods.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TfmPosGoods.CbstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbstorage,cmbstorage);
end;

procedure TfmPosGoods.CBTypeChange(Sender: TObject);
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

procedure TfmPosGoods.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TfmPosGoods.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure TfmPosGoods.BitBtn2Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

end.
