unit DibHelp;

interface

uses
  Windows, Math;

type
  PPByte = ^PByte;
  HDIB = Pointer;
  
  DIBSTRUCT = packed record
    ppRow: PPByte; // must be first field for macros!
    iSignature: Integer;
    hBitmap: DWORD; // HBITMAP
    pBits: PByte;
    ds: TDIBSection;
    iRShift: array[0..2] of Integer;
    iLShift: array[0..2] of Integer;
  end;
  PDIBSTRUCT = ^DIBSTRUCT;

const
  HDIB_SIGNATURE: Integer = $44696220; // 'Dib '

implementation

{/*---------------------------------------------------------------------------
  Quickie no-bounds-checked pixel gets and sets        
-----------------------------------------------------------------------------*/
function DibPixelPtr1(hdib, x, y: Integer): PByte;
begin
  (    ( (* (PBYTE **) hdib )[y]     ) + x shr 3
end;
                              ^PByte(hdib)
DibPixelPtr1(hdib, x, y)  hdib)[y]  +  x shr 3

DibPixelPtr1(hdib, x, y)      (   ((* (PBYTE **) hdib) [y]) + ((x) >> 3)  )


#define     DibPixelPtr4(hdib, x, y)      (((* (PBYTE **) hdib) [y]) + ((x) >> 1))
#define     DibPixelPtr8(hdib, x, y)      (((* (PBYTE **) hdib) [y]) +  (x)            )
#define     DibPixelPtr16(hdib, x, y)  \
                                                 ((WORD *) (((* (PBYTE **) hdib) [y]) + (x) *  2))
#define DibPixelPtr24(hdib, x, y)  \
                                                         ((RGBTRIPLE *) (((* (PBYTE **) hdib) [y]) +  (x) *  3))
#define DibPixelPtr32(hdib, x, y)  \
                                                                ((DWORD *) (((* (PBYTE **) hdib) [y]) +  (x) *  4))
#define DibGetPixel1(hdib, x, y)   \
                                         (0x01 & (* DibPixelPtr1 (hdib, x, y) >> (7 - ((x) & 7))))
#define DibGetPixel4(hdib, x, y)   \
                                         (0x0F & (* DibPixelPtr4 (hdib, x, y) >> ((x) & 1 ? 0 : 4)))
#define     DibGetPixel8(hdib, x, y)                     (* DibPixelPtr8                   (hdib, x, y))
#define     DibGetPixel16(hdib, x, y)     (* DibPixelPtr16      (hdib, x, y))
#define     DibGetPixel24(hdib, x, y)    (* DibPixelPtr24      (hdib, x, y))
#define     DibGetPixel32(hdib, x, y)    (* DibPixelPtr32      (hdib, x, y))
#define DibSetPixel1(hdib, x, y, p)                                                                                          \
                  ((* DibPixelPtr1 (hdib, x, y) &= ~( 1<< (7 - ((x) & 7)))),             \
                  (* DibPixelPtr1 (hdib, x, y) |=      ((p) << (7 - ((x) & 7)))))
#define DibSetPixel4(hdib, x, y, p)                                                                                          \
                  ((* DibPixelPtr4 (hdib, x, y) &= (0x0F <<    ((x) & 1 ? 4 : 0))),  \
                  (* DibPixelPtr4 (hdib, x, y) |= ((p) <<     ((x) & 1 ? 0 : 4))))
#define DibSetPixel8(hdib, x, y, p)  (* DibPixelPtr8 (hdib, x, y) = p)
#define DibSetPixel16(hdib, x, y, p) (* DibPixelPtr16 (hdib, x, y) = p)
#define DibSetPixel24(hdib, x, y, p) (* DibPixelPtr24 (hdib, x, y) = p)
#define DibSetPixel32(hdib, x, y, p) (* DibPixelPtr32 (hdib, x, y) = p)    }

  // 指针有效性检测
function DibIsValid(hdib: HDIB): Boolean;
var
  pdib: PDIBSTRUCT;
begin
  Result  := FALSE;
  pdib := PDIBSTRUCT(hdib);
  if (pdib = nil) then Exit;
  if IsBadReadPtr(pdib, SizeOf(DIBSTRUCT)) then Exit;
  if (pdib.iSignature <> HDIB_SIGNATURE) then Exit;
  Result  := TRUE;
end;

  // 位图句柄
function DibBitmapHandle(hdib: HDIB): HBITMAP;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).hBitmap;
end;

  // 象素级宽度
function DibWidth(hdib: HDIB): Integer;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).ds.dsBm.bmWidth;
end;

  // 象素级高度
function DibHeight(hdib: HDIB): Integer;
begin
  if (not DibIsValid (hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).ds.dsBm.bmHeight;
end;

  // 每象素位数
function DibBitCount(hdib: HDIB): Integer;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).ds.dsBm.bmBitsPixel;
end;

  // 每行字节数
function DibRowLength(hdib: HDIB): Integer;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result :=  4 * ((DibWidth(hdib) * DibBitCount(hdib) + 31) div 32);
end;

  // 每象素颜色数
function DibNumColors(hdib: HDIB): Integer;
var
  pdib: PDIBSTRUCT;
