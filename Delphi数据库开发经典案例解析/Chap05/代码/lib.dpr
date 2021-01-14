program lib;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main},
  ParentForm in 'ParentForm.pas' {Parent},
  UserSettingForm in 'UserSettingForm.pas' {UserSetting},
  UserDocuForm in 'UserDocuForm.pas' {UserDocu},
  BookSettingForm in 'BookSettingForm.pas' {BookSetting},
  BookDocuForm in 'BookDocuForm.pas' {BookDocu},
  BookOrderForm in 'BookOrderForm.pas' {BookOrder},
  ChooseForm in 'ChooseForm.pas' {choose},
  BookBorrowForm in 'BookBorrowForm.pas' {BookBorrow},
  BookReturnForm in 'BookReturnForm.pas' {BookReturn},
  BookOverdueForm in 'BookOverdueForm.pas' {BookOverdue},
  ForfeitForm in 'ForfeitForm.pas' {ForFeit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '图书馆管理系统';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
