unit RegShell;

interface
procedure Rshell(Ext,path:string);
implementation
uses
  Windows,SysUtils,registry,shlobj;
procedure Rshell;
const
  Name = 'BinjianSE';
var
  reg: TRegistry;
begin
 reg := TRegistry.Create;
 reg.RootKey:=HKEY_CLASSES_ROOT;
 reg.OpenKey(Ext,true);
 reg.WriteString('',Name);
 reg.CloseKey;
 reg.OpenKey(Name+'\shell\open\command', true);
 //用于打开.zzz文件的可执行程序
 reg.WriteString('', '"' + path + '" "%1"');
 reg.CloseKey;
 reg.OpenKey(Name+'\DefaultIcon',true);
 //取当前可执行程序的图标为.zzz文件的图标
 reg.WriteString('',''+ path +',0');
 reg.Free;
 //立即刷新
 SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

end.
 