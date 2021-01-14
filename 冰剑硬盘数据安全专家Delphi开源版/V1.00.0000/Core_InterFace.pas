unit Core_InterFace;

interface
function ExecAppWait(AppName, Params: string): Boolean;
implementation
uses
  Windows,SHELLAPI,Forms;
function ExecAppWait(AppName, Params: string): Boolean;
var
  // Structure containing and receiving info about application to start
  ShellExInfo: TShellExecuteInfo;
begin
  FillChar(ShellExInfo, SizeOf(ShellExInfo), 0);
  with ShellExInfo do begin
    cbSize := SizeOf(ShellExInfo);
    fMask := see_Mask_NoCloseProcess;
    Wnd := Application.Handle;
    lpFile := PChar(AppName);
    lpParameters := PChar(Params);
    nShow := sw_ShowNormal;
  end;
  Result := ShellExecuteEx(@ShellExInfo);
  if Result then
    while WaitForSingleObject(ShellExInfo.HProcess, 100) = WAIT_TIMEOUT do
    begin
      Application.ProcessMessages;
      if Application.Terminated then Break;
    end;
end;

end.
 