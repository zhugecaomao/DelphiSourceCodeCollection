program BookManage;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Reader in 'Reader.pas' {ReaderForm},
  InfoQuery in 'InfoQuery.pas' {QueryForm},
  Lend in 'Lend.pas' {LendForm},
  DataModule in 'DataModule.pas' {DataModuleADO: TDataModule},
  Book in 'Book.pas' {BookForm},
  OwnBook in 'OwnBook.pas' {OwnBookForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TReaderForm, ReaderForm);
  Application.CreateForm(TQueryForm, QueryForm);
  Application.CreateForm(TLendForm, LendForm);
  Application.CreateForm(TDataModuleADO, DataModuleADO);
  Application.CreateForm(TBookForm, BookForm);
  Application.CreateForm(TOwnBookForm, OwnBookForm);
  Application.Run;
end.
