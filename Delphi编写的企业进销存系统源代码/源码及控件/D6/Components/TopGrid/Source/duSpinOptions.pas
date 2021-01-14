unit duSpinOptions;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Classes, Controls
  {$IFDEF TSVER_V6}, Variants {$ENDIF}, Graphics, Forms,
  Dialogs, tsGrid;

type
  TdgSpinOptions = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    chspoAutoRepeat: TCheckBox;
    chspoAutoIncrement: TCheckBox;
    chspoKeyEdit: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    function EditOptions(Value : TtsSpinOptions) : Boolean;
    function GetSpinOptions : TtsSpinOptions;
  end;

var
  dgSpinOptions: TdgSpinOptions;

implementation

{$R *.dfm}

function TdgSpinOptions.EditOptions(Value : TtsSpinOptions) : Boolean;
begin
  Result := False;
  chspoAutoRepeat.Checked := (spoAutoRepeat in Value);
  chspoAutoIncrement.Checked := (spoAutoIncrement in Value);
  chspoKeyEdit.Checked := (spoKeyEdit in Value);

  if (ShowModal = mrOk) then
     Result := True;
end;

function TdgSpinOptions.GetSpinOptions : TtsSpinOptions;
begin
  Result := [];
  if chspoAutoRepeat.Checked then
     Result := [spoAutoRepeat];
  if chspoAutoIncrement.Checked then
     Result := Result + [spoAutoIncrement];
  if chspoKeyEdit.Checked then
     Result := Result + [spoKeyEdit];
end;

end.
