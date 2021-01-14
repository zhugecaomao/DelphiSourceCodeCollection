unit dlg_priceselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Udlgstock, StdCtrls, Buttons;

type
  Tdlgpriceselect = class(Tdlgstock)
    cbdateprice: TCheckBox;
    edtdateprice: TEdit;
    cbbaseprice: TCheckBox;
    edtbaseprice: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure cbbasepriceClick(Sender: TObject);
    procedure cbdatepriceClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgpriceselect: Tdlgpriceselect;

implementation

uses untdatadm, Untsalemoney, func;

{$R *.dfm}

procedure Tdlgpriceselect.btnOkClick(Sender: TObject);
var
  str:string;
  temp:widestring;
begin
  //inherited;
    str:='';
    if ckbCode.Checked then str:=str+'and goods_no='+''''+trim(edtCode.Text)+'''';
    if ckbNaME.Checked then str:=str+'and goods_name='+''''+trim(edtname.Text)+'''';
    //if ckbShop.Checked then str:=str+'and OI_Shop='+''''+trim(edtShop.Text)+'''';
    if ckbtype.Checked then str:=str+'and type='+''''+trim(edttype.Text)+'''';
    if ckbbrand.Checked then str:=str+'and brand='+''''+trim(edtbrand.Text)+'''';
    if cbbreed.Checked then str:=str+'and breed='+''''+trim(edtbreed.Text)+'''';
    if cbprovider.Checked then str:=str+'and provider='+''''+trim(edtprovider.Text)+'''';
    if cbamount.Checked then str:=str+'and stock_amount='+trim(edtamount.Text);
    if cbdateprice.Checked then str:=str+'and inputprice='+trim(edtdateprice.Text);
    if cbbaseprice.Checked then str:=str+'and baseprice ='+trim(edtbaseprice.Text);
  screen.Cursor :=  crHourGlass;
  temp:=fmsalemoney.tempsql+fmsalemoney.tables+fmsalemoney.tj+str;
  dmmain.DSquery.Close;
  dmmain.DSquery.Data:=null;
  try
  dmmain.DSquery.Data:=adisp.GetRecord(temp);
  dmmain.DSquery.Open;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  screen.Cursor :=  crdefault;
  close;

end;

procedure Tdlgpriceselect.cbbasepriceClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbbaseprice,edtbaseprice);
end;

procedure Tdlgpriceselect.cbdatepriceClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbdateprice,edtdateprice);
end;

procedure Tdlgpriceselect.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
