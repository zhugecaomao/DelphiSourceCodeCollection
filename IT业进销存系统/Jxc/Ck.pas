unit Ck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmCk = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCk: TfrmCk;

implementation

uses Dm, ComEdit, CkEdit, Common;
{$R *.DFM}

procedure TfrmCk.FormShow(Sender: TObject);
begin
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmCk.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmCkEdit.Create(self)) ;
	inherited;
end;

procedure TfrmCk.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'CGSHZB';
  strDetailWheres := 'CKID = [ID]';
  if CheckRecord('select * from HPKC where CKID = ' + dsJbzl.FieldByName('ID').AsString + ' ' +
    'and (QCS <> 0 or JCS <> 0)') then
    strDetailTables := strDetailTables + ';HPKC';
  inherited;
end;

end.
