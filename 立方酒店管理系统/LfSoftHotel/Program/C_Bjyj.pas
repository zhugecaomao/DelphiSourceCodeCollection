{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Bjyj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList,
  DB, DBTables, C_Define;

type
  TBjyjForm = class(TStdJdForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tblKryj: TTable;
    edtKfh: TLabeledEdit;
    edtYjje: TLabeledEdit;
    edtYjjetd: TLabeledEdit;
    edtTdmc: TLabeledEdit;
    tblKryjD_YJBH: TStringField;
    tblKryjD_HH: TIntegerField;
    tblKryjD_FKFS: TStringField;
    tblKryjD_XYKBH: TStringField;
    tblKryjD_KHBH: TStringField;
    tblKryjD_YFJE: TFloatField;
    tblKryjD_YFRQ: TDateTimeField;
    tblKryjD_YFSJ: TDateTimeField;
    tblKryjD_BZ: TStringField;
    procedure edtKfhExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtYjjeExit(Sender: TObject);
    procedure edtYjjeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FItemNo: Integer;
    FYjje: Currency;
    FYjbh: string;
    FYjxx: TYjxx;
    procedure UpdateKryj;
  public
    { Public declarations }
  end;

var
  BjyjForm: TBjyjForm;

procedure Bjyj;
procedure BjyjEnter(const AKfbh: string);
procedure BjyjTd(const AKrbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

//补交押金
procedure Bjyj;
begin
  BjyjForm := TBjyjForm.Create(Application);
  try
    with BjyjForm do
    begin
      try
        tblKryj.Open;
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

      PageControl1.ActivePageIndex := 0;
      ShowModal;
    end;
  finally
    BjyjForm.tblKryj.Close;
    BjyjForm.Free;
  end;
end;

//补交押金
procedure BjyjEnter(const AKfbh: string);
begin
  BjyjForm := TBjyjForm.Create(Application);
  try
    with BjyjForm do
    begin
      try
        tblKryj.Open;
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

      edtKfh.Text := AKfbh;
      PageControl1.ActivePageIndex := 0;
      ShowModal;
    end;
  finally
    BjyjForm.tblKryj.Close;
    BjyjForm.Free;
  end;
end;

//团队补交
procedure BjyjTd(const AKrbh: string);
begin
  BjyjForm := TBjyjForm.Create(Application);
  try
    with BjyjForm do
    begin
      try
        tblKryj.Open;
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

      FYjbh := HotelData.FindBh('KFZT','D_YJBH','D_KRBH',AKrbh);
      FYjxx := HotelData.GetYjxx(FYjbh);

      if tblKryj.FindKey([FYjbh,0]) then
      begin
        if tblKryjD_FKFS.Value = FKFS_RMB then
        begin
          edtTdmc.Text := HotelData.FindUserBh('KRXX','D_KRXM','D_KRBH',AKrbh);
          PageControl1.ActivePageIndex := 1;
          FItemNo := FYjxx.AYjhh;
          ShowModal;
        end
        else
          ShowInfo('该团队不是以人民币方式预交押金，无需补交！');
      end;
    end;
  finally
    BjyjForm.tblKryj.Close;
    BjyjForm.Free;
  end;
end;

//客房号
procedure TBjyjForm.edtKfhExit(Sender: TObject);
var
  AKfzt,AKfbh: string;
  AKfxx      : TKfxx;
begin
  inherited;
  AKfbh := edtKfh.Text;
  AKfzt := HotelData.CheckKfzt(AKfbh);

  if (AKfzt=KFZT_BF)or(AKfzt=KFZT_TD) then
  begin
    AKfxx := HotelData.GetKfxx(AKfbh);
    FYjbh := AKfxx.AYjbh;
    FYjxx := HotelData.GetYjxx(FYjbh);
    if tblKryj.FindKey([FYjbh,0]) then
      if tblKryjD_FKFS.Value <> FKFS_RMB then
      begin
        ShowInfo('该客房不是以人民币方式预交押金，无需补交！');
        edtKfh.SetFocus;
        Exit;
      end;
    FItemNo := FYjxx.AYjhh;
  end
  else
  begin
    ShowInfo('该客房是空房！');
    edtKfh.SetFocus;
  end;
end;

procedure TBjyjForm.UpdateKryj;
begin
  tblKryj.Insert;
  tblKryjD_YJBH.Value := FYjbh;
  tblKryjD_HH.Value   := FItemNo;
  tblKryjD_FKFS.Value := FKFS_RMB;
  tblKryjD_YFJE.Value := FYjje;
  tblKryjD_YFRQ.Value := Date;
  tblKryjD_YFSJ.Value := Time;
  tblKryjD_BZ.Value   := YJBZ_BJ;
  tblKryj.Post;
end;

//确认
procedure TBjyjForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not Confirm('你确认补交押金吗？') then Exit;
  if PageControl1.ActivePageIndex=0 then
  begin
    if edtKfh.Text='' then
    begin
      ShowWarning('请输入客房号！');
      Exit;
    end;

    if edtYjje.Text='' then
    begin
      ShowWarning('请输入金额！');
      Exit;
    end;
    FYjje := StrToCurr(edtYjje.Text);
  end
  else
  begin
    if edtYjjetd.Text='' then
    begin
      ShowWarning('请输入金额！');
      Exit;
    end;
    FYjje := StrToCurr(edtYjjetd.Text);
  end;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    UpdateKryj;

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  edtKfh.Text := '';
  edtYjje.Text := '';
  edtKfh.SetFocus;
  //Close;
end;

procedure TBjyjForm.edtYjjeExit(Sender: TObject);
begin
  inherited;
  if (Sender as TLabeledEdit).Text<>'' then
    FYjje := StrToCurr((Sender as TLabeledEdit).Text);
end;

procedure TBjyjForm.edtYjjeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

end.
