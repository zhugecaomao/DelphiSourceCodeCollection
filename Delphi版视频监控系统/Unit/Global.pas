Unit Global;

Interface

Uses
  Windows, SysUtils, tmSDKLib, tmSDK_DataType;

Const
  Ver = '1.00';
  DSP_Num = '通道 %d';
  SMsgDlgTip = '提示';
  MinDiskSize = 800;                    //最小磁盘空间切换

Type
  TDSPConfig = Record
    BeginDrive, EndDrive: Char;
    MaxFileSize: Integer;               //最大文件大小 单位MB
    IsMotion: Boolean;                  //是否启动报警
    Alarm_Sensetive: Integer;           //判断是否运动的一个运动阀值( 0 – 100 )
    MotionRect: Array[0..3] Of TRect;   //监视区域
    Alarm_VideoUseAudio, Alarm_SoftUseAudio: Boolean; //是否开启报警
    Alarm_VideoSound, Alarm_SoftSound: String; //报警声音
    IsShowOSD: Boolean;                 //是否显示OSD　通道名称和时间
    KeyFrameIntervals: Integer;         //关键帧
    FrameRate: Integer;                 //帧率
    Max_Bps: Integer;                   //最大比特率
    Brightness, Contrast,
      Saturation, Hue: Integer;         //调色板
    StreamFormat: Integer;              //编码类型　图像格式
    StreamType: Integer;                //流类型
    VideoFormat: Integer;               // 制式
    QuantLevel: Integer;                //质量等级
    CBR: Boolean;                       //是否采用恒定码率
    DspName: String;                    //通道名称
  End;

  TConfig = Record
    WarningEndiskSize: Integer;
    CaptureImageDir, CaptureFrameDir: String;
    CheckDspStatus: Boolean;
    YtStatus: Boolean;                  //云台开启、锁定
    Config: Array[0..MAX_CHANNELS - 1] Of TDSPConfig;
  End;

Var
  Path: String;
  ChannelHandle: Array[0..MAX_CHANNELS - 1] Of THANDLE;
  Cfg: TConfig;

Procedure LoadSettings;
Procedure SaveSettings;
Function GetFormatDateTime(FType: Integer): String;
Function AddDirSuffix(Const Dir: String): String;
Function GetDiskFree(Drive: Byte): Integer;
Function Deltree(Dir: String; DelRoot: Boolean; DelEmptyDirOnly: Boolean): Boolean;
Function GetDirectory(Const Caption: String; Var Dir: String; ShowNewButton: Boolean): Boolean;
Implementation

Uses
  IniFiles, ShlObj, ActiveX, Forms;

Const
  IniExt = '.ini';
  Configs = 'Config';
  IniKeyName: Array[0..28] Of String = (
    'BeginDrive', 'EndDrive', 'MaxFileSize', 'IsMotion',
    'WarningEndiskSize', 'CaptureImageDir', 'CaptureFrameDir',
    'IsShowOSD', 'KeyFrameIntervals', 'FrameRate', 'Max_Bps',
    'Brightness', 'Contrast', 'Saturation', 'Hue', 'StreamFormat', 'StreamType',
    'VideoFormat', 'MotionRect', 'CheckDspStatus', 'Alarm_Sensetive',
    'Alarm_VideoSound', 'Alarm_SoftSound', 'Alarm_VideoUseAudio', 'Alarm_SoftUseAudio',
    'QuantLevel', 'CBR', 'YtStatus', 'Dsp_Name');
Var
  TmpStr, Sections: String;

Procedure LoadSettings;
Var
  I: Integer;
  Ini: TIniFile;
