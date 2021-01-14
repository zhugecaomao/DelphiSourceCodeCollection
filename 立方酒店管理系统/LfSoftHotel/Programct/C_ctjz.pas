unit C_ctjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, C_CtDefine,
  DosMove;

type
  TCtjzForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    DBGrid1: TDBGrid;
    btnOk: TBitBtn;
    btnCanc: TBitBtn;
    tblCtjz: TTable;
    dsCtjz: TDataSource;
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    Label1: TLabel;
    edtZkl: TEdit;
    Label2: TLabel;
    edtYhje: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    lblXfje: TLabel;
    lblSjje: TLabel;
    tblCtxm: TTable;
    DosMove1: TDosMove;
    tblKrxx: TTable;
    tblKrzd: TTable;
    tblKrjz: TTable;
    tblCtdc: TTable;
    tblYsk: TTable;
    btnPrint: TBitBtn;
    Bevel1: TBevel;
    tblCtjzD_XMBH: TStringField;
    tblCtjzD_XFJE: TFloatField;
    tblCtjzD_YHJE: TFloatField;
    tblCtjzD_BZ: TStringField;
    tblCtjzD_XMMC: TStringField;
    procedure tblCtjzAfterPost(DataSet: TDataSet);
    procedure tblCtjzBeforeEdit(DataSet: TDataSet);
    procedure edtZklExit(Sender: TObject);
    procedure edtYhjeExit(Sender: TObject);
    procedure radJzfsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure tblCtjzBeforeInsert(DataSet: TDataSet);
    procedure cmbJzDblClick(Sender: TObject);
    procedure cmbJzKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCtzts: TCtzts;
    FCtzt: TCtzt;
    FXfje: Currency;
    FYhje: Currency;
    FSjje: Currency;
    FSpje: Currency;
    FBjje: Currency;
    FXyje: Currency;
    FZkl : Double;

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
    procedure SumXfje;
    procedure ShowJzxx;
    procedure SumQtje;

    procedure GetTdmc;
    function IsValid: Boolean;

    procedure UpdateKrzd;
    procedure UpdateKrzdWjz;
    procedure UpdateKrjz;
    procedure UpdateCtdc(const ABz: string);
    procedure UpdateCtzt;
    procedure UpdateGz(const AZdbh,AZdlb: string);
    procedure UpdateYsk;
  public
    { Public declarations }

  end;

var
  CtjzForm: TCtjzForm;

procedure Ctjz(var ACtzts: TCtzts);

implementation

uses C_CtData, C_Sysprint, C_CardXf, C_KhdaSel;

{$R *.dfm}

//餐厅结帐
procedure Ctjz(var ACtzts: TCtzts);
begin
  CtjzForm := TCtjzForm.Create(Application);
  try
    with CtjzForm do
    begin
    FBmbh  := CtData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
    FCtzts := ACtzts;
    FCtzt  := FCtzts[0];
    FJzfs  := JZFS_RMB;
    radJzfs.ItemIndex := 0;

    GetJzje;
    ShowJzxx;
    tblCtjz.Close;
    tblCtjz.Open;
    ShowModal;
    ACtzts := FCtzts;
    end;
  finally
    CtjzForm.tblCtjz.Close;
    CtjzForm.Free;
  end;
end;

procedure TCtjzForm.SumQtje;
var
  PrevRecord: TBookMark;
  FTotals : Currency;
begin
  PrevRecord := tblCtjz.GetBookmark;
  try
    tblCtjz.DisableControls;
    FTotals := 0;
    tblCtjz.First;
    while not tblCtjz.Eof do
    begin
      FTotals := FTotals + tblCtjzD_XFJE.Value;
      tblCtjz.Next;
    end;
    FXfje := FTotals;
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

//消费金额
procedure TCtjzForm.SumXfje;
var
  s: string;
