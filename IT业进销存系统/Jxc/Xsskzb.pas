unit Xsskzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmXsskzb = class(TfrmComDclbzb)
    procedure FormShow(Sender: TObject);override;
    procedure LoadEditForm(strState: string);override;
    procedure OpendataSet;override;
    procedure dsAfterScroll(DataSet: TDataSet);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXsskzb: TfrmXsskzb;

implementation

uses Dm, Main, ComDj, Xssk, ComFun;

{$R *.DFM}

procedure TfrmXsskzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmXsskzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmXssk.Create(Application));
  inherited;
end;

procedure TfrmXsskzb.OpendataSet;
var
  strWhere: string;
begin
  //同时更新 MyLib.Open
  if CheckBox1.Checked then
    strWhere := 'where Z.RQ between ' +
      '#' + FormatDateTime( 'yyyy-mm-dd',dtpRqa.Date ) + '# and ' +
      '#' + FormatDateTime( 'yyyy-mm-dd',dtpRqb.Date ) + '#'
  else
    strWhere := '';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.*, ' +
    'switch(FKLX=1,''应收款'', FKLX=2,''预收款'') as aFKLX, ' +
    'K.BH as aKHBH, K.MC as aKHMC, ' +
    'S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from XSSKZB Z, KH K, SFKFS S, ZH H, ' +
    'Z inner join K on Z.KHID = K.ID, ' +
    'Z inner join S on Z.SFKFSID = S.ID, ' +
    'Z inner join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmXsskzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'D.DJBH as aDDBH, D.RQ+D.SKQX as aSKQX, D.JE as aDDJE, ' +
        'D.YSJE - M.JE as aYSJE, D.JE - D.YSJE + M.JE as aMSJE ' +
        'from XSSK M, XSKDZB D, M inner join D on M.DDID=D.ID ' +
        'where M.ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
