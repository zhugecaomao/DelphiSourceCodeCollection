program Client;

uses
  Forms,
  mainfrm in 'mainfrm.pas' {frmMain},
  Logfrm in 'Logfrm.pas' {frmLogin},
  RegUser in 'RegUser.pas' {frmReg},
  Chatfrm in 'Chatfrm.pas' {frmChat},
  Configfrm in 'Configfrm.pas' {frmConfig},
  UserInfofrm in 'UserInfofrm.pas' {frmUserInfo},
  Mailfrm in 'Mailfrm.pas' {frmmail},
  Adminfrm in 'Adminfrm.pas' {frmAdmin},
  Infofrm in 'Infofrm.pas' {frmInfo},
  Russ in 'Russ.pas' {Russfrm},
  CoolMenu in 'CoolMenu.pas' {UserMenu: TCoolWhistlerWindowPopup};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TUserMenu, UserMenu);
  Application.Run;
end.
