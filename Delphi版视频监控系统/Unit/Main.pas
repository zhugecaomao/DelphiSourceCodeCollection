Unit Main;

Interface

Uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Buttons, ExtCtrls, StdCtrls, Menus, jpeg,
  {About, }MyThread, HKVideoWindow, AlarmFile, tmSDKLib, tmSDK_DataType;

Const
  BufSize = 500000;

Type
  TFrmMain = Class(TForm)
    VideoWin: THKVideoWindow;
    Timer: TTimer;
    ImgBackground: TImage;
    CmdSet: TImage;
    CmdPlayer: TImage;
    CmdVCapOpen: TImage;
    CmdVCapClose: TImage;
    CmdCapFrame: TImage;
    CmdCapImage: TImage;
    LbTime: TLabel;
    LbPane1: TLabel;
    LbPane2: TLabel;
    LbPane3: TLabel;
    LbPane4: TLabel;
    CmdExit: TLabel;
    ChkDSPTimer: TTimer;
    CmdMenu: TSpeedButton;
    PopupMenu: TPopupMenu;
    Menu_About: TMenuItem;
    N1: TMenuItem;
    Menu_Exit: TMenuItem;
    CmdYTControl: TImage;
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure CmdExitClick(Sender: TObject);
    Procedure CmdVCapOpenClick(Sender: TObject);
    Procedure CmdVCapCloseClick(Sender: TObject);
    Procedure VideoWinDblClick(Sender: TObject);
    Procedure CmdCapImageClick(Sender: TObject);
    Procedure VideoWinPaintRect(Sender: TObject; ChannelNum: Integer;
      Rect: TRect);
    Procedure VideoWinMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure CmdSetClick(Sender: TObject);
    Procedure CmdPlayerClick(Sender: TObject);
    Procedure TimerTimer(Sender: TObject);
    Procedure LbPaneClick(Sender: TObject);
    Procedure CmdCapFrameClick(Sender: TObject);
    Procedure VideoWinClick(Sender: TObject);
    Procedure ChkDSPTimerTimer(Sender: TObject);
    Procedure CmdMenuClick(Sender: TObject);
    Procedure Menu_AboutClick(Sender: TObject);
    Procedure CmdYTControlClick(Sender: TObject);
  Private
    HashNum: Array[0..MAX_CHANNELS - 1] Of Integer; //校验次数
    HashBuf: Array[0..MAX_CHANNELS - 1, Boolean, 0..BufSize - 1] Of UCHAR; //校验数据

    TotalDSPs: Integer;                 //通道数
    lpRect: Array[0..MAX_CHANNELS - 1] Of TRect; //通道区域
    CurrDrive: Array[0..MAX_CHANNELS - 1] Of Byte; //当前录像文件所在盘符
    FileHeader: Array[0..MAX_CHANNELS - 1, 0..200 - 1] Of UCHAR; //文件头
    FileHeaderLen: Integer;             //文件头长度
    CurrentFileLen: Array[0..MAX_CHANNELS - 1] Of ULONG; //当前文件长度
    FileHandle: Array[0..MAX_CHANNELS - 1] Of Integer; //文件句柄
    CapDSPStatus: Array[0..MAX_CHANNELS - 1] Of Boolean; //当前录像状态
    AlarmFileSave: Boolean;
    CapDSPMotionStatus: Array[0..MAX_CHANNELS - 1] Of Boolean; //当前报警状态
    AlarmFile: Array[0..MAX_CHANNELS - 1] Of TAlarmFile;

    CapOldSel: Integer;
    VCap: Array[0..MAX_CHANNELS - 1] Of TImage;
    VCapNum: Array[0..MAX_CHANNELS - 1] Of TImage;

    YTBtnNum: Array[1..8] Of TImage;    //云台方向操作按钮

    Function GenerateFileName(ChannelNum: Integer): String;
    Function OnDataReady(ChannelNum: UINT; lparam: Integer): Integer; Stdcall;
    Procedure ChangeFileName(ChannelNum, Len: Integer);
    Procedure VCapDSP(ChannelNum: Integer; B: Boolean);
    Procedure VCap_OnClick(Sender: TObject);
    Procedure VCapNum_OnClick(Sender: TObject);
    Procedure LoadBtnStat(Var Btn: TImage; St: Integer);
    Procedure LoadYtBtnStat(Var Btn: TImage; St: Boolean);
    Procedure CalcButtonRect(Var NumBtn: TImage; Var Btn: TImage; ChannelNum: Integer);
    Procedure StartVideoPreview(ChannelNum: Integer);
    Procedure StopAllVideoPreview;
    Procedure SetOSDFormat(ChannelNum: Integer);
    Procedure SetDSP(ChannelNum: Integer);
    Procedure CmdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure CmdMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure CmdYtClick(Sender: TObject);
    Procedure CmdYtMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure CmdYtMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  Public
    { Public declarations }
  End;

Var
  FrmMain: TFrmMain;

Implementation

{$R *.dfm}
Uses Settings, Global, Hash, Consts;

Const
  DriveSp = ':\';
  DVRPath = 'DVRDAT\';
  DVRExt = '.MPG';
  NumBtnName = 'NumBtn_%d';
  BtnSt: Array[Boolean] Of String = ('B_%d_UP', 'B_%d_DOWN');
  NumBtnSt: Array[Boolean] Of String = ('%d_UP', '%d_DOWN');
  BtnResStr: Array[0..2] Of String = ('ALARM_COMM', 'ALARM_IN', 'ALARM_ALARMING');
  YTBtnSt: Array[Boolean] Of String = ('YT_%d_UP', 'YT_%d_DOWN');
  YTBtnResSt: Array[Boolean] Of String = ('YT_9_0', 'YT_9_1');

