unit Qtkcbdlx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmQtkcbdlx = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtkcbdlx: TfrmQtkcbdlx;

implementation

uses Dm, ComEdit, QtkcbdlxEdit;
{$R *.DFM}

procedure TfrmQtkcbdlx.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmQtkcbdlxEdit.Create(self)) ;
	inherited;
end;

procedure TfrmQtkcbdlx.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'QTKCBDZB';
  strDetailWheres := 'QTKCBDLXID = [ID]';
  inherited;
end;

end.