begin
  Result := 0;
  pdib := hdib;
  if (not DibIsValid(hdib)) then Exit; // return 0
  if (pdib.ds.dsBmih.biClrUsed <> 0) then
    Result := pdib.ds.dsBmih.biClrUsed
  else
    if (DibBitCount(hdib) <= 8) then
      Result := 1 shl DibBitCount(hdib);
end;

  // Returns one of the color masks
function DibMask(hdib: HDIB; i: Integer): DWORD;
var
  pdib: PDIBSTRUCT;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) or (i < 0) or (i > 2) then
    Result := 0
  else
    Result := pdib.ds.dsBitfields[i];
end;

  // DibRShift:  Returns one of the right-shift values
function DibRShift(hdib: HDIB; i: Integer): Integer;
var
  pdib: PDIBSTRUCT;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) or (i < 0) or (i > 2) then
    Result := 0
  else
    Result := pdib.iRShift[i];
end;

 // DibLShift:  Returns one of the left-shift values
function DibLShift(hdib: HDIB; i: Integer): Integer;
var
  pdib: PDIBSTRUCT;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) or (i < 0) or (i > 2) then
    Result := 0
  else
    Result := pdib.iLShift[i];
end;

  // DibCompression:  Returns the value of the biCompression field
function DibCompression(hdib: HDIB): Integer;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).ds.dsBmih.biCompression;
end;

  // DibIsAddressable:  Returns TRUE if the DIB is not compressed
function DibIsAddressable(hdib: HDIB): Boolean;
var
  iCompression: Integer;
begin
  Result := FALSE;
  if (not DibIsValid(hdib)) then Exit;
  iCompression := DibCompression(hdib);
  if (iCompression = BI_RGB) or (iCompression = BI_BITFIELDS) then
    Result := TRUE;
end;

{/*---------------------------------------------------------------------------
  These functions return the sizes of various components of the DIB section
           AS THEY WOULD APPEAR in a packed DIB. These functions aid in converting
    the DIB section to a packed DIB and in saving DIB files.
-----------------------------------------------------------------------------*/}
function DibInfoHeaderSize(hdib: HDIB): DWORD;
begin
  if (not DibIsValid(hdib)) then
    Result := 0
  else
    Result := PDIBSTRUCT(hdib).ds.dsBmih.biSize ;
end;

function DibMaskSize(hdib: HDIB): DWORD;
var
  pdib: PDIBSTRUCT;
begin
  Result := 0;
  pdib := hdib;
  if (not DibIsValid(hdib)) then Exit;
  if (pdib.ds.dsBmih.biCompression = BI_BITFIELDS) then
    Result := 3 * SizeOf(DWORD)
end;

function DibColorSize(hdib: HDIB): DWORD;
begin
  Result := DibNumColors(hdib) * SizeOf(RGBQUAD);
end;

function DibInfoSize(hdib: HDIB): DWORD;
begin
  Result := DibInfoHeaderSize(hdib) + DibMaskSize(hdib) + DibColorSize(hdib);
end;

function DibBitsSize(hdib: HDIB): DWORD;
var
  pdib: PDIBSTRUCT;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) then
  begin
    Result := 0;
    Exit;
  end;
  if (pdib.ds.dsBmih.biSizeImage <> 0) then
    Result := pdib.ds.dsBmih.biSizeImage
  else
    Result := DibHeight(hdib) * DibRowLength(hdib);
end;

function DibTotalSize(hdib: HDIB): DWORD;
begin
  Result := DibInfoSize(hdib) + DibBitsSize(hdib);
end;

{  These functions return pointers to the various components of the DIB
           section.}
function DibInfoHeaderPtr(hdib: HDIB): PBitmapInfoHeader;
begin
  if (not DibIsValid(hdib)) then
    Result := nil
  else
    Result := @PDIBSTRUCT(hdib).ds.dsBmih;
end;

function DibMaskPtr(hdib: HDIB): PDWORD;
var
  pdib: PDIBSTRUCT;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) then
    Result := nil
  else
    Result := @pdib.ds.dsBitfields[0];
end;

function DibBitsPtr(hdib: HDIB): Pointer;
begin
  if (not DibIsValid(hdib)) then
    Result := nil
  else
    Result := PDIBSTRUCT(hdib).pBits;
end;

 // DibSetColor:  Obtains entry from the DIB color table
function DibGetColor(hdib: HDIB; index: Integer; prgb: PRGBQuad): Boolean;
var
  pdib: PDIBSTRUCT;
  hdcMem: HDC;
  iReturn: Integer;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) then
    Result := FALSE
  else begin
    hdcMem := CreateCompatibleDC(0);
    SelectObject(hdcMem, pdib.hBitmap);
    iReturn := GetDIBColorTable(hdcMem, index, 1, prgb);
    DeleteDC(hdcMem);
    if (iReturn <> 0) then Result := TRUE else Result := FALSE;
  end;
end;

  // DibGetColor:  Sets an entry in the DIB color table
function DibSetColor(hdib: HDIB; index: Integer; prgb: PRGBQuad): Boolean;
var
  pdib: PDIBSTRUCT;
  hdcMem: HDC;
  iReturn: Integer;
