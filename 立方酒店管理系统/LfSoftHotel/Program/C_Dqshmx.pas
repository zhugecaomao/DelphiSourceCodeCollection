unit C_Dqshmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TDqshmxForm = class(TStdBrowForm)
    qryWorkD_JZBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFGG: TStringField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_YJJE: TFloatField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZFS: TStringField;
    qryWorkD_JZLX: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_BMBH: TStringField;
    qryWorkD_XMMC: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DqshmxForm: TDqshmxForm;

procedure Dqshmx(const ASqlStr: string);

implementation

uses C_HotelData;

{$R *.dfm}
procedure Dqshmx(const ASqlStr: string);
begin
  DqshmxForm := TDqshmxForm.Create(Application);
  try
    with DqshmxForm do
    begin
      qryWork.Close;
      qryWork.SQL.Clear;
      qryWork.SQL.Add(ASqlStr);
      qryWork.Prepare;
      qryWork.Open;
      ShowModal;
    end;
  finally
    DqshmxForm.qryWork.Close;
    DqshmxForm.Free;
  end;
end;

end.
