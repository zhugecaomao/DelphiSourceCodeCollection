unit ChargeItmForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TChargeItm = class(TParent)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBComboBox1: TDBComboBox;
    Label15: TLabel;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChargeItm: TChargeItm;

implementation

{$R *.dfm}

procedure TChargeItm.DataSource1DataChange(Sender: TObject; Field: TField);
var
 i:integer;
begin
  inherited;//设置列表的宽度
  dbgrid1.Columns[1].Width:=160;
  dbgrid1.Columns[0].Width:=64;
  dbgrid1.Columns[6].Width:=160;
  for i:=2 to 5 do
   dbgrid1.Columns[i].Width:=64;
end;

//保存新增的收费项目时要求收费项目编号不能为空
procedure TChargeItm.ToolButton10Click(Sender: TObject);
begin
  if datasource1.DataSet.State in [dsInsert,dsEdit] then
   if trim(dbedit1.Text)='' then
    begin
     showmessage('收费项目编号不能为空');
     exit;
    end;
  inherited;

end;



end.
