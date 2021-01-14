Unit tmSDK;

Interface

Uses Windows, tmSDK_DataType;

  {初始化所有板卡,该函数应在应用软件启动时调用,如果返回值为 0 表示初始化失败}
Function InitDSPs(): Integer; cdecl;

{关闭所有板卡上 DSP 功能,该函数应在应用软件退出时调用}
Function DeInitDSPs(): Integer; cdecl;

{复位某 DSP 系统，注意请谨慎调用该函数时，请确定 DSP 故障无法软件恢复时再关闭相关的资源后复位 DSP}
Function ResetDSP(DspNumber {DSP 的索引号}: Integer): Integer; cdecl;

{由 16 位(BCD 码)组成,高 8 位为主版本, 低 8 位为次版本, 其后为 32 位的 BUILD 号,用于软件升级时标明该版本的最后修改时间}
Function GetSDKVersion(VersionInfo: PVERSION_INFO): Integer; cdecl;

{获取板卡的特殊功能信息}
Function GetCapability(hChannelHandle: THandle;
  Capability: PCHANNEL_CAPABILITY       //指向 CHANNEL_CAPABILITY 的参数指针
  ): Integer; cdecl;

{获取 SDK 及 DSP 错误报告}
Function GetLastErrorNum(hChannelHandle: THandle;
  DspError,                             //DSP 错误
  SdkError: PULONG                      //SDK 错误
  ): Integer; cdecl;

{获取板卡硬件信息}
Function GetBoardInfo(hChannelHandle: THandle;
  BoardType,                            //板卡型号
  SerialNo: PULONG                      //板卡 ID 号
  ): Integer; cdecl;

{打开对应通道,获取对应通道的操作句柄,与对应通道的相关的操作必须使用该句柄}
Function ChannelOpen(ChannelNum: Integer): THandle; cdecl;

{关闭对应通道,释放相关资源}
Function ChannelClose(hChannelHandle: THandle): Integer; cdecl;

{获取目前已打开的通道数}
Function GetTotalChannels(): Integer; cdecl;

{获取可使用的视频 DSP 个数,若小于系统中安装的 DSP 个数,则表明有一 DSP 初始化失败}
Function GetTotalDSPs(): Integer; cdecl;

{启动对应通道视频预览,如果在 VideoFormat 中设置为 YUV 类型,则视频适配器必须支持硬件
Overlay 功能,视频适配器必须设置为 16 位色或 32 位色.如果 VideoFormat 设置为 RGB 类型,则
采用 DDRAW 模式显示,视频窗口会覆盖所有位于窗口范围内的内容}
Function StartVideoPreview(hChannelHandle: THandle;
  WndHandle: HWND;                      //显示窗口句柄
  RECT: PRECT;                          //显示窗口中显示位置
  bOverlay: Boolean;                    //打开或关闭 Overlay 模式预览
  VideoFormat: TTypeVideoFormat;        //视频格式
  FrameRate: Integer                    //视频帧率
  ): Integer; cdecl;

{停止对应通道视频预览}
Function StopVideoPreview(hChannelHandle: THandle): Integer; cdecl;

{请在调用函数 StartVideoPreview之前调用该函数，并将对应的窗口颜色设置为一样的颜色；}
Function SetOverlayColorKey(DestColorKey: COLORREF): Integer; cdecl;

{读指定长度的数据流，当调用 StartVideoCapture 或 StartMotionDetection
后，SDK 线程会向已注册的用户窗口消息处理函数发送指定的消息，并提供消息来源的通道号。
当用户程序收到该消息时，可调用本函数来读取数据，Length 在作为输入时必须提供缓冲的大
小，ReadStreamData 会判断缓冲是否足够，如果缓冲足够大，则当前帧信息为 I 帧返回
1，其它帧信息返回 0，否则-1}
Function ReadStreamData(hChannelHandle: THandle;
  DataBuf: Pointer;                     //自定义的数据缓存区
  Length: PDWORD;                       //输入：缓冲的大小，输出：一帧数据的长度
  FrameType: PInteger                   //输出帧类型
  ): Integer; cdecl;

