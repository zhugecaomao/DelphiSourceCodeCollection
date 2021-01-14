unit US_EDIT;

{ Single DBEdit Form :

一. 控制内容
  (1). DataSource1StateChange - 在资料表状态改变时, 对应改变 Panel1 的颜色


二. 调用事项
  (1). 若键值不是连在 DBEdit1 上, 则须在 Form Create 时, 将键值栏位赋给 sKeyFdNm 变量.


}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uS_DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, Buttons, DBNavPlus,
  ToolWin, ComCtrls, RXDBCtrl, ToolEdit, DBTables, RxLookup;

type
  TS_SingleDBEdit = class(TS_DB)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    procedure CheckUniqueNo(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
  protected
    { Protected declarations }
    procedure GotoFirstControl;
  private  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_SingleDBEdit: TS_SingleDBEdit;

implementation

uses uConstant,uDataBaseEValue,utilities;

{$R *.DFM}

procedure TS_SingleDBEdit.CheckUniqueNo(Sender: TObject);
var
  sNo : String;
begin
  if not (Table1.State in [dsEdit, dsInsert]) then exit;

  sNo := Table1.FieldByName(sKeyFdNm).AsString;
  if (aOriValues[0] = sNo) then exit;


  QryExec(Qry1, 'Select '+sKeyFdNm+' From '+sTbNm+' Where '+sKeyFdNm+'='''+sNo+'''', True);
  if (Qry1.RecordCount = 1) then
  begin
    R_OkMessage(['该笔资料已经存在!']);
    Table1.Cancel;
    Table1.FindKey([sNo]);
    TWinControl(Sender).SetFocus();
  end;
end;

procedure TS_SingleDBEdit.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  Case Table1.State of
    dsBrowse : Panel1.Color := $0099F2C6;
    dsEdit   : Panel1.Color := $00FBDAD7;
    dsInsert : Panel1.Color := $00F1C9FA;
  End;
end;

procedure TS_SingleDBEdit.FormCreate(Sender: TObject);
begin
  inherited;
  sKeyFdNm := DBEdit1.DataField;
end;

procedure TS_SingleDBEdit.GotoFirstControl;
begin
  DBEdit1.SetFocus;
  if not DbEdit1.TabStop then SelectNext(DBEdit1,True,True);
end;

procedure TS_SingleDBEdit.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  GotoFirstControl;
end;


end.
