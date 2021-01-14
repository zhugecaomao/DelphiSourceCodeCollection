unit C_Tdyfcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TTdyfcxForm = class(TStdBrowForm)
    edtTdmc: TLabeledEdit;
    qryWorkD_ZDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_ZDLB: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YJBH: TStringField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_SJFJ: TFloatField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_XFRQ: TDateTimeField;
    qryWorkD_XFSJ: TDateTimeField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_JZBZ: TStringField;
    qryWorkD_JSBZ: TStringField;
    qryWorkD_DLR1: TStringField;
    qryWorkD_DLR2: TStringField;
    qryWorkD_DLR3: TStringField;
    qryWorkD_DLR4: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_JZYXM: TStringField;
    qryWorkD_TYR: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    qryWorkD_JZBH: TStringField;
    procedure qryWorkD_JZBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnPrintClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TdyfcxForm: TTdyfcxForm;

procedure Tdyfcx(const AKrbh: string);

implementation

uses C_HotelData, C_Sysprint;

{$R *.dfm}

procedure Tdyfcx(const AKrbh: string);
begin
  TdyfcxForm := TTdyfcxForm.Create(Application);
  try
    with TdyfcxForm do
    begin
      edtTdmc.Text := HotelData.FindUserBh('KRXX','D_KRXM','D_KRBH',AKrbh);
      qryWork.Params[0].AsString := AKrbh;
      qryWork.Open;
      ShowModal;
    end;
  finally
    TdyfcxForm.qryWork.Close;
    TdyfcxForm.Free;
  end;
end;

procedure TTdyfcxForm.qryWorkD_JZBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString = JZ_YES then
      Text := '已退房'
    else
      Text := '';
  end;
end;

procedure TTdyfcxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := edtTdmc.Text + '用房情况';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TTdyfcxForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryWorkD_JZBZ.Value  = JZ_YES then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
