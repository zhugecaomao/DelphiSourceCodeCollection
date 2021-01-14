unit mainfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RzButton, ExtCtrls, RzPanel, RzBckgnd, RzGroupBar,ImgList,RzForms,StdCtrls,
  ScktComp,GeneralInf, RzLabel, RzTray,mmsystem,RzCommon, Magnetic,Logfrm,
  RegUser, Chatfrm, FileCtrl, Buttons,CoolMenuPro,Menus;


Const
  AllowNumber=10;
  UM_Destroy=WM_User+102;


type

  TInitData=Record
    IP:string[15];
    Port:integer;
    AutoSave:Boolean;
    OnTop:Boolean;
    ShowOnHint:Boolean;
    ShowOffHint:Boolean;
    PlayWave:Boolean;
    Path:string[255];
  end;

  TSession=Record
    Msg:string;
    Handle:string;
    Param1:string;
    Param2:string;
    Param3:string;
    Param4:string;
    Param5:string;
    Param6:string;
  end;

  TfrmMain = class(TForm)
    ImageList1: TImageList;
    RzPanel1: TRzPanel;
    GB: TRzGroupBar;
    GPLogin: TRzGroup;
    GPFriend: TRzGroup;
    c: TClientSocket;
    Tray1: TRzTrayIcon;
    ImageList2: TImageList;
    RegIni1: TRzRegIniFile;
    Magnetic1: TMagnetic;
    RzLabel1: TRzLabel;
    RzShapeButton1: TRzShapeButton;
    ImageList3: TImageList;
    RzGroup1: TRzGroup;
    Timer1: TTimer;
    RzFormState1: TRzFormState;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure GPLoginItems2Click(Sender: TObject);
    procedure GPLoginItems0Click(Sender: TObject);
    procedure GPLoginItems1Click(Sender: TObject);
    procedure cError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure cRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Tray1LButtonDblClick(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure cConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure RzGroup1Items2Click(Sender: TObject);
    procedure RzGroup1Items3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure WMQueryEndSession(var Msg: TMessage);message WM_QueryEndSession;
    procedure MoveIn(var msg:Tmessage);message CM_MOUSEENTER;
    procedure MoveOut(var msg:Tmessage);message CM_MOUSELEAVE;
    function CreateChatFrm(ID:string;Index:integer;ExecGame:Boolean):TfrmChat;
    function FindFormByID(ID:string):integer;
    procedure CreateInitData;
    procedure UMDestroy(var Message : TMessage); message UM_Destroy;
    //function GetUserInfo(AUserName,ALogined,ASex,AHandle,AID:Pchar):AUserInfo;
  public
    { Public declarations }
    RecText:PPs;
    frmIndex:integer;//聊天对话框索引,唯一值
    UserInfo:PUserInfo;
    Logined,Registered:Boolean;
    FileStream:TFileStream;
    InitData:TInitData;
    hRes:THandle;
    PstrSound:Pchar;
    IsSrvStart:Boolean;
    LoseSession:Boolean;
    Receive:Boolean;
    Sent:Boolean;

    myName,myID,myHandle,myHost,myAddress:string;
    mySex:byte;
    myImgIndex:integer;

    ChatUsersID,FIFOIndex:TStrings;
    frmChat:array of TfrmChat;
    procedure Send(Msg,Handle,Param1,Param2,Param3,Param4,Param5,Param6:string);
    procedure RefreshStates;
    procedure ItemClick(sender:Tobject);
    procedure MoreClick(sender:TObject);
    procedure MenuItemClick(sender:TObject);
    procedure UpDateUserState(User:TRZGroupItem;Name,Sex:string; Logined:Boolean);
    procedure GetmyIP(var Host,Address:string);
    procedure ShowChatFrm(ID:string);
    procedure Write(AfileName:string;var Text:string);
    function Read(AfileName:string):string;
    procedure Information(msg:string);
    procedure UpdateUserMenu(User:TCoolItem95;Name,Sex:string; Logined:Boolean);
    function GetTextID(Text: string; BreakSymbol: string = '.'): string;
    function GetTextName(Text: string; BreakSymbol: string = '.'): string;
    procedure DisplayText(Lines:TStrings;NewText,UserName:string);overload;
    procedure DisplayText(Lines:TStrings;NewText:string);overload;
    procedure GameExec(frm:TfrmChat;Index:integer;Flag,Style,extr,CommandText,Station,AUserHandle:string);
  end;

  TUserInfoList=function (AUserName,ALogined,ASex,AHandle,AID:Pchar):PUserInfo;stdcall;

var
  frmMain: TfrmMain;


procedure xx(n,s:string);

implementation

uses Configfrm, UserInfofrm, Mailfrm, Adminfrm, Infofrm, CoolMenu, Russ,
  PopMenufrm;


{$R *.DFM}
{$R Sound.RES}

procedure xx(n,s:string);
var
  Txtfile:TextFile;
begin
  Assignfile(Txtfile,n);
  if fileExists(n) then
    Append(Txtfile)
  else
    Rewrite(Txtfile);
  try
    writeln(Txtfile,s);
  finally
    closefile(Txtfile);
  end;
end;

procedure TfrmMain.GPLoginItems2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.GPLoginItems0Click(Sender: TObject);
begin
  frmLogin:=TfrmLogin.Create(application);
  frmLogin.ShowModal;
end;

procedure TfrmMain.GPLoginItems1Click(Sender: TObject);
var
  i:integer;
begin
  for i:=low(frmChat) to high(frmChat) do
    if Assigned(frmChat[i]) then
      frmChat[i].Close ;

  ChatUsersID.Clear;
  UserMenu.Clear;
  UserMenu.Height:=3; 
  GPFriend.Items.clear;
  GPFriend.Height:=50 ;
  Logined:=false;
  Registered:=false;
  if (not LoseSession) then
  begin
    send('C',myHandle,myName,inttostr(mySex),myID,myHost,myAddress,'');
  end;
  RefreshStates;
end;

procedure TfrmMain.Send(Msg, Handle, Param1, Param2, Param3, Param4,
  Param5, Param6: string);
var
  TmpStr:string;
begin
  if Msg='' then Msg:='?';
  if Handle='' then Handle:='?';
  if Param1='' then Param1:='?';
  if Param2='' then Param2:='?';
  if Param3='' then Param3:='?';
  if Param4='' then Param4:='?';
  if Param5='' then Param5:='?';
  if Param6='' then Param6:='?';
  TmpStr:=Msg+#255+Handle+#255+Param1+#255+Param2+#255+Param3+#255+Param4+#255+Param5+#255+Param6;
  c.Socket.SendText(TmpStr);
end;

procedure TfrmMain.cError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Screen.Cursor:=crdefault;
  case ErrorCode of
    10053:
      begin
        c.Socket.Close ;
        information('你与服务器的连接已断开！');
        ErrorCode:=0;
      end;
    10060:
      begin
        if assigned(frmconfig) then
          if assigned(frmconfig.c) then
          begin
            frmconfig.c.Close;
            frmconfig.c.free;
          end;
        information('网络上不存在该IP地址请重新设置！');
        ErrorCode:=0;
      end;
    10061:
      begin
        if assigned(frmconfig) then
          if assigned(frmconfig.c) then
          begin
            frmconfig.c.Close;
            frmconfig.c.free;
          end;
        information('服务器没有启动，请检查系统设置！');
        IsSrvStart:=false;
        ErrorCode:=0;
      end;
  end;
end;

procedure TfrmMain.cRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Tmps,HisText:String;
  i:integer;
  x:TRZGroupItem;
  y:TCoolItem95;
  FunHandle:Thandle;
  UserInfoList:TUserInfoList;
  ID,UserHandle:string;//注：由于Session值随时都可能发生改变,用ID,UserHandle代替
  Session:TSession;
begin//注：由于Session在这个过程相当于全局变量，值随时都可能发生改变
  Tmps:=Socket.ReceiveText;
  RecText:=GetSession(Pchar(Tmps),7);//Pchar类型转换可能有问题
  Session.Msg:=strpas(RecText^[0]);
  Session.Handle:=strpas(RecText^[1]);
  Session.Param1:=strpas(RecText^[2]);
  Session.Param2:=strpas(RecText^[3]);
  Session.Param3:=strpas(RecText^[4]);
  Session.Param4:=strpas(RecText^[5]);
  Session.Param5:=strpas(RecText^[6]);
  Session.Param6:=strpas(RecText^[7]);
  if Session.Msg ='admin' then
  begin
    if not Assigned(frmAdmin) then
      frmAdmin:=TfrmAdmin.Create(self);
    DisplayText(frmAdmin.LText.Lines,Session.Param1);
    SendMessage(frmAdmin.LText.Handle,EM_SCROLL,SB_BOTTOM,0);
    frmAdmin.show;
    flashwindow(frmAdmin.Handle,true);

    if InitData.PlayWave then
      sndplaysound(pStrSound,snd_async or snd_memory);

    if Session.Handle ='1' then
      LoseSession:=true;
  end;

  case Ord(Session.Msg[1]) of
    Ord('J')://中断游戏
      begin
        ID:=Session.Param1;
        frmIndex:=FindFormByID(ID);
        if assigned(frmChat[frmIndex]) then
        begin
          if assigned(frmChat[frmIndex].Russfrm) then
          begin
            frmChat[frmIndex].Russfrm.sSec.TextOut('对方已下线',clRed);
            frmChat[frmIndex].Russfrm.GameConnected:=False;
          end;
        end;
      end;
    Ord('P'): //游戏
      begin
        ID:=Session.Param5;
        i:=FindFormByID(ID);
        if (i<>-1) and assigned(frmChat[i]) and assigned(frmChat[i].Russfrm) then
          GameExec(frmChat[i],i,Session.Param1,Session.Param2,Session.Param4,Session.Param6,Session.Param3,frmChat[i].Russfrm.UserHandle);
      end;
    Ord('K')://对方取消游戏
      begin
        ID:=Session.Param2;
        frmIndex:=FindFormByID(ID);
        frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
        frmChat[frmIndex].show;
        DisplayText(frmChat[frmIndex].BText.Lines,'对方取消了游戏...','系统消息');
      end;
    Ord('V')://对方接受游戏
      begin
        ID:=Session.Param1;
        frmIndex:=FindFormByID(ID);
        frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,true);
        frmChat[frmIndex].Show;
        //游戏窗体不能在此创建 要在获得用户信息之后再创建
        //frmChat[frmIndex].CreateRussfrm;
      end;
    Ord('I')://对方要求游戏  是否开始
      begin
        if Session.Param5='0' then
        begin
          ID:=Session.Param3;
          frmIndex:=FindFormByID(ID);
          if assigned(frmChat[frmIndex]) then
          begin
            DisplayText(frmChat[frmIndex].BText.Lines,frmChat[frmIndex].UserName+'已下线...','系统消息');
            SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
          end;
        end
        else
        begin
          if MessageBox(0,Pchar(Session.Param1+'要与你玩游戏，要开始吗？'), '提示', MB_ICONASTERISK or MB_OKCANCEL) = IDOK then
          begin
            ID:=Session.Param2;
            frmIndex:=FindFormByID(ID);
            frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,true);
            frmChat[frmIndex].show;
            frmChat[frmIndex].SendToBack;
            sleep(100);
            UserHandle:=Session.Handle;
            frmmain.Send('V',frmmain.myHandle,frmmain.myName,frmmain.myID,UserHandle,ID,'0','');
            //游戏窗体不能在此创建 要在获得用户信息之后再创建
            //frmChat[frmIndex].CreateRussfrm;
          end
          else
            frmmain.Send('K',frmmain.myHandle,frmmain.myName,frmmain.myID,Session.Param3,Session.Param4,'0','');
        end;
      end;
    Ord('D')://清除掉线用户
      begin
        Send('D',myHandle,'','','','','','');
      end;
    Ord('Y')://对方取消接收文件,可判断对方端口是否被占
      begin
        Sent :=false;
        ID:=Session.Param2;
        frmIndex:=FindFormByID(ID);
        frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
        frmChat[frmIndex].show;
        if Session.Param5 ='1' then
        begin
          DisplayText(frmChat[frmIndex].BText.Lines,'对方文件传输端口被占，稍后再试...','系统消息');
          SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
        end
        else
        begin
          DisplayText(frmChat[frmIndex].BText.Lines,'对方拒绝接收文件...','系统消息');
          SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
        end;
      end;
    Ord('N')://文件传输失败
    begin
      ID:=Session.Param1;
      frmIndex:=FindFormByID(ID);
      frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
      frmChat[frmIndex].RzBitBtn4.Enabled :=true;
      DisplayText(frmChat[frmIndex].BText.Lines,'文件传输失败...','系统消息');
      SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
      frmChat[frmIndex].show;
      Receive:=false;
    end;
    Ord('C')://对方已确认要接收文件
      begin
        ID:=Session.Param2;
        frmIndex:=FindFormByID(ID);
        if assigned(frmChat[frmIndex]) then
        begin
          DisplayText(frmChat[frmIndex].BText.Lines,'对方正在接收文件,请不要关闭...','系统消息');
          SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
          frmChat[frmIndex].show;
          frmChat[frmIndex].SendFile ;
        end
        else
        begin
          frmChat[frmIndex]:=CreateChatFrm(Session.Param2,frmIndex,false);
          DisplayText(frmChat[frmIndex].BText.Lines,'文件传输失败...','系统消息');
          SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
          frmChat[frmIndex].show;
          sleep(1);
          frmmain.Send('N',frmmain.myHandle,frmmain.myName,frmmain.myID,Session.Param3,'','','');
          Sent:=false;
        end;
      end;
    Ord('Q')://是否要接收文件
      begin
        if Receive or Sent then
          frmmain.Send('Y',frmmain.myHandle,frmmain.myName,frmmain.myID,Session.Param3,Session.Param4,'1','');
        if (not Receive) and (not Sent) then
        begin
          if MessageBox(0, Pchar(Session.Param1+'有文件传输给你，要接收吗？'), '提示',
            MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON2)=mrOk then
          begin
            ID:=Session.Param2;
            frmIndex:=FindFormByID(ID);
            frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
            frmChat[frmIndex].RzBitBtn4.Enabled :=false;
            DisplayText(frmChat[frmIndex].BText.Lines,'正接收文件,请不要关闭...','系统消息');
            SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
            frmChat[frmIndex].show;
            Receive:=true;
            //等窗体创建出来后，再发消息给对方确认
            frmmain.Send('O',frmmain.myHandle,frmmain.myName,Session.Handle,frmmain.myID,'','','');
          end
          else
          begin
            ID:=Session.Param2;
            frmIndex:=FindFormByID(ID);
            if UserInfo^[frmIndex].Logined<>'0' then
              frmmain.Send('Y',frmmain.myHandle,frmmain.myName,frmmain.myID,Session.Param3,Session.Param4,'0','');
          end;
        end;
      end;
    Ord('X')://修改成功
      begin
        Screen.Cursor:=crDefault;
        if Session.Param1 <>'Error' then
          information('修改成功！')
        else
          information('密码错误！')
      end;
    Ord('B')://取得本人信息
      begin
        myName:=Session.Param1;
        mySex:=strtoint(Session.Param4);
        myImgIndex:=strtoint(Session.Param3);
        if Assigned(frmConfig) then
        begin
          frmConfig.edRemark.Text:=Session.Param5;
          frmConfig.UserImageList.ItemIndex :=strtoint(Session.Param3);
          frmConfig.cbSex.ItemIndex :=strtoint(Session.Param4);
          frmConfig.edName.Text:=Session.Param1;
        end;
      end;
    Ord('U'): //取得聊天用户的IP,头象
      begin
        i:=ChatUsersID.IndexOf(Session.Param4);
        if (i>=0) and (i<AllowNumber)  then
        begin
          GPFriend.Items[i].Caption:=Session.Param5;
          GPFriend.Items[i].ImageIndex:=3+byte(strtoint(Session.Handle));
        end;
        StrPCopy(UserInfo^[frmIndex].UserName,Session.Param5);
        StrPCopy(UserInfo^[frmIndex].Sex,Session.Handle);

        frmchat[frmIndex].UserName :=UserInfo^[frmIndex].UserName;
        frmchat[frmIndex].Sex :=strtoint(UserInfo^[frmIndex].Sex);
        frmchat[frmIndex].Caption :=UserInfo^[frmIndex].UserName+'-对话';
        frmchat[frmIndex].LbHost.Update ;
        frmchat[frmIndex].LbHost.Caption :='主机名:'+Session.Param1 ;
        frmchat[frmIndex].LbAddress.Update ;
        frmchat[frmIndex].LbAddress.Caption :='IP地址:'+Session.Param2 ;
        frmchat[frmIndex].Address :=Session.Param2;
        frmchat[frmIndex].lbUser.Update ;
        frmchat[frmIndex].lbUser.Caption:='昵称:'+Session.Param5;
        frmchat[frmIndex].btImage.Update ;
        frmchat[frmIndex].btImage.Images :=ImageList3;
        frmchat[frmIndex].btImage.ImageIndex :=strtoint(Session.Param3);
        frmchat[frmIndex].btImage.DisabledIndex :=strtoint(Session.Param3);
        frmchat[frmIndex].ImageIndex :=frmchat[frmIndex].btImage.ImageIndex;
        frmchat[frmIndex].Remark :=Session.Param6 ;

        if not frmchat[frmIndex].RzBitBtn5.Enabled then
        begin
          frmChat[frmIndex].CreateRussfrm;//如果用户要进行游戏 则要在获得对方信息之后再创建
        end;
      end;

    Ord('T'),Ord('A')://客户交流
      begin
        try
          if Session.Param4='1' then//判断该用户是否还在线
          begin
            ID:=Session.Param3;
            frmIndex:=FindFormByID(ID);
            if not assigned(frmChat[frmIndex]) then
            begin
              Tray1.Animate :=true;
              Timer1.Enabled :=true;
              if FIFOIndex.IndexOf(inttostr(frmIndex))<0 then
                FIFOIndex.Add(inttostr(frmIndex));
              frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
            end
            else
            begin
              flashwindow(frmChat[frmIndex].handle,true);
            end;

            DisplayText(frmChat[frmIndex].BText.Lines,Session.Param1);
            SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
            if not frmChat[frmIndex].RzBitBtn4.Enabled then
              frmChat[frmIndex].RzBitBtn4.Enabled:=true;

            if InitData.AutoSave then
            begin
              HisText:=read(InitData.Path+'\f'+Session.Param3+'.dat');
              HisText:=trim(HisText+#13+Session.Param1);
              SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
              write(InitData.Path+'\f'+Session.Param3+'.dat',HisText);
            end;

            if InitData.PlayWave then
              sndplaysound(pStrSound,snd_async or snd_Memory);
          end
          else
          begin
            ID:=Session.Param5;
            frmIndex:=FindFormByID(ID);
            if assigned(frmChat[frmIndex]) then
            begin
              DisplayText(frmChat[frmIndex].BText.Lines,frmChat[frmIndex].UserName+'已下线...','系统消息');
              SendMessage(frmChat[frmIndex].BText.Handle,EM_SCROLL,SB_BOTTOM,0);
            end;
          end;
        except
          Send('D',myHandle,'','','','','','');
          raise;
        end;
      end;

    Ord('F')://用户登录失败
      begin
       information(Session.Param1);
       Screen.Cursor :=crDefault;
      end;

    Ord('L')://用户登录成功,取得用户列表
      begin
        Logined:=True;
        myName:=copy(Session.Param5,1,length(Session.Param5)-1);
        mySex:=strtoint(Session.Param5[length(Session.Param5)]);
        myHandle:=Session.Handle;
        Tray1.Hint :='JJYY-'+myName;

        RegIni1.WriteString('UserID',myID,myName);
        if frmLogin<>nil then
          myID:=frmLogin.cbUserID.Text;

        FunHandle:=LoadLibrary('General.dll');
        if FunHandle<>0 then
        begin
          @UserInfoList:=GetProcAddress(FunHandle,'GetUserInfo');
          if @UserInfoList<>nil then
          begin
            new(UserInfo);
            UserInfo:=UserInfoList(RecText^[2],RecText^[3],RecText^[4],RecText^[5],RecText^[7]);
            if RecText^[7]<>'?' then
            begin
              for i:=0 to high(UserInfo^) do
              begin
                ChatUsersID.Add(UserInfo^[i].ID);
                if i<AllowNumber then
                begin
                  GPFriend.Update;
                  x:=GPFriend.Items.Add;
                  with UserInfo^[i] do
                    UpdateUserState(x,UserName,Sex,(Logined='1'));
                end
                else
                begin
                  if i<AllowNumber+1 then
                  begin
                    x:=GPFriend.Items.Add;
                    x.ImageIndex :=-1;
                    x.DisabledIndex :=-1;
                    x.Caption:='更多...';
                    x.OnClick :=MoreClick;
                  end;

                  y:=TCoolItem95.Create(self);
                  UserMenu.Height :=UserMenu.Height +y.Height ;
                  with UserInfo^[i] do
                    UpdateUserMenu(y,UserName,Sex,(Logined='1'));
                  UserMenu.AddItem(y);
                end;
              end;
              setLength(frmChat,high(UserInfo^)+1);
            end;
            FreeLibrary(FunHandle);
          end;
        end;

        if FrmLogin<>nil then
        begin
          FrmLogin.Close ;
          FrmLogin:=nil;
        end;
        RefreshStates;
        Send('B','',frmmain.myID,'','','','','');//取得自己全部信息
      end;

    Ord('E')://用户注册失败
      begin
        information('注册失败！');
        RefreshStates;
      end;

    Ord('S')://用户注册成功
      begin
        Logined:=True;
        myID:=Session.Param1 ;
        RegIni1.WriteString('UserID',myID,myName);
        RefreshStates;
        information('注册成功，你的ID是'+myID+'！');
      end;

    Ord('G'): //其他用户上下线时刷新用户列表
      begin
        if Logined then
        begin
          if Session.Param4<>'2' then//2表示用户为adminstrator添加的，状态为下线
          begin
            if (Session.Param3='1') and (InitData.ShowOnHint) then
              Tray1.ShowBalloonHint('信息',Session.Param1+'已登录!')
            else if (Session.Param3='0') and (InitData.ShowOffHint) then
              Tray1.ShowBalloonHint('信息',Session.Param1+'已下线!');
          end;

          if UserInfo^<>nil then
          begin
            for i:=0 to high(UserInfo^) do
              if strpas(UserInfo^[i].ID)=Session.Param5 then
              begin
                StrPCopy(UserInfo^[i].Logined,Session.Param3);
                StrPCopy(UserInfo^[i].Sex,Session.Param2);
                StrPCopy(Userinfo^[i].Handle,Session.Handle);
                StrPCopy(Userinfo^[i].ID,Session.Param5);
                StrPCopy(UserInfo^[i].UserName,Session.Param1);
                break;
              end;

            if Session.Param4='0' then
              for i:=0 to high(UserInfo^) do
                if ChatUsersID.Strings[i]=Session.Param5 then
                begin
                  if Session.Param3='1' then
                  begin
                    ChatUsersID.Delete(i);//减
                    if i<AllowNumber then
                    begin
                      GPFriend.Update;
                      GPFriend.Items.Delete(i);
                      ChatUsersID.Insert(0,Session.Param5);//加
                      x:=TRZGroupItem(GPFriend.Items.Insert(0));

                      with Session do
                        UpdateUserState(x,Param1,Param2,(Param3='1'));
                    end
                    else
                    begin
                      GPFriend.Update;
                      x:=TRZGroupItem(GPFriend.Items.Insert(0));
                      with Session do
                        UpdateUserState(x,Param1,Param2,(Param3='1'));

                      UserMenu.RemoveItem(i-AllowNumber);
                      ChatUsersID.Insert(0,Session.Param5);//加

                      y:=TCoolItem95.Create(self);
                      with GPFriend.Items[GPFriend.Items.Count-2] do
                        UpDateUserMenu(y,Caption,inttostr(ImageIndex-3),Enabled);
                      UserMenu.InsertItem(0,y);

                      GPFriend.Update;
                      GPFriend.Items.Delete(GPFriend.Items.Count-2);
                    end;
                  end
                  else
                  begin
                    ChatUsersID.Add(Session.Param5);//加
                    if i<AllowNumber then
                    begin
                      if UserMenu.ControlCount>0 then
                      begin
                        y:=TCoolItem95.Create(self);
                        with Session do
                          UpDateUserMenu(y,Param1,Param2,(Param3='1'));
                        UserMenu.AddItem(y);

                        ChatUsersID.Delete(i);//减
                        GPFriend.Update;
                        GPFriend.Items.Delete(i);
                        x:=TRZGroupItem(GPFriend.Items.Insert(GPFriend.Items.Count-1));
                        x.caption:=TCoolItem95(UserMenu.Controls[0]).caption;
                        x.Enabled:=TCoolItem95(UserMenu.Controls[0]).Enabled;
                        if x.Enabled then
                        begin
                          x.ImageIndex:=TCoolItem95(UserMenu.Controls[0]).ImageIndex;
                          x.DisabledIndex:=TCoolItem95(UserMenu.Controls[0]).ImageIndex+9;
                        end
                        else
                        begin
                          x.ImageIndex:=TCoolItem95(UserMenu.Controls[0]).ImageIndex-9;
                          x.DisabledIndex:=TCoolItem95(UserMenu.Controls[0]).ImageIndex;
                        end;
                        UserMenu.RemoveItem(0);
                      end
                      else
                      begin
                        ChatUsersID.Delete(i);//减
                        GPFriend.Update;
                        GPFriend.Items.Delete(i);
                        x:=GPFriend.Items.Add;
                        with Session do
                          UpdateUserState(x,Param1,Param2,(Param3='1'));
                      end;
                    end
                    else
                    begin
                      ChatUsersID.Delete(i-AllowNumber);//减
                      UserMenu.RemoveItem(i-AllowNumber);
                      y:=TCoolItem95.Create(self);
                      with Session do
                        UpDateUserMenu(y,Param1,Param2,(Param3='1'));
                      UserMenu.AddItem(y);
                    end;
                  end;
                  break;
                end;
          end;
          if Session.Param4 ='1' then //检查是否是刚注册登录的用户
          begin
            if Assigned(Userinfo^) then
            begin
              SetLength(UserInfo^,high(UserInfo^)+1+1);
              setLength(frmChat,high(UserInfo^)+1+1);
            end
            else
            begin
              SetLength(UserInfo^,1);
              setLength(frmChat,1);
            end;

            GetMem(UserInfo^[high(UserInfo^)].UserName,length(Session.Param1)+1);
            GetMem(UserInfo^[high(UserInfo^)].Logined,length(Session.Param3)+1);
            GetMem(UserInfo^[high(UserInfo^)].Sex,length(Session.Param2)+1);
            GetMem(UserInfo^[high(UserInfo^)].Handle,length(Session.Handle)+1);
            GetMem(UserInfo^[high(UserInfo^)].ID,length(Session.Param5)+1);

            StrPCopy(UserInfo^[high(UserInfo^)].UserName,Session.Param1);
            StrPCopy(UserInfo^[high(UserInfo^)].Logined,Session.Param3);
            StrPCopy(UserInfo^[high(UserInfo^)].Sex,Session.Param2);
            StrPCopy(Userinfo^[high(UserInfo^)].Handle,Session.Handle);
            StrPCopy(Userinfo^[high(UserInfo^)].ID,Session.Param5);

            if UserMenu.ControlCount =0 then
            begin
              ChatUsersID.Insert(0,Session.Param5);
              if GPFriend.Items.Count <AllowNumber then
              begin
                GPFriend.Update;
                x:=TRZGroupItem(GPFriend.Items.Insert(0));
                with Session do
                  UpdateUserState(x,Param1,Param2,(Param3='1'));
              end
              else if GPFriend.Items.Count =AllowNumber then//往菜单加
              begin
                GPFriend.Update;
                x:=GPFriend.Items.Add;
                x.ImageIndex :=-1;
                x.DisabledIndex :=-1;
                x.Caption:='更多...';
                x.OnClick :=MoreClick;

                y:=TCoolItem95.Create(self);
                UserMenu.Height :=UserMenu.Height +y.Height ;
                with GPFriend.Items[GPFriend.Items.Count-2] do
                  UpDateUserMenu(y,Caption,inttostr(ImageIndex-3),Enabled);
                UserMenu.InsertItem(0,y);

                GPFriend.Update;
                GPFriend.Items.Delete(GPFriend.Items.Count-2);
                x:=TRZGroupItem(GPFriend.Items.Insert(0));
                with Session do
                  UpdateUserState(x,Param1,Param2,(Param3='1'));
              end
            end
            else
            begin
              ChatUsersID.Insert(0,Session.Param5);
              y:=TCoolItem95.Create(self);
              UserMenu.Height :=UserMenu.Height +y.Height ;
              with GPFriend.Items[GPFriend.Items.Count-2] do
                UpDateUserMenu(y,Caption,inttostr(ImageIndex-3),Enabled);
              UserMenu.InsertItem(0,y);

              GPFriend.Update;
              GPFriend.Items.Delete(GPFriend.Items.Count-2);
              x:=TRZGroupItem(GPFriend.Items.Insert(0));
              with Session do
                UpdateUserState(x,Param1,Param2,(Param3='1'));
            end;
          end;
          if  Session.Param4='2' then//检查用户是否是由administrator添加的
          begin
            if Assigned(Userinfo^) then
            begin
              SetLength(UserInfo^,high(UserInfo^)+1+1);
              setLength(frmChat,high(UserInfo^)+1+1);
            end
            else
            begin
              SetLength(UserInfo^,1);
              setLength(frmChat,1);
            end;

            GetMem(UserInfo^[high(UserInfo^)].UserName,length(Session.Param1)+1);
            GetMem(UserInfo^[high(UserInfo^)].Logined,length(Session.Param3)+1);
            GetMem(UserInfo^[high(UserInfo^)].Sex,length(Session.Param2)+1);
            GetMem(UserInfo^[high(UserInfo^)].Handle,length(Session.Handle)+1);
            GetMem(UserInfo^[high(UserInfo^)].ID,length(Session.Param5)+1);

            StrPCopy(UserInfo^[high(UserInfo^)].UserName,Session.Param1);
            StrPCopy(UserInfo^[high(UserInfo^)].Logined,Session.Param3);
            StrPCopy(UserInfo^[high(UserInfo^)].Sex,Session.Param2);
            StrPCopy(Userinfo^[high(UserInfo^)].Handle,Session.Handle);
            StrPCopy(Userinfo^[high(UserInfo^)].ID,Session.Param5);

            if UserMenu.ControlCount =0 then
            begin
              ChatUsersID.Add(Session.Param5);
              if GPFriend.Items.Count <AllowNumber then
              begin
                GPFriend.Update;
                x:=TRZGroupItem(GPFriend.Items.Add);
                with Session do
                  UpdateUserState(x,Param1,Param2,false);
              end
              else if GPFriend.Items.Count =AllowNumber then//往菜单加
              begin
                GPFriend.Update;
                x:=GPFriend.Items.Add;
                x.ImageIndex :=-1;
                x.DisabledIndex :=-1;
                x.Caption:='更多...';
                x.OnClick :=MoreClick;

                y:=TCoolItem95.Create(self);
                UserMenu.Height :=UserMenu.Height +y.Height ;
                with Session do
                  UpDateUserMenu(y,Param1,Param2,false);
                UserMenu.AddItem(y)
              end
            end
            else
            begin
              ChatUsersID.Add(Session.Param5);
              y:=TCoolItem95.Create(self);
              UserMenu.Height :=UserMenu.Height +y.Height ;
              with Session do
                UpDateUserMenu(y,Param1,Param2,false);
              UserMenu.AddItem(y);
            end;
          end;
        end;
      end;

  end;
  //Dispose(RecText);
end;

procedure TfrmMain.RefreshStates;
begin
  GPLogin.Items[0].Enabled :=not Logined;
  GPLogin.Items[1].Enabled :=Logined;
  RzGroup1.Items[3].Enabled :=Logined;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  hResInfo:THandle;
begin
  hResInfo:=FindResource(HInstance,'Sound1','WAV');
  hRes:=LoadResource(HInstance,HresInfo);
  if hRes>32 then
  begin
    pStrSound:=LockResource(hRes);
  end;
  CreateInitData;
  if InitData.OnTop then
    SetWindowPos(handle,HWND_TOPMOST,0,0,0,0,swp_NoSize);
  c.Port:=InitData.Port;
  c.Address:=InitData.IP;
  c.Active:=true;
  GetmyIP(myHost,myAddress);
  RefreshStates;
  RegIni1.Path :=extractFilePath(Application.ExeName)+'\UserID.ini';
  ChatUsersID:=TstringList.Create ;
  FIFOIndex:=TstringList.Create ;
end;

procedure TfrmMain.ItemClick(sender: Tobject);
begin
  if LoseSession then
  begin
    information('服务器的连接已断开，请重新启动程序！');
    abort;
  end;

  GPFriend.Items[GPFriend.ItemIndex].FontColor:=clblack;
  ShowChatFrm(ChatUsersID.Strings[GPFriend.ItemIndex]);
end;


procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i:integer;
begin
  for i:=low(frmChat) to high(frmChat) do
    if Assigned(frmChat[i]) then
      frmChat[i].Close ;  
  sleep(100);
  if Assigned(frmConfig) then
    frmConfig.close;
  //if Assigned(UserInfo) then
    //Dispose(UserInfo);

  ChatUsersID.Free ;
  FIFOIndex.Free ; 
end;

procedure TfrmMain.RzShapeButton1Click(Sender: TObject);
begin
  Application.Minimize;
  RzFormState1.SaveState;
end;

procedure TfrmMain.MoveIn(var msg: Tmessage);
var
  r:thandle;
begin
  if Top=0 then
    if (mouse.CursorPos.x>left) and (mouse.CursorPos.x<left+width)
      and (mouse.CursorPos.y>top-3) and (mouse.CursorPos.y<top+height+10) then
    begin
      r:=CreateRectRgn(0,0,width,height);
      SetWindowRgn(handle,r,true);
    end;
end;

procedure TfrmMain.MoveOut(var msg: Tmessage);
var
  r:thandle;
begin
  if Top=0 then
    if (mouse.CursorPos.x<left) or (mouse.CursorPos.x>left+width)
      or (mouse.CursorPos.y<top) or (mouse.CursorPos.y>top+height) then
    begin
      r:=CreateRectRgn(0,0,width,3);
      SetWindowRgn(handle,r,true);
    end;
end;

procedure TfrmMain.UpDateUserState(User:TRZGroupItem; Name,Sex: string; Logined:Boolean);
begin
  User.Caption:=Name ;
  User.ImageIndex :=3+strtoint(Sex);
  User.DisabledIndex :=12+strtoint(Sex);
  User.Enabled :=Logined;
  User.OnClick:=ItemClick;
end;

procedure TfrmMain.GetmyIP(var Host, Address: string);
begin
  Host:=c.Socket.LocalHost ;
  Address:=c.Socket.LocalAddress;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE);
  RefreshStates;
