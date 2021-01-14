Unit HIE_MP4HDPlay;
///////////////////////////////////////////////////////////////////
//Version:		1.0
///////////////////////////////////////////////////////////////////
Interface
Uses
  Windows;

Const
  //最大支持通道数
  MP4Play_MAX_SUPPORTS = 32;

  //MP4Play错误码
  MP4Play_NOERROR = 0;                  //没有错误
  MP4Play_PARA_OVER = 1;                //输入参数非法
  MP4Play_ORDER_ERROR = 2;              //调用顺序不对
  MP4Play_DEC_VIDEO_ERROR = 4;          //视频解码失败
  MP4Play_DEC_AUDIO_ERROR = 5;          //音频解码失败
  MP4Play_ALLOC_MEMORY_ERROR = 6;       //分配内存失败
  MP4Play_OPEN_FILE_ERROR = 7;          //文件操作失败
  MP4Play_CREATE_OBJ_ERROR = 8;         //创建线程事件等失败
  MP4Play_CREATE_DDRAW_ERROR = 9;       //创建directDraw失败
  MP4Play_CREATE_OFFSCREEN_ERROR = 10;  //创建后端缓存失败
  MP4Play_BUF_OVER = 11;                //缓冲区满，输入流失败
  MP4Play_CREATE_SOUND_ERROR = 12;      //创建音频设备失败
  MP4Play_SET_VOLUME_ERROR = 13;        //设置音量失败
  MP4Play_SUPPORT_FILE_ONLY = 14;       //只能在播放文件时才能使用此接口
  MP4Play_SUPPORT_STREAM_ONLY = 15;     //只能在播放流时才能使用此接口
  MP4Play_SYS_NOT_SUPPORT = 16;         //系统不支持，解码器只能工作在Pentium 3以上
  MP4Play_FILEHEADER_UNKNOWN = 17;      //没有文件头
  MP4Play_VERSION_INCORRECT = 18;       //解码器和编码器版本不对应
  MP4Play_INIT_DECODER_ERROR = 19;      //初始化解码器失败
  MP4Play_CHECK_FILE_ERROR = 20;        //测试文件头尾数据时没有找到有效数据文件太短或码流无法识别
  MP4Play_BLT_ERROR = 22;               //位拷贝失败
  MP4Play_UPDATE_ERROR = 23;            //显示overlay失败

  //判断是否支持
  SUPPORT_DDRAW = 1;                    //支持DIRECTDRAW
  SUPPORT_BLT = 2;                      //显卡支持BLT操作
  SUPPORT_BLTFOURCC = 4;                //显卡BLT支持颜色转换
  SUPPORT_BLTSHRINKX = 8;               //显卡BLT支持X轴缩小
  SUPPORT_BLTSHRINKY = 16;              //显卡BLT支持Y轴缩小
  SUPPORT_BLTSTRETCHX = 32;             //显卡BLT支持X轴放大
  SUPPORT_BLTSTRETCHY = 64;             //显卡BLT支持Y轴放大
  SUPPORT_SSE = 128;                    //CPU支持SSE指令
  SUPPORT_MMX = 256;                    //CPU支持MMX;

  //索引帧信息
Type
  PFRAME_POS = ^TFRAME_POS;
  TFRAME_POS = Record
    nFrameNum: LongInt;                 //帧号
    nFrameTime: UINT;                   //显示时间
    nFilePos: ULONG;                    //帧在文件中的位置
  End;

Const
  //播放缓冲范围
  MAX_DIS_FRAMES = 50;
  MIN_DIS_FRAMES = 6;
  //查找类型
  BY_FRAMENUM = 1;
  BY_FRAMETIME = 2;

  //数据缓区大小
  SOURCE_BUF_MAX = 1024 * 1000;
  SOURCE_BUF_MIN = 1024 * 50;
  //设置流类型
  STREAME_REALTIME = 0;                 //实时解码，适合板卡生成的实时数据流，默认值.
  STREAME_FILE = 1;                     //缓冲解码，适合文件流输入
  //回调函数返回类型
  T_AUDIO16 = 101;
  T_UYVY = 1;
  T_YV12 = 3;
  T_RGB32 = 7;

  //帧信息
Type
  PFRAME_INFO = ^TFRAME_INFO;
  TFRAME_INFO = Record
    nWidth: LongInt;
    nHeight: LongInt;
    nStamp: LongInt;
    nType: LongInt;
    nFrameRate: LongInt;
  End;

  TSourceBufCallBack = Procedure(nPort: LongInt; nBufSize, dwUser: DWORD; pResvered: Pointer); stdcall;
  TFileRefDoneCallBack = Procedure(nPort, nUser: DWORD); stdcall;
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //API
Function SetOverlayColorKey(DestColorKey: COLORREF; Const bUseOverlay: BOOL = TRUE): BOOL; stdcall;

