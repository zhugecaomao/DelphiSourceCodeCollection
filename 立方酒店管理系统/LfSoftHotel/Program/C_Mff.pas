unit C_Mff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls;

type
  TMffForm = class(TStdJdForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MffForm: TMffForm;

procedure Mff;

implementation

{$R *.dfm}

procedure Mff;
begin
  MffForm := TMffForm.Create(Application);
  try
    MffForm.ShowModal;
  finally
    MffForm.Free;
  end;

end;
end.
