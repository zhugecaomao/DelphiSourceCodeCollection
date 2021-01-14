unit C_Kfrbb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  TeeProcs, TeEngine, Chart, DB, DBTables, Series, C_Define, DateUtils;

type
  TKfrbbForm = class(TStandForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    qryWork: TQuery;
    btnPrintTb: TBitBtn;
    CheckBox1: TCheckBox;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_JRYY: TFloatField;
    qryWorkD_JRSH: TFloatField;
    qryWorkD_JRYH: TFloatField;
    qryWorkD_BYYY: TFloatField;
    qryWorkD_BYYH: TFloatField;
    qryWorkD_LJYY: TFloatField;
    qryWorkD_LJYH: TFloatField;
    qryWorkD_LJSH: TFloatField;
    qryWorkD_LJYS: TFloatField;
    qryWorkD_ZRBYYY: TFloatField;
    qryWorkD_ZRBYYH: TFloatField;
    qryWorkD_ZRLJYY: TFloatField;
    qryWorkD_ZRLJYH: TFloatField;
    qryWorkD_ZRLJSH: TFloatField;
    qryWorkD_ZRLJYS: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    BarSeries1: TBarSeries;
    btnPrint: TBitBtn;
    btnCzl: TBitBtn;
    Panel4: TPanel;
    lblSrzbyyye: TLabel;
    lblSrzljyye: TLabel;
    lblSrzljysk: TLabel;
    lblJryye: TLabel;
    lblNbff: TLabel;
    lblWbff: TLabel;
    lblDbf: TLabel;
    lblYh: TLabel;
    lblJrsjyye: TLabel;
    lblJrshhj: TLabel;
    lblSrzshhj: TLabel;
    lblJrzshhj: TLabel;
    lblJrzbyyye: TLabel;
    lblJrzbysyy: TLabel;
    lblJrzljyye: TLabel;
    lblJrzljysk: TLabel;
    tblSjtj: TTable;
    tblLctj: TTable;
    tblLctjD_YSRQ: TStringField;
    tblLctjD_LCBH: TStringField;
    tblLctjD_FJS: TIntegerField;
    tblLctjD_CZS: TFloatField;
    tblLctjD_QJS: TIntegerField;
    tblLctjD_BJS: TIntegerField;
    tblLctjD_JJFJ: TFloatField;
    tblLctjD_RCZL: TFloatField;
    tblLctjD_YCZL: TFloatField;
    tblLctjD_LCMC: TStringField;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnPrintTbClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnCzlClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FHcje,FHfje,FXhje,FSgje,FQtje: Currency;
    FDate : TDateTime;
    procedure ShowTb;
    procedure ShowSj;
  public
    { Public declarations }
  end;

var
  KfrbbForm: TKfrbbForm;

procedure Kfrbb;

implementation

uses C_Lctj, C_KfrbbPrn, C_HotelData;

{$R *.dfm}

procedure Kfrbb;
var
  s: string;
begin
  KfrbbForm := TKfrbbForm.Create(Application);
  try
    with KfrbbForm do
    begin
      DateTimePicker1.Date := YesterDay;
      s := 'select * from YYTJ where D_XMBH="'+XMBH_FJ+'"';
      qryWork.SQL.Clear;
      qryWork.SQL.Add(s);
      qryWork.Open;
      tblSjtj.Open;
      tblSjtj.Last;
      s := tblSjtj.FieldByName('D_YSRQ').AsString;
      FDate := EnCodeDate(StrToInt(Copy(s,1,4)),StrToInt(Copy(s,5,2)),StrToInt(Copy(s,7,2)));
      tblLctj.Open;
      ShowTb;
      ShowSj;
      ShowModal;
    end;
  finally
    KfrbbForm.qryWork.Close;
    KfrbbForm.tblSjtj.Close;
    KfrbbForm.tblLctj.Close;
    KfrbbForm.Free;
  end;
end;

procedure TKfrbbForm.ShowTb;
var
  AQb,AYy,AYh,ASh,AYs: Boolean;
begin
  AQb := ComboBox1.ItemIndex = 0;
  AYy := ComboBox1.ItemIndex = 1;
  AYh := ComboBox1.ItemIndex = 2;
  ASh := ComboBox1.ItemIndex = 3;
  AYs := ComboBox1.ItemIndex = 4;
  BarSeries1.Clear;
  if (AQb or AYy) then
    BarSeries1.AddBar(qryWorkD_JRYY.Value,'今日营业',clGreen);
  if (AQb or ASh) then
    BarSeries1.AddBar(qryWorkD_JRSH.Value,'今日收回',clBlue);
  if (AQb or AYh) then
    BarSeries1.AddBar(qryWorkD_JRYH.Value,'今日优惠',clYellow);
  if (AQb or AYy) then
    BarSeries1.AddBar(qryWorkD_BYYY.Value/100,'本月营业（百元）',clGreen);
  if (AQb or AYh) then
    BarSeries1.AddBar(qryWorkD_BYYH.Value/100,'本月优惠（百元）',clYellow);
  if (AQb or AYy) then
    BarSeries1.AddBar(qryWorkD_LJYY.Value/100,'累计营业（百元）',clGreen);
  if (AQb or ASh) then
    BarSeries1.AddBar(qryWorkD_LJSH.Value/100,'累计收回（百元）',clBlue);
  if (AQb or AYh) then
    BarSeries1.AddBar(qryWorkD_LJYH.Value/100,'累计优惠（百元）',clYellow);
  if (AQb or AYs) then
    BarSeries1.AddBar(qryWorkD_LJYS.Value/100,'累计应收（百元）',clRed);
  if (AQb or AYy) then
    BarSeries1.AddBar(qryWorkD_ZRBYYY.Value/1000,'昨日本月营业（千元）',clGreen);
  if (AQb or AYh) then
    BarSeries1.AddBar(qryWorkD_ZRBYYH.Value/1000,'昨日本月优惠（千元）',clYellow);
  if (AQb or AYy) then
    BarSeries1.AddBar(qryWorkD_ZRLJYY.Value/1000,'昨日累计营业（千元）',clGreen);
  if (AQb or ASh) then
    BarSeries1.AddBar(qryWorkD_ZRLJSH.Value/1000,'昨日累计收回（千元）',clBlue);
  if (AQb or AYh) then
    BarSeries1.AddBar(qryWorkD_ZRLJYH.Value/1000,'昨日累计优惠（千元）',clYellow);
  if (AQb or AYs) then
    BarSeries1.AddBar(qryWorkD_ZRLJYS.Value/1000,'昨日累计应收（千元）',clRed);
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('客房日报表');
  Chart1.Title.Text.Add(DateToStr(DateTimePicker1.Date));
end;

procedure TKfrbbForm.DateTimePicker1Change(Sender: TObject);
var
  ADate: TDateTime;
  ADateStr,s: string;
begin
  inherited;
  ADate := DateTimePicker1.Date;
  ADateStr := FormatDateTime('yyyymmdd',ADate);
  if ADate=YesterDay then
  begin
    s := 'select * from YYTJ where D_XMBH="'+XMBH_FJ+'"';
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Open;
    tblSjtj.Last;
  end
  else
  begin
    s := 'select * from YYTJDA where (D_XMBH="'+XMBH_FJ+'")and(D_YSRQ=:YSRQ)';
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Params[0].DataType := ftString;
    qryWork.Params[0].Value := ADateStr;
    qryWork.Open;
    tblSjtj.Locate('D_YSRQ',ADateStr,[]);
  end;
  s := tblSjtj.FieldByName('D_YSRQ').AsString;
  FDate := EnCodeDate(StrToInt(Copy(s,1,4)),StrToInt(Copy(s,5,2)),StrToInt(Copy(s,7,2)));
  ShowTb;
  ShowSj;
end;

procedure TKfrbbForm.ShowSj;
var
  s : string;
begin
  lblJryye.Caption   := '    今日营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_JRYY').AsCurrency);
  lblNbff.Caption    := '  今日内宾房费：'+ FormatFloat('#.##',tblSjtj.FieldByName('D_NBFF').AsCurrency);
  lblWbff.Caption    := '  今日外宾房费：'+ FormatFloat('#.##',tblSjtj.FieldByName('D_WBFF').AsCurrency);
  lblDbf.Caption     := '    今日代保费：'+FormatFloat('#.##',tblSjtj.FieldByName('D_DBF').AsCurrency);
  lblYh.Caption      := '      今日优惠：'+FormatFloat('#.##',qryWork.FieldByName('D_JRYH').AsCurrency);
  lblJrsjyye.Caption := '今日实际营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_JRYY').AsCurrency-qryWork.FieldByName('D_JRYH').AsCurrency);

  lblSrzbyyye.Caption := '上日止本月营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_ZRBYYY').AsCurrency);
  lblSrzljyye.Caption := '上日止累计营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_ZRLJYY').AsCurrency);
  lblSrzljysk.Caption := '上日止累计应收款：'+FormatFloat('#.##',qryWork.FieldByName('D_ZRLJYS').AsCurrency);
  lblJrshhj.Caption   := '    今日收回合计：'+FormatFloat('#.##',qryWork.FieldByName('D_JRSH').AsCurrency);
  lblSrzshhj.Caption  := '  上日止收回合计：'+FormatFloat('#.##',qryWork.FieldByName('D_ZRLJSH').AsCurrency);
  lblJrzshhj.Caption  := '  今日止收回合计：'+FormatFloat('#.##',qryWork.FieldByName('D_LJSH').AsCurrency);
  lblJrzbyyye.Caption := '今日止本月营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_BYYY').AsCurrency);
  lblJrzbysyy.Caption := '今日止本月实营业：'+FormatFloat('#.##',qryWork.FieldByName('D_BYYY').AsCurrency-qryWork.FieldByName('D_BYYH').AsCurrency);
  lblJrzljyye.Caption := '今日止累计营业额：'+FormatFloat('#.##',qryWork.FieldByName('D_LJYY').AsCurrency);
  lblJrzljysk.Caption := '今日止累计应收款：'+FormatFloat('#.##',qryWork.FieldByName('D_LJYS').AsCurrency);
  s := 'select sum(D_HCZJ) from YDHC where (D_SYRQ=:RQ)and(D_RZBZ="T")';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := FDate;
    Open;
    if Fields[0].IsNull then FHcje := 0
    else FHcje := Fields[0].AsCurrency;
  end;
  s := 'select sum(D_HFJE) from YDHC where (D_SYRQ=:RQ)and(D_RZBZ="T")';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := FDate;
    Open;
    if Fields[0].IsNull then FHfje := 0
    else FHfje := Fields[0].AsCurrency;
  end;
  s := 'select sum(D_XHJE) from YDHC where (D_SYRQ=:RQ)and(D_RZBZ="T")';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := FDate;
    Open;
    if Fields[0].IsNull then FXhje := 0
    else FXhje := Fields[0].AsCurrency;
  end;
  s := 'select sum(D_SGJE) from YDHC where (D_SYRQ=:RQ)and(D_RZBZ="T")';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := FDate;
    Open;
    if Fields[0].IsNull then FSgje := 0
    else FSgje := Fields[0].AsCurrency;
  end;
  s := 'select sum(D_QTJE) from YDHC where (D_SYRQ=:RQ)and(D_RZBZ="T")';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := FDate;
    Open;
    if Fields[0].IsNull then FQtje := 0
    else FQtje := Fields[0].AsCurrency;
  end;

