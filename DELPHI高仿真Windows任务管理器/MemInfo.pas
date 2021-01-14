unit MemInfo;

interface
uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls;
procedure GetMemInfo(var memInfo:TMemoryStatus);
implementation
procedure GetMemInfo(var memInfo:TMemoryStatus);
begin
  GlobalMemoryStatus(memInfo);
end;
end.
