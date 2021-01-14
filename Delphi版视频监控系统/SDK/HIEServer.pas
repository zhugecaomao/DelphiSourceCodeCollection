Unit HIEServer;
////////////////////////////////////////////////
//VERSION:      3.4.1.0                       //
//COPYRIGHT:    High-Easy                     //
////////////////////////////////////////////////
Interface

Uses
  Windows;

Const
  MAX_SERVER_CHANNEL = 64;
  GETSTRING = 3;

Type
  //定义启动服务器端的参数结构
  PHIE_SERVER_VIDEOINFO = ^THIE_SERVER_VIDEOINFO;
  THIE_SERVER_VIDEOINFO = Record
    m_bytDataType: Array[0..MAX_SERVER_CHANNEL - 1] Of Byte; //通道数据类型(是否支持电话线连接方式)
    m_bytChannelNum: Byte;              //总的通道数
    m_dwWaitTime: DWORD;                //超时等待时间(1 - 300 , 单位:分钟)
    m_dwReserved: DWORD;                //保留字
  End;

  //通道数据类型
  //enum { NORMAL = 50 , DIALING };
  TConnectType = (NORMAL = 50, DIALING);

  TCheckIPCallBack = Function(nChannel: DWORD; sIP: PChar): Integer; stdcall;
  TCheckPassWordCallBack = Function(UserName: PChar; NameLen: WORD; PassWord: PChar; PassLen: WORD): Integer; stdcall;
  TStartCapCallBack = Procedure(nChannel: Integer); stdcall;
  TStopCapCallBack = Procedure(nChannel: Integer); stdcall;
  TVoiceDataCallBack = Procedure(pRecvDataBuffer: PChar; dwBufSize, dwUser: DWORD); stdcall;
  TStartVoiceCallBack = Procedure(); stdcall;
  TStopVoiceCallBack = Procedure(); stdcall;
  //定义接口函数

  //取得版本信息
Function ServerGetSDKVersion(): DWORD; stdcall;

//启动服务器端
Function ServerStart(VideoInfo: PHIE_SERVER_VIDEOINFO): BOOL; stdcall;

//停止服务器端
Function ServerStop(): BOOL; stdcall;

//获取服务器端状态
Function ServerGetState(ClientNum: PWORD): BOOL; stdcall;

//IP验证函数
Function ServerCheckIP(CallBack: TCheckIPCallBack): BOOL; stdcall;

//身份验证函数
Function ServerCheckPassword(CallBack: TCheckPassWordCallBack): BOOL; stdcall;

//发送数据函数
Procedure ServerWriteData(nChannel: DWORD; pPacketBuffer: PUCHAR; nPacketSize: DWORD; FrameType: Integer); stdcall;

//启动捕获回调
Procedure ServerSetStart(CallBack: TStartCapCallBack); stdcall;

//停止捕获回调
Procedure ServerSetStop(CallBack: TStopCapCallBack); stdcall;

//设置接收命令码的相关参数
Procedure ServerSetMessage(nMessage: UINT; HWND: HWND); stdcall;

//给连接在通道cChannel上的所有客户端发送命令码
Function ServerCommandToClient(cCommand: Char; cChannel: Char): BOOL; stdcall;

//给指定客户端发送消息字符串
Function ServerStringToClient(m_lAddrIP: PAnsiChar; m_sCommand: PChar; m_wLen: WORD): BOOL; stdcall;

//读取客户端消息
Procedure ServerReadLastMessage(m_sIP, m_sCommand: PChar; m_wLen: PWORD); stdcall;

//对nChannel通道的网络连接进行初始化
Procedure ServerResetChannel(nChannel: DWORD); stdcall;

//设置网络端口号
Function ServerSetNetPort(wServerPort, wClientPort: WORD): BOOL; stdcall;

//设置发送缓冲区的大小(单位是8K , 范围是 10 - 100 )
Function ServerSetBufNum(nChannel: DWORD; wBufNum: WORD): BOOL; stdcall;