//打开播放文件
Function OpenFile(nPort: LongInt; sFileName: PAnsiChar): BOOL; stdcall;

//关闭播放文件
Function CloseFile(nPort: LongInt): BOOL; stdcall;

//播放开始
Function Play(nPort: LongInt; HWND: HWND): BOOL; stdcall;
//播放结束
Function Stop(nPort: LongInt): BOOL; stdcall;

//播放暂停：nPause=TRUE暂停否则继续
Function Pause(nPort: LongInt; nPause: DWORD): BOOL; stdcall;

//单帧播放
Function OneByOne(nPort: LongInt): BOOL; stdcall;

//单帧回放
Function OneByOneBack(nPort: LongInt): BOOL; stdcall;

//设置文件结束时发送的消息消息发送到PLAY窗口
Function SetFileEndMsg(nPort: LongInt; HWND: HWND; nMsg: UINT): BOOL; stdcall;

//设置播放文件相对位置范围0-100%
Function SetPlayPos(nPort: LongInt; fRelativePos: Extended): BOOL; stdcall;

//获得播放文件相对位置范围0-100%
Function GetPlayPos(nPort: LongInt): Extended; stdcall;

//打开声音
Function PlaySound(nPort: LongInt): BOOL; stdcall;

//关闭声音
Function StopSound(): BOOL; stdcall;

//设置音量
Function SetVolume(nPort: LongInt; nVolume: WORD): BOOL; stdcall;

//获取音量
Function GetVolume(nPort: LongInt): WORD; stdcall;

//打开声音，共享方式
Function PlaySoundShare(nPort: LongInt): BOOL; stdcall;

//关闭本路声音，共享方式
Function StopSoundShare(nPort: LongInt): BOOL; stdcall;

//设置流播放模式
Function SetStreamOpenMode(nPort: LongInt; nMode: DWORD): BOOL; stdcall;

//打开流
Function OpenStream(nPort: LongInt; pFileHeadBuf: PBYTE; nSize, nBufPoolSize: DWORD): BOOL; stdcall;

//输入流数据
Function InputData(nPort: LongInt; pBuf: PBYTE; nSize: DWORD): BOOL; stdcall;

//结束流
Function CloseStream(nPort: LongInt): BOOL; stdcall;

//获得系统信息
Function GetCaps(): Integer; stdcall;

//得到文件总的时间
Function GetFileTime(nPort: LongInt): DWORD; stdcall;

//得到正在播放的文件时间
Function GetPlayedTime(nPort: LongInt): DWORD; stdcall;

Function LocalZoom(nPort: LongInt; bLocalZoom: BOOL; Left, Top, Width, Height: Integer): BOOL; stdcall;
////////////////////////////////////////////////////////////////////////////////////
//转换成BMP文件
Function ConvertToBmpFile(pBuf: Pchar; nSize, nWidth, nHeight, nType: LongInt; sFileName: Pchar): BOOL; stdcall;

//获得总帧数
Function GetFileTotalFrames(nPort: LongInt): DWORD; stdcall;

//获得当前播放时间，单位ms
Function GetPlayedTimeEx(nPort: LongInt): DWORD; stdcall;

//根据时间设置当前播放位置
Function SetPlayedTimeEx(nPort: LongInt; nTime: DWORD): BOOL; stdcall;

//获得当前播放的帧序号
Function GetCurrentFrameNum(nPort: LongInt): DWORD; stdcall;
//获得当前版本的文件头长度
Function GetFileHeadLength(): DWORD; stdcall;

//获得当前SDK版本和Build号
Function GetSdkVersion(): DWORD; stdcall;
////////////////////////////////////////////////////////////////////////////////////

 //获得错误号
Function GetLastError(nPort: LongInt): DWORD; stdcall;

//刷新显示
Function RefreshPlay(nPort: LongInt): BOOL; stdcall;

//获得画面大小
Function GetPictureSize(nPort: LongInt; pWidth, pHeight: PLongint): BOOL; stdcall;
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

//获得源缓冲剩余数据
Function GetSourceBufferRemain(nPort: LongInt): DWORD; stdcall;

//清除源缓冲剩余数据
Function ResetSourceBuffer(nPort: LongInt): BOOL; stdcall;

