{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Fjbg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TFjbgForm = class(TStdBrowForm)
    qryKrzd: TQuery;
    tblKfzt: TTable;
    tblKfztD_KFBH: TStringField;
    tblKfztD_ZDBH: TStringField;
    tblKfztD_KRBH: TStringField;
    tblKfztD_YJBH: TStringField;
    tblKfztD_SJFJ: TFloatField;
    tblKfztD_KFZT: TStringField;
    tblKfztD_KFBZ: TStringField;
    tblKfztD_KRSL: TIntegerField;
    tblKfztD_DHKT: TStringField;
    tblKfztD_BZFJ: TFloatField;
    tblKfztD_CWS: TIntegerField;
    tblKfztD_BJS: TIntegerField;
    tblKfztD_QJS: TIntegerField;
    tblKfztD_JJFJ: TFloatField;
    tblKfztD_FXBH: TStringField;
    tblKfztD_LCBH: TStringField;
    tblKfztD_KRXM: TStringField;
    tblBqj: TTable;
    procedure tblKfztBeforeDelete(DataSet: TDataSet);
    procedure tblKfztBeforeInsert(DataSet: TDataSet);
    procedure tblKfztBeforePost(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateKrzd(const AKfbh: string;ASjfj: Currency);
  public
    { Public declarations }
  end;

var
  FjbgForm: TFjbgForm;

procedure Fjbg;

implementation

uses C_HotelData;

{$R *.dfm}

//房价变更
procedure Fjbg;
begin
  FjbgForm := TFjbgForm.Create(Application);
  try
    with FjbgForm do
    begin
      try
        tblKfzt.Open;
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

      ShowModal;
    end;
  finally
    FjbgForm.tblKfzt.Close;
    FjbgForm.Free;
  end;
end;

//修改帐单中的实际房价
procedure TFjbgForm.UpdateKrzd(const AKfbh: string;ASjfj: Currency);
begin
  if qryKrzd.Active then qryKrzd.Active := False;
  qryKrzd.Params[0].Value := AKfbh;

  try
    qryKrzd.Open;
    tblBqj.Open;
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

  //事务提交
  HotelData.DatabaseUser.StartTransaction;

  try
    qryKrzd.First;
    while not qryKrzd.Eof do
    begin
      qryKrzd.Edit;
      qryKrzd.FieldByName('D_SJFJ').AsCurrency := ASjfj;
      qryKrzd.Post;
      qryKrzd.Next;
    end;

    if tblBqj.Locate('D_KFBH',AKfbh,[]) then
    begin
      tblBqj.Edit;
      tblBqj.FieldByName('D_SJFJ').AsCurrency := ASjfj;
      tblBqj.Post;
    end;

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  qryKrzd.Close;
  tblBqj.Close;
end;


procedure TFjbgForm.tblKfztBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TFjbgForm.tblKfztBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TFjbgForm.tblKfztBeforePost(DataSet: TDataSet);
begin
  inherited;
  UpdateKrzd(tblKfztD_KFBH.Value,tblKfztD_SJFJ.Value);
end;

procedure TFjbgForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if tblKfzt.Locate('D_KFBH',edtValue.Text,[]) then
    DBGrid1.SetFocus;
end;

end.
