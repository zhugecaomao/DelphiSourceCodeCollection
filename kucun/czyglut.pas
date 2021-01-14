unit czyglut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  Tczyglfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    tjbt: TSpeedButton;
    xgedit: TSpeedButton;
    scedit: TSpeedButton;
    closebt: TSpeedButton;
    xmedit: TEdit;
    mmedit: TEdit;
    Label3: TLabel;
    qxbox: TComboBox;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    rkcz: TCheckBox;
    ckcz: TCheckBox;
    rkcx: TCheckBox;
    ckcx: TCheckBox;
    kccx: TCheckBox;
    bbdy: TCheckBox;
    sjcl: TCheckBox;
    csh: TCheckBox;
    yygl: TCheckBox;
    czygl: TCheckBox;
    ghsgl: TCheckBox;
    bhgl: TCheckBox;
    rkgl: TCheckBox;
    ckgl: TCheckBox;
    kcgl: TCheckBox;
    xgmm: TCheckBox;
    sjbf: TCheckBox;
    ckrz: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure tjbtClick(Sender: TObject);
    procedure sceditClick(Sender: TObject);
    procedure closebtClick(Sender: TObject);
    procedure xgeditClick(Sender: TObject);
    procedure qxboxChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  czyglfm: Tczyglfm;
  str:string;
implementation

{$R *.dfm}

procedure Tczyglfm.FormCreate(Sender: TObject);
var
mypath:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from czyb');
open;
end;
end;

