unit C_Lctj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  TeeProcs, TeEngine, Chart, Series, DB, DBTables, Grids, DBGrids;

type
  TLctjForm = class(TStandForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    tblLctj: TTable;
    tblLctjD_LCMC: TStringField;
    CheckBox1: TCheckBox;
    dsLctj: TDataSource;
    DBGrid1: TDBGrid;
    btnPrintTb: TBitBtn;
    tblLctjD_YSRQ: TStringField;
    tblLctjD_LCBH: TStringField;
    tblLctjD_FJS: TIntegerField;
    tblLctjD_CZS: TFloatField;
    tblLctjD_QJS: TIntegerField;
    tblLctjD_BJS: TIntegerField;
    tblLctjD_JJFJ: TFloatField;
    tblLctjD_RCZL: TFloatField;
    tblLctjD_YCZL: TFloatField;
    btnPrint: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure tblLctjD_RCZLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnPrintTbClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTb;
  public
    { Public declarations }
  end;

var
  LctjForm: TLctjForm;

procedure Lctj;

implementation

uses C_HotelData, C_Sysprint, C_Define;

{$R *.dfm}

procedure Lctj;
begin
  LctjForm := TLctjForm.Create(Application);
  try
    with LctjForm do
    begin
      tblLctj.Open;
      ShowTb;
      ShowModal;
    end;
  finally
    LctjForm.tblLctj.Close;
    LctjForm.Free;
  end;
end;

procedure TLctjForm.ShowTb;
begin
  tblLctj.First;
  while not tblLctj.Eof do
  begin
    if tblLctjD_LCBH.Value<>'0' then
      Series1.AddBar(tblLctjD_RCZL.AsFloat,tblLctjD_LCMC.Value,clRed)
    else
      Series1.AddBar(tblLctjD_RCZL.AsFloat,'ºÏ¼Æ',clRed);
    tblLctj.Next;
  end;
end;

procedure TLctjForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TLctjForm.tblLctjD_RCZLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    Text := Format('%4.3f',[tblLctjD_RCZL.AsFloat*100])+'%';
end;

procedure TLctjForm.btnPrintTbClick(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

procedure TLctjForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ADataSet := tblLctj;
  PrintLb(APrintStru,DBGrid1);
end;

end.
