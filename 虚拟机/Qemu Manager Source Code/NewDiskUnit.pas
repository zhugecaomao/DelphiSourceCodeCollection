unit NewDiskUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, TntStdCtrls;

type
  TNewDisk = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DType: TTntComboBox;
    Label19: TTntLabel;
    Label17: TTntLabel;
    SE: TSpinEdit;
    GB: TTntLabel;
    procedure SEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDisk: TNewDisk;

implementation

{$R *.dfm}

procedure TNewDisk.SEChange(Sender: TObject);
var
I,j :LongInt;
begin
I := SE.Value;
j := I div 1000;
GB.caption := 'MB. ('+IntTOstr(j)+' GB)';
end;

end.
