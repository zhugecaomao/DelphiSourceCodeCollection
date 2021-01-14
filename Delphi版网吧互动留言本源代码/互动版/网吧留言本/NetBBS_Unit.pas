unit NetBBS_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Buttons, Grids, DBGrids, StdCtrls, DBCtrls, ComCtrls,Inifiles,
  Registry,Shellapi, WinSkinData, GIFImg;

type
  TBBS = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    DBMemo3: TDBMemo;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    SpeedButton7: TSpeedButton;
    SkinData: TSkinData;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BBS: TBBS;

implementation

uses DataModule_Unit;

{$R *.dfm}

procedure TBBS.FormActivate(Sender: TObject);
var
  Config:Tinifile;
  FilePath,DataPath,BmpPath:string;
begin
  FilePath:=ExtractFilePath(paramstr(0))+'config.ini';
  Config:=Tinifile.Create(FilePath);

  DataPath := Config.ReadString('管理','数据库路径','');

  If Not FileExists(datapath) then
    ShowMessage('远程数据库路径设置不正确！')
  else
  begin
    NetBBS_DataModule.ADOConnection1.Connected:=false;
    NetBBS_DataModule.ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+pchar(DataPath)+';Persist Security Info=False';
    NetBBS_DataModule.ADOConnection1.Connected:=true;
    NetBBS_DataModule.ADOQuery1.open;
    NetBBS_DataModule.ADOQuery2.open;
  end;

  Config.Destroy;

  BmpPath:=ExtractFilePath(paramstr(0))+'Images\Button\';
  Image1.Picture.LoadFromFile(BmpPath+'Top.jpg');
end;

procedure TBBS.Image1Click(Sender: TObject);
var
  Config:Tinifile;
  FilePath,www:string;
begin
  FilePath:=ExtractFilePath(paramstr(0))+'config.ini';
  Config:=Tinifile.Create(FilePath);

  www := Config.ReadString('管理','横幅广告','http://www.lilyshow.com');

  ShellExecute(handle,'open',pchar(www),nil,nil,SW_SHOWMAXIMIZED);

  Config.Destroy;
end;

procedure TBBS.SpeedButton1Click(Sender: TObject);
var
  reg:TRegistry;
begin
  if  memo1.Text='' then
    showmessage('请认真填写留言信息，谢谢合作！')
  else
  begin
    NetBBS_DataModule.ADOQuery1.Edit;
    NetBBS_DataModule.ADOQuery1.Append;

    NetBBS_DataModule.ADOQuery1.FieldByName('客户留言').Value:=memo1.Text;
    NetBBS_DataModule.ADOQuery1.FieldByName('处理结果').Value:='等待答复';
    NetBBS_DataModule.ADOQuery1.FieldByName('留言时间').Value:=DateTimetoStr(now);

    reg:=TRegistry.Create;
    reg.RootKey:=HKEY_LOCAL_MACHINE;

    if reg.OpenKey('\SYSTEM\ControlSet001\Services\Tcpip\Parameters',True) then
    begin
      NetBBS_DataModule.ADOQuery1.FieldByName('机器编号').Value:=reg.ReadString('NV Hostname');
    end;
    NetBBS_DataModule.ADOQuery1.Post;

    NetBBS_DataModule.AdoQuery1.Close;
    NetBBS_DataModule.AdoQuery1.SQL.Clear;
    NetBBS_DataModule.AdoQuery1.SQL.Add('select * from 顾客留言 order by 留言编号 desc');
    NetBBS_DataModule.AdoQuery1.Open;
    
    memo1.Clear;

    Timer1.Enabled:=true;
    SpeedButton1.Enabled:=false;

    showmessage('留言成功！请耐心等待回复! 此后"3分钟"内严禁重复发言');
  end;
end;

