unit Unitzcser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, StdCtrls, Buttons, ComCtrls,inifiles;

type
  Tfrmzcser = class(TForm)
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    edtser: TLabeledEdit;
    rbip: TRadioButton;
    rbnet: TRadioButton;
    Animate1: TAnimate;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure edtserKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ipstr:string;
  end;

var
  frmzcser: Tfrmzcser;

implementation

uses Unitthzh, Data, untdatadm;

{$R *.dfm}

procedure Tfrmzcser.BtnCancelClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrmzcser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmzcser.BtnOKClick(Sender: TObject);
var
  ip:ipdns;
  fl:tinifile;
  p:word;
  i:integer;
  s:string;
begin
  animate1.Active:=true;
  if trim(edtser.Text)='' then
  begin
    animate1.Active:=false;
    exit;
  end;
  ipstr:=trim(edtser.Text);
  ip:=ipdns.Create(false);
  sleep(4000);
  TerminateThread(ip.handle,p);
  fl:=tinifile.Create(ExtractFilePath(application.ExeName)+'GD_IP_Config.ini');
  s:=fl.ReadString('servers','counts','');
  if trim(s)='' then
  begin
    i:=0;
  end else
  begin
    i:=strtoint(s);
  end;
  inc(i);
  fl.WriteString('servers','counts',inttostr(i));
  fl.WriteString('servers','servier'+inttostr(i),trim(ipstr));
  fl.Free;
  try
    application.CreateForm(Tfrm_Data,frm_Data);
    application.CreateForm(tdmmain,dmmain);
  except
    application.MessageBox('应用服务器连接错误,请重新注册应用服务器！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  animate1.Active:=false;
  mkdir(ExtractFilePath(application.ExeName)+'download');
  close;
end;

procedure Tfrmzcser.edtserKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    btnok.SetFocus;
  end;
end;

procedure Tfrmzcser.FormShow(Sender: TObject);
begin
  edtser.SetFocus;
end;

end.