begin
  pdib := hdib;
  if (not DibIsValid(hdib)) then
    Result := FALSE
  else begin
    hdcMem := CreateCompatibleDC(0);
    SelectObject(hdcMem, pdib.hBitmap);
    iReturn := SetDIBColorTable(hdcMem, index, 1, prgb);
    DeleteDC(hdcMem);
    if (iReturn <> 0) then Result := TRUE else Result := FALSE;
  end;
end;

// ***************************

 // DibPixelPtr:  Returns a pointer to the pixel at position (x, y)
function  DibPixelPtr(hdib: HDIB; x, y: Integer): PByte;
begin
  Result := nil;
  if (not DibIsAddressable(hdib)) then Exit;
  if (x < 0) or (x >= DibWidth(hdib)) or (y < 0) or (y >= DibHeight(hdib)) then Exit;
  Result :=

  ^PByte(Integer(PDIBSTRUCT(hdib).ppRow) + y * SizeOf(PByte))^ +

  (x * DibBitCount (hdib) >> 3) ;

return (((PDIBSTRUCT) hdib)->ppRow)[y] + (x * DibBitCount (hdib) >> 3) ;
  
end;


/*---------------------------------------------------------------------------
        
  DibGetPixel:  Obtains a pixel value at (x, y)
        
-----------------------------------------------------------------------------*/
        

DWORD DibGetPixel (HDIB hdib, int x, int y)
        
{
        
           PBYTE pPixel ;
        
           if (!(pPixel = DibPixelPtr (hdib, x, y)))
        
                          return 0 ;
        
           switch (DibBitCount (hdib))
        
           {
        
           case          1:  return 0x01 & (* pPixel >> (7 - (x & 7))) ;
        
           case          4:  return 0x0F & (* pPixel >> (x & 1 ? 0 : 4)) ;
        
           case          8:  return * pPixel ;
        
           case          16: return * (WORD *) pPixel ;
        
           case          24: return 0x00FFFFFF & * (DWORD *) pPixel ;
        
           case          32: return * (DWORD *) pPixel ;
        
           }
        
  return 0 ;
        
}
        

/*-------------------------------------------------------------------------
        
  DibSetPixel:  Sets a pixel value at (x, y)
        
---------------------------------------------------------------------------*/
        

BOOL DibSetPixel (HDIB hdib, int x, int y, DWORD dwPixel)
        
{
        
           PBYTE pPixel ;
        
           if (!(pPixel = DibPixelPtr (hdib, x, y)))
        
                         return FALSE ;
        
           switch (DibBitCount (hdib))
        
    {
        
           case  1:      *      pPixel &= ~(1     << (7 - (x & 7))) ;
        
                          *      pPixel |= dwPixel     << (7 - (x & 7)) ;
        
                                                 break ;
        
           case  4:  * pPixel &= 0x0F    << (x & 1 ? 4 : 0) ;
        
                         *      pPixel |= dwPixel     << (x & 1 ? 0 : 4) ;
        
                                                 break ;
        
           case 8:       *      pPixel = (BYTE) dwPixel ;
        
                                                 break ;
        

           case 16:      *      (WORD *) pPixel = (WORD) dwPixel ;
        
                                                 break ;
        

           case 24:      *      (RGBTRIPLE *) pPixel = * (RGBTRIPLE *) &dwPixel ;
        
                                                 break ;
        

           case 32:      *      (DWORD *) pPixel = dwPixel ;
        
                                                 break ;
        
           default:
        
                          return FALSE ;
        
           }
        
           return TRUE ;
        
}
        

/*---------------------------------------------------------------------------
        
  DibGetPixelColor:  Obtains the pixel color at (x, y)
        
----------------------------------------------------------------------------*/
        

BOOL DibGetPixelColor (HDIB hdib, int x, int y, RGBQUAD * prgb)
        
{
        
          DWORD                        dwPixel ;
        
           int                           iBitCount ;
        
           PDIBSTRUCT    pdib = hdib ;
        

                          // Get bit count; also use this as a validity check
        

           if (0 == (iBitCount = DibBitCount (hdib)))
        
                          return FALSE ;
        
                          // Get the pixel value
        
         dwPixel = DibGetPixel (hdib, x, y) ;
        
                          // If the bit-count is 8 or less, index the color table
        
           if (iBitCount <= 8)
        
                          return DibGetColor (hdib, (int) dwPixel, prgb) ;
        
                          // If the bit-count is 24, just use the pixel
        
          else   if (iBitCount == 24)
        
    {
        
                  *      (RGBTRIPLE *) prgb = * (RGBTRIPLE *) & dwPixel ;
        
                          prgb->rgbReserved = 0 ;
        
   }
        

                  // If the bit-count is 32 and the biCompression field is BI_RGB,
        
                  //  just use the pixel
        

           else   if (iBitCount == 32 &&
        
                                                 pdib->ds.dsBmih.biCompression == BI_RGB)
        
           {
        
                  *      prgb = * (RGBQUAD *) & dwPixel ;
        
           }
        

                  // Otherwise, use the mask and shift values
        
                  //   (for best performance, don't use DibMask and DibShift functions)
        
           else
        
           {
        
           prgb->rgbRed = (BYTE)(((pdib->ds.dsBitfields[0] & dwPixel)
        
                    >> pdib->iRShift[0]) << pdib->iLShift[0]) ;
        

           prgb->rgbGreen=(BYTE((pdib->ds.dsBitfields[1] & dwPixel)
        
                   >> pdib->iRShift[1]) << pdib->iLShift[1]) ;
        

           prgb->rgbBlue=(BYTE)(((pdib->ds.dsBitfields[2] & dwPixel)
        
                    >> pdib->iRShift[2]) << pdib->iLShift[2]) ;
        
           }
        
   return TRUE ;
        
}
        

