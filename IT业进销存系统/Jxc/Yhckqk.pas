unit Yhckqk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmYhckqk = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYhckqk: TfrmYhckqk;

implementation

uses Dm, ComEdit, YhckqkEdit;
{$R *.DFM}

procedure TfrmYhckqk.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmYhckqkEdit.Create(self)) ;
	inherited;
end;

end.
