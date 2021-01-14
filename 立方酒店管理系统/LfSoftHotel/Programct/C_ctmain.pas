unit C_ctmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ToolWin, ComCtrls, Menus, Grids,
  DB, DBTables, C_CtDefine, ImgList, TeEngine, Series, TeeProcs, Chart,
  DBGrids, XPMenu, IniFiles, DBCtrls;

type
  TCtmainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnXt: TBitBtn;
    btnKt: TBitBtn;
    btnZt: TBitBtn;
    btnBt: TBitBtn;
    btnQt: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Panel4: TPanel;
    sgdCtzt: TStringGrid;
    tblCtzt: TTable;
    ImageList1: TImageList;
    N17: TMenuItem;
    N18: TMenuItem;
    btnQuit: TBitBtn;
    btnRefresh: TBitBtn;
    tblCtdc: TTable;
    dsCtdc: TDataSource;
    tblCtdcD_CTMC: TStringField;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    qryYdcy: TQuery;
    tblCtztD_CTBH: TStringField;
    tblCtztD_CTMC: TStringField;
    tblCtztD_CTZT: TStringField;
    tblCtztD_DCBH: TStringField;
    tblCtztD_KRXM: TStringField;
    tblCtztD_KRSL: TIntegerField;
    tblCtztD_XFRQ: TDateTimeField;
    tblCtztD_XFSJ: TDateTimeField;
    tblCtztD_JZRQ: TDateTimeField;
    tblCtztD_JZSJ: TDateTimeField;
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
    Splitter2: TSplitter;
    N25: TMenuItem;
    N26: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    btnYd: TBitBtn;
    DBGrid1: TDBGrid;
    btnJt: TBitBtn;
    N32: TMenuItem;
    Panel3: TPanel;
    Chart1: TChart;
    Series1: THorizBarSeries;
    GroupBox1: TGroupBox;
    lblXfze: TLabel;
    lblJzze: TLabel;
    lblRmb: TLabel;
    lblXyk: TLabel;
    lblZp: TLabel;
    lblJzxj: TLabel;
    lblQt: TLabel;
    Bevel1: TBevel;
    lblYdze: TLabel;
    N33: TMenuItem;
    N34: TMenuItem;
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgdCtztDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdCtztSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgdCtztDblClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure btnXtClick(Sender: TObject);
    procedure btnZtClick(Sender: TObject);
    procedure btnBtClick(Sender: TObject);
    procedure btnQtClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure tblYdcyD_YDBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure N26Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnYdClick(Sender: TObject);
    procedure btnJtClick(Sender: TObject);
    procedure sgdCtztKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure OnWjzcx(Sender: TObject);
  private
    { Private declarations }
    procedure ShowCzl(AZs,ASy: Integer);
    procedure ShowXx;
  public
    { Public declarations }
    FCtNum: Integer;
    FSelect: Integer;
    FCtzt: array of TCtzt;

    procedure ShowCtzt;
    procedure Ydcykt(const ADcbh,ACtbh,AKrxm,AYcbz,AYdbz: string;AYcje: Currency);
  end;

const
  ColNum = 12;//每行显示的个数

var
  CtmainForm: TCtmainForm;

implementation

uses C_ctxfxm,
     C_ctth,
     C_cddm,
     C_Ctkt,
     C_ctdc,
     C_Ctxt,
     C_CtData,
     C_Fcfjz,
     C_Yycx,
     C_Xhtj,
     C_Dcbd,
     C_Ctxtm,
     C_Klsz,
     C_Password,
     C_About,
     C_Xtsz, C_Yytj, C_Ctyd, C_Ctjt, C_Wjzcx;

{$R *.dfm}

//显示餐厅状态
procedure TCtmainForm.ShowCtzt;
var
  I,ASy: Integer;
  s: string;
