unit C_Xhtj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, Grids, DBGrids,
  DBTables, C_CtDefine;

type
  TXhtjForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    dtpBd: TDateTimePicker;
    dtpEd: TDateTimePicker;
    qryXhtj: TQuery;
    DBGrid1: TDBGrid;
    dsXhtj: TDataSource;
    btnQuery: TBitBtn;
    btnPrint: TBitBtn;
    qryXhtjD_CDMC: TStringField;
    qryXhtjSUM: TFloatField;
    qryXhtjD_CDBH: TStringField;
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XhtjForm: TXhtjForm;

procedure Xhtj;

implementation

uses C_CtData, C_Sysprint;

{$R *.dfm}

procedure Xhtj;
begin
  XhtjForm := TXhtjForm.Create(Application);
  try
    with XhtjForm do
    begin
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      ShowModal;
    end;
  finally
    XhtjForm.Free;
  end;
end;

procedure TXhtjForm.btnQueryClick(Sender: TObject);
var
  s : string;
  IsToday : Boolean;
begin
  IsToday := FormatDateTime('yyyymmdd',dtpBd.Date)=FormatDateTime('yyyymmdd',Date);
  if IsToday then
    s := 'select D_CDBH,D_CDMC,sum(D_XFSL-D_THSL) from DCMX where (D_DEL="F")and(D_XFRQ>=:BD)and(D_XFRQ<=:ED) group by D_CDBH,D_CDMC order by D_CDBH'
  else
    s := 'select D_CDBH,D_CDMC,sum(D_XFSL-D_THSL) from DCMXDA where (D_DEL="F")and(D_XFRQ>=:BD)and(D_XFRQ<=:ED) group by D_CDBH,D_CDMC order by D_CDBH';

  qryXhtj.Close;
  qryXhtj.SQL.Clear;
  qryXhtj.SQL.Add(s);
  qryXhtj.Params[0].DataType := ftDate;
  qryXhtj.Params[1].DataType := ftDate;
  qryXhtj.Params[0].AsDate := dtpBd.Date;
  qryXhtj.Params[1].AsDate := dtpEd.Date;
  qryXhtj.Open;
end;

procedure TXhtjForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '消耗统计（'+DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date)+'）';
  APrintStru.ADataSet := qryXhtj;
  PrintLb(APrintStru,DBGrid1);
end;

end.
