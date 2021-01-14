unit C_Ygqx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DB, DBTables, C_Define;

type
  TYgqxForm = class(TStdJdForm)
    qryYgqx: TQuery;
    dsYgqx: TDataSource;
    DBGrid1: TDBGrid;
    lblYg: TLabel;
    tblCzxm: TTable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryYgqxD_YGBH: TStringField;
    qryYgqxD_CZBH: TStringField;
    qryYgqxD_CZXM: TStringField;
    qryYgqxD_QX: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    FYgbh: string;
    procedure AddYgqx;
  public
    { Public declarations }
  end;

var
  YgqxForm: TYgqxForm;

procedure Ygqx(const AYgbh,AYgxm: string);

implementation

uses C_HotelData;

{$R *.dfm}

procedure Ygqx(const AYgbh,AYgxm: string);
begin
  YgqxForm := TYgqxForm.Create(Application);
  try
    with YgqxForm do
    begin
      FYgbh := AYgbh;
      lblYg.Caption := '员工编号：'+AYgbh+'  员工姓名：'+AYgxm;

      if qryYgqx.Active then qryYgqx.Active := False;
      qryYgqx.ParamByName('YGBH').AsString := FYgbh;

      try
        qryYgqx.Open;
        tblCzxm.Open;
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

      AddYgqx;

      ShowModal;
    end;
  finally
    YgqxForm.qryYgqx.Close;
    YgqxForm.tblCzxm.Close;
    YgqxForm.Free;
  end;
end;

procedure TYgqxForm.AddYgqx;
begin
  with qryYgqx do
  begin
    tblCzxm.First;
    while not tblCzxm.Eof do
    begin
      if not Locate('D_CZBH',tblCzxm.FieldByName('D_CZBH').AsString,[]) then
      begin
        Append;
        FieldByName('D_YGBH').AsString := FYgbh;
        FieldByName('D_CZBH').AsString := tblCzxm.FieldByName('D_CZBH').AsString;
        FieldByName('D_CZXM').AsString := tblCzxm.FieldByName('D_CZXM').AsString;
        Post;
      end;
      tblCzxm.Next;
    end;
  end;
end;

procedure TYgqxForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  with qryYgqx do
  begin
    Edit;
    if qryYgqxD_QX.Value = 'T' then qryYgqxD_QX.Value := 'F'
    else
      qryYgqxD_QX.Value := 'T';
    Post;
  end;
end;

procedure TYgqxForm.btnCancClick(Sender: TObject);
begin
  inherited;
  qryYgqx.CancelUpdates;
end;

//确认
procedure TYgqxForm.btnOKClick(Sender: TObject);
begin
  inherited;
  HotelData.DatabaseUser.StartTransaction;
  try
    qryYgqx.ApplyUpdates;
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  qryYgqx.CommitUpdates;
  Close;
end;

procedure TYgqxForm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  with qryYgqx do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      Edit;
      qryYgqxD_QX.Value := 'T';
      Post;
      Next;
    end;
    EnableControls;
  end;
end;

procedure TYgqxForm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with qryYgqx do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      Edit;
      qryYgqxD_QX.Value := 'F';
      Post;
      Next;
    end;
    EnableControls;
  end;
end;

end.
