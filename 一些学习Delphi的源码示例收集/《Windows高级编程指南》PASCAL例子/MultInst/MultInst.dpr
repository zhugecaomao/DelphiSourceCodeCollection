
// Module name: MultInst.C ->> MultInst.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program MultInst;

{$R 'MultInst.res' 'MultInst.rc'}

uses
  Windows, Messages, CmnHdr in '..\CmnHdr.pas', Other in '..\Other.pas';

const
  IDI_MULTINST = 101;

  // 程序入口
var
  fFirstInstance: BOOL;
  g_lUsageCount: PINT;
begin
  chWARNIFUNICODEUNDERWIN95();

  // 定位手工加的节
  g_lUsageCount := SectionVirualAddress(HInstance, '.Share', 4,
    IMAGE_SCN_MEM_SHARED or IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_WRITE);
  if (g_lUsageCount = nil) then
  begin
    chMB('SectionVirualAddress() failure ', 'Multiple Instance');
    Exit;
  end;

  // 互斥地增加计数  
  fFirstInstance := InterlockedIncrement(g_lUsageCount^) = 1;

  // 是否第一个实例
  if (fFirstInstance = FALSE) then
  begin
    chMB('Application is already running - Terminating this instance ',
      'Multiple Instance', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    chMB( 'Running first instance of application.'#13#10'Select OK to terminate ',
      'Multiple Instance', MB_OK or MB_ICONINFORMATION);
  end;

  // 互斥地减少计数
  InterlockedDecrement(g_lUsageCount^);
end.
