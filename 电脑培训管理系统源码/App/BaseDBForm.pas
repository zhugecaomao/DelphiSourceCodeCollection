unit BaseDBForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls,
  DBCtrls,DB,DBTables;

type
  TBaseDBFrm = class(TBaseFrm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    DN: TDBNavigator;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDBFrm: TBaseDBFrm;

implementation

uses UnitDM, BaseDialog, UnitData;

{$R *.dfm}

procedure TBaseDBFrm.ToolButton1Click(Sender: TObject);
begin
  inherited;
if not (DN.DataSource.DataSet.State in[dsEdit,dsInsert]) then
    DN.DataSource.DataSet.Append;

end;

procedure TBaseDBFrm.ToolButton2Click(Sender: TObject);
begin
  inherited;
    if DN.DataSource.DataSet.State in[dsBrowse] then
        if Msgs('真的要删除该记录？','YESNO')=IDYES then
        begin
            if DN.DataSource.DataSet is TTable then
                DN.DataSource.DataSet.Delete;
            if DN.DataSource.DataSet is TQuery then
            begin
                try
                    TQuery(DN.DataSource.DataSet).Delete;
                    TQuery(DN.DataSource.DataSet).ApplyUpdates;
                except
                    Msgs('对不起，该记录不存在。');
                end;
            end;
        end;
end;

procedure TBaseDBFrm.ToolButton3Click(Sender: TObject);
begin
  inherited;
if not (DN.DataSource.DataSet.State in[dsEdit,dsInsert]) then
    DN.DataSource.DataSet.Edit;

end;

procedure TBaseDBFrm.ToolButton5Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
    DN.DataSource.DataSet.Cancel;

end;

procedure TBaseDBFrm.ToolButton7Click(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TBaseDBFrm.FormShow(Sender: TObject);
begin
  inherited;
DN.Color:=$00E3E3E3;
end;

end.
