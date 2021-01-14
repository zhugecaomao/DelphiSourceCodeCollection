unit MRPCalForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TMRPCal = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    ADOCommand1: TADOCommand;
    procedure BitBtn1Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MRPCal: TMRPCal;

implementation

{$R *.dfm}
 //------------MRP计算------------------
procedure TMRPCal.BitBtn1Click(Sender: TObject);
var
//调用储存过程时的参数
v1,v2,v3:string;
i:integer;
begin
//考虑库存，生产和采购订单
if checkbox1.Checked then
v1:='1'
else
v1:='0';
//是否考虑提前期
if checkbox2.Checked then
v2:='1'
else
v2:='0';
//是否考虑损耗
if checkbox3.Checked then
v3:='1'
else
v3:='0';
 //调用储存过程，执行mrp计算
 adocommand1.CommandText:='exec sf_mrp计算 '''+v1+''','''+v2+''','''+v3+'''';
 adocommand1.Execute;
 //刷新数据
 adoquery2.Active:=false;
 adoquery2.Active:=true;
  //允许发布结算结果
  bitbtn2.Enabled:=true;
 end;


procedure TMRPCal.DataSource2DataChange(Sender: TObject; Field: TField);
begin
//设置列宽度
dbgrid1.Columns[0].Width:=80;
dbgrid2.Columns[1].Width:=80;
dbgrid2.Columns[2].Width:=64;
dbgrid2.Columns[3].Width:=64;
dbgrid2.Columns[4].Width:=64;
dbgrid2.Columns[5].Width:=64;
dbgrid2.Columns[6].Width:=64;
dbgrid2.Columns[7].Width:=64;
dbgrid2.Columns[8].Width:=64;
dbgrid2.Columns[9].Width:=64;
dbgrid2.Columns[10].Width:=64;
dbgrid2.Columns[11].Width:=64;
end;

//关闭窗体
procedure TMRPCal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//--------------发布MRP计算结果-------------
procedure TMRPCal.BitBtn2Click(Sender: TObject);
begin
if application.MessageBox('是否发布本次计算结果','发布mrp计算结果',MB_OKCANCEL)=ID_OK then
 begin
 //调用储存过程，执行mrp计算结果发布
 adocommand1.CommandText:='exec sf_mrp结果发布';
 adocommand1.Execute;
 //刷新数据
 adoquery2.Active:=false;
 adoquery2.Active:=true;
 adoquery1.Active:=false;
 adoquery1.Active:=true;
 end;
end;

end.
