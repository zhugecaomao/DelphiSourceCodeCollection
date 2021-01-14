unit IcCardMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBTables, Grids,
  DBGrids, DosMove, Menus, XPMenu, IniFiles, ImgList;

type
  TIcCardForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    btnReadCard: TBitBtn;
    memRead: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtRCardId: TLabeledEdit;
    edtRCardJe: TLabeledEdit;
    edtWriteCard: TBitBtn;
    memWrite: TMemo;
    GroupBox3: TGroupBox;
    edtWCardId: TLabeledEdit;
    edtWKrxm: TLabeledEdit;
    edtWZjhm: TLabeledEdit;
    edtWCardJe: TLabeledEdit;
    edtWXkr: TLabeledEdit;
    tblCard: TTable;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsCard: TDataSource;
    edtRId: TLabeledEdit;
    edtRKrxm: TLabeledEdit;
    edtRZjhm: TLabeledEdit;
    edtRZe: TLabeledEdit;
    edtRXkr: TLabeledEdit;
    btnPrint: TBitBtn;
    lblZe: TLabel;
    lblJe: TLabel;
    lblYe: TLabel;
    qrySum: TQuery;
    tblKrjz: TTable;
    TabSheet5: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    memCz: TMemo;
    GroupBox4: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    GroupBox5: TGroupBox;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    edtCzje: TLabeledEdit;
    Panel4: TPanel;
    qryCardXf: TQuery;
    DBGrid2: TDBGrid;
    dsCardxf: TDataSource;
    Label3: TLabel;
    edtCardid: TEdit;
    BitBtn3: TBitBtn;
    lblXfje: TLabel;
    BitBtn4: TBitBtn;
    edtRJe: TLabeledEdit;
    edtRYe: TLabeledEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    A1: TMenuItem;
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
    ImageList1: TImageList;
    DosMove1: TDosMove;
    tblKrjzD_JZBH: TStringField;
    tblKrjzD_HH: TIntegerField;
    tblKrjzD_XMBH: TStringField;
    tblKrjzD_XFDJ: TFloatField;
    tblKrjzD_XFSL: TFloatField;
    tblKrjzD_XFGG: TStringField;
    tblKrjzD_XFJE: TFloatField;
    tblKrjzD_YJJE: TFloatField;
    tblKrjzD_YHJE: TFloatField;
    tblKrjzD_JZFS: TStringField;
    tblKrjzD_JZLX: TStringField;
    tblKrjzD_KHBH: TStringField;
    tblKrjzD_XYKBH: TStringField;
    tblKrjzD_JZRQ: TDateTimeField;
    tblKrjzD_JZSJ: TDateTimeField;
    tblKrjzD_CZYXM: TStringField;
    tblKrjzD_BZ: TStringField;
    tblKrjzD_YSRQ: TStringField;
    procedure btnReadCardClick(Sender: TObject);
    procedure edtWriteCardClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    { Private declarations }
    Je : Single;
    function IsValid: Boolean;
    procedure UpdateKrjz(const aKrxm: string);
  public
    { Public declarations }
  end;

var
  IcCardForm: TIcCardForm;

implementation

uses IcCardDefine, drv_unit, C_CardData, C_Sysprint, C_Klsz, C_Password,
  C_Xtsz, C_About;


{$R *.dfm}

procedure TIcCardForm.UpdateKrjz(const aKrxm: string);
var
  AJzbh: string;
begin
  tblKrjz.Open;
  AJzbh := CardData.GetBh('D_JZBH',PREV_JZBH);
  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 0;
  tblKrjzD_JZRQ.Value := Date;
  tblKrjzD_JZSJ.Value := Time;
  tblKrjzD_JZFS.Value := JZFS_GBK;
  tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_XFJE.Value := Je;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BZ.Value   := '贵宾卡预交款 '+aKrxm;
  tblKrjz.Post;

  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 1;
  tblKrjzD_JZRQ.Value := Date;
  tblKrjzD_JZSJ.Value := Time;
  tblKrjzD_JZFS.Value := JZFS_GBK;
  tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_XMBH.Value := XMBH_YJK;
  tblKrjzD_XFJE.Value := Je;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BZ.Value   := '贵宾卡预交款 '+aKrxm;
  tblKrjz.Post;
  tblKrjz.Close;
