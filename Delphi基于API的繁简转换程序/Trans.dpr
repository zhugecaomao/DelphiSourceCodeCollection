program Trans;

uses
  Forms,
  mainUnit in 'mainUnit.pas' {Form1},
  IMCode in 'IMCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