begin
  //消费总额
  s := 'select sum((D_XFSL-D_THSL)*D_DJ) from DCMX'
      +' where (D_DEL="F")and(D_DCBH="'+FCtzt.ADcbh+'")';
  FXfje := CtData.SumJe(s);

  //食品金额
  s := 'select sum((D_XFSL-D_THSL)*D_DJ) from DCMX'
      +' where (D_DEL="F")and(D_DCBH="'+FCtzt.ADcbh
      +'")and(D_XMBH="'+XMBH_SP+'")';
  FSpje := CtData.SumJe(s);

  //酒水
  s := 'select sum((D_XFSL-D_THSL)*D_DJ) from DCMX where (D_DEL="F")and(D_DCBH="'
      +FCtzt.ADcbh+'")and(D_XMBH="'
      +XMBH_JS+'")';
  FBjje := CtData.SumJe(s);

  //香烟
  s := 'select sum((D_XFSL-D_THSL)*D_DJ) from DCMX where (D_DEL="F")and(D_DCBH="'
      +FCtzt.ADcbh+'")and(D_XMBH="'
      +XMBH_XY+'")';
  FXyje := CtData.SumJe(s);

  //折扣率
  FZkl  := 100;
  //优惠金额 //只优惠食品
  //FYhje := FXfje*(1-FZkl*0.01);
  FYhje := FSpje*(1-FZkl*0.01);
  //实结金额
  FSjje := Trunc(FXfje - FYhje + 0.99);
end;

//获取结帐金额
procedure TCtjzForm.GetJzje;
begin
  edtZkl.Text  := '';
  edtYhje.Text := '';
  IsAppend     := True;

  SumXfje;

  tblCtjz.Close;
  tblCtjz.EmptyTable;
  tblCtjz.Open;
  try
    tblCtxm.Open;
    tblCtxm.First;
    while not tblCtxm.Eof do
    begin
      tblCtjz.Insert;
      tblCtjzD_XMBH.Value := tblCtxm.FieldByName('D_XMBH').AsString;

      if tblCtxm.FieldByName('D_XMBH').AsString = XMBH_SP then
      begin
        tblCtjzD_XFJE.Value := FSpje;
        tblCtjzD_BZ.Value := 'T';
      end;

      if tblCtxm.FieldByName('D_XMBH').AsString = XMBH_JS then
      begin
        tblCtjzD_XFJE.Value := FBjje;
        tblCtjzD_BZ.Value := 'T';
      end;

      if tblCtxm.FieldByName('D_XMBH').AsString = XMBH_XY then
      begin
        tblCtjzD_XFJE.Value := FXyje;
        tblCtjzD_BZ.Value := 'T';
      end;

      tblCtjz.Post;
      tblCtxm.Next;
    end;
  finally
    IsAppend := False;
    tblCtxm.Close;
  end;
end;

//显示结帐信息
procedure TCtjzForm.ShowJzxx;
begin
  FSjje := Trunc(FXfje - FYhje + 0.99);
  lblXfje.Caption := CurrToStr(FXfje)+'元';
  lblSjje.Caption := CurrToStr(FSjje)+'元';
end;

procedure TCtjzForm.tblCtjzAfterPost(DataSet: TDataSet);
begin
  if not IsAppend then
    SumQtje;
end;

procedure TCtjzForm.tblCtjzBeforeEdit(DataSet: TDataSet);
begin
  if tblCtjzD_BZ.Value='T' then
    Abort;
end;

procedure TCtjzForm.edtZklExit(Sender: TObject);
begin
  if edtZkl.Text<>'' then
  begin
    try
      FZkl := StrToFloat(edtZkl.Text);
    except
      Exit;
      raise;
    end;

    if (FZkl>=0)and(FZkl<=100) then
    begin
      //只优惠食品
      //FYhje := Trunc(FXfje*(1-FZkl*0.01));
      FYhje := Trunc(FSpje*(1-FZkl*0.01));
      edtYhje.Text := CurrToStr(FYhje);
    end
    else
      FZkl := 100;
      
    ShowJzxx;
  end;
end;

procedure TCtjzForm.edtYhjeExit(Sender: TObject);
begin
  if edtYhje.Text <> '' then
  begin
    try
      FYhje := StrToCurr(edtYhje.Text);
    except
      Exit;
      raise;
    end;

    ShowJzxx;
  end
  else
  begin
    FYhje := 0;
    
    ShowJzxx;
  end;
end;

procedure TCtjzForm.GetTdmc;
begin
  tblKrxx.Open;
  tblKrxx.Filter   := 'D_KRLX=''T''';
  tblKrxx.Filtered := True;

  tblKrxx.First;
  while not tblKrxx.Eof do
  begin
    cmbJz.Items.Add(tblKrxx.FieldByName('D_KRXM').AsString);
    tblKrxx.Next;
  end;

  tblKrxx.Filter   := '';
  tblKrxx.Filtered := False;
  tblKrxx.Close;
end;

procedure TCtjzForm.radJzfsClick(Sender: TObject);
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
    8: FJzfs := JZFS_WJZ;
  end;
end;

//是否有效
function TCtjzForm.IsValid: Boolean;
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

