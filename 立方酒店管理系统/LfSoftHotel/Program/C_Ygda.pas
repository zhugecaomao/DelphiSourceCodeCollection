unit C_Ygda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Xtdy, DosMove, DB, DBTables, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls;

type
  TYgdaForm = class(TXtdyForm)
    tblXtdyD_BMMC: TStringField;
    btnQx: TBitBtn;
    btnKl: TBitBtn;
    tblXtdyD_YGBH: TStringField;
    tblXtdyD_YGXM: TStringField;
    tblXtdyD_BMBH: TStringField;
    tblXtdyD_KL: TStringField;
    tblXtdyD_DM: TStringField;
    procedure dsXtdyStateChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnKlClick(Sender: TObject);
    procedure btnQxClick(Sender: TObject);
    procedure tblXtdyBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YgdaForm: TYgdaForm;

procedure Ygda;

implementation

uses C_Define, C_Sysprint, C_HotelData, C_Klsz, C_Ygqx;

{$R *.dfm}

procedure Ygda;
begin
  YgdaForm := TYgdaForm.Create(Application);
  try
    with YgdaForm do
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
    YgdaForm.Free;
  end;
end;

procedure TYgdaForm.dsXtdyStateChange(Sender: TObject);
begin
  inherited;
  btnKl.Enabled := tblXtdy.State = dsBrowse;
  btnQx.Enabled := tblXtdy.State = dsBrowse;
end;

procedure TYgdaForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '员工档案';
  APrintStru.ADataSet := tblXtdy;
  PrintLb(APrintStru,dbgXtdy);
end;

procedure TYgdaForm.btnKlClick(Sender: TObject);
begin
  inherited;
  Klsz(tblXtdyD_YGBH.Value);
end;

procedure TYgdaForm.btnQxClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'操作权限') then Exit;  
  if tblXtdyD_YGBH.Value <> SYSTEM_BH then
    Ygqx(tblXtdyD_YGBH.Value,tblXtdyD_YGXM.Value);
end;

procedure TYgdaForm.tblXtdyBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if tblXtdyD_YGBH.Value = SYSTEM_BH then Abort;
end;

end.
