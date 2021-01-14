unit mrphistoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Mask, DBCtrls, DB, ADODB, StdCtrls, Buttons,
  ExtCtrls;

type
  Tmrphistory = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn12: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    procedure BitBtn12Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mrphistory: Tmrphistory;

implementation

{$R *.dfm}
//--------------查询------------
procedure Tmrphistory.BitBtn12Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select a.*,b.物料名称 from mrp物料需求历史 a,物料主文件 b where (a.物料编号 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(a.年份 like ''%'+edit2.Text+'%'')and(a.计划期 like ''%'+edit3.Text+'%'')');
adoquery1.SQL.Add('and(a.物料编号=b.物料编号)');
adoquery1.Open;

end;


procedure Tmrphistory.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure Tmrphistory.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure Tmrphistory.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;
//-----------关闭窗体---------------
procedure Tmrphistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//--------动态设置列宽度------------
procedure Tmrphistory.DataSource1DataChange(Sender: TObject;
  Field: TField);
var
  i:integer;
begin
for i:=1 to dbgrid1.Columns.Count-1 do
 dbgrid1.Columns[i].Width:=80;
end;

end.
