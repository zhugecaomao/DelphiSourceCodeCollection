program JpegSave2DataBase;

uses
  Forms,
  JpegSave2DataBaseUnit1 in 'JpegSave2DataBaseUnit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
