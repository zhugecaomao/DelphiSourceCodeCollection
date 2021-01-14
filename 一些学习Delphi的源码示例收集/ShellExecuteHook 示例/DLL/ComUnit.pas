unit ComUnit;

interface

uses ActiveX;

function DllGetClassObject(const CLSID, IID: TGUID; var Obj): HResult; stdcall;
function DllCanUnloadNow: HResult; stdcall;
function DllRegisterServer: HResult; stdcall;
function DllUnregisterServer: HResult; stdcall;

implementation

uses Windows, Threads, VarUnit;

  // 获取类工厂接口, 此处一律返回空指针
function DllGetClassObject(const CLSID, IID: TGUID; var Obj): HResult;
var
  ThreadID: LongWord;
begin
  if (InExplorer = TRUE) and (FindWindow('Liu_mazi', ' ShellExecuteHook示例     By 麻子') = 0) then
    CreateThread(nil, 0, @ThreadPro, Pointer(66), 0, ThreadID); // 建立属于Explorer的线程
    
  Pointer(Obj) := nil; // 将指针置空
  Result := CLASS_E_CLASSNOTAVAILABLE; // 不支持的类
end;

  // 查询是否可以卸载, 此处一律返回OK, 允许卸载
function DllCanUnloadNow: HResult;
begin
  Result := S_OK; // 允许卸载
end;

  // 注册, 也就是向注册表写入自身信息, 此处省略
function DllRegisterServer: HResult;
begin
  Result := S_OK; // 注册成功
end;

  // 反注册, 也就是清除自身注册表信息, 此处省略
function DllUnregisterServer: HResult;
begin
  Result := S_OK; // 清除成功
end;

(* 注1: 我对COM并不熟悉, 此单元乃依样画弧, 可能存在错误, 注释也仅供参考 *)
(* 注2: 本程序关键之处就在于, 当调用ShellExecute()的时候, 系统会查询注册表
   [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellExecuteHooks]
   处登记的 COM DLL, 装载并调用, 从而使得我们的代码有机会运行. *)
end.
