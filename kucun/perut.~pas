unit perut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB, ADODB;

type
  Tryglfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    xmedit: TEdit;
    Label2: TLabel;
    tjbt: TSpeedButton;
    xgedit: TSpeedButton;
    scedit: TSpeedButton;
    closebt: TSpeedButton;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    zwedit: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure tjbtClick(Sender: TObject);
    procedure sceditClick(Sender: TObject);
    procedure xgeditClick(Sender: TObject);
    procedure closebtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ryglfm: Tryglfm;

implementation

{$R *.dfm}

procedure Tryglfm.FormCreate(Sender: TObject);
var
mypath:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from gzyb');
open;
end;
end;

procedure Tryglfm.DBGrid1CellClick(Column: TColumn);
begin
with adoquery do
begin
xmedit.Text:=fieldbyname('姓名').asstring;
zwedit.Text:=fieldbyname('职务').asstring;
end;
end;

procedure Tryglfm.tjbtClick(Sender: TObject);
begin
if xmedit.Text='' then
begin
showmessage('姓名不能为空!');
exit;
end;
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('insert into  gzyb (姓名,职务) values(:xm,:zw)');
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
Parameters.ParamByName('zw').Value:=trim(zwedit.Text);
execsql;
showmessage('添加成功!');
xmedit.Text:='';
zwedit.Text:='';
end;
except
showmessage('添加失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from gzyb');
open;
end;
end;

procedure Tryglfm.sceditClick(Sender: TObject);
begin
if messagedlg('确定删除吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('delete from gzyb where 姓名=:xm');
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
execsql;
showmessage('删除成功!');
xmedit.Text:='';
zwedit.Text:='';
end;
except
showmessage('删除失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from gzyb');
open;
end;
end;
end;

procedure Tryglfm.xgeditClick(Sender: TObject);
begin
try
with adoquery do
begin
close;
sql.Clear;
sql.Add('update gzyb set 职务=:zw where 姓名=:xm');
Parameters.ParamByName('xm').Value:=trim(xmedit.Text);
Parameters.ParamByName('zw').Value:=trim(zwedit.Text);
execsql;
showmessage('修改成功!');
xmedit.Text:='';
zwedit.Text:='';
end;
 except
showmessage('修改失败!');
end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from gzyb');
open;
end;
end;

procedure Tryglfm.closebtClick(Sender: TObject);
begin
close;
end;

end.
