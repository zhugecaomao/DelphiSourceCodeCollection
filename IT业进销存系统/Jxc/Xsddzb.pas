unit Xsddzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmXsddzb = class(TfrmComDclbzb)
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
  frmXsddzb: TfrmXsddzb;

implementation

uses Dm, Main, ComDj, Xsdd, ComFun;

{$R *.DFM}

procedure TfrmXsddzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmXsddzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmXsdd.Create(Application));
  inherited;
end;

procedure TfrmXsddzb.OpendataSet;
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
    'select Z.*, iif(Z.ZT,''是'',''否'') as aZT, ' +
    'K.BH as aKHBH, K.MC as aKHMC ' +
    'from XSDDZB Z, KH K, Z inner join K on Z.KHID = K.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmXsddzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        '(select HH from XSDD where XSDD.ZBID=M.ZBID and XSDD.HH=M.HH) as TMP, ' +
        '(select sum(SL) from XSKD where DDID=M.ZBID and HPID=M.HPID) as aYTSL, ' +
        'iif(M.SL > aYTSL, M.SL - aYTSL, 0) as aMTSL, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from XSDD M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