/*-----------------------------------------------------------------------------
        
  DibSetPixelColor:  Sets the pixel color at (x, y)
        
-----------------------------------------------------------------------------*/
        

BOOL DibSetPixelColor (HDIB hdib, int x, int y, RGBQUAD * prgb)
        
{
        
           DWORD                         dwPixel ;
        
           int                           iBitCount ;
        
           PDIBSTRUCT    pdib = hdib ;
        

                  // Don't do this function for DIBs with color tables
        

           iBitCount = DibBitCount (hdib) ;
        
           if (iBitCount <= 8)
        
                          return FALSE ;
        
                  // The rest is just the opposite of DibGetPixelColor
        
           else if (iBitCount == 24)
        
           {
        
                          * (RGBTRIPLE *) & dwPixel = * (RGBTRIPLE *) prgb ;
        
                          dwPixel &= 0x00FFFFFF ;
        
           }
        
           else if (iBitCount == 32 &&
        
                                                 pdib->ds.dsBmih.biCompression == BI_RGB)
        
    {
        
                          * (RGBQUAD *) & dwPixel = * prgb ;
        
    }
        

           else
        
    {
        
       dwPixel  = (((DWORD)     prgb->rgbRed >> pdib->iLShift[0])
        
       << pdib->iRShift[0]) ;
        

       dwPixel |= (((DWORD)     prgb->rgbGreen >> pdib->iLShift[1])
        
       << pdib->iRShift[1]) ;
        

       dwPixel |= (((DWORD)     prgb->rgbBlue >> pdib->iLShift[2])
        
       << pdib->iRShift[2]) ;
        
           }
        

           DibSetPixel (hdib, x, y, dwPixel) ;
        
          return TRUE ;
        
}

// ************************************

/*--------------------------------------------------------------------------
        
    Calculating shift values from color masks is required by the
        
    DibCreateFromInfo function.
        
----------------------------------------------------------------------------*/
        
static int MaskToRShift (DWORD dwMask)
        
{
        
           int iShift ;
        
           if (dwMask == 0)
        
                          return 0 ;
        
           for (iShift = 0 ; !(dwMask & 1) ; iShift++)
        
                          dwMask >>= 1 ;
        
           return iShift ;
        
}
        

static int MaskToLShift (DWORD dwMask)
        
{
        
           int iShift ;
        
           if (dwMask == 0)
        
                          return 0 ;
        
           while (!(dwMask & 1))
        
                          dwMask >>= 1 ;
        
           for (iShift = 0 ; dwMask & 1 ; iShift++)
        
                          dwMask >>= 1 ;
        
           return 8 - iShift ;
        
}
        
/*----------------------------------------------------------------------------
        
    DibCreateFromInfo: All DIB creation functions ultimately call this one.
        
    This function is responsible for calling CreateDIBSection, allocating
        
    memory for DIBSTRUCT, and setting up the row pointer.
        
-----------------------------------------------------------------------------*/
        

HDIB DibCreateFromInfo (BITMAPINFO * pbmi)
        
