unit C_ctdc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Buttons, C_CtDefine, DB,
  DBTables, Grids, DBGrids, DosMove;

type
  TCtdcForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    btnDc: TBitBtn;
    btnSc: TBitBtn;
    btnTc: TBitBtn;
    btnJz: TBitBtn;
    btnDy: TBitBtn;
    btnClose: TBitBtn;
    DBGrid1: TDBGrid;
    dsDcmx: TDataSource;
    Panel4: TPanel;
    lblCtbh: TLabel;
    lblKrxm: TLabel;
    lblKrsl: TLabel;
    lblYcsj: TLabel;
    tblDcmx: TTable;
    tblDcmxD_XMMC: TStringField;
    lblHjje: TLabel;
    btnUndel: TBitBtn;
    lblCzyxm: TLabel;
    DBGrid2: TDBGrid;
    tblCtdc: TTable;
    dsCtdc: TDataSource;
    tblCtdcD_CTMC: TStringField;
    tblDcmxD_DCBH: TStringField;
    tblDcmxD_CTBH: TStringField;
    tblDcmxD_CDBH: TStringField;
    tblDcmxD_XMBH: TStringField;
    tblDcmxD_CDMC: TStringField;
    tblDcmxD_XFSL: TFloatField;
    tblDcmxD_THSL: TFloatField;
    tblDcmxD_DJ: TFloatField;
    tblDcmxD_XFRQ: TDateTimeField;
    tblDcmxD_DEL: TStringField;
    tblDcmxD_BZ: TStringField;
    tblCtdcD_DCBH: TStringField;
    tblCtdcD_CTBH: TStringField;
    tblCtdcD_XMBH: TStringField;
    tblCtdcD_DCLB: TStringField;
    tblCtdcD_XFRQ: TDateTimeField;
    tblCtdcD_XFSJ: TDateTimeField;
    tblCtdcD_SJDM: TStringField;
    tblCtdcD_KRSL: TIntegerField;
    tblCtdcD_YCBZ: TStringField;
    tblCtdcD_KRXM: TStringField;
    tblCtdcD_JSBZ: TStringField;
    tblCtdcD_JZFS: TStringField;
    tblCtdcD_KHBH: TStringField;
    tblCtdcD_XYKBH: TStringField;
    tblCtdcD_XFJE: TFloatField;
    tblCtdcD_YHJE: TFloatField;
    tblCtdcD_CZYXM: TStringField;
    tblCtdcD_YDBH: TStringField;
    tblCtdcD_BZ: TStringField;
    tblDcmxD_HH: TStringField;
    DosMove1: TDosMove;
    tblDcmxD_XJJE: TCurrencyField;
    procedure btnDcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblDcmxNewRecord(DataSet: TDataSet);
    procedure btnScClick(Sender: TObject);
    procedure tblDcmxD_THSLValidate(Sender: TField);
    procedure btnTcClick(Sender: TObject);
    procedure tblDcmxAfterPost(DataSet: TDataSet);
    procedure btnUndelClick(Sender: TObject);
    procedure btnJzClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsCtdcDataChange(Sender: TObject; Field: TField);
    procedure btnDyClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblDcmxCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FCtzt: TCtzt;
    procedure ShowYcxx;
    procedure SumJe;
  public
    { Public declarations }
    procedure Ctdc(ACtzt: TCtzt);
    procedure GetDcmx(ADcmx: TDcmx;IsAll: Boolean);
    procedure InsertCd(ADcmx: TDcmx);
  end;

var
  CtdcForm: TCtdcForm;

implementation

uses C_CtData, C_dcmx, C_cttc, C_ctjz, C_Sysprint;

{$R *.dfm}

