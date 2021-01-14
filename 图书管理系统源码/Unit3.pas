unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    int_databackup:integer;  //用来设置数据的备份或恢复
    bool_close:boolean;
    procedure my_databk_ProgressBar(sourcefilepath:string;destinationfilepath:string);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
//数据备份过程
procedure TForm3.my_databk_ProgressBar(sourcefilepath,
  destinationfilepath: string);
var
  fromf,tof:file of byte;
  buffer : array[0..64] of char;
  numread:integer;
  filelength :longint;
  opendialog1:Topendialog;
  savedialog1:Tsavedialog;
begin
  assignfile(fromf,sourcefilepath);
  reset(fromf);
  assignfile(tof,destinationfilepath);
  rewrite(tof);
  filelength:= filesize(fromf);
  with progressbar1 do
  begin
    min:=0;
    max:=filelength;
    while filelength > 0 do
    begin
      blockread(fromf,buffer[0],sizeof(buffer),numread);
      filelength := filelength - numread;
      blockwrite(tof,buffer[0],numread);
      position:=position + numread;
    end;
    closefile(fromf);
    closefile(tof);
  end;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if int_databackup=1 then   //   int_databackup=1  表示数据备份
  begin
    if progressbar1.Position=progressbar1.Max then
    begin
      timer1.Enabled:=false;
      label1.Caption:='数据备份成功！！';
      update;
      sleep(1000);
      progressbar1.Position:=0;
      close;
    end;
  end;
  if int_databackup=2 then   //   int_databackup=1  表示数据恢复
  begin
    if progressbar1.Position=progressbar1.Max then
    begin
      timer1.Enabled:=false;
      label1.Caption:='数据恢复成功！！';
      update;
      sleep(1000);
      progressbar1.Position:=0;
      bool_close:=true;
      close;
    end;
  end;
  if int_databackup=3 then   //   int_databackup=1  表示数据备份
  begin
    if progressbar1.Position=progressbar1.Max then
    begin
      timer1.Enabled:=false;
      label1.Caption:='数据备份成功！！';
      progressbar1.Position:=0;
      close;
    end;
  end;
end;

end.
