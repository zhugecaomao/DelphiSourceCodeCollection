unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const
  WM_DATA = WM_USER + 1024;      //自定义消息
type
  PShareMem = ^TShareMem;
  TShareMem = record
    Data: array[0..255] of char;  //共享内存，注意要与发送数据端的定义相同
  end;
  TMyForm = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getShareInfo(var Msg: TMessage); message WM_DATA; {处理WM_DATA}
  end;

var
  MyForm: TMyForm;
  PShare: PShareMem;
  MapHandle: THandle;

implementation

{$R *.DFM}

procedure TMyForm.getShareInfo(var Msg: TMessage); {处理WM_DATA}
begin
  if msg.LParam=1 then {是自定义的消息参数}
    Memo1.Lines.Add(PShare^.Data);
end;

procedure TMyForm.FormCreate(Sender: TObject);
begin
  MapHandle := OpenFileMapping(FILE_MAP_WRITE, {获取完全访问映射文件}
    False, {不可继承的}
    pchar('Map Name')); {映射文件名字}
  if MapHandle = 0 then
  begin
    ShowMessage('不能定位内存映射文件块！');
    Halt;
  end;
  PShare := PShareMem(MapViewOfFile(MapHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0));
  if PShare = nil then
  begin
    CloseHandle(MapHandle);
    ShowMessage('Can''t View Memory Map');
    Application.Terminate;
    Exit;
  end;
  FillChar(PShare^, SizeOf(TShareMem), 0);
end;

procedure TMyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseHandle(MapHandle);
end;

end.