begin
  ASy := 0;
  tblCtzt.Refresh;
  FCtNum := tblCtzt.RecordCount;
  SetLength(FCtzt,FCtNum);
  sgdCtzt.ColCount := ColNum;
  sgdCtzt.RowCount := (FCtNum div ColNum) + 1;
  tblCtzt.First;

  qryYdcy.Close;
  qryYdcy.ParamByName('RQ').AsDate := Date;
  qryYdcy.Open;

  i := 0;
  while not tblCtzt.Eof do
  begin
    FCtzt[i].ACtbh := tblCtztD_CTBH.Value;
    FCtzt[i].ACtmc := tblCtztD_CTMC.Value;
    FCtzt[i].ACtzt := tblCtztD_CTZT.Value;
    FCtzt[i].ADcbh := tblCtztD_DCBH.Value;
    FCtzt[i].AXfrq := tblCtztD_XFRQ.Value;
    FCtzt[i].AXfsj := tblCtztD_XFSJ.Value;
    FCtzt[i].AJzrq := tblCtztD_JZRQ.Value;
    FCtzt[i].AJzsj := tblCtztD_JZSJ.Value;
    FCtzt[i].AKrsl := tblCtztD_KRSL.Value;
    FCtzt[i].AKrxm := tblCtztD_KRXM.Value;
    FCtzt[i].AYdbz := '';
    FCtzt[i].ASjdm := '';

    if qryYdcy.Locate('D_CTBH',FCtzt[i].ACtbh,[]) then
    begin
      if IS_YDXS then
        FCtzt[i].AColor := clRed
      else
        FCtzt[i].AColor := cl3DLight;
      FCtzt[i].AYdbz := qryYdcy.FieldByName('D_KRXM').AsString;// '★';
      FCtzt[i].ASjdm := qryYdcy.FieldbyName('D_SJDM').AsString;
    end;
    //统计消费
    if FCtzt[i].ACtzt <> CTZT_OK then
    begin
      s := 'select sum(D_DJ*(D_XFSL-D_THSL)) from DCMX where (D_DCBH="'
           +FCtzt[i].ADcbh
           +'")and(D_CTBH="'
           +FCtzt[i].ACtbh
           +'")and(D_DEL="F")';
      //edit by ls. 20020902 取整
      FCtzt[i].AXfje := Trunc(CtData.SumJe(s)+0.99);
    end
    else
      FCtzt[i].AXfje := 0;

    if FCtzt[i].ACtzt = CTZT_OK then
    begin
      if FCtzt[i].AYdbz = '' then
        FCtzt[i].AColor := cl3DLight;
      FCtzt[i].AImage := 0;
    end;

    if FCtzt[i].ACtzt = CTZT_USE then
    begin
      FCtzt[i].AColor := clSkyBlue;
      FCtzt[i].AImage := 1;
      Inc(ASy);
    end;

    if FCtzt[i].ACtzt = CTZT_JZ then
    begin
      FCtzt[i].AColor := clYellow;
      FCtzt[i].AImage := 2;
      Inc(ASy);
    end;

    Inc(i);
    tblCtzt.Next;
  end;
  qryYdcy.Close;
  sgdCtzt.Refresh;
  tblCtdc.Refresh;
  ShowXx;
  ShowCzl(FCtNum,ASy);
end;

//edit by ls. 20020903
procedure TCtmainForm.ShowXx;
var
  AXfze,AJzze,ARmb,AXyk,AZp,AJzxj,AQt,AYdze: Currency;
  s : string;
