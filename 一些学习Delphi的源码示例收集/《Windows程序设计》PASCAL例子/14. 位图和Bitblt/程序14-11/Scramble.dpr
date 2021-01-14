program  Scramble;

uses
  Windows, Messages;

const
  NUM = 300;

var
  iKeep: array[0..NUM-1] of array[0..3] of Integer;
  hdcScr, hdcMem, cx, cy, hBitmap, hWnd, i, j, x1, y1, x2, y2: Integer;
  
begin
  hWnd := GetDesktopWindow();
  if (LockWindowUpdate(hWnd)) then // 锁定
  begin
    hdcScr := GetDCEx(hWnd, 0, DCX_CACHE or DCX_LOCKWINDOWUPDATE); // 屏幕设备内容
    hdcMem := CreateCompatibleDC(hdcScr); // 兼容内存设备
    cx := GetSystemMetrics(SM_CXSCREEN) div 10; // 块宽
    cy := GetSystemMetrics(SM_CYSCREEN) div 10; // 块高
    hBitmap := CreateCompatibleBitmap(hdcScr, cx, cy); // 建立位图
    SelectObject(hdcMem, hBitmap); //选入位图
    Randomize;             
    for i := 0 to 1 do
      for j := 0 to NUM-1 do
      begin
        if (i = 0) then // 第一趟 随机变换
        begin
          x1 := cx * Random(10);
          iKeep[j][0] := x1;
          y1 := cy * Random(10);
          iKeep[j][1] := y1;
          x2 := cx * Random(10);
          iKeep[j][2] := x2;
          y2 := cy * Random(10);
          iKeep[j][3] := y2;
        end else // 第二趟 反向还原
        begin
          x1 := iKeep[NUM - 1 - j][0];
          y1 := iKeep[NUM - 1 - j][1];
          x2 := iKeep[NUM - 1 - j][2];
          y2 := iKeep[NUM - 1 - j][3];
        end;
        BitBlt(hdcMem,  0,  0, cx, cy, hdcScr, x1, y1, SRCCOPY); // 1 -> hdcMem
        BitBlt(hdcScr, x1, y1, cx, cy, hdcScr, x2, y2, SRCCOPY); // 2 -> 1
        BitBlt(hdcScr, x2, y2, cx, cy, hdcMem,  0,  0, SRCCOPY); // hdcMem -> 1
        Sleep(10);
      end;
    DeleteDC(hdcMem);
    ReleaseDC(hWnd, hdcScr);
    DeleteObject(hBitmap);
    LockWindowUpdate(0);
  end;
end.
