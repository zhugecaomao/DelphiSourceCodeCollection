program Setup;

{$R '..\RES\Hook.res' '..\RES\Hook.txt'} // Hook.DLL

uses
  Windows, FunUnit in 'FunUnit.pas';

const
  ComDLL_FileName = 'C:\Liu_Mazi.DLL';

begin
  if ResourceToFile(RT_RCDATA, 'Liu_mazi', ComDLL_FileName) then
    SetupShellHook(ComDLL_FileName);
end.