{
        
           BYTE                          *      pBits ;
        
           DIBSTRUCT     *      pdib ;
        
           HBITMAP                       hBitmap ;
        
           int                                 i, iRowLength, cy, y ;
        
   
        
           hBitmap = CreateDIBSection (NULL, pbmi, DIB_RGB_COLORS, &pBits, NULL, 0) ;
        
           if (hBitmap == NULL)
        
                          return NULL ;
        
           if (NULL == (pdib = malloc (sizeof (DIBSTRUCT))))
        
           {
        
                          DeleteObject (hBitmap) ;
        
                          return NULL ;
        
   }
        

           pdib->iSignature      = HDIB_SIGNATURE ;
        
           pdib->hBitmap         = hBitmap ;
        
           pdib->pBits           = pBits ;
        

           GetObject (hBitmap, sizeof (DIBSECTION), &pdib->ds) ;
        
                  // Notice that we can now use the DIB information functions
        
                  //   defined above.
        

                  // If the compression is BI_BITFIELDS, calculate shifts from masks
        

           if (DibCompression (pdib) == BI_BITFIELDS)
        
           {
        
                  for (i = 0 ; i < 3 ; i++)
        
                 {
        
                                  pdib->iLShift[i] = MaskToLShift (pdib->ds.dsBitfields[i]) ;
        
                                  pdib->iRShift[i] = MaskToRShift (pdib->ds.dsBitfields[i]) ;
        
                  }
        
           }
        

                  // If the compression is BI_RGB, but bit-count is 16 or 32,
        
                  //   set the bitfields and the masks
        
           else if (DibCompression (pdib) == BI_RGB)
        
           {
        
                  if (DibBitCount (pdib) == 16)
        
                  {
        
                                  pdib->ds.dsBitfields[0] = 0x00007C00 ;
        
                                 pdib->ds.dsBitfields[1] = 0x000003E0 ;
        
                                  pdib->ds.dsBitfields[2] = 0x0000001F ;
        

                                  pdib->iRShift [0]    =             10     ;
        
                                  pdib->iRShift [1]    =             5      ;
        
                                  pdib->iRShift [2]    =             0      ;
        

                                  pdib->iLShift [0]    =             3      ;
        
                                  pdib->iLShift [1]    =             3      ;
        
                                  pdib->iLShift [2]    =             3      ;
        
                  }
        
                  else if (DibBitCount (pdib) == 24 || DibBitCount (pdib) == 32)
        
                 {
        
                                  pdib->ds.dsBitfields[0] = 0x00FF0000 ;
        
                                  pdib->ds.dsBitfields[1] = 0x0000FF00 ;
        
                                  pdib->ds.dsBitfields[2] = 0x000000FF ;
        

                                  pdib->iRShift [0]    =             16     ;
        
                                  pdib->iRShift [1]    =             8      ;
        
                                  pdib->iRShift [2]    =             0      ;
        

                                  pdib->iLShift [0]    =             0      ;
        
                                  pdib->iLShift [1]    =             0      ;
        
                                  pdib->iLShift [2]    =             0      ;
        
                  }
        
    }
        
                  // Allocate an array of pointers to each row in the DIB
        
           cy = DibHeight (pdib) ;
        
           if (NULL == (pdib->ppRow = malloc (cy * sizeof (BYTE *))))
        
           {
        
                          free (pdib) ;
        
                          DeleteObject (hBitmap) ;
        
                          return NULL ;
        
           }
        

                  // Initialize them.
        
           iRowLength = DibRowLength (pdib) ;
        
           if (pbmi->bmiHeader.biHeight > 0)                           // ie, bottom up
        
           {
        
                          for (y = 0 ; y < cy ; y++)
        
                                                 pdib->ppRow[y] = pBits + (cy - y - 1) * iRowLength ;
        
           }
        
           else                                                                                           
        
// top down
        
    {
        
                          for (y = 0 ; y < cy ; y++)
        
                                               pdib->ppRow[y] = pBits + y * iRowLength ;
        
           }
        
           return pdib ;
        
}
        

/*--------------------------------------------------------------------------
        
  DibDelete:  Frees all memory for the DIB section
        
----------------------------------------------------------------------------*/
        

BOOL DibDelete (HDIB hdib)
        
{
        
    DIBSTRUCT * pdib = hdib ;
        
           if (!DibIsValid (hdib))
        
                          return FALSE ;
        
           free (pdib->ppRow) ;
        
           DeleteObject (pdib->hBitmap) ;
        
           free (pdib) ;
        
           return TRUE ;
        
}
        

/*----------------------------------------------------------------------------
        
  DibCreate: Creates an HDIB from explicit arguments
        
-----------------------------------------------------------------------------*/
        

HDIB DibCreate (int cx, int cy, int cBits, int cColors)
        
{
        
         BITMAPINFO    *      pbmi ;
        
           DWORD                                dwInfoSize ;
        
           HDIB                                 hDib ;
        
           int                                  cEntries ;
        

           if (cx <= 0 || cy <= 0 ||
        
                          ((cBits !=  1) && (cBits !=  4) && (cBits != 8) &&
        
                                  (cBits != 16) && (cBits != 24) && (cBits != 32)))
        
   {
        
                  return NULL ;
        
  }
        

   if (   cColors != 0)
        
                          cEntries = cColors ;
        
  else   if (cBits <= 8)
        
                          cEntries = 1 << cBits ;
        

           dwInfoSize = sizeof (BITMAPINFOHEADER) + (cEntries - 1) * sizeof (RGBQUAD);
        

           if (NULL == (pbmi = malloc (dwInfoSize)))
        
           {
        
                  return NULL ;
        
           }
        

           ZeroMemory (pbmi, dwInfoSize) ;
        

           pbmi->bmiHeader.biSize                       = sizeof (BITMAPINFOHEADER) ;
        
           pbmi->bmiHeader.biWidth                      = cx ;
        
           pbmi->bmiHeader.biHeight                     = cy ;
        
           pbmi->bmiHeader.biPlanes                     = 1 ;
        
           pbmi->bmiHeader.biBitCount                   = cBits ;
        
           pbmi->bmiHeader.biCompression                = BI_RGB ;
        
           pbmi->bmiHeader.biSizeImage                  = 0 ;
        
           pbmi->bmiHeader.biXPelsPerMeter              = 0 ;
        
           pbmi->bmiHeader.biYPelsPerMeter              = 0 ;
        
           pbmi->bmiHeader.biClrUsed                    = cColors ;
        
           pbmi->bmiHeader.biClrImportant               = 0 ;
        

           hDib = DibCreateFromInfo (pbmi) ;
        
           free (pbmi) ;
        

           return hDib ;
        
}
        

