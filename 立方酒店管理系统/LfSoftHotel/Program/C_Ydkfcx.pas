unit C_Ydkfcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define, ComCtrls;

type
  TYdkfcxForm = class(TStdBrowForm)
    qryWorkD_YDBH: TStringField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_YDRQ: TDateTimeField;
    qryWorkD_DDRQ: TDateTimeField;
    qryWorkD_DDSJ: TDateTimeField;
    qryWorkD_LDRQ: TDateTimeField;
    qryWorkD_LDSJ: TDateTimeField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_YDBZ: TStringField;
    qryWorkD_RZBZ: TStringField;
    qryWorkD_JSBZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    dtpDate: TDateTimePicker;
    btnQuery: TBitBtn;
    btnAll: TBitBtn;
    btnYdxg: TBitBtn;
    procedure qryWorkD_RZBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWorkD_YDBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YdkfcxForm: TYdkfcxForm;

procedure Ydkfcx;

implementation

uses C_Ydkfsk, C_Ydkftd, C_Main;

{$R *.dfm}

procedure Ydkfcx;
begin
  YdkfcxForm := TYdkfcxForm.Create(Application);
  try
    with YdkfcxForm do
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

      ShowModal;
    end;
  finally
    YdkfcxForm.qryWork.Close;
    YdkfcxForm.Free;
  end;
end;

procedure TYdkfcxForm.qryWorkD_RZBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsBoolean then Text := '已确认'
    else Text := '';
  end;
end;

procedure TYdkfcxForm.qryWorkD_YDBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString='T' then Text := '团队预定'
    else if Sender.AsString = 'P' then Text := '散客预定'
    else Text := '';
  end;
end;

procedure TYdkfcxForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if qryWork.IsEmpty then Exit;
  if qryWorkD_YDBZ.Value = YDKF_SK then
    YdkfskEdit(qryWorkD_YDBH.Value)
  else
    YdkftdEdit(qryWorkD_KRBH.Value,qryWorkD_YDBH.Value);
  //qryWork.Refresh;
  qryWork.Close;
  qryWork.Open;
  MainForm.ShowYdkf;
end;

procedure TYdkfcxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '预定客房情况一览表';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TYdkfcxForm.btnQueryClick(Sender: TObject);
begin
  inherited;
  qryWork.Filter := 'D_DDRQ='''+FormatDateTime('yyyy-mm-dd',dtpDate.Date)+'''';
  qryWork.Filtered := True;
end;

procedure TYdkfcxForm.btnAllClick(Sender: TObject);
begin
  inherited;
  qryWork.Filter := '';
  qryWork.Filtered := False;
end;

end.
