unit Untdlgselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ComCtrls;

type
  Tdlgps_select = class(TfmBase)
    GroupBox1: TGroupBox;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    ckbName: TCheckBox;
    edtName: TEdit;
    ckbtype: TCheckBox;
    ckbbrand: TCheckBox;
    edtbrand: TEdit;
    edttype: TEdit;
    Cbbreed: TCheckBox;
    Edtbreed: TEdit;
    Cbprovider: TCheckBox;
    Edtprovider: TEdit;
    Cboffice: TCheckBox;
    Edtoffice: TEdit;
    cbamount: TCheckBox;
    edtamount: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbshenq: TCheckBox;
    edtshenq: TEdit;
    cbpsamount: TCheckBox;
    edtpsamount: TEdit;
    cbtotal: TCheckBox;
    edttotal: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    ckbnewDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbNameClick(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure CbbreedClick(Sender: TObject);
    procedure CbproviderClick(Sender: TObject);
    procedure CbofficeClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure cbshenqClick(Sender: TObject);
    procedure cbpsamountClick(Sender: TObject);
    procedure cbtotalClick(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgps_select: Tdlgps_select;

implementation

uses func, Untps_query, untdatadm;

{$R *.dfm}

procedure Tdlgps_select.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure Tdlgps_select.ckbNameClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbname,edtname);
end;

procedure Tdlgps_select.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbtype,edttype);
end;

procedure Tdlgps_select.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbbrand,edtbrand);
end;

procedure Tdlgps_select.CbbreedClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbbreed,edtbreed);
end;

procedure Tdlgps_select.CbproviderClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbprovider,edtprovider);
end;

procedure Tdlgps_select.CbofficeClick(Sender: TObject);
begin
  inherited;
  ckbedit(cboffice,edtoffice);
end;

procedure Tdlgps_select.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure Tdlgps_select.cbshenqClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbshenq,edtshenq);
end;

procedure Tdlgps_select.cbpsamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbpsamount,edtpsamount);
end;

procedure Tdlgps_select.cbtotalClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbtotal,edttotal);
end;

procedure Tdlgps_select.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbnewdate,dtpbegin,dtpend);
end;

procedure Tdlgps_select.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgps_select.btnOkClick(Sender: TObject);
var
  str:string;
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
    if cboffice.Checked then str:=str+'and vcofficeid='+''''+trim(edtoffice.Text)+'''';
    if cbamount.Checked then str:=str+'and stock_amount='+trim(edtamount.Text);
    if cbshenq.Checked then str:=str+'and NQty='+trim(edtshenq.Text);
    if cbpsamount.Checked then str:=str+'and NSendQty='+trim(edtpsamount.Text);
    if cbtotal.Checked then str:=str+'and totalamount='+trim(edttotal.Text);
    if ckbnewDate.Checked then str:=str+'and dgetdate>='+''''+datetostr(dtpBegin.Date)+''''+'and dgetdate<='+''''+datetostr(dtpEnd.Date)+'''';
  screen.Cursor :=  crHourGlass;
  if fmps_query.buttonflag=1 then
  begin
    temp:=fmps_query.tempsql+fmps_query.tables+str;  //不分申请门店
  end else
  begin
    temp:=fmps_query.tempsql+fmps_query.tables+fmps_query.tj+str+' group by VCOfficeID,goods_no,goods_name,stock_amount,NQty, NSendQty, totalamount,id,saleamount'; //
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
  dmmain.CDSquery.Data:=adisp.GetRecord(temp);
  dmmain.CDSquery.Open;
  if dmmain.CDSquery.IsEmpty then
  begin
    application.MessageBox('没有符合条件的数据！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  screen.Cursor :=  crdefault;
  //fmps_query.tj:=fmps_query.tj+str;
  close;

end;

procedure Tdlgps_select.FormShow(Sender: TObject);
begin
  inherited;
  if fmps_query.buttonflag=1 then
  begin
    cboffice.Enabled:=false;
    ckbnewdate.Enabled:=false;
  end;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date+1;
end;

end.
