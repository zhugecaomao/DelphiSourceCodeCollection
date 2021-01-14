unit UserOption;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComUserOption, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmUserOption = class(TfrmComUserOption)
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserOption: TfrmUserOption;

implementation

{$R *.DFM}

end.
