unit C_cddm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables,
  DosMove, C_CtDefine;

type
  TCddmForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnClose: TBitBtn;
    tblCddm: TTable;
    DBGrid1: TDBGrid;
    dsCddm: TDataSource;
    DosMove1: TDosMove;
    tblCddmD_XMMC: TStringField;
    btnPrint: TBitBtn;
    tblCddmD_CDBH: TStringField;
    tblCddmD_MJ: TStringField;
    tblCddmD_CDMC: TStringField;
    tblCddmD_XMBH: TStringField;
    tblCddmD_DJ1: TFloatField;
    tblCddmD_DJ2: TFloatField;
    tblCddmD_DJ3: TFloatField;
    tblCddmD_DM: TStringField;
    tblCddmD_BZ: TStringField;
    procedure dsCddmStateChange(Sender: TObject);
    procedure tblCddmNewRecord(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure tblCddmBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CddmForm: TCddmForm;

procedure Cddmdy;

implementation

uses C_CtData, C_Sysprint, hzpy;

{$R *.dfm}

procedure Cddmdy;
begin
  CddmForm := TCddmForm.Create(Application);
  try
    with CddmForm do
    begin
      tblCddm.Open;
      ShowModal;
    end;
  finally
    CddmForm.tblCddm.Close;
    CddmForm.Free;
  end;
end;

procedure TCddmForm.dsCddmStateChange(Sender: TObject);
begin
  btnClose.Enabled := tblCddm.State = dsBrowse;
  //DBGrid1.Columns[1].ReadOnly := not (tblCddm.State = dsInsert);
end;

procedure TCddmForm.tblCddmNewRecord(DataSet: TDataSet);
begin
  tblCddmD_MJ.Value := 'T';
end;

procedure TCddmForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if tblCddmD_MJ.Value = 'F' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TCddmForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '菜单代码';
  APrintStru.ADataSet := tblCddm;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TCddmForm.tblCddmBeforePost(DataSet: TDataSet);
begin
  if tblCddmD_DM.Value = '' then
    tblCddmD_DM.Value := GetPy1(tblCddmD_CDMC.Value);
  if tblCddmD_XMBH.IsNull then
  begin
    ShowInfo('必须定义项目类别！');
    Abort;
  end;
end;

end.
