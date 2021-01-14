unit SetPrint_P;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRPrntr, Dialogs;

type
  TrptSetPrint = class(TQuickRep)
    qrbLm: TQRBand;
    qrbNy: TQRBand;
    qrbYm: TQRBand;
    qrbBw: TQRBand;
    qrbHj: TQRBand;
    qrbBt: TQRChildBand;
    qrbBgbt: TQRChildBand;
    qrbYmdy: TQRChildBand;
    qrbXj: TQRChildBand;
    qrlYm: TQRLabel;
    qrsYm: TQRSysData;
    qrrYm: TQRRichText;
    qrrBt: TQRRichText;
    qrrBgbt: TQRRichText;
    qrrBw: TQRRichText;
    qrbYj: TQRChildBand;
    qrrYj: TQRRichText;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure qrbNyBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbXjBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbNyAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRDBTextPrint(sender: TObject; var Value: String);
  private
    blnXj, blnHh: boolean;
    intLineCount, intLastLineCount: integer;
  public
    IsToEmpty: boolean;
  end;

var
  rptSetPrint: TrptSetPrint;

implementation

uses SetPrint, Dm;

{$R *.DFM}

procedure TrptSetPrint.QuickRepStartPage(Sender: TCustomQuickRep);
var
  h: integer;
begin
  //只有第一页打印
  with qrbYm do
  begin
    Enabled := Tag = 0;
    Tag := Tag + 1;
    if not Enabled then Height := 0;
  end;
  blnXj := frmSetPrint.blnHavePageTotal;
  blnHh := frmSetPrint.cbHh.Checked;
  if qrbYm.Tag = 1 then         //ini
    qrbNy.Tag := 0
  else
    qrbNy.Tag := 1;
  if frmSetPrint.pnlOdd.Color <> frmSetPrint.pnlEven.Color then
    if qrbYm.Tag = 1 then
      qrbNy.Color := frmSetPrint.pnlEven.Color
    else
      qrbNy.Color := frmSetPrint.pnlOdd.Color;
  //intLineCount
  h := self.Height -
    Trunc((self.Page.TopMargin + self.Page.BottomMargin) * (self.Height / self.Page.Length)) -
    qrbYm.Height - qrbBt.Height - qrbBgbt.Height - qrbLm.Height -
    qrbYj.Height - qrbLm.Height - qrbBw.Height - qrbYmdy.Height;
  intLineCount := (h + qrbNy.Height + 3) div qrbNy.Height;
  intLastLineCount := intLineCount -
    (qrbXj.Height + qrbHj.Height + qrbYj.Height + 3) div qrbNy.Height;
  if not blnXj then
    qrbXj.Enabled := false;
  if not blnXj and not blnHh and
    (frmSetPrint.pnlOdd.Color = frmSetPrint.pnlEven.Color) then
    qrbNy.BeforePrint := nil;
end;

procedure TrptSetPrint.qrbNyBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrbNy.Tag := qrbNy.Tag + 1;
  if frmSetPrint.pnlOdd.Color <> frmSetPrint.pnlEven.Color then
    with qrbNy do
      if Color = frmSetPrint.pnlEven.Color then
        Color := frmSetPrint.pnlOdd.Color
      else
        Color := frmSetPrint.pnlEven.Color;
end;

procedure TrptSetPrint.qrbNyAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if blnHh then
    if (DataSet.RecNo = DataSet.RecordCount) and (qrbNy.Tag > 0) and
      (qrbNy.Tag <= (intLastLineCount - 1)) then
    begin
      IsToEmpty := true;
      DataSet.Prior;
      Functions.SetIntegerConstant(Functions.GetConstant('STOPSUM'), 1);
    end;
end;

procedure TrptSetPrint.qrbXjBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrbYm.Tag = 1 then
    PrintBand := qrbNy.Tag >= (intLineCount - 1)
  else
    PrintBand := qrbNy.Tag >= (intLineCount - 2);
  if DataSet.RecNo = DataSet.RecordCount then
    PrintBand := true;
  qrbNy.ForceNewPage := qrbNy.Tag >= (intLineCount - 2);
end;

procedure TrptSetPrint.QRDBTextPrint(sender: TObject; var Value: String);
begin
  if IsToEmpty then
    Value := '';
end;

end.