Begin
  Ini := TIniFile.Create(Path + Configs + IniExt);
  Try
    For I := 0 To MAX_CHANNELS - 1 Do
    Begin
      Cfg.WarningEndiskSize := Ini.ReadInteger(Configs, IniKeyName[4], 1000);

      Cfg.CaptureImageDir := 'D:\CaptureImage';
      Cfg.CaptureImageDir := Ini.ReadString(Configs, IniKeyName[5], Cfg.CaptureImageDir);
      Cfg.CaptureFrameDir := 'D:\CaptureFrame';
      Cfg.CaptureFrameDir := Ini.ReadString(Configs, IniKeyName[6], Cfg.CaptureFrameDir);
      Cfg.CheckDspStatus := Ini.ReadBool(Configs, IniKeyName[19], False);
      Cfg.YtStatus := Ini.ReadBool(Configs, IniKeyName[27], False);
      With Cfg.Config[I] Do
      Begin
        Sections := IntToStr(I);
        BeginDrive := 'D';
        TmpStr := Ini.ReadString(Sections, IniKeyName[0], BeginDrive);
        If TmpStr <> '' Then BeginDrive := TmpStr[1];
        EndDrive := 'Z';
        TmpStr := Ini.ReadString(Sections, IniKeyName[1], EndDrive);
        If TmpStr <> '' Then EndDrive := TmpStr[1];
        MaxFileSize := Ini.ReadInteger(Sections, IniKeyName[2], 100);
        IsMotion := Ini.ReadBool(Sections, IniKeyName[3], False);
        IsShowOSD := Ini.ReadBool(Sections, IniKeyName[7], True);
        KeyFrameIntervals := Ini.ReadInteger(Sections, IniKeyName[8], 200);
        FrameRate := Ini.ReadInteger(Sections, IniKeyName[9], 25);
        If (FrameRate > 30) Or (FrameRate <= 0) Then FrameRate := 30;
        Max_Bps := Ini.ReadInteger(Sections, IniKeyName[10], 10000);
        Brightness := Ini.ReadInteger(Sections, IniKeyName[11], 127);
        Contrast := Ini.ReadInteger(Sections, IniKeyName[12], 63);
        Saturation := Ini.ReadInteger(Sections, IniKeyName[13], 63);
        Hue := Ini.ReadInteger(Sections, IniKeyName[14], 127);
        StreamFormat := Ini.ReadInteger(Sections, IniKeyName[15], 0);
        StreamType := Ini.ReadInteger(Sections, IniKeyName[16], 0);
        VideoFormat := Ini.ReadInteger(Sections, IniKeyName[17], 2);

        MotionRect[0].Top := 0;
        MotionRect[0].Left := 0;
        MotionRect[0].Right := 352 Div 2;
        MotionRect[0].Bottom := 288 Div 2;

        MotionRect[1].Top := 0;
        MotionRect[1].Left := 352 Div 2;
        MotionRect[1].Right := 351;
        MotionRect[1].Bottom := 288 Div 2;

        MotionRect[2].Top := 288 Div 2;
        MotionRect[2].Left := 0;
        MotionRect[2].Right := 352 Div 2;
        MotionRect[2].Bottom := 287;

        MotionRect[3].Top := 288 Div 2;
        MotionRect[3].Left := 352 Div 2;
        MotionRect[3].Right := 351;
        MotionRect[3].Bottom := 287;

        Alarm_Sensetive := Ini.ReadInteger(Sections, IniKeyName[20], 12);
        Alarm_VideoSound := Ini.ReadString(Sections, IniKeyName[21], '');
        Alarm_SoftSound := Ini.ReadString(Sections, IniKeyName[22], '');
        Alarm_VideoUseAudio := Ini.ReadBool(Sections, IniKeyName[23], False);
        Alarm_SoftUseAudio := Ini.ReadBool(Sections, IniKeyName[24], False);
        QuantLevel := Ini.ReadInteger(Sections, IniKeyName[25], 15);
        CBR := Ini.ReadBool(Sections, IniKeyName[26], True);
        DspName := Ini.ReadString(Sections, IniKeyName[28], '');
      End;
    End;
  Finally
    Ini.Free;
  End;
End;

Procedure SaveSettings;
Var
  I: Integer;
  Ini: TIniFile;
