unit infindut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, ADODB, ComCtrls,
  Menus;

type
  Trkcxfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    clmcbox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    rq1box: TDateTimePicker;
    rq2box: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    clbhedit: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    cxbt: TBitBtn;
    qxbt: TBitBtn;
    BitBtn3: TBitBtn;
    closebt: TBitBtn;
    msbox: TComboBox;
    ms1box: TComboBox;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure cxbtClick(Sender: TObject);
    procedure closebtClick(Sender: TObject);
    procedure lastbtClick(Sender: TObject);
    procedure nextbtClick(Sender: TObject);
    procedure qxbtClick(Sender: TObject);
    procedure clmcboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clbheditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rq1boxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rq2boxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure clmcboxChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rkcxfm: Trkcxfm;
  checked:integer;
implementation

{$R *.dfm}

procedure Trkcxfm.FormCreate(Sender: TObject);
var
mypath:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';

//ADOquery.active:=true;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select rkb.名称,规格,单位,数量,单价,总金额,rkdb.进货单位,进货日期,入库日期,经手人,rkb.备注 from rkb,rkdb where rkb.单据编号=rkdb.单据编号');
open;
end;
rq1box.Date:=date();
rq2box.Date:=date();
end;

procedure Trkcxfm.cxbtClick(Sender: TObject);
var
str:string;
begin
//if (mcrb.Checked=false) or (bhrb.Checked=false) or (sjrb.Checked=false) then
//begin
//showmessage('请选择查询条件!');
//exit;
//end;
with adoquery do
begin
close;
sql.Clear;
case checked of
1:
begin
sql.Add('select * from rkb where 名称=:mc');
Parameters.ParamByName('mc').Value:=clmcbox.Text;
end;
2:
begin
sql.Add('select * from rkb where 编号=:bh');
Parameters.ParamByName('bh').Value:=clbhedit.Text;
end;
3:
begin
sql.Add('select * from rkb where 进货日期>=:rq1 and 进货日期<=:rq2');
Parameters.ParamByName('rq1').Value:=datetostr(rq1box.Date);
Parameters.ParamByName('rq2').Value:=datetostr(rq2box.Date);
end;
end;
open;
end;
end;

procedure Trkcxfm.closebtClick(Sender: TObject);
begin
close;
end;

procedure Trkcxfm.lastbtClick(Sender: TObject);
begin
with adoquery do
begin
Prior;
end;
end;

procedure Trkcxfm.nextbtClick(Sender: TObject);
begin
with adoquery do
begin
next;
end;
end;

procedure Trkcxfm.qxbtClick(Sender: TObject);
begin
clbhedit.Clear;
end;

procedure Trkcxfm.clmcboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Trkcxfm.clbheditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Trkcxfm.rq1boxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Trkcxfm.rq2boxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Trkcxfm.N1Click(Sender: TObject);
begin
cxbt.Click;
end;

procedure Trkcxfm.N2Click(Sender: TObject);
begin
qxbt.Click;
end;

procedure Trkcxfm.N3Click(Sender: TObject);
begin
closebt.Click;
end;

procedure Trkcxfm.SpeedButton1Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select rkb.名称,规格,单位,数量,单价,总金额,rkdb.进货单位,进货日期,入库日期,经手人,rkb.备注 from rkb,rkdb where rkb.单据编号=rkdb.单据编号');
open;
end;
end;

procedure Trkcxfm.BitBtn1Click(Sender: TObject);
var
str:string;
begin
 str:='select rkb.名称,规格,单位,数量,单价,总金额,rkdb.进货单位,进货日期,入库日期,经手人,rkb.备注 from rkb,rkdb where rkb.单据编号=rkdb.单据编号 and rkb.id=""';
 if ((clmcbox.Text<>'') and (msbox.Text='精确')) then
 str:=str+' and '+'rkb.'+trim(clmcbox.Text)+'=:mc';
 if ((clmcbox.Text<>'') and (msbox.Text='模糊')) then
 str:=str+' and '+'rkb.'+trim(clmcbox.Text)+' like :mc1';
 if ms1box.Text<>'' then
 str:=str+' and rkb.单据编号=rkdb.单据编号 and rkdb.入库日期>=:jhsj1 and rkdb.入库日期<=:jhsj2';
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
if ((clmcbox.Text<>'') and (msbox.Text='精确')) then
Parameters.ParamByName('mc').Value:=trim(clbhedit.Text);
if ((clmcbox.Text<>'') and (msbox.Text='模糊')) then
 Parameters.ParamByName('mc1').Value:='%'+trim(clbhedit.Text)+'%';
if ms1box.Text<>'' then
 begin
 Parameters.ParamByName('jhsj1').Value:=datetostr(rq1box.Date);
 Parameters.ParamByName('jhsj2').Value:=datetostr(rq2box.Date);
 end;
open;
end;
end;

procedure Trkcxfm.BitBtn2Click(Sender: TObject);
begin
msbox.Text:='';
ms1box.Text:='';
clmcbox.Text:='';
clbhedit.Clear;
end;

procedure Trkcxfm.BitBtn3Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select rkb.名称,规格,单位,数量,单价,总金额,rkdb.进货单位,进货日期,入库日期,经手人,rkb.备注 from rkb,rkdb where rkb.单据编号=rkdb.单据编号');
open;
end;
end;

procedure Trkcxfm.BitBtn4Click(Sender: TObject);
begin
with adoquery do
begin
Prior;
end;
end;

procedure Trkcxfm.BitBtn5Click(Sender: TObject);
begin
with adoquery do
begin
next;
end;
end;

procedure Trkcxfm.BitBtn6Click(Sender: TObject);
begin
close;
end;

procedure Trkcxfm.clmcboxChange(Sender: TObject);
begin
if clmcbox.Text='名称' then
  begin
   clbhedit.clear;
    with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
first;
while not eof do
begin
clbhedit.Items.Add(fieldbyname('名称').AsString);
next;
end;
end;
  end;
 if clmcbox.Text='编号' then
  begin
  clbhedit.clear;
    with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
first;
while not eof do
begin
clbhedit.Items.Add(fieldbyname('编号').AsString);
next;
end;
end;
  end;
end;

end.
