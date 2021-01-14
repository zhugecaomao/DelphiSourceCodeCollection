unit UnitMMSTask;

interface

uses
  UnitNewMMS, Classes, SysUtils, Windows, Unit2;

type
  TBlockInfo = Record
    StartPacket: Integer;
    EndPacket: Integer;
  end;
  PBlockInfo = ^TBlockInfo;

  TMMSTaskThread = class(TThread)
  private
    ThreadList: TList;
    BlockList: TList;

    FileInfo: TFileHeadInfo;
    Host: string;
    Port: Integer;
    SourceFile: string;
    DestFile: string;
    hDestFile: Cardinal;
    ThreadNum: Integer;

    function  GetDiskNO(sFileName: string): Byte;
    procedure AddBlock(iStart, iEnd: Integer);
    procedure DelBlock(NO: Integer=0);
  protected
    procedure Execute; override;
  public
    bTerminate: Boolean;
    Progress: Integer;
    procedure AddThread;
    procedure DelThread(iNO: Integer=0);
    constructor Create(sHost: string;          //服务器地址
                       iPort: Integer;         //端口
                       sSourceFile: string;    //文件URL
                       sDestFile: string;      //保存到本地的文件名
                       iThreadNum: Integer);    //分段下载线程数
    destructor  Destroy; override;
  end;

implementation

{ TMMSTaskThread }

procedure TMMSTaskThread.AddThread;
var
  MMSThread: PMMSThread;
begin
  New(MMSThread);
  MMSThread^ := TMMSThread.Create(Host, Port, SourceFile, hDestFile);
  ThreadList.Add(MMSThread);
end;

procedure TMMSTaskThread.DelThread(iNO: Integer);
var
  MMSThread: PMMSThread;
begin
  if (iNO>=0) and (iNO<ThreadList.Count) then
  begin
    MMSThread := PMMSThread(ThreadList.Items[iNO]);
    MMSThread.bTerminate := True;
    Dispose(MMSThread);
    ThreadList.Delete(iNO);
  end;
end;

constructor TMMSTaskThread.Create(sHost: string;
                                  iPort: Integer;
                                  sSourceFile, sDestFile: string;
                                  iThreadNum: Integer);
begin
  inherited Create(False);

  Host := sHost;
  Port := iPort;
  SourceFile := sSourceFile;
  DestFile   := sDestFile;
  hDestFile  := 0;
  if (iThreadNum>5) then ThreadNum := 5
  else ThreadNum  := iThreadNum;

  Progress := 0;
  bTerminate := False;
  FileInfo.FileSize := 0;

  ThreadList := TList.Create;
  BlockList  := TList.Create;
end;

destructor TMMSTaskThread.Destroy;
begin
  while ThreadList.Count>0 do DelThread;
  ThreadList.Free;

  while BlockList.Count>0 do DelBlock;
  BlockList.Free;

  if hDestFile>0 then CloseHandle(hDestFile);

  ShowDebugInfo('Destroy this task!');
  inherited;
end;

procedure TMMSTaskThread.Execute;
var
  i: Cardinal;
  cWritted: Cardinal;
  sBuffer: string;
  IniThread: TMMSThread;

  MMSThread: PMMSThread;
  iInterval: Cardinal;
  iStartPacket, iEndPacket: Integer;
  iCompletePacketNum: Cardinal;

  Block: PBlockInfo;
