program client;

uses
  Forms,
  Unlogin in 'Unlogin.pas' {loginfrm},
  Undm in 'Undm.pas' {DataModule2: TDataModule},
  Unidentify in 'Unidentify.pas' {identifyfrm},
  Unkaoshi in 'Unkaoshi.pas' {kaoshifrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tloginfrm, loginfrm);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(Tidentifyfrm, identifyfrm);
  Application.CreateForm(Tkaoshifrm, kaoshifrm);
  Application.Run;
end.
