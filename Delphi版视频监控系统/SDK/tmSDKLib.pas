Unit tmSDKLib;

Interface

Uses Windows, tmSDK_DataType;

Type
  TInitDSPs = Function(): Integer; cdecl;
  TDeInitDSPs = Function(): Integer; cdecl;
  TResetDSP = Function(DspNumber: Integer): Integer; cdecl;
  TGetSDKVersion = Function(VersionInfo: PVERSION_INFO): Integer; cdecl;
  TGetCapability = Function(hChannelHandle: THandle; Capability: PCHANNEL_CAPABILITY): Integer; cdecl;
  TGetLastErrorNum = Function(hChannelHandle: THandle; DspError, SdkError: PULONG): Integer; cdecl;
  TGetBoardInfo = Function(hChannelHandle: THandle; BoardType, SerialNo: PULONG): Integer; cdecl;
  TChannelOpen = Function(ChannelNum: Integer): THandle; cdecl;
  TChannelClose = Function(hChannelHandle: THandle): Integer; cdecl;
  TGetTotalChannels = Function(): Integer; cdecl;
  TGetTotalDSPs = Function(): Integer; cdecl;
  TStartVideoPreview = Function(hChannelHandle: THandle; WndHandle: HWND; RECT: PRECT; bOverlay: Boolean; VideoFormat: TTypeVideoFormat; FrameRate: Integer): Integer; cdecl;
  TStopVideoPreview = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetOverlayColorKey = Function(DestColorKey: COLORREF): Integer; cdecl;
  TReadStreamData = Function(hChannelHandle: THandle; Const DataBuf; Len: PDWORD; FrameType: PInteger): Integer; cdecl;
  TRegisterMessageNotifyHandle = Function(HWND: HWND; MessageId: UINT): Integer; cdecl;
  TRegisterStreamReadCallback = Function(StreamReadCallback: TStream_Read_CallBack; Context: Pointer): Integer; cdecl;
  TStartVideoCapture = Function(hChannelHandle: THandle): Integer; cdecl;
  TStopVideoCapture = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetVideoPara = Function(hChannelHandle: THandle; Brightness, Contrast, Saturation, Hue: Integer): Integer; cdecl;
  TGetVideoPara = Function(hChannelHandle: THandle; VideoStandard: PVideoStandard; Brightness, Contrast, Saturation, Hue: PInteger): Integer; cdecl;
  TRestoreOverlay = Function(): Integer;
  TGetVideoSignal = Function(hChannelHandle: THandle): Integer; cdecl;
  TGetFramesStatistics = Function(hChannelHandle: THandle; FramesStatistics: PFRAMES_STATISTICS): Integer; cdecl;
  TLoadYUVFromBmpFile = Function(FileName: PChar; yuv: PChar; BufLen: Integer; Width, Height: PInteger): Integer; cdecl;
  TSaveYUVToBmpFile = Function(FileName: PChar; yuv: PChar; Width, Height: Integer): Integer; cdecl;
  TSetupMosaic = Function(hChannelHandle: THandle; RectList: PRECT; NumberOfAreas: Integer): Integer; cdecl;
  TStartMosaic = Function(hChannelHandle: THandle): Integer; cdecl;
  TStopMosaic = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetOsd = Function(hChannelHandle: THandle; Enable: BOOL): Integer; cdecl;
  TSetOsdDisplayMode = Function(hChannelHandle: THandle; osdColor: COLORREF; Translucent: BOOL; TwinkleInterval: Integer; Format1, Format2: PWORD): Integer; cdecl;
  TSetLogo = Function(hChannelHandle: THandle; x, y, w, h: Integer; yuv: PChar): Integer; cdecl;
  TStopLogo = Function(hChannelHandle: THandle): Integer;
  TSetLogoDisplayMode = Function(hChannelHandle: THandle; ColorKey: COLORREF; Translucent: BOOL; TwinkleInterval: Integer): Integer; cdecl;
  TSetVideoStandard = Function(hChannelHandle: THandle; VideoStandard: TVideoStandard): Integer; cdecl;
  TSetStreamType = Function(hChannelHandle: THandle; StreamType: Word): Integer; cdecl;
  TGetStreamType = Function(hChannelHandle: THandle; StreamType: PWORD): Integer; cdecl;
  TSetIBPMode = Function(hChannelHandle: THandle; KeyFrameIntervals, BFrames, PFrames, FrameRate: Integer): Integer; cdecl;
  TSetDefaultQuant = Function(hChannelHandle: THandle; IQuantVal, PQuantVal, BQuantVal: Integer): Integer; cdecl;
  TSetupBitrateControl = Function(hChannelHandle: THandle; MaxBps: ULong; bCbr: BOOL): Integer; cdecl;
  TSetEncoderPictureFormat = Function(hChannelHandle: THandle; PictureFormat: TPictureFormat): Integer; cdecl;
  TCaptureIFrame = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetupAimDetectArea = Function(hChannelHandle: THandle; RectList: PRECT; NumberOfAreas: Integer): Integer; cdecl;
  TStartAimDetect = Function(hChannelHandle: THandle): Integer; cdecl;
  TStopAimDetect = Function(hChannelHandle: THandle): Integer; cdecl;
  TRegisterLogRecordCallback = Function(LogRecordFunc: TLogrecord_CallBack; Context: Pointer): Integer; cdecl;
  TSetupMotionDetection = Function(hChannelHandle: THandle; RectList: PRECT; iAreas: Integer): Integer; cdecl;
  TStartMotionDetection = Function(hChannelHandle: THandle): Integer; cdecl;
  TStopMotionDetection = Function(hChannelHandle: THandle): Integer; cdecl;
  TMotionAnalyzer = Function(hChannelHandle: THandle; MotionData: PChar; iThreshold: Integer; iResult: PInteger): Integer; cdecl;
  TAdjustMotionDetectPrecision = Function(hChannelHandle: THandle; iGrade, iFastMotionDetectFps, iSlowMotionDetectFps: Integer): Integer; cdecl;
  TSetAudioPreview = Function(hChannelHandle: THandle; bEnable: BOOL): Integer; cdecl;
  TGetSoundLevel = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetSoundLevel = Function(hChannelHandle: THandle): Integer; cdecl;
  TGetOriginalImage = Function(hChannelHandle: THandle; ImageBuf: PUCHAR; Size: PULONG): Integer; cdecl;
  TSetHorOffset = Function(hChannelHandle: THandle; HorOffset: Integer): Integer; cdecl;
  TSetAuxCodecMode = Function(hChannelHandle: THandle; KeyFrameIntervals, FrameRate, BitRate: Integer): Integer; cdecl;
  TStartAuxCodec = Function(hChannelHandle: THandle): Integer; cdecl;
  TStopAuxCodec = Function(hChannelHandle: THandle): Integer; cdecl;
  TSetLanguage = Function(hChannelHandle: THandle; Language: Integer): Integer; cdecl;
  TDumpDebug = Function(hChannelHandle: THandle): Integer; cdecl;
  TGetChannelInfo = Function(hChannelHandle: THandle; pChannelInfo: PCHANNEL_INFO): Integer; cdecl;

  TTmSdk = Class
  Private
    DllHandle: THandle;
    Function InitLib(FileName: String): Boolean;
    Procedure FreeLib;
  Protected
  Public
    InitDSPs: TInitDSPs;
    DeInitDSPs: TDeInitDSPs;
    ResetDSP: TResetDSP;
    GetSDKVersion: TGetSDKVersion;
    GetCapability: TGetCapability;
    GetLastErrorNum: TGetLastErrorNum;
    GetBoardInfo: TGetBoardInfo;
    ChannelOpen: TChannelOpen;
    ChannelClose: TChannelClose;
    GetTotalChannels: TGetTotalChannels;
    GetTotalDSPs: TGetTotalDSPs;
    StartVideoPreview: TStartVideoPreview;
    StopVideoPreview: TStopVideoPreview;
    SetOverlayColorKey: TSetOverlayColorKey;
    ReadStreamData: TReadStreamData;
    RegisterMessageNotifyHandle: TRegisterMessageNotifyHandle;
    RegisterStreamReadCallback: TRegisterStreamReadCallback;
    StartVideoCapture: TStartVideoCapture;
    StopVideoCapture: TStopVideoCapture;
    SetVideoPara: TSetVideoPara;
    GetVideoPara: TGetVideoPara;
    RestoreOverlay: TRestoreOverlay;
    GetVideoSignal: TGetVideoSignal;
    GetFramesStatistics: TGetFramesStatistics;
    LoadYUVFromBmpFile: TLoadYUVFromBmpFile;
    SaveYUVToBmpFile: TSaveYUVToBmpFile;
    SetupMosaic: TSetupMosaic;
    StartMosaic: TStartMosaic;
    StopMosaic: TStopMosaic;
    SetOsd: TSetOsd;
    SetOsdDisplayMode: TSetOsdDisplayMode;
    SetLogo: TSetLogo;
    StopLogo: TStopLogo;
    SetLogoDisplayMode: TSetLogoDisplayMode;
    SetVideoStandard: TSetVideoStandard;
    SetStreamType: TSetStreamType;
    GetStreamType: TGetStreamType;
    SetIBPMode: TSetIBPMode;
    SetDefaultQuant: TSetDefaultQuant;
    SetupBitrateControl: TSetupBitrateControl;
    SetEncoderPictureFormat: TSetEncoderPictureFormat;
    CaptureIFrame: TCaptureIFrame;
    SetupAimDetectArea: TSetupAimDetectArea;
    StartAimDetect: TStartAimDetect;
    StopAimDetect: TStopAimDetect;
    RegisterLogRecordCallback: TRegisterLogRecordCallback;
    SetupMotionDetection: TSetupMotionDetection;
    StartMotionDetection: TStartMotionDetection;
    StopMotionDetection: TStopMotionDetection;
    MotionAnalyzer: TMotionAnalyzer;
    AdjustMotionDetectPrecision: TAdjustMotionDetectPrecision;
    SetAudioPreview: TSetAudioPreview;
    GetSoundLevel: TGetSoundLevel;
    SetSoundLevel: TSetSoundLevel;
    GetOriginalImage: TGetOriginalImage;
    SetHorOffset: TSetHorOffset;
    SetAuxCodecMode: TSetAuxCodecMode;
    StartAuxCodec: TStartAuxCodec;
    StopAuxCodec: TStopAuxCodec;
    SetLanguage: TSetLanguage;
    DumpDebug: TDumpDebug;
    GetChannelInfo: TGetChannelInfo;
    Constructor Create(LibFile: String);
    Destructor Destroy; Override;

    Function ZBaseFormatRetVal(nSize: DWORD; Var nWidth, nHeight: Integer): Boolean;
  Published
    Property Handle: THandle Read DllHandle;
  End;

  //Const
  //  DMDll = 'DiskManage.dll';

