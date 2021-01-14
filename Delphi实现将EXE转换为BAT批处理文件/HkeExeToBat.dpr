{ KOL MCK } // Do not remove this line!
(*********************************************************
               By Hke Wwww.WuHansen.Com
       QQ:21764538   Email: wuhansen@wuhansen.com

Exe2Bat是挺早的一个小工具了(有ASM源码) 能把任意文件转化成bat
 可惜问题还是不少  我用Delphi写个吧(网上似乎有VC/VB的源码)
                  这个是实现的核心单元
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
program HkeExeToBat;

uses
KOL,
  MainFormUnit in 'MainFormUnit.pas' {Form1};

//{$R *.res}

begin // PROGRAM START HERE -- Please do not remove this comment

{$IFDEF KOL_MCK} {$I HkeExeToBat_0.inc} {$ELSE}

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

{$ENDIF}

end.