{当数据准备好时，SDK 会向hWnd 窗口发送MessageId 消息，目标窗口收到 Message 后可调用ReadStreamData 读取一帧数据}
Function RegisterMessageNotifyHandle(HWND {对应窗口句柄}: HWND; MessageId {自定义的消息名称}: UINT): Integer; cdecl;

{另一种数据流读取方式，调用此函数时会提供通道号及 Context 指针}
Function RegisterStreamReadCallback(StreamReadCallback: STREAM_READ_CALLBACK; Context: Pointer): Integer; cdecl;

{启动数据截取， SDK 向用户程序发送在 RegisterMessageNotifyHandle 中注册的消
息，用户程序可使用 ReadStreamData 来读取数据流}
Function StartVideoCapture(hChannelHandle: THandle): Integer; cdecl;

{停止数据截取}
Function StopVideoCapture(hChannelHandle: THandle): Integer; cdecl;

{设置对应通道视频参数(亮度,对比度,饱和度,色调)}
Function SetVideoPara(hChannelHandle: THandle;
  Brightness,                           //亮度指针值( 0 – 255 )
  Contrast,                             //对比度指针值( 0 – 127 )
  Saturation,                           // 饱和度指针值( 0 – 127 )
  Hue: Integer                          //色调指针值( 0 – 255 )
  ): Integer; cdecl;

{获取对应通道的视频参数}
Function GetVideoPara(hChannelHandle: THandle;
  VideoStandard: PVideoStandard;
  Brightness,                           //亮度指针值( 0 – 255 )
  Contrast,                             //对比度指针值( 0 – 127 )
  Saturation,                           // 饱和度指针值( 0 – 127 )
  Hue: PInteger                         //色调指针值( 0 – 255 )
  ): Integer; cdecl;

{当系统按下 CTRL+ALT+DEL 时系统的 OVERLAY 表面会被强制关闭，调用该函数时可以恢复 OVERLAY 表面。}
Function RestoreOverlay(): Integer;

{获得接入视频信号情况，用于视频丢失报警}
Function GetVideoSignal(hChannelHandle: THandle): Integer; cdecl;

{获得帧统计信息}
Function GetFramesStatistics(hChannelHandle: THandle; FramesStatistics: PFRAMES_STATISTICS): Integer; cdecl;

{把 24 位 bmp 文件转成 yuv 格式的数据}
Function LoadYUVFromBmpFile(FileName: PChar;
  yuv: PChar;                           //YUV422 格式的图像指针
  BufLen: Integer;                      //yuv 缓存大小
  Width,                                //返回 yuv 图像的宽度
  Height: PInteger                      //返回 yuv 图像的高度
  ): Integer; cdecl;

{把 yuv 图像转成 24 位 bmp 文件}
Function SaveYUVToBmpFile(FileName: PChar;
  yuv: PChar;                           //YUV422 格式的图像指针
  Width,                                //yuv 图像的宽度
  Height: Integer                       //yuv 图像的高度
  ): Integer; cdecl;

{设置马赛克区域}
Function SetupMosaic(hChannelHandle: THandle;
  RectList: PRECT;                      //矩形区域数组
  NumberOfAreas: Integer                //矩形区域个数
  ): Integer; cdecl;

{启动对应通道马赛克功能}
Function StartMosaic(hChannelHandle: THandle): Integer; cdecl;

{停止对应通道马赛克功能}
Function StopMosaic(hChannelHandle: THandle): Integer; cdecl;

{设置 OSD 显示，在当前的系统时间年月日星期时分秒叠加在预览视频之上，并作透明处理，可以调整垂直方向的位置}
Function SetOsd(hChannelHandle: THandle; Enable: BOOL): Integer; cdecl;

