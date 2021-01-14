unit chcxut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB,
  Menus;

type
  Tckcxfm = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    clmcbox: TComboBox;
    ms1box: TComboBox;
    Label1: TLabel;
    rqbox: TDateTimePicker;
    msbox: TComboBox;
    Label2: TLabel;
    rq1box: TDateTimePicker;
    cxbt: TBitBtn;
    qxbt: TBitBtn;
    BitBtn3: TBitBtn;
    closebt: TBitBtn;
    clbhedit: TComboBox;
    ADOQuery1: TADOQuery;
    procedure mcrbClick(Sender: TObject);
    procedure bhrbClick(Sender: TObject);
    procedure rqrbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxbtClick(Sender: TObject);
    procedure lastbtClick(Sender: TObject);
    procedure nextbtClick(Sender: TObject);
    procedure closebtClick(Sender: TObject);
    procedure clmcboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clbheditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rqboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure qxbtClick(Sender: TObject);
    procedure clmcboxChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ckcxfm: Tckcxfm;
   checked:integer;
implementation

{$R *.dfm}

procedure Tckcxfm.mcrbClick(Sender: TObject);
begin
clmcbox.clear;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
first;
while not eof do
begin
clmcbox.Items.Add(fieldbyname('名称').AsString);
next;
end;
end;
checked:=1;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from ckb');
open;
end;
end;

procedure Tckcxfm.bhrbClick(Sender: TObject);
begin
checked:=2;
clbhedit.clear;
with adoquery do
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
checked:=1;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from ckb');
open;
end;
end;

procedure Tckcxfm.rqrbClick(Sender: TObject);
begin
checked:=3
end;

procedure Tckcxfm.FormCreate(Sender: TObject);
var
mypath:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';

ADOquery.active:=true;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select ckb.名称,规格,单位,数量,单价,总金额,ckdb.客户名称,领货日期,出库日期,经手人,ckb.备注 from ckb,ckdb where ckb.单据编号=ckdb.单据编号');
open;
end;

rqbox.Date:=date();
rq1box.Date:=date();
end;

procedure Tckcxfm.cxbtClick(Sender: TObject);
var
str:string;
begin
  str:='select ckb.名称,规格,单位,数量,单价,总金额,ckdb.客户名称,领货日期,出库日期,经手人,ckb.备注 from ckb,ckdb where ckb.单据编号=ckdb.单据编号 and ckb.id=""';
 if ((clmcbox.Text<>'') and (msbox.Text='精确')) then
 str:=str+' and '+'ckb.'+trim(clmcbox.Text)+'=:mc';
 if ((clmcbox.Text<>'') and (msbox.Text='模糊')) then
 str:=str+' and '+'ckb.'+trim(clmcbox.Text)+' like :mc1';
 if ms1box.Text<>'' then
 str:=str+' and ckb.单据编号=ckdb.单据编号 and ckdb.出库日期>=:jhsj1 and ckdb.出库日期<=:jhsj2';
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
 Parameters.ParamByName('jhsj1').Value:=datetostr(rqbox.Date);
 Parameters.ParamByName('jhsj2').Value:=datetostr(rq1box.Date);
 end;
open;
end;
end;

procedure Tckcxfm.lastbtClick(Sender: TObject);
begin
with adoquery do
begin
Prior;
end;
end;

procedure Tckcxfm.nextbtClick(Sender: TObject);
begin
with adoquery do
begin
next;
end;
end;

procedure Tckcxfm.closebtClick(Sender: TObject);
begin
close;
end;

procedure Tckcxfm.clmcboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Tckcxfm.clbheditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Tckcxfm.rqboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Tckcxfm.N1Click(Sender: TObject);
begin
cxbt.Click;
end;

procedure Tckcxfm.N2Click(Sender: TObject);
begin
qxbt.Click;
end;

procedure Tckcxfm.N3Click(Sender: TObject);
begin
closebt.Click;
end;

procedure Tckcxfm.SpeedButton1Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from ckb');
open;
end;
end;

procedure Tckcxfm.BitBtn3Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select ckb.名称,规格,单位,数量,单价,总金额,ckdb.客户名称,领货日期,出库日期,经手人,ckb.备注 from ckb,ckdb where ckb.单据编号=ckdb.单据编号');
open;
end;
end;

procedure Tckcxfm.qxbtClick(Sender: TObject);
begin
msbox.Text:='';
ms1box.Text:='';
clmcbox.Text:='';
clbhedit.Clear;
end;

procedure Tckcxfm.clmcboxChange(Sender: TObject);
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