Procedure MsgErr(Const S: String);
Begin
  Application.MessageBox(PChar(S), PChar(SMsgDlgError), MB_ICONHAND);
End;
{
Procedure ConvertRectFormat(StreamFormat, VideoFormat: Integer; Rect: PRect; bFlag: Boolean; ChannelNum: Integer);
Var
 W, H: Integer;
 W1, H1: Integer;
 W2, H2: Integer;
 X, Y: real;
 xScale, yScale: real;
 cx, cy: Integer;
 x1, y1: Integer;
Begin
 Case StreamFormat Of
   0:
     Begin
       If VideoFormat = 0 Then
       Begin
         W1 := PAL_CIF_WIDTH;
         H1 := PAL_CIF_HIGHT;
       End
       Else
       Begin
         W1 := NTSC_CIF_WIDTH;
         H1 := NTSC_CIF_HIGHT;
       End;
       X := 1;
       Y := 1;
     End;
   1:
     Begin
       If VideoFormat = 0 Then
       Begin
         W1 := PAL_QCIF_WIDTH;
         H1 := PAL_QCIF_HIGHT;
       End
       Else
       Begin
         W1 := NTSC_QCIF_WIDTH;
         H1 := NTSC_QCIF_HIGHT;
       End;
       X := 2;
       Y := 2;
     End;
   2:
     Begin
       If VideoFormat = 0 Then
       Begin
         W1 := PAL_TWOCIF_WIDTH;
         H1 := PAL_TWOCIF_HIGHT;
       End
       Else
       Begin
         W1 := NTSC_TWOCIF_WIDTH;
         H1 := NTSC_TWOCIF_HIGHT;
       End;
       X := 0.5;
       Y := 1;
     End;
   3:
     If VideoFormat = 0 Then
     Begin
       W1 := PAL_MD_WIDTH;
       H1 := PAL_MD_HIGHT;
       X := PAL_CIF_WIDTH / PAL_MD_WIDTH;
       Y := PAL_CIF_HIGHT / PAL_MD_HIGHT;
     End
     Else
     Begin
       W1 := NTSC_MD_WIDTH;
       H1 := NTSC_MD_HIGHT;
       X := NTSC_CIF_WIDTH / NTSC_MD_WIDTH;
       Y := NTSC_CIF_HIGHT / NTSC_MD_HIGHT;
     End;
   4:
     If VideoFormat = 0 Then
     Begin
       W1 := PAL_D1_WIDTH;
       H1 := PAL_D1_HIGHT;
       X := PAL_CIF_WIDTH / PAL_D1_WIDTH;
       Y := PAL_CIF_HIGHT / PAL_D1_HIGHT;
     End
     Else
     Begin
       W1 := NTSC_D1_WIDTH;
       H1 := NTSC_D1_HIGHT;
       X := NTSC_CIF_WIDTH / NTSC_D1_WIDTH;
       Y := NTSC_CIF_HIGHT / NTSC_D1_HIGHT;
     End;
 End;

 If (Rect.Top < 0) Then
   Rect.Top := 0;
 If (Rect.Top > H1) Then
   Rect.Top := H1;

 If (Rect.Bottom < 0) Then
   Rect.Bottom := 0;
 If (Rect.Bottom > H1) Then
   Rect.Bottom := H1;

 If (Rect.Left < 0) Then
   Rect.Left := 0;
 If (Rect.Left > W1) Then
   Rect.Left := W1;

 If (Rect.Right < 0) Then
   Rect.Right := 0;
 If (Rect.Right > W1) Then
   Rect.Right := W1;

 If (bFlag) Then
 Begin
    Rect.Top := Integer(Extended(Rect.Top) * Y);
    Rect.Bottom := Integer(Extended(Rect.Bottom) * Y);
    Rect.Left := Integer(Extended(Rect.Left) * X);
    Rect.Right := Integer(Extended(Rect.Right) * X);
    Exit;
 End;

 If ChannelNum = -1 Then Exit;

 W2 := Rect.Right - Rect.Left;
 H2 := Rect.Bottom - Rect.Top;

 W := lpRect[ChannelNum].Right - lpRect[ChannelNum].Left;
 H := lpRect[ChannelNum].Bottom - lpRect[ChannelNum].Top;

 xScale := W / W1;
 yScale := H / H1;
 //cx := Integer(xScale) * W2;
 //cy := Integer(yScale) * H2;

 //x1 := lpRect[ChannelNum].Left + Rect.Left * xScale;
 //y1 := lpRect[ChannelNum].Top + Rect.Top * yScale;

 Rect.Left := x1;
 Rect.Top := y1;
 Rect.Right := x1 + cx;
 Rect.Bottom := y1 + cy;
End; }

Function TFrmMain.GenerateFileName(ChannelNum: Integer): String;
Const
  P = '%s%s%s%s\%d\%s\%d-1-%s%s';
  CapType: Array[Boolean] Of String = ('CC', 'AC');
Var
  C: Integer;
  CurDiskSize: Int64;
  FPath: String;

  GenOk: Boolean;
  LastDrive: Integer;
  Thread: TFileManagerThread;
  DriveManagerList: TStrings;           //磁盘清盘队列
