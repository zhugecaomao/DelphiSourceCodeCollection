unit dllForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, ExtCtrls, StdCtrls, Buttons;

type
  TdllSec = class(TForm)
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    ADOQuery1: TADOQuery;
    procedure DBGrid1DblClick(Sender: TObject);

    procedure BitBtn1Click(Sender: TObject);
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
finally newform.Free;
end;
end;

//-------双击选择数据栏---------
procedure TdllSec.DBGrid1DblClick(Sender: TObject);
begin
resultstr:=dbgrid1.Fields[0].Text;
close;
end;


procedure TdllSec.BitBtn1Click(Sender: TObject);
begin
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from '+adotable1.TableName);
   adoquery1.SQL.Add(' where('+label3.Caption+' like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and('+label4.Caption+' like ''%'+edit2.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);
end;

end.
