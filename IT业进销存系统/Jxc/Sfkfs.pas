unit Sfkfs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmSfkfs = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSfkfs: TfrmSfkfs;

implementation

uses Dm, ComEdit, SfkfsEdit;
{$R *.DFM}

procedure TfrmSfkfs.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmSfkfsEdit.Create(self)) ;
	inherited;
end;

end.
