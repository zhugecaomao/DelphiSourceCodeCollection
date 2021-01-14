unit Yglb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmYglb = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYglb: TfrmYglb;

implementation

uses Dm, ComEdit, YglbEdit;
{$R *.DFM}

procedure TfrmYglb.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmYglbEdit.Create(self)) ;
	inherited;
end;

procedure TfrmYglb.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'YG';
  strDetailWheres := 'YGLBID = [ID]';
  inherited;
end;

end.