procedure TBBS.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(handle,nil,pchar('http://soft.lilyshow.com'),nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TBBS.SpeedButton3Click(Sender: TObject);
var
  reg:TRegistry;
  name,FilePath:string;
  Config:Tinifile;
begin
  DBMemo3.SetFocus;
  DBMemo3.ReadOnly:=false;
  SpeedButton3.Enabled:=false;
  SpeedButton4.Enabled:=True;

    NetBBS_DataModule.ADOQuery2.Edit;
    NetBBS_DataModule.ADOQuery2.Append;
    NetBBS_DataModule.ADOQuery2.FieldByName('留言编号').Value:=NetBBS_DataModule.ADOQuery1.FieldByName('留言编号').Value;
    NetBBS_DataModule.ADOQuery2.FieldByName('回复信息').Value:=DBmemo3.Text;
    NetBBS_DataModule.ADOQuery2.FieldByName('留言时间').Value:=DateTimetoStr(now);

    reg:=TRegistry.Create;
    reg.RootKey:=HKEY_LOCAL_MACHINE;

    if reg.OpenKey('\SYSTEM\ControlSet001\Services\Tcpip\Parameters',True) then
    begin
      NetBBS_DataModule.ADOQuery2.FieldByName('机器编号').Value:=reg.ReadString('NV Hostname');
    end;
end;

procedure TBBS.SpeedButton4Click(Sender: TObject);
begin
  if  DBmemo3.Text='' then
    showmessage('请认真填写留言信息，谢谢合作！')
  else
  begin
    NetBBS_DataModule.ADOQuery2.Edit;
    NetBBS_DataModule.ADOQuery2.FieldByName('回复楼层').Value:=NetBBS_DataModule.ADOQuery2.RecordCount+1;
    NetBBS_DataModule.ADOQuery2.Post;

    NetBBS_DataModule.AdoQuery2.Close;
    NetBBS_DataModule.AdoQuery2.SQL.Clear;
    NetBBS_DataModule.AdoQuery2.SQL.Add('select * from 顾客回复 where 留言编号=:留言编号 order by 回复楼层 desc');
    NetBBS_DataModule.AdoQuery2.Open;

    SpeedButton4.Enabled:=false;
    Timer2.Enabled:=true;

    showmessage('回帖成功！此后"10秒"内严禁重复回帖');
  end;
end;

procedure TBBS.SpeedButton5Click(Sender: TObject);
var
  reg:TRegistry;
  name,FilePath:string;
  Config:Tinifile;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;

  FilePath:=ExtractFilePath(paramstr(0))+'config.ini';
  Config:=Tinifile.Create(FilePath);

  if reg.OpenKey('\SYSTEM\ControlSet001\Services\Tcpip\Parameters',True) then
  begin
    name:=reg.ReadString('NV Hostname');
    if  name = Config.ReadString('管理','服务器名','server') then
    begin
      showmessage('身份确认完毕，进入管理模式');
      DBMemo2.ReadOnly:=false;

      SpeedButton6.Visible:=true;
      SpeedButton6.Enabled:=true;
      SpeedButton7.Visible:=true;
      SpeedButton7.Enabled:=true;

      //进入管理模式后停止刷新，防止输入到一半后消失
      Timer3.Enabled:=false;
    end
    else  showmessage('抱歉，身份验证错误！');
  end;

  Config.Destroy;
end;

procedure TBBS.SpeedButton6Click(Sender: TObject);
begin
  NetBBS_DataModule.AdoQuery1.Edit;
  NetBBS_DataModule.AdoQuery1.FieldByName('处理结果').Value:='已处理';
  NetBBS_DataModule.AdoQuery1.Post;
  showmessage('回复成功！');
end;

procedure TBBS.SpeedButton7Click(Sender: TObject);
begin
  if MessageDlg('确定要删除此留言么？',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    NetBBS_DataModule.AdoQuery1.Edit;
    NetBBS_DataModule.AdoQuery1.Delete;
  end;
end;

procedure TBBS.Timer1Timer(Sender: TObject);
begin
  SpeedButton1.Enabled:=true;
end;

procedure TBBS.Timer2Timer(Sender: TObject);
begin
  SpeedButton3.Enabled:=true;
end;

procedure TBBS.Timer3Timer(Sender: TObject);
begin
  NetBBS_DataModule.AdoQuery1.Close;
  NetBBS_DataModule.AdoQuery1.Open;

  NetBBS_DataModule.AdoQuery2.Close;
  NetBBS_DataModule.AdoQuery2.Open;
end;

end.
