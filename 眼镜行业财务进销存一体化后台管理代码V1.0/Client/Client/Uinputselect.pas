unit Uinputselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, ComCtrls, StdCtrls, Buttons;

type
  Tfrmselect = class(Tfrmbase)
    GroupBox1: TGroupBox;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    ckbName: TCheckBox;
    edtName: TEdit;
    ckbzdr: TCheckBox;
    ckbstock: TCheckBox;
    edtstock: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtzdr: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    ckbDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbNameClick(Sender: TObject);
    procedure ckbzdrClick(Sender: TObject);
    procedure ckbstockClick(Sender: TObject);
    procedure ckbDateClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    flag:integer;
  end;

var
  frmselect: Tfrmselect;

implementation

uses func, untdatadm, Ufmgird;

{$R *.dfm}

procedure Tfrmselect.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure Tfrmselect.ckbNameClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbname,edtname);
end;

procedure Tfrmselect.ckbzdrClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbzdr,edtzdr);
end;

procedure Tfrmselect.ckbstockClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbstock,edtstock);
end;

procedure Tfrmselect.ckbDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbdate,dtpbegin,dtpend);
end;

procedure Tfrmselect.btnOkClick(Sender: TObject);
var
  str:wideString;
  quedata:olevariant;
begin
  if flag=1 then
  begin
    str:='select top 1000 b.* from receipt as a ,stock_jion as b where a.receipt_no=b.stock_no and a.check_result=6 and stock_name='+''''+trim('采购入库单')+'''';
    if ckbCode.Checked then str:=str+'and b.stock_no='+''''+trim(edtCode.Text)+'''';
    if ckbNaME.Checked then str:=str+'and b.Transactor='+''''+trim(edtname.Text)+'''';
    //if ckbShop.Checked then str:=str+'and OI_Shop='+''''+trim(edtShop.Text)+'''';
    if ckbzdr.Checked then str:=str+'and b.proposer='+''''+trim(edtzdr.Text)+'''';
    if ckbstock.Checked then str:=str+'and b.shop_no='+''''+trim(edtstock.Text)+'''';
    if ckbDate.Checked then str:=str+'and b.copy_date>='+''''+formatdatetime('yyyy-mm-dd',dtpBegin.Date)+''''+'and b.copy_date<='+''''+formatdatetime('yyyy-mm-dd',dtpEnd.Date)+'''';
  end ;
  if flag=2 then
  begin
    str:='select top 1000 b.* from receipt as a ,moneyinput as b where a.receipt_no=b.stock_no and a.check_result=6 and b.MoneyType=0 and wldw_no='+''''+trim(wldwno)+'''';
    if ckbCode.Checked then str:=str+' and b.stock_no='+''''+trim(edtCode.Text)+'''';
    if ckbNaME.Checked then str:=str+' and b.Transactor='+''''+trim(edtname.Text)+'''';
    if ckbzdr.Checked then str:=str+' and b.proposer='+''''+trim(edtzdr.Text)+'''';
    if ckbstock.Checked then str:=str+' and b.shop_no='+''''+trim(edtstock.Text)+'''';
    if ckbDate.Checked then str:=str+' and b.copy_date>='+''''+formatdatetime('yyyy-mm-dd',dtpBegin.Date)+''''+' and b.copy_date<='+''''+formatdatetime('yyyy-mm-dd',dtpEnd.Date)+'''';
  end;
  if flag=3 then
  begin
    str:='select top 1000 b.* from receipt as a ,cancel_strip as b where a.receipt_no=b.stock_no and a.check_result=6 and b.state=0 and stock_name='+''''+trim('库存退货单')+'''';
    if ckbCode.Checked then str:=str+' and b.stock_no='+''''+trim(edtCode.Text)+'''';
    if ckbNaME.Checked then str:=str+' and b.Transactor='+''''+trim(edtname.Text)+'''';
    if ckbzdr.Checked then str:=str+' and b.proposer='+''''+trim(edtzdr.Text)+'''';
    if ckbstock.Checked then str:=str+' and b.shop_no='+''''+trim(edtstock.Text)+'''';
    if ckbDate.Checked then str:=str+' and b.copy_date>='+''''+formatdatetime('yyyy-mm-dd',dtpBegin.Date)+''''+' and b.copy_date<='+''''+formatdatetime('yyyy-mm-dd',dtpEnd.Date)+'''';
  end;
  try
    if dmmain.CDSquery.Active then dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    quedata:= adisp.GetRecord(str);
    if  varisnull(quedata) then
    begin
      application.MessageBox('没有符合条件的数据！',pchar(application.Title),mb_iconinformation);
    end;
    dmmain.CDSquery.Data:=quedata;
    dmmain.CDSquery.Open;
    close;
    frmgrid:=tfrmgrid.Create(self);
    frmgrid.ShowModal;
  except
  end;
  inherited;
end;

procedure Tfrmselect.FormShow(Sender: TObject);
begin
  inherited;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date;
end;

procedure Tfrmselect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

end.
