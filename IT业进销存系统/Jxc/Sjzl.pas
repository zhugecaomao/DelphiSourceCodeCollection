unit Sjzl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmSjzl = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSjzl: TfrmSjzl;

implementation

uses Dm, ComEdit, SjzlEdit;
{$R *.DFM}

procedure TfrmSjzl.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmSjzlEdit.Create(self)) ;
	inherited;
end;

procedure TfrmSjzl.aDelExecute(Sender: TObject);
begin
  { TODO : ... }
{
  strDetailTables := 'HPSJ';
  strDetailWheres := 'SJZLID = [ID]';
}  
  inherited;
end;

end.