Function SetOsdDisplayMode(hChannelHandle: THandle;
  osdColor: COLORREF;                   //OSD 显示颜色
  Translucent: BOOL;                    //OSD 图像是否做半透明处理
  TwinkleInterval: Integer;             //闪烁的时间设置，由 16进制数表示为 0xXXYY,其中XX 为显示的秒数，YY 为停止显示的秒数，XXYY 均为 0 时正常显示
  Format1, Format2: PWORD {描述字符叠加的位置和次序的格式串，具体定义下：
  USHORT X， USHORT Y， CHAR0， CHAR1， CHAR2，? CHARN, NULL；其中X，Y
  是该字串在标准 CIF 图像的起始位置，X 必须是 8 的倍数，Y 可以在图像高度内
  取值即（0-287）PAL 、（0-239）NTSC；CHARN 也是 USHORT 型的参数，可以是 ASCII
  码也可以是汉字，当想要显示当前时间时，可以指定为固定的时间定义值，其值
  如下： _OSD_YEAR4 四位的年显示，如 2002； _OSD_YEAR2 两位的年显示，如
  02；_OSD_MONTH3 英文的月显示，如 Jan；_OSD_MONTH2 两位阿拉伯数字的月显
  示，如 07；_OSD_DAY 两位的阿拉伯数字的日显示，如 31；_OSD_WEEK3 英文的
  星期显示，如 Tue；_OSD_CWEEK1 中文的星期显示，如星期二；_OSD_HOUR24 24
  小时的时钟显示，如 18；_OSD_HOUR12 12 小时的时钟显示，如 AM09 或 PM09；
  _OSD_MINUTE 两位分钟的显示；_OSD_SECOND 两位秒的显示；
  在格式字符串的最后必须以 NULL（0）结尾，否则会显示错误的内容。 字符串
  和时间显示可以在 FORMAT1 也可以在FORAMT2，也可以混合在一起，但不得超过
  一行 CIF 图像的宽度}
  ): Integer; cdecl;

{设置OSD 屏幕图像位置及数据；用户程序可调用 LoadYUVFromBmpFile 从取 24 位 bmp
文件中获取 YUV 数据（见 4.32）,透明处理由 DSP 完成}
Function SetLogo(hChannelHandle: THandle;
  x,                                    //左上角位置 x(0-351)
  y,                                    //左上角位置 y(0-287)
  w,                                    //宽度(0-128)
  h: Integer;                           //高度(0-64)
  yuv: PChar                            //YUV422 格式的图像指针
  ): Integer; cdecl;

{停止 OSD 显示}
Function StopLogo(hChannelHandle: THandle): Integer;

{可通过该函数来设置 LOGO 的显示模式}
Function SetLogoDisplayMode(hChannelHandle: THandle;
  ColorKey: COLORREF;                   //LOGO 图像该颜色将在显示时完全透明
  Translucent: BOOL;                    //LOGO 图像是否做半透明处理
  TwinkleInterval: Integer              //闪烁的时间设置，由 16进制数表示为 0xXXYY,其中XX 为显示的秒数，YY 为停止显示的秒数，XXYY 均为 0 时正常显示
  ): Integer; cdecl;

{设置视频标准，在某一制式的摄像头已经接好的情况下启动系统时可不必调用该函数，如果
没有接摄像头的情况下启动系统然后再接 NTSC 制式的摄像头则必须调用该函数，或者中途调换
不同制式的摄像头也必须调用该函数}
Function SetVideoStandard(hChannelHandle: THandle; VideoStandard: TVideoStandard): Integer; cdecl;

{设置流类型}
Function SetStreamType(hChannelHandle: THandle; StreamType {流类型}: Word): Integer; cdecl;

{获取流类型}
Function GetStreamType(hChannelHandle: THandle; StreamType {指向流类型指针}: PWORD): Integer; cdecl;

{设置帧结构、关键帧间隔、B 帧数目、帧率，其中关键帧间隔不能小于 1，B帧数目可以为 0、
1 或 2，P 帧暂时设为无效，帧率范围 1-25，可在运行时设定； }
Function SetIBPMode(hChannelHandle: THandle; KeyFrameIntervals {关键帧间隔（默认值为 100）}, BFrames {B 帧数（默认值为 2）}, PFrames {P 帧数}, FrameRate {帧率（默认值为 25）}: Integer): Integer; cdecl;

{设置图像量化系数，用于调整图像质量，系数越低质量越好，取值范围（12-30），一般取值
法为：取 I帧和 P 帧一样大，B 帧比它们大 3 到5，例如：15，15，20和 18，18，23，这里系统
默认值为 18，18，23；}
Function SetDefaultQuant(hChannelHandle: THandle; IQuantVal, PQuantVal, BQuantVal: Integer): Integer; cdecl;

