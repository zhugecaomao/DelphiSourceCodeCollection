unit User;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList;

type
  TfrmUser = class(TfrmComJbzl)
		procedure LoadEditForm(strState:string);override;
    procedure aModifyExecute(Sender: TObject);override;
    procedure aDelExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

uses
  Dm,ComEdit,UserEdit;
{$R *.DFM}

procedure TfrmUser.LoadEditForm(strState:string);
begin
  frmEdit := TfrmComEdit( TfrmUserEdit.Create( Application ) ) ;
  inherited;
end;

procedure TfrmUser.aModifyExecute(Sender: TObject);
begin
  if UpperCase(dsJbzl.FieldByName('uCode').AsString) = 'SYS' then
  begin
    Application.MessageBox('不能修改 ''SYS - 管理员'' 的资料!', '用户管理', MB_OK + MB_ICONWARNING);
    exit
  end;
  inherited;
end;

procedure TfrmUser.aDelExecute(Sender: TObject);
begin
  if UpperCase(dsJbzl.FieldByName('uCode').AsString) = 'SYS' then
  begin
    Application.MessageBox('不能删除 ''SYS - 管理员'' 的资料!', '用户管理', MB_OK + MB_ICONWARNING);
    exit
  end;
  inherited;
end;

end.
