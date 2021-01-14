unit PopPrnt;

interface

   // 打印文件
function PopPrntPrintFile(hInst, hWnd, hWndEdit: LongWord; const pstrTitleName: PChar): Boolean;

implementation

   // 打印文件
function PopPrntPrintFile(hInst, hWnd, hWndEdit: LongWord; const pstrTitleName: PChar): Boolean;
begin
  Result := FALSE;
end; 

end.