end;

procedure TfrmMain.Tray1LButtonDblClick(Sender: TObject);
var
  r:thandle;
  i,ItemIndex:integer;
begin
  if FIFOIndex.Count >0 then
  begin
    i:=strtoint(FIFOIndex.Strings[0]);
    if (i>=0) and assigned(frmChat[i]) then
    begin
      if FIFOIndex.Count >0 then
        FIFOIndex.Delete(0);
      ItemIndex:=ChatUsersID.IndexOf(frmChat[i].ID);
      if (ItemIndex<>-1) and (ItemIndex<AllowNumber) then
        GPFriend.Items[ItemIndex].FontColor :=clBlack;
      frmIndex:=FindFormByID(frmChat[i].ID);
      if (FIFOIndex.Count<=0) then
      begin
        Tray1.Animate :=false;
        Tray1.IconIndex :=0;
      end;
      if IsIconic(frmChat[frmIndex].Handle) then
        frmChat[frmIndex].WindowState := wsNormal
      else  
        frmChat[frmIndex].show;
    end;
  end
  else
  begin
    if self.Visible then
    begin
      r:=CreateRectRgn(0,0,width,Height);
      SetWindowRgn(handle,r,true);
    end;
    Application.Restore;
    SetForegroundWindow( Application.Handle );
  end;
  ShowWindow(Application.Handle,SW_HIDE);
