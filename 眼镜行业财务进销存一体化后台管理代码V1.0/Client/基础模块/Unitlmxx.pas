unit Unitlmxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XPMenu;

type
  Tfrmlmxx = class(TForm)
    Panel1: TPanel;
    edtlmno: TLabeledEdit;
    spbyzno: TSpeedButton;
    Label1: TLabel;
    mlmname: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure spbyznoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fg:integer;
  end;

var
  frmlmxx: Tfrmlmxx;

implementation

uses  func, UMsgmanager;

{$R *.dfm}

procedure Tfrmlmxx.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmlmxx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmlmxx.BitBtn1Click(Sender: TObject);
var
  values,temp:widestring;
begin
  if (trim(edtlmno.Text)='') and (trim(mlmname.Text)='')  then
  begin
    if trim(edtlmno.Text)='' then
    begin
      application.MessageBox('请输入栏目编号！',pchar(application.Title),mb_iconinformation);
      edtlmno.SetFocus;
      exit;
    end;
    if trim(mlmname.Text)='' then
    begin
      application.MessageBox('请输入栏目名称！',pchar(application.Title),mb_iconinformation);
      mlmname.SetFocus;
      exit;
    end;
  end else
  begin
    if fg=1 then
    begin
      temp:='insert into manager (lmno,lmname) values ('+''''+trim(edtlmno.Text)+''''+','+''''+trim(mlmname.Text)+''''+')';
      {dm.cdsmanager.Insert;
      addedit_data(dm.cdsmanager,'lmno',trim(edtlmno.Text));
      addedit_data(dm.cdsmanager,'lmname',trim(values));}
    end else
    begin
      {dm.cdsmanager.edit;
      addedit_data(dm.cdsmanager,'lmno',trim(edtlmno.Text));
      addedit_data(dm.cdsmanager,'lmname',trim(values)); }
      temp:='update manager set lmno='+''''+trim(edtlmno.Text)+''''+',lmname='+''''+trim(mlmname.Text)+''''+' where id='+trim(fmmsgmanager.cdsmanager.fieldbyname('id').AsString );
    end;
    try    //容错处理
      adisp.updatesql(temp);
      fmmsgmanager.MsgRead;
    except

    end;
    close
  end;
end;

procedure Tfrmlmxx.spbyznoClick(Sender: TObject);
var
  sql:widestring;
  datas:olevariant;
begin
  if trim(edtlmno.Text)='' then
  begin
    application.MessageBox('请输入栏目编号！',pchar(application.Title),mb_iconinformation);
    edtlmno.SetFocus;
    exit;
  end;
  sql:='select lmno from manager where lmno='+''''+trim(edtlmno.Text)+'''';
  datas:=null;
  datas:=adisp.resultrecord(sql);

  if not varisnull(datas) then
  begin
    application.MessageBox('栏目编号有重复,请重新输入栏目编号！',pchar(application.Title),mb_iconinformation);
    edtlmno.Clear;
    edtlmno.SetFocus;
    exit;
  end else
  begin
    application.MessageBox('已检查栏目编号唯一性！',pchar(application.Title),mb_iconinformation);
    datas:=null;
  end;
end;

end.