/*----------------------------------------------------------------------------
        
    DibCopyToInfo:                Builds BITMAPINFO structure.
        
                                                               Used by DibCopy and DibCopyToDdb
        
-----------------------------------------------------------------------------*/
        

static BITMAPINFO * DibCopyToInfo (HDIB hdib)
        
{
        
           BITMAPINFO            *      pbmi ;
        
           int                                          i, iNumColors ;
        
          RGBQUAD                       *      prgb ;
        
           if (!DibIsValid (hdib))
        
                          return NULL ;
        
                          // Allocate the memory
        
           if (NULL == (pbmi = malloc (DibInfoSize (hdib))))
        
                         return NULL ;
        
                          // Copy the information header
        
           CopyMemory (pbmi, DibInfoHeaderPtr   (hdib), sizeof (BITMAPINFOHEADER));
        
        
        
                          // Copy the possible color masks
        

           prgb = (RGBQUAD *) ((BYTE *) pbmi + sizeof (BITMAPINFOHEADER)) ;
        
           if (DibMaskSize (hdib))
        
           {
        
                          CopyMemory (prgb, DibMaskPtr (hdib), 3 * sizeof (DWORD)) ;
        
                          prgb = (RGBQUAD *) ((BYTE *) prgb + 3 * sizeof (DWORD)) ;
        
   }
        
                          // Copy the color table
        
           iNumColors = DibNumColors (hdib) ;
        
           for (i = 0 ; i < iNumColors ; i++)
        
                         DibGetColor (hdib, i, prgb + i) ;
        
           return pbmi ;
        
}
        

/*--------------------------------------------------------------------------
        
  DibCopy:  Creates a new DIB section from an existing DIB section,
        
                  possibly swapping the DIB width and height.
        
---------------------------------------------------------------------------*/
        

HDIB DibCopy (HDIB hdibSrc, BOOL fRotate)
        
{
        
           BITMAPINFO            *      pbmi ;
        
           BYTE                  *      pBitsSrc, * pBitsDst ;
        
           HDIB        hdibDst ;
        

           if (!DibIsValid (hdibSrc))
        
                          return NULL ;
        
           if (NULL == (pbmi = DibCopyToInfo (hdibSrc)))
        
                          return NULL ;
        
           if (fRotate)
        
           {
        
                          pbmi->bmiHeader.biWidth = DibHeight (hdibSrc) ;
        
                          pbmi->bmiHeader.biHeight = DibWidth (hdibSrc) ;
        
           }
        

           hdibDst = DibCreateFromInfo (pbmi) ;
        
           free (pbmi) ;
        

           if (   hdibDst == NULL)
        
                          return NULL ;
        

                                  // Copy the bits
        

           if (!fRotate)
        
           {
        
                                  pBitsSrc = DibBitsPtr (hdibSrc) ;
        
                                  pBitsDst = DibBitsPtr (hdibDst) ;
        

                                 CopyMemory (pBitsDst, pBitsSrc, DibBitsSize (hdibSrc)) ;
        
           }
        
    return hdibDst ;
        
}
        

/*----------------------------------------------------------------------------
        
  DibCopyToPackedDib is generally used for saving DIBs and for
        
   transferring DIBs to the clipboard. In the second case, the second
        
  argument should be set to TRUE so that the memory is allocated
        
  with the GMEM_SHARE flag.
        
-----------------------------------------------------------------------------*/
        

BITMAPINFO * DibCopyToPackedDib (HDIB hdib, BOOL fUseGlobal)
        
{
        
           BITMAPINFO            *      pPackedDib ;
        
           BYTE                  *      pBits ;
        
           DWORD                 dwDibSize ;
        
           HDC                   hdcMem ;
        
           HGLOBAL               hGlobal ;
        
           int                   iNumColors ;
        
           PDIBSTRUCT            pdib = hdib ;
        
           RGBQUAD               *      prgb ;
        

           if (!DibIsValid (hdib))
        
                          return NULL ;
        
                                  // Allocate memory for packed DIB
        
           dwDibSize = DibTotalSize (hdib) ;
        
           if (fUseGlobal)
        
           {
        
                          hGlobal = GlobalAlloc (GHND | GMEM_SHARE, dwDibSize) ;
        
                          pPackedDib = GlobalLock (hGlobal) ;
        
           }
        
           else
        
  {
        
                          pPackedDib = malloc (dwDibSize) ;
        
           }
        

           if (pPackedDib == NULL)
        
                          return NULL ;
        
                          // Copy the information header
        
           CopyMemory (pPackedDib, &pdib->ds.dsBmih, sizeof (BITMAPINFOHEADER)) ;
        
           prgb = (RGBQUAD *) ((BYTE *) pPackedDib + sizeof (BITMAPINFOHEADER)) ;
        
                         // Copy the possible color masks
        
           if (pdib->ds.dsBmih.biCompression == BI_BITFIELDS)
        
           {
        
                  CopyMemory (prgb, pdib->ds.dsBitfields, 3 * sizeof (DWORD)) ;
        
                  prgb = (RGBQUAD *) ((BYTE *) prgb + 3 * sizeof (DWORD)) ;
        
           }
        
                          // Copy the color table
        
           if (iNumColors = DibNumColors (hdib))
        
           {
        
                        hdcMem = CreateCompatibleDC (NULL) ;
        
                          SelectObject (hdcMem, pdib->hBitmap) ;
        
                          GetDIBColorTable (hdcMem, 0, iNumColors, prgb) ;
        
                        DeleteDC (hdcMem) ;
        
           }
        

           pBits = (BYTE *) (prgb + iNumColors) ;
        
                          // Copy the bits
        
           CopyMemory (pBits, pdib->pBits, DibBitsSize (pdib)) ;
        
                          // If last argument is TRUE, unlock global memory block and
        
                         //   cast it to pointer in preparation for return
        

           if (fUseGlobal)
        
           {
        
                          GlobalUnlock (hGlobal) ;
        
                          pPackedDib = (BITMAPINFO *) hGlobal ;   
        
           }
        
    return pPackedDib ;
        
}
        