end;

function TfrmMain.CreateChatFrm(ID:string;Index:integer;ExecGame:Boolean):TfrmChat;
begin
  if Index>-1 then
  begin
    if UserInfo^[Index].Logined='0' then
    begin
      frmmain.Information('连接失败，对方可能下线！');
      abort;
    end;
    if not assigned(frmChat[Index]) then
      result:=TfrmChat.Create(self)
    else
      result:=frmChat[Index];
    if ExecGame then//执行游戏要放在返回用户信息之前
      result.RzBitBtn5.Enabled :=false
    else
      result.RzBitBtn5.Enabled :=true;
    result.UserHandle:=STRPAS(UserInfo^[Index].Handle);
    result.Name :='Frm_'+ID;
    result.ID :=ID;
    result.Index :=Index;
    tray1.IconIndex :=0;
    send('U',myHandle,UserInfo^[Index].Handle,UserInfo^[Index].ID,'','','','');//获得聊天用户IP
  end
  else
    result:=nil;
end;

procedure TfrmMain.ShowChatFrm(ID:string);
begin
  frmIndex:=FindFormByID(ID);
  frmChat[frmIndex]:=CreateChatFrm(ID,frmIndex,false);
  if (FIFOIndex.Count >0) and (FIFOIndex.IndexOf(inttostr(frmIndex))>-1) then
    FIFOIndex.Delete(FIFOIndex.IndexOf(inttostr(frmIndex)));
  if IsIconic(frmChat[frmIndex].Handle) then
    frmChat[frmIndex].WindowState := wsNormal
  else
    frmChat[frmIndex].show;

  if (FIFOIndex.Count<=0) then
  begin
    Tray1.Animate :=false;
    Tray1.IconIndex :=0;
  end;