//餐厅点菜
procedure TCtdcForm.Ctdc(ACtzt: TCtzt);
begin
  try
    FCtzt := ACtzt;
    ShowYcxx;
    tblDcmx.Open;
    tblCtdc.Open;
    tblCtdc.Filter   := 'D_DCBH='''+FCtzt.ADcbh+''' and D_CTBH<>''0''';
    tblCtdc.Filtered := True;
    SumJe;
    tblCtdc.Refresh;
    tblCtdc.Locate('D_CTBH',ACtzt.ACtbh,[]);
    ShowModal;
  finally
    tblDcmx.Close;
  end;
end;

procedure TCtdcForm.SumJe;
var
  PrevRecord: TBookMark;
  FTotals : Currency;
begin
  PrevRecord := tblDcmx.GetBookmark;
  try
    tblDcmx.DisableControls;
    FTotals := 0;
    tblDcmx.First;
    while not tblDcmx.Eof do
    begin
      if tblDcmxD_DEL.Value='F' then
        FTotals := FTotals + (tblDcmxD_XFSL.Value-tblDcmxD_THSL.Value)*tblDcmxD_DJ.Value;
      tblDcmx.Next;
    end;
    lblHjje.Caption := '合计金额：'+FormatFloat('#.##',FTotals)+'元';
  finally
    tblDcmx.EnableControls;
    if PrevRecord<>nil then
    begin
      tblDcmx.GotoBookmark(PrevRecord);
      tblDcmx.FreeBookmark(PrevRecord);
    end;
  end;
end;

//显示用餐信息
procedure TCtdcForm.ShowYcxx;
var
  Enable: Boolean;
begin
  lblCtbh.Caption := '餐厅台号：'+FCtzt.ACtbh+' '+FCtzt.ACtmc;
  lblKrsl.Caption := '客人数量：'+IntToStr(FCtzt.AKrsl);
  lblYcsj.Caption := '用餐时间：'+TimeToStr(FCtzt.AXfsj);
  lblKrxm.Caption := '客人姓名：'+FCtzt.AKrxm;
  lblCzyxm.Caption:= '操 作 员：'+Czy.CzyXm;
  Enable := FCtzt.ACtzt <> CTZT_JZ;
  btnDc.Enabled    := Enable;
  btnSc.Enabled    := Enable;
  btnTc.Enabled    := Enable;
  btnJz.Enabled    := Enable;
  btnUndel.Enabled := Enable;
end;

//点菜
procedure TCtdcForm.btnDcClick(Sender: TObject);
begin
  DcmxForm.Dcmx;
end;

procedure TCtdcForm.FormShow(Sender: TObject);
begin
  Left := 0;
  Top := 0;
end;

procedure TCtdcForm.InsertCd(ADcmx: TDcmx);
begin
      tblDcmx.Append;
      tblDcmxD_CDBH.Value := ADcmx.ACdbh;
      tblDcmxD_CDMC.Value := ADcmx.ACdmc;
      tblDcmxD_XMBH.Value := ADcmx.AXmbh;
      tblDcmxD_XFSL.Value := ADcmx.AXfsl;
      tblDcmxD_DJ.Value   := ADcmx.ADj;
      tblDcmxD_XFRQ.Value := Date;
      tblDcmx.Post;
      tblDcmx.Refresh;
    {if tblDcmx.FindKey([FCtzt.ADcbh,FCtzt.ACtbh,ADcmx.ACdbh]) then
    begin
      tblDcmx.Edit;
      tblDcmxD_XFSL.Value := tblDcmxD_XFSL.Value + ADcmx.AXfsl;
      tblDcmx.Post;
    end
    else
    begin
      tblDcmx.Append;
      tblDcmxD_CDBH.Value := ADcmx.ACdbh;
      tblDcmxD_CDMC.Value := ADcmx.ACdmc;
      tblDcmxD_XMBH.Value := ADcmx.AXmbh;
      tblDcmxD_XFSL.Value := ADcmx.AXfsl;
      tblDcmxD_DJ.Value   := ADcmx.ADj;
      tblDcmxD_XFRQ.Value := Date;
      tblDcmx.Post;
    end;}
end;

