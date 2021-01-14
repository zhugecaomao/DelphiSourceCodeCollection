unit bqjcut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  Tbqjcfm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    adoquery: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
  procedure shujuchuli(str:string;adoquery:TADOQUERY);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bqjcfm: Tbqjcfm;

implementation


{$R *.dfm}
procedure Tbqjcfm.shujuchuli(str:string;adoquery:TADOQUERY);
begin
 with adoquery do
 begin
  close;
  sql.clear;
  sql.add(str);
  execsql;
 end;
end;

procedure Tbqjcfm.BitBtn1Click(Sender: TObject);
var
mypath,str,str1:string;
qqkc:integer;
qqje:double;
id:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';

try
  str:='delete from hzb';
  shujuchuli(str,adoquery); //清空前期库存汇总表
  str:='insert into hzb(材料编号,前期库存,前期金额) select 编号,期末库存,总金额 from kcb';
  shujuchuli(str,adoquery); //从库存表中导入前期库存数据
  str:='update kcb set 前期库存=0,本期进货=0,本期消耗=0,期末库存=0,总金额=0';
  shujuchuli(str,adoquery); //初始化库存表
  //从汇总表中导入前期库存数据到库存表
  str:='select * from hzb';
 with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add(str);
    open;
    if recordcount>0 then
     begin
        first;
        while not eof do
         begin
           qqkc:=fieldbyname('前期库存').AsInteger;
           qqje:=fieldbyname('前期金额').AsVariant;
           id:=fieldbyname('材料编号').AsString;
            str1:='update kcb set 前期库存=:qqkc,本期进货=0,本期消耗=0,期末库存=:qmkc,总金额=:qqje where 编号=:bh';
            with adoquery1 do
             begin
              close;
              sql.Clear;
              sql.Add(str1);
              parameters.ParamByName('qqkc').Value:=qqkc;
              parameters.ParamByName('qqje').Value:=qqje;
              parameters.ParamByName('qmkc').Value:=qqkc;
              Parameters.ParamByName('bh').Value:=id;
              execsql;
            end;
             next;
        end;
     end;
  end;
str:='delete from lskcb';
shujuchuli(str,adoquery);//清空临时库存表
str:='delete from yrkb';
shujuchuli(str,adoquery); //清空月入库表
str:='delete from yckb';
shujuchuli(str,adoquery); //清空月出库表

showmessage('数据处理成功！');
except
showmessage('数据处理失败！');
end;
close;
end;

end.
