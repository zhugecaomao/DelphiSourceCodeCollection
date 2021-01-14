library EDRLib;

uses Windows;

function EdrCenterTextA(hdc: HDC; prc: PRect; pString: PChar): BOOL; stdcall;
var
  iLength: Integer;
  Size: TSize;
begin
  iLength := lstrlenA(pString);
  GetTextExtentPoint32A(hdc, pString, iLength, Size);
  Result := TextOutA(hdc, (prc.Right - prc.Left - Size.cx) div 2,
    (prc.Bottom - prc.Top - Size.cy) div 2, pString, iLength);
end;

function EdrCenterTextW(hdc: HDC; prc: PRect; pString: PWideChar): BOOL; stdcall;
var
  iLength: Integer;
  Size: TSize;
begin
  iLength := lstrlenW(pString);
  GetTextExtentPoint32W(hdc, pString, iLength, Size);
  Result := TextOutW(hdc, (prc.Right - prc.Left - Size.cx) div 2,
    (prc.Bottom - prc.Top - Size.cy) div 2, pString, iLength);
end;

exports
  EdrCenterTextA, EdrCenterTextW;

begin  
end.
