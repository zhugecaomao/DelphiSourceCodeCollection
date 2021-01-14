unit KhHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComHelp, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Dbclient, db;

type
  TfrmKhHelp = class(TfrmComHelp)
    Edit3: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    procedure LoadEditForm(Para1: string);override;
    procedure btnDelClick(Sender: TObject);override;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKhHelp: TfrmKhHelp;

implementation

uses KhEdit, Dm;

{$R *.DFM}

{ TfrmKhHelp }

procedure TfrmKhHelp.LoadEditForm(Para1: string);
begin
  frmEdit := TfrmKhEdit.Create(Application);
  inherited;
end;

procedure TfrmKhHelp.btnDelClick(Sender: TObject);
begin
//  strDetailTables := 'CGDDZB; CGSHZB';
//  strDetailWheres := 'GYSID = [ID]';
  inherited;
end;

procedure TfrmKhHelp.Edit1Change(Sender: TObject);
begin
  if dsHelp = nil then
  begin
    dsHelp := TCLientDataSet(DBGrid1.DataSource.DataSet);
    if not dsHelp.Active then
      dsHelp.Active := True;
  end;
  if not dsHelp.Locate('BH', Edit1.Text, [loPartialKey]) then
    dsHelp.First;
end;

procedure TfrmKhHelp.FormShow(Sender: TObject);
begin
  if not ( TCLientDataSet(DBGrid1.DataSource.DataSet).Active ) then
  begin
    TCLientDataSet(DBGrid1.DataSource.DataSet).CommandText :=
      'select K.*,D.MC as aDQMC,K.QMJE-K.YXJE as aSJJE ' +
      'from KH K inner join DQ D on K.DQID=D.ID where not K.ZT ' +
      'order by K.BH';
    TCLientDataSet(DBGrid1.DataSource.DataSet).Open;
  end;
  inherited;
end;

end.
