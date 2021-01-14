unit C_Fcfjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DosMove, DB, DBTables, C_CtDefine, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TFcfJzForm = class(TForm)
    tblCtjz: TTable;
    tblCtjzD_XMMC: TStringField;
    dsCtjz: TDataSource;
    tblCtxm: TTable;
    DosMove1: TDosMove;
    tblKrxx: TTable;
    tblKrzd: TTable;
    tblKrjz: TTable;
    tblCtdc: TTable;
    tblYsk: TTable;
    Panel1: TPanel;
    lblTitle: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblXfje: TLabel;
    lblSjje: TLabel;
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCanc: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lblYhje: TLabel;
    btnPrint: TBitBtn;
    Bevel1: TBevel;
    tblCtjzD_XMBH: TStringField;
    tblCtjzD_XFJE: TFloatField;
    tblCtjzD_YHJE: TFloatField;
    tblCtjzD_BZ: TStringField;
    procedure tblCtjzAfterPost(DataSet: TDataSet);
    procedure tblCtjzD_XFJEValidate(Sender: TField);
    procedure tblCtjzD_YHJEValidate(Sender: TField);
    procedure radJzfsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure tblCtjzBeforeInsert(DataSet: TDataSet);
    procedure tblCtjzBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FXfje: Currency;
    FYhje: Currency;
    FSjje: Currency;

    //FKcje: Currency;

    FJzfs: string;
    FXykbh: string;
    FKhbh: string;
    FKfbh: string;
    FKrbh: string;

    FBmbh: string;
    FZdbh: string;
    FJzbh: string;

    IsAppend : Boolean;

    FGbkJzxx : TGbkJzxx;

    procedure GetJzje;
    procedure ShowJzxx;
    procedure SumJe;

    procedure GetTdmc;
    function IsValid: Boolean;

    procedure UpdateKrzd;
    procedure UpdateKrjz;
    procedure UpdateCtdc(const ABz: string);
    procedure UpdateGz(const AZdbh,AZdlb: string);
    procedure UpdateYsk;
    
  public
    { Public declarations }

  end;

var
  FcfJzForm: TFcfJzForm;

procedure Fcfjz;

implementation

uses C_CtData, C_Sysprint, C_CardXf;

{$R *.dfm}

procedure Fcfjz;
begin
  FcfjzForm := TFcfjzForm.Create(Application);
  try
    with FcfjzForm do
    begin
    FBmbh := CtData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
    FJzfs := JZFS_RMB;
    radJzfs.ItemIndex := 0;
    GetJzje;
    ShowJzxx;
    tblCtjz.Close;
    tblCtjz.Open;
    ShowModal;
    end;
  finally
    FcfjzForm.tblCtjz.Close;
    FcfjzForm.Free;
  end;
end;

procedure TFcfJzForm.GetJzje;
begin
  FXfje := 0;
  FYhje := 0;
  tblCtjz.Close;
  tblCtjz.EmptyTable;
  IsAppend := True;
  tblCtjz.Open;
  try
    tblCtxm.Open;
    tblCtxm.First;
    while not tblCtxm.Eof do
    begin
      tblCtjz.Insert;
      tblCtjzD_XMBH.Value := tblCtxm.FieldByName('D_XMBH').AsString;
      tblCtjz.Post;
      tblCtxm.Next;
    end;
  finally
    IsAppend := False;
    tblCtxm.Close;
  end;
end;

procedure TFcfJzForm.ShowJzxx;
begin
  FSjje := FXfje - FYhje;
  lblXfje.Caption := CurrToStr(FXfje)+'元';
  lblYhje.Caption := CurrToStr(FYhje)+'元';
  lblSjje.Caption := CurrToStr(FSjje)+'元';
end;

procedure TFcfJzForm.SumJe;
var
  PrevRecord: TBookMark;
  AXfje,AYhje : Currency;
