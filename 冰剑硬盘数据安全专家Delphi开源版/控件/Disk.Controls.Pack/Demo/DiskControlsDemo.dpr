program DiskControlsDemo;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  AddPath in 'AddPath.pas' {AddPathForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'DiskControls Demo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
