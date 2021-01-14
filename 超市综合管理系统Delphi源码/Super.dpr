program Super;

uses
  Forms,
  Main in 'Main.pas' {Main_Form},
  about in 'about.pas' {AboutBox},
  datamodule in 'datamodule.pas' {DataModule1: TDataModule},
  producetype in 'producetype.pas' {PType_Form},
  putproducet in 'putproducet.pas' {Put_Form},
  saleunit in 'saleunit.pas' {Sale_Form},
  entergoo in 'entergoo.pas' {enterFrom},
  select in 'select.pas' {sel_From},
  backup in 'backup.pas' {backup_From},
  UseLogin in 'UseLogin.pas' {Login_Form},
  admin_unit in 'admin_unit.pas' {Admin_Form},
  help in 'help.pas' {Help_Form};

{$R *.res}

begin
  //Login_Form:=TLogin_Form.create(application);
  //Login_Form.ShowModal;
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TLogin_Form, Login_Form);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPType_Form, PType_Form);
  Application.CreateForm(TPut_Form, Put_Form);
  Application.CreateForm(TSale_Form, Sale_Form);
  Application.CreateForm(TenterFrom, enterFrom);
  Application.CreateForm(Tsel_From, sel_From);
  Application.CreateForm(Tbackup_From, backup_From);
  Application.CreateForm(TAdmin_Form, Admin_Form);
  Application.CreateForm(THelp_Form, Help_Form);
  Application.Run;
end.
