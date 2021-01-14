unit Xskdzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmXskdzb = class(TfrmComDclbzb)
    procedure FormShow(Sender: TObject);override;
    procedure LoadEditForm(strState: string);override;
    procedure OpendataSet;override;
    procedure dsAfterScroll(DataSet: TDataSet);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXskdzb: TfrmXskdzb;

implementation

uses Dm, Main, ComDj, Xskd, ComFun;

{$R *.DFM}

procedure TfrmXskdzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmXskdzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmXskd.Create(Application));
  inherited;
end;

procedure TfrmXskdzb.OpendataSet;
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
    'select Z.*, iif(XSLX=1, JE, YSJE) as YSJE1, JE - YSJE1 as MSJE, ' +
    'switch(XSLX=1,''现款'', XSLX=2,''挂帐'') as aXSLX, ' +
    'switch(FPLX=1,''收据'', FPLX=2,''普通发票'',FPLX=3,''增值税发票'') as aFPLX, ' +
    'K.BH as aKHBH, K.MC as aKHMC, ' +
    'C.MC as aCKMC, ' +
    'S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from XSKDZB Z,KH K,CK C, SFKFS S, ZH H, ' +
    'Z inner join K on Z.KHID = K.ID, ' +
    'Z inner join C on Z.CKID = C.ID, ' +
    'Z left join S on Z.SFKFSID = S.ID, ' +
    'Z left join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmXskdzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from XSKD M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

procedure TfrmXskdzb.aDelExecute(Sender: TObject);
begin
//  strDetailTables := 'XSSK';
//  strDetailWheres := 'DDID = [ZBID] and JE <> 0';
  inherited;
end;

end.