end;

function TfrmMain.FindFormByID(ID: string): integer;
var
  i:integer;
begin
  result:=-1;
  for i:=0 to high(UserInfo^) do
    if ID=strpas(UserInfo^[i].ID) then
    begin
      result:=i;
      break;
    end
end;

procedure TfrmMain.Write(AfileName: string;var Text:string);
begin
  if fileexists(AfileName) then
    FileStream:=TFileStream.Create(AfileName,fmOpenReadWrite)
  else
  begin
    if not DirectoryExists(InitData.Path) then
     if not CreateDir(InitData.Path) then
       raise Exception.Create('保存聊天记录失败！');
    FileStream:=TFileStream.Create(AfileName,fmCreate)
  end;
  FileStream.Write(Text[1],length(Text));
  FileStream.Free;
end;

function TfrmMain.Read(AfileName: string): string;
var
  s:string;
begin
  if fileexists(AfileName) then
  begin
    FileStream:=TFileStream.Create(AfileName,fmOpenReadWrite);
    setlength(s,FileStream.Size);
    FileStream.Read(s[1],FileStream.Size);
    FileStream.Free;
  end;
  Result:=s;
end;

procedure TfrmMain.RzGroup1Items0Click(Sender: TObject);
begin
  if not assigned(frmConfig) then
  begin
    frmConfig:=TfrmConfig.Create(self);
    frmConfig.Show;
  end;
