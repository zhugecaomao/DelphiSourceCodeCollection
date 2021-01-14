unit MedInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Menus;

type
  TMedInfo = class(TParent)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton10Click(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  MedInfo: TMedInfo;

implementation

{$R *.dfm}
//动态设定表中各个字段的宽度
procedure TMedInfo.DataSource1DataChange(Sender: TObject; Field: TField);
var
i:integer;
begin
  inherited;
  dbgrid1.Columns[1].Width:=96;
  dbgrid1.Columns[0].Width:=64;
  for i:=2 to 14 do
   dbgrid1.Columns[i].Width:=64;

end;
//-----------药品编号不能为空---------
procedure TMedInfo.ToolButton10Click(Sender: TObject);
begin
  if datasource1.DataSet.State in [dsInsert,dsEdit] then
   if trim(dbedit1.Text)='' then
    begin
     showmessage('药品编号不能为空');
     exit;
    end;
  inherited;

end;

//动态设置药品分类下拉列表框的下拉项目
procedure TMedInfo.DBComboBox1DropDown(Sender: TObject);
begin
  inherited;
  if datasource1.DataSet.State in [dsInsert,dsEdit] then
   begin
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add('select distinct 名称 from 药品分类');
    adoquery1.Open;
    dbcombobox1.Items.Clear;
    while not adoquery1.Eof do
     begin
      dbcombobox1.Items.Add(trim(adoquery1.fieldbyname('名称').AsString));
      adoquery1.Next;
     end;
   end;

end;

//--------几个价格和上下限文本框中只允许输入数字和小数点----------
procedure TMedInfo.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0
end;

procedure TMedInfo.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0

end;

procedure TMedInfo.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
    if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0

end;

procedure TMedInfo.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
    if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0

end;

procedure TMedInfo.DBEdit13KeyPress(Sender: TObject; var Key: Char);
begin
  if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0

end;

procedure TMedInfo.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
 if (not(key IN ['0'..'9',#13,#46,#8]))THEN
   key:=#0

end;

proc
