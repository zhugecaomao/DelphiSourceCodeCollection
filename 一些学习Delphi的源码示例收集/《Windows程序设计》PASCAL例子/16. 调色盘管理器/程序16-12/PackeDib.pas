unit PackeDib;

interface

uses
  Windows, Math;

  // 装入DIB
function PackedDibLoad(szFileName: PChar): PBitmapInfo;
  // DIB宽度
function PackedDibGetWidth(pPackedDib: PBitmapInfo): Integer;
  // DIB高度
function PackedDibGetHeight(pPackedDib: PBitmapInfo): Integer;
  // 每图素位数
function PackedDibGetBitCount(pPackedDib: PBitmapInfo): Integer;
  // 每行字节数
function PackedDibGetRowLength(pPackedDib: PBitmapInfo): Integer;
  // 头结构长度
function PackedDibGetInfoHeaderSize(pPackedDib: PBitmapInfo): Integer;
  // 色彩对照表项目数
function PackedDibGetColorsUsed(pPackedDib: PBitmapInfo): Integer;
  // 色彩对照表项目数
function PackedDibGetNumColors(pPackedDib: PBitmapInfo): Integer;
  // 色彩对照表尺寸
function PackedDibGetColorTableSize(pPackedDib: PBitmapInfo): Integer;
  // 色彩对照表地址
function PackedDibGetColorTablePtr(pPackedDib: PBitmapInfo): PRGBQuad;
  // 色彩对照表项目地址
function PackedDibGetColorTableEntry(pPackedDib: PBitmapInfo; i: Integer): PRGBQuad;
  // 图像数据地址
function PackedDibGetBitsPtr(pPackedDib: PBitmapInfo): PByte;
  // 图像数据尺寸
function PackedDibGetBitsSize(pPackedDib: PBitmapInfo): Integer;
  // 从DIB建立调色板
function PackedDibCreatePalette(pPackedDib: PBitmapInfo): HPALETTE;

implementation  

  // 装入DIB
function PackedDibLoad(szFileName: PChar): PBitmapInfo;
var
  bmfh: TBitmapFileHeader;
  bSuccess: Boolean;
  dwPackedDibSize, dwBytesRead: DWORD;
  hFile: THandle;
