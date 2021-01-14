{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Yskzd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define, Mask,
  DB, DBTables, Grids, DBGrids, ComCtrls;

type
  TYskzdForm = class(TStdJdForm)
    Label1: TLabel;
    Label2: TLabel;
    edtJzrq: TMaskEdit;
    Label3: TLabel;
    edtJzsj: TMaskEdit;
    radJzlb: TRadioGroup;
    qryYsk: TQuery;
    tblYskjzls: TTable;
    dsYskjzls: TDataSource;
    DBGrid1: TDBGrid;
    tblYskjzlsD_XFXM: TStringField;
    Label4: TLabel;
    lblXfje: TLabel;
    Label5: TLabel;
    lblJsje: TLabel;
    Label6: TLabel;
    lblYjje: TLabel;
    Label7: TLabel;
    lblQzje: TLabel;
    Label9: TLabel;
    lblYjkc: TLabel;
    Label11: TLabel;
    lblYhje: TLabel;
    Label8: TLabel;
    edtSjje: TEdit;
    tblYskjzlsD_JSJE: TCurrencyField;
    tblYskjzlsD_YE: TCurrencyField;
    dtpB: TDateTimePicker;
    dtpE: TDateTimePicker;
    btnSele: TBitBtn;
    Label12: TLabel;
    tblKrjz: TTable;
    tblYsk: TTable;
    tblYskjz: TTable;
    tblKrzd: TTable;
    btnPrint: TBitBtn;
    Label13: TLabel;
    CheckBox1: TCheckBox;
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    tblYskjzlsD_KHBH: TStringField;
    tblYskjzlsD_ZDBH: TStringField;
    tblYskjzlsD_HH: TIntegerField;
    tblYskjzlsD_XMBH: TStringField;
    tblYskjzlsD_XFJE: TFloatField;
    tblYskjzlsD_YJJE: TFloatField;
    tblYskjzlsD_YHJE: TFloatField;
    tblYskjzlsD_JZJE: TFloatField;
    tblYskjzlsD_XFRQ: TDateTimeField;
    tblYskjzlsD_XFSJ: TDateTimeField;
    tblYskjzlsD_JZBZ: TStringField;
    edtKhmc: TEdit;
    btnKhbh: TSpeedButton;
    Label10: TLabel;
    procedure radJzfsClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure radJzlbClick(Sender: TObject);
    procedure tblYskjzlsCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure tblYskjzlsBeforeEdit(DataSet: TDataSet);
    procedure tblYskjzlsBeforeInsert(DataSet: TDataSet);
    procedure tblYskjzlsBeforeDelete(DataSet: TDataSet);
    procedure tblYskjzlsAfterPost(DataSet: TDataSet);
    procedure tblYskjzlsD_YHJEValidate(Sender: TField);
    procedure tblYskjzlsD_JZJEValidate(Sender: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnSeleClick(Sender: TObject);
    procedure edtSjjeExit(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnKhbhClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FBmbh: string;
    IsEdit: Boolean;
    FJzbh: string;
    FKhbh: string;
    FJzlb: Integer;
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    FJzfs: string;
    FXykbh: string;
    FJsje: Currency;
    FYhje: Currency;
    FYjkc: Currency;
    FBfjz: Currency;
    FSjje: Currency;
    FQzje: Currency;
    FXfje: Currency;
    FYjje: Currency;
    FXfje1: Currency;
    FYjje1: Currency;
    FYhje1: Currency;
    function IsValid: Boolean;
    procedure ShowJzxx;
    procedure ShowJsxx;
    procedure ShowZd;
    procedure ShowBfjz;
    procedure ShowQbjz;
    function SumXfje: Currency;
    function SumYjje: Currency;
    procedure SumYhje;
    procedure SelectAll(AItem: string);
    procedure SelectDate(ABDate,AEDate: TDateTime);
    procedure UpdateKrjz;
    procedure UpdateYskmx;
    procedure UpdateYskzz;
    procedure UpdateYskjz;
    procedure UpdateEwf;
    procedure AddKrzd(const AZdbh: string;AHh: Integer;AEwf: Currency);
    procedure AddKrjz(AHh: Integer;AXmbh: string;AXfje,AYjje,AYhje: Currency);
    procedure AddYskjz(AHh: Integer;AXmbh,ABz: string;AXfje,AYjje,AYhje: Currency);
  public
    { Public declarations }
  end;

var
  YskzdForm: TYskzdForm;

procedure Yskzd;

implementation

uses C_HotelData, C_Sysprint, C_CardXf, C_Wait, C_KhdaSel;

{$R *.dfm}

//应收款结帐
procedure Yskzd;
begin
  YskzdForm := TYskzdForm.Create(Application);
  try
    with YskzdForm do
    begin
      IsEdit := False;
      //获取部门编号
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      dtpB.Date := Date;
      dtpE.Date := Date;
      //显示结帐信息
      ShowJzxx;
      ShowModal;
    end;
  finally
    YskzdForm.Free;
  end;
end;

//累计优惠金额
procedure TYskzdForm.SumYhje;
var
  PrevRecord: TBookMark;
begin
  PrevRecord := tblYskjzls.GetBookmark;
  try
    tblYskjzls.DisableControls;
    FYhje := 0;
    FYjkc := 0;
    FBfjz := 0;
    tblYskjzls.First;
    while not tblYskjzls.Eof do
    begin
      if tblYskjzlsD_XMBH.Value <> XMBH_YJK then
      begin
        FYhje := FYhje + tblYskjzlsD_YHJE.Value;
        FBfjz := FBfjz + tblYskjzlsD_JZJE.Value;
      end
      else
      begin
        FYjkc := FYjkc + tblYskjzlsD_JZJE.Value;
      end;
      tblYskjzls.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    if PrevRecord<>nil then
    begin
      tblYskjzls.GotoBookmark(PrevRecord);
      tblYskjzls.FreeBookmark(PrevRecord);
    end;
    ShowJsxx;
  end;
end;

//获取消费金额
function TYskzdForm.SumXfje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from YSK where '
           +'(D_KHBH="'+FKhbh+'")and(D_HH<>0)and(D_XMBH<>"'
           +XMBH_YJK+'")';
  Result := HotelData.SumJe(SqlStr);
end;

//获取已结金额
function TYskzdForm.SumYjje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from YSK where '
           +'(D_KHBH="'+FKhbh+'")and(D_XMBH="'+XMBH_YJK+'")';
  Result := 0-HotelData.SumJe(SqlStr);
end;


//显示结算信息
procedure TYskzdForm.ShowJsxx;
begin
  //结算金额
  FJsje := FBfjz-FYhje-FYjkc;

  //实结金额
  if FJsje>=0 then
    FSjje := Trunc(FJsje+0.99)
  else
    FSjje := Trunc(FJsje-0.99);

  //欠账金额
  FQzje := FXfje-FYjje;

  lblYjkc.Caption := FormatFloat('#.##',FYjkc);
  lblXfje.Caption := FormatFloat('#.##',FXfje);
  lblYjje.Caption := FormatFloat('#.##',FYjje);
  lblYhje.Caption := FormatFloat('#.##',FYhje);
  lblJsje.Caption := FormatFloat('#.##',FJsje);
  lblQzje.Caption := FormatFloat('#.##',FQzje);
  edtSjje.Text := FormatFloat('#.##',FSjje);
end;

//显示结帐信息
procedure TYskzdForm.ShowJzxx;
begin
  //初始化
  edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
  edtJzsj.Text := FormatDateTime('hh:mm',Time);
  FJzrq := Date;
  FJzsj := Time;
  FJzfs := JZFS_RMB;
  //结帐类别 1-明细结帐 0-总帐结帐
  FJzlb := 1;
end;

//结帐方式选择
procedure TYskzdForm.radJzfsClick(Sender: TObject);
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
  end;
end;

procedure TYskzdForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TYskzdForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;

//有效性检查
function TYskzdForm.IsValid: Boolean;
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
    else
      Result := True;
  end;
end;

//添加结帐库记录
procedure TYskzdForm.AddKrjz(AHh: Integer;AXmbh: string;AXfje,AYjje,AYhje: Currency);
begin
  tblKrjz.Insert;
  tblKrjz.FieldByName('D_JZBH').AsString   := FJzbh;
  tblKrjz.FieldByName('D_HH').AsInteger    := AHh;
  tblKrjz.FieldByName('D_XMBH').AsString   := AXmbh;
  tblKrjz.FieldByName('D_XFJE').AsCurrency := AXfje;
  tblKrjz.FieldByName('D_YJJE').AsCurrency := AYjje;
  tblKrjz.FieldByName('D_YHJE').AsCurrency := AYhje;
  tblKrjz.FieldByName('D_JZFS').AsString   := FJzfs;
  tblKrjz.FieldByName('D_JZLX').AsString   := JZLX_YSK;
  tblKrjz.FieldByName('D_XYKBH').AsString  := FXykbh;
  tblKrjz.FieldByName('D_KHBH').AsString   := FKhbh;
  tblKrjz.FieldByName('D_JZRQ').AsDateTime := FJzrq;
  tblKrjz.FieldByName('D_JZSJ').AsDateTime := FJzsj;
  tblKrjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
  tblKrjz.FieldByName('D_BMBH').AsString   := FBmbh;
  tblKrjz.FieldByName('D_BZ').AsString     := JZBZ_YSK+' '+FKhbh;
  tblKrjz.Post;
end;

//添加到应收款结帐明细库中
procedure TYskzdForm.AddYskjz(AHh: Integer;AXmbh,ABz: string;AXfje,AYjje,AYhje: Currency);
begin
  tblYskjz.Insert;
  tblYskjz.FieldByName('D_JZBH').AsString   := FJzbh;
  tblYskjz.FieldByName('D_HH').AsInteger    := AHh;
  tblYskjz.FieldByName('D_XMBH').AsString   := AXmbh;
  tblYskjz.FieldByName('D_XFJE').AsCurrency := AXfje;
  tblYskjz.FieldByName('D_YJJE').AsCurrency := AYjje;
  tblYskjz.FieldByName('D_YHJE').AsCurrency := AYhje;
  tblYskjz.FieldByName('D_JZFS').AsString   := FJzfs;
  tblYskjz.FieldByName('D_XYKBH').AsString  := FXykbh;
  tblYskjz.FieldByName('D_KHBH').AsString   := FKhbh;
  tblYskjz.FieldByName('D_JZRQ').AsDateTime := FJzrq;
  tblYskjz.FieldByName('D_JZSJ').AsDateTime := FJzsj;
  tblYskjz.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
  tblYskjz.FieldByName('D_BZ').AsString  := ABz;
  tblYskjz.Post;
end;

//更新客人结帐库
procedure TYskzdForm.UpdateKrjz;
var
  AHh              : Integer;
  AXmbh            : string;
  AXfje,AYjje,AYhje: Currency;
begin
  try
    tblYskjzls.DisableControls;
    AHh := 0;
    FXfje1 := 0;FYjje1 := 0;FYhje1 := 0;

    try
      tblKrjz.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    tblYskjzls.First;
    while not tblYskjzls.Eof do
    begin
      //如果结帐，并且结帐金额大于零
      //if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value>0) then
      if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value<>0) then
      begin
        //增加行号
        Inc(AHh);

        //获取消费金额 如果是预交款则为负
        if tblYskjzlsD_XMBH.Value<>XMBH_YJK then
          AXfje := tblYskjzlsD_JZJE.Value
        else
          AXfje := 0-tblYskjzlsD_JZJE.Value;

        AYjje := tblYskjzlsD_YJJE.Value;
        AYhje := tblYskjzlsD_YHJE.Value;
        AXmbh := tblYskjzlsD_XMBH.Value;

        //加入到结帐库中
        AddKrjz(AHh,AXmbh,AXfje,AYjje,AYhje);

        //累计求和
        FXfje1 := FXfje1 + AXfje;
        FYjje1 := FYjje1 + AYjje;
        FYhje1 := FYhje1 + AYhje;
      end;
      tblYskjzls.Next;
    end;

    //增加结帐总单
    AHh := 0;
    AddKrjz(AHh,'0',FSjje+FYhje,FYjje1,FYhje1);

  finally
    tblKrjz.Close;
    tblYskjzls.EnableControls;
  end;
end;

//总帐结帐
procedure TYskzdForm.UpdateYskzz;
begin
  try
    tblYskjzls.DisableControls;

    //先清空应收款
    //HotelData.EmptyData('select * from YSK where D_KHBH="'+FKhbh+'"');
    HotelData.EmptyData('delete from YSK where D_KHBH="'+FKhbh+'"');

    try
      tblYsk.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    //从临时库中写入余额
    tblYskjzls.First;
    while not tblYskjzls.Eof do
    begin

      //如果还有余额
      if tblYskjzlsD_YE.Value <>0 then
      begin
        tblYsk.Insert;
        tblYsk.FieldByName('D_KHBH').AsString := FKhbh;
        tblYsk.FieldByName('D_ZDBH').AsString := '0';
        tblYsk.FieldByName('D_HH').AsInteger  := tblYskjzlsD_HH.Value;
        tblYsk.FieldByName('D_XMBH').AsString := tblYskjzlsD_XMBH.Value;
        tblYsk.FieldByName('D_XFJE').AsCurrency:= tblYskjzlsD_YE.Value;
        tblYsk.FieldByName('D_XFRQ').AsDateTime := FJzrq;
        tblYsk.FieldByName('D_XFSJ').AsDateTime := FJzsj;
        tblYsk.FieldByName('D_CZYXM').AsString := CZY.CzyXm;
        tblYsk.Post;
      end;
      tblYskjzls.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    tblYsk.Close;
  end;
end;

//明细结帐
procedure TYskzdForm.UpdateYskmx;
begin
  try
    tblYskjzls.DisableControls;

    try
      tblYsk.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    //从临时库中写入余额
    tblYskjzls.First;
    while not tblYskjzls.Eof do
    begin

      //如果结帐，并且结帐金额大于零
      //if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value>0) then
      if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value<>0) then
      begin
        //找到该记录
        if tblYsk.FindKey([tblYskjzlsD_KHBH.Value,tblYskjzlsD_ZDBH.Value,tblYskjzlsD_HH.Value]) then
        begin
          //如果余额为零，则删除
          if tblYskjzlsD_YE.Value=0 then tblYsk.Delete
          else    //否则，修改为余额
          begin
            tblYsk.Edit;
            tblYsk.FieldByName('D_XFJE').AsCurrency := tblYskjzlsD_YE.Value;
            tblYsk.Post;
          end;

        end;
      end;
      tblYskjzls.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    tblYsk.Close;
  end;
end;

//更新应收款结帐明细
procedure TYskzdForm.UpdateYskjz;
var
  AHh              : Integer;
  AXmbh,ABz        : string;
  AXfje,AYjje,AYhje: Currency;
begin
  try
    tblYskjzls.DisableControls;

    try
      tblYskjz.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    tblYskjzls.First;
    AHh := 1;

    //添加记录
    while not tblYskjzls.Eof do
    begin
      //如果结帐，并且结帐金额大于零
      //if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value>0) then
      if (tblYskjzlsD_JZBZ.Value='T')and(tblYskjzlsD_JZJE.Value<>0) then
      begin

        //判断预交款
        if tblYskjzlsD_XMBH.Value<>XMBH_YJK then
          AXfje := tblYskjzlsD_JZJE.Value
        else
          AXfje := 0-tblYskjzlsD_JZJE.Value;

        AYjje := tblYskjzlsD_YJJE.Value;
        AYhje := tblYskjzlsD_YHJE.Value;
        AXmbh := tblYskjzlsD_XMBH.Value;
        ABz   := FormatDateTime('yyyy-mm-dd',tblYskjzlsD_XFRQ.Value);
        //添加记录
        AddYskjz(AHh,AXmbh,ABz,AXfje,AYjje,AYhje);
      end;
      tblYskjzls.Next;
      Inc(AHh);
    end;
  finally
    tblYskjz.Close;
    tblYskjzls.EnableControls;
  end;
end;

//将额外费插入到帐单库中
procedure TYskzdForm.AddKrzd(const AZdbh: string;AHh: Integer;AEwf: Currency);
begin
    tblKrzd.Insert;
    tblKrzd.FieldByName('D_ZDBH').AsString   := AZdbh;
    tblKrzd.FieldByName('D_HH').AsInteger    := AHh;
    tblKrzd.FieldByName('D_ZDLB').AsString   := ZDLB_SYS;
    tblKrzd.FieldByName('D_XMBH').AsString   := XMBH_EWF;
    tblKrzd.FieldByName('D_XFJE').AsCurrency := AEwf;
    tblKrzd.FieldByName('D_XFRQ').AsDateTime := FJzrq;
    tblKrzd.FieldByName('D_XFSJ').AsDateTime := FJzsj;
    tblKrzd.FieldByName('D_JZBZ').AsString   := JZ_YES;
    tblKrzd.FieldByName('D_JSBZ').AsString   := JS_YES;
    tblKrzd.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblKrzd.FieldByName('D_JZBH').AsString   := FJzbh;
    tblKrzd.FieldByName('D_BZ').AsString     := ZDBZ_SYS;
    tblKrzd.Post;
end;

//更新额外费
procedure TYskzdForm.UpdateEwf;
var
  AEwf       : Currency;
  AKhmc,AZdbh: string;
begin
  try

    try
      tblKrzd.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    tblYskjzls.DisableControls;

    //获取额外费
    AEwf := FSjje-FJsje;

    //写入krjz.db
    if AEwf<>0 then
    begin
      IsEdit := True;
      tblYskjzls.Insert;
      tblYskjzlsD_KHBH.Value := FKhbh;
      tblYskjzlsD_ZDBH.Value := '9999';
      tblYskjzlsD_HH.Value   := 9999;
      tblYskjzlsD_XMBH.Value := XMBH_EWF;
      tblYskjzlsD_XFJE.Value := AEwf;
      tblYskjzlsD_JZJE.Value := AEwf;
      tblYskjzlsD_XFRQ.Value := FJzrq;
      tblYskjzlsD_XFSJ.Value := FJzsj;
      tblYskjzlsD_JZBZ.Value := 'T';
      tblYskjzls.Post;
      //写入ewf.db
      AKhmc := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh);
      HotelData.UpdateEwfDbf(FJzbh,AKhmc,AEwf,FJzrq,FJzsj);
      IsEdit := False;

      //获取帐单编号
      AZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
      //添加到帐单库中
      AddKrzd(AZdbh,0,AEwf);
      AddKrzd(AZdbh,1,AEwf);
    end;
  finally
    tblKrzd.Close;
    tblYskjzls.EnableControls;
  end;
