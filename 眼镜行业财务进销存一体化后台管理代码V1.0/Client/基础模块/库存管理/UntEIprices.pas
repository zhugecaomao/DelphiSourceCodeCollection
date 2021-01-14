unit UntEIprices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask;
type Tsend = record
  typed:string;//类别；
  brand:string;
  breed:string;
  ballbegin:string;
  ballend:string;
  pollbegin:string;
  pollend:string;
  batch:string;
  single:string;
  agion:string;
  price1,price2,price3,price4,price5,price6,price7,price8:string;
end;
type
  TfmEIprices = class(TfmBase)
    Panel4: TPanel;
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Cmd_Storage_Up: TSpeedButton;
    Cmd_Storage_Down: TSpeedButton;
    SpeedButton3: TSpeedButton;
    TabSheet2: TTabSheet;
    Cmd_Goods_Up: TSpeedButton;
    Cmd_Goods_Down: TSpeedButton;
    SpeedButton7: TSpeedButton;
    TabSheet4: TTabSheet;
    Cmd_Guide_Up: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label10: TLabel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    ckbBALL: TCheckBox;
    edtbegin: TEdit;
    edtend: TEdit;
    ckbPOLL: TCheckBox;
    edtpend: TEdit;
    edtpbegin: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtbase: TLabeledEdit;
    edtsingle: TLabeledEdit;
    edtbatch: TLabeledEdit;
    edtagio: TLabeledEdit;
    edtprice1: TLabeledEdit;
    edtprice2: TLabeledEdit;
    edtprice3: TLabeledEdit;
    edtprice4: TLabeledEdit;
    edtprice5: TLabeledEdit;
    edtprice6: TLabeledEdit;
    edtprice7: TLabeledEdit;
    edtprice8: TLabeledEdit;
    BitBtn1: TBitBtn;
    procedure Cmd_Storage_DownClick(Sender: TObject);
    procedure Cmd_Goods_UpClick(Sender: TObject);
    procedure ckbBALLClick(Sender: TObject);
    procedure ckbPOLLClick(Sender: TObject);
    procedure Cmd_Goods_DownClick(Sender: TObject);
    procedure Cmd_Guide_UpClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtsingleKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Bsend:Tsend;
  public
    { Public declarations }
  end;

var
  fmEIprices: TfmEIprices;

implementation

uses untdatadm, func;

{$R *.dfm}

procedure TfmEIprices.Cmd_Storage_DownClick(Sender: TObject);
begin
  inherited;
  bsend.typed:=trim(cbtype.Text);
  bsend.brand:=trim(cbbrand.Text);
  bsend.breed:=trim(cbbreed.Text);
  if bsend.typed ='' then
  begin
    application.MessageBox('请选择商品的类别！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if bsend.brand ='' then
  begin
    application.MessageBox('请选择商品的品牌！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if bsend.breed ='' then
  begin
    application.MessageBox('请选择商品的品种！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=True;
  TabSheet4.TabVisible:=False;
end;

procedure TfmEIprices.Cmd_Goods_UpClick(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible:=True;
  TabSheet2.TabVisible:=False;
  TabSheet4.TabVisible:=False;
end;

procedure TfmEIprices.ckbBALLClick(Sender: TObject);
begin
  inherited;
  ckbEdits(ckbball,edtbegin,edtend);

end;

procedure TfmEIprices.ckbPOLLClick(Sender: TObject);
begin
  inherited;
  ckbEdits(ckbpoll,edtpbegin,edtpend);
end;

procedure TfmEIprices.Cmd_Goods_DownClick(Sender: TObject);
begin
  inherited;
  if ckbball.Checked then
  begin
    if trim(edtbegin.Text)='' then
    begin
      application.MessageBox('请输入商品球面开始度数！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
    if trim(edtend.Text)='' then
    begin
      application.MessageBox('请输入商品球面结束度数！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
    bsend.ballbegin:=trim(edtbegin.Text);
    bsend.ballend:=trim(edtend.Text);
  end;
  if ckbpoll.Checked then
  begin
    if trim(edtpbegin.Text)='' then
    begin
      application.MessageBox('请输入商品柱面开始度数！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
    if trim(edtpend.Text)='' then
    begin
      application.MessageBox('请输入商品柱面结束度数！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
    bsend.pollbegin:=trim(edtpbegin.Text);
    bsend.pollend:=trim(edtpend.Text);
  end;
   TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=False;
  TabSheet4.TabVisible:=true;
end;

procedure TfmEIprices.Cmd_Guide_UpClick(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=true;
  TabSheet4.TabVisible:=false;
end;

procedure TfmEIprices.btnOkClick(Sender: TObject);
var
  updatesql:widestring;
begin
  inherited;
  with bsend  do
  begin
    single:=edtsingle.Text;
    batch:=edtbatch.Text;
    agion:=edtagio.Text;
    price1:=edtprice1.Text;
    price2:=edtprice2.Text;
    price3:=edtprice3.Text;
    price4:=edtprice4.Text;
    price5:=edtprice5.Text;
    price6:=edtprice6.Text;
    price7:=edtprice7.Text;
    price8:=edtprice8.Text;
    updatesql:='update goods_prices set singleprice= '+single+' ,batchprice='+batch+' ,agion='+agion+',prices1='+price1+',prices2='+price2+',prices3='+price3+',prices4='+price4+',prices5='+price5+',prices6='+price6+',prices7='+price7+',prices8='+price8+
    ' where goods_no in ( select goods_no from goods_code where type='+''''+trim(typed)+''''+' and brand='+''''+trim(brand)+''''+' and breed='+''''+trim(breed)+'''';
    if trim(ballbegin)<>'' then
    begin
      updatesql:=updatesql+' and dball>='+ballbegin+' and dball<='+ballend;
    end;
    if trim(pollbegin)<>'' then
    begin
      updatesql:=updatesql+' and dpoll>='+pollbegin+' and dpoll<='+pollend;
    end;
    updatesql:=updatesql+')';
    try
    ipubtemp.scrapsate(updatesql);
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    application.MessageBox('已经成功批量设定价格！',pchar(application.Title),mb_iconinformation);
    close;
  end;
end;

procedure TfmEIprices.edtsingleKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9','.',#8,#13]) then
  begin
  key:=#0;
  end else
  begin
    if trim((sender as TCustomEdit).Text)='' then
    begin
      (sender as TCustomEdit).Text:='0';
    end;
  end;
end;

procedure TfmEIprices.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
 ///////调类别
  pagecontrol1.ActivePageIndex:=0;
  tabsheet2.tabVisible:=false;
  tabsheet4.tabVisible:=false;
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
end;

procedure TfmEIprices.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select  distinct brand,brand_no from  [goods_code] where type ='+''''+trim(cbtype.text)+''''+' order by brand_no';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;
end;

procedure TfmEIprices.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmEIprices.cbBrandChange(Sender: TObject);
var
  t_sql:widestring;
begin
  inherited;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed,breed_no  from  [goods_code] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+''''+' order by breed_no';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TfmEIprices.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if trim(edtsingle.Text)='' then
  begin
    Application.MessageBox('请制订零售单价！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TCustomEdit) then
    begin
      if (self.Components[i] as TCustomEdit).Enabled then
      begin
        (self.Components[i] as TCustomEdit).Text:=edtsingle.Text;
      end;
    end;
  end;
  edtagio.Text :='0';
end;

end.