//更新客人结帐
procedure TCtjzForm.UpdateKrjz;
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
    tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' '+'餐费';
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
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 餐费 ';
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
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+JZBZ_YJK;
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
      tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 餐费'+JZFS_GBK;
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
          tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_FYK+' 餐费';
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

//更新客人帐单
procedure TCtjzForm.UpdateKrzd;
begin
  FZdbh := CtData.GetBh('D_ZDBH',PREV_ZDBH);
  try
    tblKrzd.Open;
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := 0;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK;
    tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.Post;

    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := 1;
    tblKrzd.FieldByName('D_XMBH').AsString   := XMBH_CF;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK;
    tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
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
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK;
    tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.Post;
    end;
  finally
    tblKrzd.Close;
  end;
end;

procedure TCtjzForm.UpdateKrzdWjz;
begin
  FZdbh := CtData.GetBh('D_ZDBH',PREV_ZDBH);
  try
    tblKrzd.Open;
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := 0;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    //tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    //tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK+ZDBZ_WJZ;
    //tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.Post;

    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := 1;
    tblKrzd.FieldByName('D_XMBH').AsString   := XMBH_CF;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    //tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    //tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_FYK+ZDBZ_WJZ;
    //tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.Post;
  finally
    tblKrzd.Close;
  end;
end;

//更新餐厅点菜
procedure TCtjzForm.UpdateCtdc(const ABz: string);
var
  ADate,ATime : TDateTime;
  ASjdm       : string;
  i           : Integer;
begin
  ADate := 0;
  ATime := 0;
  try
    tblCtdc.Open;
    for i:=Low(FCtzts) to High(FCtzts) do
    begin
      FCtzt := FCtzts[i];
      if tblCtdc.FindKey([FCtzt.ADcbh,FCtzt.ACtbh,'0']) then
      begin
        tblCtdc.Edit;
        if ABz = '未结帐' then
        begin
        tblCtdc.FieldByName('D_XFJE').AsCurrency := 0;
        tblCtdc.FieldByName('D_YHJE').AsCurrency := 0;
        tblCtdc.FieldByName('D_JZFS').AsString   := FJzfs;
        tblCtdc.FieldByName('D_XYKBH').AsString  := FXykbh;
        tblCtdc.FieldByName('D_KHBH').AsString   := FKhbh;
        tblCtdc.FieldByName('D_JSBZ').AsString   := JS_YES;
        tblCtdc.FieldByName('D_BZ').AsString     := ABz;
        tblCtdc.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        end
        else
        begin
        tblCtdc.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
        tblCtdc.FieldByName('D_YHJE').AsCurrency := FYhje;
        tblCtdc.FieldByName('D_JZFS').AsString   := FJzfs;
        tblCtdc.FieldByName('D_XYKBH').AsString  := FXykbh;
        tblCtdc.FieldByName('D_KHBH').AsString   := FKhbh;
        tblCtdc.FieldByName('D_JSBZ').AsString   := JS_YES;
        tblCtdc.FieldByName('D_BZ').AsString     := ABz;
        tblCtdc.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        end;
        ADate := tblCtdc.FieldByName('D_XFRQ').AsDateTime;
        ATime := tblCtdc.FieldByName('D_XFSJ').AsDateTime;
        ASjdm := tblCtdc.FieldByName('D_SJDM').AsString;
        tblCtdc.Post;
      end;
    end;

    if ABz <> '未结帐' then
    begin
    tblCtjz.DisableControls;
    tblCtjz.First;
    while not tblCtjz.Eof do
    begin
      if tblCtjzD_XFJE.Value>0 then
      begin
        tblCtdc.Insert;
        tblCtdc.FieldByName('D_DCBH').AsString   := FCtzt.ADcbh;
        tblCtdc.FieldByName('D_CTBH').AsString   := '0';
        tblCtdc.FieldByName('D_DCLB').AsString   := DCLB_YC;
        tblCtdc.FieldByName('D_XMBH').AsString   := tblCtjzD_XMBH.Value;
        tblCtdc.FieldByName('D_XFJE').AsCurrency := tblCtjzD_XFJE.Value;
        //edit by ls. 将优惠金额放到食品中
        if tblCtdc.FieldByName('D_XMBH').AsString = XMBH_SP then
          tblCtdc.FieldByName('D_YHJE').AsCurrency := FYhje;
        tblCtdc.FieldByName('D_JZFS').AsString   := FJzfs;
        tblCtdc.FieldByName('D_XYKBH').AsString  := FXykbh;
        tblCtdc.FieldByName('D_KHBH').AsString   := FKhbh;
        tblCtdc.FieldByName('D_JSBZ').AsString   := JS_YES;
        tblCtdc.FieldByName('D_XFRQ').AsDateTime := ADate;
        tblCtdc.FieldByName('D_XFSJ').AsDateTime := ATime;
        tblCtdc.FieldByName('D_SJDM').AsString   := ASjdm;
        tblCtdc.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
        tblCtdc.FieldByName('D_BZ').AsString     := ABz;
        tblCtdc.Post;
      end;
      tblCtjz.Next;
    end;
    end;
  finally
    tblCtjz.EnableControls;
    tblCtdc.Close;
  end;
