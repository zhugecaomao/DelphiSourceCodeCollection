unit C_JfMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, C_JfDefine, C_ComBuf, DB, DBTables, ExtCtrls,
  OleCtrls, MSCommLib_TLB, XPMenu, IniFiles;

type
  TJfMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    B1: TMenuItem;
    D1: TMenuItem;
    N2: TMenuItem;
    F1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    MSComm1: TMSComm;
    XPMenu1: TXPMenu;
    N5: TMenuItem;
    procedure N17Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure DoOnIdle(Sender: TObject; var Done: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure MSComm1Comm(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N24Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    procedure MainInit;
  public
    { Public declarations }
  end;

var
  JfMainForm: TJfMainForm;
  ComBufThread: TComBufThread;
implementation

uses C_Flwh, C_Cswh, C_Bjsz, C_Condition, C_JfData, C_Tj, C_JfDel,
  C_PassWord, C_About, C_Xtsz;

{$R *.dfm}

procedure TJfMainForm.MainInit;
var
  IniFile: TIniFile;
begin
  APP_DIR := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  PORTNUM := IniFile.ReadInteger('PORT','ICPORTNUM',0);
  IniFile.Free;

  MSComm1.CommPort := PORTNUM+1;
  MSComm1.PortOpen := True;
  Memo1.Lines.Add('串口打开...');
  with JfData do
  begin
    tblBasicFmt.Open;
    tblNewData.Open;
    tblOldData.Open;
    tblDhf.Open;
    tblFare.Open;
    tblShFare.Open;
  end;
  InitFee;
  FillChar(BasBuf,BufLen-1,#0);
  FillChar(ComBuf,BufLen-1,#0);

  ComBufThread := TComBufThread.Create;
  ComBufThread.Resume;
  Memo1.Lines.Add('内部线程启动...');
  Application.OnIdle := DoOnIdle;
  Memo1.Lines.Add('主线程启动...');
end;

procedure TJfMainForm.DoOnIdle(Sender: TObject; var Done: Boolean);
begin
  MainWork;
  Done := True;
end;

procedure TJfMainForm.N17Click(Sender: TObject);
begin
  if IfRight then
    Flwh;
end;

procedure TJfMainForm.FormShow(Sender: TObject);
begin
  MainInit;
end;

procedure TJfMainForm.N18Click(Sender: TObject);
begin
  if IfRight then
    Cswh;
end;

procedure TJfMainForm.N22Click(Sender: TObject);
begin
  if IfRight then
    Bjsz;
end;

procedure TJfMainForm.Button1Click(Sender: TObject);
var
  s: string;
begin
  s := Edit1.Text;
  StrPCopy(ComBuf,#13+s);
end;

procedure TJfMainForm.N3Click(Sender: TObject);
begin
  QueryTelephone(1);
end;

procedure TJfMainForm.N4Click(Sender: TObject);
begin
  QueryTelephone(2);
end;

procedure TJfMainForm.N8Click(Sender: TObject);
begin
  Tj(1);
end;

procedure TJfMainForm.N9Click(Sender: TObject);
begin
  Tj(2);
end;

procedure TJfMainForm.N23Click(Sender: TObject);
begin
  if IfRight then
    JfDel;
end;

procedure TJfMainForm.N21Click(Sender: TObject);
begin
  if IfRight then
    Klsz;
end;

procedure TJfMainForm.MSComm1Comm(Sender: TObject);
begin
  StrPCopy(ComBuf,VarToStr(MSComm1.Input));
end;

procedure TJfMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComBufThread.Terminate;
  //ComBufThread.Free;
  with JfData do
  begin
    tblBasicFmt.Close;
    tblNewData.Close;
    tblOldData.Close;
    tblDhf.Close;
    tblFare.CLose;
    tblShFare.Close;
  end;
  MSComm1.PortOpen := False;
end;

procedure TJfMainForm.N24Click(Sender: TObject);
begin
  About;
end;

procedure TJfMainForm.N5Click(Sender: TObject);
begin
  Xtsz;
end;

end.
