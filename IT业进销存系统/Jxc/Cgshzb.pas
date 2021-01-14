unit Cgshzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmCgshzb = class(TfrmComDclbzb)
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
  frmCgshzb: TfrmCgshzb;

implementation

uses Dm, Main, ComDj, Cgsh, ComFun;

{$R *.DFM}

procedure TfrmCgshzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmCgshzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmCgsh.Create(Application));
  inherited;
end;

procedure TfrmCgshzb.OpendataSet;
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
    'select Z.*, iif(CGLX=1, JE, YFJE) as YFJE1, JE - YFJE1 as MFJE, ' +
    'switch(CGLX=1,''现款'', CGLX=2,''挂帐'') as aCGLX, ' +
    'switch(FPLX=1,''收据'', FPLX=2,''普通发票'', FPLX=3,''增值税发票'') as aFPLX, ' +
    'K.BH as aGYSBH, K.MC as aGYSMC, ' +
    'C.MC as aCKMC, ' +
    'S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from CGSHZB Z,GYS K,CK C, SFKFS S, ZH H, ' +
    'Z inner join K on Z.GYSID = K.ID, ' +
    'Z inner join C on Z.CKID = C.ID, ' +
    'Z left join S on Z.SFKFSID = S.ID, ' +
    'Z left join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmCgshzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from CGSH M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

procedure TfrmCgshzb.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'CGFK';
  strDetailWheres := 'DDID = [ID] and JE <> 0';
  inherited;
end;

end.
