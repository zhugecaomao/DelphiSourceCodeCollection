unit UntGoodsStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB,
  DBClient;

type
  TfmStockAmountStaff = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    dsview: TDataSource;
    Label2: TLabel;
    cmbtop: TComboBox;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    BitBtn3: TBitBtn;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    cdsdata: TClientDataSet;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    tables,tempsql,tj,Fd:string;
    LocalCount :integer;
  end;

var
  fmStockAmountStaff: TfmStockAmountStaff;

implementation

uses untdatadm, func,fm_SetColumn, dlgGoodsStaff, UdlgGoodsSale;

{$R *.dfm}

procedure TfmStockAmountStaff.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmStockAmountStaff.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmStockAmountStaff.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  LocalCount:=0;
  dbgCur:=dbgrid1;
  cmbtop.ItemIndex:=0;
end;

procedure TfmStockAmountStaff.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {dlgGoodsStaffS:=tdlgGoodsStaffS.Create(self);
  dlgGoodsStaffS.ShowModal;
  dlgGoodsStaffS.Free;}
  cdsdata.Filtered:=false;
  cdsdata.Filter:='';
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=3;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  if cdsdata.Active then
  begin
    cdsdata.Filtered:=false;
    cdsdata.Last;
    LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
    btnpagedown.Enabled:=true;
  end;
  screen.Cursor :=  crdefault;
  btnpagedown.Enabled:=true;
end;

procedure TfmStockAmountStaff.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not dmmain.DSquery.Active then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   cdsdata.DisableControls;
  try
  temp:=tempsql+inttostr(localcount);
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  if not varisnull(datas) then
  begin
  cdsdata.Close;
  cdsdata.Open;
  cdsdata.AppendData(datas,true);
       cdsdata.Last;
    //重新打开
      cdsdata.EnableControls;
      //得到此次查询的键值
      LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段

    end else
    begin
       //不再有数据
        cdsdata.EnableControls;
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  screen.Cursor :=  crdefault;
end;

procedure TfmStockAmountStaff.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdsdata,dbgrid1,column);
end;

procedure TfmStockAmountStaff.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsdata.Close;
  cdsdata.Data:=null;
end;

procedure TfmStockAmountStaff.BitBtn3Click(Sender: TObject);
var
  str:string;
  i:integer;
begin
  inherited;
  if not cdsdata.Active then exit;
  str:='';
  if ckbtype.Checked then str:=str+' and trim(type) ='+''''+trim(cbtype.Text)+'''';
  if ckbbrand.Checked then str:=str+' and trim(brand) ='+''''+trim(cbbrand.Text)+'''';
  if ckbbreed.Checked then str:=str+' and trim(breed) ='+''''+trim(cbbreed.Text)+'''';
  if ckbcode.Checked then str:=str+' and trim(goods_no) ='+trim(edtCode.Text);
  i:=pos('and',str);
  if i=2 then
  begin
    str:=copy(str,5,length(str));
  end;
  cdsdata.Filter:=str;
  cdsdata.Filtered:=true;
end;

procedure TfmStockAmountStaff.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
   CBTypeChange(cbtype);
end;

procedure TfmStockAmountStaff.cbBrandChange(Sender: TObject);
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

procedure TfmStockAmountStaff.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TfmStockAmountStaff.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure TfmStockAmountStaff.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TfmStockAmountStaff.CBTypeChange(Sender: TObject);
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

end.
