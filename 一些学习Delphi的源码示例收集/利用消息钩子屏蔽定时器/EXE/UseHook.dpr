program UseHook;

{$R '..\RES\Liumazi.res' '..\RES\Liumazi.txt'}

uses
  Windows, Messages,
  Window in 'Window.pas',
  Button in 'Button.pas',
  Public in 'Public.pas';

var
  TheMessage: TMsg;

begin
  Window_Handle := CreateWindow;
  Button1Handle := CreateButton(10, 10, 1, '¹Ò¹³');
  Button2Handle := CreateButton(80, 10, 2, 'ÍÑ¹³');
  TheInitialize;

  while GetMessage(TheMessage, 0, 0, 0) do
  begin
    TranslateMessage(TheMessage);
    DispatchMessage(TheMessage);
  end;
  
  PostMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
end.
