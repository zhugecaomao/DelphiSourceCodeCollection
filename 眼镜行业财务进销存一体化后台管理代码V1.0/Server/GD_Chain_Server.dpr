program GD_Chain_Server;

uses
  Forms,
  Chain_Server_Main in 'Chain_Server_Main.pas' {frm_Chain_Server_Main},
  GD_Chain_Server_TLB in 'GD_Chain_Server_TLB.pas',
  func in 'func.pas',
  Server_Data in 'Server_Data.pas' {Easy_Dcom_Server: TRemoteDataModule} {Easy_Dcom_Server: CoClass},
  Chain_Data in 'Chain_Data.pas' {frm_Chain_Data: TDataModule},
  Unitpubsub in 'Unitpubsub.pas',
  Public_Data in 'Public_Data.pas' {PublicServer: TRemoteDataModule} {PublicServer: CoClass},
  Unitzc in 'Unitzc.pas' {Formzc},
  UBook in 'UBook.pas' {FmBook},
  UNewDb in 'UNewDb.pas' {FmNewDb};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.Title:='后台管理应用服务器';
  Application.CreateForm(Tfrm_Chain_Server_Main, frm_Chain_Server_Main);
  try
    Application.CreateForm(Tfrm_Chain_Data,frm_Chain_Data);
  except
  end;
  Application.Run;
end.
