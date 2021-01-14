unit Ustockinit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, StdCtrls, Buttons, ExtCtrls;

type
  Tfrmstockinit = class(Tfrmbase)
    Panel1: TPanel;
    edtno: TLabeledEdit;
    edtname: TLabeledEdit;
    edtphone: TLabeledEdit;
    edtdx: TLabeledEdit;
    f_no: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtzip: TLabeledEdit;
    edtfax: TLabeledEdit;
    cmbtype: TComboBox;
    cmbry: TComboBox;
    edtaddress: TLabeledEdit;
    R1: TRadioButton;
    R2: TRadioButton;
    Label3: TLabel;
    cmbdq: TComboBox;
    btsave: TBitBtn;
    btexit: TBitBtn;
    procedure spbexitClick(Sender: TObject);
    procedure btsaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btexitClick(Sender: TObject);
    procedure cmbtypeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    flag:integer;
  end;

var
  frmstockinit: Tfrmstockinit;

implementation

uses untdatadm, func;

{$R *.dfm}

procedure Tfrmstockinit.spbexitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrmstockinit.btsaveClick(Sender: TObject);
begin
  inherited;
  if (trim(edtno.Text)='') or (trim(cmbtype.Text)='') then
  begin
    application.MessageBox('请输入或选择仓库编号和仓库类型！',pchar(application.Title),mb_iconinformation);
    edtno.SetFocus;
    exit;
  end else
  begin
    if dmmain.cdsstorage.active then dmmain.cdsstorage.Close;
    if flag=1 then
    begin
      dmmain.cdsstorage.Params.ParamByName('no').AsString:='@';
      dmmain.cdsstorage.Open;
      dmmain.cdsstorage.Insert;
      dmmain.cdsstorage.FieldByName('storage_no').AsString:=trim(edtno.Text);
      dmmain.cdsstorage.FieldByName('storage_name').AsString:=trim(edtname.Text);
      dmmain.cdsstorage.FieldByName('storage_type').AsString:=trim(cmbtype.Text);
      dmmain.cdsstorage.FieldByName('area_no').AsString:=trim(cmbdq.Text);
      dmmain.cdsstorage.FieldByName('address').AsString:=trim(edtaddress.Text);
      dmmain.cdsstorage.FieldByName('fax').AsString:=trim(edtfax.Text);
      dmmain.cdsstorage.FieldByName('zip').AsString:=trim(edtzip.Text);
      dmmain.cdsstorage.FieldByName('telphone').AsString:=trim(edtphone.Text);
      dmmain.cdsstorage.FieldByName('volume').AsString:=trim(edtdx.Text);
      dmmain.cdsstorage.FieldByName('manager').AsString:=trim(cmbry.Text);
      if r1.Checked then
      begin
        dmmain.cdsstorage.FieldByName('Type_Flag').AsString:=trim('0');
      end else
      begin
        dmmain.cdsstorage.FieldByName('Type_Flag').AsString:=trim('1');
      end;
      dmmain.cdsstorage.FieldByName('f_no').AsString:=trim(f_no.Text);
      dmmain.cdsstorage.Post;
    end else
    begin
      dmmain.cdsstorage.Params.ParamByName('no').AsString:=trim(dmmain.cdsquery.fieldbyname('storage_no').AsString);
      dmmain.cdsstorage.Open;
      dmmain.cdsstorage.edit;
      dmmain.cdsstorage.FieldByName('storage_name').AsString:=trim(edtname.Text);
      dmmain.cdsstorage.FieldByName('storage_type').AsString:=trim(cmbtype.Text);
      dmmain.cdsstorage.FieldByName('area_no').AsString:=trim(cmbdq.Text);
      dmmain.cdsstorage.FieldByName('address').AsString:=trim(edtaddress.Text);
      dmmain.cdsstorage.FieldByName('fax').AsString:=trim(edtfax.Text);
      dmmain.cdsstorage.FieldByName('zip').AsString:=trim(edtzip.Text);
      dmmain.cdsstorage.FieldByName('telphone').AsString:=trim(edtphone.Text);
      dmmain.cdsstorage.FieldByName('volume').AsString:=trim(edtdx.Text);
      dmmain.cdsstorage.FieldByName('manager').AsString:=trim(cmbry.Text);
      dmmain.cdsstorage.Post;
    end;
   try
     dmmain.cdsstorage.ApplyUpdates(-1);
   except
     application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
     exit;
   end;
   close;
  end;
end;

procedure Tfrmstockinit.FormShow(Sender: TObject);
begin
  inherited;
  if flag=2 then
  begin
    r1.Enabled:=false;
    r2.Enabled:=false;
  end;

end;

procedure Tfrmstockinit.btexitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrmstockinit.cmbtypeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key<>#13 then key:=#0;
end;

end.
