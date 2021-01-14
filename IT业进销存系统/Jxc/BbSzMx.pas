unit BbSzMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbSzMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labBH: TLabel;
    labMC: TLabel;
    labTj: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    aDj: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intSRZCLBID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbSzMx: TfrmBbSzMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbSzMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' жа ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, MC from SRZCLB where ID = ' + Float2Str(intSRZCLBID);
    Open;
    labBH.Caption := Fields[0].AsString;
    labMC.Caption := Fields[1].AsString;
    Close;
  end;
  inherited;
end;

procedure TfrmBbSzMx.IniRecord;
begin
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, M.JEA, M.JEB ' +
    'from (' + GetSqlSzmx(dteRQA, dteRQB, intSRZCLBID) + ') as M ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbSzMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbSzMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

end.
