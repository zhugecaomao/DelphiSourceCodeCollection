unit fhdaut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, ExtCtrls;

type
  Tfhdyfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    ADOQuery: TADOQuery;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid2: TDBGrid;
    bh: TEdit;
    GroupBox1: TGroupBox;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn8: TBitBtn;
    ADOQuery2: TADOQuery;
    BitBtn7: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fhdyfm: Tfhdyfm;
  mypath,str,str1:string;
implementation

uses ckdjut;

{$R *.dfm}

procedure Tfhdyfm.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfhdyfm.FormCreate(Sender: TObject);
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=false;
open;
 end;
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('delete * from fhddb');
execsql;
end;

with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb order by num desc');
open;
end;
 
end;

procedure Tfhdyfm.BitBtn1Click(Sender: TObject);
begin
chbbfm:=Tchbbfm.Create(self);

chbbfm.quickrep1.preview;

chbbfm.Free;

end;

procedure Tfhdyfm.BitBtn2Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=true;
open;
 end;
end;

procedure Tfhdyfm.BitBtn3Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=false;
open;
 end;
end;

procedure Tfhdyfm.BitBtn4Click(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb order by num desc');
open;
end;
end;

procedure Tfhdyfm.DBGrid1CellClick(Column: TColumn);

var
flag:boolean;
begin
flag:=false;
bh.Text:=adoquery.fieldbyname('num').asstring;
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb where num=:num');
Parameters.ParamByName('num').Value:=trim(bh.Text);
open;
if recordcount>=1 then
flag:=true;
end;
if flag=true then
begin
showmessage('此记录已经选择');
exit;
end
else
begin
str:='update yckb set 打印=:dy where num=:num';
with adoquery do
begin
  close;
  sql.Clear;
  sql.Add(str);
  Parameters.ParamByName('num').Value:=trim(bh.Text);
  Parameters.ParamByName('dy').Value:=true;
  execsql;
end;
  str:='insert into fhddb select * from yckb where num=:bh';
  with adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add(str);
     Parameters.ParamByName('bh').Value:=trim(bh.Text);
     execsql;
   end;
 end;
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb');
open;
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=false;
open;
end;

end;

procedure Tfhdyfm.DBGrid2CellClick(Column: TColumn);
begin

bh.Text:=adoquery1.fieldbyname('num').asstring;

end;

procedure Tfhdyfm.BitBtn6Click(Sender: TObject);
begin

str:='delete * from fhddb where num=:bh';
with adoquery1 do
 begin
   close;
   sql.Clear;
   sql.Add(str);
   Parameters.ParamByName('bh').Value:=trim(bh.Text);
   execsql;
 end;
  str:='update yckb set 打印=false where num=:num';
with adoquery do
begin
  close;
  sql.Clear;
  sql.Add(str);
  Parameters.ParamByName('num').Value:=trim(bh.Text);
  execsql;
end;
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb order by num desc');
open;

 end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=false;
open;
 end;
end;

procedure Tfhdyfm.BitBtn7Click(Sender: TObject);
begin
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb order by num desc');
open;
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from yckb where 打印=:dy order by num desc');
Parameters.ParamByName('dy').Value:=false;
open;
end;

end;

procedure Tfhdyfm.BitBtn8Click(Sender: TObject);
begin
with adoquery1 do
begin
close;
sql.Clear;
sql.Add('select * from fhddb order by num desc');
open;

 end;
end;

end.