{可用来设置最大比特率，MaxBps 设为0 时码率控制无效，当设置为某一最大比特率时，当编
码码流将超过该值时，DSP 会自动调整编码参数来保持不超过最大比特率，当码率低于最大比特
率时，DSP 不进行干涉，调整误差为<10%； bCbr }
Function SetupBitrateControl(hChannelHandle: THandle; MaxBps {最大比特率（10000 以上）}: ULong; bCbr {是否采用恒定码率}: BOOL): Integer; cdecl;

{设置当前通道的编码格式，必须在录像停止时调用}
Function SetEncoderPictureFormat(hChannelHandle: THandle; PictureFormat {编码图像大小（CIF 、QCIF）}: TPictureFormat): Integer; cdecl;

{将目前编码帧强制设定为 I 帧模式，可从码流中提取该帧单独用于网络传送}
Function CaptureIFrame(hChannelHandle: THandle): Integer; cdecl;

Function SetupAimDetectArea(hChannelHandle: THandle; RectList: PRECT; NumberOfAreas: Integer): Integer; cdecl;
Function StartAimDetect(hChannelHandle: THandle): Integer; cdecl;
Function StopAimDetect(hChannelHandle: THandle): Integer; cdecl;
Function RegisterLogRecordCallback(LogRecordFunc: LOGRECORD_CALLBACK; Context: Pointer): Integer; cdecl;

{设置运动检测区域，当收到运动信息的数据帧（PktMotionDetection）时,调用
MotionAnalyzer, MotionAnalyzer 会根据在 SetupMotionDetection 中的
设置来分析每个需要检测的区域，当某区域的运动阀值(MotionAnalyzer 函数中的接口参
数iThreshold)到达时，会在返回的区域数组（MotionAnalyzer函数中的接口参数iResult）
标明最后的判断}
Function SetupMotionDetection(hChannelHandle: THandle; RectList {矩形区域数组}: PRECT; iAreas {矩形区域个数}: Integer): Integer; cdecl;

{启动运动检测，运动检测信息会通过数据流传送，用户程序发现是 PktMotionDetection 帧类
型时，可调用 MotionAnalyzer 来处理运动信息，结果由 MotionAnalyzer 在
iResult 中返回。也可以按照 SDK 提供的数据格式来自己分析。注意：运动检测与编码相互独立，
用户程序可在不启动编码的情况下进行运动检测}
Function StartMotionDetection(hChannelHandle: THandle): Integer; cdecl;

{停止运动检测}
Function StopMotionDetection(hChannelHandle: THandle): Integer; cdecl;

{运动检测由 DSP 完成，DSP 送出的 IPktMotionData 帧就是已经分析好的运动信息，，区域的
运动分析由主机完成，数据源由码流中的 PktMotionData 帧提供（见 Demo 源码的 OndataReady
部分），结果在 iResult 中说明，用户软件可使用由码流提供的运动强度信息来自己分析或调用
该函数来进行区域分析}
Function MotionAnalyzer(hChannelHandle: THandle;
  MotionData: PChar;                    //运动矢量指针
  iThreshold: Integer;                  //判断是否运动的一个运动阀值( 0 – 100 )
  iResult: PInteger                     //按照运动阀值指定的强度分析后的结果，是一个数组,大小在 SetupMotionDetection 的 numberOfAreas 指定， 如果某数组单元的值大于零则表明该区域有运动且该值表明运动强度
  ): Integer; cdecl;

{调整运动分析灵敏度，可于编码时动态调整运动侦测的灵敏度，决定 DSP 全局运动分析的灵
敏度，与 MotionAnalyzer 的 iThreshold 不同，后者主要用于主机分析指定区域的运动
统计结果，等级 0 最灵敏，6 最迟钝；推荐值为 2}
Function AdjustMotionDetectPrecision(hChannelHandle: THandle;
  iGrade,                               //运动分析灵敏度等级（0-6）
  iFastMotionDetectFps,                 //高速运动检测的帧间隔，取值范围 0-12，0 表示不作高速运动检测，通常值为 2
  iSlowMotionDetectFps: Integer         //低速运动检测，适合于慢速运动情况，通常取值 13 以上，当取值为 0 时 不作低速运动检测
  ): Integer; cdecl;

