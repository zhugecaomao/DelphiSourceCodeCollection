unit Configfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzForms, RzPanel, RzBckgnd, RzTabs, RzButton, StdCtrls, RzLabel,
  RzEdit, RzRadGrp, RzBtnEdt,ScktComp, RzShellDialogs, Mask, RzCmboBx;

type
  TfrmConfig = class(TForm)
    RzPanel1: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel2: TRzPanel;
    RzSeparator1: TRzSeparator;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzSeparator3: TRzSeparator;
    RzShapeButton1: TRzShapeButton;
    RzLabel1: TRzLabel;
    edIP: TRzEdit;
    RzLabel2: TRzLabel;
    edPort: TRzEdit;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    CkOption: TRzCheckGroup;
    RzBitBtn5: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    edPath: TRzButtonEdit;
    RzLabel3: TRzLabel;
    edID: TRzEdit;
    RzLabel4: TRzLabel;
    edName: TRzEdit;
    RzLabel5: TRzLabel;
    cbSex: TRzComboBox;
    RzLabel6: TRzLabel;
    UserImageList: TRzImageComboBox;
    RzBitBtn7: TRzBitBtn;
    RzLabel7: TRzLabel;
    edRemark: TRzMemo;
    RzBitBtn8: TRzBitBtn;
    RzLabel8: TRzLabel;
    edpassword: TRzEdit;
    RzLabel9: TRzLabel;
    edpassword1: TRzEdit;
    c: TClientSocket;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure edPathButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure cError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure cConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure cRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses mainfrm;

{$R *.DFM}

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmmain.InitData.OnTop then
    SetWindowPos(frmmain.handle,HWND_TOPMOST,frmmain.Left,frmmain.Top,0,0,swp_NoSize)
  else
    SetWindowPos(frmmain.handle,HWND_NOTOPMOST,frmmain.Left,frmmain.Top,0,0,swp_NoSize);
  Action:=cafree;
end;

procedure TfrmConfig.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to frmmain.ImageList3.Count -1 do
  begin
    UserImageList.AddItem('',i,0);
    UserImageList.ItemIndex :=0;
  end;
  TabSheet2.TabVisible:=(frmmain.Logined) and (not frmMain.LoseSession);
  RzBitBtn2.Enabled :=(not frmmain.Logined) and (not frmMain.LoseSession);

  with frmmain do
  if fileexists('jjyy.dat') then
  begin
    FileStream:=TFileStream.Create('jjyy.dat',fmOpenReadWrite);
    FileStream.Read(InitData,Sizeof(TInitData));
    edIP.Text:=InitData.IP;
    edPort.Text:=inttostr(InitData.Port);
    CkOption.ItemChecked[0]:=InitData.AutoSave ;
    CkOption.ItemChecked[1]:=InitData.OnTop ;
    CkOption.ItemChecked[2]:=InitData.ShowOnHint ;
    CkOption.ItemChecked[3]:=InitData.ShowOffHint ;
    CkOption.ItemChecked[4]:=InitData.PlayWave ;
    edPath.Text:=InitData.Path;
    FileStream.Free;
  end;
  if frmmain.Logined then
  begin
    edID.Text :=frmmain.myID;
    frmmain.Send('B','',frmmain.myID,'','','','','');
  end; 
end;

procedure TfrmConfig.FormActivate(Sender: TObject);
begin
  if TabSheet1.CanFocus then
    TabSheet1.SetFocus;
end;

procedure TfrmConfig.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmConfig.RzBitBtn1Click(Sender: TObject);
begin
  with frmmain do
  if fileexists('jjyy.dat') then
  begin
    FileStream:=TFileStream.Create('jjyy.dat',fmOpenReadWrite);
    InitData.IP:=edIP.Text;
    InitData.Port:=strtoint(edPort.Text);
    InitData.AutoSave:=CkOption.ItemChecked[0] ;
    InitData.OnTop:=CkOption.ItemChecked[1] ;
    InitData.ShowOnHint:=CkOption.ItemChecked[2] ;
    InitData.ShowOffHint:=CkOption.ItemChecked[3] ;
    InitData.PlayWave:=CkOption.ItemChecked[4] ;
    InitData.Path:=edPath.Text ;
    FileStream.Write(InitData,Sizeof(TInitData));
    FileStream.Free;
    if not frmmain.c.Active then
    begin
      frmmain.c.Address :=InitData.IP;
      frmmain.c.Port :=InitData.Port;
    end;
    frmmain.Information('修改成功！');
  end;

  if (not DirectoryExists(edPath.Text)) and (CkOption.ItemChecked[0]) then
    if not CreateDir(edPath.Text) then
      raise Exception.Create('不能创建'+edPath.Text);  
end;

procedure TfrmConfig.RzBitBtn2Click(Sender: TObject);
begin
  c.Active :=false;
  c.Port :=strtoint(edPort.Text);
  c.Address :=edIP.Text ;
  c.Active :=true;
  Screen.Cursor:=crHourGlass;
end;

procedure TfrmConfig.edPathButtonClick(Sender: TObject);
var
  Folder1:TRzSelectFolderDialog;
  s:string;
begin
  Folder1:=TRzSelectFolderDialog.Create(self);
  Folder1.Title :='选择路径';
  if Folder1.Execute then
  begin
    s :=Folder1.SelectedPathName ;
    if s[length(s)]<>'\' then
      s:=s+'\';
    edPath.Text:=s; 
  end;
  Folder1.Free;
end;

procedure TfrmConfig.FormDestroy(Sender: TObject);
begin
  frmConfig:=nil;
end;

procedure TfrmConfig.RzBitBtn7Click(Sender: TObject);
begin
  if (trim(edName.Text)<>'') and (trim(edpassword.Text)<>'')
      and (trim(edRemark.Text)<>'') then
  begin
    frmmain.Send('X',frmmain.myName,edName.Text,inttostr(cbSex.ItemIndex),edpassword.Text+'.'+edpassword1.Text,
            inttostr(UserImageList.ItemIndex),edRemark.Text,edID.Text);
    frmmain.myName:=edName.Text;
    Screen.Cursor:=crHourGlass;
  end
  else
    frmmain.Information('请输入完整的个人信息！');
end;

procedure TfrmConfig.cError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  case ErrorCode of
    10060:
      begin
        Screen.Cursor:=crdefault;
        frmmain.information('网络上不存在该IP地址请重新设置！');
        ErrorCode:=0;
      end;
    10061:
      begin
        Screen.Cursor:=crdefault;
        frmmain.information('服务器没有启动，请检查系统设置！');
        ErrorCode:=0;
      end;
  end;
end;

procedure TfrmConfig.cConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  c.Socket.SendText('M'+#255+'?'+#255+'?'+#255+'?'+#255+'?'+#255+'?'+#255+'?'+#255+'?');
end;

procedure TfrmConfig.cRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  Screen.Cursor:=crdefault;
  frmmain.information('测试成功！');
  c.Close; 
end;

end.