/*--------------------------------------------------------------------------
        
  DibCopyFromPackedDib is generally used for pasting DIBs from the
        
    clipboard.
        
------------------------------------------------------------------------*/
        

HDIB DibCopyFromPackedDib (BITMAPINFO * pPackedDib)
        
{
        
           BYTE                          *      pBits ;   
        
           DWORD                                dwInfoSize, dwMaskSize, dwColorSize ;
        
           int                                  iBitCount ;
        
           PDIBSTRUCT            pdib ;
        

                          // Get the size of the information header and do validity check
        
   
        
           dwInfoSize = pPackedDib->bmiHeader.biSize ;
        
           if (   dwInfoSize != sizeof (BITMAPCOREHEADER) &&
        
                          dwInfoSize != sizeof (BITMAPINFOHEADER) &&
        
                          dwInfoSize != sizeof (BITMAPV4HEADER) &&
        
                          dwInfoSize != sizeof (BITMAPV5HEADER))
        
           {
        
                          return NULL ;
        
           }
        
                          // Get the possible size of the color masks
        

           if (dwInfoSize == sizeof (BITMAPINFOHEADER) &&
        
                          pPackedDib->bmiHeader.biCompression == BI_BITFIELDS)
        
           {
        
                          dwMaskSize = 3 * sizeof (DWORD) ;
        
           }
        
           else
        
           {
        
                          dwMaskSize = 0 ;
        
           }
        
                          // Get the size of the color table
        
           if (dwInfoSize == sizeof (BITMAPCOREHEADER))
        
           {
        
                          iBitCount = ((BITMAPCOREHEADER *) pPackedDib)->bcBitCount ;
        

                         if (iBitCount <= 8)
        
                          {
        
                          dwColorSize = (1 << iBitCount) * sizeof (RGBTRIPLE) ;
        
                          }
        
                          else
        
                                                 dwColorSize = 0 ;
        
  }
        
           else                                 // all non-OS/2 compatible DIBs
        
           {
        
                         if (pPackedDib->bmiHeader.biClrUsed > 0)
        
                          {
        
             dwColorSize = pPackedDib->bmiHeader.biClrUsed * sizeof (RGBQUAD);
        
                          }
        
                          else if (pPackedDib->bmiHeader.biBitCount <= 8)
        
                          {
        
                                                 dwColorSize = (1 << pPackedDib->bmiHeader.biBitCount) * sizeof (RGBQUAD) ;
        
                          }
        
                          else
        
                          {
        
                                                 dwColorSize = 0 ;
        
                          }
        
           }
        
                         // Finally, get the pointer to the bits in the packed DIB
        
          pBits = (BYTE *) pPackedDib + dwInfoSize + dwMaskSize + dwColorSize ;
        
                          // Create the HDIB from the packed-DIB pointer
        
           pdib = DibCreateFromInfo (pPackedDib) ;
        
                         // Copy the pixel bits
        
           CopyMemory (pdib->pBits, pBits, DibBitsSize (pdib)) ;
        
           return pdib ;
        
}
        

/*----------------------------------------------------------------------------
        
  DibFileLoad:  Creates a DIB section from a DIB file
        
-----------------------------------------------------------------------------*/
        
HDIB DibFileLoad (const TCHAR * szFileName)
        
