unit C_Hmd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Xtdy, DosMove, DB, DBTables, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls;

type
  THmdForm = class(TXtdyForm)
    tblXtdyD_XM: TStringField;
    tblXtdyD_ZJHM: TStringField;
    tblXtdyD_NL: TIntegerField;
    tblXtdyD_LRRQ: TDateTimeField;
    tblXtdyD_JTDZ: TStringField;
    tblXtdyD_BZ: TStringField;
    procedure tblXtdyAfterInsert(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HmdForm: THmdForm;

procedure Hmd;

implementation

uses C_Sysprint, C_Define;

{$R *.dfm}

procedure Hmd;
begin
  HmdForm := THmdForm.Create(Application);
  try
    with HmdForm do
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
    HmdForm.Free;
  end;
end;

procedure THmdForm.tblXtdyAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblXtdyD_LRRQ.Value := Date;
end;

procedure THmdForm.btnLocaClick(Sender: TObject);
var
  LocaFieldName: string;
begin
  if cmbExpress.ItemIndex = 0 then
  begin
    if cmbOption.ItemIndex = 0 then
      LocaFieldName := 'D_XM'
    else
      LocaFieldName := 'D_ZJHM';
    tblXtdy.Locate(LocaFieldName,edtValue.Text,[])
  end;
end;

procedure THmdForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '黑名单';
  APrintStru.ADataSet := tblXtdy;
  PrintLb(APrintStru,dbgXtdy);
end;

end.
