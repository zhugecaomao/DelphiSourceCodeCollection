unit C_Ydkfsk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB,
  DBTables, Mask, DBCtrls, DateUtils, C_Define;

type
  TYdkfskForm = class(TStdJdForm)
    tblYdkf: TTable;
    dsYdkf: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    btnYdqr: TBitBtn;
    btnYdqx: TBitBtn;
    btnTdjd: TBitBtn;
    lblState: TStaticText;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    tblYdkfD_YDBH: TStringField;
    tblYdkfD_KFBH: TStringField;
    tblYdkfD_KRBH: TStringField;
    tblYdkfD_KRXM: TStringField;
    tblYdkfD_YDRQ: TDateTimeField;
    tblYdkfD_DDRQ: TDateTimeField;
    tblYdkfD_DDSJ: TDateTimeField;
    tblYdkfD_LDRQ: TDateTimeField;
    tblYdkfD_LDSJ: TDateTimeField;
    tblYdkfD_XFJE: TFloatField;
    tblYdkfD_YDBZ: TStringField;
    tblYdkfD_RZBZ: TStringField;
    tblYdkfD_JSBZ: TStringField;
    tblYdkfD_CZYXM: TStringField;
    tblYdkfD_BZ: TStringField;
    procedure tblYdkfNewRecord(DataSet: TDataSet);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure tblYdkfBeforePost(DataSet: TDataSet);
    procedure DBEdit4Exit(Sender: TObject);
    procedure btnYdqrClick(Sender: TObject);
    procedure btnTdjdClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FYdbh: string;
    IsAppend: Boolean;
    procedure ShowState;
  public
    { Public declarations }
  end;

var
  YdkfskForm: TYdkfskForm;

procedure YdkfskNew;
procedure YdkfskEdit(const AYdbh: string);

implementation

uses C_HotelData, C_Nbjd;

{$R *.dfm}

//新增预定
procedure YdkfskNew;
begin
  YdkfskForm := TYdkfskForm.Create(Application);
  try
    with YdkfskForm do
    begin
      //初始化
      FKrbh := HotelData.GetBh('D_KRBH',PREV_KRBH);
      FYdbh := '';
      IsAppend := True;
      try
        tblYdkf.Open;
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

      tblYdkf.Insert;
      ShowState;
      ShowModal;
    end;
  finally
    YdkfskForm.tblYdkf.Close;
    YdkfskForm.Free;
  end;
end;

//修改预定
procedure YdkfskEdit(const AYdbh: string);
begin
  YdkfskForm := TYdkfskForm.Create(Application);
  try
    with YdkfskForm do
    begin
      //FKrbh := AKrbh;
      FYdbh := AYdbh;
      IsAppend := False;
      try
        tblYdkf.Open;
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

      tblYdkf.Locate('D_YDBH',AYdbh,[]);
      tblYdkf.Edit;
      ShowState;
      ShowModal;
    end;
  finally
    YdkfskForm.tblYdkf.Close;
    YdkfskForm.Free;
  end;
end;

procedure TYdkfskForm.ShowState;
begin
  if tblYdkfD_RZBZ.AsBoolean then
  begin
    lblState.Caption    := '已确认';
    lblState.Font.Color := clGreen;
  end
  else
  begin
    lblState.Caption    := '未确认';
    lblState.Font.Color := clYellow;
  end;

  btnYdqr.Enabled := not tblYdkfD_RZBZ.AsBoolean;
  btnYdqx.Enabled := btnYdqr.Enabled;
  btnTdjd.Enabled := not btnYdqr.Enabled;
end;

procedure TYdkfskForm.tblYdkfNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblYdkfD_YDRQ.Value := Date;
  tblYdkfD_DDRQ.Value := Tomorrow;
  tblYdkfD_DDSJ.Value := EnCodeTime(8,0,0,0);
  tblYdkfD_LDRQ.Value := IncDay(Tomorrow,1);
  tblYdkfD_LDSJ.Value := EnCodeTime(8,0,0,0);
  tblYdkfD_YDBZ.Value := YDKF_SK;
  tblYdkfD_KRBH.Value := FKrbh;
  //tblYdkfD_KRXM.Value := lblKrxm.Caption;
  tblYdkfD_RZBZ.Value := 'F';
  tblYdkfD_JSBZ.Value := JS_NO;
  tblYdkfD_CZYXM.Value := CZY.CzyXm;
end;

procedure TYdkfskForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblYdkf.Cancel;
end;

//确认
procedure TYdkfskForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定修改') then Exit;
  if tblYdkfD_KFBH.Value = '' then
  begin
    ShowWarning('请输入客房号！');
    Exit;
  end;

  if tblYdkfD_KRXM.Value = '' then
  begin
    ShowWarning('请输入客人姓名！');
    Exit;
  end;

  if not HotelData.IsValidKfyd(tblYdkfD_KFBH.Value,FYdbh,tblYdkfD_DDRQ.Value,tblYdkfD_LDRQ.Value) then
  begin
    ShowWarning('该客房已经被预定！');
    Exit;
  end;

  HotelData.DatabaseUser.StartTransaction;
  try
    tblYdkf.Post;
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  Close;
end;

procedure TYdkfskForm.tblYdkfBeforePost(DataSet: TDataSet);
begin
  inherited;
  if IsAppend then
    tblYdkfD_YDBH.Value := HotelData.GetBh('D_YDBH',PREV_YDBH);
end;

procedure TYdkfskForm.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if DBEdit4.Text='' then DBEdit4.SetFocus;
end;

procedure TYdkfskForm.btnYdqrClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定确认') then Exit;
  if Confirm('你确认该客房的预定吗？') then
  begin
    tblYdkfD_RZBZ.Value := 'T';
    ShowState;
  end;
end;

procedure TYdkfskForm.btnTdjdClick(Sender: TObject);
begin
  inherited;
  
  NbjdYd(tblYdkfD_KFBH.Value,tblYdkfD_KRXM.Value,tblYdkfD_XFJE.Value,DaysBetween(tblYDkfD_DDRQ.Value,tblYDkfD_LDRQ.Value));
  if NbjdForm.ModalResult <> mrOK then
  begin
    tblYdkf.Delete;
    Close;
  end;
end;

end.