end;


function TIcCardForm.IsValid: Boolean;
begin
  Result := True;
  if edtWCardId.Text = '' then
  begin
    ShowMessage('请输入贵宾卡卡号！');
    Result := False;
    Exit;
  end;
  if Length(edtWCardId.Text) > 6 then
  begin
    ShowMessage('贵宾卡卡号长度不能大于6！');
    Result := False;
    Exit;
  end;
  if edtWCardJe.Text = '' then
  begin
    ShowMessage('请输入贵宾卡金额！');
    Result := False;
    Exit;
  end;
  if tblCard.FindKey([edtWCardId.Text]) then
  begin
    ShowMessage('贵宾卡卡号已经存在！');
    Result := False;
    Exit;
  end;
end;

procedure TIcCardForm.btnReadCardClick(Sender: TObject);
var
  st : SmallInt;
  s: string;
  Je: single;
begin
  edtRCardId.Text := '';
  edtRCardJe.Text := '';
  edtRId.Text := '';
  edtRKrxm.Text := '';
  edtRZjhm.Text := '';
  edtRJe.Text := '';
  edtRXkr.Text := '';
  try
    InitStatus(PORTNUM);
    GetMem(OutBuf,6);
    if not IsCardExists then
    begin
      memRead.Lines.Add('请插入贵宾卡！');
      Exit;
    end;
    st := IC_Read(IcDev,32,6,OutBuf);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    s := StrPas(OutBuf);
    edtRCardId.Text := s;
    st := IC_Read_Float(IcDev,38,@Je);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    edtRCardJe.Text := FloatToStr(Je);
    memRead.Lines.Add('读卡成功！');
    if tblCard.FindKey([s]) then
    begin
      edtRId.Text := tblCard.FieldByName('D_CARDID').AsString;
      edtRKrxm.Text := tblCard.FieldByName('D_KRXM').AsString;
      edtRZjhm.Text := tblCard.FieldByName('D_ZJHM').AsString;
      edtRZe.Text := tblCard.FieldByName('D_ZE').AsString;
      edtRJe.Text := tblCard.FieldByName('D_JE').AsString;
      edtRYe.Text := tblCard.FieldByName('D_YE').AsString;
      edtRXkr.Text := tblCard.FieldByName('D_XKR').AsString;
    end;
  finally
    FreeMem(OutBuf);
    //ICDown;
    ExitComm;
  end;
end;

procedure TIcCardForm.edtWriteCardClick(Sender: TObject);
var
  st : SmallInt;
begin

  if not IsValid then Exit;
  Je := StrToFloat(edtWCardJe.Text);
  if Je<=0 then
  begin
    ShowMessage('写卡金额必须大于零！');
    Exit;
  end;
  try

    InitStatus(PORTNUM);

    if not IsCardExists then
    begin
      memWrite.Lines.Add('请插入贵宾卡！');
      Exit;
    end;
    //if IC_CheckPass_4442hex(IcDev,PChar(Pass_Word))=0 then
    if CheckPass then
    begin
      InBuf := edtWCardId.Text;
      st := IC_Write(IcDev,32,6,PChar(InBuf));
      if st <> 0 then
        raise Exception.Create('写卡错误！');
      st := IC_Write_Float(IcDev,38,Je);
      if st <> 0 then
        raise Exception.Create('写卡错误！');
      memWrite.Lines.Add('写卡成功');
    end;

    tblCard.Insert;
    tblCard.FieldByName('D_CARDID').AsString := edtWCardId.Text;
    tblCard.FieldByName('D_KRXM').AsString := edtWKrxm.Text;
    tblCard.FieldByName('D_ZJHM').AsString := edtWZjhm.Text;
    tblCard.FieldByName('D_XKR').AsString := edtWXkr.Text;
    tblCard.FieldByName('D_ZE').AsCurrency := Je;
    tblCard.FieldByName('D_YE').AsCurrency := Je;
    tblCard.FieldByName('D_XKRQ').AsDateTime := Date;
    tblCard.FieldByName('D_XKSJ').AsDateTime := Time;
    tblCard.Post;

    UpdateKrjz(edtWKrxm.Text);

    CardData.InsertYjk(YJLX_GB,YJBZ_GB+' '+edtWCardId.Text,JE,0,0);
  finally
    //IcDown;
    ExitComm;
  end;
