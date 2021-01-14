unit clbhut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, Buttons;

type
  Tclbhfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    clmcedit: TEdit;
    Label2: TLabel;
    bhedit: TEdit;
    ADOQuery: TADOQuery;
    Label4: TLabel;
    clbmedit: TEdit;
    zjbt: TSpeedButton;
    xgbt: TSpeedButton;
    scbt: TSpeedButton;
    gbbt: TSpeedButton;
    DataSource1: TDataSource;
    sx: TSpeedButton;
    Label5: TLabel;
    hwedit: TEdit;
    Label6: TLabel;
    clggedit: TEdit;
    bh: TEdit;
    Label8: TLabel;
    dw: TEdit;
    kcxx: TLabeledEdit;
    kcsx: TLabeledEdit;
    kcsj: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure gbbtClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure zjbtClick(Sender: TObject);
    procedure xgbtClick(Sender: TObject);
    procedure scbtClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clbhfm: Tclbhfm;

implementation

{$R *.dfm}

procedure Tclbhfm.FormCreate(Sender: TObject);
var
mypath:string;
sno,cno,vno:string;//单据编号变量
 llen:integer; //获取长度的变量
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
clmcedit.Text:='';
clggedit.Text:='';
clbmedit.Text:='';
dw.Text:='';
kcxx.Text:='';
kcsx.Text:='';
kcsj.Text:='';
with adoquery do
  begin
   close;
   sql.Clear;
   sql.Add('select * from bhb');
   open;
   if recordcount<1 then
     begin
     cno:='00001';
     vno:=cno;
     end
     else
     begin
      close;
      sql.Clear;
      sql.Add('select max(编号) as maxno  from bhb');
      open;
      sno:=fieldbyname('maxno').AsString;
      llen:=strtoint(copy(sno,1,5))+1;
     case length(inttostr(llen)) of
     1:cno:='0000'+inttostr(strtoint(copy(sno,1,5))+1);
     2:cno:='000'+inttostr(strtoint(copy(sno,1,5))+1);
     3:cno:='00'+inttostr(strtoint(copy(sno,1,5))+1);
     4:cno:='0'+inttostr(strtoint(copy(sno,1,5))+1);
     5:cno:=inttostr(strtoint(copy(sno,1,5))+1);
      else
       cno:='00001';
    end;
        vno:=cno;

    end;
  end;
  bhedit.Text:=vno;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb order by 序号 desc');
open;
end;
end;

procedure Tclbhfm.gbbtClick(Sender: TObject);
begin
close;
end;

procedure Tclbhfm.DBGrid1CellClick(Column: TColumn);
begin
with adoquery do
begin
clmcedit.Text:=fieldbyname('名称').asstring;
bhedit.Text:=fieldbyname('编号').asstring;
clggedit.Text:=fieldbyname('规格').AsString;
clbmedit.Text:=fieldbyname('编码').AsString;
hwedit.Text:=fieldbyname('货位').AsString;
dw.Text:=fieldbyname('单位').AsString;
bh.Text:=fieldbyname('序号').AsString;
kcxx.Text:=fieldbyname('库存下限').AsString;
kcsx.Text:=fieldbyname('库存上限').AsString;
kcsj.Text:=fieldbyname('库存天数').AsString;
//dwjgedit.Text:=fieldbyname('单位价格').AsString;
end;
end;

