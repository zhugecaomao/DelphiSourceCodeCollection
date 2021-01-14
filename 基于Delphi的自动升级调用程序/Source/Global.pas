unit Global;

interface

uses
  Windows, Messages;

type

  // 命令行参数
  TCmdParams = record
    ScriptURL: string;          // 升级脚本文件的URL
    CurVersion: string;         // 宿主程序的当前版本号
    SoftName: string;           // 宿主程序的软件名称
    WinHandle: THandle;         // 宿主程序用来接收消息的窗口句柄
    ExitMsgID: Cardinal;        // 宿主程序收到此消息后应退出程序
    ProcessID: Cardinal;        // 宿主程序的进程ID (GetCurrentProcessID)
  end;

  // 自升级相关文件
  TSelfUpgFiles = record
    SrcFileName: string;
    DestFileName: string;
  end;

  // 下载状态
  TDownloadState = (dsWait, dsDownloading, dsFinished);

const
  // 自动升级程序的软件名
  SSoftName = '自动升级程序';

  // 下载状态字符串
  SDnStateStrings: array[TDownloadState] of string =
    ('等待', '正在下载', '完成');

var
  CmdParams: TCmdParams;        // 命令行参数
  SelfUpgFiles: TSelfUpgFiles;  // 自升级相关文件

implementation

end.