{
        
           BITMAPFILEHEADER              bmfh ;
        
           BITMAPINFO                    *      pbmi ;
        
           BOOL                                                        bSuccess ;
        
           DWORD                                                       dwInfoSize, dwBitsSize, dwBytesRead ;
        
           HANDLE                                               hFile ;
        
           HDIB                                                        hDib ;
        

            // Open the file: read access, prohibit write access
        

           hFile = CreateFile (szFileName, GENERIC_READ, FILE_SHARE_READ, NULL,
        
                           OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, NULL) ;
        
          if (hFile == INVALID_HANDLE_VALUE)
        
                          return NULL ;
        
                          // Read in the BITMAPFILEHEADER
        
           bSuccess = ReadFile ( hFile, &bmfh, sizeof (BITMAPFILEHEADER),
        
                                         &dwBytesRead, NULL) ;
        

           if (!bSuccess || (dwBytesRead != sizeof (BITMAPFILEHEADER))       
        
                                                         || (bmfh.bfType != * (WORD *) "BM"))
        
           {
        
                          CloseHandle (hFile) ;
        
                          return NULL ;
        
    }
        
                          // Allocate memory for the information structure & read it in
        
           dwInfoSize = bmfh.bfOffBits - sizeof (BITMAPFILEHEADER) ;
        
           if (NULL == (pbmi = malloc (dwInfoSize)))
        
           {
        
                          CloseHandle (hFile) ;
        
                          return NULL ;
        
           }
        

           bSuccess = ReadFile (hFile, pbmi, dwInfoSize, &dwBytesRead, NULL) ;
        
           if (!bSuccess || (dwBytesRead != dwInfoSize))
        
    {
        
                  CloseHandle (hFile) ;
        
                  free (pbmi) ;
        
                  return NULL ;
        
           }
        
                  // Create the DIB
        
           hDib = DibCreateFromInfo (pbmi) ;
        
           free (pbmi) ;
        

           if (hDib == NULL)
        
           {
        
                  CloseHandle (hFile) ;
        
                  return NULL ;
        
           }
        
                  // Read in the bits
        
           dwBitsSize = bmfh.bfSize - bmfh.bfOffBits ;
        
           bSuccess = ReadFile ( hFile, ((PDIBSTRUCT) hDib)->pBits,
        
                                dwBitsSize, &dwBytesRead, NULL) ;
        
           CloseHandle (hFile) ;
        
           if (!bSuccess || (dwBytesRead != dwBitsSize))
        
           {
        
                  DibDelete (hDib) ;
        
                  return NULL ;
        
           }
        
           return hDib ;
        
}
        

/*--------------------------------------------------------------------------
        
  DibFileSave:  Saves a DIB section to a file
        
----------------------------------------------------------------------------*/
        

BOOL DibFileSave (HDIB hdib, const TCHAR * szFileName)
        
{
        
           BITMAPFILEHEADER              bmfh ;
        
           BITMAPINFO                    *      pbmi ;
        
           BOOL                          bSuccess ;
        
           DWORD                         dwTotalSize, dwBytesWritten ;
        
           HANDLE                        hFile ;
        

           hFile = CreateFile (szFileName, GENERIC_WRITE, 0, NULL,
        
                                  CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL) ;
        
           if (hFile == INVALID_HANDLE_VALUE)
        
                          return FALSE ;
        
           dwTotalSize                          = DibTotalSize (hdib) ;
        
           bmfh.bfType                          = * (WORD *) "BM" ;
        
           bmfh.bfSize                         = sizeof (BITMAPFILEHEADER) + dwTotalSize ;
        
           bmfh.bfReserved1              = 0 ;
        
           bmfh.bfReserved2              = 0 ;
        
           bmfh.bfOffBits                = bmfh.bfSize - DibBitsSize (hdib) ;
        

                          // Write the BITMAPFILEHEADER
        

           bSuccess = WriteFile (hFile, &bmfh, sizeof (BITMAPFILEHEADER),
        
                                  &dwBytesWritten, NULL) ;
        

           if (!bSuccess || (dwBytesWritten != sizeof (BITMAPFILEHEADER)))
        
           {
        
                          CloseHandle (hFile) ;
        
                          DeleteFile (szFileName) ;
        
                          return FALSE ;
        
           }
        
                          // Get entire DIB in packed-DIB format
        
           if (NULL == (pbmi = DibCopyToPackedDib (hdib, FALSE)))
        
    {
        
                          CloseHandle (hFile) ;
        
                          DeleteFile (szFileName) ;
        
                          return FALSE ;
        
           }
        
                         // Write out the packed DIB
        
           bSuccess = WriteFile (hFile, pbmi, dwTotalSize, &dwBytesWritten, NULL) ;
        
           CloseHandle (hFile) ;
        
           free (pbmi) ;
        

           if (!bSuccess || (dwBytesWritten != dwTotalSize))
        
           {
        
                          DeleteFile (szFileName) ;
        
                          return FALSE ;
        
           }
        
           return TRUE ;
        
}
        

/*---------------------------------------------------------------------------
        
  DibCopyToDdb:  For more efficient screen displays
        
---------------------------------------------------------------------------*/
        
HBITMAP DibCopyToDdb (HDIB hdib, HWND hwnd, HPALETTE hPalette)
        
{
        
           BITMAPINFO            *      pbmi ;
        
           HBITMAP                              hBitmap ;
        
           HDC                                          hdc ;
        

           if (!DibIsValid (hdib))
        
                          return NULL ;
        
           if (NULL == (pbmi = DibCopyToInfo (hdib)))
        
                          return NULL ;
        
           hdc = GetDC (hwnd) ;
        
           if (hPalette)
        
           {
        
                          SelectPalette (hdc, hPalette, FALSE) ;
        
                          RealizePalette (hdc) ;
        
           }
        
   
        
           hBitmap = CreateDIBitmap (hdc, DibInfoHeaderPtr (hdib), CBM_INIT,
        
                                                                   DibBitsPtr (hdib), pbmi, DIB_RGB_COLORS) ;
        

           ReleaseDC (hwnd, hdc) ;
        
           free (pbmi) ;
        

           return hBitmap ;
        
}

end.
