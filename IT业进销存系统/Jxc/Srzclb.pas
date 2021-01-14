unit Srzclb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmSrzclb = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSrzclb: TfrmSrzclb;

implementation

uses Dm, ComEdit, SrzclbEdit;
{$R *.DFM}

procedure TfrmSrzclb.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmSrzclbEdit.Create(self)) ;
	inherited;
end;

procedure TfrmSrzclb.aDelExecute(Sender: TObject);
begin
  //同时更新 Help
  strDetailTables := 'FYKZZB; QTSRZB';
  strDetailWheres := 'SFKFSID = [ID]';
  inherited;
end;

end.