procedure Tczyglfm.DBGrid1CellClick(Column: TColumn);
begin
with adoquery do
begin
xmedit.Text:=fieldbyname('姓名').asstring;
mmedit.Text:=fieldbyname('密码').asstring;
qxbox.Text:=fieldbyname('权限').AsString;
if xmedit.Text='admin' then
czygl.Enabled:=false
else
czygl.Enabled:=true;
if fieldbyname('入库操作').AsBoolean=true then
rkcz.Checked:=true
else
rkcz.Checked:=false;
if fieldbyname('出库操作').AsBoolean=true then
ckcz.Checked:=true
else
ckcz.Checked:=false;
if fieldbyname('入库查询').AsBoolean=true then
rkcx.Checked:=true
else
rkcx.Checked:=false;
if fieldbyname('出库查询').AsBoolean=true then
ckcx.Checked:=true
else
ckcx.Checked:=false;
if fieldbyname('库存查询').AsBoolean=true then
kccx.Checked:=true
else
kccx.Checked:=false;
if fieldbyname('报表打印').AsBoolean=true then
bbdy.Checked:=true
else
bbdy.Checked:=false;
if fieldbyname('数据处理').AsBoolean=true then
sjcl.Checked:=true
else
sjcl.Checked:=false;
if fieldbyname('初始化处理').AsBoolean=true then
csh.Checked:=true
else
csh.Checked:=false;
if fieldbyname('操作员管理').AsBoolean=true then
czygl.Checked:=true
else
czygl.Checked:=false;
if fieldbyname('工作员管理').AsBoolean=true then
yygl.Checked:=true
else
yygl.Checked:=false;
if fieldbyname('供货商管理').AsBoolean=true then
ghsgl.Checked:=true
else
ghsgl.Checked:=false;
if fieldbyname('编号管理').AsBoolean=true then
bhgl.Checked:=true
else
bhgl.Checked:=false;
if fieldbyname('入库管理').AsBoolean=true then
rkgl.Checked:=true
else
rkgl.Checked:=false;
if fieldbyname('出库管理').AsBoolean=true then
ckgl.Checked:=true
else
ckgl.Checked:=false;
if fieldbyname('库存管理').AsBoolean=true then
kcgl.Checked:=true
else
kcgl.Checked:=false;
if fieldbyname('修改密码').AsBoolean=true then
xgmm.Checked:=true
else
xgmm.Checked:=false;
if fieldbyname('数据备份').AsBoolean=true then
sjbf.Checked:=true
else
sjbf.Checked:=false;
if fieldbyname('查看日志').AsBoolean=true then
ckrz.Checked:=true
else
ckrz.Checked:=false;
end;
end;
procedure Tczyglfm.tjbtClick(Sender: TObject);
var
vrkcz,vckcz,vrkcx,vckcx,vkccx,vbbdy,vsjcl,vcshcl,vrygl,vczygl:bool;
vghsgl,vbhgl,vrkgl,vckgl,vkcgl,vxgmm,vsjbf,vckrz:bool;
begin
if xmedit.Text='' then
begin
showmessage('姓名不能为空!');
exit;
end;
try
if rkcz.Checked then
vrkcz:=true
else
vrkcz:=false;
if ckcz.Checked then
vckcz:=true
else
vckcz:=false;
if rkcx.Checked then
vrkcx:=true
else
vrkcx:=false;
if ckcx.Checked then
vckcx:=true
else
vckcx:=false;
if kccx.Checked then
vkccx:=true
else
vkccx:=false;
if bbdy.Checked then
vbbdy:=true
else
vbbdy:=false;
if sjcl.Checked then
vsjcl:=true
else
vsjcl:=false;
if csh.Checked then
vcshcl:=true
else
vcshcl:=false;
if yygl.Checked then
vrygl:=true
else
vrygl:=false;
if czygl.checked then
vczygl:=true
else
vczygl:=false;
if ghsgl.Checked then
vghsgl:=true
else
vghsgl:=false;
if bhgl.Checked then
vbhgl:=true
else
vbhgl:=false;
if rkgl.Checked then
vrkgl:=true
else
vrkgl:=false;
if ckgl.Checked then
vckgl:=true
else
vckgl:=false;
if kcgl.Checked then
vkcgl:=true
else
vkcgl:=false;
if xgmm.Checked then
vxgmm:=true
else
vxgmm:=false;
if sjbf.Checked then
vsjbf:=true
else
vsjbf:=false;
if ckrz.Checked then
vckrz:=true
else
vckrz:=false;
str:='insert into  czyb (姓名,权限,密码,入库操作,出库操作,入库查询,出库查询,库存查询,报表打印,数据处理,初始化处理,';
str:=str+'操作员管理,工作员管理,供货商管理,编号管理,入库管理,出库管理,库存管理,修改密码,数据备份,查看日志) values(';
str:=str+':xm,:qx,:mm,:rkcz,:ckcz,:rkcx,:ckcx,:kccx,:bbdy,:sjcl,:cshcl,:czygl,:gzygl,:ghsgl,:bhgl,:rkgl,:ckgl,:kcgl,:xgmm,:sjbf,:ckrz)';
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
Parameters.ParamByName('qx').Value:=trim(qxbox.Text);
Parameters.ParamByName('mm').Value:=trim(mmedit.Text);
Parameters.ParamByName('rkcz').Value:=vrkcz;
Parameters.ParamByName('ckcz').Value:=vckcz;
Parameters.ParamByName('rkcx').Value:=vrkcx;
Parameters.ParamByName('ckcx').Value:=vckcx;
Parameters.ParamByName('kccx').Value:=vkccx;
Parameters.ParamByName('bbdy').Value:=vbbdy;
Parameters.ParamByName('sjcl').Value:=vsjcl;
Parameters.ParamByName('cshcl').Value:=vcshcl;
Parameters.ParamByName('czygl').Value:=vrygl;
Parameters.ParamByName('gzygl').Value:=vczygl;
Parameters.ParamByName('ghsgl').Value:=vghsgl;
Parameters.ParamByName('bhgl').Value:=vbhgl;
Parameters.ParamByName('rkgl').Value:=vrkgl;
Parameters.ParamByName('ckgl').Value:=vckgl;
Parameters.ParamByName('kcgl').Value:=vkcgl;
Parameters.ParamByName('xgmm').Value:=vxgmm;
Parameters.ParamByName('sjbf').Value:=vsjbf;
Parameters.ParamByName('ckrz').Value:=vckrz;
execsql;
showmessage('添加成功!');
xmedit.Text:='';
mmedit.Text:='';
end;
except
showmessage('添加失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from czyb');
open;
end;
end;

