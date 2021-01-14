unit C_CwjsBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TCwjsBrowForm = class(TStdBrowForm)
    qryWorkD_YSRQ: TStringField;
    qryWorkD_JSLX: TStringField;
    qryWorkD_RMB: TFloatField;
    qryWorkD_XYK: TFloatField;
    qryWorkD_ZP: TFloatField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_LRRQ: TDateTimeField;
    qryWorkD_LRSJ: TDateTimeField;
    procedure btnPrintClick(Sender: TObject);
    procedure qryWorkBeforeEdit(DataSet: TDataSet);
    procedure qryWorkBeforeInsert(DataSet: TDataSet);
    procedure qryWorkBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FJslx: string;
    procedure ShowBrow;
  public
    { Public declarations }
  end;

var
  CwjsBrowForm: TCwjsBrowForm;

procedure CwjsBrow(const AJslx: string);

implementation

uses C_Sysprint;

{$R *.dfm}

procedure CwjsBrow(const AJslx: string);
begin
  CwjsBrowForm := TCwjsBrowForm.Create(Application);
  try
    with CwjsBrowForm do
    begin
      FJslx := AJslx;
      ShowBrow;
      qryWork.Open;
      ShowModal;
    end;
  finally
    CwjsBrowForm.qryWork.Close;
    CwjsBrowForm.Free;
  end;
end;

procedure TCwjsBrowForm.ShowBrow;
begin
  if FJslx=JSLX_CWSJ then
    lblTitle.Caption := '财务上交'
  else
  if FJslx=JSLX_CTSJ then
    lblTitle.Caption := '餐厅上交'
  else
  if FJslx=JSLX_YJSJ then
    lblTitle.Caption := '预交款上交';

  qryWork.Params[0].Value := FJslx;
end;

procedure TCwjsBrowForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption+'（'+DateToStr(Date)+'）';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TCwjsBrowForm.qryWorkBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if qryWorkD_YSRQ.AsString <> '' then
  begin
    Abort;
    raise Exception.Create('已经夜审过的数据不能修改!');
  end;
end;

procedure TCwjsBrowForm.qryWorkBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TCwjsBrowForm.qryWorkBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

end.
