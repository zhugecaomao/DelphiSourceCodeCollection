program Palette;

uses
  Forms,
  Unit1 in 'Unit1.pas' {PaletteForm},
  Unit2 in 'Unit2.pas' {NewPicForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPaletteForm, PaletteForm);
  Application.CreateForm(TNewPicForm, NewPicForm);
  Application.Run;
end.
