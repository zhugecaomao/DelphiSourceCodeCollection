unit khcxut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  Tkhcxfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ms1box: TComboBox;
    rqbox: TDateTimePicker;
    rq1box: TDateTimePicker;
    cxbt: TBitBtn;
    qxbt: TBitBtn;
    BitBtn3: TBitBtn;
    closebt: TBitBtn;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    khmc: TComboBox;
    procedure cxbtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure closebtClick(Sender: TObject);
    procedure qxbtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  khcxfm: Tkhcxfm;

implementation

{$R *.dfm}

procedure Tkhcxfm.cxbtClick(Sender: TObject);
var
str:string;
begin
  str:='select ckdb.客户名称,单据编号,出库日期 from ckdb where 单据编号<>""';
 if (khmc.Text<>'')  then
 str:=str+' and '+'ckdb.客户名称=:mc';
 if ms1box.Text<>'' then
 str:=str+' and ckdb.出库日期>=:jhsj1 and ckdb.出库日期<=:jhsj2';
with adoquery do
begin
close;
sql.Clear;
sql.Add(str);
if (khmc.Text<>'') then
Parameters.ParamByName('mc').Value:=trim(khmc.Text);
if ms1box.Text<>'' then
 begin
 Parameters.ParamByName('jhsj1').Value:=datetostr(rqbox.Date);
 Parameters.ParamByName('jhsj2').Value:=datetostr(rq1box.Date);
 end;
open;
end;
end;

procedure Tkhcxfm.FormCreate(Sender: TObject);
begin
with adoquery1 do
  begin
  close;
  sql.clear;
  sql.add('select * from ckdb');
  open;
  first;
  while not eof do
  begin
  khmc.Items.Add(fieldbyname('客户名称').AsString);
  next;
  end;
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select ckdb.客户名称,单据编号,出库日期  from ckdb order by 出库日期');
open;
end;

rqbox.Date:=date();
rq1box.Date:=date();
end;

procedure Tkhcxfm.closebtClick(Sender: TObject);
begin
close;
end;

procedure Tkhcxfm.qxbtClick(Sender: TObject);
begin
khmc.Text:='';
ms1box.Text:='';
end;

end.