end;

//结帐确认
procedure TYskzdForm.btnOKClick(Sender: TObject);
begin
  inherited;
  //检查有效性
  if not IsValid then Exit;



  if not Confirm('你确认该客人的消费结帐吗？') then
    Exit;
  tblYskjzlsD_YHJE.OnValidate := nil;
  tblYskjzlsD_JZJE.OnValidate := nil;

  //获取结帐编号
  FJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    //判断结帐类别
    if FJzlb=0 then UpdateYskzz  //总帐结帐
    else UpdateYskmx;            //明细结帐

    //更新额外费
    UpdateEwf;

    //更新客人结帐库
    UpdateKrjz;

    //更新应收款结帐库
    UpdateYskjz;

    //事务提交
    HotelData.DatabaseUser.Commit;

    {if Confirm('是否打印帐单？') then
      btnPrintClick(nil);}

  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  Close;
end;

//显示总帐结帐帐单
procedure TYskzdForm.ShowQbjz;
var
  s  : string;
  AHh: Integer;
begin
  with qryYsk do
  begin
    if Active then Active := False;
    s := 'select D_XMBH,sum(D_XFJE) from YSK where (D_KHBH="'
        + FKhbh + '") and (D_HH<>0) group by D_XMBH';
    SQL.Clear;
    SQL.Add(s);
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;

  //增加帐单
  try
    IsEdit := True;
    tblYskjzls.DisableControls;

    //清空临时库
    tblYskjzls.Close;
    tblYskjzls.EmptyTable;

    try
      tblYskjzls.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    qryYsk.First;
    AHh := 1;

    //从应收款库中添加
    while not qryYsk.Eof do
    begin
      tblYskjzls.Insert;
      tblYskjzlsD_KHBH.Value := FKhbh;
      tblYskjzlsD_ZDBH.Value := '0';
      tblYskjzlsD_HH.Value   := AHh;
      tblYskjzlsD_XMBH.Value := qryYsk.Fields[0].AsString;
      tblYskjzlsD_XFJE.Value := qryYsk.Fields[1].AsCurrency;
      tblYskjzlsD_XFRQ.Value := Date;
      tblYskjzlsD_XFSJ.Value := Time;
      tblYskjzls.Post;
      qryYsk.Next;
      Inc(AHh);
    end;
  finally
    tblYskjzls.EnableControls;
    IsEdit := False;
  end;
