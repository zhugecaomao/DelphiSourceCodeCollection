unit Zh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmZh = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZh: TfrmZh;

implementation

uses Dm, ComEdit, ZhEdit;
{$R *.DFM}

procedure TfrmZh.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmZhEdit.Create(self)) ;
	inherited;
end;

procedure TfrmZh.aDelExecute(Sender: TObject);
begin
  strDetailTables := 'SFKFS';
  strDetailWheres := 'ZHID = [ID]';
  inherited;
end;

end.
