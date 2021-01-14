unit Cgthzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmCgthzb = class(TfrmComDclbzb)
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
  frmCgthzb: TfrmCgthzb;

implementation

uses Dm, Main, ComDj, Cgth, ComFun;

{$R *.DFM}

procedure TfrmCgthzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmCgthzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmCgth.Create(Application));
  inherited;
end;

procedure TfrmCgthzb.OpendataSet;
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
    'switch(THLX=1,''供应商退现款'', THLX=2,''退款转入预付款'') as aTHLX, ' +
    'K.BH as aGYSBH, K.MC as aGYSMC, ' +
    'C.MC as aCKMC, S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from CGTHZB Z, GYS K, CK C, SFKFS S, ZH H, ' +
    'Z inner join K on Z.GYSID = K.ID, ' +
    'Z inner join C on Z.CKID = C.ID, ' +
    'Z left join S on Z.SFKFSID = S.ID, ' +
    'Z left join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmCgthzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from CGTH M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
