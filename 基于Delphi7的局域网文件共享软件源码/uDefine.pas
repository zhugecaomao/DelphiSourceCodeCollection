unit uDefine;

interface

uses windows;

type
  //请求类型
  TRequestType = (RT_Info,RT_Block);

  //请求消息
  TInfo = Record
    FileName: Array [0..255] of Char;
    Size: Integer;
    BlockPostion: Integer;
    BlockCount: Integer;
    FindData: TWin32FindData;
  end;

  //请求
  TRequest = Record
    RequestType: TRequestType;
    Info: TInfo;
  end;

  //文件块
  TBlock =  Record
    Data: Array [0..4095] of Byte;
    DataSize: Integer;
  end;

  //响应文件信息
  TResponseBlock = Record
    Info: TInfo;
    Block: TBlock;
  end;

  function GetBlockCount(Size:Integer;BlockSize:Integer):Integer;

implementation

function GetBlockCount(Size:Integer;BlockSize:Integer):Integer;
begin
  Result := (Size div BlockSize);
  if (Size mod BlockSize) > 0 then
    Inc(Result);
end;

end.
