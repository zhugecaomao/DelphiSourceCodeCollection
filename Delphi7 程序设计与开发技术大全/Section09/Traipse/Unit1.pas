unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,ShellApi;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure WMDROPFILES(var Message: TWMDROPFILES);message WM_DROPFILES;    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  DragAcceptFiles(Form1.Handle, True);
end;

procedure TForm1.WMDROPFILES(var Message: TWMDROPFILES);
var
  NumFiles : longint;
  i : longint;
  buffer : array[0..255] of char;
begin
  NumFiles := DragQueryFile(Message.Drop,$FFFFFFFF,nil,0);
  //有多少文件被放下
  for i := 0 to (NumFiles - 1) do begin
  //循环处理放下的文件，此处只是显示其文件名
    DragQueryFile(Message.Drop,
                  i,
                  @buffer,
                  sizeof(buffer));
   //获取文件名，保存到buffer
    Form1.Memo1.Lines.Add(buffer);
  //显示文件名
  end;
  DragFinish(Message.Drop);
//拖放完毕，释放系统在传输文件名时分配的内存。
end;

end.
