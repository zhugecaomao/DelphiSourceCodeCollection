unit C_EwfBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TEwfBrowForm = class(TStdBrowForm)
    qryWorkD_JZBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_EWF: TCurrencyField;
    qryWorkD_JZRQ: TDateField;
    qryWorkD_JZSJ: TTimeField;
    qryWorkD_YSRQ: TStringField;
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EwfBrowForm: TEwfBrowForm;

procedure EwfBrow;

implementation

uses C_Sysprint;

{$R *.dfm}

procedure EwfBrow;
begin
  EwfBrowForm := TEwfBrowForm.Create(Application);
  try
    with EwfBrowForm do
    begin
      qryWork.Open;
      ShowModal;
    end;
  finally
    EwfBrowForm.qryWork.Close;
    EwfBrowForm.Free;
  end;
end;

procedure TEwfBrowForm.btnPrintClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '∂ÓÕ‚∑—£®'+DateToStr(Date)+'£©';
  APrintStru.ADataSet := qryWork;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 3 do
        begin
          AColumns.Add(DBGrid1.Columns[I].Title.Caption);
          AFields.Add(DBGrid1.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('200');
        APosition.Add('350');
        APosition.Add('500');
        APosition.Add('650');
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