//设置源缓冲下限回调
Function SetSourceBufCallBack(nPort: LongInt; nThreShold: DWORD; CallBack: TSourceBufCallBack; dwUser: DWORD; pReserved: Pointer): BOOL; stdcall;

//设置标志位，下次达到阀值时回调
Function ResetSourceBufFlag(nPort: LongInt): BOOL; stdcall;

//设置播放缓冲区缓冲帧数
Function SetDisplayBuf(nPort: LongInt; nNum: DWORD): BOOL; stdcall;

//获得播放缓冲区缓冲帧数
Function GetDisplayBuf(nPort: LongInt): DWORD; stdcall;

//建文件索引
Function SetFileRefCallBack(nPort: LongInt; CallBack: TFileRefDoneCallBack; nUser: DWORD): BOOL; stdcall;

//设置当前播放帧号
Function SetCurrentFrameNum(nPort: LongInt; nFrameNum: DWORD): BOOL; stdcall;

//查找关键帧位置
Function GetKeyFramePos(nPort: LongInt; nValue, nType: DWORD; pFramePos: PFRAME_POS): BOOL; stdcall;

//查找下一个关键帧位置
Function GetNextKeyFramePos(nPort: LongInt; nValue, nType: DWORD; pFramePos: PFRAME_POS): BOOL; stdcall;

//新增接口 直接设置播放速度 nSpeed >= -4 && nSpeed <= 4 ,mSpeed = 0 为正常速度播放//////
Function SetPlaySpeed(nPort: LongInt; nSpeed: Integer): BOOL; stdcall;

Function SnapShot(nPort: LongInt; pBuf: PUCHAR; bufSize: Integer; size, Width, Height: Pinteger): Integer; stdcall;

Function GetAvailableDecoderChannel(): UINT; stdcall;

Implementation

Const
  hIE_Mp4HDPlayDLL = 'HIE_MP4HDPlay.DLL';

Function SetOverlayColorKey; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetOverlayColorKey';
Function OpenFile; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_OpenFile';
Function CloseFile; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_CloseFile';
Function Play; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_Play';
Function Stop; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_Stop';
Function Pause; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_Pause';
Function OneByOne; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_OneByOne';
Function OneByOneBack; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_OneByOneBack';
Function SetFileEndMsg; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetFileEndMsg';
Function SetPlayPos; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetPlayPos';
Function GetPlayPos; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetPlayPos';
Function PlaySound; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_PlaySound';
Function StopSound; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_StopSound';
Function SetVolume; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetVolume';
Function GetVolume; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetVolume';
Function PlaySoundShare; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_PlaySoundShare';
Function StopSoundShare; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_StopSoundShare';
Function SetStreamOpenMode; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetStreamOpenMode';
Function OpenStream; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_OpenStream';
Function InputData; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_InputData';
Function CloseStream; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_CloseStream';
Function GetCaps; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetCaps';
Function GetFileTime; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetFileTime';
Function GetPlayedTime; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetPlayedTime';
Function LocalZoom; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_LocalZoom';
////////////////////////////////////////////////////////////////////////////////////
Function ConvertToBmpFile; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_ConvertToBmpFile';
Function GetFileTotalFrames; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetFileTotalFrames';
Function GetPlayedTimeEx; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetPlayedTimeEx';
Function SetPlayedTimeEx; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetPlayedTimeEx';
Function GetCurrentFrameNum; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetCurrentFrameNum';
Function GetFileHeadLength; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetFileHeadLength';
Function GetSdkVersion; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetSdkVersion';
////////////////////////////////////////////////////////////////////////////////////
Function GetLastError; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetLastError';
Function RefreshPlay; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_RefreshPlay';
Function GetPictureSize; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetPictureSize';
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
Function GetSourceBufferRemain; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetSourceBufferRemain';
Function ResetSourceBuffer; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_ResetSourceBuffer';
Function SetSourceBufCallBack; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetSourceBufCallBack';
Function ResetSourceBufFlag; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_ResetSourceBufFlag';
Function SetDisplayBuf; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetDisplayBuf';
Function GetDisplayBuf; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetDisplayBuf';
Function SetFileRefCallBack; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetFileRefCallBack';
Function SetCurrentFrameNum; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetCurrentFrameNum';
Function GetKeyFramePos; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetKeyFramePos';
Function GetNextKeyFramePos; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetNextKeyFramePos';
Function SetPlaySpeed; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SetPlaySpeed';
Function SnapShot; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_SnapShot';
Function GetAvailableDecoderChannel; External hIE_Mp4HDPlayDLL Name 'MP4HDPlay_GetAvailableDecoderChannel';

End.

 