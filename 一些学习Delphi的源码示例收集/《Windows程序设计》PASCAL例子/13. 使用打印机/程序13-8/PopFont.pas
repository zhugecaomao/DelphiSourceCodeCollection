unit PopFont;

interface

  // 初始化
procedure PopFontInitialize(hWndEdit: LongWord);
  // 反初始化
procedure PopFontDeinitialize();
  // 字体选择对话框
function PopFontChooseFont(hWnd: LongWord): Boolean;
  // 设置字体
procedure PopFontSetFont(hWndEdit: LongWord);

implementation

uses
  Windows, CommDlg, Messages;

var
  logfont: TLogFont;
  hFont: LongWord;

  // 初始化
procedure PopFontInitialize(hWndEdit: LongWord);
begin
  GetObject(GetStockObject(SYSTEM_FONT), SizeOf(TLogFont), Pointer(@logfont));
  hFont := CreateFontIndirect(logfont);
  SendMessage(hWndEdit, WM_SETFONT, hFont, 0);
end;

  // 反初始化
procedure PopFontDeinitialize();
begin
  DeleteObject(hFont);
end;

  // 字体选择对话框
function PopFontChooseFont(hWnd: LongWord): Boolean;
const
{$J+}
  cf: TChooseFont =
   ( lStructSize: SizeOf(TChooseFont);
     hwndOwner: 0;
     hDC: 0;
     lpLogFont: @logfont;
     iPointSize: 0;
     Flags: CF_INITTOLOGFONTSTRUCT or CF_SCREENFONTS or CF_EFFECTS;
     rgbColors: 0;
     lCustData: 0;
     lpfnHook: nil;
     lpTemplateName: nil;
     hInstance: 0;
     lpszStyle: nil;
     nFontType: 0;
     nSizeMin: 0;
     nSizeMax: 0  );
{$J-}
begin
  cf.hwndOwner := hWnd;
  Result := ChooseFont(cf);
end;

  // 设置字体
procedure PopFontSetFont(hWndEdit: LongWord);
var
  hFontNew: LongWord;
  Rect: TRect;
begin
  hFontNew := CreateFontIndirect(logfont);
  SendMessage(hWndEdit, WM_SETFONT, hFontNew, 0);
  DeleteObject(hFont);
  hFont := hFontNew;
  GetClientRect(hWndEdit, Rect);
  InvalidateRect(hWndEdit, @Rect, TRUE);
end;

end.
