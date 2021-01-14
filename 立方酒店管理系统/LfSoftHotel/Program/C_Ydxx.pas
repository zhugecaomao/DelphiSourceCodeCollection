unit C_Ydxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DBCtrls, StdCtrls, Mask, DB, DBTables, DosMove,
  Buttons, ExtCtrls, C_Define;

type
  TYdxxForm = class(TStdJdForm)
    qryWork: TQuery;
    dsWork: TDataSource;
    Label1: TLabel;
    lblYfje: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    dbeXm: TDBEdit;
    dbeYfje: TDBEdit;
    dbeDwmc: TDBEdit;
    dbeLxdh: TDBEdit;
    dbeBz: TDBEdit;
    dbcFkfs: TDBComboBox;
    dbeLxr: TDBEdit;
    lblMc: TLabel;
    dbcXykbh: TDBComboBox;
    dbcKhbh: TDBComboBox;
    qryWorkD_KRBH: TStringField;
    qryWorkD_FKFS: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_YFJE: TFloatField;
    qryWorkD_DWMC: TStringField;
    qryWorkD_LXDH: TStringField;
    qryWorkD_LXR: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_KRXM: TStringField;
    procedure qryWorkD_FKFSChange(Sender: TField);
    procedure dbcXykbhExit(Sender: TObject);
    procedure dbcKhbhExit(Sender: TObject);
    procedure dbcFkfsKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure qryWorkBeforePost(DataSet: TDataSet);
    procedure qryWorkNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ShowJdxx;
  public
    { Public declarations }
  end;

var
  YdxxForm: TYdxxForm;

procedure Ydxx;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Ydxx;
begin
  YdxxForm := TYdxxForm.Create(Application);
  try
    with YdxxForm do
    begin
      try
        qryWork.Open;
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
      qryWork.Insert;
      ShowJdxx;
      ShowModal;
    end;
  finally
    YdxxForm.qryWork.Close;
    YdxxForm.Free;
  end;
end;

procedure TYdxxForm.ShowJdxx;
begin
  HotelData.ListDbDm(dbcXykbh,'XYK','D_XYKMC');
  HotelData.ListDbDm(dbcKhbh,'KHDA','D_KHMC');
end;

//改变付款方式
procedure TYdxxForm.qryWorkD_FKFSChange(Sender: TField);
begin
  inherited;
  //qryWorkD_YFJE.Required := qryWorkD_FKFS.Value = FKFS_RMB;
  //qryWorkD_XYKBH.Required:= qryWorkD_FKFS.Value = FKFS_XYK;
  //qryWorkD_KHBH.Required := qryWorkD_FKFS.Value = FKFS_JZ;

  dbeYfje.Visible  := qryWorkD_FKFS.Value = FKFS_RMB;
  dbcXykbh.Visible := qryWorkD_FKFS.Value = FKFS_XYK;
  dbcKhbh.Visible  := qryWorkD_FKFS.Value = FKFS_JZ;
  lblYfje.Visible  := qryWorkD_FKFS.Value <> FKFS_ZP;

  if dbeYfje.Visible  then lblYfje.Caption := '预付金额';
  if dbcXykbh.Visible then lblYfje.Caption := '信用卡';
  if dbcKhbh.Visible  then lblYfje.Caption := '记帐客户';

  lblMc.Caption := '';
  dbcXykbh.Left := dbeYfje.Left;
  dbcXYkbh.Top  := dbeYfje.Top;
  dbcKhbh.Left  := dbeYfje.Left;
  dbcKhbh.Top   := dbeYfje.Top;
end;

procedure TYdxxForm.dbcXykbhExit(Sender: TObject);
var
  AXykbh,AXykmc: string;
begin
  inherited;
  AXykmc := HotelData.FindMc('XYK','D_XYKBH','D_XYKMC',qryWorkD_XYKBH.Value);
  if AXykmc='' then
  begin
    AXykmc := GetMc(dbcXykbh.Items[dbcXykbh.ItemIndex]);
    AXykbh := HotelData.FindBh('XYK','D_XYKBH','D_XYKMC',AXykmc);

    if AXykbh<>'' then
    begin
      qryWorkD_XYKBH.Value := AXykbh;
      lblMc.Caption        := AXykmc;
    end
    else
      dbcXykbh.SetFocus;
  end
  else
    lblMC.Caption := AXykmc;
end;

procedure TYdxxForm.dbcKhbhExit(Sender: TObject);
var
  AKhbh,AKhmc: string;
begin
  inherited;
  AKhmc := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',qryWorkD_KHBH.Value);
  if AKhmc='' then
  begin
    AKhmc := GetMc(dbcKhbh.Items[dbcKhbh.ItemIndex]);
    AKhbh := HotelData.FindBh('KHDA','D_KHBH','D_KHMC',AKhmc);
    if AKhbh<>'' then
    begin
      qryWorkD_KHBH.Value := AKhbh;
      lblMc.Caption       := AKhmc;
    end
    else
      dbcKhbh.SetFocus;
  end
  else
    lblMc.Caption := AKhmc;
end;

procedure TYdxxForm.dbcFkfsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = '1' then qryWorkD_FKFS.Value := '人民币'
  else
  if Key = '2' then qryWorkD_FKFS.Value := '信用卡'
  else
  if Key = '3' then qryWorkD_FKFS.Value := '支票'
  else
  if Key = '4' then qryWorkD_FKFS.Value := '记帐';
end;

//取消
procedure TYdxxForm.btnCancClick(Sender: TObject);
begin
  inherited;
  qryWork.Cancel;
end;

//确认
procedure TYdxxForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if qryWorkD_KRXM.Value = '' then
  begin
    ShowWarning('请输入客人姓名！');
    Exit;
  end;
  if qryWorkD_LXR.Value = '' then
  begin
    ShowWarning('请输入宾馆联系人！');
    Exit;
  end;

  HotelData.DatabaseUser.StartTransaction;
  try
    qryWork.Post;
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  Close;
end;

procedure TYdxxForm.qryWorkBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_KRBH.Value := HotelData.GetBh('D_KRBH',PREV_KRBH);
end;

procedure TYdxxForm.qryWorkNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_FKFS.Value := FKFS_RMB;
end;

end.