begin
  inherited;
  FreeOnTerminate := True;

  //读取所要下载文件的文件头信息
  IniThread  := TMMSThread.Create(Host, Port, SourceFile, 0, 5, True);
  while (IniThread.States = S_New) do Sleep(100);
  IniThread.bTerminate := True;
  FileInfo := IniThread.FileHeadInfo;

  //检测是否有足够的磁盘空间并创建文件
  if DiskFree(GetDiskNO(DestFile)) > FileInfo.FileSize then
  begin
    hDestFile := CreateFile(PAnsiChar(@DestFile[1]),
                            GENERIC_WRITE,
                            FILE_SHARE_WRITE,
                            NIL,
                            OPEN_ALWAYS,
                            FILE_ATTRIBUTE_NORMAL, 0 );

    SetLength(sBuffer, 512000);
    ZeroMemory(Pchar(@sBuffer[1]), 512000);
    i := (FileInfo.FileSize) div 512000;
    while (i>0) do
    begin
      WriteFile(hDestFile, sBuffer[1], 512000, cWritted, NIL);
      Dec(i);
    end;

    i := FileInfo.FileSize mod 512000;
    if (i>0) then
    begin
      SetLength(sBuffer, i);
      ZeroMemory(Pchar(@sBuffer[1]), i);
      WriteFile(hDestFile, sBuffer[1], i, cWritted, NIL);
    end;
    ShowDebugInfo('创建文件成功');
  end else begin
    ShowDebugInfo('磁盘空间不够');
  end;

  //如果创建文件成功， 创建多线程并开始下载
  if (hDestFile>0) then
  begin
    for i:=1 to ThreadNum do AddThread;
    ShowDebugInfo('[0] '+IntToStr(ThreadNum)+' threads created.');

   ////////////////////////////////////////////////////////////////
    iInterval := FileInfo.TotalPacketNum div ThreadNum + 1;
    ShowDebugInfo('[0] Interval = '+IntToStr(iInterval));
    for i:=1 to ThreadList.Count do
    begin
      MMSThread := PMMSThread(ThreadList.Items[i-1]);
      iStartPacket := (i-1)*iInterval;
      ShowDebugInfo('['+IntToStr(i)+'] Start packet = '+IntToStr(iStartPacket));
      iEndPacket   := i*iInterval - 1;
      if iEndPacket>(FileInfo.TotalPacketNum-1) then iEndPacket := FileInfo.TotalPacketNum-1;
      ShowDebugInfo('['+IntToStr(i)+'] End packet = '+IntToStr(iEndPacket));
      MMSThread.SetDownloadSection(iStartPacket,
                                   iEndPacket,
                                   FileInfo.MinPacketLen,
                                   FileInfo.FileHeadSize);

      ShowDebugInfo('[0] Thread '+IntToStr(i) +' is ready.');
    end;

    bTerminate := False;
    while not bTerminate do
    begin
      bTerminate := True;
      iCompletePacketNum := 0;
      for i:=1 to ThreadList.Count do
      begin
        MMSThread := PMMSThread(ThreadList.Items[i-1]);

        case MMSThread.States of
          S_Complete: begin
            if BlockList.Count>0 then
            begin
              Block := PBlockInfo(BlockList.First);
              MMSThread.SetDownloadSection(Block.StartPacket, Block.EndPacket,
                                           FileInfo.MinPacketLen, FileInfo.FileHeadSize);
              DelBlock;
            end;
          end;
          S_Error: begin
            AddBlock(MMSThread.gStartPacket, MMSThread.gEndPacket);
            MMSThread.bTerminate := True;
          end;
          else begin
            bTerminate := False;
          end;
        end;

        iCompletePacketNum := iCompletePacketNum + MMSThread.Progress;
      end;
      Progress := (iCompletePacketNum*100) div FileInfo.TotalPacketNum;
    end;

  end;
end;

function TMMSTaskThread.GetDiskNO(sFileName: string): Byte;
begin
  Result := Byte(LowerCase(sFileName)[1]) - Byte('a') + 1;
end;

procedure TMMSTaskThread.AddBlock(iStart, iEnd: Integer);
var
  Block: PBlockInfo;
begin
  if (iEnd>=iStart) and (iStart>=0) then
  begin
    New(Block);
    Block.StartPacket := iStart;
    Block.EndPacket   := iEnd;
    BlockList.Add(Block);
  end;  
end;

procedure TMMSTaskThread.DelBlock(NO: Integer);
var
  Block: PBlockInfo;
begin
  if (NO>=0) and (NO<=BlockList.Count) then
  begin
    Block := PBlockInfo(BlockList.Items[NO]);
    Dispose(Block);
    BlockList.Delete(NO);
  end;
end;

end.
