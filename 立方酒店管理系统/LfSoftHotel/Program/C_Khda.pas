unit C_Khda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Xtdy, DosMove, DB, DBTables, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls;

type
  TKhdaForm = class(TXtdyForm)
    tblXtdyD_FLMC: TStringField;
    tblXtdyD_KHBH: TStringField;
    tblXtdyD_KHMC: TStringField;
    tblXtdyD_FLBH: TStringField;
    tblXtdyD_DWDZ: TStringField;
    tblXtdyD_FR: TStringField;
    tblXtdyD_LXDH: TStringField;
    tblXtdyD_JDRQ: TDateTimeField;
    tblXtdyD_DM: TStringField;
    qryYsk: TQuery;
    procedure dsXtdyStateChange(Sender: TObject);
    procedure tblXtdyAfterInsert(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgXtdyKeyPress(Sender: TObject; var Key: Char);
    procedure dbgXtdyColEnter(Sender: TObject);
    procedure tblXtdyBeforePost(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
    procedure tblXtdyD_FLBHChange(Sender: TField);
    procedure tblXtdyD_FLBHValidate(Sender: TField);
    procedure tblXtdyBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FKey: string;
    function GetKhbh(const AFlbh: string): string;
  public
    { Public declarations }
  end;

var
  KhdaForm: TKhdaForm;

procedure Khda;

implementation

uses C_Define, C_Sysprint, C_HotelData;

{$R *.dfm}

procedure Khda;
begin
  KhdaForm := TKhdaForm.Create(Application);
  try
    with KhdaForm do
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
    KhdaForm.Free;
  end;
end;


function TKhdaForm.GetKhbh(const AFlbh: string): string;
var
  s : string;
begin
  s := 'select max(D_KHBH) from KHDA where D_FLBH="'+AFlbh+'"';
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
    if Fields[0].IsNull then Result := AFlbh+'001'
    else Result := IntToStr(Fields[0].AsInteger+1);
    Close;
  end;
end;

procedure TKhdaForm.dsXtdyStateChange(Sender: TObject);
begin
  inherited;
  dbgXtdy.Columns[1].ReadOnly := not (tblXtdy.State = dsInsert);
end;

procedure TKhdaForm.tblXtdyAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblXtdyD_JDRQ.Value := Date;
end;

procedure TKhdaForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '客户档案';
  APrintStru.ADataSet := tblXtdy;
  PrintLb(APrintStru,dbgXtdy);
end;

procedure TKhdaForm.dbgXtdyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if dbgXtdy.SelectedIndex=0 then
  begin
    if Ord(Key)=VK_BACK then FKey := ''
    else
    begin
      FKey := FKey + Key;
      if HotelData.tblFLDM.Locate('D_DM',FKey,[loPartialKey]) then
      begin
        tblXtdy.Edit;
        tblXtdyD_FLBH.Value := HotelData.tblFLDM.FieldByName('D_FLBH').AsString;
      end;
    end;
  end;
end;

procedure TKhdaForm.dbgXtdyColEnter(Sender: TObject);
begin
  inherited;
  if dbgXtdy.SelectedIndex=0 then FKey := '';
end;

procedure TKhdaForm.tblXtdyBeforePost(DataSet: TDataSet);
begin
  if HotelData.FindBh('KHDA','D_KHBH','D_KHMC',tblXtdyD_KHMC.Value)<>'' then
  begin
    ShowMessage('该客户名称已经存在！');
    Abort;
  end;
  if tblXtdyD_DM.Value = '' then
    tblXtdyD_DM.Value := GetIndexStr(tblXtdyD_KHMC.Value);
end;

procedure TKhdaForm.btnLocaClick(Sender: TObject);
begin
  case cmbOption.ItemIndex of
    0:
    begin
      tblXtdy.Filter := 'D_KHBH='''+edtValue.Text+'*''';
      tblXtdy.Filtered := True;
    end;
    1:
    begin
      tblXtdy.Filter := 'D_KHMC='''+edtValue.Text+'*''';
      tblXtdy.Filtered := True;
    end;
  end;

end;

procedure TKhdaForm.tblXtdyD_FLBHChange(Sender: TField);
begin
  inherited;
  tblXtdyD_KHBH.Value := GetKhbh(tblXtdyD_FLBH.Value);
  tblXtdyD_DM.Value   := tblXtdyD_KHBH.Value;
end;

procedure TKhdaForm.tblXtdyD_FLBHValidate(Sender: TField);
begin
  inherited;
  if tblXtdyD_FLBH.Value='' then
    raise Exception.Create('请选择客户分类！');
end;

procedure TKhdaForm.tblXtdyBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  with qryYsk do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from YSK where D_KHBH="'+tblXtdyD_KHBH.Value+'"');
    Prepare;
    Open;
    if not IsEmpty then
    begin
      ShowMessage('该客户还有应收款，你不能删除！');
      Abort;
    end;
  end;
end;

end.
