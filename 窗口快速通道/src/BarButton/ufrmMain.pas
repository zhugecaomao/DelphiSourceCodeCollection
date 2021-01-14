unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, CoolTrayIcon;
  
{$I ../Common/INCDATA.INC}
{$A-}
const
  NUM_GET_WINDOW_ATTEMPTS = 128; // Lots of the windows found are no use
  EDGE=2;

type
  TfrmMain = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    XPManifest1: TXPManifest;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCaptionFont: THandle;
    FCurHookForm: THandle;
    procedure Reposition(var Message: TMessage); message MSG_REPOSITION;
    procedure FindWin(var Message: TMessage); message MSG_FINDWIN;
    procedure HasFormClosed(var Message: TMessage); message MSG_CLOSE;
    procedure Attach(hwnd: THandle; style: DWORD);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  ufrmBar, DbugIntf;

{$R *.dfm}

procedure GetDLLData(var aReceiveStruct: PReceiveStruct); stdcall; external 'BarButton.DLL';
function SetHook(aHandle: THandle) : BOOL; external 'BarButton.DLL';
function RemoveHook : BOOL ; external 'BarButton.DLL';

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  SetHook(Handle);
  SendMessage(Self.Handle, MSG_FINDWIN, 0, 0);
end;

procedure TfrmMain.btn2Click(Sender: TObject);
begin
  RemoveHook;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RemoveHook;
  DeleteObject(FCaptionFont);
end;

function IsValidStyles(style: DWORD; exStyle: DWORD): Boolean;
var
  STYLES_OF_INTEREST, STYLES_WANTED, EXSTYLES_OF_INTEREST, EXSTYLES_WANTED: Integer;
begin
  STYLES_OF_INTEREST := WS_CAPTION or WS_VISIBLE or WS_CHILD;
  STYLES_WANTED := WS_CAPTION or WS_VISIBLE;
  EXSTYLES_OF_INTEREST := WS_EX_TOOLWINDOW or WS_EX_MDICHILD;
  EXSTYLES_WANTED := 0;
  Result := ((style and STYLES_OF_INTEREST) = STYLES_WANTED) and
         ((exStyle and EXSTYLES_OF_INTEREST ) = EXSTYLES_WANTED);
end;

function IsWindowSuitable(hwnd: THandle; var style: DWORD): Boolean;
begin
  style := GetWindowLong(hwnd, GWL_STYLE);
  Result := IsWindowVisible(hwnd)
      and (not IsIconic(hwnd))
      and IsValidStyles(style, GetWindowLong(hwnd, GWL_EXSTYLE ))
      and (hwnd <> frmBar.Handle);
end;

procedure CalcButtonOffsets(aHandle : THandle; var YOffset, AddOn: Integer);
var
  nX: Integer;
  dwStyle, dwExStyle: Longint;
  nButtonsWidth, nSysButSize: Integer;
begin
  // get window styles
  dwStyle:=GetWindowLong(aHandle, GWL_STYLE);
  dwExStyle:=GetWindowLong(aHandle, GWL_EXSTYLE);

  // get size of border
  if ((dwStyle and WS_THICKFRAME)<>0) then
  begin
    YOffset:=GetSystemMetrics(SM_CYSIZEFRAME);
    nX:=GetSystemMetrics(SM_CXSIZEFRAME);
  end
   else
  begin
    YOffset:=GetSystemMetrics(SM_CYFIXEDFRAME);
    nX:=GetSystemMetrics(SM_CXFIXEDFRAME);
  end;

  nButtonsWidth:=0;

  // handle tool window
  if ((dwExStyle and WS_EX_TOOLWINDOW)<>0) then begin
    nSysButSize:=GetSystemMetrics(SM_CXSMSIZE);

    if ((dwStyle and WS_SYSMENU)<>0) then
      inc(nButtonsWidth,nSysButSize);

  // handle usual window
  end else
  begin
    nSysButSize:=GetSystemMetrics(SM_CXSIZE);  // size of a system button

    if ((dwStyle and WS_SYSMENU)<>0) then begin
      inc(nButtonsWidth, nSysButSize);

      if ((dwStyle and (WS_MINIMIZEBOX or WS_MAXIMIZEBOX))<>0) then
        inc(nButtonsWidth, (nSysButSize*2))

      else if ((dwExStyle and WS_EX_CONTEXTHELP)<>0) then
        inc(nButtonsWidth, nSysButSize);
    end;
  end;
  // this is now the total width of all windows' buttons
  AddOn:=nButtonsWidth+nX+1; // +1 as windows draws over the right side of our button
end;

function StringWidth(font: HFONT; s: string; len: Integer): Integer;
var
  width: Integer;
  oldFont: HFONT;
  size: TSize;
  aHdc: HDC;
