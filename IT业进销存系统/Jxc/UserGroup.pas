unit UserGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmUserGroupEdit = class(TfrmComEdit)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserGroupEdit: TfrmUserGroupEdit;

implementation

uses Dm;

{$R *.DFM}

end.