end;


//明细结帐帐单
procedure TYskzdForm.ShowBfjz;
var
  s: string;
begin
  with qryYsk do
  begin
    if Active then Active := False;
    s := 'select * from YSK where (D_KHBH="'
        + FKhbh + '") and (D_HH<>0)';
    SQL.Clear;
    SQL.Add(s);
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
  end;

  try
    IsEdit := True;
    tblYskjzls.DisableControls;

    //清空临时库
    tblYskjzls.Close;
    tblYskjzls.EmptyTable;

    try
      tblYskjzls.Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;

    //从应收款库中增加
    qryYsk.First;
    while not qryYsk.Eof do
    begin
      tblYskjzls.Insert;
      tblYskjzlsD_KHBH.Value := FKhbh;
      tblYskjzlsD_ZDBH.Value := qryYsk.FieldbyName('D_ZDBH').AsString;
      tblYskjzlsD_HH.Value   := qryYsk.FieldbyName('D_HH').AsInteger;
      tblYskjzlsD_XMBH.Value := qryYsk.FieldByName('D_XMBH').AsString;
      tblYskjzlsD_XFJE.Value := qryYsk.FieldByName('D_XFJE').AsCurrency;
      tblYskjzlsD_XFRQ.Value := qryYsk.FieldByName('D_XFRQ').AsDateTime;
      tblYskjzlsD_XFSJ.Value := qryYsk.FieldbyName('D_XFSJ').AsDateTime;
      tblYskjzls.Post;
      qryYsk.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    IsEdit := False;
  end;
