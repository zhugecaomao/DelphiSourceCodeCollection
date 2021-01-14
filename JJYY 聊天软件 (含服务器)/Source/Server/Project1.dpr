program Project1;

uses
  Forms,
  windows,
  messages,
  Unit1 in 'Unit1.pas' {Form1},
  ChatSource in 'DataModule\ChatSource.pas' {Chat: TDataModule},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {PasswordDlg},
  Unit4 in 'Unit4.pas' {Addfrm},
  Unit5 in 'Unit5.pas' {frmBrowseUser},
  Unit6 in 'Unit6.pas' {frmUserProp},
  Unit7 in 'Unit7.pas' {frmConfig};

{$R *.RES}

var
  PrevWindow:HWND;

begin
  Application.Initialize;
  PrevWindow:=FindWindow('TForm1','JJYY Server');
  if PrevWindow<>0 then
  begin
    SendMessage(PrevWindow, UM_RESTORE_APPLICATION, 0, 0);
    SetForeGroundWindow(PrevWindow);
  end
  else
  begin
    Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TChat, Chat);
  Application.Run;
  end;
end.
