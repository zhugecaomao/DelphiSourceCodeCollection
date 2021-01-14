unit OnDuty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TF_ODuty = class(TForm)
    DBGrid1: TDBGrid;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ODuty: TF_ODuty;

implementation

uses DataModule;

{$R *.dfm}

procedure TF_ODuty.FormShow(Sender: TObject);
var  {*****医务值班人员管理窗体OnShow事件*****}
    i:integer;
begin
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Branch';  //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    DM.AT_Assis.First;               //当前活动记录移动到第一条记录
    ListBox1.Items.Clear;
    for i:=1 to DM.AT_Assis.RecordCount do
      begin
      ListBox1.Items.Add(DM.AT_Assis.FieldByName('Bra_Name').AsString);
      DM.AT_Assis.Next;              //当前活动记录下移一条记录
      end;
end;

procedure TF_ODuty.ListBox1DblClick(Sender: TObject);
begin  {*****ListBox1控件双击事件*****}
    DM.AQ_Person.Close;
    DM.AQ_Person.SQL.Text := 'SELECT * FROM Person WHERE Per_Bra='''+ListBox1.Items.Strings[ListBox1.ItemIndex]+'''';
    DM.AQ_Person.Open;
end;

end.
