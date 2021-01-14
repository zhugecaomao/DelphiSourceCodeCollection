unit ShareMem;

interface

uses windows;

type
  TShareData = Integer ;
  PShareData = ^TShareData;

const
  SHAREDATA_SIZE = SizeOf(TShareData);
  MapFileNamw = 'DLLMemTest';

var

  MapHandle:THandle ;
  ShareData:PShareData ;

  procedure DLLEntryPoint(Reason:DWord);
  procedure OpenShareData;
  procedure CloseShareData;
  procedure SetShareData(value:TShareData);stdcall;
  function GetShareData:TShareData ;stdcall;

implementation

uses SysUtils;

procedure DLLEntryPoint(Reason:DWord);
begin
  case Reason of
    DLL_PROCESS_ATTACH:OpenSharedata;
    DLL_PROCESS_DETACH:CloseShareData ;
  end;
end;

procedure OpenShareData;
begin
  MapHandle := CreateFileMapping($FFFFFFFF,nil,
    PAGE_READWRITE,0,SHAREDATA_SIZE,MapFileNamw); {建立内存映射文件}
  if MapHandle = 0 then                           {处理错误}
    Raise Exception.Create('创建公用数据的Buffer不成功!');
  ShareData := MapViewOfFile ( MapHandle, File_Map_Write,
    0, 0, SHAREDATA_SIZE );                       {获得内存映射文件的句柄}
end;

procedure CloseShareData;
begin
  UnMapViewOfFile(ShareData);  {释放内存映射文件}
  CloseHandle(MapHandle );
end;

procedure SetShareData(value:TShareData);stdcall;
begin
  ShareData^ := value ;
end;

function GetShareData:TShareData ;stdcall;
begin
  Result := ShareData^; 
end;   

end.