end;

procedure TKfrbbForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ShowTb;
end;

procedure TKfrbbForm.btnPrintTbClick(Sender: TObject);
begin
  inherited;
  Chart1.Print;
end;

procedure TKfrbbForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.View3D := CheckBox1.Checked;
end;

procedure TKfrbbForm.btnCzlClick(Sender: TObject);
begin
  inherited;
  Lctj;
end;

procedure TKfrbbForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  KfrbbPrnForm := TKfrbbPrnForm.Create(Application);
  try
    with KfrbbPrnForm do
    begin
      qrlDate.Caption   := FormatDateTime('yyyy/mm/dd',Date)+' '+'制表人：'+CZY.CzyXm;
      QRLabel28.Caption := FormatFloat('#.##',qryWork.FieldByName('D_JRYY').AsCurrency)+'元';
      QRLabel29.Caption := FormatFloat('#.##',tblSjtj.FieldByName('D_NBFF').AsCurrency)+'元';
      QRLabel30.Caption := FormatFloat('#.##',tblSjtj.FieldByName('D_WBFF').AsCurrency)+'元';
      QRLabel31.Caption := FormatFloat('#.##',tblSjtj.FieldByName('D_DBF').AsCurrency)+'元';
      QRLabel32.Caption := FormatFloat('#.##',qryWork.FieldByName('D_JRYH').AsCurrency)+'元';
      QRLabel33.Caption := FormatFloat('#.##',qryWork.FieldByName('D_JRYY').AsCurrency-qryWork.FieldByName('D_JRYH').AsCurrency)+'元';

      QRLabel34.Caption := FormatFloat('#.##',qryWork.FieldByName('D_ZRBYYY').AsCurrency)+'元';
      QRLabel35.Caption := FormatFloat('#.##',qryWork.FieldByName('D_ZRLJYY').AsCurrency)+'元';
      QRLabel36.Caption := FormatFloat('#.##',qryWork.FieldByName('D_ZRLJYS').AsCurrency)+'元';
      QRLabel37.Caption := FormatFloat('#.##',qryWork.FieldByName('D_JRSH').AsCurrency)+'元';
      QRLabel38.Caption := FormatFloat('#.##',qryWork.FieldByName('D_ZRLJSH').AsCurrency)+'元';
      QRLabel39.Caption := FormatFloat('#.##',qryWork.FieldByName('D_LJSH').AsCurrency)+'元';
      QRLabel40.Caption := FormatFloat('#.##',qryWork.FieldByName('D_BYYY').AsCurrency)+'元';
      QRLabel41.Caption := FormatFloat('#.##',qryWork.FieldByName('D_BYYY').AsCurrency-qryWork.FieldByName('D_BYYH').AsCurrency)+'元';
      QRLabel42.Caption := FormatFloat('#.##',qryWork.FieldByName('D_LJYY').AsCurrency)+'元';
      QRLabel43.Caption := FormatFloat('#.##',qryWork.FieldByName('D_LJYS').AsCurrency)+'元';

      QRLabel58.Caption := FormatFloat('#.##',FHcje)+'元';
      QRLabel59.Caption := FormatFloat('#.##',FHfje)+'元';
      QRLabel60.Caption := FormatFloat('#.##',FXhje)+'元';
      QRLabel61.Caption := FormatFloat('#.##',FSgje)+'元';
      QRLabel62.Caption := FormatFloat('#.##',FQtje)+'元';
      QuickRep1.Print;
      //QuickRep1.PreviewModal;
    end;
  finally
    KfrbbPrnForm.Free;
  end;
end;

end.
