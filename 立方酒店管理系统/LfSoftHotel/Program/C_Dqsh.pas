unit C_Dqsh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TDqshForm = class(TStdBrowForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    tblSjtj: TTable;
    qryWorkD_JZBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFGG: TStringField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_YJJE: TFloatField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZFS: TStringField;
    qryWorkD_JZLX: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_BMBH: TStringField;
    qryWorkD_XMMC: TStringField;
    qryWorkD_SHJE: TCurrencyField;
    btnDetail: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure qryWorkCalcFields(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
    procedure qryWorkD_JZLXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnDetailClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    FFpe: Currency;
    FCtFpe: Currency;
    FCwjs: Currency;
    FCtsj: Currency;
    FShje: Currency;
    FCtShje: Currency;
    
    FZrwjyjk : Currency;
    FJrshyjk : Currency;
    FSjyjk   : Currency;
    FDqwjyjk : Currency;
    procedure ShowDqsh;
    function SumSjcwe: Currency;
    function SumCtsje: Currency;
    function SumCtshe: Currency;
    function SumSjyjk: Currency;
  public
    { Public declarations }
  end;

var
  DqshForm: TDqshForm;

procedure Dqsh;

implementation

uses C_HotelData, C_Sysprint, C_Dqshmx;

{$R *.dfm}

procedure Dqsh;
begin
  DqshForm := TDqshForm.Create(Application);
  try
    with DqshForm do
    begin
      //qryWork.Params[0].Value := Date;
      qryWork.Open;
      ShowDqsh;
      ShowModal;
    end;
  finally
    DqshForm.qryWork.Close;
    DqshForm.Free;
  end;
end;

function TDqshForm.SumSjcwe: Currency;
var
  s: string;
  ARmb,AXyk,AZp: Currency;
begin
  s := 'select sum(D_RMB) from CWJS where (D_JSLX="'
      +JSLX_CWSJ+'")and(D_YSRQ is null)';
  ARmb := HotelData.SumJe(s);
  s := 'select sum(D_XYK) from CWJS where (D_JSLX="'
      +JSLX_CWSJ+'")and(D_YSRQ is null)';
  AXyk := HotelData.SumJe(s);
  s := 'select sum(D_ZP) from CWJS where (D_JSLX="'
      +JSLX_CWSJ+'")and(D_YSRQ is null)';
  AZp := HotelData.SumJe(s);
  Result := ARmb+AXyk+AZp;
end;

function TDqshForm.SumSjyjk: Currency;
var
  s : string;
begin
  s := 'select sum(D_RMB+D_XYK+D_ZP) from CWJS where (D_JSLX="'
      +JSLX_YJSJ+'")and(D_YSRQ is null)';
  Result := HotelData.SumJe(s);
end;

function TDqshForm.SumCtsje: Currency;
var
  s: string;
  ARmb,AXyk,AZp: Currency;
begin
  s := 'select sum(D_RMB) from CWJS where (D_JSLX="'
      +JSLX_CTSJ+'")and(D_YSRQ is null)';
  ARmb := HotelData.SumJe(s);
  s := 'select sum(D_XYK) from CWJS where (D_JSLX="'
      +JSLX_CTSJ+'")and(D_YSRQ is null)';
  AXyk := HotelData.SumJe(s);
  s := 'select sum(D_ZP) from CWJS where (D_JSLX="'
      +JSLX_CTSJ+'")and(D_YSRQ is null)';
  AZp := HotelData.SumJe(s);
  Result := ARmb+AXyk+AZp;
end;

function TDqshForm.SumCtshe: Currency;
var
  s,ABmbh: string;
begin
  ABmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
  //2002.08.23 edit by ls. only rmb,xyk,zp
  {s := 'select sum(D_XFJE) from KRJZ where (D_XMBH="'
    +XMBH_CF+'")and(D_BMBH<>"'+ABmbh+'")';}
  s := 'select sum(D_XFJE-D_YHJE) from KRJZ where (D_XMBH="'
    +XMBH_CF+'")and(D_HH<>0)and(D_BMBH<>"'+ABmbh+'")';
    //+'and((D_JZFS="'+JZFS_RMB+'")or(D_JZFS="'+JZFS_XYK+'")or(D_JZFS="'+JZFS_ZP+'"))';

  Result := HotelData.SumJe(s);
end;

procedure TDqshForm.ShowDqsh;
begin
  try
    tblSjtj.Open;
    tblSjtj.Last;
    FFpe := tblSjtj.FieldbyName('D_FPE').AsCurrency;
    FCtfpe:= tblSjtj.FieldByName('D_CTFPE').AsCurrency;
    FCwjs := SumSjcwe;
    FCtsj := SumCtsje;
    FCtshje := SumCtshe;
    //昨日未结预交款
    FZrwjyjk := tblSjtj.FieldbyName('D_YJKYE').AsCurrency;
    //FCwjs := tblSjtj.FieldByName('D_CWSJE').AsCurrency;
    //FCtsj := tblSjtj.FieldByName('D_CTSJE').AsCurrency;
    //FCtshje:= tblSjtj.FieldByName('D_CTSHE').AsCurrency;
  finally
    tblSjtj.Close;
  end;

  //今日收回预交款
  FJrshyjk := HotelData.SumJe('select sum(D_RMB+D_XYK+D_ZP) from YJK where (D_YSRQ is null)and(D_YJLX<>"'+YJLX_SJ+'")');

  //今日收回金额
  FShje   := HotelData.SumJe('select sum(D_XFJE-D_YHJE) from KRJZ where D_HH<>0');
  {qryWork.First;
  while not qryWork.Eof do
  begin
    FShje := FShje + qryWork.FieldByName('D_SHJE').AsCurrency;
    qryWork.Next;
  end;}
  //上交预交款
  FSjyjk := SumSjyjk;
  FDqwjyjk := FZrwjyjk+FJrshyjk-FSjyjk;
  
  Label1.Caption:= FormatFloat('#.##',FFpe);
  Label2.Caption:= FormatFloat('#.##',FShje);
  Label3.Caption:= FormatFloat('#.##',FCwjs);
  Label4.Caption:= FormatFloat('#.##',FCtshje+FCtFpe);
  Label5.Caption:= FormatFloat('#.##',FCtsj);
  Label6.Caption:= FormatFloat('#.##',FFpe+FShje-FCwjs+FCtsj-FCtshje-FCtfpe);

  //lblZrwjyjk.Caption := FormatFloat('#.##',FZrwjyjk);
  //lblJrshyjk.Caption := FormatFloat('#.##',FJrshyjk);
  //lblSjyjk.Caption   := FormatFloat('#.##',FSjyjk);
  //lblDqwjyjk.Caption := FormatFloat('#.##',FDqwjyjk);
end;

procedure TDqshForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  //edit by ls.20021020
  qryWork.FieldByName('D_SHJE').AsCurrency :=
    qryWorkD_XFJE.AsCurrency - qryWorkD_YHJE.AsCurrency+qryWorkD_YJJE.AsCurrency;
end;

procedure TDqshForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '当前收回';
  APrintStru.ASub := Label7.Caption + Label1.Caption + ' '
                    +Label9.Caption + Label3.Caption + ' '
                    +Label11.Caption + Label5.Caption + ' '+#13#10
                    +Label8.Caption + Label2.Caption + ' '
                    +Label10.Caption + Label4.Caption + ' '
                    +Label12.Caption + Label6.Caption ;
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TDqshForm.qryWorkD_JZLXGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString = JZLX_YK then  Text := '寓客结';
    if Sender.AsString = JZLX_FYK then Text := '非寓客';
    if Sender.AsString = JZLX_YSK then Text := '应收款';
    if Sender.AsString = JZLX_YJK then Text := '预交款';
  end;
end;

procedure TDqshForm.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  {if Column.FieldName = 'D_XMMC' then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KRJZ where (D_HH<>0) order by D_XMBH,D_JZRQ,D_JZSJ');
      Open;
      EnableControls;
    end;
  end;}
  if Column.FieldName = 'D_JZSJ' then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from KRJZ where (D_HH=0) order by D_JZRQ,D_JZSJ');
      Open;
      EnableControls;
    end;
  end;

end;

procedure TDqshForm.btnDetailClick(Sender: TObject);
begin
  inherited;
  Dqshmx('select * from KRJZ where (D_HH<>0)and(D_JZBH="'+qryWorkD_JZBH.Value+'")');
end;

procedure TDqshForm.RadioButton1Click(Sender: TObject);
begin
  inherited;
    qryWork.DisableControls;
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add('select * from KRJZ where (D_HH=0) order by D_JZRQ,D_JZSJ');
    qryWork.Prepare;
    qryWork.Open;
    qryWork.EnableControls;
end;

procedure TDqshForm.RadioButton2Click(Sender: TObject);
begin
  inherited;
    qryWork.DisableControls;
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add('select * from KRJZ where (D_HH<>0) order by D_JZRQ,D_JZSJ');
    qryWork.Prepare;
    qryWork.Open;
    qryWork.EnableControls;
end;

end.
