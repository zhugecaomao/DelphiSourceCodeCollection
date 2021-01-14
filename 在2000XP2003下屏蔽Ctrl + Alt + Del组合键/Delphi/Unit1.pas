//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//作者    ：黎富平
//网上呢称：聪聪
//Home Page  ：http://www.soft520.com
//E-Mail  ：admin@soft520.com
//日期    ：2004-8-23
//功能    ：根据BCB_FANS(四大名捕之追杀令)在2000下屏蔽Ctrl + Alt + Del组合键的
//          技术，在Borland C++Builder 6.0 Patch4下编写远程线程注入的代码，封装
//          成DLL并输出EnabledKey和DisabledKey两个函数，使得可以在Delphi,VB等程
//          中可以使用，本程序在Windows Server 2003中文版平台下面测试通过
//输出格式：  EnabledKey: function (DllFileName: PChar): BOOL; stdcall;
//              DisabledKey: function (DllFileName: PChar): BOOL; stdcall;
//开发语言：Borland C++Builder 6.0 Patch4
//鸣谢    ：BCB_FANS(四大名捕之追杀令)
//版权    ：转载请注明原作者：）

//        ：以下为 BCB_FANS(四大名捕之追杀令)在2000下屏蔽Ctrl + Alt + Del组合键的
//          技术说明
//原理    ：采用远程线程注入技术，装载一个DLL到Winlogon进程，然后截获SAS窗口的窗
//          口过程，接管WM_HOTKEY消息，以达到屏蔽Ctrl + Alt + Del之目的。
//技术比较：关于在2000下面如何屏蔽Ctrl + Alt + Del组合键，一种常被提到的解决方法就
//	    是使用自己写的GINA去替换MSGINA.DLL，然后在WlxLoggedOnSAS里边直接返回
//	    WLX_SAS_ACTION_NONE。嘿嘿，说到底这并不是真正地屏蔽了这个组合键，只是
//	    直接返回WLX_SAS_ACTION_NONE时，Winlogon进程又自动从"Winlogon"桌面切换
//	    回原来的"Default"桌面了，而不是显示安全对话框，所以看起来被屏蔽了：），
//	    使用那种方法明显地看到桌面在闪烁！但是使用本文的方法时，你不会看到任
//	    何闪烁！
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    DllHandle: Cardinal;
    DllFileName: PChar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  EnabledKey: function (DllFileName: PChar): BOOL; stdcall;
  DisabledKey: function (DllFileName: PChar): BOOL; stdcall;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    DllHandle := LoadLibrary('RunDLL.dll');
    DllFileName := PChar(ExtractFilePath(Application.ExeName )+'SASHOOK.dll');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    FreeLibrary(DllHandle);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     if DllHandle <> 0 then
      begin
           EnabledKey := GetProcAddress(DllHandle, 'EnabledKey');
           if @EnabledKey <> nil then
           begin
             if EnabledKey(DllFileName) then
                ShowMessage('成功屏蔽');
           end;
        end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if DllHandle <> 0 then
      begin
           DisabledKey := GetProcAddress(DllHandle, 'DisabledKey');
           if @DisabledKey <> nil then
           begin
             if DisabledKey(DllFileName) then
                ShowMessage('解除成功');
           end;
        end;
end;

end.