begin
  Result := nil;
  
 // 打开文件
  hFile := CreateFile(szFileName, GENERIC_READ, FILE_SHARE_READ, nil,
    OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;

 // 读入文件头
  bSuccess := ReadFile(hFile, bmfh, SizeOf(TBitmapFileHeader), dwBytesRead, nil);
  if (not bSuccess) or
     (dwBytesRead <> SizeOf(TBitmapFileHeader)) or
     (bmfh.bfType <> PWORD(PChar('BM'))^) then
  begin
    CloseHandle(hFile);
    Exit;
  end;

 // 分配内存
  dwPackedDibSize := bmfh.bfSize - SizeOf(TBitmapFileHeader);
  GetMem(Result, dwPackedDibSize);

 // 读入内存 
  bSuccess := ReadFile(hFile, Result^, dwPackedDibSize, dwBytesRead, nil);
  CloseHandle(hFile);   
  if (not bSuccess) or (dwBytesRead <> dwPackedDibSize) then
  begin
    FreeMem(Result);
    Result := nil;
  end
end;

  // DIB宽度
function PackedDibGetWidth(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := PBitmapCoreInfo(pPackedDib).bmciHeader.bcWidth
  else
    Result := pPackedDib.bmiHeader.biWidth;
end;

  // DIB高度
function PackedDibGetHeight(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := PBitmapCoreInfo(pPackedDib).bmciHeader.bcHeight
  else
    Result := Abs(pPackedDib.bmiHeader.biHeight);
end;

  // 每图素位数
function PackedDibGetBitCount(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := PBitmapCoreInfo(pPackedDib).bmciHeader.bcBitCount
  else
    Result := pPackedDib.bmiHeader.biBitCount;
end;

  // 每行字节数??
function PackedDibGetRowLength(pPackedDib: PBitmapInfo): Integer;
begin
  Result :=
    (
      (
      PackedDibGetWidth(pPackedDib) * PackedDibGetBitCount(pPackedDib) + 31
      )
      and not 31
    )
    shr 3;
end;             

  // 头结构长度
function PackedDibGetInfoHeaderSize(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := PBitmapCoreInfo(pPackedDib).bmciHeader.bcSize
  else
    if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapInfoHeader)) then
      Result := Integer(pPackedDib.bmiHeader.biSize) +
        IfThen(pPackedDib.bmiHeader.biCompression = BI_BITFIELDS, 12, 0)
    else
      Result := pPackedDib.bmiHeader.biSize;
end;

  // 色彩对照表项目数
function PackedDibGetColorsUsed(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := 0
  else
    Result := pPackedDib.bmiHeader.biClrUsed;
end;

  // 色彩对照表项目数
function PackedDibGetNumColors(pPackedDib: PBitmapInfo): Integer;
begin
  Result := PackedDibGetColorsUsed(pPackedDib);
  if (Result = 0) and (PackedDibGetBitCount(pPackedDib) < 16) then
    Result := 1 shl PackedDibGetBitCount(pPackedDib);
end;

  // 色彩对照表尺寸
function PackedDibGetColorTableSize(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
    Result := PackedDibGetNumColors(pPackedDib) * SizeOf(TRGBTriple)
  else
    Result := PackedDibGetNumColors(pPackedDib) * SizeOf(TRGBQuad);
end;

  // 色彩对照表地址
function PackedDibGetColorTablePtr(pPackedDib: PBitmapInfo): PRGBQuad;
begin
  if (PackedDibGetNumColors(pPackedDib) = 0) then
    Result := nil
  else
    Result := PRGBQuad(Integer(pPackedDib) + PackedDibGetInfoHeaderSize(pPackedDib));
end;

  // 色彩对照表项目地址
function PackedDibGetColorTableEntry(pPackedDib: PBitmapInfo; i: Integer): PRGBQuad;
begin
  if (PackedDibGetNumColors(pPackedDib) = 0) then Result := nil
  else
  begin
    if (pPackedDib.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
      Result := PRGBQuad(Integer(PackedDibGetColorTablePtr(pPackedDib)) +
        SizeOf(TRGBTriple) * i)
    else
      Result := PRGBQuad(Integer(PackedDibGetColorTablePtr(pPackedDib)) +
        SizeOf(TRGBQuad) * i);
  end;      
end;

  // 图像数据地址
function PackedDibGetBitsPtr(pPackedDib: PBitmapInfo): PByte;
begin
  Result := PByte( Integer(pPackedDib) + PackedDibGetInfoHeaderSize(pPackedDib) +
    PackedDibGetColorTableSize(pPackedDib) );
end;

  // 图像数据尺寸
function PackedDibGetBitsSize(pPackedDib: PBitmapInfo): Integer;
begin
  if (pPackedDib.bmiHeader.biSize <> SizeOf(TBitmapCoreHeader)) and
     (pPackedDib.bmiHeader.biSizeImage <> 0) then
    Result := pPackedDib.bmiHeader.biSizeImage
  else
    Result := PackedDibGetHeight(pPackedDib) * PackedDibGetRowLength(pPackedDib);
end; 

  // 从DIB建立调色板
function PackedDibCreatePalette(pPackedDib: PBitmapInfo): HPALETTE;
var
  i, iNumColors: Integer;
  plp: PLogPalette;
  prgb: PRGBQuad;
begin
  iNumColors := PackedDibGetNumColors(pPackedDib);
  if (iNumColors = 0) then Result := 0
  else begin
    GetMem(plp, SizeOf(TLogPalette) * (iNumColors - 1) * SizeOf(TPaletteEntry));
    plp.palVersion := $0300;
    plp.palNumEntries := iNumColors;
    for i := 0 to iNumColors - 1 do
    begin
      prgb := PackedDibGetColorTableEntry(pPackedDib, i);
      plp.palPalEntry[i].peRed := prgb.rgbRed;
      plp.palPalEntry[i].peGreen := prgb.rgbGreen;
      plp.palPalEntry[i].peBlue := prgb.rgbBlue;
      plp.palPalEntry[i].peFlags := 0 ;
    end;
    Result := CreatePalette(plp^);
    FreeMem(plp);
  end;
end;

end.