Begin
  LastDrive := 68;
  GenOk := False;
  DriveManagerList := TStringList.Create;
  For C := 68 To 90 Do
    If ((Ord(Cfg.Config[ChannelNum].BeginDrive) <= C) And
      (Ord(Cfg.Config[ChannelNum].EndDrive) >= C)) Then
      If GetDriveType(PChar(Chr(C) + DriveSp)) = DRIVE_FIXED Then
      Begin
        LastDrive := C;                 //保留最后有效盘符
        DriveManagerList.Add(Format('%s%s%s', [Chr(C), DriveSp, DVRPath]));
        If GenOk = False Then
        Begin
          CurDiskSize := GetDiskFree(C);
          If CurDiskSize > MinDiskSize Then
          Begin
            CurrDrive[ChannelNum] := C;
            Result := Format(P, [Chr(C), DriveSp, DVRPath, GetFormatDateTime(0), ChannelNum + 1,
              CapType[Cfg.Config[ChannelNum].IsMotion], ChannelNum,
                GetFormatDateTime(1), DVRExt]);
            FPath := ExtractFilePath(Result);
            If Not DirectoryExists(FPath) Then ForceDirectories(FPath);
            GenOk := True;
          End;
        End;
      End;

  If GetDiskFree(LastDrive) < Cfg.WarningEndiskSize Then
  Begin                                 //最后盘符空间小于警告值，则启动线程删除最旧的文件
    Thread := TFileManagerThread.Create(True, DriveManagerList);
    Thread.Resume;
  End;
  DriveManagerList.Free;
End;

Function Stream_Read_CallBack(ChannelNumber: UINT; Context: Pointer): Integer; Cdecl;
Begin
  TFrmMain(Context).OnDataReady(ChannelNumber, 0);
  Result := 0;
End;

Function TFrmMain.OnDataReady(ChannelNum: UINT; lparam: Integer): Integer; Stdcall;
Var
  StreamBuf: Array[0..BufSize - 1] Of UCHAR;
  Status, Len, FrameType: Integer;
  IFrameFileHandle: THandle;            //抓帧文件句柄
  Re: Array[0..3] Of Integer;
  {AreaList: Array[0..3] Of TRect;
  I: Integer;}
Begin
  Result := 0;
  Len := SizeOf(StreamBuf);
  Status := Sdk.ReadStreamData(ChannelHandle[ChannelNum], StreamBuf, @Len, @FrameType);
  If Status = -1 Then Exit;
  Case FrameType Of
    PktSysHeader:
      Begin                             //保留文件头备用
        FillChar(FileHeader[ChannelNum], SizeOf(FileHeader[ChannelNum]), #0);
        CopyMemory(@FileHeader[ChannelNum], @StreamBuf, Len);
        FileHeaderLen := Len;
      End;
    PktMotionDetection:
      Begin
        Sdk.MotionAnalyzer(ChannelHandle[ChannelNum], @StreamBuf, Cfg.Config[ChannelNum].Alarm_Sensetive, @Re);
        If Succeeded(Re[0] + Re[1] + Re[2] + Re[3]) Then
        Begin
          CapDSPMotionStatus[ChannelNum] := True;
          VideoWin.Invalidate;
          AlarmFile[ChannelNum].Trigger(FileHandle[ChannelNum]);
          {For I := 0 To 3 Do
          Begin
            If Re[I] = 0 Then Continue;
            CopyRect(AreaList[I], Cfg.Config[ChannelNum].MotionRect[I]);
          End;}
        End Else
        Begin
          CapDSPMotionStatus[ChannelNum] := False;
          VideoWin.Invalidate;
        End;
      End;
    PktSFrames:
      Begin                             //抓帧
        If Not DirectoryExists(Cfg.CaptureFrameDir) Then ForceDirectories(Cfg.CaptureFrameDir);
        IFrameFileHandle := FileCreate(Format('%sCaptureIframe_%d_%s.MPG', [AddDirSuffix(Cfg.CaptureFrameDir), ChannelNum, GetFormatDateTime(1)]));
        FileWrite(IFrameFileHandle, FileHeader[ChannelNum], FileHeaderLen);
        FileWrite(IFrameFileHandle, StreamBuf, Len);
        FileClose(IFrameFileHandle);
      End;
    PktAimDetection: ;
    PktQCIFIFrames: ;
    PktQCIFPFrames: ;
  End;
  Inc(CurrentFileLen[ChannelNum], Len);

  If Succeeded(Status) Then
    ChangeFileName(ChannelNum, Len);

  If AlarmFileSave Then
  Begin
    If FrameType = PktSysHeader Then
      FileWrite(FileHandle[ChannelNum], StreamBuf, Len)
    Else
      AlarmFile[ChannelNum].FramePush(FileHandle[ChannelNum], @StreamBuf, Len, FrameType, Status);
  End
  Else
    FileWrite(FileHandle[ChannelNum], StreamBuf, Len);

  //备份校验数据 检测通道是否正常工作
  If Cfg.CheckDspStatus Then
    CopyMemory(@HashBuf[ChannelNum][True], @StreamBuf, Len);
End;

//切换文件
Procedure TFrmMain.ChangeFileName(ChannelNum, Len: Integer);
Var
  CurrSize: LongWord;
  IsChange: Boolean;
  FilePath: String;
  EndCode: ULONG;
Begin
  IsChange := False;
  CurrSize := Cfg.Config[ChannelNum].MaxFileSize * 1024 * 1024;
  If CurrentFileLen[ChannelNum] > CurrSize Then //文件上限
    IsChange := True
  Else If GetDiskFree(CurrDrive[ChannelNum]) <= MinDiskSize Then
    IsChange := True;

  If IsChange Then
  Begin
    EndCode := End_Code;
    FileWrite(FileHandle[ChannelNum], EndCode, SizeOf(EndCode));
    FileClose(FileHandle[ChannelNum]);
    FilePath := GenerateFileName(ChannelNum);
    If FileExists(FilePath) Then DeleteFile(FilePath);
    FileHandle[ChannelNum] := FileCreate(FilePath);
    FileWrite(FileHandle[ChannelNum], FileHeader[ChannelNum], FileHeaderLen);
    CurrentFileLen[ChannelNum] := FileHeaderLen;
    Inc(CurrentFileLen[ChannelNum], Len);
  End;
End;

Procedure TFrmMain.VCapDSP(ChannelNum: Integer; B: Boolean);
Var
  FilePath: String;
  EndCode: ULONG;
Begin
  If B Then
  Begin                                 //停止
    Sdk.StopVideoCapture(ChannelHandle[ChannelNum]);
    If FileHandle[ChannelNum] <> -1 Then
    Begin
      EndCode := End_Code;
      FileWrite(FileHandle[ChannelNum], EndCode, SizeOf(EndCode));
      FileClose(FileHandle[ChannelNum]);
      FileHandle[ChannelNum] := -1;
    End;
    CapDSPStatus[ChannelNum] := False;
    LoadBtnStat(VCap[ChannelNum], 0);
  End
  Else
  Begin                                 //启动
    FilePath := GenerateFileName(ChannelNum);
    If Length(FilePath) < 3 Then Exit;
    If FileExists(FilePath) Then DeleteFile(FilePath);
    FileHandle[ChannelNum] := FileCreate(FilePath);
    If FileHandle[ChannelNum] = -1 Then
    Begin
      MsgErr('无法打开文件：' + FilePath);
      Exit;
    End;
    SetDSP(ChannelNum);
    CurrentFileLen[ChannelNum] := 0;
    AlarmFile[ChannelNum].Reset;
    AlarmFile[ChannelNum].Setup(150, 100);
    Sdk.StartVideoCapture(ChannelHandle[ChannelNum]);
    CapDSPStatus[ChannelNum] := True;
    LoadBtnStat(VCap[ChannelNum], 1);
  End;
End;

Procedure TFrmMain.VCap_OnClick(Sender: TObject);
Var
  I: Integer;
Begin
  If TotalDSPs = 0 Then Exit;
  I := TSpeedButton(Sender).Tag;
  VCapDSP(I, CapDSPStatus[I]);
  VideoWin.Invalidate;
End;

Procedure TFrmMain.VCapNum_OnClick(Sender: TObject);
Begin
  If CapOldSel = TImage(Sender).Tag Then Exit;
  If CapOldSel <> -1 Then
    (FindComponent(Format(NumBtnName, [CapOldSel])) As
      TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
      Format(NumBtnSt[False], [CapOldSel + 1]));
  CapOldSel := TImage(Sender).Tag;
  VideoWin.Selected := CapOldSel;
  TImage(Sender).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(NumBtnSt[True], [CapOldSel + 1]));
