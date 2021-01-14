unit Bm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmBm = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBm: TfrmBm;

implementation

uses Dm, ComEdit, BmEdit;
{$R *.DFM}

procedure TfrmBm.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmBmEdit.Create(self)) ;
	inherited;
end;

procedure TfrmBm.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'YG';
  strDetailWheres := 'BMID = [ID]';
  inherited;
end;

end.
