unit Public_Unit;

interface

const
{----进度条消息----}  
  PBM_SETRANGE    = $0401;  // 设置范围
  PBM_SETPOS      = $0402;  // 设置数值
  PBM_SETSTEP     = $0404;  // 设置步长
  PBM_STEPIT      = $0405;  // 增加一步
  PBM_GETPOS      = $0408;  // 取得数值
  PBM_SETBARCOLOR = $0409;  // 设置颜色
  PBM_SETBKCOLOR  = $2001;  // 背景颜色
  WindowClassName = 'Progress_Mazi'; //窗体类名

var
  WindowHandle: LongWord;   // 主窗体句柄
  StatusHandle: LongWord;   // 进度条句柄
  ContinueAdd: Boolean=True;   // 暂停否标志

  //引入此函数,使comctl32.dll随同程序装载,DLL初始化代码将注册其中控件窗体类
procedure InitCommonControls; stdcall; external 'ComCtl32.dll' name 'InitCommonControls';

function ShellExecute(hWnd: integer; Operation, FileName, Parameters,Directory: PAnsiChar;
           ShowCmd: Integer):longword; stdcall;external 'shell32.dll' name 'ShellExecuteA';

implementation

end.
