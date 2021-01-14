unit BookOverdueForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TBookOverdue = class(TParent)
    ADOQuery2: TADOQuery;
    ADOCommand1: TADOCommand;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookOverdue: TBookOverdue;

implementation

{$R *.dfm}

procedure TBookOverdue.FormShow(Sender: TObject);
begin
  inherited;
adotable1.Clone(adoquery2,ltunspecified);
end;


//--------------查询过期的书的信息------------------
procedure TBookOverdue.BitBtn1Click(Sender: TObject);
begin
  //注销掉从父窗体中继承来的代码，因为父窗体中是从一个表中查询的
  //inherited;
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select a.*,b.*,c.* from 图书借阅 a,图书信息 b,读者信息 c');
   adoquery1.SQL.Add('where (a.图书编号=b.编号)and(a.读者编号=c.编号)and(状态=''未还'')');
   adoquery1.SQL.Add('and(c.编号 like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and(a.图书编号 like ''%'+edit2.Text+'%'')');
   adoquery1.SQL.Add('and(c.姓名 like ''%'+edit3.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);


end;


//------------设置表中的字段宽度-----------
procedure TBookOverdue.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dbgrid1.Columns[0].Width:=64;
  dbgrid1.Columns[1].Width:=64;
  dbgrid1.Columns[2].Width:=166;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=64;
  dbgrid1.Columns[5].Width:=64;
  dbgrid1.Columns[6].Width:=64;
  dbgrid1.Columns[7].Width:=64;
  dbgrid1.Columns[8].Width:=48;
  dbgrid1.Columns[9].Width:=48;


end;

end.
