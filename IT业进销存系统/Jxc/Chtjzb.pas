unit Chtjzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDjzb, Menus, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, dbclient, ComDczb;

type
  TfrmChtjzb = class(TfrmComDczb)
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
  frmChtjzb: TfrmChtjzb;

implementation

uses Dm, Main, ComDj, Chtj, ComFun;

{$R *.DFM}

procedure TfrmChtjzb.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid2';
  inherited;
end;

procedure TfrmChtjzb.LoadEditForm(strState: string);
begin
  frmDj := TfrmComDj(TfrmChtj.Create(Application));
  inherited;
end;

procedure TfrmChtjzb.OpendataSet;
var
  strWhere: string;
begin
  if CheckBox1.Checked then
    strWhere := 'where RQ between ' +
      '#' + FormatDateTime( 'yyyy-mm-dd',dtpRqa.Date ) + '# and ' +
      '#' + FormatDateTime( 'yyyy-mm-dd',dtpRqb.Date ) + '#'
  else
    strWhere := '';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select * from CHTJZB ' + strWhere + ' order by DJBH';
  inherited;
end;

procedure TfrmChtjzb.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if aDetail.Checked and (DataSet = DBGrid1.DataSource.DataSet) then
    with TClientDataSet(DBGrid2.DataSource.DataSet) do
    begin
      Close;
      CommandText :=
        'select M.*, ' +
        'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
        'from CHTJ M, HP H, M inner join H on M.HPID=H.ID ' +
        'where ZBID = ' + Float2Str(dsJbzl['ID']);
      Open;
    end;
end;

end.
