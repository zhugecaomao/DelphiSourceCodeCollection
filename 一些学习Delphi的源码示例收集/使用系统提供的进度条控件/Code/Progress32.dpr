program Progress32;

{$R '..\Icon\Liumazi.res' '..\Icon\Liumazi.txt'}

uses
  Windows, Messages,
  Public_Unit in 'Public_Unit.pas',
  Window_Unit in 'Window_Unit.pas',
  Status_Unit in 'Status_Unit.pas',
  Menu_Unit   in 'Menu_Unit.pas',
  Thread_Unit in 'Thread_Unit.pas';

var
  MainMessage: TMsg;
begin
  if (Findwindow(WindowClassName, nil) <> 0) then Exit;
  Create_Window;
  Create_Menu;
  Create_Status;
  Create_SubThread;
  while GetMessage(MainMessage, 0, 0, 0) do
  begin
    TranslateMessage(MainMessage);
    DispatchMessage(MainMessage);
  end;
  Quit_SubThread;
  InitCommonControls;    
end.