Begin
  Ini := TIniFile.Create(Path + Configs + IniExt);
  Try
    For I := 0 To Sdk.GetTotalDSPs - 1 Do
    Begin
      Ini.WriteInteger(Configs, IniKeyName[4], Cfg.WarningEndiskSize);
      Ini.WriteString(Configs, IniKeyName[5], Cfg.CaptureImageDir);
      Ini.WriteString(Configs, IniKeyName[6], Cfg.CaptureFrameDir);
      Ini.WriteBool(Configs, IniKeyName[19], Cfg.CheckDspStatus);
      Ini.WriteBool(Configs, IniKeyName[27], Cfg.YtStatus);
      With Cfg.Config[I] Do
      Begin
        Sections := IntToStr(I);
        Ini.WriteString(Sections, IniKeyName[0], BeginDrive);
        Ini.WriteString(Sections, IniKeyName[1], EndDrive);
        Ini.WriteInteger(Sections, IniKeyName[2], MaxFileSize);
        Ini.WriteBool(Sections, IniKeyName[3], IsMotion);
        Ini.WriteBool(Sections, IniKeyName[7], IsShowOSD);
        Ini.WriteInteger(Sections, IniKeyName[8], KeyFrameIntervals);
        Ini.WriteInteger(Sections, IniKeyName[9], FrameRate);
        Ini.WriteInteger(Sections, IniKeyName[10], Max_Bps);
        Ini.WriteInteger(Sections, IniKeyName[11], Brightness);
        Ini.WriteInteger(Sections, IniKeyName[12], Contrast);
        Ini.WriteInteger(Sections, IniKeyName[13], Saturation);
        Ini.WriteInteger(Sections, IniKeyName[14], Hue);
        Ini.WriteInteger(Sections, IniKeyName[15], StreamFormat);
        Ini.WriteInteger(Sections, IniKeyName[16], StreamType);
        Ini.WriteInteger(Sections, IniKeyName[17], VideoFormat);
        Ini.WriteInteger(Sections, IniKeyName[20], Alarm_Sensetive);
        Ini.WriteString(Sections, IniKeyName[21], Alarm_VideoSound);
        Ini.WriteString(Sections, IniKeyName[22], Alarm_SoftSound);
        Ini.WriteBool(Sections, IniKeyName[23], Alarm_VideoUseAudio);
        Ini.WriteBool(Sections, IniKeyName[24], Alarm_SoftUseAudio);
        Ini.WriteInteger(Sections, IniKeyName[25], QuantLevel);
        Ini.WriteBool(Sections, IniKeyName[26], CBR);
        Ini.WriteString(Sections, IniKeyName[28], DspName);
      End;
    End;
  Finally
    Ini.Free;
  End;
End;

Function GetFormatDateTime(FType: Integer): String;
Begin
  Case FType Of
    0: Result := FormatDateTime('yyyymmdd', Now);
    1: Result := FormatDateTime('yyyymmddhhnnss', Now);
    2: Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    3: Result := FormatDateTime('yyyy-mm-dd', Now);
  End;
End;

// 目录尾加'\'修正
Function AddDirSuffix(Const Dir: String): String;
Begin
  Result := Trim(Dir);
  If Result = '' Then Exit;
  If Not IsPathDelimiter(Result, Length(Result)) Then
    Result := Result + {$IFDEF MSWINDOWS} '\';
  {$ELSE} '/';
  {$ENDIF};
End;

//获取磁盘空间
Function GetDiskSizeAvail(Drive: Byte; Var DiskTotalSpace: Int64; Var DiskFreeSpace: Int64): Boolean;
  Function DiskSpace(IntSpace: Int64): Int64;
  Const
    DefSpbyte = $7FFFFFFF;
  Begin
    If IntSpace >= 0 Then
      Result := IntSpace Else
      If IntSpace = -1 Then
      Begin
        Result := DefSpbyte;
        Result := Result * 2;
        Result := Result + 1;
      End Else
      Begin
        Result := DefSpbyte;
        Result := Result + abs(DefSpbyte - IntSpace);
      End;
  End;
Var
  FreeSpace: Int64;
  TotalSpace: Int64;