Var
  Sdk: TTmSdk;
  {
  Function DM_DiskManage_Init(pHWND: HWND): Boolean; cdecl; External DMDll;
  Procedure DM_GenerateFileName(nCameraIndex: Integer; StrName: PChar); cdecl; External DMDll;
  Function DM_GetDiskSpace(cDiskName: Char): ULong; cdecl; External DMDll;
  Function DM_DiskManage_DeInit(): Boolean; cdecl; External DMDll;
  }
Implementation

Uses
  SysUtils;

Const
  tmSDKName = 'tmSDK.DLL';

Constructor TTmSdk.Create(LibFile: String);
Begin
  DllHandle := 0;
  InitLib(LibFile);
End;

Destructor TTmSdk.Destroy;
Begin
  FreeLib;
  Inherited;
End;

Function TTmSdk.ZBaseFormatRetVal(nSize: DWORD; Var nWidth, nHeight: Integer): Boolean;
Begin
  Result := true;
  If (nSize = 720 * 576 * 2) Then
  Begin
    nWidth := 720;
    nHeight := 576;
  End
  Else If (nSize = 704 * 576 * 2) Then
  Begin
    nWidth := 704;
    nHeight := 576;
  End
  Else If (nSize = 640 * 480 * 2) Then
  Begin
    nWidth := 640;
    nHeight := 480;
  End
  Else If (nSize = 352 * 288 * 2) Then
  Begin
    nWidth := 352;
    nHeight := 288;
  End
  Else If (nSize = 320 * 240 * 2) Then
  Begin
    nWidth := 320;
    nHeight := 240;
  End
  Else If (nSize = 176 * 144 * 2) Then
  Begin
    nWidth := 176;
    nHeight := 144;
  End
  Else If (nSize = 160 * 120 * 2) Then
  Begin
    nWidth := 160;
    nHeight := 120;
  End
  Else If (nSize = 512 * 288 * 2) Then
  Begin
    nWidth := 512;
    nHeight := 288;
  End
  Else If (nSize = 416 * 240 * 2) Then
  Begin
    nWidth := 416;
    nHeight := 240;
  End
  Else If (nSize = 704 * 288 * 2) Then
  Begin
    nWidth := 704;
    nHeight := 288;
  End
  Else If (nSize = 640 * 240 * 2) Then
  Begin
    nWidth := 640;
    nHeight := 240;
  End
  Else Result := FALSE;
