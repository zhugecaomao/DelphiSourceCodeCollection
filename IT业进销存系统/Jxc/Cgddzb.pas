unit Cgddzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb, ComDclbzb;

type
  TfrmCgddzb = class(TfrmComDclbzb)
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
  frmCgddzb: TfrmCgddzb;

implementation

uses Dm, Main, ComDj, Cgdd, ComFun;

{$R *.DFM}

procedure TfrmCgddzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmCgddzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmCgdd.Create(Application));
  inherited;
end;

procedure TfrmCgddzb.OpendataSet;
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
    'K.BH as aGYSBH, K.MC as aGYSMC ' +
    'from CGDDZB Z, GYS K, Z inner join K on Z.GYSID = K.ID ' + strWhere + ' ' +
    'order by Z.DJBH';
  inherited;
end;

procedure TfrmCgddzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        '(select HH from CGDD where CGDD.ZBID=M.ZBID and CGDD.HH=M.HH) as TMP, ' +
        '(select sum(SL) from CGSH where DDID=M.ZBID and HPID=M.HPID) as aSHSL, ' +
        'iif(M.SL > aSHSL, M.SL - aSHSL, 0) as aMSSL, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from CGDD M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
