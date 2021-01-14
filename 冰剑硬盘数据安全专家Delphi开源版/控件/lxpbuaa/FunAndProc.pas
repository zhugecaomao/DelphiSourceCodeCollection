unit FunAndProc;

interface

  uses Windows, Classes, SysUtils;

const   
  DefaultPort = 5643;           //服务器缺省诊听端口
  KEY_Clt: Array[1..4] of String =      //从客户端发出以下令牌
    ('AskForFilesName',         //请求文件名
     'AskForFilesLength',       //请求文件长度
     'AskForFilesData',         //请求发送文件
     'WanttoDisConnect');       //文件发送完成，告知服务端连接可以关闭了
  KEY_Srv: Array[1..2] of String =      //从服务端发出以下令牌：
    ('Return1',         //后面跟的是所有文件名，文件名之间用FilesNameSepStr分隔
     'Return2');        //后面跟的是所有文件长度，文件长度之间用FilesLengthSepStr分隔
  FilesNameSepStr = '|';
  FilesLengthSepStr = ',';


function StringToStrings(SepStr: String; S: String): TStrings;

function StringsToString(SepStr: String; Strs: TStrings; GetFileName: Boolean = False): String;

function Get_ComputerName: String;

implementation

function StringToStrings(SepStr: String; S: String): TStrings;
var
  P: Integer;  
begin
  Result := TStringList.Create;
  P := Pos(SepStr, S);
  while P <> 0 do
  begin
    Result.Add(Copy(S, 1, P-1));
    Delete(S, 1, P-1+Length(SepStr));
    P := Pos(SepStr,S);
  end;
  Result.Add(S);
end;

function StringsToString(SepStr: String; Strs: TStrings; GetFileName: Boolean = False): String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Strs.Count-1 do
  if not GetFileName then
    Result := Result + SepStr + Strs[I]
  else
    Result := Result + SepStr + ExtractFileName(Strs[I]);
  Delete(Result, 1, Length(SepStr));
end;

function Get_ComputerName: String;
var
  iSize: LongWord;
  ComputerName: PChar;
begin
  iSize := MAX_COMPUTERNAME_LENGTH + 1;
  GetMem(ComputerName,iSize);
  GetComputerName(ComputerName,iSize);
  Result := ComputerName;
  FreeMem(ComputerName);
end;



end.
 