unit xgmmut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, ADODB;

type
  Txgmmfm = class(TForm)
    Panel1: TPanel;
    xgbt: TSpeedButton;
    qxbt: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    jmmedit: TEdit;
    Label2: TLabel;
    xmmedit: TEdit;
    Label3: TLabel;
    qrmmedit: TEdit;
    ADOQuery: TADOQuery;
    yhm: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure xgbtClick(Sender: TObject);
    procedure qxbtClick(Sender: TObject);
    procedure qrmmeditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xgmmfm: Txgmmfm;

implementation

uses mainut;

{$R *.dfm}

procedure Txgmmfm.FormCreate(Sender: TObject);
var
mypath:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
 yhm.Caption:='用户名:'+mainfm.username;
end;

procedure Txgmmfm.xgbtClick(Sender: TObject);
begin
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from czyb where 姓名=:xm and 密码=:mm');
Parameters.ParamByName('xm').Value:=mainfm.username;
Parameters.ParamByName('mm').Value:=trim(jmmedit.Text);
open;
if recordcount<1 then
begin
showmessage('旧密码不正确!');
exit;
end;
if xmmedit.Text<>qrmmedit.Text then
begin
showmessage('新密码和确认密码不一致！');
exit;
end;
end;
with adoquery do
begin
close;
sql.clear;
sql.add('update czyb set 密码=:mm where 姓名=:xm');
Parameters.ParamByName('xm').Value:=mainfm.username;
Parameters.ParamByName('mm').Value:=trim(xmmedit.Text);
execsql;
showmessage('密码修改成功！');
end;
except
showmessage('密码修改失败！');
end;
jmmedit.Clear;
xmmedit.Clear;
qrmmedit.Clear;
end;

procedure Txgmmfm.qxbtClick(Sender: TObject);
begin
jmmedit.Clear;
xmmedit.Clear;
qrmmedit.Clear;
close;
end;

procedure Txgmmfm.qrmmeditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
xgbt.Click;
end;

end.
