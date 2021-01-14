unit SumAccountForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TSumAccount = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    StringGrid1: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);


    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
    //统计计算是否平衡
    procedure sumtable();
  public
    { Public declarations }
    //当使用后结帐时所调用的函数
    procedure foruse();
    //初始化帐本时使用
    procedure forinitial();

  end;

var
  SumAccount: TSumAccount;

implementation

uses MainForm;

{$R *.dfm}

procedure TSumAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;

end;

procedure TSumAccount.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 //设置过滤条件
 datasource1.DataSet.Filter:='本期发生借方<>0 OR 本期发生贷方<>0 OR 期初借方<>0 OR 期初贷方<>0 OR 期末借方<>0 OR 期末贷方<>0';
 datasource1.DataSet.Filtered:=true;
 //设置表的列宽
dbgrid1.Columns[0].Width:=48;
dbgrid1.Columns[1].Width:=100;
dbgrid1.Columns[2].Width:=64;
dbgrid1.Columns[3].Width:=64;
dbgrid1.Columns[4].Width:=64;
dbgrid1.Columns[5].Width:=64;
dbgrid1.Columns[6].Width:=64;
dbgrid1.Columns[7].Width:=64;

end;

//----------------初始化表的设置------------

procedure TSumAccount.FormShow(Sender: TObject);

begin


//设置表格表头显示与宽度
stringgrid1.Cells[1,0]:='是否平衡';
stringgrid1.Cells[2,0]:='期初借方';
stringgrid1.Cells[3,0]:='期初贷方';
stringgrid1.Cells[4,0]:='本期发生借方';
stringgrid1.Cells[5,0]:='本期发生贷方';
stringgrid1.Cells[6,0]:='期末借方';
stringgrid1.Cells[7,0]:='期末贷方';
stringgrid1.Cells[0,1]:='合计';
stringgrid1.ColWidths[0]:=48;
stringgrid1.ColWidths[1]:=64;
stringgrid1.ColWidths[2]:=64;
stringgrid1.ColWidths[3]:=64;
stringgrid1.ColWidths[4]:=128;
stringgrid1.ColWidths[5]:=128;
stringgrid1.ColWidths[6]:=64;
stringgrid1.ColWidths[7]:=64;
stringgrid1.RowHeights[0]:=20;
stringgrid1.RowHeights[1]:=20;

end;

//------------在初始化时统计工作的完成-----------
procedure TSumAccount.forinitial;
begin
//根据不同的状态设置SQL代码，以计算不同的平衡情况
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select 科目代码, 科目名称,');
 adoquery1.SQL.Add('(case when 余额方向=''借方'' then 期初余额 else 0 end - 累计借方)');
 adoquery1.SQL.Add('as 期初借方,');
 adoquery1.SQL.Add('(case when 余额方向=''贷方'' then 期初余额 else 0 end - 累计贷方)');
 adoquery1.SQL.Add(' as 期初贷方,');
 adoquery1.SQL.Add('累计借方 as 本期发生借方,累计贷方 as 本期发生贷方,');
 adoquery1.SQL.Add('  case when 余额方向=''借方'' then 期初余额 else 0 end as 期末借方,');
 adoquery1.SQL.Add('  case when 余额方向=''贷方'' then 期初余额 else 0 end as 期末贷方');
 adoquery1.SQL.Add(' from 帐簿初始化表 where 累计借方<>0 or 累计贷方<>0 or 期初余额<>0');
 adoquery1.Open;
 //统计数据
 sumtable;
end;


//------------在正式使用时统计工作的完成-----------
procedure TSumAccount.foruse;
begin
//根据不同的状态设置SQL代码，以计算不同的平衡情况

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select a.科目代码, b.科目名称,');
 adoquery1.SQL.Add('(case when a.余额方向=''借方'' then 期初余额 else 0 end )');
 adoquery1.SQL.Add(' as 期初借方,');
 adoquery1.SQL.Add('(case when a.余额方向=''贷方'' then 期初余额 else 0 end)');
 adoquery1.SQL.Add('as 期初贷方,');
 adoquery1.SQL.Add('本期借方合计 as 本期发生借方, 本期贷方合计 as 本期发生贷方,');
 adoquery1.SQL.Add('case when a.余额方向=''借方'' then 余额 else 0 end as 期末借方,');
 adoquery1.SQL.Add('case when a.余额方向=''贷方'' then 余额 else 0 end as 期末贷方');
 adoquery1.SQL.Add(' from 本期汇总帐簿 as a, 科目表 as b  ');
 adoquery1.SQL.Add(' where a.科目代码 = b.科目代码 and (本期借方合计<> 0');
 adoquery1.SQL.Add(' or 本期贷方合计<>0 or 期初余额<>0 or 余额<>0)');
 adoquery1.Open;
  //统计数据
 sumtable;
end;

//-----------------对数据进行统计---------------
procedure TSumAccount.sumtable;
var
count,i:integer;
val1,val2,val3,val4,val5,val6:double;
begin
 //计算平衡表中的记录数
count:=datasource1.DataSet.RecordCount;
//统计信息，判断是否试算平衡
val1:=0;
val2:=0;
val3:=0;
val4:=0;
val5:=0;
val6:=0;
while not datasource1.DataSet.Eof do
 begin
  val1:=strtofloat(dbgrid1.Fields[2].Text)+val1;
  val2:=strtofloat(dbgrid1.Fields[3].Text)+val2;
  val3:=strtofloat(dbgrid1.Fields[4].Text)+val3;
  val4:=strtofloat(dbgrid1.Fields[5].Text)+val4;
  val5:=strtofloat(dbgrid1.Fields[6].Text)+val5;
  val6:=strtofloat(dbgrid1.Fields[7].Text)+val6;
  datasource1.DataSet.Next;
 end;
//显示统计结果
stringgrid1.Cells[1,1]:='是否平衡';
stringgrid1.Cells[2,1]:=floattostr(val1);
stringgrid1.Cells[3,1]:=floattostr(val2);
stringgrid1.Cells[4,1]:=floattostr(val3);
stringgrid1.Cells[5,1]:=floattostr(val4);
stringgrid1.Cells[6,1]:=floattostr(val5);
stringgrid1.Cells[7,1]:=floattostr(val6);
if (val1<>val2)or(val3<>val4)or(val5<>val6) then
 begin
 stringgrid1.Cells[1,1]:='不平衡';
 stringgrid1.Font.Color:=clred;
 end
 else
 stringgrid1.Cells[1,1]:='平衡';
end;




end.
