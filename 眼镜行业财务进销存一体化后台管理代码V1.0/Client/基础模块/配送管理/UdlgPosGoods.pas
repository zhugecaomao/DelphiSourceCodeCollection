unit UdlgPosGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ExtCtrls, LabeledEditint;

type
  TdlgPosGoods = class(TfmBase)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtup: TLabeledEditint;
    edtdown: TLabeledEditint;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    goods_no,storage_no:string;
  end;

var
  dlgPosGoods: TdlgPosGoods;

implementation

uses func, untdatadm;

{$R *.dfm}

procedure TdlgPosGoods.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TdlgPosGoods.btnOkClick(Sender: TObject);
var
  sql:widestring;
  BillNo:string;
  i,j,t:integer;
begin
  inherited;
  if trim(edtdown.Text)='' then
  begin
    application.MessageBox('请输入找平数量！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if strtoint(edtdown.Text)>strtoint(edtup.Text) then
  begin
    application.MessageBox('找平数量应小于配送差额数量！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  try
    sql:='select a.VcGetGoodsPlanID,b.NQty  from GetGoodsPlanMaster as a,GetGoodsPlan as b where a.VcGetGoodsPlanID=b. VcGetGoodsPlanID and a.VCOfficeID='+''''+trim(storage_no)+''''+' and b.VCPtyieID='+''''+trim(goods_no)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
    dmmain.CDSexecsql.Open;
    i:= strtoint(edtdown.Text);
    t:=0;
    while not dmmain.CDSexecsql.Eof do
    begin
      BILLNO:=trim(dmmain.CDSexecsql.fieldbyname('VcGetGoodsPlanID').AsString);
      j:=dmmain.CDSexecsql.fieldbyname('NQty').AsInteger;
      if j<i then
      begin
        j:=0;
        i:=i-j;
      end else
      begin
        inc(t);
        j:=j-i;
        i:=0;
      end;
      if t<2 then
      begin
        if trim(billno)<>'' then
        begin
          sql:='insert into Submit_foot_detail  values ('+''''+formatdatetime('yyyy''-''mm''-''dd',date)+''''+','+''''+trim(goods_no)+''''+','+trim(edtup.Text)+','+trim(edtdown.Text)+','+''''+trim(storage_no)+''''+','+''''+trim(Handle_Man)+''''+')';
          adisp.updatesql(sql);
          sql:='update GetGoodsPlan set NQty = '+trim(inttostr(j))+' where VCPtyieID='+''''+trim(goods_no)+''''+' and VcGetGoodsPlanID='+''''+trim(billno)+'''';
          adisp.updatesql(sql);
        end;
      end else
      begin
        break;
      end;
      dmmain.CDSexecsql.Next;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  close;
end;

procedure TdlgPosGoods.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
end;

end.