{设置音频预览，打开或关闭，系统只能有一路打开}
Function SetAudioPreview(hChannelHandle: THandle; bEnable: BOOL): Integer; cdecl;

{获取当前通道的现场声音幅度，注意当无声音输入时因背景躁声的原因返回值并不为 0}
Function GetSoundLevel(hChannelHandle: THandle): Integer; cdecl;

{设置当前通道的现场声音幅度}
Function SetSoundLevel(hChannelHandle: THandle): Integer; cdecl;

{获得原始图像，原始图像是标准的 CIF 图像格式(包括 QCIF 编码)，用户程序可调用
SaveYUVToBmpFile 来生成 24 位的 bmp 文件}
Function GetOriginalImage(hChannelHandle: THandle;
  ImageBuf: PUCHAR;                     //原始图像指针 YUV 数据
  Size: PULONG                          //原始图像的大小（注：调用前是 Imagebuf 的大小，调用后是实际图像所使用的字节数）
  ): Integer; cdecl;

Function SetHorOffset(hChannelHandle: THandle; HorOffset: Integer): Integer; cdecl;

Function SetAuxCodecMode(hChannelHandle: THandle; KeyFrameIntervals, FrameRate, BitRate: Integer): Integer; cdecl;
Function StartAuxCodec(hChannelHandle: THandle): Integer; cdecl;
Function StopAuxCodec(hChannelHandle: THandle): Integer; cdecl;

{设置无视频信号显示语言}
Function SetLanguage(hChannelHandle: THandle;
  Language: Integer                     //0   中文[无视频信号]  1 英文[No Video]
  ): Integer; cdecl;

Function DumpDebug(hChannelHandle: THandle): Integer; cdecl;

Function GetChannelInfo(hChannelHandle: THandle; pChannelInfo: PCHANNEL_INFO): Integer; cdecl;

Implementation

Const
  tmSdkDLL = 'tmSDK.DLL';

Function InitDSPs; External tmSdkDLL Name 'MP4Sys_InitDSPs';
Function DeInitDSPs; External tmSdkDLL Name 'MP4Sys_DeInitDSPs';
Function ResetDSP; External tmSdkDLL Name 'MP4Sys_ResetDSP';

Function GetSDKVersion; External tmSdkDLL Name 'MP4Sys_GetSDKVersion';
Function GetCapability; External tmSdkDLL Name 'MP4Sys_GetCapability';
Function GetLastErrorNum; External tmSdkDLL Name 'MP4Sys_GetLastErrorNum';
Function GetBoardInfo; External tmSdkDLL Name 'MP4Sys_GetBoardInfo';

Function ChannelOpen; External tmSdkDLL Name 'MP4Sys_ChannelOpen';
Function ChannelClose; External tmSdkDLL Name 'MP4Sys_ChannelClose';
Function GetTotalChannels; External tmSdkDLL Name 'MP4Sys_GetTotalChannels';
Function GetTotalDSPs; External tmSdkDLL Name 'MP4Sys_GetTotalDSPs';

Function StartVideoPreview; External tmSdkDLL Name 'MP4Sys_StartVideoPreview';
Function StopVideoPreview; External tmSdkDLL Name 'MP4Sys_StopVideoPreview';
Function SetOverlayColorKey; External tmSdkDLL Name 'MP4Sys_SetOverlayColorKey';

Function ReadStreamData; External tmSdkDLL Name 'MP4Sys_ReadStreamData';
Function RegisterMessageNotifyHandle; External tmSdkDLL Name 'MP4Sys_RegisterMessageNotifyHandle';
Function RegisterStreamReadCallback; External tmSdkDLL Name 'MP4Sys_RegisterStreamReadCallback';

Function StartVideoCapture; External tmSdkDLL Name 'MP4Sys_StartVideoCapture';
Function StopVideoCapture; External tmSdkDLL Name 'MP4Sys_StopVideoCapture';

Function SetVideoPara; External tmSdkDLL Name 'MP4Sys_SetVideoPara';
Function GetVideoPara; External tmSdkDLL Name 'MP4Sys_GetVideoPara';
Function RestoreOverlay; External tmSdkDLL Name 'MP4Sys_RestoreOverlay';

