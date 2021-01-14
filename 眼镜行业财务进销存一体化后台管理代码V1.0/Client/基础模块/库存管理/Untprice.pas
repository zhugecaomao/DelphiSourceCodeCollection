unit Untprice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls, Buttons;

type
  Tfmbaseprice = class(TfmBase)
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
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure init;
  public
    { Public declarations }
    goods_no:string;
  end;

var
  fmbaseprice: Tfmbaseprice;

implementation

uses untdatadm;

{$R *.dfm}
procedure tfmbaseprice.init;
begin
  if dmmain.cdsprice.Active then  dmmain.cdsprice.Close;
  dmmain.cdsprice.Params.ParamByName('no').AsString:=trim(goods_no);
  dmmain.cdsprice.Open;
  if not dmmain.cdsprice.IsEmpty then
  begin
    edtbase.Text:=floattostr(dmmain.cdsprice.FieldByName('baseprice').AsFloat);
    edtsingle.Text:=floattostr(dmmain.cdsprice.FieldByName('singleprice').AsFloat);
    edtbatch.Text:=floattostr(dmmain.cdsprice.FieldByName('batchprice').AsFloat);
    edtagio.Text:=floattostr(dmmain.cdsprice.FieldByName('agion').AsFloat);
    edtprice1.Text:=floattostr(dmmain.cdsprice.FieldByName('prices1').AsFloat);
    edtprice2.Text:=floattostr(dmmain.cdsprice.FieldByName('prices2').AsFloat);
    edtprice3.Text:=floattostr(dmmain.cdsprice.FieldByName('prices3').AsFloat);
    edtprice4.Text:=floattostr(dmmain.cdsprice.FieldByName('prices4').AsFloat);
    edtprice5.Text:=floattostr(dmmain.cdsprice.FieldByName('prices5').AsFloat);
    edtprice6.Text:=floattostr(dmmain.cdsprice.FieldByName('prices6').AsFloat);
    edtprice7.Text:=floattostr(dmmain.cdsprice.FieldByName('prices7').AsFloat);
    edtprice8.Text:=floattostr(dmmain.cdsprice.FieldByName('prices8').AsFloat);
  end;
end;
procedure Tfmbaseprice.btnCancelClick(Sender: TObject);
begin
  inherited;
  dmmain.cdsprice.Close;
  close;
end;

procedure Tfmbaseprice.btnOkClick(Sender: TObject);
begin
  inherited;
  if dmmain.cdsprice.IsEmpty then
  begin
    dmmain.cdsprice.Insert;
  end else
  begin
    dmmain.cdsprice.edit;
  end;
  //dmmain.dsquery.DisableControls;
  dmmain.cdsprice.FieldByName('singleprice').Asstring:=trim(edtsingle.Text);
  dmmain.cdsprice.FieldByName('batchprice').Asstring:=trim(edtbatch.Text);
  dmmain.cdsprice.FieldByName('agion').Asstring:=trim(edtagio.Text);
  dmmain.cdsprice.FieldByName('prices1').AsString:=trim(edtprice1.Text);
  dmmain.cdsprice.FieldByName('prices2').AsString:=trim(edtprice2.Text);
  dmmain.cdsprice.FieldByName('prices3').AsString:=trim(edtprice3.Text);
  dmmain.cdsprice.FieldByName('prices4').AsString:=trim(edtprice4.Text);
  dmmain.cdsprice.FieldByName('prices5').AsString:=trim(edtprice5.Text);
  dmmain.cdsprice.FieldByName('prices6').AsString:=trim(edtprice6.Text);
  dmmain.cdsprice.FieldByName('prices7').AsString:=trim(edtprice7.Text);
  dmmain.cdsprice.FieldByName('prices8').AsString:=trim(edtprice8.Text);
  dmmain.cdsprice.Post;
  try
    dmmain.cdsprice.ApplyUpdates(-1);
    dmmain.DSquery.Refresh;
    //dmmain.DSquery.EnableControls;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  dmmain.cdsprice.Close;
  close;
end;

procedure Tfmbaseprice.FormShow(Sender: TObject);
begin
  inherited;
  init;
end;

procedure Tfmbaseprice.BitBtn1Click(Sender: TObject);
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
      if ((self.Components[i] as TCustomEdit).Enabled)  then
      begin
        (self.Components[i] as TCustomEdit).Text:=edtsingle.Text;
      end;
    end;
  end;
  edtagio.Text :='0';
end;

end.
