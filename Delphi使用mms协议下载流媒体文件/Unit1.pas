unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MMS, AppEvnts, ComCtrls, UnitMMSTask, Unit2;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    edtHost: TEdit;
    edtPort: TEdit;
    btnDownLoad: TButton;
    btnDisConnect: TButton;
    btnClear: TButton;
    Memo1: TMemo;
    edtDestFile: TEdit;
    btnTest: TButton;
    edtSourceFile: TEdit;
    StatusBar1: TStatusBar;
    edtStartPacketNO: TEdit;
    Timer1: TTimer;
    procedure btnClearClick(Sender: TObject);
    procedure btnDownLoadClick(Sender: TObject);
    procedure btnDisConnectClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MyMMS: TMMSThread;
  MMSTask: TMMSTaskThread;
implementation

{$R *.dfm}

procedure TForm1.btnClearClick(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.btnDownLoadClick(Sender: TObject);
begin
  MyMMS := TMMSThread.Create(Memo1,
                             edtHost.Text,
                             StrToInt(edtPort.Text),
                             edtSourceFile.Text,
                             edtDestFile.Text,
                             StrToInt(edtStartPacketNO.Text));
  MyMMS.Resume;
end;

procedure TForm1.btnDisConnectClick(Sender: TObject);
begin
  MyMMS.bTerminate := True;
end;


procedure TForm1.btnTestClick(Sender: TObject);
begin
  MMSTask := TMMSTaskThread.Create(edtHost.Text,
                                   StrToInt(edtPort.Text),
                                   edtSourceFile.Text,
                                   edtDestFile.Text,
                                   2);
  Timer1.Enabled := True;                                   
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//
end;

end.
