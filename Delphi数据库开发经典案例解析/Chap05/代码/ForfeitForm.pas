unit ForfeitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TForFeit = class(TParent)
    ADOQuery2: TADOQuery;
    ADOCommand1: TADOCommand;
    BitBtn2: TBitBtn;
    Edit4: TEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ForFeit: TForFeit;

implementation

{$R *.dfm}

procedure TForFeit.FormShow(Sender: TObject);
begin
  inherited;
  adotable1.Clone(adoquery2,ltunspecified);
end;


//--------------查询罚款信息------------------
procedure TForFeit.BitBtn1Click(Sender: TObject);
begin
  //注销掉从父窗体中继承来的代码，因为父窗体中是从一个表中查询的
  //inherited;
   adoquery1.Close;
   adoquery1.SQL.Clear;


   adoquery1.SQL.Add('select a.*,b.姓名,c.书名 from 图书罚款 a,读者信息 b,图书信息 c');
   adoquery1.SQL.Add('where (a.读者编号=b.编号)and(a.是否交款=0)and(a.图书编号=c.编号)');
   adoquery1.SQL.Add('and(a.读者编号 like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and(a.图书编号 like ''%'+edit2.Text+'%'')');
   adoquery1.SQL.Add('and(b.姓名 like ''%'+edit3.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);


end;
//----------调用储存过程，收回罚款-------------
procedure TForFeit.BitBtn2Click(Sender: TObject);
begin
 //实收金额为空说明并无收款，则不进行处理
 if edit4.Text='' then exit;
 adocommand1.CommandText:='update 图书罚款 set 实收金额=cast('''+edit4.Text+''' as money),是否交款=1 where 罚款编号='''+dbgrid1.Fields[0].Text+'''';
 adocommand1.Execute;
 adoquery2.Active:=false;
 adoquery2.Active:=true;
 adotable1.Clone(adoquery2,ltunspecified);
end;

//------------设置表中的字段宽度-----------
procedure TForFeit.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dbgrid1.Columns[0].Width:=64;
  dbgrid1.Columns[1].Width:=64;
  dbgrid1.Columns[2].Width:=64;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=164;
  dbgrid1.Columns[5].Width:=64;
  dbgrid1.Columns[6].Width:=64;
  dbgrid1.Columns[7].Width:=64;
  dbgrid1.Columns[8].Width:=48;
  dbgrid1.Columns[9].Width:=48;
  //显示实收金额默认值
  edit4.Text:=dbgrid1.Fields[6].Text;


end;
//控制【实收金额】文本框中只能输入数字
procedure TForFeit.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if(key>=#30)and(key<=#39) then
  edit4.Text:=edit4.Text+key;
end;

end.