End;

Procedure TFrmMain.VideoWinClick(Sender: TObject);
Begin
  If CapOldSel = VideoWin.Selected Then Exit;
  If CapOldSel <> -1 Then
    (FindComponent(Format(NumBtnName, [CapOldSel])) As
      TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
      Format(NumBtnSt[False], [CapOldSel + 1]));
  CapOldSel := VideoWin.Selected;
  (FindComponent(Format(NumBtnName, [CapOldSel])) As
    TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(NumBtnSt[True], [CapOldSel + 1]));
End;

Procedure TFrmMain.LoadBtnStat(Var Btn: TImage; St: Integer);
Begin
  Btn.Picture.Bitmap.LoadFromResourceName(HInstance, BtnResStr[St]);
End;

Procedure TFrmMain.LoadYtBtnStat(Var Btn: TImage; St: Boolean);
Var
  I: Integer;
Begin
  Btn.Picture.Bitmap.LoadFromResourceName(HInstance, YTBtnResSt[St]);
  For I := Low(YTBtnNum) To High(YTBtnNum) Do
    YTBtnNum[I].Enabled := St;
End;

Procedure TFrmMain.CalcButtonRect(Var NumBtn: TImage; Var Btn: TImage; ChannelNum: Integer);
Begin
  //创建通道号选择图形按钮
  NumBtn := TImage.Create(self);
  NumBtn.Parent := self;
  NumBtn.Name := Format(NumBtnName, [ChannelNum]);
  NumBtn.Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(NumBtnSt[False], [ChannelNum + 1]));
  NumBtn.Hint := Format(DSP_Num, [ChannelNum + 1]);
  NumBtn.Tag := ChannelNum;
  NumBtn.width := 18;
  NumBtn.Height := 18;
  NumBtn.Top := ChannelNum * 24 + 160;
  NumBtn.Left := ClientWidth - 60;
  NumBtn.OnClick := VCapNum_OnClick;

  //创建通道号操作图形按钮
  Btn := TImage.Create(self);
  Btn.Parent := self;
  Btn.Tag := ChannelNum;
  Btn.Enabled := False;
  Btn.width := 17;
  Btn.Height := 14;
  LoadBtnStat(Btn, 0);
  Btn.Top := NumBtn.Top + 2;
  Btn.Left := NumBtn.Left + 25;
  Btn.OnClick := VCap_OnClick;
End;

Procedure TFrmMain.StartVideoPreview(ChannelNum: Integer);
Begin
  lpRect[ChannelNum] := VideoWin.PaneRect[ChannelNum];
  Sdk.StartVideoPreview(ChannelHandle[ChannelNum], VideoWin.Handle, @lpRect[ChannelNum], False, vdfRGB24, 25);
End;

Procedure TFrmMain.StopAllVideoPreview;
Var
  I: Integer;