begin
  PrevRecord := tblCtjz.GetBookmark;
  try
    tblCtjz.DisableControls;
    AXfje := 0;
    AYhje := 0;
    tblCtjz.First;
    while not tblCtjz.Eof do
    begin
      AXfje := AXfje + tblCtjzD_XFJE.Value;
      AYhje := AYhje + tblCtjzD_YHJE.Value;
      tblCtjz.Next;
    end;
    FXfje := AXfje;
    FYhje := AYhje;
    ShowJzxx;
  finally
    tblCtjz.EnableControls;
    if PrevRecord<>nil then
    begin
      tblCtjz.GotoBookmark(PrevRecord);
      tblCtjz.FreeBookmark(PrevRecord);
    end;
  end;
end;

procedure TFcfJzForm.tblCtjzAfterPost(DataSet: TDataSet);
begin
  if not IsAppend then
    SumJe;
end;

procedure TFcfJzForm.tblCtjzD_XFJEValidate(Sender: TField);
begin
  if tblCtjzD_XFJE.Value < 0 then
    raise Exception.Create('消费金额不能小于零！');
end;

procedure TFcfJzForm.tblCtjzD_YHJEValidate(Sender: TField);
begin
  if (tblCtjzD_YHJE.Value<0)or(tblCtjzD_YHJE.Value>tblCtjzD_XFJE.Value) then
    raise Exception.Create('优惠金额必须大于零小于消费金额！');
end;

procedure TFcfjzForm.GetTdmc;
begin
  tblKrxx.Open;
  tblKrxx.Filter := 'D_KRLX=''T''';
  tblKrxx.Filtered := True;
  tblKrxx.First;
  while not tblKrxx.Eof do
  begin
    cmbJz.Items.Add(tblKrxx.FieldByName('D_KRXM').AsString);
    tblKrxx.Next;
  end;
  tblKrxx.Filter := '';
  tblKrxx.Filtered := False;
  tblKrxx.Close;
end;

procedure TFcfJzForm.radJzfsClick(Sender: TObject);
begin
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;
  case radJzfs.ItemIndex of
    0: FJzfs := JZFS_RMB;
    1:
      begin
        CtData.ListMc(cmbJz,'XYK','D_XYKMC');
        FJzfs := JZFS_XYK;
      end;
    2: FJzfs := JZFS_ZP;
    3:
      begin
        cmbJz.Style := csDropDown;
        CtData.ListDm(cmbJz,'KHDA','D_KHMC');
        FJzfs := JZFS_JZ;
      end;
    4:
      begin
        cmbJz.Style := csDropDown;
        FJzfs := JZFS_GSK;
      end;
    5:
      begin
        GetTdmc;
        FJzfs := JZFS_GTD;
      end;
    6:
      begin
        FJzfs := JZFS_ZD;
      end;
    7: FJzfs := JZFS_GBK;
  end;
end;

