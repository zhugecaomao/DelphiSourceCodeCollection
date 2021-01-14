unit Unit1;                      //单元文件名

interface                        //这是接口关键字，用它来标识文件所调用的单元文件

uses                             //程序用到的公共单元
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type                              //这里定义了程序所使用的组件，以及组件所对应的事件
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private                         //定义私有变量和私有过程
    { Private declarations }
  public                          //定义公共变量和公共过程
    { Public declarations }
  end;

var                               //定义程序使用的公共变量
  Form1: TForm1;

implementation                    //程序代码实现部分

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
ShowMessage('欢迎使用Delphi 7');  //显示欢迎提示框
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Close;									        	//退出应用程序
end;

end.
