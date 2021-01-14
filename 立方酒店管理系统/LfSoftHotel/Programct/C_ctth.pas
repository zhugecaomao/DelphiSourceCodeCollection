unit C_ctth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DosMove, DB, Grids, DBGrids, DBTables, StdCtrls,
  Buttons, C_CtDefine;

type
  TCtthForm = class(TForm)
    DosMove1: TDosMove;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnClose: TBitBtn;
    tblCtdm: TTable;
    dsCtdm: TDataSource;
    DBGrid1: TDBGrid;
    tblCtzt: TTable;
    btnPrint: TBitBtn;
    tblCtdmD_CTBH: TStringField;
    tblCtdmD_CTLB: TStringField;
    tblCtdmD_CTMC: TStringField;
    tblCtdmD_DM: TStringField;
    tblCtztD_CTBH: TStringField;
    tblCtztD_CTMC: TStringField;
    tblCtztD_CTZT: TStringField;
    tblCtztD_DCBH: TStringField;
    tblCtztD_KRXM: TStringField;
    tblCtztD_KRSL: TIntegerField;
    tblCtztD_XFRQ: TDateTimeField;
    tblCtztD_XFSJ: TDateTimeField;
    tblCtztD_JZRQ: TDateTimeField;
    tblCtztD_JZSJ: TDateTimeField;
    procedure tblCtdmAfterPost(DataSet: TDataSet);
    procedure dsCtdmStateChange(Sender: TObject);
    procedure tblCtdmNewRecord(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure tblCtdmBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure UpdateCtzt(const ACtbh: string);
  public
    { Public declarations }
  end;

var
  CtthForm: TCtthForm;

procedure CtthDy;

implementation

{$R *.dfm}

procedure CtthDy;
begin
  CtthForm := TCtthForm.Create(Application);
  try
    with CtthForm do
    begin
      tblCtdm.Open;
      tblCtzt.Open;
      ShowModal;
    end;

  finally
    CtthForm.tblCtzt.Close;
    CtthForm.tblCtdm.Close;
    CtthForm.Free;
  end;
end;

procedure TCtthForm.UpdateCtzt(const ACtbh: string);
begin
  if not tblCtzt.FindKey([ACtbh]) then
  begin
    tblCtzt.Insert;
    tblCtztD_CTBH.Value := ACtbh;
    tblCtztD_CTZT.Value := CTZT_OK;
    tblCtztD_CTMC.Value := tblCtdmD_CTMC.Value;
    tblCtzt.Post;
  end;
end;

procedure TCtthForm.tblCtdmAfterPost(DataSet: TDataSet);
begin
  if tblCtdmD_CTLB.Value = CTLB_TH then
    UpdateCtzt(tblCtdmD_CTBH.Value);
end;

procedure TCtthForm.dsCtdmStateChange(Sender: TObject);
begin
  btnClose.Enabled := tblCtdm.State = dsBrowse;
  DBGrid1.Columns[1].ReadOnly := not (tblCtdm.State = dsInsert);
end;

procedure TCtthForm.tblCtdmNewRecord(DataSet: TDataSet);
begin
  tblCtdmD_CTLB.Value := CTLB_TH;
end;

procedure TCtthForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if tblCtdmD_CTLB.Value = CTLB_CT then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TCtthForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ADataSet := tblCtdm;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TCtthForm.tblCtdmBeforeDelete(DataSet: TDataSet);
begin
  if Confirm('你确认删除该餐台吗？') then
  begin
    if tblCtzt.Locate('D_CTBH',tblCtdmD_CTBH.Value,[]) then
    begin
      if tblCtztD_CTZT.Value = CTZT_OK then
        tblCtzt.Delete
      else
      begin
        ShowWarning('该餐台正在使用中，你不能删除！');
        Abort;
      end;
    end;
  end
  else
    Abort;
end;

end.