end;

//显示帐单
procedure TYskzdForm.ShowZd;
begin
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '统计客户应收款';
    WaitForm.Show;
    WaitForm.Update;
  //判断结帐类型
  if FJzlb=0 then ShowQbjz
  else ShowBfjz;

  tblYskjzls.First;
  //获取消费金额
  FXfje := SumXfje;

  //获取已结金额
  FYjje := SumYjje;

  //显示结算信息
  ShowJsxx;

  //允许全选
  CheckBox1.Visible := True;
  CheckBox1.Checked := False;


  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;

end;

//选择结帐类别
procedure TYskzdForm.radJzlbClick(Sender: TObject);
begin
  inherited;
  case radJzlb.ItemIndex of
    0: FJzlb := 0;
    1: FJzlb := 1;
  end;
  ShowZd;
end;

//计算字段
procedure TYskzdForm.tblYskjzlsCalcFields(DataSet: TDataSet);
begin
  inherited;
  if tblYskjzlsD_XMBH.Value <> XMBH_YJK then
  begin
    tblYskjzlsD_JSJE.Value := tblYskjzlsD_JZJE.Value - tblYskjzlsD_YHJE.Value;
    tblYskjzlsD_YE.Value   := tblYskjzlsD_XFJE.Value - tblYskjzlsD_JZJE.Value;
  end
  else
  begin
    tblYskjzlsD_JSJE.Value := tblYskjzlsD_JZJE.Value;
    tblYskjzlsD_YE.Value   := tblYskjzlsD_XFJE.Value + tblYskjzlsD_JZJE.Value;
  end;
