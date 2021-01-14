unit C_Cwjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,
  DB, DBTables, C_Define;

type
  TCwjsForm = class(TStdJdForm)
    qryCwjs: TQuery;
    dsCwjs: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    qryCwjsD_YSRQ: TStringField;
    qryCwjsD_JSLX: TStringField;
    qryCwjsD_RMB: TFloatField;
    qryCwjsD_XYK: TFloatField;
    qryCwjsD_ZP: TFloatField;
    qryCwjsD_CZYXM: TStringField;
    qryCwjsD_LRRQ: TDateTimeField;
    qryCwjsD_LRSJ: TDateTimeField;
    btnQuery: TBitBtn;
    procedure qryCwjsNewRecord(DataSet: TDataSet);
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
    FJslx: string;
    procedure ShowJs(const AJslx: string);
  public
    { Public declarations }
  end;

var
  CwjsForm: TCwjsForm;

procedure Cwjs(const AJslx: string);

implementation

uses C_HotelData, C_CwjsBrow;

{$R *.dfm}

procedure Cwjs(const AJslx: string);
begin
  CwjsForm := TCwjsForm.Create(Application);
  try
    with CwjsForm do
    begin
      FJslx := AJslx;
      ShowJs(FJslx);

      try
        qryCwjs.Open;
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

      qryCwjs.Insert;
      ShowModal;
    end;
  finally
    CwjsForm.qryCwjs.Close;
    CwjsForm.Free;
  end;
end;

procedure TCwjsForm.ShowJs(const AJslx: string);
begin
  if AJslx=JSLX_CWSJ then
    lblTitile.Caption := '财务上交'
  else
  if AJslx=JSLX_CTSJ then
    lblTitile.Caption := '餐厅上交'
  else
  if AJslx=JSLX_YJSJ then
    lblTitile.Caption := '预交款上交';
  qryCwjs.Params[0].Value := AJslx;
end;

procedure TCwjsForm.qryCwjsNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryCwjsD_LRRQ.Value := Date;
  qryCwjsD_LRSJ.Value := Time;
  qryCwjsD_JSLX.Value := FJslx;
  qryCwjsD_CZYXM.Value:= CZY.CzyXm;
end;

procedure TCwjsForm.btnCancClick(Sender: TObject);
begin
  inherited;
  qryCwjs.Cancel;
end;

procedure TCwjsForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not Confirm('你确认吗？') then
    Exit;

  HotelData.DatabaseUser.StartTransaction;
  try
    qryCwjs.Post;
    if FJslx=JSLX_YJSJ then
    begin
      HotelData.InsertYjk(YJLX_SJ,YJBZ_SJ,qryCwjsD_RMB.AsCurrency,qryCwjsD_XYK.AsCurrency,qryCwjsD_ZP.AsCurrency);
    end;
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  Close;
end;

procedure TCwjsForm.btnQueryClick(Sender: TObject);
begin
  inherited;
  CwjsBrow(FJslx);
end;

end.
