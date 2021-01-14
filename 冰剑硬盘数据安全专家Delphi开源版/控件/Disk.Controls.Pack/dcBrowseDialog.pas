{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcBrowseDialog.pas - dcBrowseDialog component

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcBrowseDialog;

interface

uses
  Windows, Classes, Controls, 
  dcInternal;

type
  TdcBrowseDialogSpecialLocation = (slNone, slDesktop,
                                    slPrograms, slControlPanel,
                                    slPrinters, slPersonal,
                                    slFavorites, slStartup,
                                    slRecent, slSendTo,
                                    slRecycleBin, slStartMenu,
                                    slDesktopDirectory, slMyComputer,
                                    slNetwork, slNethood,
                                    slFonts, slTemplates);

  TdcBrowseDialogOptions = set of (soShowEditBox, soShowFiles, soShowStatusText,
                                   soShowPathInStatus, soShowSysAncestors,
                                   soShowNetworkFiles, soSelectRootFolders);
  TdcBrowseDialogPosition = (bpDefault, bpScreenCenter);
  TdcBrowseFor = (forAnything, forFolder, forComputer, forPrinter);
  TdcBrowseDialogInitialized = procedure(Sender: TObject; Wnd: hWnd; var posLeft, posTop: Integer) of object;
  TdcBrowseDialogChanged = procedure(Sender: TObject; Folder: String) of object;
  TdcBrowseDialogSelected = procedure(Sender: TObject; Folder: String;
                                 var OKEnabled: ShortInt; var StatusText: String) of object;

  TdcNewFolderBtn = class(TPersistent)
  private
    FCaption: String;
    FPrompt: String;
    FVisible: Boolean;
  public
    constructor Create;
  published
    property Caption: String read FCaption write FCaption;
    property Prompt: String read FPrompt write FPrompt;
    property Visible: Boolean read FVisible write FVisible default False;
  end;

  TdcBrowseDialog = class(TumdcComponent)
  private
    FBrowseFor: TdcBrowseFor;
    FFolder: String;
    FOptions: TdcBrowseDialogOptions;
    FPosition: TdcBrowseDialogPosition;
    FSpecialLocation: TdcBrowseDialogSpecialLocation;
    FStatusText: String;
    FTitle: String;
    FNewFolder: TdcNewFolderBtn;

    FOnChanged: TdcBrowseDialogChanged;
    FOnSelected: TdcBrowseDialogSelected;
    FOnInitialized: TdcBrowseDialogInitialized;

    { for internal use }
    FDialogHandle: hWnd;
    FNewFolderHandle: hWnd;
    FSelectedFolder: String;
    FRestart: Boolean;
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; // False if error
  published
    property About;

    property BrowseFor: TdcBrowseFor read FBrowseFor write FBrowseFor default forFolder;
    property Folder: String read FFolder write FFolder;
    property Options: TdcBrowseDialogOptions read FOptions write FOptions default [soShowNetworkFiles, soSelectRootFolders];
    property Position: TdcBrowseDialogPosition read FPosition write FPosition default bpScreenCenter;
    property SpecialLocation: TdcBrowseDialogSpecialLocation read FSpecialLocation write FSpecialLocation default slNone;
    property StatusText: String read FStatusText write FStatusText;
    property Title: String read FTitle write FTitle;
    property NewFolder: TdcNewFolderBtn read FNewFolder write FNewFolder;

    property OnChanged: TdcBrowseDialogChanged read FOnChanged write FOnChanged;
    property OnSelected: TdcBrowseDialogSelected read FOnSelected write FOnSelected;
    property OnInitialized: TdcBrowseDialogInitialized read FOnInitialized write FOnInitialized;
  end;

implementation

uses Messages, Graphics, Forms, Dialogs,
     ActiveX, ShlObj, SysUtils,
     dcUtils, dcVersionInfo;

const
  BIF_EDITBOX = $0010;
  NEW_FOLDER_ID = $FF;

function GetTextWidth(Wnd: hWnd; Value: String): Integer;
var
  TempDC: hDC;
  TmpFont: TFont;
  OldFont: hFont;
  Size: TSize;
begin
  TempDC := GetDC(Wnd);
  TmpFont := TFont.Create;
  OldFont := SelectObject(TempDC, TmpFont.Handle);

  if GetTextExtentPoint32(TempDC, PChar(Value), Length(Value), Size) then
    Result := Size.cx
  else
    Result := -1;

  SelectObject(TempDC, OldFont);
  TmpFont.Free;
  ReleaseDC(Wnd, TempDC);
end;

function ExtractShortPath(Wnd: hWnd; Value: String; Width: Integer): String;
label LAB, LAB2;
var
  BeginP, EndP: Integer;
  St: String;
begin
  if GetTextWidth(Wnd, Value) > Width then
   begin
    St := Value + '\...';
    while GetTextWidth(Wnd, Value) > Width do
     begin
      BeginP := Pos('\', St);
      Delete(St, BeginP, 1);
      EndP := Pos('\', St);
      if EndP = Length(St) - 3 then
       begin
        Insert('\', St, 3);
        goto LAB;
       end;
      Delete(St, BeginP, EndP - BeginP);
      Value := St;
     end;
  LAB:
    Insert('\...', St, 3);
    SetLength(St, Length(St) - 4);
    Value := St;
   end;
  Result := Value;
end;

{ fix the folder name (June 8, 2001; Satyricon94) }
function FixFolderPath(Folder: String): String;

  function CorrectFolderName(Folder: String): String;
  begin
    Result := ExcludeTrailingBackslash(Folder);
    if (Length(Result) = 2) and (Result[2] = ':') then
      Result := IncludeTrailingBackslash(Result);
  end;

begin
  Result := CorrectFolderName(Folder);
  if not DirectoryExists(Result) then
   begin
    Result := ExtractFilePath(Result);
    Result := CorrectFolderName(Result);
   end;
end;

{ wndproc for 'New folder' button }
function NewFolderWndProc(Wnd: hWnd; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  I: Integer;
  BrowseDialog: TdcBrowseDialog;
  St, FolderName, FixedFolder: String;
begin
  BrowseDialog := TdcBrowseDialog(GetWindowLong(Wnd, GWL_USERDATA));

  if (Msg = WM_COMMAND) and (Lo(wParam) = NEW_FOLDER_ID) then
   with BrowseDialog do
    with FNewFolder do
     begin
      St := FCaption;
      I := Length(St);
      while (I > 1) and (St[I] = '.') do Dec(I);
      if I < Length(St) then SetLength(St, I);

      FixedFolder := FixFolderPath(FSelectedFolder);
      FolderName := InputBox(St, FPrompt + ' "' +
       ExtractShortPath(FDialogHandle, FixedFolder,
          244 - GetTextWidth(FDialogHandle, FPrompt + ' ""')) + '"', '');
      if FolderName <> '' then
       begin
        St := IncludeTrailingBackslash(FixedFolder) + FolderName;
        ForceDirectories(St);
        if DirectoryExists(St) then FSelectedFolder := St;
        FRestart := True;
        Keybd_Event(VK_ESCAPE, 0, 0, 0);
        Keybd_Event(VK_ESCAPE, 0, KEYEVENTF_KEYUP, 0);
       end;

      Result := 0;
     end
  else
   Result := DefDlgProc(Wnd, Msg, wParam, lParam);
end;

{ callback routine }
function BrowseDialogCallback(Wnd: hWnd; Msg: UINT; lParam, lpBrowseDialog: lParam): Integer; stdcall;
var
  BrowseDialog: TdcBrowseDialog;
  tmpFolder, tmpStatusText: String;
  Path: Array[0..MAX_PATH] of Char;
  OKEnabled: ShortInt;
  posLeft, posTop: Integer;
  R: TRect;

  TmpFont: TFont;
  ValidPath: Boolean;
  ButtonWidth: Integer;
begin
  BrowseDialog := TdcBrowseDialog(lpBrowseDialog);

  if Msg = BFFM_INITIALIZED then
   begin
     { Aug: 26, Implamentation of the 'New folder' button; Satyricon99 }
     BrowseDialog.FDialogHandle := Wnd;
     SetWindowLong(Wnd, GWL_USERDATA, lpBrowseDialog);

     tmpFolder := FixFolderPath(BrowseDialog.FFolder);

     if DirectoryExists(tmpFolder) then
       SendMessage(Wnd, BFFM_SETSELECTION, 1, Integer(PChar(tmpFolder)));

     if BrowseDialog.FTitle <> '' then
       SendMessage(Wnd, WM_SETTEXT, 0, Integer(PChar(BrowseDialog.FTitle)));

     posLeft := -1;
     posTop := -1;
     if BrowseDialog.FPosition = bpScreenCenter then
      begin
       GetWindowRect(Wnd, R);
       posLeft := (Screen.Width div 2) - ((R.Right - R.Left) div 2);
       posTop := (Screen.Height div 2) - ((R.Bottom - R.Top) div 2);
       SetWindowPos(Wnd, 0, posLeft, posTop, 0, 0, SWP_NOSIZE or SWP_NOZORDER);
      end;

     { adding the button }
     with BrowseDialog, BrowseDialog.FNewFolder do
      if FVisible then
       begin
        ButtonWidth := GetTextWidth(Wnd, '  ' + FCaption + '  ');
        if ButtonWidth < 75 then ButtonWidth := 75;

        FNewFolderHandle := CreateWindow('BUTTON', PChar(FCaption),
          WS_CHILD or WS_CLIPSIBLINGS or WS_VISIBLE or WS_TABSTOP,
          12, 270, ButtonWidth, 23, Wnd, NEW_FOLDER_ID, hInstance, nil);
        EnableWindow(FNewFolderHandle, DirectoryExists(tmpFolder));
        SetWindowLong(Wnd, GWL_WNDPROC, LongInt(@NewFolderWndProc));

        TmpFont := TFont.Create;        
        PostMessage(FNewFolderHandle, WM_SETFONT, LongInt(TmpFont.Handle), MAKELPARAM(1, 0));
        TmpFont.Free;
       end;

     { OnInitialized }
     with BrowseDialog do
      if Assigned(FOnInitialized) then
       begin
        OnInitialized(BrowseDialog, Wnd, posLeft, posTop);
        if (posLeft <> -1) and (posTop <> -1) then
          SetWindowPos(Wnd, 0, posLeft, posTop, 0, 0, SWP_NOSIZE or SWP_NOZORDER);
       end;
   end
  else
   if Msg = BFFM_SELCHANGED then
    begin
     OKEnabled := -1;
     tmpStatusText := '';

     with BrowseDialog do
      begin
       ValidPath := SHGetPathFromIDList(PItemIDList(lParam), Path);
       if (FNewFolder.FVisible) and (FNewFolderHandle <> 0) then
         EnableWindow(FNewFolderHandle, ValidPath);

       FSelectedFolder := StrPas(Path);
       if (soShowStatusText in FOptions) and
          (soShowPathInStatus in FOptions) then
        begin
         SetLength(tmpStatusText, MAX_PATH);
         tmpStatusText := ExtractShortPath(FDialogHandle, FSelectedFolder, 294);
        end;

       if not (soSelectRootFolders in FOptions) and
          (Length(FSelectedFolder) < 4) then
         OKEnabled := 0;

       if Assigned(FOnSelected) then
         FOnSelected(BrowseDialog, FSelectedFolder, OKEnabled, tmpStatusText);
      end;   

     if OKEnabled <> -1 then
       SendMessage(Wnd, BFFM_ENABLEOK, OKEnabled, OKEnabled);

     if tmpStatusText <> '' then
       SendMessage(Wnd, BFFM_SETSTATUSTEXT, 0, Integer(PChar(tmpStatusText)));
    end;

  Result := 0; 
end;


{ TdcNewFolderBtn }
constructor TdcNewFolderBtn.Create;
begin
  inherited Create;
  FCaption := 'New folder...';
  FPrompt := 'Create folder in';
end;


{ TdcBrowseDialog component }
constructor TdcBrowseDialog.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FNewFolder := TdcNewFolderBtn.Create;
  FBrowseFor := forFolder;
  FStatusText := 'Select folder';
  FOptions := [soShowNetworkFiles, soSelectRootFolders];
  FPosition := bpScreenCenter;
end;

destructor TdcBrowseDialog.Destroy;
begin
  FNewFolder.Free;
  inherited Destroy;
end;

{$WARNINGS OFF}
function TdcBrowseDialog.Execute: Boolean;
const
  CSIDLs: Array[TdcBrowseDialogSpecialLocation] of Integer=
              (-1, CSIDL_DESKTOP, CSIDL_PROGRAMS,
               CSIDL_CONTROLS, CSIDL_PRINTERS,
               CSIDL_PERSONAL, CSIDL_FAVORITES,
               CSIDL_STARTUP, CSIDL_RECENT,
               CSIDL_SENDTO, CSIDL_BITBUCKET,
               CSIDL_STARTMENU, CSIDL_DESKTOPDIRECTORY,
               CSIDL_DRIVES, CSIDL_NETWORK,
               CSIDL_NETHOOD, CSIDL_FONTS,
               CSIDL_TEMPLATES);
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  TempPath: Array[0..MAX_PATH] of Char;
begin
  try
    if Owner is TWinControl then
      BrowseInfo.hwndOwner := (Owner as TWinControl).Handle
    else
     if Application.MainForm <> nil then
       BrowseInfo.hwndOwner := Application.MainForm.Handle
     else
       BrowseInfo.hwndOwner := 0;  

    if FSpecialLocation = slNone then
      BrowseInfo.pidlRoot := nil
    else
      SHGetSpecialFolderLocation(Application.Handle,
                                 CSIDLs[FSpecialLocation],
                                 BrowseInfo.pidlRoot);

    BrowseInfo.pszDisplayName := TempPath;                                 
    BrowseInfo.lpszTitle := PChar(FStatusText);

    BrowseInfo.ulFlags := 0;
    if soShowStatusText in FOptions then
      inc(BrowseInfo.ulFlags, BIF_STATUSTEXT);
    if not (soShowSysAncestors in FOptions) then
      inc(BrowseInfo.ulFlags, BIF_RETURNFSANCESTORS);
    if not (soShowNetworkFiles in FOptions) then
      inc(BrowseInfo.ulFlags, BIF_DONTGOBELOWDOMAIN);
    if soShowFiles in FOptions then
      inc(BrowseInfo.ulFlags, BIF_BROWSEINCLUDEFILES);
    if soShowEditBox in FOptions then
      inc(BrowseInfo.ulFlags, BIF_EDITBOX);

    if FBrowseFor = forFolder then
      inc(BrowseInfo.ulFlags, BIF_RETURNONLYFSDIRS)
    else
     if FBrowseFor = forComputer then
       inc(BrowseInfo.ulFlags, BIF_BROWSEFORCOMPUTER)
     else
      if FBrowseFor = forPrinter then
        inc(BrowseInfo.ulFlags, BIF_BROWSEFORPRINTER);

    BrowseInfo.lpfn := @BrowseDialogCallback;
    BrowseInfo.lParam := LongInt(Self);
    BrowseInfo.iImage := 0;

    FSelectedFolder := FFolder;
    repeat
      FFolder := FSelectedFolder;
      FRestart := False;
      ItemIDList := SHBrowseForFolder(BrowseInfo);
    until not FRestart;

    Result := ItemIDList <> nil;
    if Result then
     begin
      SHGetPathFromIDList(ItemIDList, TempPath);
      FFolder := StrPas(TempPath);

      if Assigned(FOnChanged) then
        FOnChanged(Self, FFolder);
     end;

   finally
     CoTaskMemFree(ItemIDList);
     CoTaskMemFree(BrowseInfo.pidlRoot);
   end;
end;
{$WARNINGS ON}

end.