unit C_StandDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, StdCtrls, Buttons, ExtCtrls, DBCtrls, DBNavPlus, DB,
  DBTables, DosMove;

type
  TStandDbForm = class(TStandForm)
    DBNavPlus1: TDBNavPlus;
    qryWork: TQuery;
    dsWork: TDataSource;
    btnPrint: TBitBtn;
    Bevel1: TBevel;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    DBNavPlus2: TDBNavPlus;
    lblState: TStaticText;
    procedure dsWorkStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryWorkBeforeDelete(DataSet: TDataSet);
    procedure qryWorkPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StandDbForm: TStandDbForm;

implementation

uses C_Define;

{$R *.dfm}

procedure TStandDbForm.dsWorkStateChange(Sender: TObject);
begin
  inherited;
  btnClose.Enabled := qryWork.State = dsBrowse;
  btnPrint.Enabled := btnClose.Enabled;
  btnLoca.Enabled  := btnClose.Enabled;
  DBNavPlus1.Enabled := btnClose.Enabled;
  case qryWork.State of
    dsInsert:
    begin
      lblState.Caption := '增加';
      lblState.Font.Color := clRed;
    end;
    dsEdit  :
    begin
      lblState.Caption := '修改';
      lblState.Font.Color := clBlue;
    end;
    dsBrowse:
    begin
      lblState.Caption := '浏览';
      lblState.Font.Color := clGreen;
    end;
    else      lblState.Caption := '';
  end;
end;

procedure TStandDbForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := qryWork.State = dsBrowse;
end;

procedure TStandDbForm.qryWorkBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not Confirm('你确认删除吗？') then
    Abort;
end;

procedure TStandDbForm.qryWorkPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  iDBIError: Integer;
begin
  inherited;
  if (E is EDBEngineError) then
  begin
    iDBIError := (E as EDBEngineError).Errors[0].ErrorCode;
    case iDBIError of
      eKeyViol: raise Exception.Create('编号必须唯一！');
      eRequiredFieldMissing: raise Exception.Create('数据不全！');
    end;
  end;
end;

end.
