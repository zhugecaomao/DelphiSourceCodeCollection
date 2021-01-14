unit C_Sysprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, C_Define, Printers;

type
  TSysPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlSub: TQRLabel;
    qrlDwmc: TQRLabel;
    qrlZbr: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SysPrintForm: TSysPrintForm;

procedure SysPrint(APrintStru: TPrintStru);

implementation

{$R *.dfm}

procedure SysPrint(APrintStru: TPrintStru);
var
  I       : Integer;
  AColName: TQRLabel;
  AField  : TQRDBText;
  ALine   : TQRShape;
begin
  SysPrintForm := TSysPrintForm.Create(Application);
  try
  with SysPrintForm do
  begin
    qrlTitle.Caption  := APrintStru.ATitle;
    qrlSub.Caption    := APrintStru.ASub;
    QuickRep1.DataSet := APrintStru.ADataSet;
    for I:=0 to APrintStru.AColumns.Count-1 do
    begin
      AColName := TQRLabel.Create(ColumnHeaderBand1);
      AColName.Parent  := ColumnHeaderBand1;
      AColName.Left    := StrToInt(APrintStru.APosition.Strings[I]);
      AColName.Caption := APrintStru.AColumns.Strings[I];
      AColName.Color   := clWhite;
      AColName.Top     := 2;
      AField := TQRDBText.Create(DetailBand1);
      AField.Parent    := DetailBand1;
      AField.Left      := AColName.Left;
      AField.DataSet   := QuickRep1.DataSet;
      AField.DataField := APrintStru.AFields.Strings[I];
      AField.Top       := 2;
      if (I<>0) then
      begin
      ALine := TQRShape.Create(ColumnHeaderBand1);
      ALine.Parent     := ColumnHeaderBand1;
      ALine.Shape      := qrsVertLine;
      ALine.Width      := 2;
      ALine.Top        := 0;
      ALine.Height     := ColumnHeaderBand1.Height;
      ALine.Left       := AColName.Left-5;// + AColName.Width + 2;

      ALine := TQRShape.Create(DetailBand1);
      ALine.Parent     := DetailBand1;
      ALine.Shape      := qrsVertLine;
      ALine.Width      := 2;
      ALine.Top        := 0;
      ALine.Height     := DetailBand1.Height;
      ALine.Left       := AColName.Left-5;// + AColName.Width + 2;
      end;

    end;
    qrlZbr.Caption := '÷∆±Ì»À£∫'+CZY.CzyXm;
    qrlDwmc.Caption := Hotel_Name;
    if APrintStru.AFs = PRN_Portrait then QuickRep1.Page.Orientation := poPortrait
    else QuickRep1.Page.Orientation := poLandScape;
    //QuickRep1.PreviewModal;
    QuickRep1.Print;
  end;
  finally
    SysPrintForm.Free;
  end;

end;

end.
