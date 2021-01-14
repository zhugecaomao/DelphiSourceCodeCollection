unit C_Lkysk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, DB, DBTables, ComCtrls, Grids, DBGrids, C_Define;

type
  TLkyskForm = class(TStandForm)
    tblLkyskz: TTable;
    tblLkyskzD_XFXM: TStringField;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    dsWork: TDataSource;
    DBGrid1: TDBGrid;
    tblLkyskzD_YSRQ: TStringField;
    tblLkyskzD_XMBH: TStringField;
    tblLkyskzD_XFJE: TFloatField;
    tblLkyskzD_YJJE: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    procedure CheckBox1Click(Sender: TObject);
    procedure PrintZZ(Sender: TObject);
    procedure PrintTb(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure ShowBb;
  public
    { Public declarations }
  end;

var
  LkyskForm: TLkyskForm;

procedure Lkysk;

implementation

uses C_HotelData, C_ChartPrint, C_Sysprint, C_PrintDlg;

{$R *.dfm}

procedure Lkysk;
begin
  LkyskForm := TLkyskForm.Create(Application);
  try
    with LkyskForm do
    begin
      ShowBb;
      ShowModal;
    end;
  finally
    LkyskForm.tblLkyskz.Close;
    LkyskForm.Free;
  end;
end;

//显示图表
procedure TLkyskForm.ShowBb;
var
  AYsk: Currency;
begin
  tblLkyskz.DisableControls;
  try
    tblLkyskz.Open;
    tblLkyskz.First;
    while not tblLkyskz.Eof do
    begin
      Series1.AddBar(tblLkyskzD_XFJE.Value,tblLkyskzD_XFXM.Value,clRed);
      tblLkyskz.Next;
    end;
  finally
    tblLkyskz.EnableControls;
  end;
  AYsk := HotelData.SumJe('select sum(D_XFJE) from LKYSKZ');
  Chart1.Title.Text.Add('累计应收：'+CurrToStr(AYsk)+'元')
end;


procedure TLkyskForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TLkyskForm.PrintZZ(Sender: TObject);
begin
  PrintDlg('零客应收款','零客应收款',dsWork,nil,nil,nil);
end;

procedure TLkyskForm.PrintTb(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

procedure TLkyskForm.DateTimePicker1CloseUp(Sender: TObject);
var
  aDate : TDateTime;
  aDateStr : string;
begin
  inherited;
  aDate := DateTimePicker1.DateTime;
  if aDate>= Date then Exit;
  aDateStr := FormatDateTime('yyyymmdd',aDate);
  tblLkyskz.Close;
  tblLkyskz.TableName := 'LKYSKZDA';
  tblLkyskz.Filter := 'D_YSRQ = '''+aDateStr+'''';
  tblLkyskz.Filtered := True;
  tblLkyskz.Open;
end;

end.