procedure Tclbhfm.zjbtClick(Sender: TObject);
begin
if clmcedit.Text='' then
begin
showmessage('材料名不能为空!');
exit;
end;
if clbmedit.Text='' then
begin
showmessage('材料编码不能为空!');
exit;
end;
{if (kcxx.Text='')  then
begin
showmessage('请设置库存预警下限!');
exit;
end;
if (kcsx.Text='') then
begin
showmessage('请设置库存预警上限!');
exit;
end;
if (kcsj.Text='') then
begin
showmessage('请设置库存预警天数!');
exit;
end;}
if kcxx.Text='' then
kcxx.Text:='0';
if kcsx.Text='' then
kcsx.Text:='9000';
if kcsj.Text='' then
kcsj.Text:='9000';
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb where 编号=:bh');
Parameters.ParamByName('bh').Value:=trim(bhedit.Text);
open;
if recordcount>=1 then
begin
showmessage('此编号已经存在，请重新编号!');
exit;
end;
end;
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('insert into  bhb (名称,编号,货位,规格,编码,单位,库存下限,库存上限,库存天数) values(:mc,:bh,:hw,:gg,:bm,:dw,:kcxx,:kcsx,:kcsj)');
Parameters.ParamByName('mc').Value:=trim(clmcedit.Text);
Parameters.ParamByName('bh').Value:=trim(bhedit.Text);
Parameters.ParamByName('hw').Value:=trim(hwedit.Text);
Parameters.ParamByName('gg').Value:=trim(clggedit.Text);
Parameters.ParamByName('bm').Value:=trim(clbmedit.Text);
Parameters.ParamByName('kcxx').Value:=trim(kcxx.Text);
Parameters.ParamByName('kcsx').Value:=trim(kcsx.Text);
Parameters.ParamByName('kcsj').Value:=trim(kcsj.Text);
Parameters.ParamByName('dw').Value:=trim(dw.Text);
execsql;
showmessage('添加成功!');
clmcedit.Text:='';
bhedit.Text:=inttostr((strtoint(bhedit.Text)+1));
clggedit.Text:='';
//ksedit.Text:='';
clbmedit.Text:=''
//dwjgedit.Text:='';
end;
except
showmessage('添加失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
end;
 sx.Click;
 end;

procedure Tclbhfm.xgbtClick(Sender: TObject);
begin
if (kcxx.Text='')  then
begin
showmessage('请设置库存预警下限!');
exit;
end;
if (kcsx.Text='') then
begin
showmessage('请设置库存预警上限!');
exit;
end;
if (kcsj.Text='') then
begin
showmessage('请设置库存预警天数!');
exit;
end;
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('update bhb set 编号=:bh,货位=:hw,规格=:gg,编码=:bm,单位=:dw,库存下限=:kcxx,库存上限=:kcsx,库存天数=:kcsj where 序号=:id');
Parameters.ParamByName('bh').Value:=trim(bhedit.Text);
Parameters.ParamByName('hw').Value:=trim(hwedit.Text);
Parameters.ParamByName('gg').Value:=trim(clggedit.Text);
Parameters.ParamByName('bm').Value:=trim(clbmedit.Text);
Parameters.ParamByName('dw').Value:=trim(dw.Text);
Parameters.ParamByName('kcxx').Value:=trim(kcxx.Text);
Parameters.ParamByName('kcsx').Value:=trim(kcsx.Text);
Parameters.ParamByName('kcsj').Value:=trim(kcsj.Text);
Parameters.ParamByName('id').Value:=trim(bh.Text);
execsql;
showmessage('修改成功!');
clmcedit.Text:='';
bhedit.Text:='';
clggedit.Text:='';
clbmedit.Text:=''
//dwjgedit.Text:='';
end;
 except
showmessage('修改失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
end;
sx.Click;
end;

procedure Tclbhfm.scbtClick(Sender: TObject);
begin
if messagedlg('确定删除吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('delete from bhb where 序号=:id');
Parameters.ParamByName('id').Value:=trim(bh.Text);
execsql;
showmessage('删除成功!');
clmcedit.Text:='';
bhedit.Text:='';
clggedit.Text:='';
clbmedit.Text:=''
//dwjgedit.Text:='';
end;
except
showmessage('删除失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
end;
end;
sx.Click;
end;

procedure Tclbhfm.SpeedButton1Click(Sender: TObject);
begin
clmcedit.Text:='';
bhedit.Text:='';
//dwjgedit.Text:='';
hwedit.Clear;
clggedit.Text:='';
//ksedit.Text:='';
clbmedit.Text:=''
end;

end.
