unit C_PrintDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FR_Class, FR_DSet, FR_DBSet, DB,
  FR_E_TXT, Spin, FR_Desgn, FR_E_HTM, FR_E_CSV, FR_E_RTF, FR_Cross,
  FR_RRect, FR_Chart, FR_BarC, FR_Shape, FR_ChBox, FR_Rich, FR_OLE, IniFiles;

type
  TPrintDlgForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rdbPrint: TRadioButton;
    rdbPreview: TRadioButton;
    rdbExport: TRadioButton;
    lstReport: TListBox;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frTextExport1: TfrTextExport;
    SaveDialog1: TSaveDialog;
    GroupBox3: TGroupBox;
    rdbAll: TRadioButton;
    Image1: TImage;
    rdbYmfw: TRadioButton;
    edtYmfw: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    speFs: TSpinEdit;
    cheZfdy: TCheckBox;
    Image2: TImage;
    Label3: TLabel;
    cmbPrint: TComboBox;
    btnPrintSetup: TBitBtn;
    btnDesignReport: TBitBtn;
    RadioButton1: TRadioButton;
    frDesigner1: TfrDesigner;
    PrinterSetupDialog1: TPrinterSetupDialog;
    frRTFExport1: TfrRTFExport;
    frHTMExport1: TfrHTMExport;
    btnNewReport: TBitBtn;
    btnDelReport: TBitBtn;
    btnReportInfo: TBitBtn;
    GroupBox5: TGroupBox;
    lblReportInfo: TLabel;
    frCSVExport1: TfrCSVExport;
    frOLEObject1: TfrOLEObject;
    frRichObject1: TfrRichObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    frShapeObject1: TfrShapeObject;
    frBarCodeObject1: TfrBarCodeObject;
    frChartObject1: TfrChartObject;
    frRoundRectObject1: TfrRoundRectObject;
    frCrossObject1: TfrCrossObject;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    RadioGroup1: TRadioGroup;
    procedure OnPrint(Sender: TObject);
    procedure OnDesign(Sender: TObject);
    procedure OnPrintSetup(Sender: TObject);
    procedure OnListBoxSelect(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    FFl : string;
    FMc : string;
  public
    { Public declarations }
  end;

var
  PrintDlgForm: TPrintDlgForm;

procedure PrintDlg(const aFl,aMc: string;aDataSource1,aDataSource2,aDataSource3,aDataSource4: TDataSource);

implementation

uses C_Define,C_Preview;

{$R *.dfm}
procedure PrintDlg(const aFl,aMc: string;aDataSource1,aDataSource2,aDataSource3,aDataSource4: TDataSource);
var
  s : string;
begin
  PrintDlgForm := TPrintDlgForm.Create(Application);
  try
    with PrintDlgForm do
    begin
      FFl := aFl;
      FMc := aMc;
      frDBDataSet1.DataSource := aDataSource1;
      frDBDataSet2.DataSource := aDataSource2;
      frDBDataSet3.DataSource := aDataSource3;
      frDBDataSet4.DataSource := aDataSource4;
      lstReport.Items.Clear;
      lstReport.Items.Add(FMc);
      ShowModal;
    end;
  finally
    PrintDlgForm.Free;
  end;
end;

procedure TPrintDlgForm.OnPrint(Sender: TObject);
var
  i : Integer;
  aFile   : string;
  txtFile : string;
  aCopy   : Integer;
  aYmfw   : string;
  aPrint  : TfrPrintPages;
  aScale  : Double;

begin
  for i := 0 to lstReport.Items.Count -1 do
  begin
    if lstReport.Selected[i] then
      FMc := lstReport.Items[i];
  end;
  if FMc='' then Exit;
  aScale := 1;
  case RadioGroup1.ItemIndex of
    0: aScale := 0.25;
    1: aScale := 0.33;
    2: aScale := 0.5;
    3: aScale := 0.66;
    4: aScale := 1;
  end;
  aFile := SystemReportDir + FMc +'.frf';
  //读取相应的打印文件.frf
  frReport1.LoadFromFile(aFile);
  frReport1.Title := FMc;
  for i := 0 to frReport1.Pages.Count - 1 do
    frReport1.Pages.Pages[i].ChangePaper(frReport1.Pages.Pages[i].pgSize,
                                         frReport1.Pages.Pages[i].pgWidth,
                                         Round(frReport1.Pages.Pages[i].pgHeight*aScale),
                                         frReport1.Pages.Pages[i].pgBin,
                                         frReport1.Pages.Pages[i].pgOr);

  //预览
  if rdbPreview.Checked then
  begin
    if frReport1.PrepareReport then
    begin
      frReport1.Preview := PreviewForm.frPreview1;
      PreviewForm.Caption := FMc;
      frReport1.ShowPreparedReport;
      PreviewForm.ShowModal;
    end;
  end;

  //打印
  if rdbPrint.Checked then
    if frReport1.PrepareReport then
    begin
      aPrint := frAll;
      case cmbPrint.ItemIndex of
        0 : aPrint := frAll;
        1 : aPrint := frOdd;
        2 : aPrint := frEven;
      end;
      aCopy := speFs.Value;
      if rdbAll.Checked then aYmfw := '';
      if rdbYmfw.Checked then aYmfw := edtYmfw.Text;
      frReport1.PrintPreparedReport(aYmfw,aCopy,cheZfdy.Checked,aPrint);
    end;

  //导出
  if rdbExport.Checked then
    if frReport1.PrepareReport then
    begin
      if SaveDialog1.Execute then
      begin
        txtFile := SaveDialog1.FileName;
        if txtFile <> '' then
        begin
          case SaveDialog1.FilterIndex of
            1 : frReport1.ExportTo(frTextExport1,txtFile);
            2 : frReport1.ExportTo(frRtfExport1,txtFile);
            3 : frReport1.ExportTo(frHtmExport1,txtFile);
            4 : frReport1.ExportTo(frCsvExport1,txtFile);
          end;
        end;
      end;
    end;

end;

procedure TPrintDlgForm.OnDesign(Sender: TObject);
var
  aFile : string;
begin
  FMc := lstReport.Items[lstReport.ItemIndex];
  aFile := SystemReportDir + FMc+'.frf';

  //读取相应的打印文件.frf
  frReport1.LoadFromFile(aFile);
  frReport1.Title := FMc;
  frReport1.DesignReport;
end;

procedure TPrintDlgForm.OnPrintSetup(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TPrintDlgForm.OnListBoxSelect(Sender: TObject);
begin
  FMc := lstReport.Items[lstReport.ItemIndex];
end;

procedure TPrintDlgForm.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'FPrintMemo'        then ParValue := FPrintMemo;
end;

end.
