program ThrdDemo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {SortForm},
  Unit2 in 'Unit2.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSortForm, SortForm);
  Application.Run;
end.