begin
  Result := 0;
  { Any old DC will do, since we're drawing nothing, so pick one that is
     guaranteed to exist always - the entire desktop }
  aHdc := GetDC(0);
  if aHdc <> 0 then
  begin
    oldFont := SelectObject( aHdc, font );
    if GetTextExtentPoint32(aHdc, PChar(s), len, size) then
      Result := size.cx;
    SelectObject(aHdc, oldFont);
    ReleaseDC(0, aHdc);
  end;
end;

procedure TfrmMain.Reposition(var Message: TMessage);
var
  ReceiveStruct: PReceiveStruct;
  hwnd: THandle;
  style: DWORD;
  i: Integer;
begin
  GetDLLData(ReceiveStruct);
  if ReceiveStruct.CurHandle = frmBar.Handle then
    Exit;
  Attach(FCurHookForm, style);
end;

procedure TfrmMain.btn3Click(Sender: TObject);
begin
  ShowWindow(frmBar.Handle, SW_SHOWNA);
  frmBar.Visible := True;
  //frmBar.Show;
end;

procedure TfrmMain.Attach(hwnd: THandle; style: DWORD);
var
  HookedFormRect: TRect;
  top, left, height: Integer;
  TmpSytle: integer;
  YOffset, AddOn: Integer;// offset
  chars, FormBaseWidth: Integer;
  Title: string;
begin
  CalcButtonOffsets(Handle, YOffset, AddOn);
  SetLength (Title, 255);
  chars := GetWindowText(hwnd, PChar(Title), Length(Title));
  Title := Trim(Title);
  FormBaseWidth := StringWidth(FCaptionFont, title, chars);
  if (style and WS_SYSMENU) = WS_SYSMENU then
    FormBaseWidth := FormBaseWidth + 30;
  frmBar.HookedFormBaseWidth := FormBaseWidth + AddOn;
  //SendDebug('hwnd:' + IntToStr(hwnd) + ' chars:' + IntToStr(chars) +
    //        ' FormBaseWidth:' + IntToStr(FormBaseWidth) + ' title:' + Title);
  GetWindowRect(hwnd, HookedFormRect);
  height := GetSystemMetrics(SM_CYSIZE) - EDGE*2;
  frmBar.Height := height;
  if (style and WS_THICKFRAME) <> 0 then
  begin
    TmpSytle := SM_CYSIZEFRAME;
  end
  else begin
    TmpSytle := SM_CYFIXEDFRAME;
  end;
  top := HookedFormRect.Top + YOffset + EDGE;
  left := HookedFormRect.Right - AddOn - frmBar.Width;
  SetWindowPos(frmBar.Handle,
               HWND_TOPMOST,
               left, top, frmBar.Width, height,
               SWP_NOACTIVATE or SWP_NOCOPYBITS or SWP_NOSENDCHANGING or
               SWP_NOZORDER or SWP_NOOWNERZORDER);
  ShowWindow(frmBar.Handle, SW_SHOWNA);//to make it stay on top.
  frmBar.HookedHandle := hwnd;// --
end;

procedure TfrmMain.HasFormClosed(var Message: TMessage);
var
  ReceiveStruct: PReceiveStruct;
begin
{ TODO -ovicalloy :
由于窗口隐藏再显示的问题，这里不做处理。
将存在一定量的内存泄漏问题，不过不严重 }
{ TODO -ovicalloy : 在关闭窗口的时候，释放托盘图标。 }
  //GetDLLData(ReceiveStruct);
  //SendDebugEx(IntToStr(ReceiveStruct.CurHandle), mtInformation);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  metrics:PNONCLIENTMETRICS;
begin
  { Need to use the exact caption fount, since I'm using this to measure the
     size of a window's existing caption }
  metrics.cbSize := sizeof(NONCLIENTMETRICS);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @metrics, 0) then
    FCaptionFont := CreateFontIndirect(metrics.lfCaptionFont);
  //if( !CaptionFont )
    //return FALSE;
end;

procedure TfrmMain.FindWin(var Message: TMessage);
var
  ReceiveStruct: PReceiveStruct;
  hwnd: THandle;
  style: DWORD;
  i: Integer;
begin
  GetDLLData(ReceiveStruct);
  if ReceiveStruct.CurHandle = frmBar.Handle then
    Exit;
  i := NUM_GET_WINDOW_ATTEMPTS;
  { TODO -ovicalloy : if active form is ok. then hooked it first. }
  hwnd := GetWindow(GetDesktopWindow, GW_CHILD);
  while hwnd <> 0 do
  begin
    hwnd := GetWindow(hwnd, GW_HWNDNEXT);
    if IsWindowSuitable(hwnd, style) then
    begin
      FCurHookForm := hwnd;
      Attach(hwnd, style);
      //GetWindowRect(hwnd, Rect);
      //frmBar.Top := Rect.Top;
      //frmBar.Left := Rect.Left;
      Exit;
    end;
    i := i - 1;
    if i = 0 then
    begin
      hwnd := 0;
    end;
  end;
end;

end.
