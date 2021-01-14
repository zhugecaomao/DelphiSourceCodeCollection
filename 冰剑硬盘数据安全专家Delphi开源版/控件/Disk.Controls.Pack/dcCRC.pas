{*************************************************************}
{            CRC Calculator for Delphi 32                     }
{ Version:   2.1                                              }
{ Author:    Aleksey Kuznetsov                                }
{ E-Mail:    aleksey@utilmind.com                             }
{ Website:   http://www.utilmind.com                          }
{ Created:   March, 30, 1999                                  }
{ Modified:  June, 5, 2001                                    }
{ Legal:     Copyright (c) 1999, UtilMind Solutions           }
{*************************************************************}
{ This unit provides three speed-optimized functions to       }
{ compute (or continue computation of) a Cyclic Redundency    }
{ Check (CRC). Applicable to XModem protocol (16-bit CRC),    }
{ SEA's "ARC" utility, PKZip (32-bit CRC) and many others     }
{ compatible software (i.e RAR, ARJ, ZIP).                    }
{*************************************************************}
{ Each function has three parameters:                         }
{                                                             }
{ InitCRC - The initial CRC value.  This may be the           }
{ recommended initialization value if this is the first or    }
{ only block to be checked, or this may be a previously       }
{ computed CRC value if this is a continuation.               }
{   XModem and ARC usually starts with zero (0), 32 bit crc   }
{   starts with all bits on ($FFFFFFFF).                      }
{                                                             }
{ Buffer - An untyped parameter (Pointer^) specifying the     }
{ beginning of the memory area to be checked.                 }
{                                                             }
{ Length - A word indicating the length of the memory area to }
{ be checked. If Length is zero, the function returns the     }
{ value of InitCRC.                                           }
{                                                             }
{ The function result is the updated CRC.                     }
{*************************************************************}

unit dcCRC;

interface

uses Windows; // To incapsulate the DWord type

function GetCRC16(InitCRC: Word; var Buffer; Length: {$IFDEF Win32} LongInt {$ELSE} Word {$ENDIF}): Word;
{ I believe this is the CRC used by the XModem protocol.
  The transmitting end should initialize with zero, UpdateCRC16 for
  the block, Continue the UpdateCRC16 for two nulls, and append the
  result (hi order byte first) to the transmitted block. The receiver
  should initialize with zero and UpdateCRC16 for the received block
  including the two byte CRC. The result will be zero (why?) if there
  were no transmission errors. (I have not tested this function with
  an actual XModem implementation, though I did verify the behavior
  just described. See TESTCRC.DPR.) }

function GetCRCArc(InitCRC: Word; var Buffer; Length: {$IFDEF Win32} LongInt {$ELSE} Word {$ENDIF}): Word;
{ This function computes the CRC used by SEA's ARC utility.
  Initialize with zero.}

function GetCRC32(InitCRC: {$IFDEF Win32}DWord{$ELSE}LongInt{$ENDIF}; var Buffer; Length: {$IFDEF Win32}DWord{$ELSE}Word{$ENDIF}): {$IFDEF Win32}DWord{$ELSE}LongInt{$ENDIF};
{ This function computes the CRC used by PKZIP and Forsberg's ZModem.
  Initialize with high-values ($FFFFFFFF), and finish by inverting
  allbits (Not). }

type
  TCRCMethod = (crc32, crc16, crcArc);
function GetFileCRC(const FileName: String; Method: TCRCMethod): DWord;
{ example of usage:
   CRC := FileCRC('C:\anyfile.dat', crc32) }

implementation

uses SysUtils;

const
 CrcArcTab: Array[0..$FF] of Word =
    ($00000, $0C0C1, $0C181, $00140, $0C301, $003C0, $00280, $0C241,
     $0C601, $006C0, $00780, $0C741, $00500, $0C5C1, $0C481, $00440,
     $0CC01, $00CC0, $00D80, $0CD41, $00F00, $0CFC1, $0CE81, $00E40,
     $00A00, $0CAC1, $0CB81, $00B40, $0C901, $009C0, $00880, $0C841,
     $0D801, $018C0, $01980, $0D941, $01B00, $0DBC1, $0DA81, $01A40,
     $01E00, $0DEC1, $0DF81, $01F40, $0DD01, $01DC0, $01C80, $0DC41,
     $01400, $0D4C1, $0D581, $01540, $0D701, $017C0, $01680, $0D641,
     $0D201, $012C0, $01380, $0D341, $01100, $0D1C1, $0D081, $01040,
     $0F001, $030C0, $03180, $0F141, $03300, $0F3C1, $0F281, $03240,
     $03600, $0F6C1, $0F781, $03740, $0F501, $035C0, $03480, $0F441,
     $03C00, $0FCC1, $0FD81, $03D40, $0FF01, $03FC0, $03E80, $0FE41,
     $0FA01, $03AC0, $03B80, $0FB41, $03900, $0F9C1, $0F881, $03840,
     $02800, $0E8C1, $0E981, $02940, $0EB01, $02BC0, $02A80, $0EA41,
     $0EE01, $02EC0, $02F80, $0EF41, $02D00, $0EDC1, $0EC81, $02C40,
     $0E401, $024C0, $02580, $0E541, $02700, $0E7C1, $0E681, $02640,
     $02200, $0E2C1, $0E381, $02340, $0E101, $021C0, $02080, $0E041,
     $0A001, $060C0, $06180, $0A141, $06300, $0A3C1, $0A281, $06240,
     $06600, $0A6C1, $0A781, $06740, $0A501, $065C0, $06480, $0A441,
     $06C00, $0ACC1, $0AD81, $06D40, $0AF01, $06FC0, $06E80, $0AE41,
     $0AA01, $06AC0, $06B80, $0AB41, $06900, $0A9C1, $0A881, $06840,
     $07800, $0B8C1, $0B981, $07940, $0BB01, $07BC0, $07A80, $0BA41,
     $0BE01, $07EC0, $07F80, $0BF41, $07D00, $0BDC1, $0BC81, $07C40,
     $0B401, $074C0, $07580, $0B541, $07700, $0B7C1, $0B681, $07640,
     $07200, $0B2C1, $0B381, $07340, $0B101, $071C0, $07080, $0B041,
     $05000, $090C1, $09181, $05140, $09301, $053C0, $05280, $09241,
     $09601, $056C0, $05780, $09741, $05500, $095C1, $09481, $05440,
     $09C01, $05CC0, $05D80, $09D41, $05F00, $09FC1, $09E81, $05E40,
     $05A00, $09AC1, $09B81, $05B40, $09901, $059C0, $05880, $09841,
     $08801, $048C0, $04980, $08941, $04B00, $08BC1, $08A81, $04A40,
     $04E00, $08EC1, $08F81, $04F40, $08D01, $04DC0, $04C80, $08C41,
     $04400, $084C1, $08581, $04540, $08701, $047C0, $04680, $08641,
     $08201, $042C0, $04380, $08341, $04100, $081C1, $08081, $04040);

 Crc16Tab: Array[0..$FF] of Word =
    ($00000, $01021, $02042, $03063, $04084, $050a5, $060c6, $070e7,
     $08108, $09129, $0a14a, $0b16b, $0c18c, $0d1ad, $0e1ce, $0f1ef,
     $01231, $00210, $03273, $02252, $052b5, $04294, $072f7, $062d6,
     $09339, $08318, $0b37b, $0a35a, $0d3bd, $0c39c, $0f3ff, $0e3de,
     $02462, $03443, $00420, $01401, $064e6, $074c7, $044a4, $05485,
     $0a56a, $0b54b, $08528, $09509, $0e5ee, $0f5cf, $0c5ac, $0d58d,
     $03653, $02672, $01611, $00630, $076d7, $066f6, $05695, $046b4,
     $0b75b, $0a77a, $09719, $08738, $0f7df, $0e7fe, $0d79d, $0c7bc,
     $048c4, $058e5, $06886, $078a7, $00840, $01861, $02802, $03823,
     $0c9cc, $0d9ed, $0e98e, $0f9af, $08948, $09969, $0a90a, $0b92b,
     $05af5, $04ad4, $07ab7, $06a96, $01a71, $00a50, $03a33, $02a12,
     $0dbfd, $0cbdc, $0fbbf, $0eb9e, $09b79, $08b58, $0bb3b, $0ab1a,
     $06ca6, $07c87, $04ce4, $05cc5, $02c22, $03c03, $00c60, $01c41,
     $0edae, $0fd8f, $0cdec, $0ddcd, $0ad2a, $0bd0b, $08d68, $09d49,
     $07e97, $06eb6, $05ed5, $04ef4, $03e13, $02e32, $01e51, $00e70,
     $0ff9f, $0efbe, $0dfdd, $0cffc, $0bf1b, $0af3a, $09f59, $08f78,
     $09188, $081a9, $0b1ca, $0a1eb, $0d10c, $0c12d, $0f14e, $0e16f,
     $01080, $000a1, $030c2, $020e3, $05004, $04025, $07046, $06067,
     $083b9, $09398, $0a3fb, $0b3da, $0c33d, $0d31c, $0e37f, $0f35e,
     $002b1, $01290, $022f3, $032d2, $04235, $05214, $06277, $07256,
     $0b5ea, $0a5cb, $095a8, $08589, $0f56e, $0e54f, $0d52c, $0c50d,
     $034e2, $024c3, $014a0, $00481, $07466, $06447, $05424, $04405,
     $0a7db, $0b7fa, $08799, $097b8, $0e75f, $0f77e, $0c71d, $0d73c,
     $026d3, $036f2, $00691, $016b0, $06657, $07676, $04615, $05634,
     $0d94c, $0c96d, $0f90e, $0e92f, $099c8, $089e9, $0b98a, $0a9ab,
     $05844, $04865, $07806, $06827, $018c0, $008e1, $03882, $028a3,
     $0cb7d, $0db5c, $0eb3f, $0fb1e, $08bf9, $09bd8, $0abbb, $0bb9a,
     $04a75, $05a54, $06a37, $07a16, $00af1, $01ad0, $02ab3, $03a92,
     $0fd2e, $0ed0f, $0dd6c, $0cd4d, $0bdaa, $0ad8b, $09de8, $08dc9,
     $07c26, $06c07, $05c64, $04c45, $03ca2, $02c83, $01ce0, $00cc1,
     $0ef1f, $0ff3e, $0cf5d, $0df7c, $0af9b, $0bfba, $08fd9, $09ff8,
     $06e17, $07e36, $04e55, $05e74, $02e93, $03eb2, $00ed1, $01ef0);

 Crc32Tab: Array[0..$FF] of {$IFDEF Win32}DWord{$ELSE}LongInt{$ENDIF} =
   ($00000000, $77073096, $ee0e612c, $990951ba, $076dc419, $706af48f,
    $e963a535, $9e6495a3, $0edb8832, $79dcb8a4, $e0d5e91e, $97d2d988,
    $09b64c2b, $7eb17cbd, $e7b82d07, $90bf1d91, $1db71064, $6ab020f2,
    $f3b97148, $84be41de, $1adad47d, $6ddde4eb, $f4d4b551, $83d385c7,
    $136c9856, $646ba8c0, $fd62f97a, $8a65c9ec, $14015c4f, $63066cd9,
    $fa0f3d63, $8d080df5, $3b6e20c8, $4c69105e, $d56041e4, $a2677172,
    $3c03e4d1, $4b04d447, $d20d85fd, $a50ab56b, $35b5a8fa, $42b2986c,
    $dbbbc9d6, $acbcf940, $32d86ce3, $45df5c75, $dcd60dcf, $abd13d59,
    $26d930ac, $51de003a, $c8d75180, $bfd06116, $21b4f4b5, $56b3c423,
    $cfba9599, $b8bda50f, $2802b89e, $5f058808, $c60cd9b2, $b10be924,
    $2f6f7c87, $58684c11, $c1611dab, $b6662d3d, $76dc4190, $01db7106,
    $98d220bc, $efd5102a, $71b18589, $06b6b51f, $9fbfe4a5, $e8b8d433,
    $7807c9a2, $0f00f934, $9609a88e, $e10e9818, $7f6a0dbb, $086d3d2d,
    $91646c97, $e6635c01, $6b6b51f4, $1c6c6162, $856530d8, $f262004e,
    $6c0695ed, $1b01a57b, $8208f4c1, $f50fc457, $65b0d9c6, $12b7e950,
    $8bbeb8ea, $fcb9887c, $62dd1ddf, $15da2d49, $8cd37cf3, $fbd44c65,
    $4db26158, $3ab551ce, $a3bc0074, $d4bb30e2, $4adfa541, $3dd895d7,
    $a4d1c46d, $d3d6f4fb, $4369e96a, $346ed9fc, $ad678846, $da60b8d0,
    $44042d73, $33031de5, $aa0a4c5f, $dd0d7cc9, $5005713c, $270241aa,
    $be0b1010, $c90c2086, $5768b525, $206f85b3, $b966d409, $ce61e49f,
    $5edef90e, $29d9c998, $b0d09822, $c7d7a8b4, $59b33d17, $2eb40d81,
    $b7bd5c3b, $c0ba6cad, $edb88320, $9abfb3b6, $03b6e20c, $74b1d29a,
    $ead54739, $9dd277af, $04db2615, $73dc1683, $e3630b12, $94643b84,
    $0d6d6a3e, $7a6a5aa8, $e40ecf0b, $9309ff9d, $0a00ae27, $7d079eb1,
    $f00f9344, $8708a3d2, $1e01f268, $6906c2fe, $f762575d, $806567cb,
    $196c3671, $6e6b06e7, $fed41b76, $89d32be0, $10da7a5a, $67dd4acc,
    $f9b9df6f, $8ebeeff9, $17b7be43, $60b08ed5, $d6d6a3e8, $a1d1937e,
    $38d8c2c4, $4fdff252, $d1bb67f1, $a6bc5767, $3fb506dd, $48b2364b,
    $d80d2bda, $af0a1b4c, $36034af6, $41047a60, $df60efc3, $a867df55,
    $316e8eef, $4669be79, $cb61b38c, $bc66831a, $256fd2a0, $5268e236,
    $cc0c7795, $bb0b4703, $220216b9, $5505262f, $c5ba3bbe, $b2bd0b28,
    $2bb45a92, $5cb36a04, $c2d7ffa7, $b5d0cf31, $2cd99e8b, $5bdeae1d,
    $9b64c2b0, $ec63f226, $756aa39c, $026d930a, $9c0906a9, $eb0e363f,
    $72076785, $05005713, $95bf4a82, $e2b87a14, $7bb12bae, $0cb61b38,
    $92d28e9b, $e5d5be0d, $7cdcefb7, $0bdbdf21, $86d3d2d4, $f1d4e242,
    $68ddb3f8, $1fda836e, $81be16cd, $f6b9265b, $6fb077e1, $18b74777,
    $88085ae6, $ff0f6a70, $66063bca, $11010b5c, $8f659eff, $f862ae69,
    $616bffd3, $166ccf45, $a00ae278, $d70dd2ee, $4e048354, $3903b3c2,
    $a7672661, $d06016f7, $4969474d, $3e6e77db, $aed16a4a, $d9d65adc,
    $40df0b66, $37d83bf0, $a9bcae53, $debb9ec5, $47b2cf7f, $30b5ffe9,
    $bdbdf21c, $cabac28a, $53b39330, $24b4a3a6, $bad03605, $cdd70693,
    $54de5729, $23d967bf, $b3667a2e, $c4614ab8, $5d681b02, $2a6f2b94,
    $b40bbe37, $c30c8ea1, $5a05df1b, $2d02ef8d);

function GetCRC16(InitCRC: Word; var Buffer; Length: {$IFDEF Win32} LongInt {$ELSE} Word {$ENDIF}): Word;
begin
  asm
  {$IFDEF Win32}
         push   esi
         push   edi
         push   eax
         push   ebx
         push   ecx
         push   edx
         lea    edi, Crc16Tab
         mov    esi, Buffer
         mov    ax, InitCrc
         mov    ecx, Length
         or     ecx, ecx
         jz     @@done
@@loop:
         xor    ebx, ebx
         mov    bl, ah
         mov    ah, al
         lodsb
         shl    bx, 1
         add    ebx, edi
         xor    ax, [ebx]
         loop   @@loop
@@done:
         mov    Result, ax
         pop    edx
         pop    ecx
         pop    ebx
         pop    eax
         pop    edi
         pop    esi
  {$ELSE}
         lea    di, Crc16Tab
         push   ds
         pop    es
         push   ds
         lds    si, Buffer
         mov    ax, InitCrc
         mov    cx, Length
         or     cx, cx
         jz     @@done
@@loop:
         xor    bx, bx
         mov    bl, ah
         mov    ah, al
         lodsb
         shl    bx, 1
         xor    ax, es:[di + bx]
         loop   @@loop
         pop    ds
@@done:
         mov    Result, ax
   {$ENDIF}
   end;
end;

function GetCRCArc(InitCRC: Word; var Buffer; Length: {$IFDEF Win32} LongInt {$ELSE} Word {$ENDIF}): Word;
begin
  asm
  {$IFDEF Win32}
         push   esi
         push   edi
         push   eax
         push   ebx
         push   ecx
         push   edx
         lea    edi, CrcArcTab
         mov    esi, Buffer
         mov    ax, InitCrc
         mov    ecx, Length
         or     ecx, ecx
         jz     @@done
@@loop:
         xor    ebx, ebx
         mov    bl, al
         lodsb
         xor    bl, al
         shl    bx, 1
         add    ebx, edi
         mov    bx, [ebx]
         xor    bl, ah
         mov    ax, bx
         loop   @@loop
@@done:
         mov    Result, ax
         pop    edx
         pop    ecx
         pop    ebx
         pop    eax
         pop    edi 
         pop    esi
  {$ELSE}
         lea    di, CrcArcTab
         push   ds
         pop    es
         push   ds
         lds    si, Buffer
         mov    ax, InitCrc
         mov    cx, Length
         or     cx, cx
         jz     @@done
@@loop:
         xor    bx, bx
         mov    bl, al
         lodsb
         xor    bl, al
         shl    bx, 1
         mov    bx, es:[di + bx]
         xor    bl, ah
         mov    ax, bx
         loop   @@loop
         pop    ds
@@done:
         mov    Result, ax
   {$ENDIF}
   end;
end;

function GetCRC32(InitCRC: {$IFDEF Win32}DWord{$ELSE}LongInt{$ENDIF}; var Buffer; Length: {$IFDEF Win32}DWord{$ELSE}Word{$ENDIF}): {$IFDEF Win32}DWord{$ELSE}LongInt{$ENDIF};
begin
  asm
{$IFDEF Win32}
         push   esi
         push   edi
         push   eax
         push   ebx
         push   ecx
         push   edx
         lea    edi, Crc32Tab
         mov    esi, Buffer
         mov    ax, word ptr InitCRC
         mov    dx, word ptr InitCRC + 2
         mov    ecx, Length
         or     ecx, ecx
         jz     @@done
@@loop:
         xor    ebx, ebx
         mov    bl, al
         lodsb
         xor    bl, al
         mov    al, ah
         mov    ah, dl
         mov    dl, dh
         xor    dh, dh
         shl    bx, 1
         shl    bx, 1
         add    ebx, edi
         xor    ax, [ebx]
         xor    dx, [ebx + 2]
         loop   @@loop
@@done:
         mov    word ptr Result, ax
         mov    word ptr Result + 2, dx
         pop    edx
         pop    ecx
         pop    ebx
         pop    eax
         pop    edi
         pop    esi
{$ELSE}
         push   ds
         pop    es
         push   ds
         lea    di, CRC32Tab
         lds    si, Buffer
         mov    ax, word ptr InitCRC
         mov    dx, word ptr InitCRC + 2
         mov    cx, Length
         or     cx, cx
         jz     @@done
@@loop:
         xor    bh, bh
         mov    bl, al
         lodsb
         xor    bl, al
         mov    al, ah
         mov    ah, dl
         mov    dl, dh
         xor    dh, dh
         shl    bx, 1
         shl    bx, 1
         xor    ax, es:[di + bx]
         xor    dx, es:[di + bx + 2]
         loop   @@loop
@@done:
         pop    ds
         mov    word ptr Result, ax
         mov    word ptr Result + 2, dx
{$ENDIF}
  end;
end;

function GetFileCRC(const FileName: String; Method: TCRCMethod): DWord;
var
  FileHandle: hFile;
  FileSize, tmp: DWord;
  Buffer: Pointer;
begin
  Result := 0;
  if FileExists(FileName) then
   begin
    FileHandle := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                          OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if FileHandle <> INVALID_HANDLE_VALUE then
     begin
      FileSize := GetFileSize(FileHandle, @tmp);     
      GetMem(Buffer, FileSize);
      try
        if ReadFile(FileHandle, Buffer^, FileSize, tmp, nil) then
         // Cyclic Redundency Checking
         case Method of
            crc32: Result := GetCrc32($FFFFFFFF, Buffer^, FileSize);
            crc16: Result := GetCrc16(0, Buffer^, FileSize);
           crcArc: Result := GetCrcArc(0, Buffer^, FileSize);
          end
        else
         Result := 0;
      finally
        FreeMem(Buffer);
      end;
      CloseHandle(FileHandle);
     end
   end;
end;

end.
