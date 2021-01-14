unit Hplb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmHplb = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHplb: TfrmHplb;

implementation

uses Dm, ComEdit, HplbEdit;
{$R *.DFM}

procedure TfrmHplb.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmHplbEdit.Create(self)) ;
	inherited;
end;

procedure TfrmHplb.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'HP';
  strDetailWheres := 'HPLBID = [ID]';
  inherited;
end;

end.
