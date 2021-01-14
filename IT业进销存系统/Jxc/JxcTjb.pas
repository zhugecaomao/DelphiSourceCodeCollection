unit JxcTjb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, TeeProcs, TeEngine, Chart, DBChart, Mask;

type
  TfrmJxcTjb = class(TfrmComTjfx)
    pnlCk: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    aCk: TAction;
    N6: TMenuItem;
    N21: TMenuItem;
    Label9: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    Label21: TLabel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aCkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJxcTjb: TfrmJxcTjb;

implementation

uses Dm, Rqdsz;

{$R *.DFM}

procedure TfrmJxcTjb.FormShow(Sender: TObject);
begin
  labTj.Caption := labTj.Caption +
    FormatDateTime(LongDateFormat, frmRqdsz.dtpRqa.Date) + ' жа ' +
    FormatDateTime(LongDateFormat, frmRqdsz.dtpRqb.Date);
  inherited;
  pnlCk.Visible := aCk.Checked;
end;

procedure TfrmJxcTjb.OpendataSet;
var
  strSqlJc, strSQlBb: string;
  strSumQc, strSumBq: string;
  D1, D2: string;
begin
  D1 := FormatDateTime('yyyy-mm-dd', frmRqdsz.dtpRqa.Date);
  D2 := FormatDateTime('yyyy-mm-dd', frmRqdsz.dtpRqb.Date);
  strSumQc := 'iif(ZY=''%s'' and RQ<#%s#, %s, 0)';
  strSumBq := 'iif(ZY=''%s'' and RQ>=#%s#, %s, 0)';
  strSqlJc :=
    'select BH, ' +
    'sum(' + format(strSumQc, ['JC', D1, 'SL']) + ') as QCJHSL, ' +
    'sum(' + format(strSumQc, ['JC', D1, 'SL * DJ ']) + ') as QCJHJE, ' +
    'sum(' + format(strSumQc, ['CC', D1, 'SL']) + ') as QCXSSL, ' +
    'sum(' + format(strSumQc, ['CC', D1, 'SL * DJ * ZK / 100']) + ') as QCXSJE, ' +
    'sum(' + format(strSumBq, ['JC', D1, 'SL']) + ') as JHSL, ' +
    'sum(' + format(strSumBq, ['JC', D1, 'SL * DJ']) + ') as JHJE, ' +
    'sum(' + format(strSumBq, ['CC', D1, 'SL']) + ') as XSSL, ' +
    'sum(' + format(strSumBq, ['CC', D1, 'SL * DJ * ZK / 100']) + ') as XSJE ' +
    'from JC ' +
    'where RQ <= #' + D2 + '# ' +
    'group by BH';
  strSqlBb :=
    'select S.BH, S.LBBH, L.LB, S.PPBH, P.PP, S.PM, S.GG, S.YS, S.DW, ' +
    'S.QCSL + B.QCJHSL - B.QCXSSL as QCSL1, ' +
    'iif(S.QCSL+B.QCJHSL=0, 0, (S.QCJE+B.QCJHJE)/(S.QCSL+B.QCJHSL)) as QCDJ, ' +
    'S.QCJE+B.QCJHJE-QCXSSL*QCDJ as QCJE1, ' +
    'B.JHSL, B.JHJE, B.XSSL, B.XSJE, ' +
    'iif(B.JHJE=0, 0, B.JHJE / B.JHSL) as JHDJ, ' +
    'iif(B.XSJE=0, 0, B.XSJE / B.XSSL) as XSDJ, ' +
    'iif(QCSL1+B.JHSL=0, 0, (QCJE1+B.JHJE)/(QCSL1+B.JHSL)) as PJDJ, ' +
    'B.XSSL * PJDJ as XSCB, ' +
    'B.XSJE - XSCB as XSLR, ' +
    'QCSL1 + B.JHSL - B.XSSL as QMSL1, ' +
    'QCJE1 + B.JHJE - XSCB as QMJE1 ' +
    'from SP S, SPLB L, SPPP P, ' +
    '(' + strSqlJc + ') B, ' +
    'S inner join L on S.LBBH=L.LBBH, ' +
    'S inner join P on S.PPBH=P.PPBH, ' +
    'S inner join B on S.BH=B.BH';
  dsJbzl.Close;
  dsJbzl.CommandText := 'select * from (' + strSqlBb + ') as BB ' +
    'where QCSL1<>0 or JHSL<>0 or XSSL<>0 or QMSL1<>0 ' +
    'order by BH';
  inherited;
end;

procedure TfrmJxcTjb.aCkExecute(Sender: TObject);
begin
  aCk.Checked := not aCk.Checked;
  pnlCk.Visible := aCk.Checked;
end;

end.