end;

procedure TfrmMain.CreateInitData;
begin
  if not fileexists('jjyy.dat') then
  begin
    FileStream:=TFileStream.Create('jjyy.dat',fmCreate);
    InitData.IP:='127.0.0.1';
    InitData.Port:=10111;
    InitData.AutoSave:=true;
    InitData.OnTop:=false;
    InitData.ShowOnHint :=true;
    InitData.ShowOffHint :=true;
    InitData.PlayWave :=false;
    InitData.Path :=extractFilePath(Application.ExeName);
    FileStream.Write(InitData,Sizeof(TInitData));
    FileStream.Free;
  end
  else
  begin
    FileStream:=TFileStream.Create('jjyy.dat',fmOpenReadWrite);
    FileStream.Read(InitData,Sizeof(TInitData));
    FileStream.Free ;
  end;
end;

procedure TfrmMain.cConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  LoseSession:=false;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  i:integer;
  Index,Index1:integer;
begin
  if FiFOIndex.Count =0 then
  begin
    for i:=0 to GPFriend.Items.Count-1 do
      GPFriend.Items[i].FontColor:=clBlack;
    Timer1.Enabled :=false;
    exit;
  end;

  index1:=strtoint(FIFOIndex.Strings[0]);
  index1:=ChatUsersID.IndexOf(UserInfo^[index1].ID);
  if (index1<>-1) and (index1<AllowNumber) then
    if GPFriend.Items[Index1].FontColor=clblack then
      GPFriend.Items[Index1].FontColor:=clBlue
    else
      GPFriend.Items[Index1].FontColor:=clblack;

  for i:=0 to FiFOIndex.Count-1 do
  begin
    if i<>0 then
    begin
      index:=strtoint(FIFOIndex.Strings[i]);
      index:=ChatUsersID.IndexOf(UserInfo^[index].ID);
      if (index<>-1) and (index<AllowNumber) then
        GPFriend.Items[Index].FontColor:=GPFriend.Items[Index1].FontColor;
    end;
  end;