Var
  RootPath: Array[0..4] Of Char;
  RootPtr: PChar;
Begin
  RootPtr := Nil;
  If Drive > 0 Then
  Begin
    RootPath[0] := Char(Drive);
    RootPath[1] := ':';
    RootPath[2] := '\';
    RootPath[3] := #0;
    RootPtr := RootPath;
  End;
  Result := GetDiskFreeSpaceEx(RootPtr, FreeSpace, TotalSpace, Nil);
  DiskTotalSpace := DiskSpace(TotalSpace);
  DiskFreeSpace := DiskSpace(FreeSpace);
End;

Function GetDiskFree(Drive: Byte): Integer;
Var
  TotalSpace, FreeSpace: Int64;
Begin
  Result := -1;
  If GetDiskSizeAvail(Drive, TotalSpace, FreeSpace) Then
    Result := FreeSpace Div (1024 * 1024); //返回未使用空间 单位：MB
End;

// 删除整个目录
Function Deltree(Dir: String; DelRoot: Boolean; DelEmptyDirOnly: Boolean): Boolean;
Var
  sr: TSearchRec;
  fr: Integer;
Begin
  Result := True;
  If Not DirectoryExists(Dir) Then
    Exit;
  fr := FindFirst(AddDirSuffix(Dir) + '*.*', faAnyFile, sr);
  Try
    While fr = 0 Do
    Begin
      If (sr.Name <> '.') And (sr.Name <> '..') Then
      Begin
        SetFileAttributes(PChar(AddDirSuffix(Dir) + sr.Name), FILE_ATTRIBUTE_NORMAL);
        If sr.Attr And faDirectory = faDirectory Then
          Result := Deltree(AddDirSuffix(Dir) + sr.Name, True, DelEmptyDirOnly)
        Else If Not DelEmptyDirOnly Then
          Result := DeleteFile(AddDirSuffix(Dir) + sr.Name);
      End;
      fr := FindNext(sr);
    End;
  Finally
    FindClose(sr);
  End;

  If DelRoot Then
    Result := RemoveDir(Dir);
End;

Function SelectDirCB(Wnd: HWND; uMsg: UINT; lParam, lpData: lParam): Integer Stdcall;
Begin
  If (uMsg = BFFM_INITIALIZED) And (lpData <> 0) Then
    SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpData);
  Result := 0;
End;

Function SelectDirectory(Const Caption: String; Const Root: WideString;
  Var Directory: String; Owner: HWND; ShowNewButton: Boolean = True): Boolean;
Var
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;
Begin
  Result := False;
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  If (ShGetMalloc(ShellMalloc) = S_OK) And (ShellMalloc <> Nil) Then
  Begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    Try
      SHGetDesktopFolder(IDesktopFolder);
      If Root = '' Then
        RootItemIDList := Nil
      Else
        IDesktopFolder.ParseDisplayName(Application.Handle, Nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      With BrowseInfo Do
      Begin
        hwndOwner := Owner;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS;
        If ShowNewButton Then
          ulFlags := ulFlags Or $0040;
        lpfn := SelectDirCB;
        lParam := Integer(PChar(Directory));
      End;
      ItemIDList := SHBrowseForFolder(BrowseInfo);
      Result := ItemIDList <> Nil;
      If Result Then
      Begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      End;
    Finally
      ShellMalloc.Free(Buffer);
    End;
  End;
End;

Function GetDirectory(Const Caption: String; Var Dir: String;
  ShowNewButton: Boolean): Boolean;
Var
  OldErrorMode: UINT;
  BrowseRoot: WideString;
  OwnerHandle: HWND;
Begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  Try
    BrowseRoot := '';
    If Screen.ActiveCustomForm <> Nil Then
      OwnerHandle := Screen.ActiveCustomForm.Handle
    Else
      OwnerHandle := Application.Handle;
    Result := SelectDirectory(Caption, BrowseRoot, Dir, OwnerHandle,
      ShowNewButton);
  Finally
    SetErrorMode(OldErrorMode);
  End;
End;

End.

