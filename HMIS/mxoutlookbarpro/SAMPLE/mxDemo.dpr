Program mxDemo;

Uses
  Forms,
  Unit1 In 'Unit1.pas' {MainWindow};

{$R *.RES}

Begin
  Application.Initialize;
  Application.Title := 'MaxComponents Demo';
  Application.CreateForm( TMainWindow, MainWindow );
  Application.Run;
End.

