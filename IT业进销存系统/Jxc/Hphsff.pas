unit Hphsff;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmHphsff = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHphsff: TfrmHphsff;

implementation

uses Dm, ComEdit, HphsffEdit;
{$R *.DFM}

procedure TfrmHphsff.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmHphsffEdit.Create(self)) ;
	inherited;
end;

procedure TfrmHphsff.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'HP';
  strDetailWheres := 'HPHSFFID = [ID]';
  inherited;
end;

end.
