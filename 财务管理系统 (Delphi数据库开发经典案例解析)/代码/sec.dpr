library sec;



uses
  SysUtils,
  Classes,
  //此处是加入工程的unit，dllSec是该Unit的Name，而dllForm是该Unit保存的文件名
  dllForm in 'dllForm.pas' {dllSec};

{$R *.res}
exports
//这是将要输出供外部调用的函数
showdllform index 1;
begin
end.
