unit GetPrnDC;

interface

uses
  Windows, WinSpool;      

function GetPrinterDC(): HDC;
  
implementation

function GetPrinterDC(): HDC;
var
  dwNeeded, dwReturned: DWORD;
  pInfo4: ^TPrinterInfo4;
  pInfo5: ^TPrinterInfo5;
begin
  if (GetVersion() and $80000000) <> 0 then // Windows 98 ....
  begin
    EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, nil, 0, dwNeeded, dwReturned);
    GetMem(pInfo5, dwNeeded);
    EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, pInfo5, dwNeeded, dwNeeded, dwReturned);
    Result := CreateDC(nil, pInfo5.pPrinterName, nil, nil);
    FreeMem(pInfo5);
  end else //Windows NT ....
  begin
    EnumPrinters(PRINTER_ENUM_LOCAL, nil, 4, nil, 0, dwNeeded, dwReturned);
    GetMem(pInfo4, dwNeeded);
    EnumPrinters(PRINTER_ENUM_LOCAL, nil, 4, pInfo4, dwNeeded, dwNeeded, dwReturned);
    Result := CreateDC(nil, pInfo4.pPrinterName, nil, nil);
    FreeMem(pInfo4);
  end;
end;

end.