end;

//选择结帐日期段
procedure TYskzdForm.SelectDate(ABDate,AEDate: TDateTime);
begin
  try
    tblYskjzls.DisableControls;
    IsEdit := True;

    tblYskjzls.First;

    //符合时间的记录
    while not tblYskjzls.Eof do
    begin
      //如果时间符合
      if (tblYskjzlsD_XFRQ.Value>=ABDate)and(tblYskjzlsD_XFRQ.Value<=AEDate) then
      begin

        //置结算标志为True
        tblYskjzls.Edit;
        tblYskjzlsD_JZBZ.Value := 'T';

        //如果结算
        if tblYskjzlsD_JZBZ.Value='T' then
        begin
          //如果不是预交款，则结帐金额等于消费金额，否则为零
          if tblYskjzlsD_XMBH.Value <> XMBH_YJK then  
            tblYskjzlsD_JZJE.Value := tblYskjzlsD_XFJE.Value
          else
            tblYskjzlsD_JZJE.Value := 0;
          //优惠金额为零
          tblYskjzlsD_YHJE.Value := 0;
        end
        else   //如果不结算
        begin
          tblYskjzlsD_JZJE.Value := 0;
          tblYskjzlsD_YHJE.Value := 0;
        end;
        tblYskjzls.Post;
      end;
      tblYskjzls.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    IsEdit := False;
  end;