end;

procedure TfrmMain.RzGroup1Items2Click(Sender: TObject);
begin
  if not Assigned(frmmail) then
    frmmail:=Tfrmmail.Create(self);
  frmmail.show;
end;


procedure TfrmMain.WMQueryEndSession(var Msg: TMessage);
begin
//  if Logined and (not LoseSession) then
//    send('C',Session.Handle,myName,inttostr(mySex),myID,myHost,myAddress,'');
  inherited;
end;

procedure TfrmMain.RzGroup1Items3Click(Sender: TObject);
begin
  if LoseSession then
  begin
    information('与服务器的连接已断开，请重新启动程序！');
    abort;
  end;

  if not assigned(frmAdmin) then
  begin
    frmAdmin:=TfrmAdmin.Create(self);
    frmAdmin.Show ;
  end;
end;

procedure TfrmMain.Information(msg: string);
begin
  if not assigned(frmInfo) then
  begin
    frmInfo:=TfrmInfo.Create(self);
    frmInfo.Label1.Caption :=msg;
    frmInfo.ShowModal ;
  end;
end;

procedure TfrmMain.MoreClick(sender: TObject);
begin
  UserMenu.ShowMenu(GPFriend,3,GPFriend.Height);
end;

procedure TfrmMain.MenuItemClick(sender: TObject);
begin
  if LoseSession then
  begin
    information('服务器的连接已断开，请重新启动程序！');
    abort;
  end;

  ShowChatFrm(ChatUsersID.Strings[UserMenu.SelectedItem.CoolItemIndex+AllowNumber]);
