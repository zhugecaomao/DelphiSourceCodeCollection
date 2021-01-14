unit C_Yycx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, Grids, DBGrids, DBTables,
  Buttons, C_CtDefine;

type
  TYycxForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    qryMaster: TQuery;
    qryDetail: TQuery;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qryMasterD_DCBH: TStringField;
    qryMasterD_XMBH: TStringField;
    qryMasterD_DCLB: TStringField;
    qryMasterD_CTBH: TStringField;
    qryMasterD_XFRQ: TDateField;
    qryMasterD_XFSJ: TTimeField;
    qryMasterD_SJDM: TStringField;
    qryMasterD_KRSL: TIntegerField;
    qryMasterD_YCBZ: TStringField;
    qryMasterD_KRXM: TStringField;
    qryMasterD_JSBZ: TStringField;
    qryMasterD_JZFS: TStringField;
    qryMasterD_KHBH: TStringField;
    qryMasterD_XYKBH: TStringField;
    qryMasterD_XFJE: TCurrencyField;
    qryMasterD_YHJE: TCurrencyField;
    qryMasterD_CZYXM: TStringField;
    qryMasterD_YDBH: TStringField;
    qryMasterD_BZ: TStringField;
    qryMasterD_XMMC: TStringField;
    qryMasterD_CTMC: TStringField;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    qryDetailD_DCBH: TStringField;
    qryDetailD_CTBH: TStringField;
    qryDetailD_CDBH: TStringField;
    qryDetailD_XMBH: TStringField;
    qryDetailD_CDMC: TStringField;
    qryDetailD_XFSL: TFloatField;
    qryDetailD_THSL: TFloatField;
    qryDetailD_DJ: TFloatField;
    qryDetailD_XFRQ: TDateTimeField;
    qryDetailD_DEL: TStringField;
    qryDetailD_BZ: TStringField;
    procedure qryMasterD_DCLBGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YycxForm: TYycxForm;

procedure Yycx;
procedure YycxEnter(const aDcbh: string);

implementation

uses C_CtData, C_Sysprint;

{$R *.dfm}
procedure YycxEnter(const aDcbh: string);
begin
  YycxForm := TYycxForm.Create(Application);
  try
    with YycxForm do
    begin
      DateTimePicker1.Date := Date;
      qryMaster.Close;
      qryMaster.Params[0].AsDate := Date;
      qryMaster.Open;
      qryDetail.Close;
      qryDetail.Open;
      qryMaster.Locate('D_DCBH',aDcbh,[]);
      ShowModal;
    end;
  finally
    YycxForm.qryMaster.Close;
    YycxForm.qryDetail.Close;
    YycxForm.Free;
  end;

end;

procedure Yycx;
begin
  YycxForm := TYycxForm.Create(Application);
  try
    with YycxForm do
    begin
      DateTimePicker1.Date := Date;
      qryMaster.Close;
      qryMaster.Params[0].AsDate := Date;
      qryMaster.Open;
      qryDetail.Close;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    YycxForm.qryMaster.Close;
    YycxForm.qryDetail.Close;
    YycxForm.Free;
  end;

end;

procedure TYycxForm.qryMasterD_DCLBGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.AsString = DCLB_YC then Text := '餐费';
    if Sender.AsString = DCLB_QT then Text := '非餐费';
  end;
end;

procedure TYycxForm.DateTimePicker1Change(Sender: TObject);
var
  ADate: TDate;
  sm,sd: string;
begin
  ADate := DateTimePicker1.Date;
  if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
  begin
    sm := 'select * from CTDC where (D_XFRQ=:XFRQ)and(D_CTBH<>"0")and(D_XMBH="0")';
    sd := 'select * from DCMX where D_DCBH=:D_DCBH';
  end
  else
  begin
    sm := 'select * from CTDCDA where (D_XFRQ=:XFRQ)and(D_CTBH<>"0")and(D_XMBH="0")';
    sd := 'select * from DCMXDA where D_DCBH=:D_DCBH';
  end;
  qryMaster.DisableControls;
  qryDetail.DisableControls;

  qryDetail.Close;
  qryMaster.Close;
  qryMaster.SQL.Clear;
  qryMaster.SQL.Add(sm);
  qryMaster.Params[0].AsDate := ADate;
  qryMaster.Prepare;
  qryMaster.Open;

  qryDetail.SQL.Clear;
  qryDetail.SQL.Add(sd);
  qryDetail.Prepare;
  qryDetail.Open;
  
  qryMaster.EnableControls;
  qryDetail.EnableControls;
end;

procedure TYycxForm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if qryDetailD_DEL.Value='T' then
    DBGrid2.Canvas.Font.Color := clRed;
  DBGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TYycxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '营业查询（'+DateToStr(DateTimePicker1.Date)+'）';
  {APrintStru.ASub := qryMasterD_KRXM.Value+' '+qryMasterD_CTMC.Value+' 消费金额：'
                    +qryMasterD_XFJE.AsString+' 优惠金额：'+qryMasterD_YHJE.AsString
                    +' 结帐方式：'+qryMasterD_JZFS.Value;}
  APrintStru.ADataSet := qryMaster;
  PrintLb(APrintStru,DBGrid1);
end;

end.