end;

//选择所有
procedure TYskzdForm.SelectAll(AItem: string);
begin
  try
    tblYskjzls.DisableControls;
    IsEdit := True;
    tblYskjzls.First;
    while not tblYskjzls.Eof do
    begin
      tblYskjzls.Edit;
      tblYskjzlsD_JZBZ.Value := AItem;
      if tblYskjzlsD_JZBZ.Value='T' then
      begin
        if tblYskjzlsD_XMBH.Value <> XMBH_YJK then
          tblYskjzlsD_JZJE.Value := tblYskjzlsD_XFJE.Value
        else
          tblYskjzlsD_JZJE.Value := 0;
        tblYskjzlsD_YHJE.Value := 0;
      end
      else
      begin
        tblYskjzlsD_JZJE.Value := 0;
        tblYskjzlsD_YHJE.Value := 0;
      end;
      tblYskjzls.Post;
      tblYskjzls.Next;
    end;
  finally
    tblYskjzls.EnableControls;
    IsEdit := False;
  end;
end;

//双击鼠标表示选中或不选中
procedure TYskzdForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  IsEdit := True;
  tblYskjzls.Edit;
  if tblYskjzlsD_JZBZ.Value='T' then tblYskjzlsD_JZBZ.Value := 'F'
  else
    tblYskjzlsD_JZBZ.Value := 'T';
  if tblYskjzlsD_JZBZ.Value='T' then
  begin
    if tblYskjzlsD_XMBH.Value <> XMBH_YJK then
      tblYskjzlsD_JZJE.Value := tblYskjzlsD_XFJE.Value
    else
      tblYskjzlsD_JZJE.Value := 0;
    tblYskjzlsD_YHJE.Value := 0;
  end
  else
  begin
    tblYskjzlsD_JZJE.Value := 0;
    tblYskjzlsD_YHJE.Value := 0;
  end;
  tblYskjzls.Post;
  IsEdit := False;