begin
  ARmb := 0;AXyk := 0;
  AZp := 0;AQt := 0;
  GroupBox1.Caption := '结帐员 '+Czy.CzyXm;
  s := 'select sum(D_DJ*(D_XFSL-D_THSL)) from DCMX where D_DEL="F"';
  AXfze := CtData.SumJe(s);
  s := 'select sum(D_XFJE) from CTDC where (D_CZYXM="'+CZY.CzyXm+'")and(D_CTBH="0")and(D_DCLB="'+DCLB_QT+'")';
  AXfze := AXfze + CtData.SumJe(s);
  s := 'select sum(D_XFJE) from YDCY where (D_CTBH="0")and(D_RZBZ="T")and(D_SYRQ=:D)';
  with Ctdata.qrySum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('D').AsDate := Date;
    Open;
    if Fields[0].IsNull then AYdze := 0
    else AYdze := Fields[0].AsCurrency;
  end;

  s := 'select D_JZFS,sum(D_XFJE),sum(D_YHJE) from CTDC where (D_CZYXM="'+CZY.CzyXm+'")and(D_JZFS<>"")and(D_CTBH="0") group by D_JZFS';
  with CtData.qrySum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Open;
    First;
    while not Eof do
    begin
      if FieldByName('D_JZFS').AsString = JZFS_RMB then
        ARmb := ARmb + Fields[1].AsCurrency - Fields[2].AsCurrency
      else if FieldByName('D_JZFS').AsString = JZFS_XYK then
        AXyk := AXyk + Fields[1].AsCurrency - Fields[2].AsCurrency
      else if FieldByName('D_JZFS').AsString = JZFS_ZP then
        AZp := AZp + Fields[1].AsCurrency - Fields[2].AsCurrency
      else
        AQt := AQt + Fields[1].AsCurrency - Fields[2].AsCurrency;
      Next;
    end;
    Close;
  end;

  AJzze := ARmb+AXyk+AZp+AQt;
  AJzxj := ARmb+AXyk+AZp;
  lblXfze.Caption := '消费总额：'+FormatFloat('#.##',AXfze);
  lblYdze.Caption := '预定总额：'+FormatFloat('#.##',AYdze);
  lblJzze.Caption := '结帐总额：'+FormatFloat('#.##',AJzze);
  lblRmb.Caption  := '人 民 币：'+FormatFloat('#.##',ARmb);
  lblXyk.Caption  := '信 用 卡：'+FormatFloat('#.##',AXyk);
  lblZp.Caption   := '支    票：'+FormatFloat('#.##',AZp);
  lblJzxj.Caption := '餐厅收回：'+FormatFloat('#.##',AJzxj);
  lblQt.Caption   := '其    他：'+FormatFloat('#.##',AQt);
end;

//显示出租率
procedure TCtmainForm.ShowCzl(AZs,ASy: Integer);
begin
  Series1.Clear;
  Series1.AddBar(ASy/(AZs-ASy)*100,'使用率',clRed);
  //Series1.AddPie(AZs-ASy,'空闲',cl3DLight);
  //Series1.AddPie(ASy,'使用',clSkyBlue);
end;


//消费项目定义
procedure TCtmainForm.N12Click(Sender: TObject);
begin
  Ctxfxmdy;
end;

//餐厅定义
procedure TCtmainForm.N13Click(Sender: TObject);
begin
  CtthDy;
end;

//菜单定义
procedure TCtmainForm.N14Click(Sender: TObject);
begin
  Cddmdy;
end;

//初始化
procedure TCtmainForm.FormShow(Sender: TObject);
var
  IniFile : TIniFile;
begin
  if ParamStr(1)='' then
  begin
    if (not CzyDl)or(not CtData.CheckYgqx(CZY.CzyBh,'餐饮管理系统')) then
      Application.Terminate;
  end
  else
  begin
    CZY.CzyBh := ParamStr(1);
    CZY.CzyXm := ParamStr(2);
  end;
  Caption := '餐饮管理系统（操作员：' + CZY.CzyXm+'）';
  APP_DIR := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  PORTNUM := IniFile.ReadInteger('PORT','ICPORTNUM',0);
  IniFile.Free;
  tblCtzt.Open;
  tblCtdc.Open;
  FSelect := 0;
  IS_YDXS := False;
  ShowCtzt;
end;

procedure TCtmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblCtzt.Close;
end;

