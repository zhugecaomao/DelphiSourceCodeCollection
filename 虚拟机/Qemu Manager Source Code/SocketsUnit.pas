unit SocketsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Mask, DBCtrls, TntDBCtrls;

type
  TSockets = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Net2: TTntGroupBox;
    Label14: TTntLabel;
    Label16: TTntLabel;
    HPort: TEdit;
    Button3: TTntButton;
    Button4: TTntButton;
    TCPMEMO: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sockets: TSockets;

implementation

{$R *.dfm}

end.
