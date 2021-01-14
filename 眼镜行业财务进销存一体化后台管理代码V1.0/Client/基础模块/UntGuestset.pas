unit UntGuestset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ExtCtrls;

type
  Tfmguestset = class(TfmBase)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    cmbpart: TComboBox;
    Label2: TLabel;
    cmbno: TComboBox;
    Label3: TLabel;
    cmbtype: TComboBox;
    edtpwd: TLabeledEdit;
    Label4: TLabel;
    cmbname: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbpartChange(Sender: TObject);
    procedure cmbnoChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure forminit(tables:string;combox:TComboBox;fields:string);
  public
    { Public declarations }
    editmode:integer;
    done:string;
  end;

var
  fmguestset: Tfmguestset;

implementation

uses func, untdatadm;

{$R *.dfm}

procedure Tfmguestset.forminit(tables:string;combox:TComboBox;fields:string);
var
  sql:widestring;
begin
  sql:='select * from '+tables;
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    while not dmmain.CDSquery2.Eof do
    begin
      combox.Items.Add(dmmain.CDSquery2.fieldbyname(fields).AsString);
      dmmain.CDSquery2.Next;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
procedure Tfmguestset.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmguestset.FormShow(Sender: TObject);
begin
  inherited;
  if editmode=1 then
  begin
    forminit('part where (one_partno is null or one_partno='+''''+trim('')+''''+')',cmbpart,'part_no');
  end;
end;

procedure Tfmguestset.cmbpartChange(Sender: TObject);
begin
  inherited;
  if editmode=1 then
  begin
    forminit(' dp_person where p_no not in (select p_no from chang) and p_workid='+''''+trim(cmbpart.Text)+'''',cmbno,'p_no');
    forminit(' dp_person where p_no not in (select p_no from chang) and p_workid='+''''+trim(cmbpart.Text)+'''',cmbname,'p_name');
  end;
end;

procedure Tfmguestset.cmbnoChange(Sender: TObject);
begin
  inherited;
  if editmode=1 then
  cmbname.ItemIndex:=cmbno.ItemIndex;
end;

procedure Tfmguestset.btnOkClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if trim(cmbpart.Text)='' then
  begin
    application.MessageBox('请选择用户所在部门！',pchar(application.Title),mb_iconinformation);
    cmbpart.SetFocus;
    exit;
  end;
  if editmode=1 then
  begin
    sql:='insert into chang (part,Employe_Name,user_pwd,p_no,done,opertype) values ('+''''+trim(cmbpart.Text)+''''+','+''''+trim(cmbname.Text)+''''+','+''''+trim(edtpwd.Text)+''''+','+''''+trim(cmbno.Text)+''''+','+''''+trim(done)+''''+','+''''+trim(cmbtype.Text)+''''+')';
  end else
  begin
    sql:=' update chang set user_pwd='+''''+trim(edtpwd.Text)+''''+', done='+''''+trim(done)+''''+' where p_no='+''''+trim(cmbno.Text)+'''';
  end;
  try
   ipubtemp.scrapsate(sql);
   close;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

end.
