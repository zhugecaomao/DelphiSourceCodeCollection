unit tmSDK_DataType;

interface

Uses Windows;

Type
  TPictureFormat = LongWord;            //图像格式
  TTypeVideoFormat = LongWord;
  TBitrateControlType = LongWord;
  PFrameType = ^TFrameType;
  TFrameType = LongWord;
  PVideoStandard = ^TVideoStandard;
  TVideoStandard = LongWord;

Const
  MAX_CHANNELS = 16;
  End_Code = $00000002;

  PAL_QCIF_WIDTH = 176;
  PAL_QCIF_HIGHT = 144;
  PAL_CIF_WIDTH = 352;
  PAL_CIF_HIGHT = 288;
  PAL_TWOCIF_WIDTH = 704;
  PAL_TWOCIF_HIGHT = 288;
  PAL_MD_WIDTH = 512;
  PAL_MD_HIGHT = 288;
  PAL_D1_WIDTH = 704;
  PAL_D1_HIGHT = 576;

  NTSC_QCIF_WIDTH = 160;
  NTSC_QCIF_HIGHT = 120;
  NTSC_CIF_WIDTH = 320;
  NTSC_CIF_HIGHT = 240;
  NTSC_TWOCIF_WIDTH = 640;
  NTSC_TWOCIF_HIGHT = 240;
  NTSC_MD_WIDTH = 416;
  NTSC_MD_HIGHT = 240;
  NTSC_D1_WIDTH = 640;
  NTSC_D1_HIGHT = 480;

  StandardNone: TVideoStandard = $80000000; //无视频信号
  StandardNTSC: TVideoStandard = $00000001; //NTSC 制式
  StandardPAL: TVideoStandard = $00000002; //PAL 制式
  StandardSECAM: TVideoStandard = $00000004; //SECAM 制式

  vdfRGB8A_233: TTypeVideoFormat = $00000001;
  vdfRGB8R_332: TTypeVideoFormat = $00000002;
  vdfRGB15Alpha: TTypeVideoFormat = $00000004;
  vdfRGB16: TTypeVideoFormat = $00000008; //16 位 RGB 视频压缩格式
  vdfRGB24: TTypeVideoFormat = $00000010; //24 位 RGB 视频压缩格式
  vdfRGB24Alpha: TTypeVideoFormat = $00000020;
  vdfYUV420Planar: TTypeVideoFormat = $00000040;
  vdfYUV422Planar: TTypeVideoFormat = $00000080; //YUV422 视频压缩格式
  vdfYUV411Planar: TTypeVideoFormat = $00000100;
  vdfYUV420Interspersed: TTypeVideoFormat = $00000200;
  vdfYUV422Interspersed: TTypeVideoFormat = $00000400;
  vdfYUV411Interspersed: TTypeVideoFormat = $00000800;
  vdfYUV422Sequence: TTypeVideoFormat = $00001000;
  vdfYUV422SequenceAlpha: TTypeVideoFormat = $00002000;
  vdfMono: TTypeVideoFormat = $00004000;
  vdfYUV444Planar: TTypeVideoFormat = $00008000;

  brCBR: TBitrateControlType = 0;
  brVBR: TBitrateControlType = 1;

  PktError = $0000;                     //帧信息错误
  PktIFrames = $0001;                   //I 帧
  PktPFrames = $0002;                   //P 帧
  PktBBPFrames = $0004;                 //B 帧
  PktDspStatus = $0020;                 //DSP 信息帧
  PktAudioFrames = $0008;               //音频帧
  PktQCIFIFrames = $0010;               //运动检测帧
  PktQCIFPFrames = $0040;               //原始图像帧
  PktBIFrames = $0090;
  PktBBIFrames = $00C0;
  PktSysHeader = $0080;                 //系统头
  PktSFrames = $0200;                   //静态帧
  PktBPFrames = $0100;                  //BP 帧

  PktAimDetection = $0400;
  PktOrigImage = $0800;
  PktMotionDetection = $1000;

  //采集卡分辨率(值越大分辨率越高，图像清晰度越好）
  ENC_CIF_FORMAT: TPictureFormat = 0;
  ENC_QCIF_FORMAT: TPictureFormat = 1;
  ENC_2CIF_FORMAT: TPictureFormat = 2;
  ENC_MD_FORMAT: TPictureFormat = 3;
  //ENC_QQCIF_FORMAT  : TPictureFormat = 4;
  //ENC_CIFQCIF_FORMAT: TPictureFormat = 5;
  //ENC_CIFQQCIF_FORMAT: TPictureFormat = 6;
  //ENC_DCIF_FORMAT   : TPictureFormat = 7;

  _OSD_BASE = $9000;
  _OSD_YEAR4 = _OSD_BASE + 0;
  _OSD_YEAR2 = _OSD_BASE + 1;
  _OSD_MONTH3 = _OSD_BASE + 2;
  _OSD_MONTH2 = _OSD_BASE + 3;
  _OSD_DAY = _OSD_BASE + 4;
  _OSD_WEEK3 = _OSD_BASE + 5;
  _OSD_CWEEK1 = _OSD_BASE + 6;
  _OSD_HOUR24 = _OSD_BASE + 7;
  _OSD_HOUR12 = _OSD_BASE + 8;
  _OSD_MINUTE = _OSD_BASE + 9;
  _OSD_SECOND = _OSD_BASE + 10;

  STREAM_TYPE_VIDEO = 1;                //视频流
  STREAM_TYPE_AUDIO = 2;                //音频流
  STREAM_TYPE_AVSYNC = 3;               //音视频同步流

Type
  PFRAMES_STATISTICS = ^TFRAMES_STATISTICS;
  TFRAMES_STATISTICS = Record
    VideoFrames: ULong;                 //视频帧
    AudioFrames: ULong;                 //音频帧
    FramesLost: ULong;                  //丢失帧
    QueueOverflow: ULong;               //缓存溢出
  End;

  PCHANNEL_CAPABILITY = ^TChannelCapability;
  TChannelCapability = Record
    bAudioPreview: UCHAR;               //音频预览
    bAlarmIO: UCHAR;                    //报警信号
    bWatchDog: UCHAR;                   //看门狗
  End;

  PVERSION_INFO = ^TVERSION_INFO;
  TVERSION_INFO = Record
    DspVersion: ULong;                  //DSP版本号
    DspBuildNum: ULong;                 //创建号
    DriverVersion: ULong;               //驱动版本号
    DriverBuildNum: ULong;              //驱动创建号
    SDKVersion: ULong;                  //SDK版本号
    SDKBuildNum: ULong;                 //SDK创建号
  End;

  PCHANNEL_INFO = ^TCHANNEL_INFO;
  TCHANNEL_INFO = Record
    PictureFormat: TPictureFormat;
    Reserved: Array[0..5] Of ULong;
  End;

  PMOTION_DATA_HEADER = ^TMotionData;
  TMotionData = Record
    PicFormat: TPictureFormat;
    HorizeBlocks: ULong;
    VerticalBlocks: ULong;
    BlockSize: ULong;
  End;

  TLogrecord_CallBack = Procedure(Str: PChar; Context: Pointer); cdecl;
  TStream_Read_CallBack = Function(ChannelNumber: UINT; Context: Pointer): Integer; cdecl;

implementation

end.
 