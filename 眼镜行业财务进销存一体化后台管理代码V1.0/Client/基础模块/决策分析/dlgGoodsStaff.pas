unit dlgGoodsStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ComCtrls;

type
  TdlgGoodsStaffS = class(TfmBase)
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
    Cbstorage: TCheckBox;
    Edtstorage: TEdit;
    cbamount: TCheckBox;
    edtamount: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    Label8: TLabel;
    ckbnewDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Rbt: TRadioButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtamountKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbNameClick(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure CbbreedClick(Sender: TObject);
    procedure CbstorageClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgGoodsStaffS: TdlgGoodsStaffS;

implementation

uses UntGoodsStaff, untdatadm, func;

{$R *.dfm}

procedure TdlgGoodsStaffS.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TdlgGoodsStaffS.btnOkClick(Sender: TObject);
var
  str,fieldstr:string;
  temp:widestring;
  datas:olevariant;
  i:double;
begin
  inherited;
  str:='';
  if ckbCode.Checked then str:=str+'and goods_no='+''''+trim(edtCode.Text)+'''';
  if ckbNaME.Checked then str:=str+'and goods_name='+''''+trim(edtname.Text)+'''';
  if ckbtype.Checked then str:=str+'and type='+''''+trim(edttype.Text)+'''';
  if ckbbrand.Checked then str:=str+'and brand='+''''+trim(edtbrand.Text)+'''';
  if cbbreed.Checked then str:=str+'and breed='+''''+trim(edtbreed.Text)+'''';
  if cbstorage.Checked then str:=str+'and storage_no='+''''+trim(edtstorage.Text)+'''';
  if cbamount.Checked then str:=str+'and stock_amount='+trim(edtamount.Text);
  if ckbnewDate.Checked then str:=str+'and ro_newdate>='+''''+datetostr(dtpBegin.Date)+''''+' and ro_newdate<='+''''+datetostr(dtpEnd.Date)+'''';
  if rbt.Checked then
  begin
   str:=str+' and z_amount>0';
   fmStockAmountStaff.tj:= fmStockAmountStaff.tj+' and z_amount>0 ';
  end;
 screen.Cursor :=  crHourGlass;
 fmStockAmountStaff.fd:='* ,'+'isnull(stock_amount/(convert(float,z_amount,0)/DATEDIFF(day,'+''''+formatdatetime('yyyy''-''mm''-''dd',dtpbegin.date)+''''+','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpend.date)+''''+')),0) as SaleDay ,DATEDIFF(day,'+''''+formatdatetime('yyyy''-''mm''-''dd',dtpbegin.date)+''''+','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpend.date)+''''+') as days';
 temp:=fmStockAmountStaff.tempsql+fmStockAmountStaff.Fd+fmStockAmountStaff.tables+fmStockAmountStaff.tj+str;
 dmmain.DSquery.close;
 dmmain.DSquery.Data:=null;
 datas:=null;
 try
   ipubtemp.ty_query(temp,datas);
   if not varisnull(datas) then
   begin
     dmmain.DSquery.Data:=datas;
     dmmain.DSquery.Open;
     setdbgrid(fmStockAmountStaff.DBGrid1,2);
     datas:=null;
   end;
 except
   application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
   exit;
 end;
 close;
end;

procedure TdlgGoodsStaffS.FormShow(Sender: TObject);
begin
  inherited;
  dtpEnd.Date:=date;
  dtpBegin.Date:=date-30;
end;

procedure TdlgGoodsStaffS.edtamountKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8,#13]) then key:=#0;
end;

procedure TdlgGoodsStaffS.ckbCodeClick(Sender: TObject);
begin
  inherited;
 ckbedit(ckbcode,edtcode);
end;

procedure TdlgGoodsStaffS.ckbNameClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbname,edtname);
end;

procedure TdlgGoodsStaffS.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbtype,edttype);
end;

procedure TdlgGoodsStaffS.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbbrand,edtbrand);
end;

procedure TdlgGoodsStaffS.CbbreedClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbbreed,edtbreed);
end;

procedure TdlgGoodsStaffS.CbstorageClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbstorage,edtstorage);
end;

procedure TdlgGoodsStaffS.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure TdlgGoodsStaffS.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbnewdate,dtpbegin,dtpend);
end;

end.
