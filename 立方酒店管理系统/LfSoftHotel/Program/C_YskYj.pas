{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_YskYj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, C_Define,
  DB, DBTables;

type
  TYskyjForm = class(TStdJdForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtJzrq: TMaskEdit;
    edtJzsj: TMaskEdit;
    edtJzje: TLabeledEdit;
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    tblYsk: TTable;
    tblKrjz: TTable;
    edtKhmc: TLabeledEdit;
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
    tblKrjzD_BMBH: TStringField;
    procedure radJzfsClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure edtJzjeKeyPress(Sender: TObject; var Key: Char);
    procedure edtJzjeExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FBmbh: string;
    FKhbh: string;
    FJzfs: string;
    FXykbh: string;
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    FJzje: Currency;
    procedure ShowKhxx;
    function IsValid: Boolean;
    procedure UpdateYskz;
    procedure UpdateKrjz;
  public
    { Public declarations }
  end;

var
  YskyjForm: TYskyjForm;

procedure Yskyj(const AKhbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//客户预交款
procedure Yskyj(const AKhbh: string);
begin
  YskyjForm := TYskyjForm.Create(Application);
  try
    with YskyjForm do
    begin
      //部门编号
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      FKhbh := AKhbh;

      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      FJzrq        := Date;
      FJzsj        := Time;
      FJzfs        := JZFS_RMB;

      //显示客户信息
      ShowKhxx;
      
      ShowModal;
    end;
  finally
    YskyjForm.Free;
  end;
end;

//判断有效性
function TYskyjForm.IsValid: Boolean;
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

//显示客户信息
procedure TYskyjForm.ShowKhxx;
begin
  edtKhmc.Text := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh);
end;

//选择结帐方式
procedure TYskyjForm.radJzfsClick(Sender: TObject);
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

procedure TYskyjForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TYskyjForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;

procedure TYskyjForm.edtJzjeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['-','0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TYskyjForm.edtJzjeExit(Sender: TObject);
begin
  inherited;
  if edtJzje.Text<>'' then
    FJzje := StrToCurr(edtJzje.Text);
end;

//更新应收款帐
procedure TYskyjForm.UpdateYskz;
begin

  if tblYsk.FindKey([FKhbh,'0',1]) then
  begin
    tblYsk.Edit;
    tblYsk.FieldByName('D_XFJE').AsCurrency :=
      tblYsk.FieldByName('D_XFJE').AsCurrency + 0 - FJzje;
    tblYsk.Post;
  end
  else
  begin
    tblYsk.Insert;
    tblYsk.FieldByName('D_KHBH').AsString   := FKhbh;
    tblYsk.FieldByName('D_ZDBH').AsString   := '0';
    tblYsk.FieldByName('D_HH').AsInteger    := 1;
    tblYsk.FieldByName('D_XMBH').AsString   := XMBH_YJK;
    tblYsk.FieldByName('D_XFJE').AsCurrency := 0-FJzje;
    tblYsk.FieldByName('D_XFRQ').AsDateTime := FJzrq;
    tblYsk.FieldByName('D_XFSJ').AsDateTime := FJzsj;
    tblYsk.FieldByName('D_CZYXM').AsString  := CZY.CzyXm;
    tblYsk.Post;
  end;

end;

//更新结帐库
procedure TYskyjForm.UpdateKrjz;
var
  AJzbh: string;
begin
  //获取结帐编号
  AJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);

  //插入总单
  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 0;
  tblKrjzD_JZRQ.Value := FJzrq;
  tblKrjzD_JZSJ.Value := FJzsj;
  tblKrjzD_JZFS.Value := FJzfs;
  tblKrjzD_XYKBH.Value:= FXykbh;
  tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_XFJE.Value := FJzje;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BMBH.Value := FBmbh;
  tblKrjzD_BZ.Value   := JZBZ_YJK+' '+edtKhmc.Text;
  tblKrjz.Post;

  //插入子单
  tblKrjz.Insert;
  tblKrjzD_JZBH.Value := AJzbh;
  tblKrjzD_HH.Value   := 1;
  tblKrjzD_JZRQ.Value := FJzrq;
  tblKrjzD_JZSJ.Value := FJzsj;
  tblKrjzD_JZFS.Value := FJzfs;
  tblKrjzD_XYKBH.Value:= FXykbh;
  tblKrjzD_JZLX.Value := JZLX_YJK;
  tblKrjzD_XMBH.Value := XMBH_YJK;
  tblKrjzD_XFJE.Value := FJzje;
  tblKrjzD_CZYXM.Value:= CZY.CzyXm;
  tblKrjzD_BMBH.Value := FBmbh;
  tblKrjzD_BZ.Value   := JZBZ_YJK+' '+edtKhmc.Text;
  tblKrjz.Post;
end;

//确认
procedure TYskyjForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if edtJzje.Text='' then
  begin
    ShowWarning('请输入结帐金额！');
    Exit;
  end;

  if not IsValid then Exit;

  try
    try
      tblYsk.Open;
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

    //事务启动
    HotelData.DatabaseUser.StartTransaction;
    try
      UpdateYskz;
      UpdateKrjz;
      if FJzfs = JZFS_RMB then
        HotelData.InsertYjk(YJLX_KH,edtKhmc.Text,FJzje,0,0);
      if FJzfs = JZFS_XYK then
        HotelData.InsertYjk(YJLX_KH,edtKhmc.Text,0,FJzje,0);
      if FJzfs = JZFS_ZP then
        HotelData.InsertYjk(YJLX_KH,edtKhmc.Text,0,0,FJzje);

      //事务提交
      HotelData.DatabaseUser.Commit;
    except
      HotelData.DatabaseUser.Rollback;
      raise;
    end;

  finally
    tblYsk.Close;
    tblKrjz.Close;
  end;
  Close;
end;

end.
