unit TotalAccountForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, DB, ADODB, DBCtrls, Mask;

type
  TTotalAccount = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);



    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);


    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  TotalAccount: TTotalAccount;

implementation

{$R *.dfm}

procedure TTotalAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//--------------------设置表的宽度-------------------
procedure TTotalAccount.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  //显示数据数量
  label2.Caption:=inttostr(adoquery1.RecordCount);
  //设置数据表宽度
  dbgrid1.Columns[0].Width:=50;
  dbgrid1.Columns[1].Width:=80;
  dbgrid1.Columns[2].Width:=80;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=80;
  dbgrid1.Columns[5].Width:=80;
  dbgrid1.Columns[6].Width:=80;
  dbgrid1.Columns[7].Width:=80;
  dbgrid1.Columns[8].Width:=50;
end;

//---------------首记录----------------
procedure TTotalAccount.ToolButton1Click(Sender: TObject);
begin
 datasource1.DataSet.First;
end;

//---------------上记录----------------
procedure TTotalAccount.ToolButton2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;
end;

//---------------下记录----------------
procedure TTotalAccount.ToolButton3Click(Sender: TObject);
begin
 datasource1.DataSet.Next;
end;

//---------------尾记录----------------
procedure TTotalAccount.ToolButton4Click(Sender: TObject);
begin
 datasource1.DataSet.Last;
end;

procedure TTotalAccount.ToolButton13Click(Sender: TObject);
begin
close;
end;

//----------查询数据并显示-------------
procedure TTotalAccount.BitBtn1Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select a.*,b.科目名称 from 本期汇总帐簿 a,科目表 b where (a.科目代码 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(a.科目代码=b.科目代码)');
adoquery1.Open;

end;

//---------根据用户的操作对表中的数据进行过滤-----------
procedure TTotalAccount.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked then
begin
datasource1.DataSet.Filter:='余额<>0';
datasource1.DataSet.Filtered:=true;
end
else
datasource1.DataSet.Filtered:=false;
end;

end.




