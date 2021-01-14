unit ProcPriUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TProc = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CB: TComboBox;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Proc: TProc;

implementation

{$R *.dfm}

end.
