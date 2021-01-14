unit dllForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB;

type
  TdllSec = class(TForm)
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//此函数负责取得当前应用程序的句柄并显示窗体
function showdllform(Ahandle:Thandle;Acaption:string;tablename:string):string;stdcall;
//用此变量向调用dll的程序返回值
var
 resultstr:string;
implementation

{$R *.dfm}
function showdllform(Ahandle:Thandle;Acaption:string;tablename:string):string;stdcall;
var
newform:Tdllsec;
begin
//取得句柄
application.Handle:=Ahandle;
//建立窗体
newform:=Tdllsec.Create(application);
newform.Caption:=Acaption+'(双击选择)';
//建立数据库链接
newform.ADOTable1.TableName:=tablename;
newform.ADOTable1.Active:=true;
//显示窗体
try
 newform.ShowModal;
//返回双击所选择的结果
 result:=resultstr;
 //释放该窗体
finally newform.Close;
end;
end;

//-------双击选择数据栏---------
procedure TdllSec.DBGrid1DblClick(Sender: TObject);
begin
resultstr:=dbgrid1.Fields[0].Text;
close;
end;

//--------设置表宽度----------
procedure TdllSec.FormShow(Sender: TObject);
var
i:integer;
begin
for i:=0 to dbgrid1.FieldCount-1 do
 dbgrid1.Columns[i].Width:=64;
end;

end.
