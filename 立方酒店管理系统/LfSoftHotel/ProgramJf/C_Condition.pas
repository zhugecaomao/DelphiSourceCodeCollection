unit C_Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, DB,
  DBTables, C_JfDefine;

type
  TConditionForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblTitle: TLabel;
    btnCanc: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtRoom: TLabeledEdit;
    dtpBd: TDateTimePicker;
    edtBt: TMaskEdit;
    dtpEd: TDateTimePicker;
    edtEt: TMaskEdit;
    btnQuery: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnPrint: TBitBtn;
    qryWork: TQuery;
    dsWork: TDataSource;
    qryWorkCLASS: TStringField;
    qryWorkROOM: TStringField;
    qryWorkPLACE: TStringField;
    qryWorkNUMBER: TStringField;
    qryWorkSDATE: TStringField;
    qryWorkSTIME: TStringField;
    qryWorkLAST: TFloatField;
    qryWorkUNIT: TCurrencyField;
    qryWorkFEE: TCurrencyField;
    qryWorkADDIFEE: TCurrencyField;
    qryWorkSVCFEE: TCurrencyField;
    qryWorkTOTAL: TCurrencyField;
    qryWorkFLTY: TSmallintField;
    procedure btnQueryClick(Sender: TObject);
    procedure qryWorkFLTYGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    FLx: Integer;
  public
    { Public declarations }
  end;

var
  ConditionForm: TConditionForm;

procedure QueryTelephone(ALx: Integer);

implementation

{$R *.dfm}

procedure QueryTelephone(ALx: Integer);
begin
  ConditionForm := TConditionForm.Create(Application);
  try
    with ConditionForm do
    begin
      FLx := ALx;
      if Flx=1 then lblTitle.Caption := '查询分机新纪录'
      else lblTitle.Caption := '查询分机旧记录';
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      edtBt.Text := FormatDateTime('hh:nn:ss',EnCodeTime(8,0,0,0));
      edtEt.Text := edtBt.Text;
      ShowModal;
    end;
  finally
    ConditionForm.Free;
  end;
end;

procedure TConditionForm.btnQueryClick(Sender: TObject);
var
  BDt,EDt,Room,s,DbfName: string;
begin
  if (edtBt.Text='')or(edtEt.Text='') then
    Exit;
  BDt := FormatDateTime('yyyymmdd',dtpBd.Date)+FormatDatetime('hhnnss',StrToTime(edtBt.Text));
  EDt := FormatDateTime('yyyymmdd',dtpEd.Date)+FormatDatetime('hhnnss',StrToTime(edtEt.Text));
  Room := edtRoom.Text;
  if FLx=1 then DbfName := 'NewData'
  else DbfName := 'OldData';
  if Room='' then
  begin
    s := 'select * from '+DbfName+' where ((SDate+STime)>"'+BDt+'")and((SDate+STime)<"'+EDt+'")';
  end
  else
  begin
    s := 'select * from '+DbfName+' where (Class="'+Room+'")and((SDate+STime)>"'+BDt+'")and((SDate+STime)<"'+EDt+'")';
  end;
  with qryWork do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Open;
  end;
end;

procedure TConditionForm.qryWorkFLTYGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
  case Sender.AsInteger of
    DHFL_SH: Text := '市话';
    DHFL_NH: Text := '农话';
    DHFL_GN: Text := '国内';
    DHFL_GJ: Text := '国际';
    end;
end;

end.
