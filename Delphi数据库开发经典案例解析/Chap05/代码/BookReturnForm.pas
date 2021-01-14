unit BookReturnForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TBookReturn = class(TParent)
    ADOQuery2: TADOQuery;
    ADOCommand1: TADOCommand;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookReturn: TBookReturn;

implementation

{$R *.dfm}

procedure TBookReturn.FormShow(Sender: TObject);
begin
  inherited;
adotable1.Clone(adoquery2,ltunspecified);
end;


//--------------查询未归还的书的信息------------------
procedure TBookReturn.BitBtn1Click(Sender: TObject);
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
//----------调用储存过程，归还图书-------------
procedure TBookReturn.BitBtn2Click(Sender: TObject);
var
 returndate:TDateTime;
 money:double;
 forfeit,num:string;
begin
  inherited;
  returndate:=adotable1.FieldByName('应还时间').AsDateTime;
  num:=adotable1.FieldByName('借阅编号').AsString;
  //如果查询无结果，则不能归还图书
  if num='' then exit;
  if (date+time-returndate)>0 then
   begin
     //计算罚款，按每天0.2元，当然也可以有其他算法
     money:=0.2*(date-returndate);
     //可以修改罚款的值
     forfeit:= InputBox('该书已经过期，需交纳罚款', '应交纳的罚款数额', floattostr(money));
     adocommand1.CommandText:='exec sf_图书归还 '+num+','+forfeit;
   end
   else
    adocommand1.CommandText:='exec sf_图书归还 '+num+',0';
   adocommand1.Execute;
  //刷新数据
  adoquery2.Active:=false;
  adoquery2.Active:=true;
  adotable1.Clone(adoquery2,ltunspecified);
end;

//------------设置表中的字段宽度-----------
procedure TBookReturn.DataSource1DataChange(Sender: TObject; Field: TField);
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
