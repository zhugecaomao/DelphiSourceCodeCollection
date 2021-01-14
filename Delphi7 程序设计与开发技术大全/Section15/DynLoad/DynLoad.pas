unit DynLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  THandle = integer;
  TAdd10 = function(number:integer):integer; stdCall;
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  temp:integer;
  handle:THandle ;
  FPointer: TFarProc;
  MyFunc : TAdd10 ;
begin
  try
    temp := StrToInt(Edit1.Text );
    handle := LoadLibrary('MyFirstDLL');                {装载DLL到内存}
    if handle <> 0 then
    try
      FPointer  := GetProcAddress(handle ,'Add10');     {获得函数的入口地址}
      if FPointer  <> nil then
      begin
        MyFunc := TAdd10(FPointer) ;
        temp := MyFunc(temp) ;                          {使用函数操作}
        Edit1.Text := IntToStr(temp);
      end;
    finally
      FreeLibrary(handle);                              {释放DLL}
    end
    else
      ShowMessage('未找到动态链接库MyFirstDLL.dll');
  except
    ShowMessage('请输入一个整数！');
  end;
end;

end.
