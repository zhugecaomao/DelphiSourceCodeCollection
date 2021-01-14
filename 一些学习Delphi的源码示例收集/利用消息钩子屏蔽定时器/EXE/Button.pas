unit Button;

interface

uses Windows, Public;

function CreateButton(X, Y, ID: Integer; Text: PChar): DWORD;

implementation

  // ½¨Á¢°´Å¥
function CreateButton(X, Y, ID: Integer; Text: PChar): DWORD;
begin
  Result := CreateWindowEx(0, 'BUTTON', Text,
                          WS_CHILD or WS_VISIBLE,
                          X, Y, 60, 25,
                          Window_Handle,
                          ID, hInstance, nil);
  if (Result = 0) then
  begin
    MessageBox(0, 'Create Button error !!', nil, 0); Halt;
  end;
end;

end.