//刷新餐厅状态
procedure TCtmainForm.sgdCtztDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  i := ARow*sgdCtzt.ColCount + ACol;
  if i<FCtNum then
  begin
    with sgdCtzt do
    begin
      Canvas.Brush.Color := FCtzt[i].AColor;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left,Rect.Top,FCtzt[i].ACtmc);
      Canvas.TextOut(Rect.Left,Rect.Top+14,FCtzt[i].AKrxm);
      if FCtzt[i].AXfje<>0 then
        Canvas.TextOut(Rect.Left,Rect.Top+28,CurrToStr(FCtzt[i].AXfje)+'元');
      if (FCtzt[i].ACtzt = CTZT_OK)and IS_YDXS then
      begin
        Canvas.TextOut(Rect.Left,Rect.Top+14,FCtzt[i].AYdbz);
        Canvas.TextOut(Rect.Left,Rect.Top+28,FCtzt[i].ASjdm);
      end;
      //ImageList1.Draw(Canvas,Rect.Left,Rect.Top+48,FCtzt[i].AImage);
    end;
  end;
end;

procedure TCtmainForm.sgdCtztSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  s: string;
begin
  sgdCtzt.ShowHint := False;
  FSelect := ARow*sgdCtzt.ColCount + ACol;
  if FSelect < FCtnum then
  begin
    tblCtzt.Locate('D_CTBH',FCtzt[FSelect].ACtbh,[]);
    s := '客人姓名：'+tblCtztD_KRXM.Value+#13#10;
    s := s+'客人人数：'+IntToStr(tblCtztD_KRSL.Value)+#13#10;
    s := s + '开台时间：'+TimeToStr(tblCtztD_XFSJ.Value);
    sgdCtzt.Hint := s;
    sgdCtzt.ShowHint := True;
    tblCtdc.FindKey([FCtzt[FSelect].ADcbh,FCtzt[FSelect].ACtbh]);
  end;
end;

procedure TCtmainForm.sgdCtztDblClick(Sender: TObject);
var
  ACtzt: TCtzt;
begin
  if (FSelect < FCtNum)and(FCtzt[FSelect].ACtzt = CTZT_OK) then
  begin
    ACtzt := FCtzt[FSelect];
    Ctkt(ACtzt);
    if ACtzt.ADcbh <> '' then
      CtdcForm.Ctdc(ACtzt);
    ShowCtzt;
    Exit;
  end;
  if (FSelect < FCtNum)and((FCtzt[FSelect].ACtzt = CTZT_USE)or(FCtzt[FSelect].ACtzt = CTZT_JZ)) then
  begin
    ACtzt := FCtzt[FSelect];
    CtdcForm.Ctdc(ACtzt);
    ShowCtzt;
    Exit;
  end;
end;

procedure TCtmainForm.N18Click(Sender: TObject);
begin
  Close;
end;

//选台
procedure TCtmainForm.btnXtClick(Sender: TObject);
var
  ACtzts: TCtzts;
begin
  with CtxtmForm do
  begin
    ACtzts := Ctxtm;
    if ModalResult = mrOK then
    begin
      Ctktm(ACtzts);
      if CtktForm.ModalResult = mrOk then
      begin
        CtdcForm.Ctdc(ACtzts[0]);
        ShowCtzt;
      end;
    end;
  end;
end;

//转台
procedure TCtmainForm.btnZtClick(Sender: TObject);
var
  ACtzts,ACtztd: TCtzt;
  ACtbhd: string;
begin
  if (FSelect < FCtNum)and(FCtzt[FSelect].ACtzt = CTZT_USE) then
  begin
    ACtzts := FCtzt[FSelect];
    ACtbhd := Ctzt;
    if ACtbhd<>'' then
    begin
      ACtztd := ACtzts;
      ACtztd.ACtbh := ACtbhd;
      CtData.DatabaseUser.StartTransaction;
      try
        //设置目的餐台的状态
        CtData.SetCtzt(ACtztd);
        //初始化源餐台的状态
        CtData.InitCtzt(ACtzts);
        //修改餐厅编号
        CtData.UpdateCtbh(ACtztd.ADcbh,ACtzts.ACtbh,ACtbhd);
        //修改点菜明细
        CtData.UpdateDcmx(ACtztd.ADcbh,ACtzts.ACtbh,ACtbhd);

        CtData.DatabaseUser.Commit;
      except
        CtData.DatabaseUser.Rollback;
        raise;
      end;
      ShowCtzt;
    end;
  end;
