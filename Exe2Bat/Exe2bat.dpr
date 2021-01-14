program Exe2bat;
(*********************************************************
               By Hke Wwww.WuHansen.Com
       QQ:21764538   Email: wuhansen@wuhansen.com

Exe2Bat是挺早的一个小工具了(有ASM源码) 能把任意文件转化成bat
 可惜问题还是不少  我用Delphi写个吧(网上似乎有VC/VB的源码)
                  这个是实现的Demo
          考试完庆祝下       2006.11.20 20:33
     多谢chinasf提供的思路 可以转化64K以上的文件了
                  2006.11.29 19:14
**********************************************************
      修正原版转化速度离奇慢的问题
      修正原版了NT下不能运行
      修正原版转化后Bat有误 (也不是什么大问题)

      修正了上个版本不能转化64K以上的文件的问题
**********************************************************)

{$APPTYPE CONSOLE}

uses
  Windows, SysUtils, Exe2BatUnit; //用了SysUtils编译出来会比较大

Var MyExeName,MyPath,ExeName:string;
begin
  Writeln('Exe2Bat By Hke (Www.WuHansen.Com) QQ:21764538');
  Writeln;
  if (paramstr(1)='') or (paramstr(2)='') then  //其中一个参数没填
    begin
      Writeln('You must run as that: Exe2Bat InputFileName OutputFileName');
      Writeln('Example: C:\>Exe2Bat Test.Exe Test.Bat');
    end
  else
    begin
      MyExeName:=Pchar(paramstr(0)); //paramstr(0)是自己的文件名
      MyPath:=ExtractFilePath(MyExeName);
      if MyPath[Length(MyPath)] <> '\' then MyPath:=MyPath+'\';
      ExeName:=paramstr(1);
      Writeln('Wait..');
      if Bat2Exe(ExeName,MyPath+ExeName,MyPath+paramstr(2)) then
        Writeln('Done')
      else
        Writeln('Error');  
    end;
end.