procedure TCtdcForm.GetDcmx(ADcmx: TDcmx;IsAll: Boolean);
begin
  //是否点相同的菜
  if not IsAll then
  begin
    InsertCd(ADcmx);
  end
  else
  begin
    tblCtdc.First;
    while not tblCtdc.Eof do
    begin
      InsertCd(ADcmx);
      tblCtdc.Next;
    end;
  end;
end;

procedure TCtdcForm.tblDcmxNewRecord(DataSet: TDataSet);
begin
  tblDcmxD_HH.Value   := GetHh;
  tblDcmxD_DCBH.Value := FCtzt.ADcbh;
  tblDcmxD_CTBH.Value := FCtzt.ACtbh;
  tblDcmxD_THSL.Value := 0;
end;

//删菜
procedure TCtdcForm.btnScClick(Sender: TObject);
begin
  if not tblDcmx.IsEmpty then
  begin
    if Confirm('你确认删除吗？') then
    begin
      tblDcmx.Edit;
      tblDcmxD_DEL.Value := 'T';
      tblDcmx.Post;
    end;
  end;
end;

procedure TCtdcForm.tblDcmxD_THSLValidate(Sender: TField);
begin
  if tblDcmxD_THSL.Value > tblDcmxD_XFSL.Value then
    raise Exception.Create('退还数量不能大于消费数量！');
end;

//退菜
procedure TCtdcForm.btnTcClick(Sender: TObject);
begin
  if not tblDcmx.IsEmpty then
    Cttc;
end;

procedure TCtdcForm.tblDcmxAfterPost(DataSet: TDataSet);
begin
  SumJe;
end;

//恢复
procedure TCtdcForm.btnUndelClick(Sender: TObject);
begin
  if (not tblDcmx.IsEmpty)and(tblDcmxD_DEL.Value='T') then
  begin
    if Confirm('你确认恢复吗？') then
    begin
      tblDcmx.Edit;
      tblDcmxD_DEL.Value := 'F';
      tblDcmx.Post;
    end;
  end;
end;

//结帐
procedure TCtdcForm.btnJzClick(Sender: TObject);
var
  ACtzts: TCtzts;
  i: Integer;
begin
  SetLength(ACtzts,tblCtdc.RecordCount);

  tblCtdc.First;
  
  i := 0;
  while not tblCtdc.Eof do
  begin
    ACtzts[i] := FCtzt;
    Inc(i);
    tblCtdc.Next;
  end;
  
  Ctjz(ACtzts);

  if ACtzts[0].ACtzt = CTZT_JZ then
    Close;

end;

procedure TCtdcForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if tblDcmxD_THSL.Value>0 then
    DBGrid1.Canvas.Font.Color := clBlue;
  if tblDcmxD_DEL.Value='T' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TCtdcForm.dsCtdcDataChange(Sender: TObject; Field: TField);
begin
  FCtzt.ACtbh := tblCtdcD_CTBH.Value;
  FCtzt.ACtmc := tblCtdcD_CTMC.Value;
  ShowYcxx;
  SumJe;
end;

procedure TCtdcForm.btnDyClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客人菜单（'+tblCtdcD_CTMC.Value+'）';
  APrintStru.ASub := lblHjje.Caption;
  APrintStru.ADataSet := tblDcmx;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TCtdcForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnDcClick(nil);
    VK_F3 : btnScClick(nil);
    VK_F4 : btnTcClick(nil);
    VK_F5 : btnJzClick(nil);
    VK_F6 : btnDyClick(nil);
    VK_F8 : btnUndelClick(nil);
  end;
end;

procedure TCtdcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DcmxForm.Visible then
    DcmxForm.Close;
end;

procedure TCtdcForm.tblDcmxCalcFields(DataSet: TDataSet);
begin
  tblDcmxD_XJJE.Value := (tblDcmxD_XFSL.Value-tblDcmxD_THSL.Value)*tblDcmxD_DJ.Value;
end;

end.