Function GetVideoSignal; External tmSdkDLL Name 'MP4Sys_GetVideoSignal';
Function GetFramesStatistics; External tmSdkDLL Name 'MP4Sys_GetFramesStatistics';
Function LoadYUVFromBmpFile; External tmSdkDLL Name 'MP4Sys_LoadYUVFromBmpFile';
Function SaveYUVToBmpFile; External tmSdkDLL Name 'MP4Sys_SaveYUVToBmpFile';

Function SetupMosaic; External tmSdkDLL Name 'MP4Sys_SetupMosaic';
Function StartMosaic; External tmSdkDLL Name 'MP4Sys_StartMosaic';
Function StopMosaic; External tmSdkDLL Name 'MP4Sys_StopMosaic';

Function SetOsd; External tmSdkDLL Name 'MP4Sys_SetOsd';
Function SetOsdDisplayMode; External tmSdkDLL Name 'MP4Sys_SetOsdDisplayMode';
Function SetLogo; External tmSdkDLL Name 'MP4Sys_SetLogo';
Function StopLogo; External tmSdkDLL Name 'MP4Sys_StopLogo';
Function SetLogoDisplayMode; External tmSdkDLL Name 'MP4Sys_SetLogoDisplayMode';

Function SetVideoStandard; External tmSdkDLL Name 'MP4Sys_SetVideoStandard';

Function SetStreamType; External tmSdkDLL Name 'MP4Sys_SetStreamType';
Function GetStreamType; External tmSdkDLL Name 'MP4Sys_GetStreamType';

Function SetIBPMode; External tmSdkDLL Name 'MP4Sys_SetIBPMode';
Function SetDefaultQuant; External tmSdkDLL Name 'MP4Sys_SetDefaultQuant';
Function SetupBitrateControl; External tmSdkDLL Name 'MP4Sys_SetupBitrateControl';
Function SetEncoderPictureFormat; External tmSdkDLL Name 'MP4Sys_SetEncoderPictureFormat';
Function CaptureIFrame; External tmSdkDLL Name 'MP4Sys_CaptureIFrame';
Function SetupAimDetectArea; External tmSdkDLL Name 'MP4Sys_SetupAimDetectArea';
Function StartAimDetect; External tmSdkDLL Name 'MP4Sys_StartAimDetect';
Function StopAimDetect; External tmSdkDLL Name 'MP4Sys_StopAimDetect';
Function RegisterLogRecordCallback; External tmSdkDLL Name 'MP4Sys_RegisterLogRecordCallback';

Function SetupMotionDetection; External tmSdkDLL Name 'MP4Sys_SetupMotionDetection';
Function StartMotionDetection; External tmSdkDLL Name 'MP4Sys_StartMotionDetection';
Function StopMotionDetection; External tmSdkDLL Name 'MP4Sys_StopMotionDetection';
Function MotionAnalyzer; External tmSdkDLL Name 'MP4Sys_MotionAnalyzer';
Function AdjustMotionDetectPrecision; External tmSdkDLL Name 'MP4Sys_AdjustMotionDetectPrecision';

Function SetAudioPreview; External tmSdkDLL Name 'MP4Sys_SetAudioPreview';
Function GetSoundLevel; External tmSdkDLL Name 'MP4Sys_GetSoundLevel';
Function SetSoundLevel; External tmSdkDLL Name 'MP4Sys_SetSoundLevel';
Function GetOriginalImage; External tmSdkDLL Name 'MP4Sys_GetOriginalImage';

Function SetHorOffset; External tmSdkDLL Name 'MP4Sys_SetHorOffset';

Function SetAuxCodecMode; External tmSdkDLL Name 'MP4Sys_SetAuxCodecMode';
Function StartAuxCodec; External tmSdkDLL Name 'MP4Sys_StartAuxCodec';
Function StopAuxCodec; External tmSdkDLL Name 'MP4Sys_StopAuxCodec';
Function SetLanguage; External tmSdkDLL Name 'MP4Sys_SetLanguage';
Function DumpDebug; External tmSdkDLL Name 'MP4Sys_DumpDebug';

Function GetChannelInfo; External tmSdkDLL Name 'MP4Sys_GetChannelInfo';
End.