End;

Function TTmSdk.InitLib(FileName: String): Boolean;
  Function SDKGetProcAddress(FuncName: String): Pointer;
  Begin
    Result := GetProcAddress(DllHandle, PChar(FuncName));
  End;

Begin
  If DllHandle <> 0 Then Result := true
  Else
  Begin
    If Not FileExists(FileName) Then FileName := tmSDKName;
    DllHandle := LoadLibrary(PChar(FileName));
    If DllHandle <> 0 Then
    Begin
      @InitDSPs := SDKGetProcAddress('MP4Sys_InitDSPs');
      @DeInitDSPs := SDKGetProcAddress('MP4Sys_DeInitDSPs');
      @ResetDSP := SDKGetProcAddress('MP4Sys_ResetDSP');

      @GetSDKVersion := SDKGetProcAddress('MP4Sys_GetSDKVersion');
      @GetCapability := SDKGetProcAddress('MP4Sys_GetCapability');
      @GetLastErrorNum := SDKGetProcAddress('MP4Sys_GetLastErrorNum');
      @GetBoardInfo := SDKGetProcAddress('MP4Sys_GetBoardInfo');

      @ChannelOpen := SDKGetProcAddress('MP4Sys_ChannelOpen');
      @ChannelClose := SDKGetProcAddress('MP4Sys_ChannelClose');
      @GetTotalChannels := SDKGetProcAddress('MP4Sys_GetTotalChannels');
      @GetTotalDSPs := SDKGetProcAddress('MP4Sys_GetTotalDSPs');

      @StartVideoPreview := SDKGetProcAddress('MP4Sys_StartVideoPreview');
      @StopVideoPreview := SDKGetProcAddress('MP4Sys_StopVideoPreview');
      @SetOverlayColorKey := SDKGetProcAddress('MP4Sys_SetOverlayColorKey');

      @ReadStreamData := SDKGetProcAddress('MP4Sys_ReadStreamData');
      @RegisterMessageNotifyHandle := SDKGetProcAddress('MP4Sys_RegisterMessageNotifyHandle');
      @RegisterStreamReadCallback := SDKGetProcAddress('MP4Sys_RegisterStreamReadCallback');

      @StartVideoCapture := SDKGetProcAddress('MP4Sys_StartVideoCapture');
      @StopVideoCapture := SDKGetProcAddress('MP4Sys_StopVideoCapture');

      @SetVideoPara := SDKGetProcAddress('MP4Sys_SetVideoPara');
      @GetVideoPara := SDKGetProcAddress('MP4Sys_GetVideoPara');
      @RestoreOverlay := SDKGetProcAddress('MP4Sys_RestoreOverlay');

      @GetVideoSignal := SDKGetProcAddress('MP4Sys_GetVideoSignal');
      @GetFramesStatistics := SDKGetProcAddress('MP4Sys_GetFramesStatistics');
      @LoadYUVFromBmpFile := SDKGetProcAddress('MP4Sys_LoadYUVFromBmpFile');
      @SaveYUVToBmpFile := SDKGetProcAddress('MP4Sys_SaveYUVToBmpFile');

      @SetupMosaic := SDKGetProcAddress('MP4Sys_SetupMosaic');
      @StartMosaic := SDKGetProcAddress('MP4Sys_StartMosaic');
      @StopMosaic := SDKGetProcAddress('MP4Sys_StopMosaic');

      @SetOsd := SDKGetProcAddress('MP4Sys_SetOsd');
      @SetOsdDisplayMode := SDKGetProcAddress('MP4Sys_SetOsdDisplayMode');
      @SetLogo := SDKGetProcAddress('MP4Sys_SetLogo');
      @StopLogo := SDKGetProcAddress('MP4Sys_StopLogo');
      @SetLogoDisplayMode := SDKGetProcAddress('MP4Sys_SetLogoDisplayMode');

      @SetVideoStandard := SDKGetProcAddress('MP4Sys_SetVideoStandard');

      @SetStreamType := SDKGetProcAddress('MP4Sys_SetStreamType');
      @GetStreamType := SDKGetProcAddress('MP4Sys_GetStreamType');

      @SetIBPMode := SDKGetProcAddress('MP4Sys_SetIBPMode');
      @SetDefaultQuant := SDKGetProcAddress('MP4Sys_SetDefaultQuant');
      @SetupBitrateControl := SDKGetProcAddress('MP4Sys_SetupBitrateControl');
      @SetEncoderPictureFormat := SDKGetProcAddress('MP4Sys_SetEncoderPictureFormat');
      @CaptureIFrame := SDKGetProcAddress('MP4Sys_CaptureIFrame');
      @SetupAimDetectArea := SDKGetProcAddress('MP4Sys_SetupAimDetectArea');
      @StartAimDetect := SDKGetProcAddress('MP4Sys_StartAimDetect');
      @StopAimDetect := SDKGetProcAddress('MP4Sys_StopAimDetect');
      @RegisterLogRecordCallback := SDKGetProcAddress('MP4Sys_RegisterLogRecordCallback');

      @SetupMotionDetection := SDKGetProcAddress('MP4Sys_SetupMotionDetection');
      @StartMotionDetection := SDKGetProcAddress('MP4Sys_StartMotionDetection');
      @StopMotionDetection := SDKGetProcAddress('MP4Sys_StopMotionDetection');
      @MotionAnalyzer := SDKGetProcAddress('MP4Sys_MotionAnalyzer');
      @AdjustMotionDetectPrecision := SDKGetProcAddress('MP4Sys_AdjustMotionDetectPrecision');

      @SetAudioPreview := SDKGetProcAddress('MP4Sys_SetAudioPreview');
      @GetSoundLevel := SDKGetProcAddress('MP4Sys_GetSoundLevel');
      @SetSoundLevel := SDKGetProcAddress('MP4Sys_SetSoundLevel');
      @GetOriginalImage := SDKGetProcAddress('MP4Sys_GetOriginalImage');

      @SetHorOffset := SDKGetProcAddress('MP4Sys_SetHorOffset');

      @SetAuxCodecMode := SDKGetProcAddress('MP4Sys_SetAuxCodecMode');
      @StartAuxCodec := SDKGetProcAddress('MP4Sys_StartAuxCodec');
      @StopAuxCodec := SDKGetProcAddress('MP4Sys_StopAuxCodec');
      @SetLanguage := SDKGetProcAddress('MP4Sys_SetLanguage');
      @DumpDebug := SDKGetProcAddress('MP4Sys_DumpDebug');

      @GetChannelInfo := SDKGetProcAddress('MP4Sys_GetChannelInfo');
    End;
    Result := DllHandle <> 0;
  End;
End;

Procedure TTmSdk.FreeLib;
Begin
  If DllHandle <> 0 Then
    FreeLibrary(DllHandle);
  DllHandle := 0;
End;

End.

