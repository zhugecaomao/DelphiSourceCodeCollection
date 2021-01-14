unit SelPhysicalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ShellAPI;

type
  TPhysical = class(TForm)
    GB: TGroupBox;
    Caption: TLabel;
    Drives: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Physical: TPhysical;

implementation

{$R *.dfm}

procedure TPhysical.Button3Click(Sender: TObject);
begin
ShellExecute(Handle,'open','diskmgmt.msc',nil,nil,sw_SHOWNORMAL);
end;

end.
