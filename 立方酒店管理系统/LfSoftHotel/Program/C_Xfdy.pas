unit C_Xfdy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Xtdy, DosMove, DB, DBTables, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, C_Define;

type
  TXfdyForm = class(TXtdyForm)
    tblXtdyD_XFBH: TStringField;
    tblXtdyD_XFMC: TStringField;
    tblXtdyD_XFBZ: TStringField;
    tblXtdyD_BZ: TStringField;
    procedure tblXtdyBeforeDelete(DataSet: TDataSet);
    procedure tblXtdyBeforeEdit(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  infoCannotDelete = '这是由系统设定的预定项目，你不能删除！';
  infoCannotEdit   = '这是由系统设定的预定项目，你不能编辑！';
var
  XfdyForm: TXfdyForm;

procedure Xfdy;

implementation

uses C_Sysprint;

{$R *.dfm}

procedure Xfdy;
begin
  XfdyForm := TXfdyForm.Create(Application);
  try
    with XfdyForm do
    begin
      tblXtdy.Open;
      ShowModal;
    end;
  finally
    XfdyForm.Free;
  end;
end;

procedure TXfdyForm.tblXtdyBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if tblXtdyD_XFBZ.Value = 'S' then
    raise Exception.Create(infoCannotDelete);
end;

procedure TXfdyForm.tblXtdyBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if tblXtdyD_XFBZ.Value = 'S' then
    raise Exception.Create(infoCannotEdit);
end;

procedure TXfdyForm.btnPrintClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '预定项目';
  APrintStru.ADataSet := tblXtdy;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 2 do
        begin
          AColumns.Add(dbgXtdy.Columns[I].Title.Caption);
          AFields.Add(dbgXtdy.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('100');
        APosition.Add('450');
        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        APrintStru.AFs      := PRN_Portrait;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

end.
