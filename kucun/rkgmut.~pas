unit rkgmut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  Trkglfm = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    cldj: TEdit;
    Label6: TLabel;
    zje: TEdit;
    Label7: TLabel;
    clgg: TComboBox;
    clks: TComboBox;
    clpl: TComboBox;
    cldw: TComboBox;
    djbh: TLabeledEdit;
    sl: TEdit;
    bh: TEdit;
    BitBtn8: TBitBtn;
    sysledit: TEdit;
    Label9: TLabel;
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
    procedure slKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cldjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure slChange(Sender: TObject);
    procedure cldjChange(Sender: TObject);
  private
  procedure reloaddata(str:string;adoquery:TADOQUERY);
  procedure updatedata(str:string;adoquery:TADOQUERY);
  procedure deletedata(str:string;adoquery:TADOQUERY);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rkglfm: Trkglfm;
  vsl:integer;
  vzje:double;
implementation

{$R *.dfm}
procedure Trkglfm.updatedata(str:string;adoquery:TADOQUERY);
begin
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('djbh').Value:=trim(djbh.Text);
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
    Parameters.ParamByName('clmc').Value:=trim(clmc.Text);
    Parameters.ParamByName('clgg').Value:=trim(clgg.Text);
    Parameters.ParamByName('clks').Value:=trim(clks.Text);
    Parameters.ParamByName('clpl').Value:=trim(clpl.Text);
    Parameters.ParamByName('sl').Value:=trim(sl.Text);
    Parameters.ParamByName('sysl').Value:=trim(sysledit.Text);
    Parameters.ParamByName('cldw').Value:=trim(cldw.Text);
    Parameters.ParamByName('cldj').Value:=trim(cldj.Text);
    Parameters.ParamByName('zje').Value:=trim(zje.Text);
    Parameters.ParamByName('bh').Value:=trim( bh.Text);
    if messagedlg('提示：你要修改的单据编号是：['+djbh.Text+']确定修改吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
    execsql;
    showmessage('修改成功！');
    except
    showmessage('修改失败！');
    end;
   end;
   end;
end;
procedure Trkglfm.deletedata(str:string;adoquery:TADOQUERY);
begin
  with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('bh').Value:=trim( bh.Text);
    if messagedlg('警告：删除后不可恢复!你要删除的单据编号是：['+djbh.Text+']确定删除吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
     execsql;
     showmessage('删除成功！');
    except
     showmessage('删除失败！');
    end;
   end;
   end;
end;
procedure Trkglfm.reloaddata(str:string;adoquery:TADOQUERY);
begin
  with adoquery do
    begin
      close;
      sql.clear;
      sql.add(str);
      open;
    end;
end;

procedure Trkglfm.FormCreate(Sender: TObject);
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
if ks<>fieldbyname('款式').AsString then
clks.Items.Add(fieldbyname('款式').AsString);
gg:=fieldbyname('名称').AsString;
ks:=fieldbyname('款式').AsString;
next;
end;
end;
str:='select * from yrkb order by num desc';
reloaddata(str,adoquery);
end;

procedure Trkglfm.DBGrid1CellClick(Column: TColumn);
begin
with adoquery do
  begin
   djbh.Text:=fieldbyname('单据编号').AsString;
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
   clks.Text:=fieldbyname('款式').AsString;
   clpl.Text:=fieldbyname('品类').AsString;
   sl.Text:=fieldbyname('数量').AsString;
   sysledit.Text:=fieldbyname('剩余数量').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   cldj.Text:=fieldbyname('单价').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('单据编号').AsString;
   vsl:=fieldbyname('数量').AsInteger;
   vzje:=fieldbyname('总金额').AsFloat;
  end;
end;

procedure Trkglfm.BitBtn5Click(Sender: TObject);
begin
with adoquery do
  begin
   Prior;
   djbh.Text:=fieldbyname('单据编号').AsString;
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
   clks.Text:=fieldbyname('款式').AsString;
   clpl.Text:=fieldbyname('品类').AsString;
   sl.Text:=fieldbyname('数量').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   cldj.Text:=fieldbyname('单价').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('num').AsString;
   vsl:=fieldbyname('数量').AsInteger;
   vzje:=fieldbyname('总金额').AsFloat;
 
  end;
end;

procedure Trkglfm.BitBtn6Click(Sender: TObject);
begin
with adoquery do
  begin
   next;
   djbh.Text:=fieldbyname('单据编号').AsString;
   clbh.Text:=fieldbyname('编号').AsString;
   clmc.Text:=fieldbyname('名称').AsString;
   clgg.Text:=fieldbyname('规格').AsString;
   clks.Text:=fieldbyname('款式').AsString;
   clpl.Text:=fieldbyname('品类').AsString;
   sl.Text:=fieldbyname('数量').AsString;
   cldw.Text:=fieldbyname('单位').AsString;
   cldj.Text:=fieldbyname('单价').AsString;
   zje.Text:=fieldbyname('总金额').AsString;
   bh.Text:=fieldbyname('num').AsString;
   vsl:=fieldbyname('数量').AsVariant;
   vzje:=fieldbyname('总金额').AsVariant;
 
  end;
end;

procedure Trkglfm.BitBtn2Click(Sender: TObject);
var
str:string;
vbqjh,vbqkc:integer;
v1zje:double;
begin
if bh.Text='' then
 begin
   showmessage('没选择要修改的记录！操作失败！');
   exit;
 end;
str:='update yrkb set 单据编号=:djbh,编号=:clbh,名称=:clmc,规格=:clgg,款式=:clks';
str:=str+',品类 =:clpl,数量=:sl,剩余数量=:sysl,单位=:cldw,单价=:cldj,总金额=:zje where 单据编号=:bh';
updatedata(str,adoquery);
str:='update rkb set 单据编号=:djbh,编号=:clbh,名称=:clmc,规格=:clgg,款式=:clks';
str:=str+',品类 =:clpl,数量=:sl,单位=:cldw,剩余数量=:sysl,单价=:cldj,总金额=:zje where 单据编号=:bh';
updatedata(str,adoquery);
 {with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('djbh').Value:=trim(djbh.Text);
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
    Parameters.ParamByName('clmc').Value:=trim(clmc.Text);
    Parameters.ParamByName('clgg').Value:=trim(clgg.Text);
    Parameters.ParamByName('clks').Value:=trim(clks.Text);
    Parameters.ParamByName('clpl').Value:=trim(clpl.Text);
    Parameters.ParamByName('sl').Value:=trim(sl.Text);
    Parameters.ParamByName('cldw').Value:=trim(cldw.Text);
    Parameters.ParamByName('cldj').Value:=trim(cldj.Text);
    Parameters.ParamByName('zje').Value:=trim(zje.Text);
    Parameters.ParamByName('bh').Value:=trim( bh.Text);
    if messagedlg('提示：你要修改的单据编号是：['+djbh.Text+']确定修改吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
    execsql;
    showmessage('修改成功！');
    except
    showmessage('修改失败！');
    end;
   end;
   end; }
   str:='select * from kcb where 编号=:clbh';
   with adoquery do
    begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
    open;
    if vsl>strtoint(sl.Text) then
     vbqjh:=fieldbyname('本期进货').AsInteger-(vsl-strtoint(sl.Text))
     else
     vbqjh:=fieldbyname('本期进货').AsInteger+(strtoint(sl.Text)-vsl);
     if vsl>strtoint(sl.Text) then
     vbqkc:=fieldbyname('期末库存').AsInteger-(vsl-strtoint(sl.Text))
     else
     vbqkc:=fieldbyname('期末库存').AsInteger+(strtoint(sl.Text)-vsl);
     if vzje>strtofloat(zje.Text) then
     v1zje:=fieldbyname('总金额').AsVariant-(vzje-strtofloat(zje.Text))
     else
     v1zje:=fieldbyname('总金额').AsVariant+(strtofloat(zje.Text)-vzje);
     end;
  str:='update kcb set 本期进货=:bqjh,期末库存=:bqkc,总金额=:zje where 编号=:clbh';
  with adoquery do
    begin
     close;
     sql.Clear;
     sql.Add(str);
     Parameters.ParamByName('bqjh').Value:=vbqjh;
     Parameters.ParamByName('bqkc').Value:=vbqkc;
     Parameters.ParamByName('zje').Value:=v1zje;
     Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
     execsql;
    end;
  str:='select * from yrkb order by num desc';
  reloaddata(str,adoquery);
end;

procedure Trkglfm.BitBtn3Click(Sender: TObject);
var
str,str1:string;
vbqjh,vbqkc:integer;
v1zje:double;
begin
 if bh.Text='' then
 begin
   showmessage('没选择要删除的记录！操作失败！');
   exit;
 end;
 str:='delete  from yrkb where 单据编号=:bh';
 deletedata(str,adoquery);
 str:='delete  from rkb where 单据编号=:bh';
 deletedata(str,adoquery);
 //str1:='delete from yrkb where 编号=:bh';
 {with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('bh').Value:=trim( bh.Text);
    if messagedlg('警告：删除后不可恢复!你要删除的单据编号是：['+djbh.Text+']确定删除吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
    try
     execsql;
     showmessage('删除成功！');
    except
     showmessage('删除失败！');
    end;
   end;
   end;}
   str:='select * from kcb where 编号=:clbh';
   with adoquery do
    begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
    open;
     vbqjh:=fieldbyname('本期进货').AsInteger-strtoint(sl.Text);
     vbqkc:=fieldbyname('期末库存').AsInteger-strtoint(sl.Text);
     v1zje:=fieldbyname('总金额').AsVariant-strtofloat(zje.Text);
     end;
  str:='update kcb set 本期进货=:bqjh,期末库存=:bqkc,总金额=:zje where 编号=:clbh';
  with adoquery do
    begin
     close;
     sql.Clear;
     sql.Add(str);
     Parameters.ParamByName('bqjh').Value:=vbqjh;
     Parameters.ParamByName('bqkc').Value:=vbqkc;
     Parameters.ParamByName('zje').Value:=v1zje;
     Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
     execsql;
    end;
   str:='select * from yrkb order by num desc';
   reloaddata(str,adoquery);
end;

procedure Trkglfm.BitBtn7Click(Sender: TObject);
begin
close;
end;

procedure Trkglfm.BitBtn1Click(Sender: TObject);
var
str:string;
begin
str:='select * from  yrkb where id=:id';
if djbh.Text<>'' then
str:=str+' and 单据编号=:djbh';
if clbh.Text<>'' then
str:=str+' and 编号=:clbh';
if clmc.Text<>'' then
str:=str+' and 名称=:clmc';
if clgg.Text<>'' then
str:=str+' and 规格=:clgg';
if clks.Text<>'' then
str:=str+' and 款式=:clks';
if clpl.Text<>'' then
str:=str+' and 品类=:clpl';
  with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('id').Value:='';
    if  djbh.Text<>'' then
     Parameters.ParamByName('djbh').Value:=trim(djbh.Text);
     if clbh.Text<>'' then
    Parameters.ParamByName('clbh').Value:=trim(clbh.Text);
     if clmc.Text<>'' then
    Parameters.ParamByName('clmc').Value:=trim(clmc.Text);
    if clgg.Text<>'' then
    Parameters.ParamByName('clgg').Value:=trim(clgg.Text);
    if clks.Text<>'' then
    Parameters.ParamByName('clks').Value:=trim(clks.Text);
    if clpl.Text<>'' then
    Parameters.ParamByName('clpl').Value:=trim(clpl.Text);
    open;
    if recordcount<1 then
    showmessage('对不起没有找到你查询的记录！请核对！')
    else
    showmessage('共有找到'+inttostr(recordcount)+'条记录，请单击你所需要的记录编号然后在左边进行数据操作！');
  end;
end;

procedure Trkglfm.BitBtn8Click(Sender: TObject);
var
str:string;
begin
str:='select * from yrkb';
reloaddata(str,adoquery);
end;

procedure Trkglfm.BitBtn4Click(Sender: TObject);
begin
djbh.Text:='';
   clbh.Text:='';
   clmc.Text:='';
   clgg.Text:='';
   clks.Text:='';
   clpl.Text:='';
   sl.Text:='';
   cldw.Text:='';
   cldj.Text:='';
   zje.Text:='';
   bh.Text:='';
end;

procedure Trkglfm.slKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 zje.Text:=floattostr(strtoint(sl.Text)*strtofloat(cldj.Text));
end;

procedure Trkglfm.cldjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 zje.Text:=floattostr(strtoint(sl.Text)*strtofloat(cldj.Text));
end;

procedure Trkglfm.slChange(Sender: TObject);
begin
if sl.Text='' then
  begin
   showmessage(' 数量不能为空！');
   sl.Text:='0';
   exit;
  end
  else
zje.Text:=floattostr(strtoint(sl.Text)*strtofloat(cldj.Text));

end;

procedure Trkglfm.cldjChange(Sender: TObject);
begin
if cldj.Text='' then
  begin
   showmessage(' 单价不能为空！');
   cldj.Text:='0';
   exit;
  end
  else
  zje.Text:=floattostr(strtoint(sl.Text)*strtofloat(cldj.Text));

end;

end.
