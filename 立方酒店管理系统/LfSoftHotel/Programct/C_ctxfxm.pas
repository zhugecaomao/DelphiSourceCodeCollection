unit C_ctxfxm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, Grids, DBGrids, DBTables, Buttons,
  DosMove, C_CtDefine;

type
  TCtxfxmForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnClose: TBitBtn;
    tblCtxm: TTable;
    DBGrid1: TDBGrid;
    dsCtxm: TDataSource;
    DosMove1: TDosMove;
    btnPrint: TBitBtn;
    tblCtxmD_XMBH: TStringField;
    tblCtxmD_XMMC: TStringField;
    tblCtxmD_DM: TStringField;
    procedure dsCtxmStateChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CtxfxmForm: TCtxfxmForm;

procedure Ctxfxmdy;

implementation

{$R *.dfm}

procedure Ctxfxmdy;
begin
  CtxfxmForm := TCtxfxmForm.Create(Application);
  try
    with CtxfxmForm do
    begin
      tblCtxm.Open;
      ShowModal;
    end;
  finally
    CtxfxmForm.tblCtxm.Close;
    CtxfxmForm.Free;
  end;
end;

procedure TCtxfxmForm.dsCtxmStateChange(Sender: TObject);
begin
  btnClose.Enabled := tblCtxm.State = dsBrowse;
  DBGrid1.Columns[0].ReadOnly := not (tblCtxm.State = dsInsert);
end;

procedure TCtxfxmForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ADataSet := tblCtxm;
  PrintLb(APrintStru,DBGrid1);
end;

end.
