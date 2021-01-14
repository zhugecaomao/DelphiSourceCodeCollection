unit Qtsrzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb;

type
  TfrmQtsrzb = class(TfrmComDczb)
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
  frmQtsrzb: TfrmQtsrzb;

implementation

uses Dm, Main, ComDj, Qtsr, ComFun;

{$R *.DFM}

procedure TfrmQtsrzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmQtsrzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmQtsr.Create(Application));
  inherited;
end;

procedure TfrmQtsrzb.OpendataSet;
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
    'S.MC as aSFKFSMC, H.MC as aZHMC ' +
    'from QTSRZB Z, SFKFS S, ZH H, ' +
    'Z left join S on Z.SFKFSID = S.ID, ' +
    'Z left join H on Z.ZHID = H.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmQtsrzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'L.BH as aBH, L.MC as aMC ' +
        'from QTSR M, SRZCLB L, M inner join L on M.SRZCLBID=L.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
