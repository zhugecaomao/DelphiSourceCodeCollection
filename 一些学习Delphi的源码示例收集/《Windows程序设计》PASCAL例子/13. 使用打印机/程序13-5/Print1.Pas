unit Print1;

interface

uses
  Windows, WinSpool, GetPrnDC; 

const
  szAppName = 'Print1';
  szCaption = 'Print Program 1';

procedure PageGDICalls(hdcPrn: HDC; cxPage, cyPage: Integer);
function PrintMyPage(hWnd: HWND): Boolean;

implementation

procedure PageGDICalls(hdcPrn: HDC; cxPage, cyPage: Integer);
const
  szTextStr = 'Hello, Printer!';
begin
  Rectangle(hdcPrn, 0, 0, cxPage, cyPage);
  MoveToEx(hdcPrn, 0, 0, nil);
  LineTo(hdcPrn, cxPage, cyPage);
  MoveToEx(hdcPrn, cxPage, 0, nil);
  LineTo(hdcPrn, 0, cyPage);
  SaveDC(hdcPrn);
  SetMapMode(hdcPrn, MM_ISOTROPIC);
  SetWindowExtEx(hdcPrn, 1000, 1000, nil);
  SetViewportExtEx(hdcPrn, cxPage div 2, -cyPage div 2, nil);
  SetViewportOrgEx(hdcPrn, cxPage div 2,  cyPage div 2, nil);
  Ellipse(hdcPrn, -500, 500, 500, -500);
  SetTextAlign(hdcPrn, TA_BASELINE or TA_CENTER);
  TextOut(hdcPrn, 0, 0, szTextStr, lstrlen(szTextStr));
  RestoreDC(hdcPrn, -1);
end;

function PrintMyPage(hWnd: HWND): Boolean;
const
  di: TDocInfo = (
    cbSize: SizeOf(TDocInfo);
    lpszDocName: 'Print1: Printing';
    lpszOutput: nil;
    lpszDatatype: nil;
    fwType: 0;   );
var    
  hdcPrn: HDC;
  xPage, yPage: Integer;
begin
  Result := FALSE;

  hdcPrn := GetPrinterDC();
  if (hdcPrn = 0) then Exit;

  xPage := GetDeviceCaps(hdcPrn, HORZRES);
  yPage := GetDeviceCaps(hdcPrn, VERTRES);
  
  if (StartDoc(hdcPrn, di) > 0) then
  begin
    if (StartPage(hdcPrn) > 0) then
    begin
      PageGDICalls(hdcPrn, xPage, yPage);
      if (EndPage(hdcPrn) > 0) then
      begin
        EndDoc(hdcPrn);
        Result := TRUE;
      end;
    end;
  end;
  
  DeleteDC(hdcPrn);
end;

end.
