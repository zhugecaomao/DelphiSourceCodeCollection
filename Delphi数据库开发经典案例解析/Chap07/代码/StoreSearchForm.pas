unit StoreSearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TStoreSearch = class(TParent)
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreSearch: TStoreSearch;

implementation

{$R *.dfm}

//----显示窗体时显示药品库存名称和详细信息 -----
procedure TStoreSearch.FormShow(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select b.名称,a.* from 药品库存 a,药品资料 b');
  adoquery1.SQL.Add('where a.药品编号=b.编号');
  adoquery1.Open;
  adotable1.Clone(adoquery1,ltUnspecified);
end;

//设置数据表字段宽度
procedure TStoreSearch.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dbgrid1.Columns[0].Width:=64;
  dbgrid1.Columns[1].Width:=128;
  dbgrid1.Columns[2].Width:=64;
  dbgrid1.Columns[3].Width:=64;
  dbgrid1.Columns[4].Width:=64;
  dbgrid1.Columns[5].Width:=256;

end;

//---不使用从父窗体继承的查询代码，自己编写代码实现功能----
procedure TStoreSearch.BitBtn1Click(Sender: TObject);
var
str:string;
begin
 //inherited;在编写程序时将该行删除或屏蔽
 str:='';
 if trim(edit1.Text)<>'' then
  str:=str+'库房 like ''%'+edit1.Text+'%'' and ';
 if trim(edit2.Text)<>'' then
  str:=str+'药品编号 like ''%'+edit2.Text+'%'' and ';
  if trim(edit3.Text)<>'' then
  str:=str+'名称 like ''%'+edit3.Text+'%'' and ';

 str:=copy(str,1,length(str)-4);//去掉组合后最后一个and+空格
 adotable1.Filter:=str;
 adotable1.Filtered:=true;

end;

end.
