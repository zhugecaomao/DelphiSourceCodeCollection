unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MMSystem;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    RetBuf:array[0..1024]of char;    //保存mciSendString函数获取的信息
    mciErr:MCIERROR;                 //保存mciSendString函数的返回值
    ComStr:array[0..256]of char;     //保存mciSendString函数的指令字符串
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  TrackNum,i:Integer;
begin
  //打开CD
  mciErr:=mciSendString('opencdaudio',RetBuf,1024,0);
  if mciErr=0 then
  begin
    //获取CD音轨数
    mciErr:=mciSendString('statuscdaudionumberoftracks',RetBuf,1024,0);
    if mciErr=0 then
    begin
      TrackNum:=StrToInt(RetBuf);
      Edit1.Text:=RetBuf;
      ListBox1.Clear;
      //设置时间格式
      mciErr:=mciSendString('setcdaudiotimeformatTMSF',nil,0,0);
      if mciErr=0 then
      begin
        for i:=1 to TrackNum do
        begin
          //获取每个音轨的时间长度
          StrFmt(ComStr,'statuscdaudiolengthtrack%d',[i]);
          mciErr:=mciSendString(ComStr,RetBuf,1024,0);
          if mciErr=0 then
          begin
            ListBox1.Items.Add(RetBuf);
            Button2.Enabled:=True;
          end;
        end;
      end;
    end
    else
      MessageBox(Handle,'获取CD轨道数失败。','错误',MB_OK+MB_ICONERROR);
  end
  else
    MessageBox(Handle,'CD没有准备好。','错误',MB_OK+MB_ICONERROR);
End;

procedure TForm1.Button2Click(Sender: TObject);
begin
  //判断是否是最后一首歌曲
  if(ListBox1.ItemIndex+1)=StrToInt(Edit1.Text)then
    //最后一首的情况
    StrFmt(ComStr,'playcdaudiofrom%dnotify',[ListBox1.ItemIndex+1])
  else//通常的情况
    StrFmt(ComStr,'playcdaudiofrom%dto%dnotify',
            [ListBox1.ItemIndex+1,ListBox1.ItemIndex+2]);
  //播放指定的曲目
  mciErr:=mciSendString(ComStr,RetBuf,1024,0);
  if mciErr<>0 then
    MessageBox(Handle,'播放失败。','错误',MB_OK+MB_ICONERROR)
  else
    Button3.Enabled:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //停止播放当前的曲目
  mciErr:=mciSendString('stopcdaudio',nil,0,Handle);
  if mciErr<>0 then
    MessageBox(Handle,'停止播放失败。','错误',MB_OK+MB_ICONERROR);
  Button3.Enabled:=False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //停止播放当前的曲目
  mciSendString('stopcdaudio',nil,0,Handle);
  //关闭CD
  mciSendString('closecdaudio',nil,0,Handle);
end;

end.
