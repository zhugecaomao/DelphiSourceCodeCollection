unit SjzlZl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList, ComLbzl;

type
  TfrmSjzlZl = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSjzlZl: TfrmSjzlZl;

implementation

uses Dm, ComEdit, SjzlEdit, Common;
{$R *.DFM}

procedure TfrmSjzlZl.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmSjzlEdit.Create(self)) ;
	inherited;
end;

procedure TfrmSjzlZl.aDelExecute(Sender: TObject);
begin
  if HaveDetail(dsJbzl, 'HPSJ', 'SJZLID = [ID]') then
    if Application.MessageBox('删除此项资料后，与此相关的售价资料会同时被删除，继续吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
      exit;
  inherited;
end;

end.