Begin
  For I := 0 To TotalDSPs - 1 Do
    Sdk.StopVideoPreview(ChannelHandle[I]);
End;

Procedure TFrmMain.SetOSDFormat(ChannelNum: Integer); //设置视频OSD
Var
  L, M, nLength: Integer;
  Format1, Format2: Array[0..40] Of Word;
  wFormat: Word;
  Str: String;
  wH, wL: Char;
Begin
  L := 0;
  Format1[0] := 8;                      //X坐标
  Format1[1] := 22;                     //Y坐标
  Str := IntToStr(ChannelNum + 1);
  nLength := Length(Str);
  M := 1;
  While M < nLength + 1 Do
  Begin
    wH := Str[M];
    wL := Str[M + 1];
    If (Ord(wH) > 128) Then
    Begin
      M := M + 1;
      wFormat := Ord(wH) * 16 * 16 + Ord(wL);
    End
    Else
      wFormat := Ord(wH);
    Format1[L + 2] := wFormat;
    L := L + 1;
    M := M + 1;
  End;
  Format1[L + 2] := Ord(#0);
  //===============================================
  Format2[0] := 8;                      //X坐标
  Format2[1] := 5;                      //Y坐标
  Format2[2] := _OSD_YEAR4;
  Format2[3] := Ord('-');
  Format2[4] := _OSD_MONTH2;
  Format2[5] := Ord('-');
  Format2[6] := _OSD_DAY;
  Format2[7] := Ord(' ');
  Format2[8] := _OSD_HOUR24;
  Format2[9] := Ord(':');
  Format2[10] := _OSD_MINUTE;
  Format2[11] := Ord(':');
  Format2[12] := _OSD_SECOND;
  Format2[13] := Ord(#0);
  //===============================================
  Sdk.SetOsdDisplayMode(ChannelHandle[ChannelNum], 255, False, 0, @Format1, @Format2);
End;

Procedure TFrmMain.SetDSP(ChannelNum: Integer);
Var
  I: Integer;
  Li: Cardinal;
  AreaList: Array[0..3] Of TRect;
Begin
  HashNum[ChannelNum] := 0;
  FillChar(HashBuf[ChannelNum][True], BufSize, #0);
  FillChar(HashBuf[ChannelNum][False], BufSize, #0);
  ChkDSPTimer.Enabled := Cfg.CheckDspStatus;

  //设置语言
  Sdk.SetLanguage(ChannelHandle[ChannelNum], 0);

  Sdk.SetVideoPara(ChannelHandle[ChannelNum],
    Cfg.Config[ChannelNum].Brightness, Cfg.Config[ChannelNum].Contrast, Cfg.Config[ChannelNum].Saturation, Cfg.Config[ChannelNum].Hue);

  //设置OSD 通道号和时间
  If Cfg.Config[ChannelNum].IsShowOSD Then
  Begin
    SetOSDFormat(ChannelNum);
    Sdk.SetOsd(ChannelHandle[ChannelNum], True);
  End Else Sdk.SetOsd(ChannelHandle[ChannelNum], False);

  //设置流格式
  Case Cfg.Config[ChannelNum].StreamType Of
    1: Li := STREAM_TYPE_AUDIO;
    2: Li := STREAM_TYPE_AVSYNC;
  Else
    Li := STREAM_TYPE_VIDEO;
  End;
  Sdk.SetStreamType(ChannelHandle[ChannelNum], Li);

  //设置图像流编码格式
  Case Cfg.Config[ChannelNum].StreamFormat Of
    1: Li := ENC_QCIF_FORMAT;
    2: Li := ENC_2CIF_FORMAT;
    3: Li := ENC_MD_FORMAT;
  Else
    Li := ENC_CIF_FORMAT;
  End;
  Sdk.SetEncoderPictureFormat(ChannelHandle[ChannelNum], Li);

  //设置视频制式
  Case Cfg.Config[ChannelNum].VideoFormat Of
    0: Li := StandardNone;
    1: Li := StandardNTSC;
    2: Li := StandardPAL;
    3: Li := StandardSECAM;
  Else
    Li := StandardPAL;
  End;
  Sdk.SetVideoStandard(ChannelHandle[ChannelNum], Li);

  //质量等级
  If Cfg.Config[ChannelNum].QuantLevel <= 15 Then
    Li := Cfg.Config[ChannelNum].QuantLevel + 5
  Else Li := Cfg.Config[ChannelNum].QuantLevel + 3;
  Sdk.SetDefaultQuant(ChannelHandle[ChannelNum],
    Cfg.Config[ChannelNum].QuantLevel, Cfg.Config[ChannelNum].QuantLevel, Li);

  Sdk.SetIBPMode(ChannelHandle[ChannelNum],
    Cfg.Config[ChannelNum].KeyFrameIntervals, 2, 1, Cfg.Config[ChannelNum].FrameRate);

  AlarmFileSave := False;
  If Cfg.Config[ChannelNum].IsMotion Then
  Begin
    AlarmFileSave := True;
    Sdk.AdjustMotionDetectPrecision(ChannelHandle[ChannelNum], 2, 2, 0);
    For I := 0 To 3 Do
      CopyRect(AreaList[I], Cfg.Config[ChannelNum].MotionRect[I]);
    Sdk.SetupMotionDetection(ChannelHandle[ChannelNum], @AreaList, 4);
    Sdk.StartMotionDetection(ChannelHandle[ChannelNum]);
  End
  Else
    Sdk.StopMotionDetection(ChannelHandle[ChannelNum]);

  //Sdk.StopLogo(ChannelHandle[ChannelNum]);
  If Cfg.Config[ChannelNum].Max_Bps > 10000 Then
    Sdk.SetupBitrateControl(ChannelHandle[ChannelNum], Cfg.Config[ChannelNum].Max_Bps, True)
  Else
    Sdk.SetupBitrateControl(ChannelHandle[ChannelNum], 0, False);
End;

//通道图形点击
Procedure TFrmMain.CmdMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender As TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(BtnSt[True], [(Sender As TImage).Tag]));
End;

Procedure TFrmMain.CmdMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender As TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(BtnSt[False], [(Sender As TImage).Tag]));
End;

//云台方法图形点击
Procedure TFrmMain.CmdYtClick(Sender: TObject);
Begin
  //
End;

Procedure TFrmMain.CmdYtMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender As TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(YTBtnSt[True], [(Sender As TImage).Tag]));
End;

Procedure TFrmMain.CmdYtMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  (Sender As TImage).Picture.Bitmap.LoadFromResourceName(HInstance,
    Format(YTBtnSt[False], [(Sender As TImage).Tag]));
End;

Procedure TFrmMain.FormCreate(Sender: TObject);

  Procedure CmdBtnLoad(Var Btn: TImage; Hint: String; index: Integer);
  Begin
    Btn.Hint := Hint;
    Btn.Cursor := crHandPoint;
    Btn.Tag := index;
    Btn.OnMouseDown := CmdMouseDown;
    Btn.OnMouseUp := CmdMouseUp;
    CmdMouseUp(Btn, mbLeft, [ssDouble], 2, 2);
  End;

  Procedure CmdYtBtnLoad(Var Btn: TImage; index: Integer);
  Begin
    Btn := TImage.Create(self);
    Btn.Parent := self;
    Btn.Tag := index;
    Btn.OnClick := CmdYtClick;
    Btn.OnMouseDown := CmdYtMouseDown;
    Btn.OnMouseUp := CmdYtMouseUp;
    CmdYtMouseUp(Btn, mbLeft, [ssDouble], 2, 2);
  End;

Var
  I: Integer;
Begin
  Path := ExtractFilePath(ParamStr(0));
  ShowHint := True;
  Sdk := TTmSDK.Create('');
  //ImgBackground.Picture.LoadFromFile(Path + 'mm.jpg');
  ImgBackground.Align := alClient;
  ImgBackground.SendToBack;

  CmdBtnLoad(CmdCapImage, '抓图', 1);
  CmdBtnLoad(CmdSet, '设置', 2);
  CmdBtnLoad(CmdPlayer, '回放', 3);
  CmdBtnLoad(CmdVCapOpen, '全部开启', 4);
  CmdBtnLoad(CmdVCapClose, '全部关闭', 5);
  CmdBtnLoad(CmdCapFrame, '抓帧', 6);

  SetBounds(0, 0, 1024, 768);
  VideoWin.SetBounds(3, 3, ClientWidth - 140, ClientHeight - 48);
  VideoWin.BorderColor := $636331;

  LbTime.SetBounds(ClientWidth Div 2 - 105, ClientHeight - 28, 200, 12);
  LbPane1.SetBounds(33, ClientHeight - 36, 38, 25);
  LbPane2.SetBounds(LbPane1.Left + 47, ClientHeight - 36, 38, 25);
  LbPane3.SetBounds(LbPane2.Left + 48, ClientHeight - 36, 38, 25);
  LbPane4.SetBounds(LbPane3.Left + 47, ClientHeight - 36, 38, 25);

  For I := 0 To ComponentCount - 1 Do
    If Components[I] Is TLabel Then
    Begin
      (Components[I] As TLabel).Caption := '';
      (Components[I] As TLabel).Transparent := True;
    End;
  CmdMenu.SetBounds(ClientWidth - 138, ClientHeight - 20, 17, 17);
  CmdExit.SetBounds(VideoWin.width + 25, 65, 31, 31);
  CmdSet.SetBounds(VideoWin.width + 18, ClientHeight - 170, 31, 15);
  CmdPlayer.SetBounds(ClientWidth - 38, CmdSet.Top, CmdSet.width, CmdSet.Height);
  CmdVCapOpen.SetBounds(ClientWidth - 80, CmdSet.Top - 25, CmdSet.width, CmdSet.Height);
  CmdVCapClose.SetBounds(ClientWidth - 80, CmdSet.Top, CmdSet.width, CmdSet.Height);
  CmdCapFrame.SetBounds(VideoWin.width + 18, CmdSet.Top - 25, CmdSet.width, CmdSet.Height);
  CmdCapImage.SetBounds(VideoWin.width + 18, CmdCapFrame.Top - 25, CmdSet.width, CmdSet.Height);

  For I := Low(YTBtnNum) To High(YTBtnNum) Do
    CmdYtBtnLoad(YTBtnNum[I], I);
  YTBtnNum[1].SetBounds(ClientWidth - 94, ClientHeight - 116, 18, 18); //左上
  YTBtnNum[2].SetBounds(ClientWidth - 68, ClientHeight - 128, 17, 22); //上
  YTBtnNum[3].SetBounds(ClientWidth - 42, ClientHeight - 114, 19, 19); //右上
  YTBtnNum[4].SetBounds(ClientWidth - 104, ClientHeight - 92, 20, 18); //左
  YTBtnNum[5].SetBounds(ClientWidth - 34, ClientHeight - 90, 22, 16); //右
  YTBtnNum[6].SetBounds(ClientWidth - 92, ClientHeight - 68, 18, 17); //左下
  YTBtnNum[7].SetBounds(ClientWidth - 66, ClientHeight - 56, 18, 21); //下
  YTBtnNum[8].SetBounds(ClientWidth - 42, ClientHeight - 68, 17, 19); //右下
  CmdYTControl.SetBounds(ClientWidth - 76, ClientHeight - 96, 31, 29);

  For I := 0 To MAX_CHANNELS - 1 Do
  Begin
    CalcButtonRect(VCapNum[I], VCap[I], I);
    AlarmFile[I] := TAlarmFile.Create;
    CurrentFileLen[I] := 0;
    FileHandle[I] := -1;
    CapDSPStatus[I] := False;
    FillChar(FileHeader[I], SizeOf(FileHeader[I]), #0);
  End;
  CapOldSel := -1;
  VideoWinClick(Nil);

  LoadSettings;
  LoadYtBtnStat(CmdYTControl, Cfg.YtStatus);

  TotalDSPs := 0;
  If Sdk.InitDSPs <= 0 Then
  Begin
    {$IFDEF NODEBUG}
    MsgErr('无法初始化 DSPs。');
    //Halt;
    {$ENDIF}
  End;

  TotalDSPs := Sdk.GetTotalDSPs;
  For I := 0 To TotalDSPs - 1 Do
    ChannelHandle[I] := Sdk.ChannelOpen(I);

  Sdk.RegisterStreamReadCallback(Stream_Read_CallBack, self);

  For I := 0 To TotalDSPs - 1 Do
  Begin
    VCap[I].Enabled := True;
    SetDSP(I);
    StartVideoPreview(I);
  End;
  VideoWin.BringToFront;
End;

Procedure TFrmMain.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
  I: Integer;
  EndCode: ULONG;
Begin
  For I := 0 To TotalDSPs - 1 Do
  Begin
    If FileHandle[I] <> -1 Then
    Begin
      Sdk.StopVideoCapture(ChannelHandle[I]);
      EndCode := End_Code;
      FileWrite(FileHandle[I], EndCode, SizeOf(EndCode));
      FileClose(FileHandle[I]);
      FileHandle[I] := -1;
    End;
  End;

  For I := 0 To MAX_CHANNELS - 1 Do
  Begin
    If Assigned(VCap[I]) Then VCap[I].Free;
    If Assigned(VCapNum[I]) Then VCapNum[I].Free;
    If Assigned(AlarmFile[I]) Then AlarmFile[I].Free;
  End;
  For I := Low(YTBtnNum) To High(YTBtnNum) Do
    If Assigned(YTBtnNum[I]) Then YTBtnNum[I].Free;
  Sleep(100);
  StopAllVideoPreview;
  For I := 0 To TotalDSPs - 1 Do
    Sdk.ChannelClose(ChannelHandle[I]);
  Sleep(100);
  Sdk.DeInitDSPs;
End;

Procedure TFrmMain.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  If Application.MessageBox('您要关闭系统吗？', PChar(SMsgDlgTip), MB_ICONQUESTION Or MB_YESNO) = IDNO Then
    CanClose := False;
End;

Procedure TFrmMain.CmdExitClick(Sender: TObject);
Begin
  close;
End;

Procedure TFrmMain.CmdVCapOpenClick(Sender: TObject);
Var
  I: Integer;
Begin
  If TotalDSPs = 0 Then Exit;
  For I := 0 To TotalDSPs - 1 Do
  Begin
    If Not CapDSPStatus[I] Then
      VCapDSP(I, False);
  End;
  VideoWin.Invalidate;
End;

Procedure TFrmMain.CmdVCapCloseClick(Sender: TObject);
Var
  I: Integer;
Begin
  If TotalDSPs = 0 Then Exit;
  For I := 0 To TotalDSPs - 1 Do
  Begin
    If CapDSPStatus[I] Then
      VCapDSP(I, True);
  End;
  VideoWin.Invalidate;
End;

Procedure TFrmMain.VideoWinDblClick(Sender: TObject);
Var
  I: Integer;
Begin
  If TotalDSPs = 0 Then Exit;
  StopAllVideoPreview;

  If VideoWin.PaneStyle = Pane1 Then
  Begin
    If ChannelHandle[VideoWin.Selected] <> 0 Then
      StartVideoPreview(VideoWin.Selected);
  End Else
  Begin
    For I := 0 To TotalDSPs - 1 Do
      StartVideoPreview(I);
  End;
End;

Procedure TFrmMain.CmdCapImageClick(Sender: TObject);
Var
  lSize: LongWord;
  W, H: Integer;
  FileName: String;
  pImageBuffer: Array[0..720 * 576 * 2 - 1] Of UCHAR;
Begin
  If TotalDSPs = 0 Then Exit;
  If Not DirectoryExists(Cfg.CaptureImageDir) Then ForceDirectories(Cfg.CaptureImageDir);
  FileName := Format('%sCapureImage_%d_%s.bmp', [AddDirSuffix(Cfg.CaptureImageDir), VideoWin.Selected, GetFormatDateTime(1)]);
  lSize := SizeOf(pImageBuffer);
  Sdk.GetOriginalImage(ChannelHandle[VideoWin.Selected], @pImageBuffer, @lSize);
  If Not Sdk.ZBaseFormatRetVal(lSize, W, H) Then Exit;
  If Sdk.SaveYUVToBmpFile(PChar(FileName), @pImageBuffer, W, H) = 0 Then
    Application.MessageBox('截图成功！', PChar(SMsgDlgTip), MB_ICONASTERISK);
End;

Procedure TFrmMain.VideoWinPaintRect(Sender: TObject; ChannelNum: Integer;
  Rect: TRect);
Const
  BoolStStr: Array[Boolean] Of String = ('录', '侦');
Begin
  If ChannelNum > TotalDSPs - 1 Then Exit;
  With VideoWin.Canvas Do
  Begin
    Brush.Style := bsClear;
    Font.Color := clLime;
    If Cfg.Config[ChannelNum].DspName <> '' Then
      TextOut(Rect.Left + 2, Rect.Bottom - 15, Cfg.Config[ChannelNum].DspName);
    Font.Style := [fsBold];
    If CapDSPStatus[ChannelNum] And (Not Cfg.Config[ChannelNum].IsMotion) Then
    Begin                               //已开启录像但没有启用报警
      Font.Color := clLime;
      TextOut(Rect.Left + 5, Rect.Top + 5, BoolStStr[False]);
    End;

    If CapDSPStatus[ChannelNum] And Cfg.Config[ChannelNum].IsMotion Then
    Begin                               //已开启录像但启用报警
      If CapDSPMotionStatus[ChannelNum] Then
      Begin                             //报警状态正在录像
        Font.Color := clLime;
        TextOut(Rect.Left + 5, Rect.Top + 5, BoolStStr[False]);
      End;
      Font.Color := clred;
      TextOut(Rect.Left + 20, Rect.Top + 5, BoolStStr[True]);
    End;
  End;
End;

Procedure TFrmMain.VideoWinMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Begin
  If Button <> mbRight Then Exit;
  If VideoWin.VideoWinStyle = Normal Then
    VideoWin.VideoWinStyle := FullScreen
  Else VideoWin.VideoWinStyle := Normal;
  VideoWinDblClick(Sender);
End;

Procedure TFrmMain.CmdSetClick(Sender: TObject);
Var
  I: Integer;
Begin
  {$IFDEF NODEBUG}
  If TotalDSPs = 0 Then Exit;
  {$ENDIF}
  For I := 0 To TotalDSPs - 1 Do
    If CapDSPStatus[I] Or CapDSPMotionStatus[I] Then
    Begin
      Application.MessageBox(PChar('系统有些通道处于录像或报警侦测状态，' + #13#10 +
        '此时进行系统置，特别是切换了报警类型，' + #13#10 +
        '有可能会导致不确定的异常发生，' + #13#10 +
        '您最好先停止它们。'), PChar(SMsgDlgWarning), MB_ICONWARNING);
      Break;
    End;

  With TFrmSetting.Create(self) Do
  Begin
    ShowModal;
    Free;
  End;
  VideoWin.Refresh;
End;

Procedure TFrmMain.CmdPlayerClick(Sender: TObject);
Begin
  WinExec(PChar(Path + 'SkyPlayer.exe'), SW_NORMAL);
End;

Procedure TFrmMain.TimerTimer(Sender: TObject);
Const
  WeekArray: Array[0..6] Of String = ('日', '一', '二', '三', '四', '五', '六');
Begin
  LbTime.Caption := '星期' + WeekArray[DayOfWeek(Now) - 1] + ' ' + GetFormatDateTime(2);
End;

Procedure TFrmMain.LbPaneClick(Sender: TObject);
Begin
  Case TLabel(Sender).Tag Of
    1: VideoWin.PaneStyle := Pane1;
    2: VideoWin.PaneStyle := Pane4;
    3: VideoWin.PaneStyle := Pane9;
    4: VideoWin.PaneStyle := Pane16;
  End;
  VideoWinDblClick(Sender);
End;

Procedure TFrmMain.CmdCapFrameClick(Sender: TObject);
Begin
  If TotalDSPs = 0 Then Exit;
  Sdk.CaptureIFrame(ChannelHandle[VideoWin.Selected]);
End;

//数据校验定时器
Procedure TFrmMain.ChkDSPTimerTimer(Sender: TObject);
Var
  I: Integer;
Begin
  For I := 0 To TotalDSPs - 1 Do
    If CapDSPStatus[I] Then
    Begin                               //已开启录像，比较数据是否相等
      If SHA1Match(SHA1Buffer(HashBuf[I][True], BufSize), SHA1Buffer(HashBuf[I][False], BufSize)) Then
        Inc(HashNum[I])                 //相等 加1
      Else
      Begin                             //不相等
        HashNum[I] := 0;                //次数清零，复制当前数据到另一个数据组中备用于下次比较
        CopyMemory(@HashBuf[I][False], @HashBuf[I][True], BufSize);
      End;

      If HashNum[I] >= 5 Then           //如果 超过5次数据相等，则通道故障，重启通道
      Begin
        VCapDSP(I, True);
        Sdk.StopVideoPreview(ChannelHandle[I]);
        Sdk.ChannelClose(ChannelHandle[I]);
        Sdk.ResetDSP(I);
        Sdk.ChannelOpen(ChannelHandle[I]);
        SetDSP(I);
        StartVideoPreview(I);
        VCapDSP(I, False);
      End;
    End;
End;

Procedure TFrmMain.CmdMenuClick(Sender: TObject);
Var
  P: TPoint;
Begin
  P.X := CmdMenu.Left + CmdMenu.width;
  P.Y := CmdMenu.Top + CmdMenu.Height;
  PopupMenu.Popup(P.X, P.Y);
End;

Procedure TFrmMain.Menu_AboutClick(Sender: TObject);
Begin
  //ShellAboutEx(self, Application.Icon, Application.Title, Ver);
End;

Procedure TFrmMain.CmdYTControlClick(Sender: TObject);
Begin
  Cfg.YtStatus := Not Cfg.YtStatus;
  LoadYtBtnStat(CmdYTControl, Cfg.YtStatus);
End;

End.

