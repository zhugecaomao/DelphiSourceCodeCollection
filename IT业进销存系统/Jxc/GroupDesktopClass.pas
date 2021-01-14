unit GroupDesktopClass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmGroupDesktopClass = class(TfrmComEdit)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupDesktopClass: TfrmGroupDesktopClass;

implementation

uses Dm;

{$R *.DFM}

end.
