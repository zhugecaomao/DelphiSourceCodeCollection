unit GysHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComHelp, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Dbclient, db;

type
  TfrmGysHelp = class(TfrmComHelp)
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
  frmGysHelp: TfrmGysHelp;

implementation

uses GysEdit, Dm;

{$R *.DFM}

{ TfrmKhHelp }

procedure TfrmGysHelp.LoadEditForm(Para1: string);
begin
  frmEdit := TfrmGysEdit.Create(Application);
  inherited;
end;

procedure TfrmGysHelp.btnDelClick(Sender: TObject);
begin
  strDetailTables := 'CGDDZB; CGSHZB';
  strDetailWheres := 'GYSID = [ID]';
  inherited;
end;

procedure TfrmGysHelp.Edit1Change(Sender: TObject);
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

procedure TfrmGysHelp.FormShow(Sender: TObject);
begin
  if not ( TCLientDataSet(DBGrid1.DataSource.DataSet).Active ) then
  begin
    TCLientDataSet(DBGrid1.DataSource.DataSet).CommandText :=
      'select *,QMJE-YXJE as aSJJE ' +
      'from GYS where not ZT ' +
      'order by BH';
    TCLientDataSet(DBGrid1.DataSource.DataSet).Open;
  end;
  inherited;
end;

end.
