unit BbYwXsMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbYwXsMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labHPBH: TLabel;
    labHPPM: TLabel;
    labTj: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    aDj: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    labHPDW: TLabel;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intHPID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbYwXsMx: TfrmBbYwXsMx;

implementation

uses DmTjb, Common, ComFun, MyLib;

{$R *.DFM}

{ TfrmBbKhXsMx }

procedure TfrmBbYwXsMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' жа ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, PM, DW from HP where ID = ' + Float2Str(intHPID);
    Open;
    labHPBH.Caption := Fields[0].AsString;
    labHPPM.Caption := Fields[1].AsString;
    labHPDW.Caption := Fields[2].AsString;
    Close;
  end;
  inherited;
end;

procedure TfrmBbYwXsMx.IniRecord;
begin
  dsMx.CommandText :=
    'select M.ZBID, Z.RQ, Z.DJBH, K.BH, K.MC, M.SL, M.DJ, M.NSL, ' +
    'val(format(M.SL * M.DJ, ''0.00'')) as JEA, ' +
    'val(format(M.SL * M.DJ * M.NSL / 100, ''0.00'')) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from XSKDZB Z, XSKD M, KH K ' +
    'where Z.ID = M.ZBID and K.ID = Z.KHID and ' +
    'M.HPID = ' + Float2Str(intHPID) + ' and ' +
    'Z.RQ between #' + FormatDateTime('yyyy-mm-dd', dteRQA) + '# and ' +
    '#' + FormatDateTime('yyyy-mm-dd', dteRQB) + '# ' +
    'order by M.RQ, Z.DJBH';
  inherited;
end;

procedure TfrmBbYwXsMx.aDjExecute(Sender: TObject);
begin
  OpenXskd(dsMx['ZBID']);
end;

procedure TfrmBbYwXsMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

end.
