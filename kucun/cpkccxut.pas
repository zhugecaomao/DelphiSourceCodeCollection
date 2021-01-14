unit cpkccxut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, ADODB, Menus;

type
  Tcpkccxfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cxtj0: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    gjz0: TComboBox;
    ADOQuery1: TADOQuery;
    cxbt: TBitBtn;
    qxbt: TBitBtn;
    BitBtn5: TBitBtn;
    gbbt: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    slms1: TLabel;
    slms: TComboBox;
    sl: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure lastbtClick(Sender: TObject);
    procedure nextbtClick(Sender: TObject);
    procedure closebtClick(Sender: TObject);
    procedure qxbtClick(Sender: TObject);
    procedure cxbtClick(Sender: TObject);
    procedure cxtj0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gjz0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxtj0Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cpkccxfm: Tcpkccxfm;

implementation

uses kcyjut;

{$R *.dfm}

procedure Tcpkccxfm.FormCreate(Sender: TObject);
var
mypath:string;
gg,ks,mc:string;
begin

with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from cpkcb order by 序号');
open;
end;
end;

procedure Tcpkccxfm.lastbtClick(Sender: TObject);
begin
with adoquery do
begin
Prior;
end;
end;

procedure Tcpkccxfm.nextbtClick(Sender: TObject);
begin
with adoquery do
begin
next;
end;
end;

procedure Tcpkccxfm.closebtClick(Sender: TObject);
begin
close;
end;

procedure Tcpkccxfm.qxbtClick(Sender: TObject);
begin
gjz0.Text:='';
cxtj0.Text:='';
slms.Text:='';
sl.Text:='';
end;

procedure Tcpkccxfm.cxbtClick(Sender: TObject);
var
str:string;

begin
//if (cxtjbox.Text='') or (gjzedit.Text='') or (gjz1.Text='') or (gjz2.Text='') then
//begin
//showmessage('请输入查询完整信息！');
//exit;
//end;
//str:='select * from kcb where id=:id ';
//if ((cxtjbox.Text<>'') and (cxtj1.Text<>'') and (cxtj2.Text<>'')) then
str:='select * from kcb where  id=:id';
{if cxtj0.Text<>'' then
str:=str+' and 名称=:mc';
if cxtj1.Text<>'' then
str:=str+' and 规格=:gg';
if cxtj2.Text<>'' then
str:=str+' and 款式=:ks';
if cxtj3.Text<>'' then
 begin
  if gjz31.Text='>' then
  str:=str+' and 期末库存>:qmkc';
  if gjz31.Text='<' then
  str:=str+' and 期末库存<:qmkc';
  if gjz31.Text='=' then
  str:=str+' and 期末库存=:qmkc';
  end;
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
Parameters.ParamByName('id').Value:='';
if cxtj0.Text<>'' then
Parameters.ParamByName('mc').Value:=gjz0.Text;
if cxtj1.Text<>'' then
Parameters.ParamByName('gg').Value:=gjz1.Text;
if cxtj2.Text<>'' then
Parameters.ParamByName('ks').Value:=gjz2.Text;
if cxtj3.Text<>'' then
Parameters.ParamByName('qmkc').Value:=gjz3.Text;
Parameters.ParamByName('id').Value:='';
open;

end;}
str:='select * from cpkcb where id=""';
if cxtj0.text='成品名称' then
str:=str+'  and 名称=:gjz';
if (slms.Text<>'') and (sl.Text<>'') then
str:=str+'  and 数量'+trim(slms.Text)+':sl';
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
if  (cxtj0.text<>'') then
Parameters.ParamByName('gjz').Value:=trim(gjz0.Text);
if (slms.Text<>'') and (sl.Text<>'') then
Parameters.ParamByName('sl').Value:=trim(sl.Text);
open;

end;
end;

procedure Tcpkccxfm.cxtj0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Tcpkccxfm.gjz0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
cxbt.Click;
end;

procedure Tcpkccxfm.BitBtn1Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from kcb');
open;
end;
end;

procedure Tcpkccxfm.cxtj0Change(Sender: TObject);
var
str:string;
begin
gjz0.Clear;
str:='select * from cprkb';
with adoquery1 do
begin
  close;
  sql.Clear;
  sql.Add(str);
  open;
  first;
  while not eof do
   begin
       gjz0.Items.Add(fieldbyname('名称').AsString);
       next;
   end;
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from kcb');
open;
end;
end;

procedure Tcpkccxfm.SpeedButton1Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from kcb');
open;
end;
end;

procedure Tcpkccxfm.BitBtn5Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from cpkcb order by 序号');
open;
end;
end;

procedure Tcpkccxfm.N1Click(Sender: TObject);
begin
cxbt.Click;
end;

procedure Tcpkccxfm.N2Click(Sender: TObject);
begin
qxbt.Click;
end;

procedure Tcpkccxfm.N3Click(Sender: TObject);
begin
gbbt.Click;
end;

end.
