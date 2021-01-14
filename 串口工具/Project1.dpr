program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmcom};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmcom, frmcom);
  Application.Run;
end.