end;

procedure TfrmMain.UpdateUserMenu(User: TCoolItem95; Name, Sex: string;
  Logined: Boolean);
begin
  User.Caption :=Name;
  User.SelectedColor :=$00E8DCC1;
  User.SelectedFont.Color :=clblue;
  User.SelectedFont.Style :=[fsUnderline];
  User.Enabled :=Logined;
  if User.Enabled then
    User.ImageIndex :=3+strtoint(Sex)
  else
    User.ImageIndex :=12+strtoint(Sex);
  User.OnClick :=MenuItemClick;
end;

procedure TfrmMain.UMDestroy(var Message: TMessage);
begin
//
end;

function TfrmMain.GetTextID(Text, BreakSymbol: string): string;
var
  I: Integer;
begin
  I := Pos(BreakSymbol, Text);
  if I > 0 then
    Result := Copy(Text, 1, I - 1)
  else Result := Text;
end;

function TfrmMain.GetTextName(Text, BreakSymbol: string): string;
var
  I: Integer;
begin
  I := Pos(BreakSymbol, Text);
  if I > 0 then
    Result := Copy(Text, I + Length(BreakSymbol),
      Length(Text) - I - Length(BreakSymbol) + 1)
  else Result := Text;
end;

procedure TfrmMain.DisplayText(Lines:TStrings;NewText, UserName:string);
begin
  Lines.Add(UserName+'('+datetimetoStr(Now)+'): '+#13#10+'  '+NewText);
end;

procedure TfrmMain.DisplayText(Lines:TStrings;NewText:string);
begin
  Lines.add(NewText);
end;

procedure TfrmMain.GameExec(frm:TfrmChat;Index:integer;Flag, Style, extr, CommandText,
  Station, AUserHandle: string);
var
  i:integer;
  CommandList:TStrings;
  GameHandle,GameComm:string;
  function OcttoBin(value:integer):string;
  var
    i:integer;
    tmpx:integer;
    s:array[0..13] of char;//俄罗斯方块的长度为14
  begin
    fillchar(s,14,'0');
    i:=13;
    while value<>0 do
    begin
      tmpx:=value mod 2;
      value:=value div 2;
      if tmpx=0 then
        s[i]:='0'
      else
        s[i]:='1';
      dec(i);
    end;
    result:=s;
  end;
begin
  CommandList:=TStringList.Create;
  CommandList.Text :=CommandText;
  with frmChat[Index] do
  begin
    for i:=0 to CommandList.Count-1 do
    begin
      GameHandle:=GetTextID(CommandList.Strings[i]);
      GameComm:=GetTextName(CommandList.Strings[i]);

      if Pos('Start',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=myHandle) then
        begin
          Russfrm.sPrim.New(strtoint(GetTextID(Flag)),strtoint(GetTextID(Style)),false);
          Russfrm.sPrimV.New(strtoint(GetTextName(Flag)),strtoint(GetTextName(Style)),false);
        end;

        if (Station='Secd') and (GameHandle=AUserHandle) then
        begin
          Russfrm.sSec.New(strtoint(GetTextID(Flag)),strtoint(GetTextID(Style)),false);
          Russfrm.sSecV.New(strtoint(GetTextName(Flag)),strtoint(GetTextName(Style)),false);
        end;

        Russfrm.OldFlag:=Russfrm.sPrimV.Flag;
        Russfrm.OldStyle:=Russfrm.sPrimV.NowStyle;
      end
      else if Pos('Down',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=MyHandle) then
          Russfrm.sPrim.ToDown(strtoint(GetTextID(Flag)),strtoint(GetTextID(Style)),false);

        if (Station='Secd') and (GameHandle=AUserHandle) then
          Russfrm.sSec.ToDown(strtoint(GetTextID(Flag)),strtoint(GetTextID(Style)),false);

        //Russfrm.OldFlag:=Russfrm.sPrimV.Flag;
        //Russfrm.OldStyle:=Russfrm.sPrimV.NowStyle;
      end
      else if Pos('Left',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=MyHandle) then
          Russfrm.sPrim.ToRight;

        if (Station='Secd') and (GameHandle=AUserHandle) then
          Russfrm.sSec.ToRight;
      end
      else if Pos('Right',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=MyHandle) then
          Russfrm.sPrim.ToLeft;

        if (Station='Secd') and (GameHandle=AUserHandle) then
          Russfrm.sSec.ToLeft;
      end
      else if Pos('Change',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=MyHandle) then
          Russfrm.sPrim.Changed;

        if (Station='Secd') and (GameHandle=AUserHandle) then
          Russfrm.sSec.Changed;
      end
      else if Pos('Stop',GameComm)<>0 then
      begin
        if (Station='Prim') and (GameHandle=MyHandle) then
        begin
          Russfrm.sPrimV.New(strtoint(GetTextID(extr)),strtoint(GetTextID(GetTextName(extr),';')),false);
        end;

        if (Station='Secd') and (GameHandle=AUserHandle) then
        begin
          Russfrm.sSecV.New(strtoint(GetTextID(extr)),strtoint(GetTextID(GetTextName(extr),';')),false);
        end;
        Russfrm.OldFlag:=Russfrm.sPrimV.Flag;
        Russfrm.OldStyle:=Russfrm.sPrimV.NowStyle;
      end
      else if Pos('Build',GameComm)<>0 then
      begin
        if (Station='Prim') and (Russfrm.UserStarted) and (GameHandle=MyHandle) then
        begin
          Russfrm.sSec.BuildLine(OcttoBin(strtoint(GetTextName(extr,';'))));
        end;

        if (Station='Secd') and (Russfrm.Started) and (GameHandle=AUserHandle) then
        begin
          Russfrm.sPrim.BuildLine(OcttoBin(strtoint(GetTextName(extr,';'))));
        end;
      end;
    end;
  end;
  CommandList.Free;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  N6.Enabled :=not frmmain.Logined;
  if not frmmain.Logined then
    N6.ImageIndex :=0
  else
    N6.ImageIndex :=10;

  N7.Enabled :=frmmain.Logined;
  if frmmain.Logined then
    N7.ImageIndex :=1
  else
    N7.ImageIndex :=11;

  N4.Enabled :=frmmain.Logined;
  //if frmmain.Logined then
    //N4.ImageIndex :=22
  //else
    //N4.ImageIndex :=23;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Logined and (not LoseSession) then
  begin
    send('C',myHandle,myName,inttostr(mySex),myID,myHost,myAddress,'');
    //if Assigned(UserInfo) then
      //UserInfo^:=nil;
  end;
end;

end.