procedure Tczyglfm.sceditClick(Sender: TObject);
begin
if messagedlg('确定删除吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('delete from czyb where 姓名=:xm and 姓名<>"admin"');
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
execsql;
showmessage('删除成功!');
xmedit.Text:='';
mmedit.Text:='';
end;
except
showmessage('删除失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from czyb');
open;
end;
end;
end;
procedure Tczyglfm.closebtClick(Sender: TObject);
begin
close;
end;

procedure Tczyglfm.xgeditClick(Sender: TObject);
var
vrkcz,vckcz,vrkcx,vckcx,vkccx,vbbdy,vsjcl,vcshcl,vrygl,vczygl:bool;
vghsgl,vbhgl,vrkgl,vckgl,vkcgl,vxgmm,vsjbf,vckrz:bool;

begin
if rkcz.Checked then
vrkcz:=true
else
vrkcz:=false;
if ckcz.Checked then
vckcz:=true
else
vckcz:=false;
if rkcx.Checked then
vrkcx:=true
else
vrkcx:=false;
if ckcx.Checked then
vckcx:=true
else
vckcx:=false;
if kccx.Checked then
vkccx:=true
else
vkccx:=false;
if bbdy.Checked then
vbbdy:=true
else
vbbdy:=false;
if sjcl.Checked then
vsjcl:=true
else
vsjcl:=false;
if csh.Checked then
vcshcl:=true
else
vcshcl:=false;
if yygl.Checked then
vrygl:=true
else
vrygl:=false;
if czygl.checked then
vczygl:=true
else
vczygl:=false;
if ghsgl.Checked then
vghsgl:=true
else
vghsgl:=false;
if bhgl.Checked then
vbhgl:=true
else
vbhgl:=false;
if rkgl.Checked then
vrkgl:=true
else
vrkgl:=false;
if ckgl.Checked then
vckgl:=true
else
vckgl:=false;
if kcgl.Checked then
vkcgl:=true
else
vkcgl:=false;
if xgmm.Checked then
vxgmm:=true
else
vxgmm:=false;
if sjbf.Checked then
vsjbf:=true
else
vsjbf:=false;
if ckrz.Checked then
vckrz:=true
else
vckrz:=false;
try
str:='update czyb set 权限=:qx,密码=:mm,入库操作=:rkcz,出库操作=:ckcz,入库查询=:rkcx,出库查询=:ckcx,';
str:=str+'库存查询=:kccx,报表打印=:bbdy,数据处理=:sjcl,初始化处理=:cshcl,操作员管理=:czygl,工作员管理=:gzygl,';
str:=str+'供货商管理=:ghsgl,编号管理=:bhgl,入库管理=:rkgl,出库管理=:ckgl,库存管理=:kcgl,修改密码=:xgmm,数据备份=:sjbf,查看日志=:ckrz where 姓名=:xm';
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
Parameters.ParamByName('qx').Value:=trim(qxbox.Text);
Parameters.ParamByName('mm').Value:=trim(mmedit.Text);
Parameters.ParamByName('rkcz').Value:=vrkcz;
Parameters.ParamByName('ckcz').Value:=vckcz;
Parameters.ParamByName('rkcx').Value:=vrkcx;
Parameters.ParamByName('ckcx').Value:=vckcx;
Parameters.ParamByName('kccx').Value:=vkccx;
Parameters.ParamByName('bbdy').Value:=vbbdy;
Parameters.ParamByName('sjcl').Value:=vsjcl;
Parameters.ParamByName('cshcl').Value:=vcshcl;
Parameters.ParamByName('czygl').Value:=vrygl;
Parameters.ParamByName('gzygl').Value:=vczygl;
Parameters.ParamByName('ghsgl').Value:=vghsgl;
Parameters.ParamByName('bhgl').Value:=vbhgl;
Parameters.ParamByName('rkgl').Value:=vrkgl;
Parameters.ParamByName('ckgl').Value:=vckgl;
Parameters.ParamByName('kcgl').Value:=vkcgl;
Parameters.ParamByName('xgmm').Value:=vxgmm;
Parameters.ParamByName('sjbf').Value:=vsjbf;
Parameters.ParamByName('ckrz').Value:=vckrz;
execsql;
showmessage('修改成功!');
xmedit.Text:='';
mmedit.Text:='';
end;
 except
showmessage('修改失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from czyb');
open;
end;
end;
procedure Tczyglfm.qxboxChange(Sender: TObject);
begin
if qxbox.Text='计算机管理员' then


begin
  rkcz.Checked:=true;
  ckcz.Checked:=true;
  rkcx.Checked:=true;
  ckcx.Checked:=true;
  kccx.Checked:=true;
  bbdy.Checked:=true;
  sjcl.Checked:=true;
  csh.Checked:=true;
  yygl.Checked:=true;
  czygl.Checked:=true;
  ghsgl.Checked:=true;
  bhgl.Checked:=true;
  rkgl.Checked:=true;
  ckgl.Checked:=true;
  kcgl.Checked:=true;
  xgmm.Checked:=true;
  sjbf.Checked:=true;
  ckrz.Checked:=true;
end;
 if qxbox.Text='操作员' then
begin
  rkcz.Checked:=true;
  ckcz.Checked:=true;
  rkcx.Checked:=true;
  ckcx.Checked:=true;
  kccx.Checked:=true;
   xgmm.Checked:=true;
   bbdy.Checked:=false;
  sjcl.Checked:=false;
  csh.Checked:=false;
  yygl.Checked:=false;
  czygl.Checked:=false;
  ghsgl.Checked:=false;
  bhgl.Checked:=false;
  rkgl.Checked:=false;
  ckgl.Checked:=false;
  kcgl.Checked:=false;
   sjbf.Checked:=false;
  ckrz.Checked:=false;
   end;
end;

end.
