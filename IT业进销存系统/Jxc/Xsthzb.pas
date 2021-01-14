unit Xsthzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmXsthzb = class(TfrmComDclbzb)
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
  frmXsthzb: TfrmXsthzb;

implementation

uses Dm, Main, ComDj, Xsth, ComFun;

{$R *.DFM}

procedure TfrmXsthzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmXsthzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmXsth.Create(Application));
  inherited;
end;

procedure TfrmXsthzb.OpendataSet;
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
    'switch(THLX=1,''退现款给客户'', THLX=2,''退款转入客户预收款'') as aTHLX, ' +
    'K.BH as aKHBH, K.MC as aKHMC, ' +
    'C.MC as aCKMC,S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from XSTHZB Z,KH K,CK C,SFKFS S,ZH H, ' +
    'Z inner join K on Z.KHID = K.ID, ' +
    'Z inner join C on Z.CKID = C.ID, ' +
    'Z left join S on Z.SFKFSID = S.ID, ' +
    'Z left join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmXsthzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from XSTH M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
