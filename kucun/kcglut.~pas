unit kcglut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  Tkcglfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery: TADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    GroupBox1: TGroupBox;
    clbh: TLabeledEdit;
    clmc: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    zje: TEdit;
    Label7: TLabel;
    clgg: TComboBox;
    cldw: TComboBox;
    qqkc: TEdit;
    bh: TEdit;
    BitBtn8: TBitBtn;
    Label9: TLabel;
    bqjh: TEdit;
    bqxh: TEdit;
    Label10: TLabel;
    qmkc: TEdit;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
  procedure reloaddata(str:string;adoquery:TADOQUERY);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kcglfm: Tkcglfm;
  vsl:integer;
  vzje:double;
implementation

{$R *.dfm}
procedure Tkcglfm.reloaddata(str:string;adoquery:TADOQUERY);
begin
  with adoquery do
    begin
      close;
      sql.clear;
      sql.add(str);
      open;
    end;
end;

procedure Tkcglfm.FormCreate(Sender: TObject);
var
mypath,gg,ks,str:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
first;
gg:='';
ks:='';
while not eof do
begin
clmc.Items.Add(fieldbyname('名称').AsString);
if (gg<>fieldbyname('规格').AsString) then
clgg.Items.Add(fieldbyname('规格').AsString);

next;
end;
end;
str:='select * from kcb';
reloaddata(str,adoquery);
end;

procedure Tkcglfm.DBGrid1CellClick(Column: TColumn);
begin
with adoquery do
  begin
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
    qqkc.Text:=fieldbyname('前期库存').AsString;
   bqjh.Text:=fieldbyname('本期进货').AsString;
   bqxh.Text:=fieldbyname('本期消耗').AsString;
   qmkc.Text:=fieldbyname('期末库存').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('序号').AsString;
   end;
end;

procedure Tkcglfm.BitBtn5Click(Sender: TObject);
begin
with adoquery do
  begin
   Prior;
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
    qqkc.Text:=fieldbyname('前期库存').AsString;
   bqjh.Text:=fieldbyname('本期进货').AsString;
   bqxh.Text:=fieldbyname('本期消耗').AsString;
   qmkc.Text:=fieldbyname('期末库存').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('序号').AsString;
  end;
end;

procedure Tkcglfm.BitBtn6Click(Sender: TObject);
begin
with adoquery do
  begin
   next;
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
     qqkc.Text:=fieldbyname('前期库存').AsString;
   bqjh.Text:=fieldbyname('本期进货').AsString;
   bqxh.Text:=fieldbyname('本期消耗').AsString;
   qmkc.Text:=fieldbyname('期末库存').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('序号').AsString;
  end;
end;

procedure Tkcglfm.BitBtn2Click(Sender: TObject);
var
str:string;
vbqjh,vbqkc:integer;
v1zje:double;
begin
str:='update kcb set 编号=:clbh,名称=:clmc,规格=:clgg';
str:=str+',前期库存=:qqkc,本期进货=:bqjh,本期消耗=:bqxh,期末库存=:qmkc,单位=:cldw,总金额=:zje where 序号=:bh';
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
    Parameters.ParamByName('clmc').Value:=trim(clmc.Text);
    Parameters.ParamByName('clgg').Value:=trim(clgg.Text);
     Parameters.ParamByName('qqkc').Value:=trim(qqkc.Text);
    Parameters.ParamByName('bqjh').Value:=trim(bqjh.Text);
    Parameters.ParamByName('bqxh').Value:=trim(bqxh.Text);
    Parameters.ParamByName('qmkc').Value:=trim(qmkc.Text);
    Parameters.ParamByName('cldw').Value:=trim(cldw.Text);
     parameters.ParamByName('zje').Value:=trim(zje.Text);
    Parameters.ParamByName('bh').Value:=trim(bh.Text);
    if messagedlg('提示：你要修改的材料编号是：['+clbh.Text+']确定修改吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
    execsql;
    showmessage('修改成功！');
    except
    showmessage('修改失败！');
    end;
   end;
   end;

  str:='select * from kcb';
  reloaddata(str,adoquery);
end;

procedure Tkcglfm.BitBtn3Click(Sender: TObject);
var
str,str1:string;
vbqjh,vbqkc:integer;
v1zje:double;
begin
 str:='delete  from kcb where num=:bh';
 //str1:='delete from yrkb where 编号=:bh';
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('bh').Value:=trim(bh.Text);
    if messagedlg('警告：删除后不可恢复!你要删除的材料编号是：['+clbh.Text+']确定删除吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
     execsql;
     showmessage('删除成功！');
    except
     showmessage('删除失败！');
    end;
   end;
   end;
  str:='select * from kcb';
   reloaddata(str,adoquery);
end;

procedure Tkcglfm.BitBtn7Click(Sender: TObject);
begin
close;
end;

procedure Tkcglfm.BitBtn1Click(Sender: TObject);
var
str:string;
begin
str:='select * from kcb where id=:id';
if clbh.Text<>'' then
str:=str+' and 编号=:clbh';
if clmc.Text<>'' then
str:=str+' and 名称=:clmc';
if clgg.Text<>'' then
str:=str+' and 规格=:clgg';
  with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('id').Value:='';
      if clbh.Text<>'' then
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
     if clmc.Text<>'' then
    Parameters.ParamByName('clmc').Value:=trim(clmc.Text);
    if clgg.Text<>'' then
    Parameters.ParamByName('clgg').Value:=trim(clgg.Text);
       open;
    if recordcount<1 then
    showmessage('对不起没有找到你查询的记录！请核对！')
    else
    showmessage('共有找到'+inttostr(recordcount)+'条记录，请单击你所需要的记录编号然后在左边进行数据操作！');
  end;
end;

procedure Tkcglfm.BitBtn8Click(Sender: TObject);
var
str:string;
begin
str:='select * from kcb';
reloaddata(str,adoquery);
end;

procedure Tkcglfm.BitBtn4Click(Sender: TObject);
begin
   clbh.Text:='';
   clmc.Text:='';
   clgg.Text:='';
     qqkc.Text:='';
   bqjh.Text:='';
   bqxh.Text:='';
   qmkc.Text:='';
   cldw.Text:='';
   zje.Text:='';
   bh.Text:='';
end;

end.
