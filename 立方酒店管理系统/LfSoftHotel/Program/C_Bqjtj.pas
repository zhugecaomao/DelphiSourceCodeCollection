unit C_Bqjtj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  TeEngine, Series, TeeProcs, Chart;

type
  TBqjTjForm = class(TStandForm)
    qryBqjtj: TQuery;
    Chart1: TChart;
    Series1: THorizBarSeries;
    CheckBox1: TCheckBox;
    btnPrint: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTb;
  public
    { Public declarations }
  end;

var
  BqjTjForm: TBqjTjForm;

procedure Bqjtj;

implementation

{$R *.dfm}

procedure Bqjtj;
begin
  BqjTjForm := TBqjTjForm.Create(Application);
  try
    with BqjTjForm do
    begin
      qryBqjtj.Open;
      ShowTb;
      ShowModal;
    end;
  finally
    BqjTjForm.qryBqjtj.Close;
    BqjTjForm.Free;
  end;
end;

procedure TBqjtjForm.ShowTb;
begin
  Series1.AddBar(qryBqjtj.Fields[0].AsInteger,'半价数',clRed);
  Series1.AddBar(qryBqjtj.Fields[1].AsInteger,'全价数',clYellow);
  Series1.AddBar(qryBqjtj.Fields[2].AsCurrency/100,'间接房价(百元)',clBlue);
end;

procedure TBqjTjForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TBqjTjForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

end.
