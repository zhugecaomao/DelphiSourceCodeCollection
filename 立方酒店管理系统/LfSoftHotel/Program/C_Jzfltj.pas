unit C_Jzfltj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  ComCtrls, TeEngine, Series, TeeProcs, Chart, DateUtils, Grids, DBGrids;

type
  TJzfltjForm = class(TStandForm)
    qryJzfltj: TQuery;
    dtpBd: TDateTimePicker;
    Label1: TLabel;
    btnPrintTb: TBitBtn;
    dtpEd: TDateTimePicker;
    Label2: TLabel;
    btnTj: TBitBtn;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    qryJzfltjD_JZFS: TStringField;
    qryJzfltjSUM: TFloatField;
    qryJzfltjSUM_1: TFloatField;
    dsJzfltj: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    DBGrid1: TDBGrid;
    btnPrint: TBitBtn;
    procedure btnPrintTbClick(Sender: TObject);
    procedure btnTjClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTb;
  public
    { Public declarations }
  end;

var
  JzfltjForm: TJzfltjForm;

procedure Jzfltj;

implementation

uses C_Sysprint, C_Define;

{$R *.dfm}

procedure Jzfltj;
begin
  JzfltjForm := TJzfltjForm.Create(Application);
  try
    with JzfltjForm do
    begin
      dtpBd.Date := YesterDay;
      dtpEd.Date := YesterDay;
      btnTjClick(nil);
      ShowModal;
    end;
  finally
    JzfltjForm.Free;
  end;
end;

procedure TJzfltjForm.ShowTb;
begin
  Series1.Clear;
  qryJzfltj.First;
  while not qryJzfltj.Eof do
  begin
    Series1.AddBar(qryJzfltjSUM.Value,qryJzfltjD_JZFS.Value+'（收回）',clGreen);
    Series1.AddBar(qryJzfltjSUM_1.Value,qryJzfltjD_JZFS.Value+'（优惠）',clYellow);
    qryJzfltj.Next;
  end;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('结帐方式分类统计');
  Chart1.Title.Text.Add(DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date));
end;

procedure TJzfltjForm.btnPrintTbClick(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

procedure TJzfltjForm.btnTjClick(Sender: TObject);
var
  ABDateStr,AEDateStr : string;
begin
  inherited;
  ABDateStr := FormatDateTime('yyyymmdd',dtpBd.Date);
  AEDateStr := FormatDateTime('yyyymmdd',dtpEd.Date);
  qryJzfltj.Close;
  qryJzfltj.Params[0].AsString := ABDateStr;
  qryJzfltj.Params[1].AsString := AEDateStr;
  qryJzfltj.Open;
  ShowTb;
end;

procedure TJzfltjForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TJzfltjForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ASub   := '（'+DateToStr(dtpBd.Date)+'至'+DateToStr(dtpEd.Date)+'）';
  APrintStru.ADataSet := qryJzfltj;
  PrintLb(APrintStru,DBGrid1);
end;

end.
