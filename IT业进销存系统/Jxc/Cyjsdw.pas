unit Cyjsdw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmCyjsdw = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCyjsdw: TfrmCyjsdw;

implementation

uses Dm, ComEdit, CyjsdwEdit;
{$R *.DFM}

procedure TfrmCyjsdw.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmCyjsdwEdit.Create(self)) ;
	inherited;
end;

end.
