unit Storage_Guide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, StdCtrls, Buttons, ComCtrls, Mask,
  LabeledEditint;
type TLimit=record
  storageid:string;
  shop:string;
  Flag:integer; //(0,1,2);
  typed:string;
  brand:string;
  breed:string;
  goods_code:string;
  begindate:string;
  enddate:string;
  amount:string;  //条件1
  money:string;// 条件2
  amountup:string ;//上限基数1；
  amountdown:string; //下限基数2；
end;

type
  Tfrm_Storage_Guide = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Cmd_JSR: TSpeedButton;
    Panel3: TPanel;
    Edit_Storage_Name: TLabeledEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DP1: TDateTimePicker;
    DP2: TDateTimePicker;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit_Big_sale: TMaskEdit;
    Edit_Smal_Sale: TMaskEdit;
    P_Image: TPanel;
    Image1: TImage;
    Edit_Storage_NO: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Cmd_Storage_Up: TSpeedButton;
    Cmd_Storage_Down: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    edtgoodscode: TLabeledEdit;
    edtamount: TLabeledEditint;
    edtmoney: TLabeledEditint;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    rbgoods: TRadioGroup;
    edtshop: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Cmd_Storage_DownClick(Sender: TObject);
    procedure Cmd_Goods_DownClick(Sender: TObject);
    procedure Cmd_Time_DownClick(Sender: TObject);
    procedure Cmd_Goods_UpClick(Sender: TObject);
    procedure Cmd_Time_UpClick(Sender: TObject);
    procedure Cmd_Guide_UpClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Cmd_JSRClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_Storage_NOChange(Sender: TObject);
    procedure rbgoodsClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtgoodscodeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure edtamountExit(Sender: TObject);
    procedure edtmoneyExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtshopChange(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure CbBreedChange(Sender: TObject);
  private
    { Private declarations }
    warnlimit:Tlimit;
    procedure model (flag:integer);
  public
    { Public declarations }
  end;

var
  frm_Storage_Guide: Tfrm_Storage_Guide;

implementation

uses func, Storage_Select, Untpart, untdatadm;

{$R *.dfm}
procedure Tfrm_Storage_Guide.model (flag:integer);
begin
  if flag=0 then
  begin
    cbtype.Enabled:=false;
    cbbrand.Enabled:=false;
    cbbreed.Enabled :=false;
    edtgoodscode.Enabled:=true;
  end;
  if flag=1 then
  begin
    cbtype.Enabled:=true;
    cbbrand.Enabled:=true;
    cbbreed.Enabled :=true;
    edtgoodscode.Enabled:=false;
  end;
  if flag=2 then
  begin
    cbtype.Enabled:=false;
    cbbrand.Enabled:=false;
    cbbreed.Enabled :=false;
    edtgoodscode.Enabled:=true;
  end;
end;
procedure Tfrm_Storage_Guide.FormShow(Sender: TObject);
var
  t_sql:string;
begin
 ///////调类别
  pagecontrol1.ActivePageIndex:=0;
  tabsheet2.tabVisible:=false;
  tabsheet4.tabVisible:=false;
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  ///////////////////
  P_Image.Width:=140;
  TabSheet1.TabVisible:=True;
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
  dp1.Date:=date-30;
  dp2.Date:=date;
end;

procedure Tfrm_Storage_Guide.Cmd_Storage_DownClick(Sender: TObject);
begin
  if trim(edit_storage_name.Text)<>'全部部门或门店' then
  begin
    if trim(edit_storage_no.Text)='' then
    begin
      application.MessageBox('请选择部门或门店！',pchar(application.Title),mb_iconinformaTION);
      exit;
    end;
  end;
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=True;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.Cmd_Goods_DownClick(Sender: TObject);
begin

    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=True;
    TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.Cmd_Time_DownClick(Sender: TObject);
begin

    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=True;
end;

procedure Tfrm_Storage_Guide.Cmd_Goods_UpClick(Sender: TObject);
begin
    TabSheet1.TabVisible:=True;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.Cmd_Time_UpClick(Sender: TObject);
begin
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=True;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.Cmd_Guide_UpClick(Sender: TObject);
begin
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=True;
    TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_Storage_Guide.SpeedButton7Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_Storage_Guide.SpeedButton10Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_Storage_Guide.Cmd_JSRClick(Sender: TObject);
begin
   fmps_part:=tfmps_part.Create(self);
   fmps_part.ShowModal;
   fmps_part.Free;
   if dmmain.CDSdata.IsEmpty  then exit;
   edit_storage_name.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
   edtshop.Text:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
   edit_storage_no.Text:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
   dmmain.CDSdata.Close;
end;

procedure Tfrm_Storage_Guide.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Storage_Guide.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrm_Storage_Guide.Edit_Storage_NOChange(Sender: TObject);
begin
  warnlimit.storageid:=trim(edit_storage_no.Text);
end;

procedure Tfrm_Storage_Guide.rbgoodsClick(Sender: TObject);
begin
   model(rbgoods.ItemIndex);
   warnlimit.flag:=rbgoods.ItemIndex;
end;

procedure Tfrm_Storage_Guide.SpeedButton2Click(Sender: TObject);
begin
  if warnlimit.Flag=1 then
  begin
    if trim(warnlimit.typed)='' then
    begin
      application.MessageBox('请选择商品类别！',pchar(application.Title),mb_iconinformaTION);
      exit;
    end;
     if trim(warnlimit.brand)='' then
    begin
      application.MessageBox('请选择商品品牌！',pchar(application.Title),mb_iconinformaTION);
      exit;
    end;
     if trim(warnlimit.breed)='' then
    begin
      application.MessageBox('请选择商品品种！',pchar(application.Title),mb_iconinformaTION);
      exit;
    end;
  end;
   if warnlimit.Flag=2 then
  begin
    if trim(warnlimit.goods_code)='' then
    begin
      application.MessageBox('请输入商品编码！',pchar(application.Title),mb_iconinformaTION);
      exit;
    end;
  end;
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=true;
  TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.edtgoodscodeExit(Sender: TObject);
begin
  warnlimit.goods_code:=trim(edtgoodscode.Text);
end;

procedure Tfrm_Storage_Guide.SpeedButton1Click(Sender: TObject);
begin
  TabSheet1.TabVisible:=true;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.SpeedButton5Click(Sender: TObject);
begin
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=true;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
end;

procedure Tfrm_Storage_Guide.SpeedButton6Click(Sender: TObject);
begin
  warnlimit.begindate:=formatdatetime('yyyy''-''mm''-''dd',dp1.date);
  warnlimit.enddate:=formatdatetime('yyyy''-''mm''-''dd',dp2.date);
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=true;
end;

procedure Tfrm_Storage_Guide.SpeedButton8Click(Sender: TObject);
begin
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=true;
  TabSheet4.TabVisible:=false;
end;

procedure Tfrm_Storage_Guide.edtamountExit(Sender: TObject);
begin
  warnlimit.amount:=trim(combobox1.Text+edtamount.Text);
end;

procedure Tfrm_Storage_Guide.edtmoneyExit(Sender: TObject);
begin
  warnlimit.money:=trim(combobox2.Text+edtmoney.Text);
end;

procedure Tfrm_Storage_Guide.btnOkClick(Sender: TObject);
var
  sqlpub:widestring;
  tj,tables1,tables2,tables3:widestring;
begin
  warnlimit.amountup:='0.00';
  warnlimit.amountdown:='0.00';
  if (trim(edit_big_sale.Text)='') or (trim(edit_big_sale.Text)='__________.__')then
  begin
    application.MessageBox('请输入产生商品上限基数！',pchar(application.Title),mb_iconinformaTION);
    exit;
  end;
  if (trim(edit_smal_sale.Text)='') or (trim(edit_smal_sale.Text)='__________.__') then
  begin
    application.MessageBox('请输入产生商品下限基数！',pchar(application.Title),mb_iconinformaTION);
    exit;
  end;
  tj:='';
  warnlimit.amountup:=trim(edit_big_sale.Text);
  warnlimit.amountdown:=trim(edit_smal_sale.Text);
  tables1:=' (select '+ warnlimit.amountup+' * sum(od_ccount) from [vbatchlimit] where';
  tables2:= '(select '+ warnlimit.amountdown+' * sum(od_ccount) from [vbatchlimit] where';
  tables3:=' (select od_ccode from [vbatchlimit] where';
  if warnlimit.shop <>'' then
  begin
    tj:=' ro_shop='+''''+trim(warnlimit.shop)+''''+' and';
  end ;
  if warnlimit.Flag=1 then
  begin
    tj:=tj+' type='+''''+trim(warnlimit.typed)+''''+' and brand='+''''+trim(warnlimit.brand )+''''+' and breed='+''''+trim(warnlimit.breed)+''''+' and';
  end;
  if warnlimit.Flag=2 then
  begin
    tj:=tj+' od_ccode='+''''+trim(warnlimit.goods_code)+''''+' and';
  end;
  tj:=tj+' ro_newdate>='+''''+trim(warnlimit.begindate)+''''+' and ro_newdate<='+''''+trim(warnlimit.enddate)+''''+' and';
  if trim(warnlimit.amount)<>'' then
  begin
    tj:=tj+'  od_ccount'+trim(warnlimit.amount)+' or ';
  end;
  if trim(warnlimit.money)<>'' then
  begin
    tj:=tj+' RO_ShouldMoney'+trim(warnlimit.money);
  end;
  tj:=copy(tj,1,length(tj)-3);
  //showmessage(tj);
  //exit;
  tables1:=tables1+tj+' group by od_ccode )';
  tables2:=tables2+tj+' group by od_ccode )';
  tables3:=tables3+tj+')';
  if trim(warnlimit.storageid)='' then
  begin
   sqlpub:=' update stock_states set up_amount='+tables1+',down_amount='+tables2+' where  goods_no in '+tables3;
  end else
  begin
  sqlpub:=' update stock_states set up_amount='+tables1+',down_amount='+tables2+' where storage_no='+''''+trim(warnlimit.storageid)+''''+' and goods_no in '+tables3;
  end;
  try
    ipubtemp.scrapsate(sqlpub);
    application.MessageBox('批量设置库存商品上下限成功！',pchar(application.Title),mb_iconinformation);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  close;
end;

procedure Tfrm_Storage_Guide.edtshopChange(Sender: TObject);
begin
  warnlimit.shop:=trim(edtshop.Text);
end;

procedure Tfrm_Storage_Guide.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select  distinct brand,brand_no from  [goods_code] where type ='+''''+trim(cbtype.text)+''''+' order by brand_no';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;
end;

procedure Tfrm_Storage_Guide.cbBrandChange(Sender: TObject);
var
  t_sql:widestring;
begin
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed,breed_no  from  [goods_code] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+''''+' order by breed_no';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;

end;

procedure Tfrm_Storage_Guide.CbBreedChange(Sender: TObject);
begin
  warnlimit.typed:=trim(cbtype.Text);
  warnlimit.brand:=trim(cbbrand.Text);
  warnlimit.breed:=trim(cbbreed.Text);
end;

end.