end;

//更新餐厅状态
procedure TCtjzForm.UpdateCtzt;
var
  i: Integer;
begin
  for i:= Low(FCtzts) to High(FCtzts) do
  begin
    FCtzts[i].ACtzt := CTZT_JZ;
    CtData.SetCtzt(FCtzts[i]);
  end;
end;

//挂帐
procedure TCtjzForm.UpdateGz(const AZdbh,AZdlb: string);
var
  AHh        : Integer;
  AKrbh,AYjbh: string;
begin
  try
    tblKrzd.Filter   := 'D_ZDBH='''+AZdbh+'''';
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
    tblKrzd.FieldByName('D_ZDBH').AsString   := AZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString   := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString   := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString   := XMBH_CF;
    tblKrzd.FieldByName('D_ZDLB').AsString   := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje+FYhje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := FYhje;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString   := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_GZ;
    tblKrzd.Post;
  finally
    tblKrzd.Filter   := '';
    tblKrzd.Filtered := False;
    tblKrzd.Close;
  end;
end;

//应收款
procedure TCtjzForm.UpdateYsk;
begin
  try
    tblYsk.Open;
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString   := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString   := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger    := 1;
    tblYsk.FieldByName('D_XMBH').AsString   := XMBH_CF;
    tblYsk.FieldByName('D_XFJE').AsCurrency := FSjje;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString     := ZDBZ_JZ+FKhbh;
    tblYsk.Post;
  finally
    tblYsk.Close;
  end;
end;

//确定
procedure TCtjzForm.btnOkClick(Sender: TObject);
begin

  if not IsValid then Exit;

  if FSjje<0 then
  begin
    ShowWarning('实结金额不能小于零！');
    Exit;
  end;

  if not Confirm('你是否确认结帐？') then Exit;
  CtData.DatabaseUser.StartTransaction;
  try

    if (FJzfs=JZFS_RMB)
     or(FJzfs=JZFS_ZP )
     or(FJzfs=JZFS_XYK)
     or(FJzfs=JZFS_GBK) then
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

    if FJzfs=JZFS_WJZ then
    begin
      UpdateKrzdWjz;
      UpdateCtdc('未结帐');
    end;

    if (FJzfs=JZFS_GSK) then
    begin
      FZdbh := CtData.FindBh('KFZT','D_ZDBH','D_KFBH',FKfbh);
      UpdateGz(FZdbh,ZDLB_YK);
      UpdateCtdc('挂'+FKfbh);
    end;

    if (FJzfs=JZFS_GTD) then
    begin
      //edit by ls. 2002.12.01//团队全部退房后要检查帐单中的编号
      FZdbh := CtData.FindBh('KRZD','D_ZDBH','D_KRBH',FKrbh);
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

    UpdateCtzt;

    CtData.DatabaseUser.Commit;
  except
    CtData.DatabaseUser.Rollback;
    raise;
  end;

  {if Confirm('是否打印帐单？') then
    btnPrintClick(nil);}
  Close;
end;

procedure TCtjzForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '帐单（'+FJzfs+'）';
  APrintStru.ASub := '消费金额：'+lblXfje.Caption+' '
                    +'优惠金额：'+edtYhje.Text+'元 '
                    +'实结金额：'+lblSjje.Caption;
  APrintStru.ADataSet := tblCtjz;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TCtjzForm.tblCtjzBeforeInsert(DataSet: TDataSet);
begin
  if not IsAppend then
    Abort;
end;

procedure TCtjzForm.cmbJzDblClick(Sender: TObject);
begin
  if FJzfs = JZFS_JZ then
    cmbJz.Text := KhdaSel1;
end;

procedure TCtjzForm.cmbJzKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (FJzfs=JZFS_JZ)and(Key=VK_F2) then
    cmbJz.Text := KhdaSel1;
end;

end.
