{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcShellProperties.pas - dcShellProperties component

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

unit dcShellProperties;

interface

uses
  Windows, Classes, Controls, Menus,
  dcInternal;

type
  TdcBeforeMenuItemClickEvent = procedure(Sender: TObject; const FileName: String; MenuItemID: Integer; var Discard: Boolean) of object;
  TdcAfterMenuItemClickEvent = procedure(Sender: TObject; const FileName: String; MenuItemID: Integer) of object;
  TdcContextMenuEvent = procedure(Sender: TObject; const FileName: String) of object;

  TdcContextMenuOption = (moCanRename, moAllowDelete, moAllowCut, moAllowCopy, moAllowPaste, moAllowCreateShortcut, moActionItems, moExtendedItems, moSystemItems);
  TdcContextMenuOptions = set of TdcContextMenuOption;
  TdcShellProperties = class(TumdcComponent)
  private
    FFileName: String;
    FMenuAlignment: TPopupAlignment;
    FMenuOptions: TdcContextMenuOptions;

    FOnBeforeMenuItemClick: TdcBeforeMenuItemClickEvent;
    FOnAfterMenuItemClick: TdcAfterMenuItemClickEvent;

    FOnDelete, FOnRename: TdcContextMenuEvent;

    procedure SetFileName(Value: String);

    function ShowInterface(const FileName: String; IsContextMenu: Boolean): Boolean;
  protected
  public
    constructor Create(aOwner: TComponent); override;

    function ShowPropertiesByFile(const FileName: String): Boolean;
    function ShowContextMenuByFile(const FileName: String): Boolean;

    function ShowProperties: Boolean;
    function ShowContextMenu: Boolean;
  published
    property About;

    property FileName: String read FFileName write SetFileName stored False;
    property MenuAlignment: TPopupAlignment read FMenuAlignment write FMenuAlignment default paLeft;
    property MenuOptions: TdcContextMenuOptions read FMenuOptions write FMenuOptions default [moAllowDelete, moAllowCut, moAllowCopy, moAllowPaste, moAllowCreateShortcut, moActionItems, moExtendedItems, moSystemItems];

    property OnBeforeMenuItemClick: TdcBeforeMenuItemClickEvent read FOnBeforeMenuItemClick write FOnBeforeMenuItemClick;
    property OnAfterMenuItemClick: TdcAfterMenuItemClickEvent read FOnAfterMenuItemClick write FOnAfterMenuItemClick;
    property OnDelete: TdcContextMenuEvent read FOnDelete write FOnDelete;
    property OnRename: TdcContextMenuEvent read FOnRename write FOnRename;
  end;

implementation

uses
  Messages, Forms, SysUtils, ShellAPI, ShlObj, ActiveX, dcUtils;

const
  IID_IContextMenu3: TGUID = (
    D1:$BCFCE0A0; D2:$EC17; D3:$11D0; D4:($8D,$10,$00,$A0,$C9,$0F,$27,$19));

{$IFDEF D3}
const
  SID_IContextMenu3 = '{BCFCE0A0-EC17-11d0-8D10-00A0C90F2719}';

type
  { D3 and C3 got the declaration of IContextMenu2 wrong in ShlObj.pas unit. }
  IContextMenu2 = interface(IContextMenu)
    [SID_IContextMenu2]
    function HandleMenuMsg(uMsg: UINT; wParam: WPARAM; lParam: LPARAM): HResult;
       stdcall;
  end;

  { Only D4 has this one }
  IContextMenu3 = interface(IContextMenu2)
    [SID_IContextMenu3]
    function HandleMenuMsg2(uMsg: UINT; wParam: WPARAM; lParam: LPARAM;
       var Result: longint): HResult; stdcall;
  end;
{$ENDIF}

type
  DoubleWord = record
    case Boolean of
      True: (Lo, Hi: word);
      False: (DW: DWORD);
  end;

var
  IsCM2: Boolean;
  IsCM3: Boolean;

function MenuCallbackProc(Wnd: HWND; Msg: UINT; wParam: WPARAM;
   lParam: LPARAM): LResult; stdcall; export;
var
  CM2: IContextMenu2;
  CM3: IContextMenu3;
  Name, Help: String;
  CM: IContextMenu;
  DWParam: DoubleWord absolute wParam;
begin
  case Msg of
    WM_CREATE: begin
                if IsCM3 then
                 begin
                  // get pointer to the IContextMenu3 on whose behalf we're acting
                  CM3 := IContextMenu3(PCreateStruct(lParam).lpCreateParams);
                  // Save it in window info
                  SetWindowLong(Wnd, GWL_USERDATA, LongInt(CM3));
                 end
                else
                 if IsCM2 then
                  begin
                   // get pointer to the IContextMenu2 on whose behalf we're acting
                   CM2 := IContextMenu2(PCreateStruct(lParam).lpCreateParams);
                   // Save it in window info
                   SetWindowLong(Wnd, GWL_USERDATA, LongInt(CM2));
                  end
                 else
                  begin
                   // get pointer to the IContextMenu on whose behalf we're acting
                   CM := IContextMenu(PCreateStruct(lParam).lpCreateParams);
                   // Save it in window info
                   SetWindowLong(Wnd, GWL_USERDATA, LongInt(CM));
                  end;
                Result := DefWindowProc(Wnd, Msg, wParam, lParam);
               end;
    WM_DRAWITEM,
    WM_MEASUREITEM,
    WM_INITMENUPOPUP: begin
                       if IsCM3 then
                        begin
                         // grab object pointer from window data -- we put it there in WM_CREATE
                         CM3 := IContextMenu3(GetWindowLong(Wnd, GWL_USERDATA));
                         Assert(CM3 <> nil, 'NIL Context Menu!');
                         // pass along to context menu
                         CM3.HandleMenuMsg2(Msg, wParam, lParam, Result);
                        end
                       else
                        if IsCM2 then
                         begin
                          // grab object pointer from window data -- we put it there in WM_CREATE
                          CM2 := IContextMenu2(GetWindowLong(Wnd, GWL_USERDATA));
                          Assert(CM2 <> nil, 'NIL Context Menu!');
                          // pass along to context menu
                          CM2.HandleMenuMsg(Msg, wParam, lParam);
                         end;
                       if Msg = WM_INITMENUPOPUP then Result := 0
                       else Result := 1;
                      end;

    // this is to set Application.Hint
    WM_MENUSELECT: begin
                    CM := IContextMenu(GetWindowLong(Wnd, GWL_USERDATA));
                    if ((DWParam.Hi = $FFFF) and (lParam = 0)) then
                      Application.Hint :=  ''
                    else
                     if DWParam.Lo >= 1 then
                      begin
                       SetLength(Name, MAX_PATH);
                       // If it doesn't have one, it won't null out the string so we have to.
                       Name[1] := #0;
                       CM.GetCommandString(DWParam.Lo - 1, GCS_VERB, nil, PChar(Name), MAX_PATH);
                       SetLength(Name, StrLen(PChar(Name)));
                       SetLength(Help, MAX_PATH);
                       // If it doesn't have one, it won't null out the string so we have to.
                       Help[1] := #0;
                       CM.GetCommandString(DWParam.Lo - 1, GCS_HELPTEXT, nil, PChar(Help), MAX_PATH);
                       SetLength(Help, StrLen(PChar(Help)));
                       // The pipe ('|') separates the short hint from the long one.
                       Application.Hint := Name + '|' + Help;
                      end;
                   end;
   else
     Result := DefWindowProc(Wnd, Msg, wParam, lParam);
  end;
end;

procedure TdcShellProperties.SetFileName(Value: String);
begin
  { deleting odd params from filename (like "c:\file.exe /autorun" = "c:\file.exe")}
  GetPureFileName(Value);
  while (Value <> '') and (Value[Length(Value)] = '\') and (Value[Length(Value) - 1] <> ':') do
    SetLength(Value, Length(Value) - 1);

  if FFileName <> Value then
    FFileName := Value;
end;

function TdcShellProperties.ShowInterface(const FileName: String; IsContextMenu: Boolean): Boolean;

  function HandleContextMenu(const CtxMenu: IContextMenu; Attr: ULONG): boolean;
  const
    MenuAlignments: Array[TPopupAlignment] of Integer = (TPM_LEFTALIGN, TPM_RIGHTALIGN, TPM_CENTERALIGN);
    CanRenameFlags: Array[Boolean] of Integer = (0, CMF_CANRENAME);

    CCREATESHORTCUT = $11;
    CDELETE     = $12;
    CRENAME     = $13;
    CPROPERTIES = $14;
    CCUT        = $19;
    CCOPY       = $1A;
    CPASTE      = $1B;
  var
    Popup: hMenu;
    ICI: TCMInvokeCommandInfo;
    MenuCmd: Cardinal;
    CallbackWnd: HWnd;
    AWndClass: TWndClass;
    Flags: Integer;
    Discard: Boolean;
    MousePos: TPoint;
  begin
    Result := False;
    CallbackWnd := 0;

    // FLAGS
    Flags := CMF_EXPLORE;

    if not (not (moActionItems in FMenuOptions) and
            not (moExtendedItems in FMenuOptions) and
            not (moSystemItems in FMenuOptions)) then
    { ! SystemOnly ! }
     if not (moExtendedItems in FMenuOptions) and
        not (moActionItems in FMenuOptions) then
       Flags := Flags + CMF_NOVERBS
     else
       { ! Action Only ! }
       if not (moExtendedItems in FMenuOptions) and
          not (moSystemItems in FMenuOptions) then
         Flags := Flags + CMF_VERBSONLY + CMF_DEFAULTONLY
       else
         { ! Action + System ! }
         if not (moExtendedItems in FMenuOptions) then
           Flags := Flags + CMF_DEFAULTONLY
         else
           { ! Extended or Extended + Action}
           if (moExtendedItems in FMenuOptions) and
              not (moSystemItems in FMenuOptions) then
             Flags := Flags + CMF_VERBSONLY;

    FillChar(ICI, SizeOf(TCMInvokeCommandInfo), #0);
    with ICI do
     begin
      cbSize := SizeOf(TCMInvokeCommandInfo);
      hWnd := GetActiveWindow;
      nShow := SW_SHOWNORMAL;
     end;
    if IsContextMenu then
     begin
      Popup := CreatePopupMenu;
      try
        if Succeeded(CtxMenu.QueryContextMenu(Popup, 0, 1, $7FFF,
                     CanRenameFlags[moCanRename in FMenuOptions] or
                     Flags)) then
         begin
          FillChar(AWndClass, SizeOf(AWndClass), #0);
          AWndClass.lpszClassName := 'ItemPropMenuCallbackHelper';
          AWndClass.Style := CS_PARENTDC;
          AWndClass.lpfnWndProc := @MenuCallbackProc;
          AWndClass.hInstance := HInstance;
          Windows.RegisterClass(AWndClass);
          CallbackWnd := CreateWindow('ItemPropMenuCallbackHelper',
                                      'ItemPropCallbackProcessor',
                                      WS_POPUPWINDOW, 0, 0, 0, 0, 0,
                                      0, HInstance, Pointer(CtxMenu));

          Result := True; // We displayed the menu, that's it unless they
                          // make a selection.
          GetCursorPos(MousePos);
          MenuCmd := Cardinal(TrackPopupMenuEx(Popup, MenuAlignments[FMenuAlignment] or
                              TPM_RETURNCMD or TPM_LEFTBUTTON or TPM_RIGHTBUTTON, MousePos.x, MousePos.y, CallbackWnd, nil));

          case MenuCmd of
            CRENAME: begin
                      if Assigned(FOnRename) then
                        FOnRename(Self, FileName);
                      Result := True;  
                      Exit;  
                     end;
            CCREATESHORTCUT: if not (moAllowDelete in FMenuOptions) then
                              begin
                               Result := True;
                               Exit;
                              end;
            CDELETE: if not (moAllowDelete in FMenuOptions) then
                      begin
                       Result := True;
                       Exit;
                      end;
            CCUT: if not (moAllowCut in FMenuOptions) then
                   begin
                    Result := True;
                    Exit;
                   end;
            CCOPY: if not (moAllowCopy in FMenuOptions) then
                    begin
                     Result := True;
                     Exit;
                    end;
            CPASTE: if not (moAllowPaste in FMenuOptions) then
                     begin
                      Result := True;
                      Exit;
                     end;
           end;

          if MenuCmd <> 0 then
           begin
            if Assigned(FOnBeforeMenuItemClick) then
             begin
              Discard := False;
              FOnBeforeMenuItemClick(Self, FileName, MenuCmd, Discard);
              if Discard then
               begin
                Result := True;
                Exit;
               end;
             end;

            ICI.lpVerb := MakeIntResource(MenuCmd - 1);
            Result := Succeeded(CtxMenu.InvokeCommand(ICI));

            if Assigned(FOnAfterMenuItemClick) then
              FOnAfterMenuItemClick(Self, FileName, MenuCmd);

            if (MenuCmd = CDELETE) and not ObjectExists(FileName) and
               Assigned(FOnDelete) then
              FOnDelete(Self, FileName);
           end;
         end;
      finally
        DestroyMenu(Popup);
        if CallbackWnd <> 0 then
          DestroyWindow(CallbackWnd);
      end
     end
    else
{* Possible Win98SE bug - does not returns
   SFGA_HASPROPSHEET flag for disks (AK) *}
//     if Attr and SFGAO_HASPROPSHEET <> 0 then
      begin
       ICI.lpVerb := 'properties'; // do not localize
       Result := Succeeded(CtxMenu.InvokeCommand(ICI));
      end;
  end;

  function HandleFromPIDLs(Parent: HWND; SubFolder: IShellFolder;
     var ItemID: PItemIDList; Attr: ULONG; PidlCount: integer): boolean;
  var
    ContextMenu: IContextMenu;
    ContextMenu2: IContextMenu2;
    ContextMenu3: IContextMenu3;
  begin
    Result := False;
    IsCM2 := False;

    if Succeeded(SubFolder.GetUIObjectOf(Parent, PidlCount, ItemID,
       IID_IContextMenu, nil, pointer(ContextMenu))) then
    begin
      if Succeeded(ContextMenu.QueryInterface(IID_IContextMenu2,
         Pointer(ContextMenu2))) then
      begin
        {$IFDEF NO_COM_CLEANUP}
        ContextMenu.Release;
        {$ENDIF}
        ContextMenu := ContextMenu2;
        IsCM2 := True;

        if Succeeded(ContextMenu.QueryInterface(IID_IContextMenu3,
           Pointer(ContextMenu3))) then
         begin
          {$IFDEF NO_COM_CLEANUP}
          ContextMenu.Release;
          {$ENDIF}
          ContextMenu := ContextMenu3;
          IsCM3 := True;
         end;
      end;
      try
        Result := HandleContextMenu(ContextMenu, Attr);
      finally
        {$IFDEF NO_COM_CLEANUP}
        ContextMenu.Release;
        {$ENDIF}
      end;
    end;
  end;

var
  ShellMalloc: IMalloc;
  DesktopFolder, CompFolder, SubFolder: IShellFolder;
  FolderID, ItemID: PItemIDList;
  Eaten, ulAttr: ULONG;
  uiAttr: UINT;
  oleAll, oleSubDir, oleFilename: WideString;
  OldCursor: TCursor;
  EnumList: IEnumIDList;
  CompID: PItemIDList;
  Fetched: ULONG;
begin
  { deleting odd params from filename (like "c:\file.exe /autorun" = "c:\file.exe")}
  GetPureFileName(FileName);

  IsCM2 := False;
  IsCM3 := False;
  Result := False;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    SHGetMalloc(ShellMalloc);
    try
      oleSubDir := ExtractFilePath(FileName);
      try
        oleFileName := ExtractFileName(FileName);
        try
          if Succeeded(SHGetDesktopFolder(DesktopFolder)) then
           try
             if Succeeded(DesktopFolder.ParseDisplayName(GetActiveWindow, nil,
                PWideChar(oleSubDir), Eaten, FolderID, ulAttr)) then
              try
                if Succeeded(DesktopFolder.BindToObject(FolderID, nil,
                   IID_IShellFolder, Pointer(SubFolder))) then
                try
                  if Succeeded(SubFolder.ParseDisplayName(GetActiveWindow, nil,
                     PWideChar(oleFileName), Eaten, ItemID, ulAttr)) then
                   try
                     SubFolder.GetAttributesOf(1, ItemID, uiAttr);
                     Result := HandleFromPIDLS(GetActiveWindow, SubFolder, ItemID, uiAttr, 1);
                   finally
                     ShellMalloc.Free(ItemID);
                   end
                  else
                   begin // This is probably drive
                    oleAll := FileName;
                    if Succeeded(DesktopFolder.EnumObjects(GetActiveWindow,
                       SHCONTF_FOLDERS, EnumList)) then
                     try
                       if (EnumList.Next(1, CompID, Fetched) = S_OK) and
                          Succeeded(DesktopFolder.BindToObject(CompID, nil,
                                    IID_IShellFolder, Pointer(CompFolder))) then
                         try
                           if Succeeded(CompFolder.ParseDisplayName(GetActiveWindow, nil,
                              PWideChar(oleAll), Eaten, ItemID, ulAttr)) then
                           try
                             CompFolder.GetAttributesOf(1, ItemID, uiAttr);
                             Result := HandleFromPIDLS(GetActiveWindow, CompFolder, ItemID, uiAttr, 1);
                           finally
                             ShellMalloc.Free(ItemID);
                           end;
                         finally
{$IFDEF NO_COM_CLEANUP}              CompFolder.Release; {$ENDIF}
                         end;
                     finally
{$IFDEF NO_COM_CLEANUP}          EnumList.Release; {$ENDIF}
                     end;
{$IFDEF NO_COM_CLEANUP}       SysFreeString(oleAll); {$ENDIF}
                   end;
                finally
{$IFDEF NO_COM_CLEANUP}     SubFolder.Release; {$ENDIF}
                end;
              finally
                ShellMalloc.Free(FolderID);
              end;
            finally
{$IFDEF NO_COM_CLEANUP} ShellFolder.Release; {$ENDIF}
            end;
          finally
{$IFDEF NO_COM_CLEANUP} SysFreeString(oleFilename); {$ENDIF}
          end;
        finally
{$IFDEF NO_COM_CLEANUP} SysFreeString(oleSubDir); {$ENDIF}
        end;
      finally
        ShellMalloc._Release;
      end;
  finally
    Screen.Cursor := OldCursor;
  end;
end;


constructor TdcShellProperties.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FMenuOptions := [moAllowDelete, moAllowCut, moAllowCopy, moAllowPaste, moAllowCreateShortcut, moActionItems, moExtendedItems, moSystemItems];
end;

function TdcShellProperties.ShowPropertiesByFile(const FileName: String): Boolean;
begin
  Result := ShowInterface(FileName, False);
end;

function TdcShellProperties.ShowContextMenuByFile(const FileName: String): Boolean;
begin
  Result := ShowInterface(FileName, True);
end;

function TdcShellProperties.ShowProperties: Boolean;
begin
  Result := ShowPropertiesByFile(FFileName);
end;

function TdcShellProperties.ShowContextMenu: Boolean;
begin
  Result := ShowContextMenuByFile(FFileName);
end;

end.
