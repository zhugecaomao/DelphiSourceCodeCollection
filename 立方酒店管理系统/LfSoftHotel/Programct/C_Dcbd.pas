unit C_Dcbd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, C_CtDefine;

type
  TDcbdForm = class(TForm)
    Panel1: TPanel;
    lblTitle: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dtpBd: TDateTimePicker;
    dtpEd: TDateTimePicker;
    btnQuery: TBitBtn;
    Panel3: TPanel;
    btnClose: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryDcbd: TQuery;
    dsDcbd: TDataSource;
    btnPrint: TBitBtn;
    qryDcbdD_DCBH: TStringField;
    qryDcbdD_CTBH: TStringField;
    qryDcbdD_CDBH: TStringField;
    qryDcbdD_XMBH: TStringField;
    qryDcbdD_CDMC: TStringField;
    qryDcbdD_XFSL: TFloatField;
    qryDcbdD_THSL: TFloatField;
    qryDcbdD_DJ: TFloatField;
    qryDcbdD_XFRQ: TDateTimeField;
    qryDcbdD_DEL: TStringField;
    qryDcbdD_BZ: TStringField;
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DcbdForm: TDcbdForm;

procedure Dcbd;

implementation

uses C_Sysprint;

{$R *.dfm}

procedure Dcbd;
begin
  DcbdForm := TDcbdForm.Create(Application);
  try
    with DcbdForm do
    begin
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      ShowModal;
    end;
  finally
    DcbdForm.Free;
  end;

end;

procedure TDcbdForm.btnQueryClick(Sender: TObject);
var
  s       : string;
  IsToday : Boolean;
begin
  IsToday := FormatDateTime('yyyymmdd',dtpBd.Date)=FormatDateTime('yyyymmdd',Date);
  if IsToday then
    s := 'select * from DCMX where ((D_DEL="T")or(D_THSL>0))and(D_XFRQ>=:BD)and(D_XFRQ<=:ED)'
  else
    s := 'select * from DCMXDA where ((D_DEL="T")or(D_THSL>0))and(D_XFRQ>=:BD)and(D_XFRQ<=:ED)';
  qryDcbd.Close;
  qryDcbd.SQL.Clear;
  qryDcbd.SQL.Add(s);
  qryDcbd.Params[0].DataType := ftDate;
  qryDcbd.Params[1].DataType := ftDate;
  qryDcbd.Params[0].AsDate := dtpBd.Date;
  qryDcbd.Params[1].AsDate := dtpEd.Date;
  qryDcbd.Open;
end;

procedure TDcbdForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '点菜变动（'+DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date)+'）';
  APrintStru.ADataSet := qryDcbd;
  PrintLb(APrintStru,DBGrid1);
end;

end.
