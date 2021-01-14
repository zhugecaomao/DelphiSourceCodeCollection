unit Dq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmDq = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDq: TfrmDq;

implementation

uses Dm, ComEdit, DqEdit, MyLib;
{$R *.DFM}

procedure TfrmDq.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmDqEdit.Create(self)) ;
	inherited;
end;

procedure TfrmDq.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'KH';
  strDetailWheres := 'DQID = [ID]';
  inherited;
end;

end.
