unit OtherMng_PBCCommon;

interface

uses
  Classes;
  
const
  //插件入口指令
  PLGBPACOMM_CMD_SRVSTR = $1001; //启动服务器端
  PLGBPACOMM_CMD_SRVSTP = $1002; //停止服务器端
  PLGBPACOMM_CMD_SRVCFG = $1003; //配置服务器端

  PLGBPACOMM_CMD_CLNSTR = $2001; //启动客户端
  PLGBPACOMM_CMD_CLNSTP = $2002; //停止客户端
  PLGBPACOMM_CMD_CLNSF = $2003; //客户端发送文件
  PLGBPACOMM_CMD_CLNRF = $2004; //客户端接收文件
  PLGBPACOMM_CMD_CLNCFG = $2005; //配置客户端

  //调用返回码
  PLGBPACOMM_RTC_SRVSTROK = $010100; //服务器端启动成功
  PLGBPACOMM_RTC_SRVSTRERR = $0101FF; //服务器端启动失败

  PLGBPACOMM_RTC_CLNCNOK = $020100; //客户端连接成功
  PLGBPACOMM_RTC_CLNCNERR = $0201FF; //客户端连接失败
  PLGBPACOMM_RTC_CLNSFOK = $020200; //客户端发送文件成功
  PLGBPACOMM_RTC_CLNSFERR = $0202FF; //客户端发送文件失败

  //通讯反馈消息
  BPACOMM_MSG_CLNWB = $020101; //客户端TCPClient对象OnWorkBegin事件
  BPACOMM_MSG_CLNWK = $020102; //客户端TCPClient对象OnWork事件
  BPACOMM_MSG_CLNWE = $020103; //客户端TCPClient对象OnWorkEnd事件

  BPACOMM_MSG_CLNCL = $020201; //客户端Socket连接丢失

type
  //通讯反馈消息句柄原型
  TBpaCommMsgHandler = procedure(Ac_MsgReciever: TComponent;
    const Ai_Msg: Integer; Ac_Args: TStrings);

implementation

end.
