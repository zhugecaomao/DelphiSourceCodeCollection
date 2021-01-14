{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcVersionInfo.pas - dcVersionInfo component

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcVersionInfo;

interface

uses
  Classes, Controls, Graphics, 
  dcInternal;

type
  TdcVersionInfo = class(TumdcComponent)
  private
    FFileName: String;

    FComments: String;
    FCompanyName: String;
    FFileDescription: String;
    FFileFlags: LongInt;
    FFileFlagsMask: LongInt;
    FFileMajorVersion: LongInt;
    FFileMinorVersion: LongInt;
    FFileVersion: String;
    FFileVersionFloat: Double;
    FFileVerMajor: Word;
    FFileVerMinor: Word;
    FFileVerRelease: Word;
    FFileVerBuild: Word;
    FInternalName: String;
    FLanguageCount: LongInt;
    FLanguageName: String;
    FLegalCopyright: String;
    FLegalTrademark: String;
    FOriginalFilename: String;
    FProductMajorVersion: LongInt;
    FProductMinorVersion: LongInt;
    FProductName: String;
    FProductVersion: String;
    FProductVersionFloat: Double;
    FTranslationValue: LongInt;

    procedure SetFileName(const Value: String);

    procedure SetNoneStr(const Value: String);
    procedure SetNoneLong(Value: LongInt);
    procedure SetNoneWord(Value: Word);
    procedure SetNoneFloat(Value: Double);
  protected
  public
  published
    property About;

    property FILENAME: String read FFileName write SetFileName stored False;

    property Comments: String read FComments write SetNoneStr stored False;
    property CompanyName: String read FCompanyName write SetNoneStr stored False;
    property FileDescription: String read FFileDescription write SetNoneStr stored False;
    property FileFlags: LongInt read FFileFlags write SetNoneLong stored False;
    property FileFlagsMask: LongInt read FFileFlagsMask write SetNoneLong stored False;
    property FileMajorVersion: LongInt read FFileMajorVersion write SetNoneLong stored False;
    property FileMinorVersion: LongInt read FFileMinorVersion write SetNoneLong stored False;
    property FileVersion: String read FFileVersion write SetNoneStr stored False;
    property FileVersionFloat: Double read FFileVersionFloat write SetNoneFloat stored False;
    property FileVerMajor: Word read FFileVerMajor write SetNoneWord stored False;
    property FileVerMinor: Word read FFileVerMinor write SetNoneWord stored False;
    property FileVerRelease: Word read FFileVerRelease write SetNoneWord stored False;
    property FileVerBuild: Word read FFileVerBuild write SetNoneWord stored False;
    property InternalName: String read FInternalName write SetNoneStr stored False;
    property LanguageCount: LongInt read FLanguageCount write SetNoneLong stored False;
    property LanguageName: String read FLanguageName write SetNoneStr stored False;
    property LegalCopyright: String read FLegalCopyright write SetNoneStr stored False;
    property LegalTrademark: String read FLegalTrademark write SetNoneStr stored False;
    property OriginalFilename: String read FOriginalFilename write SetNoneStr stored False;
    property ProductName: String read FProductName write SetNoneStr stored False;
    property ProductMajorVersion: LongInt read FProductMajorVersion write SetNoneLong stored False;
    property ProductMinorVersion: LongInt read FProductMinorVersion write SetNoneLong stored False;
    property ProductVersion: String read FProductVersion write SetNoneStr stored False;
    property ProductVersionFloat: Double read FProductVersionFloat write SetNoneFloat stored False;
    property TranslationValue: LongInt read FTranslationValue write SetNoneLong stored False;
  end;

implementation

uses Windows, Forms, SysUtils, ShellAPI;

procedure TdcVersionInfo.SetFileName(const Value: String);
const
  NoVerInfo   = 'No version info';
  GetInfoFail = 'Can not get version info';
type
  PVerTranslation = ^TVerTranslation;
  TVerTranslation = record
    Language : Word;
    CharSet  : Word;
  end;
var
  Handle  : DWord;
  Res     : Boolean;
  Size    : Integer;
  Error   : LongInt;
  Data    : Pointer;
  Buffer  : Pointer;
  ErrCode : Integer;
  {$IFDEF D4}
  Bytes   : UINT;
  {$ELSE}
  Bytes   : Integer;
  {$ENDIF}
  TempStr : Array[0..259] of Char;
  LangBuff: Array[0..259] of Char;
  BaseStr : String;
  InfoStr : String;
  Trans   : PVerTranslation;
  TrSize  : Integer;
  FixedInfo : PVSFixedFileInfo;

  function MakeFloat(S: String): Double;
  var
    Buff  : Array[0..5] of Char;
    I     : Integer;
    Count : Integer;
  begin
    Count := 0;
    FillChar(Buff, SizeOf(Buff), 0);
    Buff[0] := '0';
    
    for I := 0 to Pred(Length(S)) do
     if S[I] = '.' then
      begin
       { Found the first period. Replace it with the DecimalSeparator }
       { constant so that StrToFloat works properly. }
       S[I] := DecimalSeparator;
       Inc(Count);
       if (Count = 2) and (I <= SizeOf(Buff)) then
        begin
         Move(S[1], Buff, I - 1);
         Break;
        end;
      end;
    Result := StrToFloat(Buff);
  end;

  procedure RaiseException(const Value: String);
  begin
    if csDesigning in ComponentState then
      Application.MessageBox(PChar(Value), PChar(Name), mb_Ok or mb_IconStop)
    else
      raise Exception.Create(Value);
  end;

begin
  if FFileName <> Value then
   begin
    FFileName := Value;

    { clear all properties }
    FComments := '';
    FCompanyName := '';
    FFileDescription := '';
    FFileFlags := 0;
    FFileFlagsMask := 0;
    FFileMajorVersion := 0;
    FFileMinorVersion := 0;
    FFileVersion := '';
    FFileVersionFloat := 0;
    FInternalName := '';
    FLanguageCount := 0;
    FLanguageName := '';
    FLegalCopyright := '';
    FLegalTrademark := '';
    FOriginalFilename := '';
    FProductMajorVersion := 0;
    FProductMinorVersion := 0;
    FProductName := '';
    FProductVersion := '';
    FProductVersionFloat := 0;
    FTranslationValue := 0;

    if Value = '' then Exit;

    TrSize := 0;
    Size := GetFileVersionInfoSize(StrPCopy(TempStr, FFileName), Handle);
    if Size = 0 then
     begin
      Error := GetLastError;
      if Error = ERROR_RESOURCE_TYPE_NOT_FOUND then
        RaiseException(NoVerInfo)
      else
       if Error = 0 then
         RaiseException(GetInfoFail);
      Exit;
     end;

    { Allocate some memory and get version info block. }
    GetMem(Data, Size);
    Res := GetFileVersionInfo(TempStr, Handle, Size, Data);
    Trans  := nil;
    try
      if not Res then
       begin
        RaiseException(GetInfoFail);
        Exit;
       end;

      { Get the translation value. We need it to get the version info. }
      Res := VerQueryValue(Data, '\VarFileInfo\Translation', Buffer, Bytes);
      if not Res then
       begin
        RaiseException(GetInfoFail);
        Exit;
       end; 
      TrSize := Bytes;
      GetMem(Trans, TrSize);
      Move(Buffer^, Trans^, TrSize);
      FTranslationValue := LongInt(Trans^);
      FLanguageCount := Bytes div SizeOf(TVerTranslation);
      VerLanguageName(Trans^.Language, LangBuff, SizeOf(LangBuff));
      FLanguageName := StrPas(LangBuff);

      { Build a base string including the translation value. }
      BaseStr := Format('StringFileInfo\%.4x%.4x\', [Trans^.Language, Trans^.CharSet]);

      { Get the fixed version info. }
      { '\' is used to get the root block. }
      Res := VerQueryValue(Data, '\', Pointer(FixedInfo), Bytes);
      if not Res then
       begin
        RaiseException(GetInfoFail);
        Exit;
       end; 

      with FixedInfo^ do
       begin
        FFileMajorVersion := dwFileVersionMS;
        FFileMinorVersion := dwFileVersionLS;

        { preparing 16-bit values }
        FFileVerMajor := HiWord(FFileMajorVersion);
        FFileVerMinor := LoWord(FFileMajorVersion);
        FFileVerRelease := HiWord(FFileMinorVersion);
        FFileVerBuild := LoWord(FFileMinorVersion);

        FProductMajorVersion := dwProductVersionMS;
        FProductMinorVersion := dwProductVersionLS;
        FFileFlagsMask := dwFileFlagsMask;
        FFileFlags := dwFileFlags;
       end;

      { Comments }
      InfoStr := BaseStr + 'Comments';
      Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
      if Res and (Bytes <> 0) then
        FComments := StrPas(PChar(Buffer))
      else
        FComments := '';

      { CompanyName }
      InfoStr := BaseStr + 'CompanyName';
      Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
      if Res and (Bytes <> 0) then
        FCompanyName := StrPas(PChar(Buffer))
      else
        FCompanyName := '';

      { FileDescription }
      InfoStr := BaseStr + 'FileDescription';
      Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
      if Res and (Bytes <> 0) then
        FFileDescription := StrPas(PChar(Buffer))
      else
        FFileDescription := '';

      { FileVersion }
      InfoStr := BaseStr + 'FileVersion';
      Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
      if Res and (Bytes <> 0) then
       begin
        FFileVersion := StrPas(PChar(Buffer));
        { First try to convert the version number to a float as-is. }
        Val(FFileVersion, FFileVersionFloat, ErrCode);
        if ErrCode <> 0 then
          { Failed. Create the float with the local MakeFloat function. }
          try
            FFileVersionFloat := MakeFloat(FFileVersion);
          except
            FFileVersionFloat := 0;
          end;
       end
      else
       begin
        FFileVersion := '';
        FFileVersionFloat := 0;
       end;

       { InternalName }
       InfoStr := BaseStr + 'InternalName';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
         FInternalName := StrPas(PChar(Buffer))
       else
         FInternalName := '';

       { LegalCopyright }
       InfoStr := BaseStr + 'LegalCopyright';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
         FLegalCopyright := StrPas(PChar(Buffer))
       else
         FLegalCopyright := '';

       { LegalTrademarks }
       InfoStr := BaseStr + 'LegalTrademarks';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
         FLegalTrademark := StrPas(PChar(Buffer))
       else
         FLegalTrademark := '';

       { OriginalFilename }
       InfoStr := BaseStr + 'OriginalFilename';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
         FOriginalFilename := StrPas(PChar(Buffer))
       else
         FOriginalFilename := '';

       { ProductName }
       InfoStr := BaseStr + 'ProductName';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
         FProductName := StrPas(PChar(Buffer))
       else
         FProductName := '';

       { ProductVersion }
       InfoStr := BaseStr + 'ProductVersion';
       Res := VerQueryValue(Data, StrPCopy(TempStr, InfoStr), Buffer, Bytes);
       if Res and (Bytes <> 0) then
        begin
         FProductVersion := StrPas(PChar(Buffer));
         { First try to convert the product number to a float as-is. }
         Val(FProductVersion, FProductVersionFloat, ErrCode);
         if ErrCode <> 0 then
           { Failed. Create the float with the local MakeFloat function. }
           try
              FProductVersionFloat := MakeFloat(FProductVersion);
           except
              FProductVersionFloat := 0;
           end;
        end
       else
        begin
         FProductVersion := '';
         FProductVersionFloat := 0;
        end;
     finally
       FreeMem(Data, Size);
       FreeMem(Trans, TrSize);
     end;
   end;
end;

procedure TdcVersionInfo.SetNoneStr(const Value: String); begin {} end;
procedure TdcVersionInfo.SetNoneLong(Value: LongInt); begin {} end;
procedure TdcVersionInfo.SetNoneWord(Value: Word); begin {} end;
procedure TdcVersionInfo.SetNoneFloat(Value: Double); begin {} end;

end.
