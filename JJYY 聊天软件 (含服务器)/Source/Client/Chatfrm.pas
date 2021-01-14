unit Chatfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RzForms, RzPanel, RzBckgnd, RzButton, RzLabel,
  RzEdit, ComCtrls, ActnList,RichEdit,ShellApi, Magnetic,UserInfofrm,
  Psock, NMSTRM, RzPrgres,Russ;

type
  TfrmChat = class(TForm)
    RzPanel1: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel2: TRzPanel;
    RzSeparator1: TRzSeparator;
    btImage: TRzToolButton;
    LbHost: TRzLabel;
    LbAddress: TRzLabel;
    lbUser: TRzLabel;
    BText: TRzRichEdit;
    LText: TRzMemo;
    RzLabel1: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    RzShapeButton1: TRzShapeButton;
    RzShapeButton2: TRzShapeButton;
    ActionList1: TActionList;
    Action1: TAction;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    NMStrm1: TNMStrm;
    NMStrmServ1: TNMStrmServ;
    RzBitBtn4: TRzBitBtn;
    open1: TOpenDialog;
    save1: TSaveDialog;
    RzProgressBar1: TRzProgressBar;
    RzBitBtn5: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure RzShapeButton2Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure btImageClick(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure NMStrm1ConnectionFailed(Sender: TObject);
    procedure NMStrmServ1ClientContact(Sender: TObject);
    procedure NMStrmServ1MSG(Sender: TComponent; const sFrom: String;
      strm: TStream);
    procedure NMStrm1InvalidHost(var Handled: Boolean);
    procedure NMStrm1PacketSent(Sender: TObject);
    procedure NMStrm1MessageSent(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    foldWndProc:TWndMethod;
    frmUserInfo: TfrmUserInfo;
    procedure SendMsg(Command:string);
  protected
    procedure CreateParams(var Params:TCreateParams);override;
    procedure WMNOTIFY(var message:TMessage);
    procedure WMNCHitTest(var message: TMessage);//message WM_NCHITTEST;
    procedure WndProcMe(var message:Tmessage);
  public
    { Public declarations }
    Index:integer;
    UserHandle,ID,UserName,Remark,Address:string;
    Sex,ImageIndex:integer;
    Russfrm: TRussfrm;
    procedure SendFile;
    procedure CreateRussfrm;
  end;

implementation

uses mainfrm;

{$R *.DFM}

procedure TfrmChat.SendMsg(Command: string);
var
  HisText:string;
begin
  if trim(LText.Lines.Text)<>'' then
  begin
    frmmain.Send(Command,UserHandle,frmmain.MyName+'('+datetimetoStr(Now)+'): '+#13+'  '+LText.Text+#13,
                 lbUser.Caption,frmmain.myID,ID,'','');
    frmmain.DisplayText(BText.lines,LText.lines.Text,frmmain.myName);
    SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
    with frmmain do
    begin
      if InitData.AutoSave then
      begin
        HisText:=read(InitData.Path+'\f'+ID+'.dat');
        HisText:=HisText+#13+frmmain.myName+'('+datetimetoStr(Now)+'): '+#13+'  '+LText.Lines.Text;
        SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
        write(InitData.Path+'\f'+ID+'.dat',HisText);
      end;
    end;
    LText.Clear ;
  end
  else
    frmmain.Information('对不起，你不能发送空消息！');
  LText.SetFocus;
end;

procedure TfrmChat.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP or WS_SYSMENU or WS_MINIMIZEBOX;
  Params.WndParent :=GetDesktopWindow;
end;

procedure TfrmChat.FormShow(Sender: TObject);
begin
  LText.SetFocus ;
end;

procedure TfrmChat.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not RzBitBtn4.Enabled then
  begin
    if MessageBox(0, '正在进行文件传输，是否关闭？', '提示',
       MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON2)=mrOk then
    begin
      NMStrm1.Cancel ;
      NMStrm1.Disconnect ;
      frmmain.Send('N',frmmain.myHandle,frmmain.myName,frmmain.myID,UserHandle,'','','');
    end
    else
      abort;
  end;
end;

procedure TfrmChat.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmChat.RzShapeButton2Click(Sender: TObject);
begin
  CloseWindow(handle);
end;

procedure TfrmChat.RzBitBtn2Click(Sender: TObject);
begin
  SendMsg('A');
end;

procedure TfrmChat.RzBitBtn1Click(Sender: TObject);
begin
  SendMsg('T');
end;

procedure TfrmChat.FormCreate(Sender: TObject);
var
  mask: Word;
begin
  mask := SendMessage(BText.Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(BText.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
  SendMessage(BText.Handle, EM_AUTOURLDETECT, Integer(True), 0);
  foldWndProc:=RzPanel2.WindowProc;
  RzPanel2.WindowProc:=WndProcMe;
end;

procedure TfrmChat.WMNCHitTest(var message:TMessage);
var
  pt:TPoint;
begin
  Inherited ;
  pt:=Point(TWMNCHitTest(message).XPos,TWMNCHitTest(message).YPos);
  pt:=ScreenToClient(pt);
  if (pt.x<5) and (pt.y<5) then message.Result:=htTopLeft
  else if (pt.x>Width-5) and (pt.y<5) then message.Result:=htTopRight
  else if (pt.x>Width-5) and (pt.y>Height-5) then message.Result:=htBottomRight
  else if (pt.x<5) and (pt.y>Height-5) then message.Result:=htBottomLeft
  else if (pt.x<5) then message.Result:=htLeft
  else if (pt.y<5) then message.Result:=htTop
  else if (pt.x>Width-5) then message.Result:=htRight
  else if (pt.y>Height-5) then message.Result:=htBottom;
end;

procedure TfrmChat.WMNOTIFY(var message: TMessage);
var
  p: TENLink;
  strURL: string;
begin
  if (Message.Msg = WM_NOTIFY) then
  begin
    if (PNMHDR(Message.lParam).code = EN_LINK) then
    begin
      p := TENLink(Pointer(TWMNotify(Message).NMHdr)^);
      if (p.Msg = WM_LBUTTONDOWN) then
      begin
        SendMessage(BText.Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
        strURL := BText.SelText;
        ShellExecute(self.Handle, 'open', PChar(strURL),nil,nil,SW_SHOWNORMAL);
      end;
    end;
  end;
end;

procedure TfrmChat.WndProcMe(var message: Tmessage);
begin
  case message.Msg of
    WM_NOTIFY:WMNOTIFY(message);
    //WM_NCHITTEST:WMNCHitTest(message);
  else
    foldWndProc(message);
  end;
end;

procedure TfrmChat.RzBitBtn3Click(Sender: TObject);
begin
  BText.Text:=frmmain.read(frmmain.InitData.Path+'\f'+ID+'.dat');
end;

procedure TfrmChat.btImageClick(Sender: TObject);
begin
  frmUserInfo:=TfrmUserInfo.Create(self);
  frmUserInfo.edID.Text :=ID;
  frmUserInfo.edName.Text :=UserName;
  frmUserInfo.cbSex.ItemIndex :=Sex;
  frmUserInfo.UserImageList.ItemIndex :=ImageIndex;
  frmUserInfo.edRemark.Text :=Remark;
  frmUserInfo.ShowModal;
end;

procedure TfrmChat.RzBitBtn4Click(Sender: TObject);
begin
  if frmmain.Receive or frmmain.Sent then//只是检测自己的端口被占，未检测对方的
  begin
    frmmain.DisplayText(BText.Lines,'文件传输端口被占，稍后再试...','系统消息');
    SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
    abort;
  end;

  if open1.Execute then
  begin
    frmmain.Sent :=true;
    frmmain.Send('S',UserHandle,frmmain.myName,frmmain.myHandle,frmmain.myID,ID,'','');
    frmmain.DisplayText(BText.Lines,'正等待对方接收文件,请不要关闭...','系统消息');
    SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
  end;
end;

procedure TfrmChat.NMStrm1ConnectionFailed(Sender: TObject);
begin
  frmmain.Information('连接用户主机失败！');
end;

procedure TfrmChat.NMStrmServ1ClientContact(Sender: TObject);

begin
  NMStrmServ1.TimeOut := 90000;
end;

procedure TfrmChat.NMStrmServ1MSG(Sender: TComponent; const sFrom: String;
  strm: TStream);
var
  MyFStream: TFileStream;
begin
  frmMain.Receive:=false;
  if MessageBox(0, '文件传输完毕，是否保存？', '提示',
       MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON2)=mrOk then
  begin
    save1.FileName:=sFrom;
    if save1.Execute then
    begin
      MyFStream := TFileStream.Create(save1.FileName, fmCreate);
      try
        MyFStream.CopyFrom(strm, strm.size);
      finally
        MyFStream.Free ;
      end;
    end;
  end;
end;

procedure TfrmChat.NMStrm1InvalidHost(var Handled: Boolean);
begin
  frmmain.Information('连接用户主机失败！');
end;

procedure TfrmChat.NMStrm1PacketSent(Sender: TObject);
begin
  RzProgressBar1.Percent :=(NMStrm1.BytesSent*100) div NMStrm1.BytesTotal;
end;

procedure TfrmChat.NMStrm1MessageSent(Sender: TObject);
begin
  RzProgressBar1.Visible :=false;
  RzBitBtn4.Enabled :=true;
end;

procedure TfrmChat.SendFile;
var
  FileStream:TFileStream;
begin
  FileStream:=TFileStream.Create(Open1.FileName, fmOpenRead);
  try
    RzProgressBar1.Visible:=true;
    RzBitBtn4.Enabled :=false;
    NMStrm1.Host :=Address ;
    NMStrm1.FromName :=extractfileName(Open1.FileName);
    NMStrm1.PostIt(FileStream);
    frmmain.Send('T',UserHandle,datetimetoStr(Now)+#13+'系统消息: 已接收文件'+NMStrm1.FromName+#13,lbUser.Caption,frmmain.myID,ID,'1','');
    frmmain.DisplayText(BText.Lines,'已发送文件'+NMStrm1.FromName,'系统消息');
    SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
  finally
    FileStream.Free ;
    frmmain.Sent :=false;
  end;
end;

procedure TfrmChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Russfrm) then
  begin
    Russfrm.Close;
  end;
  Action:=cafree;
  frmMain.frmChat[index]:=nil;
end;

procedure TfrmChat.RzBitBtn5Click(Sender: TObject);
begin
  frmmain.Send('I',UserHandle,frmmain.myName,frmmain.myHandle,frmmain.myID,ID,'','');
  frmmain.DisplayText(BText.Lines,'正在与对方联机...','系统消息');
  SendMessage(BText.Handle,EM_SCROLL,SB_BOTTOM,0);
  RzBitBtn5.Enabled :=false;  
end;

procedure TfrmChat.CreateRussfrm;
begin
  if not assigned(Russfrm) then
    Russfrm:=TRussfrm.Create(nil);
  Russfrm.UserHandle :=self.UserHandle;
  Russfrm.UserID :=self.ID;
  Russfrm.index :=self.Index;
  Russfrm.Init;
  Russfrm.show;
end;

end.