end;

//如果未选中结帐则不允许编辑
procedure TYskzdForm.tblYskjzlsBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if (not tblYskjzlsD_JZBZ.AsBoolean)and(not IsEdit) then Abort;
end;

procedure TYskzdForm.tblYskjzlsBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not IsEdit then Abort;
end;

procedure TYskzdForm.tblYskjzlsBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TYskzdForm.tblYskjzlsAfterPost(DataSet: TDataSet);
begin
  inherited;
  SumYhje;
end;

//优惠金额有效性检查
procedure TYskzdForm.tblYskjzlsD_YHJEValidate(Sender: TField);
begin
  inherited;
  if tblYskjzlsD_XMBH.Value<>XMBH_YJK then
  begin
    if tblYskjzlsD_JZJE.AsCurrency < 0 then Exit;
    if (tblYskjzlsD_YHJE.AsCurrency>tblYskjzlsD_JZJE.AsCurrency) then
      raise Exception.Create('优惠金额必须小于本次结帐金额！');
  end
  else
  begin
    if tblYskjzlsD_YHJE.Value <> 0  then
      raise Exception.Create('预交款不能优惠！');
  end;
end;

//本次结帐金额的有效性检查
procedure TYskzdForm.tblYskjzlsD_JZJEValidate(Sender: TField);
begin
  inherited;
  if (tblYskjzlsD_XMBH.Value<>XMBH_YJK) then
  begin
    //if tblYskjzlsD_XMBH.Value = XMBH_EWF then Exit;
    if tblYskjzlsD_JZJE.Value < 0 then Exit;
    if (tblYskjzlsD_JZJE.Value>tblYskjzlsD_XFJE.Value)or
      (tblYskjzlsD_JZJE.Value<tblYskjzlsD_YHJE.Value) then
      begin
        if tblYskjzlsD_JZJE.Value = 0 then Exit;
        raise Exception.Create('本次结帐金额必须小于消费金额，大于优惠金额！');
      end;
  end
  else
  begin
    //if tblYskjzlsD_XMBH.Value = XMBH_EWF then Exit;
    if (tblYskjzlsD_JZJE.Value>0-tblYskjzlsD_XFJE.Value) then
        raise Exception.Create('预交款扣除金额必须大于零并且小于预交款！');
  end;
