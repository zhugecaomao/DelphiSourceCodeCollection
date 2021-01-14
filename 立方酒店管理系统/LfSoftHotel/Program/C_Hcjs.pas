unit C_Hcjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define, DB,
  DBTables, ComCtrls;

type
  THcjsForm = class(TStdJdForm)
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    Label3: TLabel;
    lblXfje: TLabel;
    Label4: TLabel;
    lblSjje: TLabel;
    tblKrxx: TTable;
    ListView1: TListView;
    tblYdhc: TTable;
    tblKrjz: TTable;
    tblKrzd: TTable;
    tblYsk: TTable;
    Bevel2: TBevel;
    tblYdhcD_YDBH: TStringField;
    tblYdhcD_KRBH: TStringField;
    tblYdhcD_KRXM: TStringField;
    tblYdhcD_YDRQ: TDateTimeField;
    tblYdhcD_SYRQ: TDateTimeField;
    tblYdhcD_SYSJ: TDateTimeField;
    tblYdhcD_SJDM: TStringField;
    tblYdhcD_HCBH: TStringField;
    tblYdhcD_HCMC: TStringField;
    tblYdhcD_HCZJ: TFloatField;
    tblYdhcD_HCRS: TIntegerField;
    tblYdhcD_HCRS1: TIntegerField;
    tblYdhcD_HFSL: TFloatField;
    tblYdhcD_HFJE: TFloatField;
    tblYdhcD_HFBZ: TStringField;
    tblYdhcD_XHSL: TFloatField;
    tblYdhcD_XHJE: TFloatField;
    tblYdhcD_XHBZ: TStringField;
    tblYdhcD_SGSL: TFloatField;
    tblYdhcD_SGJE: TFloatField;
    tblYdhcD_SGBZ: TStringField;
    tblYdhcD_QTJE: TFloatField;
    tblYdhcD_QTBZ: TStringField;
    tblYdhcD_HTSL: TFloatField;
    tblYdhcD_HTBZ: TStringField;
    tblYdhcD_RZBZ: TStringField;
    tblYdhcD_JSBZ: TStringField;
    tblYdhcD_CZYXM: TStringField;
    tblYdhcD_BZ: TBlobField;
    edtKrxm: TEdit;
    Label1: TLabel;
    procedure radJzfsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FYdbh: string;
    FJzfs: string;
    FXykbh: string;
    FKhbh: string;
    FKfbh: string;
    FKrbh: string;
    FSjje: Currency;
    FBmbh: string;
    FXmbhhf: string;
    FXmbhxh: string;
    FXmbhsg: string;
    FXmbhqt: string;
    FJzbh: string;
    FZdbh: string;
    procedure GetTdmc;
    function IsValid: Boolean;
    procedure GetJzxx;
    procedure UpdateKrjz;
    procedure UpdateKrzd;
    procedure UpdateYdhc;
    procedure UpdateGz(const AZdbh,AZdlb: string);
    procedure UpdateYsk;
  public
    { Public declarations }
  end;

var
  HcjsForm: THcjsForm;

