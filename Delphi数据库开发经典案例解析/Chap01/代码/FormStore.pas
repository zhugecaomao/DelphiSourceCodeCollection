unit FormStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, FormOutput;

type
  Tstore = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  store: Tstore;

implementation

uses FormManage;

{$R *.dfm}

//----------------窗体关闭时返回的窗体的选择--------------------------
procedure Tstore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
manage.show;
//如果此时是从销售单功能中调用库存查询窗体，则不返回管理主窗体而返回销售单窗体
if (output.Enabled=false) then
 begin
 manage.Hide;
 output.enabled:=true;
 end
end;

//------------窗体显示时，从两张不同的表里面进行组合查询库存数据----------------
procedure Tstore.FormShow(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Text:='select 库存库.货号,商品清单.品名,商品清单.单位,库存库.仓库,库存库.库存数量,库存库.库存单价,库存库.库存金额 from 库存库,商品清单 where 库存库.货号=商品清单.货号';
adoquery1.Open;

end;

//------------------------执行查询---------------------------------
procedure Tstore.Button1Click(Sender: TObject);
begin
 adoquery1.Close;
 adoquery1.sql.Clear;
 adoquery1.SQL.Add('select 库存库.货号,商品清单.品名,商品清单.单位,库存库.仓库,库存库.库存数量,库存库.库存单价,库存库.库存金额 from 库存库,商品清单');
 adoquery1.SQL.Add('where 库存库.货号=商品清单.货号 and ');
 adoquery1.SQL.Add('((商品清单.货号='''+edit1.Text+''')or');
 adoquery1.SQL.Add('(商品清单.拼音编码='''+edit2.Text+''')or');
 adoquery1.SQL.Add('(库存库.仓库='''+combobox1.text+'''))');
 adoquery1.Open;
//上面SQL语句的作用是从数据库中查询任意与输入的商品拼音，货号，仓库三者之一有相同值的记录，因此
//后面三个语句是或的关系，但是任何结果必须至少符合三个条件中的一个，所以又是一个与的关系
//这里我们没有使用前面所讲过的模糊查询，读者可以参照前面的章节自行修改程序，看看会有什么样的结果
end;

//--------------在销售单窗体中调用库存查询窗体-----------------------------
//-----------实现通过单击grid控件向销售单中传送相应的数据---------------
procedure Tstore.DBGrid1DblClick(Sender: TObject);
var
name,num:string;

begin
if (output.Enabled=false) then
 begin
  num:=dbgrid1.Fields[0].AsString;
 name:=dbgrid1.Fields[1].AsString;
//向将客户编号和名称传回销售单窗体
 if output.currentRow=0 then
  output.currentRow:=1;
 output.StringGrid1.Cells[1,output.currentRow]:=num;
 output.StringGrid1.Cells[2,output.currentRow]:=name;
 output.Enabled:=true;
 //成功后返回销售单
 store.Close;
 manage.Hide;
 end;



end;

end.