end;

//并台
procedure TCtmainForm.btnBtClick(Sender: TObject);
var
  ACtzts,ACtztd: TCtzt;
  ACtbhd: string;
begin
  if (FSelect < FCtNum)and(FCtzt[FSelect].ACtzt = CTZT_USE) then
  begin
    ACtzts := FCtzt[FSelect];
    ACtbhd := Ctbt;
    if ACtbhd<>'' then
    begin
      ACtztd := CtData.GetCtzt(ACtbhd);
      CtData.DatabaseUser.StartTransaction;
      try
        CtData.Dcmxbt(ACtzts.ADcbh,ACtztd.ADcbh);
        CtData.UpdateCtdcbt(ACtzts.ADcbh,ACtztd.ADcbh);
        ACtzts.ADcbh := ACtztd.ADcbh;
        CtData.SetCtzt(ACtzts);
        CtData.DatabaseUser.Commit;
      except
        CtData.DatabaseUser.Rollback;
        raise;
      end;

      ShowCtzt;
    end;
  end;
end;

//清台
procedure TCtmainForm.btnQtClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to FCtNum -1 do
    if FCtzt[i].ACtzt = CTZT_JZ then
      CtData.InitCtzt(FCtzt[i]);
  ShowCtzt;
end;

//非餐费结帐
procedure TCtmainForm.N16Click(Sender: TObject);
begin
  Fcfjz;
  ShowCtzt;
end;

//营业查询
procedure TCtmainForm.N10Click(Sender: TObject);
begin
  Yycx;
end;

//消耗统计
procedure TCtmainForm.N8Click(Sender: TObject);
begin
  Xhtj;
end;

//点菜变动
procedure TCtmainForm.N9Click(Sender: TObject);
begin
  Dcbd;
end;

//刷新
procedure TCtmainForm.btnRefreshClick(Sender: TObject);
begin
  ShowCtzt;
end;

procedure TCtmainForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if tblCtdcD_JZFS.Value <> '' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

//预定开台
procedure TCtmainForm.Ydcykt(const ADcbh,ACtbh,AKrxm,AYcbz,AYdbz: string;AYcje: Currency);
var
  ACtzt: TCtzt;
begin
  tblCtdc.Insert;
  tblCtdcD_DCBH.Value := ADcbh;
  tblCtdcD_CTBH.Value := ACtbh;
  tblCtdcD_KRSL.Value := 1;
  tblCtdcD_KRXM.Value := AKrxm;
  tblCtdcD_XFRQ.Value := Date;
  tblCtdcD_XFSJ.Value := Time;
  tblCtdcD_YCBZ.Value := AYcbz;
  tblCtdcD_SJDM.Value := GetSjdm(Time);
  tblCtdcD_XMBH.Value := '0';
  tblCtdcD_DCLB.Value := DCLB_YC;
  tblCtdcD_JSBZ.Value := JS_NO;
  tblCtdcD_CZYXM.Value:= CZY.CzyXm;
  tblCtdc.Post;
  ACtzt.ACtbh := tblCtdcD_CTBH.Value;
  ACtzt.ACtzt := CTZT_USE;
  ACtzt.AKrxm := tblCtdcD_KRXM.Value;
  ACtzt.AKrsl := tblCtdcD_KRSL.Value;
  ACtzt.ADcbh := tblCtdcD_DCBH.Value;
  ACtzt.AXfrq := tblCtdcD_XFRQ.AsDateTime;
  ACtzt.AXfsj := tblCtdcD_XFSJ.AsDateTime;
  CtData.SetCtzt(ACtzt);
  if AYcje<>0 then
    CtData.InsertBzc(ACtzt.ADcbh,ACtzt.ACtbh,ACtzt.AXfrq,AYcje);

  {if AYdbz = 'P' then
  begin
    if AYcje<>0 then
      CtData.InsertBzc(ACtzt.ADcbh,ACtzt.ACtbh,ACtzt.AXfrq,AYcje);
  end
  else
  begin
    if AYcje<>0 then
      CtData.InsertBzc(ACtzt.ADcbh,ACtzt.ACtbh,ACtzt.AXfrq,tblYdcydD_XFJE.Value);
  end;}