end;

//全选或全不选
procedure TYskzdForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    SelectAll('T')
  else
    SelectAll('F');
end;

//选择结帐日期段
procedure TYskzdForm.btnSeleClick(Sender: TObject);
begin
  inherited;
  if dtpE.Date >= dtpB.Date then
    SelectDate(dtpB.DateTime,dtpE.DateTime);
end;

//判断实结金额
procedure TYskzdForm.edtSjjeExit(Sender: TObject);
var
  ASjje: Currency;
begin
  inherited;
  ASjje := StrToCurr(edtSjje.Text);
  if Abs(ASjje-FJsje)<=10 then FSjje := ASjje
  else
  begin
    ShowWarning('实结金额差额必须小于10元！');
    edtSjje.SetFocus;
  end;
end;

procedure TYskzdForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '帐单（结帐方式：'+FJzfs+'）';
  APrintStru.ASub := '消费金额：'+lblXfje.Caption+' '
                    +'预交金额：'+lblYjje.Caption+' '
                    +'预交扣除：'+lblYjkc.Caption+' '
                    +'结算金额：'+lblJsje.Caption+' '+#13#10
                    +'欠账金额：'+lblQzje.Caption+' '
                    +'优惠金额：'+lblYhje.Caption+' '
                    +'实结金额：'+edtSjje.Text+'元';

  APrintStru.ADataSet := tblYskjzls;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TYskzdForm.btnKhbhClick(Sender: TObject);
begin
  inherited;
  FKhbh := KhdaSel;
  if FKhbh <> '' then
  begin
    edtKhmc.Text := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh);
    ShowZd;
  end;
end;

procedure TYskzdForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if tblYskjzlsD_JZBZ.Value = 'T' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TYskzdForm.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then DBGrid1DblClick(nil);
end;

end.
