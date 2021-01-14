unit ZipEngine;
{
 ZIP压缩引擎接口 v1.0
 by binjian 2007.6.24
}
interface
Function ZipFile(SrcPathName{欲压缩}, ZipFileName: string; OverWrite: Boolean;
  IsDir: Boolean; sPwd: string): Boolean;
Function UnZipFile(DesPathName,ZipFileName,sPwd:string):Boolean;
implementation
uses
  SysUtils,Classes,Vclzip,VclUnzip;
Function UnZipFile;
begin
  Result := false;
  if (not DirectoryExists(DesPathName)) then
  MkDir(DesPathName);
  if IOResult <> 0 then Exit;
  if not FileExists(ZipFileName) then Exit;
  with Tvclunzip.Create(nil) do
  try
  try
  Password := sPwd;
  DoProcessMessages := True;
  ZipName := ZipFileName;
  ReadZip;
  if Count = 0 then Abort; // 没有文件的情况退出
    DestDir := DesPathName;
    DoAll := True;
    RecreateDirs := True;
   if UnZip=Count then Result:=true else Result:=false;
  except
   Result := false;
  end;
  finally
    Free;
  end;
end;
Function ZipFile;
     {压缩引擎动态调用}
var
  VCLZip: TVCLZip;
  ZFileList: TStringList;
begin
  Result := False;
  ZFileList := TStringList.Create;
  VCLZip := TVCLZip.Create(nil);
  try
    if IsDir and (not DirectoryExists(SrcPathName)) then
      MkDir(SrcPathName);
    ZFileList.Text := SrcPathName;
    with VCLZip do
    try
      Password := sPwd;
      DoProcessMessages := True;
      DoAll := True;
      if OverWrite then
      begin
        OverwriteMode := Always;
        ZipAction := zaReplace;
      end else begin
        OverwriteMode := Never;
        ZipAction := zaUpdate;
      end;
      FlushFilesOnClose := True;
      if IsDir then
        RootDir := SrcPathName
      else
        RootDir := ExtractFilePath(SrcPathName);
      FilesList.Clear;
      if IsDir then
        FilesList.Add('*.*')
      else
        FilesList.Assign(ZFileList);
      RelativePaths := True;
      ZipName := ZipFileName;
      Zip;
      Result := True;
    except
      Result := False;
    end;
  finally
    VCLZip.Free;
    ZFileList.Free;
  end;
end;
end.
 