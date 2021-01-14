unit dlgkqdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, Buttons, StdCtrls;

type
  Tdlgkqdata = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    lbtime: TLabel;
    edtperson: TLabeledEdit;
    Cmd_Ok: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    Timer1: TTimer;
    EdtPWD: TLabeledEdit;
    procedure Cmd_CancelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Cmd_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgkqdata: Tdlgkqdata;

implementation

uses func;

{$R *.dfm}

procedure Tdlgkqdata.Cmd_CancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgkqdata.Timer1Timer(Sender: TObject);
begin
  inherited;
  lbtime.Caption:=formatdatetime('hh'':''MM'':''ss',now);
end;

procedure Tdlgkqdata.Cmd_OkClick(Sender: TObject);
var
  sql:widestring;
  part,pwd,scuid,user:widestring;
  storageid,dones:olevariant;
begin
  inherited;
  if trim(edtperson.Text)='' then
  begin
    application.MessageBox('请输入签到员工编号！',pchar(application.Title),mb_iconinformation);
    edtperson.SetFocus;
    exit;
  end;
  scuid:='{7E6276E9-C01C-473E-8092-88F21674E6DD}';
  user:=trim(edtperson.Text);
  pwd:=trim(edtpwd.Text);
  part:='0';
  try
    dones:=adisp.userlogin(part,user,pwd,scuid,storageid);
    if trim(vartostr(dones))='' then
    begin
      application.MessageBox('你的登陆验证信息有误，请确定后输入！',pchar(application.Title),mb_iconwarning);
      edtperson.SetFocus;
      exit;
    end ;
    except
     application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
     exit;
    end;
  sql:='insert into dp_kqdata (person_no,sktime,skdate) values ('+''''+trim(edtperson.Text)+''''+','+''''+trim(formatdatetime('hh'':''MM'':''ss',now))+''''+','+''''+trim(formatdatetime('yyyy''-''mm''-''dd',date))+''''+')';
  try
  ipubtemp.scrapsate(sql);
  edtperson.Clear;
  edtpwd.Clear;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tdlgkqdata.FormShow(Sender: TObject);
begin
  inherited;
  lbtime.Caption:=formatdatetime('hh'':''MM'':''ss',now);
end;

end.
