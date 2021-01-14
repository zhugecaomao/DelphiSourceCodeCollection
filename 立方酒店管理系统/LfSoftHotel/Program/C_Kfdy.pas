unit C_Kfdy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Xtdy, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TKfdyForm = class(TXtdyForm)
    tblXtdyD_FXMC: TStringField;
    tblXtdyD_LCMC: TStringField;
    tblKfzt: TTable;
    tblXtdyD_KFBH: TStringField;
    tblXtdyD_KFMC: TStringField;
    tblXtdyD_BZFJ: TFloatField;
    tblXtdyD_FXBH: TStringField;
    tblXtdyD_LCBH: TStringField;
    tblXtdyD_CWS: TIntegerField;
    procedure tblXtdyD_CWSValidate(Sender: TField);
    procedure tblXtdyAfterPost(DataSet: TDataSet);
    procedure tblXtdyBeforeDelete(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgXtdyKeyPress(Sender: TObject; var Key: Char);
    procedure dbgXtdyColEnter(Sender: TObject);
  private
    { Private declarations }
    FKey : string;
  public
    { Public declarations }
  end;

var
  KfdyForm: TKfdyForm;

procedure Kfdy;

implementation

uses C_Define, C_Sysprint, C_HotelData;

{$R *.dfm}

procedure Kfdy;
begin
  KfdyForm := TKfdyForm.Create(Application);
  try
    with KfdyForm do
    begin
      try
        tblXtdy.Open;
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
    KfdyForm.Free;
  end;
end;

procedure TKfdyForm.tblXtdyD_CWSValidate(Sender: TField);
begin
  inherited;
  if (Sender.AsInteger<=0) or (Sender.AsInteger>MAX_CWS) then
    raise Exception.Create('床位数设置错误！');
end;

procedure TKfdyForm.tblXtdyAfterPost(DataSet: TDataSet);
begin
  inherited;
  try
    with tblKfzt do
    begin
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

      if FindKey([tblXtdyD_KFBH.Value]) then
        Edit
      else
      begin
        Insert;
        FieldByName('D_KFBH').AsString   := tblXtdyD_KFBH.Value;
        FieldByName('D_KFZT').AsString   := KFZT_OK;
      end;

      //debug
      //FieldByName('D_KFBH').AsString   := tblXtdyD_KFBH.Value;

      FieldByName('D_FXBH').AsString   := tblXtdyD_FXBH.Value;
      FieldByName('D_LCBH').AsString   := tblXtdyD_LCBH.Value;
      FieldByName('D_BZFJ').AsCurrency := tblXtdyD_BZFJ.Value;
      FieldByName('D_CWS').AsInteger   := tblXtdyD_CWS.Value;
      Post;
    end;
  finally
    tblKfzt.Close;
  end;
end;

procedure TKfdyForm.tblXtdyBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  try
    with tblKfzt do
    begin
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

      if FindKey([tblXtdyD_KFBH.Value]) then
        if FieldByName('D_KFZT').AsString <> KFZT_OK then
          raise Exception.Create('该客房不是OK房，你不能删除！')
        else
          Delete;
    end;
  finally
    tblKfzt.Close;
  end;
end;

procedure TKfdyForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客户档案';
  APrintStru.ADataSet := tblXtdy;
  PrintLb(APrintStru,dbgXtdy);
end;

procedure TKfdyForm.dbgXtdyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if dbgXtdy.SelectedIndex=3 then
  begin
    if Ord(Key)=VK_BACK then FKey := ''
    else
    begin
      FKey := FKey + Key;
      if HotelData.tblFXDM.Locate('D_DM',FKey,[loPartialKey]) then
      begin
        tblXtdy.Edit;
        tblXtdyD_FXBH.Value := HotelData.tblFXDM.FieldByName('D_FXBH').AsString;
      end;
    end;
  end;
  if dbgXtdy.SelectedIndex=4 then
  begin
    if Ord(Key)=VK_BACK then FKey := ''
    else
    begin
      FKey := FKey + Key;
      if HotelData.tblLCDM.Locate('D_DM',FKey,[loPartialKey]) then
      begin
        tblXtdy.Edit;
        tblXtdyD_LCBH.Value := HotelData.tblLCDM.FieldByName('D_LCBH').AsString;
      end;
    end;
  end;
end;

procedure TKfdyForm.dbgXtdyColEnter(Sender: TObject);
begin
  inherited;
  if dbgXtdy.SelectedIndex=3 then FKey := '';
  if dbgXtdy.SelectedIndex=4 then FKey := '';
end;

end.
