unit Cgfkzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmCgfkzb = class(TfrmComDclbzb)
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
  frmCgfkzb: TfrmCgfkzb;

implementation

uses Dm, Main, ComDj, Cgfk, ComFun;

{$R *.DFM}

procedure TfrmCgfkzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmCgfkzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmCgfk.Create(Application));
  inherited;
end;

procedure TfrmCgfkzb.OpendataSet;
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
    'switch(FKLX=1,''应付款'', FKLX=2,''预付款'') as aFKLX, ' +
    'K.BH as aGYSBH, K.MC as aGYSMC, ' +
    'S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from CGFKZB Z, GYS K, SFKFS S, ZH H, ' +
    'Z inner join K on Z.GYSID = K.ID, ' +
    'Z inner join S on Z.SFKFSID = S.ID, ' +
    'Z inner join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmCgfkzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'D.DJBH as aDDBH, D.RQ as aDDRQ, D.JE as aDDJE, ' +
        'D.YFJE - M.JE as aYFJE, D.JE - D.YFJE + M.JE as aMFJE ' +
        'from CGFK M, CGSHZB D, M inner join D on M.DDID=D.ID ' +
        'where M.ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