end;

procedure TIcCardForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  ExitComm;
  tblCard.Close;
end;

procedure TIcCardForm.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
begin
  if (not CzyDl)or(not CardData.CheckYgqx(CZY.CzyBh,'贵宾卡管理系统')) then
    Application.Terminate;
  Caption := '贵宾卡管理系统（操作员：' + CZY.CzyXm+'）';
  APP_DIR := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  PORTNUM := IniFile.ReadInteger('PORT','ICPORTNUM',0);
  IniFile.Free;
  tblCard.Open;
  edtWXkr.Text := CZY.CzyXm;
  PageControl1.ActivePageIndex := 0;
end;

procedure TIcCardForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    if not CardData.CheckYgqx(CZY.CzyBh,'发卡') then
      PageControl1.ActivePageIndex := 0;
  if PageControl1.ActivePageIndex = 2 then
    if not CardData.CheckYgqx(CZY.CzyBh,'充值') then
      PageControl1.ActivePageIndex := 0;

  if PageControl1.ActivePageIndex = 3 then
  begin
    with qrySum do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select sum(D_ZE),sum(D_JE),sum(D_YE) from CARD');
      Open;
      lblZe.Caption := '卡内总额：'+qrySum.Fields[0].AsString+'元';
      lblJe.Caption := '消费总额：'+qrySum.Fields[1].AsString+'元';
      lblYe.Caption := '卡内余额：'+qrySum.Fields[2].AsString+'元';
      Close;
    end;
  end;
end;

procedure TIcCardForm.BitBtn1Click(Sender: TObject);
var
  st : SmallInt;
  s: string;
  Je: single;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  LabeledEdit6.Text := '';
  LabeledEdit7.Text := '';
  try
    InitStatus(PORTNUM);
    GetMem(OutBuf,6);
    if not IsCardExists then
    begin
      memCz.Lines.Add('请插入贵宾卡！');
      Exit;
    end;
    st := IC_Read(IcDev,32,6,OutBuf);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    s := StrPas(OutBuf);
    LabeledEdit1.Text := s;
    st := IC_Read_Float(IcDev,38,@Je);
    if st <> 0 then
      raise Exception.Create('读卡错误！');
    LabeledEdit2.Text := FloatToStr(Je);
    memCz.Lines.Add('读卡成功！');
    if tblCard.FindKey([s]) then
    begin
      LabeledEdit3.Text := tblCard.FieldByName('D_CARDID').AsString;
      LabeledEdit4.Text := tblCard.FieldByName('D_KRXM').AsString;
      LabeledEdit5.Text := tblCard.FieldByName('D_ZJHM').AsString;
      LabeledEdit6.Text := tblCard.FieldByName('D_ZE').AsString;
      LabeledEdit7.Text := tblCard.FieldByName('D_XKR').AsString;
    end;
    BitBtn2.Enabled := True;
  finally
    FreeMem(OutBuf);
    //ICDown;
    ExitComm;
  end;
end;

procedure TIcCardForm.BitBtn2Click(Sender: TObject);
var
  st : SmallInt;
  Ye : Single;
