program FormFeed;

uses
  Windows, WinSpool,
  GetPrnDC in '..\³ÌÐò13-1\GetPrnDC.pas';

var
  di: TDocInfo;
  hdcPrint: HDC;
  
begin
  di.cbSize := SizeOf(TDocInfo);
  di.lpszDocName := 'FormFeed';
  hdcPrint := GetPrinterDC();
  if (hdcPrint <> 0) then
  begin
    if (StartDoc(hdcPrint, di) > 0) then
      if (StartPage(hdcPrint) > 0) and (EndPage(hdcPrint) > 0) then
        EndDoc(hdcPrint);
    DeleteDC(hdcPrint);
  end;
end.
