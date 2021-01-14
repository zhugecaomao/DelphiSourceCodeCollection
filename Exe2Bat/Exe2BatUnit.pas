(*********************************************************
               By Hke Wwww.WuHansen.Com
       QQ:21764538   Email: wuhansen@wuhansen.com

Exe2Bat是挺早的一个小工具了(有ASM源码) 能把任意文件转化成bat
 可惜问题还是不少  我用Delphi写个吧(网上似乎有VC/VB的源码)
                  这个是实现的核心单元
          考试完庆祝下       2006.11.20 20:33
     多谢chinasf提供的思路 可以转化64K以上的文件了
                  2006.11.29 19:14
**********************************************************
      修正原版转化速度离奇慢的问题
      修正原版了NT下不能运行
      修正原版转化后Bat有误 (也不是什么大问题)

      修正了上个版本不能转化64K以上的文件的问题
**********************************************************)
unit Exe2BatUnit;

interface

uses
  Windows;
function Bat2exe(ExeName,ExePath,BatPath:string):boolean;

implementation





function Bat2exe(ExeName,ExePath,BatPath:string):boolean;

//Byte转Hex 用InttoHex转出来的不整齐影响美观 自己写个
  function DectoHex(a:integer):string;
    function Tostr(s:integer):string;
      begin
        if s<=9 then Result:=chr(ord('0')+s)
        else Result:=chr(ord('A')+s-10);
      end;
    var temp,b:integer;
    begin
      b:=a;
      Result:='';
      repeat
        temp:=a mod 16;
        a:=a div 16;
        Result:=Tostr(temp)+Result;
        if ((a<16) and(b>15)) then Result:=Tostr(a)+Result;
      until  (a<16) or (b<16);
      if Length(Result)=1 then Result:='0'+Result;
    end;

Function IntToStr(Code:LongWord):String;
begin
  Str(Code,Result);
end;

Const
  hke='>>hke';
  ECHO='Echo ';
  _63K=1024*63; //1024*63;
  _Tmp='.tmp';
Type
  PBuf=^Byte;
var
  hFile,BytesRead,Size,i,b,Offset,BufOffset: Cardinal;
  Count:integer;
  lpReOpenBuff:OFSTRUCT;
  F:text;
  Buf:pointer;
  BHex,TmpStr:String;
  //CanBreak:boolean;
procedure WritePart(PartStartBuf:pointer;PartSize,PartCount:LongWord);
Var j:LongWord;
begin
  Offset:=0; //设置段计数器为0
  i:=0;
  repeat
    write(f,ECHO+'e ',DectoHex(256+Offset*16),' '); //段地址
    inc(offset);
    for j:=0 to 15 do //逐行读取内存数据 用HEX保存
      begin
        b:=PBuf(LongWord(PartStartBuf)+i)^;
        BHex:=DectoHex(b);
        Write(f,BHex,' ');
        inc(i);
        if i=PartSize then break;
      end;
     writeln(f,hke,PartCount,_Tmp);// echo XXX >>hke 把XXX写入hke
  until i=PartSize;
  //下面调用Debug把它编译成文件
  writeln(f,echo,'rcx',hke,PartCount,_Tmp);
  writeln(f,echo,DecToHex(PartSize),hke,PartCount,_Tmp);
  writeln(f,echo,'n WHS',PartCount,_Tmp,hke,PartCount,_Tmp); //编译到WuHansen这个文件
  writeln(f,echo,'w',hke,PartCount,_Tmp);
  writeln(f,echo,'q',hke,PartCount,_Tmp);
  writeln(f,'debug<hke',PartCount,_Tmp,'>nul'); //编译哦
end;
begin
  result:=False;
  hFile := OpenFile(Pchar(ExePath),lpReOpenBuff,OF_READ);
  if (hFile = 0) or (hFile = $FFFFFFFF) then Exit; //文件不存在
  Size:=GetFileSize(hFile,nil);
  if Size=0 then Exit; //文件是空的
  Getmem(Buf,Size);
  ReadFile(hFile,PBuf(Buf)^,Size, BytesRead, nil);
  CloseHandle(hFile);
  ///////开始写文件///////
  assign(f,BatPath);
  rewrite(f);
  writeln(f,'@echo off');//关闭回显
  writeln(f,'rem By Hke Www.WuHansen.Com QQ:21764538');
  writeln(f,'echo By Hke Www.WuHansen.Com QQ:21764538');
  writeln(f,'echo Makeing file...');
  writeln(f,'echo Please Wait');
  if Size<=_63k then
    begin
      WritePart(Buf,Size,0);
      Count:=0;
    end
  else
    begin
      Count:=-1;
      Buf:=pointer(LongWord(buf)-_63K);
      BufOffset:=0;
      repeat
        Count:=Count+1;
        BufOffset:= BufOffset+_63K;
        if Size>= _63K then
          begin
            Size:=Size-_63K;
            WritePart(Pointer(LongWord(Buf)+BufOffset),_63K,Count)
          end;
      until Size<_63K;
      if  Size>0 then
        begin
          Count:=Count+1;
          WritePart(Pointer(LongWord(Buf)+BufOffset+_63K),Size,Count);
        end;
      Buf:=pointer(LongWord(buf)+_63K);
    end;
  TmpStr:='WHS0.tmp';
  if  Count>0 then
    For i:=1 to Count do  TmpStr:=TmpStr+'+WHS'+IntToStr(i)+_Tmp;

//  writeln(f,'ren WuHansen ',ExeName); //重命名
//  writeln(f,'del hke');  //删掉临时文件
  writeln(f,'Copy /b /y ',TmpStr,' ',ExeName);
  writeln(f,'del hke*',_Tmp);
  writeln(f,'del WHS*',_Tmp);
  writeln(f,'cls');
  writeln(f,'start ',ExeName);  //运行 直接ExeName Dos窗口会卡主直到Exe关闭
  close(f);
  FreeMem(Buf);
  result:=true;
end;

end.
 