begin

  if edtCzje.Text = '' then
  begin
    ShowMessage('充值金额必须大于零！');
    edtCzje.SetFocus;
    Exit;
  end;
  Je := StrToFloat(edtCzje.Text);
  Ye := StrToFloat(LabeledEdit2.Text);
  if Je<=0 then
  begin
    ShowMessage('写卡金额必须大于零！');
    Exit;
  end;
  try

    InitStatus(PORTNUM);

    if not IsCardExists then
    begin
      memWrite.Lines.Add('请插入贵宾卡！');
      Exit;
    end;
    //if IC_CheckPass_4442hex(IcDev,PChar(Pass_Word))=0 then
    {if CheckPass then
    begin
      st := IC_Read(IcDev,32,6,OutBuf);
      if st <> 0 then
        raise Exception.Create('读卡错误！');
      s := StrPas(OutBuf);
      if s<> LabeledEdit1.Text then
      begin
        ShowMessage('卡号不符！');
        Exit;
      end;
    end;}
    if CheckPass then
    begin
      st := IC_Write_Float(IcDev,38,Je+Ye);
      if st <> 0 then
        raise Exception.Create('写卡错误！');
      memCz.Lines.Add('充值成功');
    end;
    if tblCard.FindKey([LabeledEdit1.Text]) then
    begin
      tblCard.Edit;
      tblCard.FieldByName('D_ZE').AsCurrency := tblCard.FieldByName('D_ZE').AsCurrency+Je;
      tblCard.FieldByName('D_YE').AsCurrency := tblCard.FieldByName('D_YE').AsCurrency+Je;
      tblCard.FieldByName('D_XKRQ').AsDateTime := Date;
      tblCard.FieldByName('D_XKSJ').AsDateTime := Time;
      tblCard.Post;
    end;
    UpdateKrjz(LabeledEdit4.Text);
    LabeledEdit1.Text := '';
    LabeledEdit2.Text := '';
    LabeledEdit3.Text := '';
    LabeledEdit4.Text := '';
    LabeledEdit5.Text := '';
    LabeledEdit6.Text := '';
    LabeledEdit7.Text := '';
    edtCzje.Text := '';
    BitBtn2.Enabled := False;
    
  finally
    //IcDown;
    ExitComm;
  end;
end;

procedure TIcCardForm.BitBtn3Click(Sender: TObject);
var
  ACardId : string;
begin
  ACardId := edtCardId.Text;
  if ACardId = '' then Exit;
  with qryCardXf do
  begin
    if Active then Active := False;
    ParamByName('CARDID').AsString := ACardId;
    Open;
  end;
  with qrySum do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(D_XFJE) from CARDXF');
    Open;
    lblXfje.Caption := '消费总额：'+Fields[0].AsString+'元';
    Close;
  end;
end;

procedure TIcCardForm.btnPrintClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '贵宾卡数据库信息（'+DateToStr(Date)+'）';
  APrintStru.ASub := lblZe.Caption + ' ' + lblJe.Caption + ' ' + lblYe.Caption;
  APrintStru.ADataSet := tblCard;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 8 do
        begin
          AColumns.Add(DBGrid1.Columns[I].Title.Caption);
          AFields.Add(DBGrid1.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('80');
        APosition.Add('160');
        APosition.Add('240');
        APosition.Add('320');
        APosition.Add('400');
        APosition.Add('480');
        APosition.Add('560');
        APosition.Add('640');

        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        APrintStru.AFs      := PRN_Portrait;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

procedure TIcCardForm.BitBtn4Click(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '贵宾卡消费明细（卡号：'+edtCardId.Text+'）';
  APrintStru.ADataSet := qryCardXf;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 5 do
        begin
          AColumns.Add(DBGrid2.Columns[I].Title.Caption);
          AFields.Add(DBGrid2.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('110');
        APosition.Add('210');
        APosition.Add('310');
        APosition.Add('420');
        APosition.Add('520');

        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        APrintStru.AFs      := PRN_Portrait;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

procedure TIcCardForm.N10Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TIcCardForm.N11Click(Sender: TObject);
begin
  if not CardData.CheckYgqx(CZY.CzyBh,'发卡') then Exit;
  PageControl1.ActivePageIndex := 1;
end;

procedure TIcCardForm.N12Click(Sender: TObject);
begin
  if not CardData.CheckYgqx(CZY.CzyBh,'充值') then
  PageControl1.ActivePageIndex := 2;
end;

procedure TIcCardForm.N8Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 3;
end;

procedure TIcCardForm.N9Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 4;
end;

procedure TIcCardForm.N5Click(Sender: TObject);
begin
  Klsz(CZY.CzyBh);
end;

procedure TIcCardForm.N6Click(Sender: TObject);
begin
  if (not Czydl)or(not CardData.CheckYgqx(CZY.CzyBh,'贵宾卡管理系统')) then
    Application.Terminate;
  Caption := '贵宾卡管理系统（操作员：' + CZY.CzyXm+'）';    
end;

procedure TIcCardForm.N7Click(Sender: TObject);
begin
  Xtsz;
end;

procedure TIcCardForm.A1Click(Sender: TObject);
begin
  About;
end;

procedure TIcCardForm.N14Click(Sender: TObject);
begin
  Close;
end;

end.
