unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const
  WM_DATA = WM_USER + 1024;
type
  PShareMem = ^TShareMem;
  TShareMem = record
    Data: array[0..255] of char;
  end;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  PShare: PShareMem;
implementation

{$R *.DFM}
var
  HMapping: THandle;
  HMapMutex: THandle;
const
  MAPFILESIZE = 1000;
  REQUEST_TIMEOUT = 1000;

procedure OpenMap;  //打开建立共享内存
begin
   {创建一个文件映射内核对象}
  HMapping := CreateFileMapping(
    $FFFFFFFF,
    nil,
    PAGE_READWRITE,
    0,
    SizeOf(TShareMem),
  pchar('Map Name')  {映像文件的名字是'Map Name'}
    );
  if (hMapping = 0) then
  begin
    ShowMessage('不能创建内存映射文件');
    Application.Terminate;
    exit;
  end;
  {将映像文件映射到进程的地址空间}
  PShare := PShareMem(MapViewOfFile(HMapping, FILE_MAP_ALL_ACCESS, 0, 0, 0));
  if PShare = nil then
  begin
    CloseHandle(HMapping);
    ShowMessage('Can''t View Memory Map');
    Application.Terminate;
    exit;
  end;
end;

procedure CloseMap; //关闭共享内存
begin
  if PShare <> nil then
    {从进程的地址空间中撤销文件数据的映像}
    UnMapViewOfFile(PShare);
  if HMapping <> 0 then
    CloseHandle(HMapping);    //关闭映像文件
end;

function LockMap: Boolean;     //建立互斥对象
begin
  Result := true;
   {创建互斥对象}
  HMapMutex := CreateMutex(nil, false,
    pchar('MY MUTEX NAME GOES HERE'));
  if HMapMutex = 0 then
  begin
    ShowMessage('不能创建互斥对象');
    Result := false;
  end else begin
    if WaitForSingleObject(HMapMutex, REQUEST_TIMEOUT)
      = WAIT_FAILED then
    begin
      ShowMessage('不能对互斥对象加锁!');
      Result := false;
    end
  end
end;

procedure UnlockMap;  //释放互斥对象
begin
  ReleaseMutex(HMapMutex);
  CloseHandle(HMapMutex);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  str: pchar;
begin
  str := pchar('简单的共享内存的例子');
  CopyMemory(@(pShare^.data), Str, Length(str));
  {发送消息表明有数据}
  PostMessage(FindWindow(nil, '映像内存接收端'), WM_DATA, 1, 1)
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  UnlockMap;
  CloseMap;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OpenMap;
  LockMap;
end;

end.