function TFcfjzForm.IsValid: Boolean;
var
  s: string;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FXykbh := CtData.FindBh('XYK','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FXykbh<>'' then
          Result := True
        else
          ShowInfo('请选择信用卡！');
      end;
    3:
      begin
        s := GetMc(cmbJz.Text);
        FKhbh := CtData.FindBh('KHDA','D_KHBH','D_KHMC',s);
        if FKhbh<>'' then
          Result := True
        else
          ShowInfo('请选择记帐客户！');
      end;
    4:
      begin
        if CtData.CheckKfzt(cmbJz.Text)=KFZT_BF then
        begin
          FKfbh := cmbJz.Text;
          Result := True;
        end
        else
          ShowInfo('请选择挂帐散客！');
      end;
    5:
      begin
        tblKrxx.Open;
        if tblKrxx.Locate('D_KRXM',cmbJz.Text,[]) then
        begin
          FKrbh := tblKrxx.FieldByName('D_KRBH').AsString;
          Result := True;
        end
        else
          ShowInfo('请选择挂帐团队！');
        tblKrxx.Close;
      end;
    else
      Result := True;
  end;
end;

procedure TFcfjzForm.UpdateKrzd;
begin
  FZdbh := CtData.GetBh('D_ZDBH',PREV_ZDBH);
  try
    tblKrzd.Open;
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := 0;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString  := FBMbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' 非用餐';
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;

    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := 1;
    tblKrzd.FieldByName('D_XMBH').AsString := XMBH_CF;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString  := FBMbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' 非用餐';
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;

    if FJzfs = JZFS_GBK then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := 2;
    tblKrzd.FieldByName('D_XMBH').AsString   := XMBH_YJK;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := 0-FGbkJzxx.AKcje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK+' 非用餐';
    tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.Post;
    end;

  finally
    tblKrzd.Close;
  end;
end;

procedure TFcfjzForm.UpdateKrjz;
begin
  FJzbh := CtData.GetBh('D_JZBH',PREV_JZBH);
  try
    tblKrjz.Open;
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger    := 0;
    tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 非用餐';
    tblKrjz.FieldByName('D_JZFS').AsString   := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString  := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString   := FKhbh;
    tblKrjz.Post;

    if FJzfs<>JZFS_GBK then
    begin
      tblKrjz.Insert;
      tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
      tblKrjz.FieldByName('D_HH').AsInteger    := 1;
      tblKrjz.FieldByName('D_XMBH').AsString   := XMBH_CF;
      tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_FYK;
      tblKrjz.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
      tblKrjz.FieldByName('D_YHJE').AsCurrency := FYhje;
      tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
      tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
      tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
      tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 非用餐';
      tblKrjz.FieldByName('D_JZFS').AsString   := FJzfs;
      tblKrjz.FieldByName('D_XYKBH').AsString  := FXykbh;
      tblKrjz.FieldByName('D_KHBH').AsString   := FKhbh;
      tblKrjz.Post;
    end
    else //贵宾卡
    begin

      //添加预交款
      tblKrjz.Insert;
      tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
      tblKrjz.FieldByName('D_HH').AsInteger    := 2;
      tblKrjz.FieldByName('D_XMBH').AsString   := XMBH_YJK;
      tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_FYK;
      tblKrjz.FieldByName('D_XFJE').AsCurrency := 0-FGbkJzxx.AKcje;
      tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
      tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
      tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
      tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
      tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 非用餐 '+JZBZ_YJK;
      tblKrjz.FieldByName('D_JZFS').AsString   := FJzfs;
      tblKrjz.FieldByName('D_XYKBH').AsString  := FXykbh;
      tblKrjz.FieldByName('D_KHBH').AsString   := FKhbh;
      tblKrjz.Post;

      //扣除部分按贵宾卡结帐
      tblKrjz.Insert;
      tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
      tblKrjz.FieldByName('D_HH').AsInteger    := 3;
      tblKrjz.FieldByName('D_XMBH').AsString   := XMBH_CF;
      tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_FYK;
      tblKrjz.FieldByName('D_XFJE').AsCurrency := FGbkJzxx.AKcje;
      tblKrjz.FieldByName('D_YHJE').AsCurrency := FYhje;
      tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
      tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
      tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
      tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 非用餐 '+JZBZ_GBK;
      tblKrjz.FieldByName('D_JZFS').AsString   := FJzfs;
      tblKrjz.FieldByName('D_XYKBH').AsString  := FXykbh;
      tblKrjz.FieldByName('D_KHBH').AsString   := FKhbh;
      tblKrjz.Post;

      if (FSjje - FGbkJzxx.AKcje)<>0 then
      begin
      //剩余部分按重选的结帐方式结帐
        if FGbkJzxx.AJzfs <> JZFS_JZ then
        begin
          tblKrjz.Insert;
          tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
          tblKrjz.FieldByName('D_HH').AsInteger    := 4;
          tblKrjz.FieldByName('D_XMBH').AsString   := XMBH_CF;
          tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_FYK;
          tblKrjz.FieldByName('D_XFJE').AsCurrency := FSjje - FGbkJzxx.AKcje;
          tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
          tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
          tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
          tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
          tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
          tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 非用餐';
          tblKrjz.FieldByName('D_JZFS').AsString   := FGbkJzxx.AJzfs;
          tblKrjz.FieldByName('D_XYKBH').AsString  := FGbkJzxx.AXykbh;
          tblKrjz.FieldByName('D_KHBH').AsString   := FGbkJzxx.AKhbh;
          tblKrjz.Post;
        end
        else //重选方式为记账
        begin
          try
            tblYsk.Open;
            tblYsk.Insert;
            tblYsk.FieldByName('D_KHBH').AsString   := FGbkJzxx.AKhbh;
            tblYsk.FieldByName('D_ZDBH').AsString   := FZdbh;
            tblYsk.FieldByName('D_HH').AsInteger    := 1;
            tblYsk.FieldByName('D_XMBH').AsString   := XMBH_CF;
            tblYsk.FieldByName('D_XFJE').AsCurrency := FSjje - FGbkJzxx.AKcje;
            tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
            tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
            tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
            tblYsk.FieldByName('D_BZ').AsString     := ZDBZ_JZ+FGbkJzxx.AKhbh;
            tblYsk.Post;
          finally
            tblYsk.Close;
          end;

        end;
      end;
    end;
  finally
    tblKrjz.Close;
  end;
end;

procedure TFcfjzForm.UpdateCtdc(const ABz: string);
var
  ADcbh : string;
begin
  try
    ADcbh := CtData.GetBh('D_DCBH',PREV_DCBH);
    tblCtdc.Open;
    tblCtjz.DisableControls;
    tblCtjz.First;
    tblCtdc.Insert;
    tblCtdc.FieldByName('D_DCBH').AsString   := ADcbh;
    tblCtdc.FieldByName('D_CTBH').AsString   := '其他';
    tblCtdc.FieldByName('D_DCLB').AsString   := DCLB_QT;
    tblCtdc.FieldByName('D_XMBH').AsString   := '0';
    tblCtdc.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblCtdc.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblCtdc.FieldByName('D_JZFS').AsString   := FJzfs;
    tblCtdc.FieldByName('D_XYKBH').AsString  := FXykbh;
    tblCtdc.FieldByName('D_KHBH').AsString   := FKhbh;
    tblCtdc.FieldByName('D_XFRQ').AsDateTime := Date;
    tblCtdc.FieldByName('D_XFSJ').AsDateTime := Time;
    tblCtdc.FieldByName('D_SJDM').AsString   := GetSjdm(Time);
    tblCtdc.FieldByName('D_JSBZ').AsString   := JS_YES;
    tblCtdc.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblCtdc.FieldByName('D_BZ').AsString     := ABz;
    tblCtdc.Post;

    while not tblCtjz.Eof do
    begin
      if tblCtjzD_XFJE.Value>0 then
      begin
        tblCtdc.Insert;
        tblCtdc.FieldByName('D_DCBH').AsString   := ADcbh;
        tblCtdc.FieldByName('D_CTBH').AsString   := '0';
        tblCtdc.FieldByName('D_DCLB').AsString   := DCLB_QT;
        tblCtdc.FieldByName('D_XMBH').AsString   := tblCtjzD_XMBH.Value;
        tblCtdc.FieldByName('D_XFJE').AsCurrency := tblCtjzD_XFJE.Value;
        tblCtdc.FieldByName('D_YHJE').AsCurrency := tblCtjzD_YHJE.Value;
        tblCtdc.FieldByName('D_JZFS').AsString   := FJzfs;
        tblCtdc.FieldByName('D_XYKBH').AsString  := FXykbh;
        tblCtdc.FieldByName('D_KHBH').AsString   := FKhbh;
        tblCtdc.FieldByName('D_JSBZ').AsString   := JS_YES;
        tblCtdc.FieldByName('D_BZ').AsString     := ABz;
        tblCtdc.FieldByName('D_XFRQ').AsDateTime := Date;
        tblCtdc.FieldByName('D_XFSJ').AsDateTime := Time;
        tblCtdc.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        tblCtdc.FieldByName('D_SJDM').AsString   := GetSjdm(Time);
        tblCtdc.Post;
      end;
      tblCtjz.Next;
    end;
  finally
    tblCtjz.EnableControls;
    tblCtdc.Close;
  end;
end;

procedure TFcfjzForm.UpdateGz(const AZdbh,AZdlb: string);
var
  AHh: Integer;
  AKrbh,AYjbh: string;
begin
  try
    tblKrzd.Filter := 'D_ZDBH='''+AZdbh+'''';
    tblKrzd.Filtered := True;
    tblKrzd.Open;
    if tblKrzd.Locate('D_HH',0,[]) then
    begin
      tblKrzd.Edit;
      tblKrzd.FieldByName('D_XFJE').AsCurrency :=
        tblKrzd.FieldByName('D_XFJE').AsCurrency + FSjje + FYhje;
      tblKrzd.FieldByName('D_YHJE').AsCurrency :=
        tblKrzd.FieldByName('D_YHJE').AsCurrency + FYhje;
      tblKrzd.Post;
      AKrbh := tblKrzd.FieldbyName('D_KRBH').AsString;
      AYjbh := tblKrzd.FieldbyName('D_YJBH').AsString;
    end;
    tblKrzd.Last;
    AHh := tblKrzd.FieldbyName('D_HH').AsInteger + 1;
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := AZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := XMBH_CF;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString  := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' 非用餐';
    tblKrzd.Post;
  finally
    tblKrzd.Close;
    tblKrzd.Filter := '';
    tblKrzd.Filtered := False;
  end;
end;

procedure TFcfjzForm.UpdateYsk;
begin
  try
    tblYsk.Open;
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := 1;
    tblYsk.FieldByName('D_XMBH').AsString := XMBH_CF;
    tblYsk.FieldByName('D_XFJE').AsCurrency := FSjje;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+FKhbh;
    tblYsk.Post;
  finally
    tblYsk.Close;
  end;
end;

procedure TFcfJzForm.btnOkClick(Sender: TObject);
begin
  if not IsValid then Exit;
  if FSjje=0 then
  begin
    ShowWarning('请录入金额！');
    Exit;
  end;

  if not Confirm('你是否确认结帐？') then Exit;
  
  CtData.DatabaseUser.StartTransaction;
  try
  if (FJzfs=JZFS_RMB)or(FJzfs=JZFS_ZP)or(FJzfs=JZFS_XYK)or(FJzfs=JZFS_GBK) then
  begin
    if FJzfs=JZFS_GBK then
    begin
      FGbkJzxx := CardXf(FSjje);
      if FGbkJzxx.AKcje = 0 then
      begin
        CtData.DatabaseUser.Commit;
        Exit;
      end;
    end;
    UpdateKrzd;
    UpdateKrjz;
    UpdateCtdc('零客');
  end;

  if (FJzfs=JZFS_GSK) then
  begin
    FZdbh := CtData.FindBh('KFZT','D_ZDBH','D_KFBH',FKfbh);
    UpdateGz(FZdbh,ZDLB_YK);
    UpdateCtdc('挂'+FKfbh);
  end;

  if (FJzfs=JZFS_GTD) then
  begin
    FZdbh := CtData.FindBh('KRZD','D_ZDBH','D_KRBH',FKrbh);
    //FZdbh := CtData.FindBh('KFZT','D_ZDBH','D_KRBH',FKrbh);
    UpdateGz(FZdbh,ZDLB_TD);
    UpdateCtdc('挂'+cmbJz.Items[cmbJz.ItemIndex]);
  end;

  if FJzfs=JZFS_JZ then
  begin
    UpdateKrzd;
    UpdateYsk;
    UpdateCtdc('记'+CtData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh));
  end;

  if FJzfs=JZFS_ZD then
  begin
    UpdateCtdc('宾馆招待');
  end;

  CtData.DatabaseUser.Commit;
  except
    CtData.DatabaseUser.Rollback;
    raise;
  end;

  {if Confirm('是否打印帐单？') then
    btnPrintClick(nil);}
  Close;
end;

procedure TFcfJzForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '帐单（'+FJzfs+'）';
  APrintStru.ASub := '消费金额：'+lblXfje.Caption+' '
                    +'优惠金额：'+lblYhje.Caption+' '
                    +'实结金额：'+lblSjje.Caption;
  APrintStru.ADataSet := tblCtjz;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TFcfJzForm.tblCtjzBeforeInsert(DataSet: TDataSet);
begin
  if not IsAppend then
    Abort;
end;

procedure TFcfJzForm.tblCtjzBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