//设置连接客户端的等待时间和尝试次数(dwEachWaitTime 等待时间单位毫秒 , dwTryNum 尝试次数范围1-50)
Function ServerSetWait(dwEachWaitTime, dwTryNum: DWORD): BOOL; stdcall;

//给连接在指定通道上的所有客户端发送消息字符串
Function ServerStringToClient_Other(cChannel: Char; cCommand: PChar; wLen: WORD): BOOL; stdcall;

//给指定IP地址的指定通道发送一帧数据
Procedure ServerSendOneFrame(m_sIP: PChar; cChannel: Char); stdcall;

//Version 3.0.4 add
//保存系统文件头,SDK 会发一个副本给每一个新的远程连接
Function ServerWriteSysHeader(nChannel: DWORD; HeaderBuf: PByte; HeaderLen: Integer): BOOL; stdcall;
//add for voice
//1
Function ServerSetVoiceCom(CallBack: TVoiceDataCallBack; dwUser: DWORD): BOOL; stdcall;

//2
Function ServerSetVoiceStart(CallBack: TStartVoiceCallBack): BOOL; stdcall;

//3
Function ServerSetVoiceStop(CallBack: TStopVoiceCallBack): BOOL; stdcall;

//4
Function ServerStartVoiceCom(): BOOL; stdcall;

//5
Function ServerStopVoiceCom(): BOOL; stdcall;
Implementation

Const
  HIEServerDLL = 'hIEServer.dll';

Function ServerGetSDKVersion; External HIEServerDLL Name 'MP4Net_ServerGetSDKVersion';
Function ServerStart; External HIEServerDLL Name 'MP4Net_ServerStart';
Function ServerStop; External HIEServerDLL Name 'MP4Net_ServerStop';
Function ServerGetState; External HIEServerDLL Name 'MP4Net_ServerGetState';
Function ServerCheckIP; External HIEServerDLL Name 'MP4Net_ServerCheckIP';
Function ServerCheckPassword; External HIEServerDLL Name 'MP4Net_ServerCheckPassword';
Procedure ServerWriteData; External HIEServerDLL Name 'MP4Net_ServerWriteData';
Procedure ServerSetStart; External HIEServerDLL Name 'MP4Net_ServerSetStart';
Procedure ServerSetStop; External HIEServerDLL Name 'MP4Net_ServerSetStop';
Procedure ServerSetMessage; External HIEServerDLL Name 'MP4Net_ServerSetMessage';
Function ServerCommandToClient; External HIEServerDLL Name 'MP4Net_ServerCommandToClient';
Function ServerStringToClient; External HIEServerDLL Name 'MP4Net_ServerStringToClient';
Procedure ServerReadLastMessage; External HIEServerDLL Name 'MP4Net_ServerReadLastMessage';
Procedure ServerResetChannel; External HIEServerDLL Name 'MP4Net_ServerResetChannel';
Function ServerSetNetPort; External HIEServerDLL Name 'MP4Net_ServerSetNetPort';
Function ServerSetBufNum; External HIEServerDLL Name 'MP4Net_ServerSetBufNum';
Function ServerSetWait; External HIEServerDLL Name 'MP4Net_ServerSetWait';
Function ServerStringToClient_Other; External HIEServerDLL Name 'MP4Net_ServerStringToClient_Other';
Procedure ServerSendOneFrame; External HIEServerDLL Name 'MP4Net_ServerSendOneFrame';
Function ServerWriteSysHeader; External HIEServerDLL Name 'MP4Net_ServerWriteSysHeader';
Function ServerSetVoiceCom; External HIEServerDLL Name 'MP4Net_ServerSetVoiceCom';
Function ServerSetVoiceStart; External HIEServerDLL Name 'MP4Net_ServerSetVoiceStart';
Function ServerSetVoiceStop; External HIEServerDLL Name 'MP4Net_ServerSetVoiceStop';
Function ServerStartVoiceCom; External HIEServerDLL Name 'MP4Net_ServerStartVoiceCom';
Function ServerStopVoiceCom; External HIEServerDLL Name 'MP4Net_ServerStopVoiceCom';

End.

