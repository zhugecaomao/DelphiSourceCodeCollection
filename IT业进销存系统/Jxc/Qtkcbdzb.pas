unit Qtkcbdzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb;

type
  TfrmQtkcbdzb = class(TfrmComDczb)
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
  frmQtkcbdzb: TfrmQtkcbdzb;

implementation

uses Dm, Main, ComDj, Qtkcbd, ComFun;

{$R *.DFM}

procedure TfrmQtkcbdzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmQtkcbdzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmQtkcbd.Create(Application));
  inherited;
end;

procedure TfrmQtkcbdzb.OpendataSet;
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
    'C.MC as aCKMC, ' +
    'L.MC as aQTKCBDLXMC, ' +
    'iif(L.RKL,''入库类(增加库存)'', ''出库类(减少库存)'') as aCRLX, ' +
    'iif(L.THBZ,''需要'', ''不需要'') as aTH ' +
    'from QTKCBDZB Z, CK C, QTKCBDLX L, ' +
    'Z inner join C on Z.CKID = C.ID, ' +
    'Z inner join L on Z.QTKCBDLXID = L.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmQtkcbdzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from QTKCBD M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
