unit FormInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids, Menus, StdCtrls, FormLogin, FormInput,formoutput;

type
  TInfo = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
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
  Info: TInfo;
  flag:integer;

implementation

uses FormManage;

{$R *.dfm}
//---------------点击商品信息管理菜单，显示商品清单----------------
procedure TInfo.N2Click(Sender: TObject);
begin
//查询商品信息
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Text:='select * from  商品清单';
adoquery1.Open;
//设置列的宽度，方便用户查看
dbgrid1.Columns[2].Width:=80;
dbgrid1.Columns[3].Width:=120;
dbgrid1.Columns[4].Width:=80;
dbgrid1.Columns[6].Width:=80;
//提示用户输入商品拼音以供查询
label1.Caption:='商品拼音';
end;

//---------------点击供货商信息管理菜单，显示供货商清单----------------
procedure TInfo.N3Click(Sender: TObject);
begin
//查询供货商信息
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Text:='select * from  供货商清单';
adoquery1.Open;
//设置列的宽度，方便用户查看
dbgrid1.Columns[1].Width:=80;
dbgrid1.Columns[2].Width:=80;
dbgrid1.Columns[3].Width:=80;
dbgrid1.Columns[4].Width:=120;
//提示用户输入供货商拼音以供查询
label1.Caption:='供货商拼音';
end;

//---------------点击客户信息管理菜单，显示客户清单----------------
procedure TInfo.N4Click(Sender: TObject);
begin
//查询客户信息
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Text:='select * from  客户清单';
adoquery1.Open;
//设置列的宽度，方便用户查看
dbgrid1.Columns[1].Width:=80;
dbgrid1.Columns[2].Width:=80;
dbgrid1.Columns[3].Width:=80;
dbgrid1.Columns[4].Width:=80;
dbgrid1.Columns[5].Width:=120;
//提示用户输入客户拼音以供查询
label1.Caption:='客户拼音';
end;

//----------------窗体关闭时返回的窗体的选择--------------------------
procedure TInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
manage.show;
//如果此时是从进货单功能中调用信息管理窗体，则不返回管理主窗体而返回进货单窗体
if (input.Enabled=false) then
 begin
 manage.Hide;
 input.enabled:=true;
end
end;

//------------窗体显示时，默认显示商品清单-------------------------
procedure TInfo.FormShow(Sender: TObject);
begin
n2.Click;
end;

//---------------------实现查询功能--------------------------
procedure TInfo.Button1Click(Sender: TObject);
begin
//根据标签的文字进行判断应该对那个数据表进行查询
//查询商品清单中的信息
 if label1.Caption='商品拼音' then
  begin
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select * from 商品清单 where 拼音编码 like ''%'+edit1.text+'%''');
  adoquery1.Open;
  dbgrid1.Columns[2].Width:=80;
  dbgrid1.Columns[3].Width:=120;
  dbgrid1.Columns[4].Width:=80;
  dbgrid1.Columns[6].Width:=80
  end;

  //查询供货商清单中的信息
  if label1.Caption='供货商拼音' then
  begin
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select * from 供货商清单 where 拼音编码 like ''%'+edit1.text+'%''');
  adoquery1.Open;
  dbgrid1.Columns[1].Width:=80;
  dbgrid1.Columns[2].Width:=80;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=120
  end;

  //查询客户清单中的信息
  if label1.Caption='客户拼音' then
  begin
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select * from 客户清单 where 拼音编码 like ''%'+edit1.text+'%''');
  adoquery1.Open;
  dbgrid1.Columns[1].Width:=80;
  dbgrid1.Columns[2].Width:=80;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=80;
  dbgrid1.Columns[5].Width:=120
  end;
end;

//--------------在进货单或销售单窗体中调用信息管理窗体-----------------------------
//-----------实现通过单击grid控件向进货单或销售单中传送相应的数据---------------
procedure TInfo.DBGrid1DblClick(Sender: TObject);
var
num,name:string;
begin
//----------------向进货单中传送商品或供货商信息------------------------
//判断是否时从进货单窗体中调用的信息管理窗体，以及调用的哪个数据表
 if (input.Enabled=false)and(label1.Caption='供货商拼音') then
 begin
//将供货商的标号和名称传回进货单窗体
 num:=dbgrid1.Fields[0].AsString;
 name:=dbgrid1.Fields[3].AsString;
 input.ComboBox2.Text:=num;
 input.Edit3.Text:=name;
//成功后返回进货单
 input.Enabled:=true;
 info.Close;
 manage.Hide;
 end;

 if (input.Enabled=false)and(label1.Caption='商品拼音') then
 begin
//将货号和商品名称传回进货单窗体
  num:=dbgrid1.Fields[0].AsString;
 name:=dbgrid1.Fields[3].AsString;
 if input.currentRow=0 then
  input.currentRow:=1;
 input.StringGrid1.Cells[1,input.currentRow]:=num;
 input.StringGrid1.Cells[2,input.currentRow]:=name;
//成功后返回进货单
 input.Enabled:=true;
 info.Close;
 manage.Hide;

 end;
//-------------------向销售单中传送客户信息-------------------
 if (output.Enabled=false)and(label1.Caption='客户拼音') then
 begin
//向将客户编号和名称传回销售单窗体
 num:=dbgrid1.Fields[0].AsString;
 name:=dbgrid1.Fields[3].AsString;
 output.ComboBox2.Text:=num;
 output.Edit3.Text:=name;
//成功后返回销售单
 output.Enabled:=true;
 info.Close;
 manage.Hide;
 end;

end;

end.
