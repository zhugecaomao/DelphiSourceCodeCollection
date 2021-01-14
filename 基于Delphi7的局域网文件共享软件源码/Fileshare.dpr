program Fileshare;

uses
  Forms,
  file_share in 'file_share.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
