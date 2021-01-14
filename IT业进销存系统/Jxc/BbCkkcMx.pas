unit BbCkkcMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbCkkcMx = class(TfrmComMx)
    labTj: TLabel;
    aDj: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label4: TLabel;
    labHPBH: TLabel;
    Label5: TLabel;
    labHPPM: TLabel;
    Label15: TLabel;
    labHPDW: TLabel;
    Label10: TLabel;
    labSLB: TLabel;
    Label17: TLabel;
    labJEB: TLabel;
    Label19: TLabel;
    labSLC: TLabel;
    Label21: TLabel;
    labJEC: TLabel;
    Bevel2: TBevel;
    labCK: TLabel;
    Label24: TLabel;
    Label6: TLabel;
    labSLA: TLabel;
    Label8: TLabel;
    labJEA: TLabel;
    Label13: TLabel;
    labSLD: TLabel;
    Label14: TLabel;
    labJED: TLabel;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intCKID: integer;
    intHPID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbCkkcMx: TfrmBbCkkcMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbCkkcMx.FormShow(Sender: TObject);
begin
  if intCKID <> 0 then
    labCK.Caption := GetFieldValue('select MC from CK where ID = ' + IntToStr(intCKID))
  else
    labCK.Caption := 'È«²¿²Ö¿â';
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' ÖÁ ' +
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

procedure TfrmBbCkkcMx.IniRecord;
var
  SLA, SLB, SLC, SLD, JEA, JEB, JEC, JED: double;
  strSumQC, strSumBQ: string;
  D1: string;
begin
  //QC
  strSumQc := 'iif(RQ < #%s#, %s, 0)';
  strSumBq := 'iif(M.JCLX = %d and RQ>=#%s#, %s, 0)';
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  with CurDs do
  begin
    CommandText :=
      'select QCS1, QCJE1 ' +
      'from (' + GetSqlHpqc(intCKID, intHPID) + ') M';
    Open;
    SLA := Fields[0].AsFloat;
    JEA := Fields[1].AsFloat;
    Close;
    CommandText :=
      'select ' +
      'sum(' + Format(strSumQC, [D1, 'SL1']) + ') as QCJCSL, ' +
      'sum(' + Format(strSumQC, [D1, 'SL1 * DJ1']) + ') as QCJCJE, ' +
      'sum(' + Format(strSumBQ, [1, D1, 'SL1']) + ') as BQSRSL, ' +
      'sum(' + Format(strSumBQ, [1, D1, 'SL1 * DJ1']) + ') as BQSRJE, ' +
      'sum(' + Format(strSumBQ, [2, D1, 'SL1']) + ') as BQFCSL, ' +
      'sum(' + Format(strSumBQ, [2, D1, 'SL1 * DJ1']) + ') as BQFCJE ' +
      'from (' + GetSqlJcmx(0, dteRQB, intCKID, intHPID) + ') M';
    Open;
    SLA := SLA + Fields[0].AsFloat;
    JEA := JEA + Fields[1].AsFloat;
    SLB := Fields[2].AsFloat;
    JEB := Fields[3].AsFloat;
    SLC := - Fields[4].AsFloat;
    JEC := - Fields[5].AsFloat;
    SLD := SLA + SLB - SLC;
    JED := JEA + JEB - JEC;
    Close;
  end;
  labSLA.Caption := FormatFloat('#,0.00', SLA);
  labJEA.Caption := FormatFloat('#,0.00', JEA);
{  labSLB.Caption := FormatFloat('#,0.00', SLB);
  labJEB.Caption := FormatFloat('#,0.00', JEB);
  labSLC.Caption := FormatFloat('#,0.00', SLC);
  labJEC.Caption := FormatFloat('#,0.00', JEC);}
  labSLD.Caption := FormatFloat('#,0.00', SLD);
  labJED.Caption := FormatFloat('#,0.00', JED);
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, M.MC1, M.DJ1, M.SL1 as JYSL, M.JE1 as JYJE, ' +
    'iif(M.JCLX = 1, M.SL1, 0) as SLA, iif(M.JCLX = 1, M.JE1, 0) as JEA, ' +
    'iif(M.JCLX = 2, -M.SL1, 0) as SLB, iif(M.JCLX = 2, M.JE1, 0) as JEB ' +
    'from (' + GetSqlJcmx(dteRQA, dteRQB, intCKID, intHPID) + ') as M ' +
    'order by M.RQ';
  inherited;
  //JYJE
  SLD := SLA;
  JED := JEA;
  with dsMx do
  begin
    while not Eof do
    begin
      SLD := SLD + FieldByName('SLA').AsFloat - FieldByName('SLB').AsFloat;
      JED := JED + FieldByName('JEA').AsFloat - FieldByName('JEB').AsFloat;
      dsMx.Edit;
      dsMx['JYSL'] := SLD;
      dsMx['JYJE'] := JED;
      Next;
    end;
    First;
  end;
end;

procedure TfrmBbCkkcMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbCkkcMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbCkkcMx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsMx.CancelUpdates;
  inherited;
end;

end.