procedure Hcjs(const AYdbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

procedure Hcjs(const AYdbh: string);
begin
  HcjsForm := THcjsForm.Create(Application);
  try
    with HcjsForm do
    begin
      FYdbh := AYdbh;
      FJzfs := JZFS_RMB;
      radJzfs.ItemIndex := 0;
      tblYdhc.Open;
      tblYdhc.Locate('D_YDBH',FYdbh,[]);
      edtKrxm.Text := tblYdhcD_KRXM.Value;
      GetJzxx;
      ShowModal;
    end;
  finally
    HcjsForm.tblYdhc.Close;
    HcjsForm.Free;
  end;
end;

procedure THcjsForm.GetJzxx;
var
  ListItem: TListItem;
begin
  ListItem := ListView1.Items.Add;
  ListItem.Caption := '会场租金';
  ListItem.SubItems.Add(tblYdhcD_HCZJ.AsString+'元');
  ListItem := ListView1.Items.Add;
  ListItem.Caption := '横幅';
  ListItem.SubItems.Add(tblYdhcD_HFJE.AsString+'元');
  ListItem := ListView1.Items.Add;
  ListItem.Caption := '鲜花';
  ListItem.SubItems.Add(tblYdhcD_XHJE.AsString+'元');
  ListItem := ListView1.Items.Add;
  ListItem.Caption := '水果';
  ListItem.SubItems.Add(tblYdhcD_SGJE.AsString+'元');
  ListItem := ListView1.Items.Add;
  ListItem.Caption := '其他';
  ListItem.SubItems.Add(tblYdhcD_QTJE.AsString+'元');
  FSjje := tblYdhcD_HCZJ.AsCurrency
           +tblYdhcD_HFJE.AsCurrency
           +tblYdhcD_XHJE.AsCurrency
           +tblYdhcD_SGJE.AsCurrency
           +tblYdhcD_QTJE.AsCurrency;
  lblXfje.Caption := CurrToStr(FSjje)+'元';
  lblSjje.Caption := lblXfje.Caption;
end;

procedure THcjsForm.GetTdmc;
begin
  tblKrxx.Filter := 'D_KRLX=''T''';
  tblKrxx.Filtered := True;
  tblKrxx.Open;
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

procedure THcjsForm.radJzfsClick(Sender: TObject);
begin
  inherited;
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;
  case radJzfs.ItemIndex of
    0: FJzfs := JZFS_RMB;
    1:
      begin
        HotelData.ListMc(cmbJz,'XYK','D_XYKMC');
        FJzfs := JZFS_XYK;
      end;
    2: FJzfs := JZFS_ZP;
    3:
      begin
        cmbJz.Style := csDropDown;
        HotelData.ListDm(cmbJz,'KHDA','D_KHMC');
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
  end;
end;

function THcjsForm.IsValid: Boolean;
var
  s: string;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FXykbh := HotelData.FindBh('XYK','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FXykbh<>'' then
          Result := True
        else
          ShowInfo('请选择信用卡！');
      end;
    3:
      begin
        s := GetMc(cmbJz.Text);
        FKhbh := HotelData.FindBh('KHDA','D_KHBH','D_KHMC',s);
        if FKhbh<>'' then
          Result := True
        else
          ShowInfo('请选择记帐客户！');
      end;
    4:
      begin
        if HotelData.CheckKfzt(cmbJz.Text)=KFZT_BF then
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

procedure THcjsForm.UpdateYdhc;
begin
  HotelData.ExecSql('update YDHC set D_JSBZ="'+JS_YES+'" where D_YDBH="'+FYdbh+'"');
  //tblYdhc.Edit;
  //tblYdhcD_JSBZ.Value := JS_YES;
  //tblYdhc.Post;
  //tblYdhc.Delete;
end;

procedure THcjsForm.UpdateKrzd;
var
  AHh: Integer;
begin
  FZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
  try
    tblKrzd.Open;
    AHh := 0;
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := FSjje;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    if tblYdhcD_HCZJ.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := XMBH_HCF;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HCZJ.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_HFJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhhf;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HFJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_XHJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhxh;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_XHJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_SGJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhsg;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_SGJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_QTJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhqt;
    tblKrzd.FieldByName('D_ZDLB').AsString := ZDLB_FYK;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_QTJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_FYK+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    end;

  finally
    tblKrzd.Close;
  end;
end;

procedure THcjsForm.UpdateKrjz;
var
  AHh: Integer;
begin
  FJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);
  try
    tblKrjz.Open;
    AHh := 0;
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := FSjje;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    Inc(AHh);
    if tblYdhcD_HCZJ.Value>0 then
    begin
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_XMBH').AsString := XMBH_HCF;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HCZJ.Value;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    Inc(AHh);
    end;
    if tblYdhcD_HFJE.Value>0 then
    begin
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_XMBH').AsString := FXmbhhf;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HFJE.Value;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    Inc(AHh);
    end;
    if tblYdhcD_XHJE.Value>0 then
    begin
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_XMBH').AsString := FXmbhxh;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := tblYdhcD_XHJE.Value;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    Inc(AHh);
    end;
    if tblYdhcD_SGJE.Value>0 then
    begin
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_XMBH').AsString := FXmbhsg;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := tblYdhcD_SGJE.Value;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    Inc(AHh);
    end;
    if tblYdhcD_QTJE.Value>0 then
    begin
    tblKrjz.Insert;
    tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
    tblKrjz.FieldByName('D_XMBH').AsString := FXmbhqt;
    tblKrjz.FieldByName('D_JZLX').AsString := JZLX_FYK;
    tblKrjz.FieldByName('D_XFJE').AsCurrency := tblYdhcD_QTJE.Value;
    tblKrjz.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrjz.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrjz.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrjz.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrjz.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrjz.FieldByName('D_BZ').AsString := JZBZ_FYK+' '+edtKrxm.Text;
    tblKrjz.FieldByName('D_JZFS').AsString := FJzfs;
    tblKrjz.FieldByName('D_XYKBH').AsString := FXykbh;
    tblKrjz.FieldByName('D_KHBH').AsString := FKhbh;
    tblKrjz.Post;
    end;

  finally
    tblKrjz.Close;
  end;
end;

procedure THcjsForm.UpdateGz(const AZdbh,AZdlb: string);
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
        tblKrzd.FieldByName('D_XFJE').AsCurrency + FSjje;
      tblKrzd.Post;
      AKrbh := tblKrzd.FieldbyName('D_KRBH').AsString;
      AYjbh := tblKrzd.FieldbyName('D_YJBH').AsString;
    end;
    tblKrzd.Last;
    AHh := tblKrzd.FieldbyName('D_HH').AsInteger + 1;
    if tblYdhcD_HCZJ.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := XMBH_HCF;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HCZJ.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_HFJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhhf;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HFJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_XHJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhxh;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_XHJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_SGJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhsg;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_SGJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    Inc(AHh);
    end;
    if tblYdhcD_QTJE.Value > 0 then
    begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString := FZdbh;
    tblKrzd.FieldByName('D_KRBH').AsString := AKrbh;
    tblKrzd.FieldByName('D_YJBH').AsString := AYjbh;
    tblKrzd.FieldByName('D_HH').AsInteger  := AHh;
    tblKrzd.FieldByName('D_XMBH').AsString := FXmbhqt;
    tblKrzd.FieldByName('D_ZDLB').AsString := AZdlb;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := tblYdhcD_QTJE.Value;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_YHJE').AsCurrency := 0;
    tblKrzd.FieldByName('D_JZRQ').AsDateTime := Date;
    tblKrzd.FieldByName('D_JZSJ').AsDateTime := Time;
    tblKrzd.FieldByName('D_JZBZ').AsString := JZ_NO;
    tblKrzd.FieldByName('D_JSBZ').AsString := JS_NO;
    tblKrzd.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZYXM').AsString := CZY.CzyXm;
    tblKrzd.FieldByName('D_BMBH').AsString := FBmbh;
    tblKrzd.FieldByName('D_BZ').AsString := ZDBZ_GZ+' '+edtKrxm.Text;
    tblKrzd.FieldByName('D_JZBH').AsString := FJzbh;
    tblKrzd.Post;
    end;
  finally
    tblKrzd.Close;
    tblKrzd.Filter := '';
    tblKrzd.Filtered := False;
  end;
end;

procedure THcjsForm.UpdateYsk;
var
  AHh: Integer;
begin
  try
    tblYsk.Open;
    AHh := 1;
    if tblYdhcD_HCZJ.Value > 0 then
    begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := AHh;
    tblYsk.FieldByName('D_XMBH').AsString := XMBH_HCF;
    tblYsk.FieldByName('D_XFJE').AsCurrency := tblYDhcD_HCZJ.Value;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+' '+edtKrxm.Text;
    tblYsk.Post;
    Inc(Ahh);
    end;
    if tblYdhcD_HFJE.Value > 0 then
    begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := AHh;
    tblYsk.FieldByName('D_XMBH').AsString := FXmbhhf;
    tblYsk.FieldByName('D_XFJE').AsCurrency := tblYdhcD_HFJE.Value;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+' '+edtKrxm.Text;
    tblYsk.Post;
    Inc(Ahh);
    end;
    if tblYdhcD_XHJE.Value > 0 then
    begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := AHh;
    tblYsk.FieldByName('D_XMBH').AsString := FXmbhxh;
    tblYsk.FieldByName('D_XFJE').AsCurrency := tblYdhcD_XHJE.Value;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+' '+edtKrxm.Text;
    tblYsk.Post;
    Inc(Ahh);
    end;
    if tblYdhcD_SGJE.Value > 0 then
    begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := AHh;
    tblYsk.FieldByName('D_XMBH').AsString := FXmbhsg;
    tblYsk.FieldByName('D_XFJE').AsCurrency := tblYDhcD_SGJE.Value;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+' '+edtKrxm.Text;
    tblYsk.Post;
    Inc(Ahh);
    end;
    if tblYdhcD_QTJE.Value > 0 then
    begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString := FZdbh;
    tblYsk.FieldByName('D_HH').AsInteger  := AHh;
    tblYsk.FieldByName('D_XMBH').AsString := FXmbhqt;
    tblYsk.FieldByName('D_XFJE').AsCurrency := tblYdhcD_QTJE.Value;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := Date;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := Time;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.FieldByName('D_BZ').AsString := ZDBZ_JZ+' '+edtKrxm.Text;
    tblYsk.Post;
    end;

  finally
    tblYsk.Close;
  end;
end;

procedure THcjsForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not Confirm('你确认该客人的消费结帐吗？') then
    Exit;
  
  if not IsValid then Exit;
  FXmbhhf := HotelData.FindBh('XMDM','D_XMBH','D_XMMC','横幅');
  FXmbhxh := HotelData.FindBh('XMDM','D_XMBH','D_XMMC','鲜花');
  FXmbhsg := HotelData.FindBh('XMDM','D_XMBH','D_XMMC','水果');
  FXmbhqt := HotelData.FindBh('XMDM','D_XMBH','D_XMMC','其他');
  if (FXmbhhf='')or(FXmbhxh='')or(FXmbhsg='')or(FXmbhqt='') then
  begin
    ShowWarning('消费项目编号不存在！');
    Exit;
  end;
  FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
  if (FJzfs=JZFS_RMB)or(FJzfs=JZFS_ZP)or(FJzfs=JZFS_XYK) then
  begin
    UpdateKrjz;
    UpdateKrzd;
  end;

  if (FJzfs=JZFS_GSK) then
  begin
    FZdbh := HotelData.FindBh('KFZT','D_ZDBH','D_KFBH',FKfbh);
    UpdateGz(FZdbh,ZDLB_YK);
  end;

  if (FJzfs=JZFS_GTD) then
  begin
    //edit by ls.2002.12.01
    FZdbh := HotelData.GetZdbh(FKrbh);
    //FZdbh := HotelData.FindBh('KFZT','D_ZDBH','D_KRBH',FKrbh);
    UpdateGz(FZdbh,ZDLB_TD);
  end;

  if FJzfs=JZFS_JZ then
  begin
    UpdateKrzd;
    UpdateYsk;
  end;

  UpdateYdhc;

  Close;
end;

end.