end;


//口令设置
procedure TCtmainForm.N20Click(Sender: TObject);
begin
  Klsz(CZY.CzyBh);
end;

//重新登录
procedure TCtmainForm.N21Click(Sender: TObject);
begin
  if (not CzyDl)or(not CtData.CheckYgqx(CZY.CzyBh,'餐饮管理系统')) then
    Application.Terminate;
  Caption := '餐饮管理系统（操作员：' + CZY.CzyXm+'）';
end;

//关于
procedure TCtmainForm.N23Click(Sender: TObject);
begin
  About;
end;

//系统设置
procedure TCtmainForm.N24Click(Sender: TObject);
begin
  Xtsz;
end;

procedure TCtmainForm.tblYdcyD_YDBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisPlayText then
  begin
    if Sender.AsString = 'P' then Text := '散客预定'
    else Text := '团队预定';
  end;
end;

procedure TCtmainForm.N26Click(Sender: TObject);
begin
  Yytj(0);
end;

procedure TCtmainForm.N30Click(Sender: TObject);
begin
  Yytj(1);
end;

procedure TCtmainForm.N31Click(Sender: TObject);
begin
  Yytj(2);
end;

procedure TCtmainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : btnYdClick(nil);
    VK_F2 : btnXtClick(nil);
    VK_F3 : sgdCtztDblClick(nil);
    VK_F4 : btnZtClick(nil);
    VK_F5 : btnBtClick(nil);
    VK_F6 : btnQtClick(nil);
    VK_F7 : btnJtClick(nil);
    VK_F8 : btnRefreshClick(nil);
    VK_F10: begin
              IS_YDXS := not IS_YDXS;
              //N33.Checked := IS_YDXS;
              ShowCtzt;
            end;
  end;
end;

procedure TCtmainForm.btnYdClick(Sender: TObject);
begin
  Ydcy;
end;

procedure TCtmainForm.btnJtClick(Sender: TObject);
begin
  Ctjt;
end;

procedure TCtmainForm.sgdCtztKeyPress(Sender: TObject; var Key: Char);
var
  ACtzt: TCtzt;
begin
  if Key=#13 then
  begin
  if (FSelect < FCtNum)and(FCtzt[FSelect].ACtzt = CTZT_OK) then
  begin
    ACtzt := FCtzt[FSelect];
    Ctkt(ACtzt);
    if ACtzt.ADcbh <> '' then
      CtdcForm.Ctdc(ACtzt);
    ShowCtzt;
    Exit;
  end;
  if (FSelect < FCtNum)and((FCtzt[FSelect].ACtzt = CTZT_USE)or(FCtzt[FSelect].ACtzt = CTZT_JZ)) then
  begin
    ACtzt := FCtzt[FSelect];
    CtdcForm.Ctdc(ACtzt);
    ShowCtzt;
    Exit;
  end;
  end;
end;

procedure TCtmainForm.DBGrid1DblClick(Sender: TObject);
var
  aDcbh : string;
begin
  if tblCtdc.IsEmpty then Exit;
  aDcbh := tblCtdcD_DCBH.Value;
  YycxEnter(aDcbh);
end;

procedure TCtmainForm.N33Click(Sender: TObject);
begin
  IS_YDXS := N33.Checked;
  ShowCtzt;
end;

procedure TCtmainForm.OnWjzcx(Sender: TObject);
begin
  Wjzcx;
end;

end.
