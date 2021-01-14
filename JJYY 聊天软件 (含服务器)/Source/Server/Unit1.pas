unit Unit1;

interface

uses
  winsock,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp,GeneralInf, ExtCtrls, Grids, DBGrids, Db, ADODB,
  Buttons, Menus, ImgList, ToolWin, ComCtrls, ActnList, AppEvnts,
  RzTray, RzCommon;

const
  UM_RESTORE_APPLICATION=WM_User+101;

type
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

  TForm1 = class(TForm)
    s: TServerSocket;
    Image1: TImage;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Splitter2: TSplitter;
    ListBox2: TListBox;
    Image2: TImage;
    ListBox1: TListBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Memo1: TMemo;
    Panel7: TPanel;
    Memo2: TMemo;
    MainMenu1: TMainMenu;
    N11: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    B1: TMenuItem;
    S1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    E1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    U1: TMenuItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Timer1: TTimer;
    N10: TMenuItem;
    StatusBar1: TStatusBar;
    Splitter3: TSplitter;
    Label2: TLabel;
    Panel8: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel9: TPanel;
    Label3: TLabel;
    G1: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolBar2: TToolBar;
    RzTrayIcon1: TRzTrayIcon;
    Action1: TAction;
    ini: TRzRegIniFile;
    procedure sClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure sClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ListBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure B1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
  private
    { Private declarations }
    UserName,Sex:string;
    procedure UpUser(Handle:integer;ID,Host,Address:string;Logined:integer);
    function SelectUser(ID,PasswordA:string;a,b,c:integer;var UserName,Sex:string):Boolean;
    procedure GetUserList(Handle:integer;ID,UserName,Sex:string);
    procedure GetUserInfoByID(ID:String);
    procedure ClearOffUser;
    function GetTextID(Text: string; BreakSymbol: string = '.'): string;
    function GetTextName(Text: string; BreakSymbol: string = '.'): string;
    procedure UMRestoreApplication(var Message : TMessage); message UM_RESTORE_APPLICATION;
    procedure StrToList(Str: string; var List: TStrings;BreakSymbol: string = ';');
    function StringsToStr(Str: string;BreakSymbol: string = ';'): string;
    procedure WMQueryEndSession(var Msg: TMessage);message WM_QueryEndSession;
    procedure CloseTheInstance;
    procedure ReturnGameCommand(MyHandle,UserHandle,CommandStr,Param1,Param2,Param4,Param5:string);
  public
    { Public declarations }
    RecText:PPs;
    Logined:Boolean;
    Locked:Boolean;
    UserList:Tstrings;
    UserRemark:array of string;
    CommandStr:string;

    function NewID(Handle:integer=0):string;
    procedure UpdateState;
    procedure SendAllUser(Handle:integer;UserName,Sex,Logined,Registered,ID:string);
    procedure InsUser(ID:string;UserName,PasswordA,Host,Address:string;
      Handle:integer;Logined,Sex:integer;Remark:string;ImageIndex:integer);
    procedure BrowseUser;
    function GetIndexByHandle(Handle:integer):integer;
    procedure SendBy(cs:TCustomWinSocket;Msg,Handle,Param1,Param2,Param3,Param4,Param5,Param6:string);       
  end;

var
  Form1: TForm1;

implementation

uses ChatSource, Unit2, Unit3, Unit4, Unit5, Unit7;

{$R *.DFM}

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

function TForm1.GetTextID(Text: string; BreakSymbol: string = '.'): string;
var
  I: Integer;
begin
  I := Pos(BreakSymbol, Text);
  if I > 0 then
    Result := Copy(Text, 1, I - 1)
  else Result := Text;
end;

function TForm1.GetTextName(Text: string; BreakSymbol: string = '.'): string;
var
  I: Integer;
begin
  I := Pos(BreakSymbol, Text);
  if I > 0 then
    Result := Copy(Text, I + Length(BreakSymbol),
      Length(Text) - I - Length(BreakSymbol) + 1)
  else Result := Text;
end;

procedure TForm1.sClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Tmps:String;
  i:integer;
  ID:string;
  Txtfile:TextFile;
  UserInfoList:TStrings;
  Session:TSession;
  MyHandle,UserHandle,Param1,Param2,Param4,Param5:string;
begin
  Tmps:=Socket.ReceiveText;
  RecText:=GetSession(Pchar(Tmps),7);
  Session.Msg:=RecText^[0];
  Session.Handle:=RecText^[1];
  Session.Param1:=RecText^[2];
  Session.Param2:=RecText^[3];
  Session.Param3:=RecText^[4];
  Session.Param4:=RecText^[5];
  Session.Param5:=RecText^[6];
  Session.Param6:=RecText^[7];

  if Session.Msg<>'T' then
    if Session.Msg<>'A' then
    begin
      ListBox2.Items.Add(DateTimetoStr(Now)+'   '+Tmps);
      Assignfile(Txtfile,'Sys.log');
      if fileExists('Sys.log') then
        Append(Txtfile)
      else
        Rewrite(Txtfile);
      try
        writeln(Txtfile,ListBox2.Items.Strings[ListBox2.Items.Count-1]);
      finally
        closefile(Txtfile);
      end;
      if ListBox2.Items.Count =21 then
        ListBox2.Items.Delete(0);
    end;

  if Session.Msg='admin' then
  begin
    Memo1.Lines.Add(Session.Param1);
    SendMessage(Memo1.Handle,EM_SCROLL,SB_BOTTOM,0);
    flashwindow(Application.handle,true);
  end;

  case Ord(Session.Msg[1]) of
    Ord('J')://中断游戏
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param3));
        SendBy(s.Socket.Connections[i],'J',Session.Handle,Session.Param2,'','','','','');
      end;
    Ord('P')://开始 游戏(测试)
      begin
        MyHandle:=Session.Param3;
        UserHandle:=Session.Handle;
        Param1:=Session.Param1;
        Param2:=Session.Param2;
        Param4:=Session.Param4;
        Param5:=Session.Param5;
        CommandStr:=CommandStr+Session.Param6+#13;
        ReturnGameCommand(MyHandle,UserHandle,CommandStr,Param1,Param2,Param4,Param5);
        MyHandle:='';
        UserHandle:='';
        CommandStr:='';
        Param1:='';
        Param2:='';
        Param4:='';
        Param5:='';
      end;
    Ord('V')://接受游戏
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param3));
        SendBy(s.Socket.Connections[i],'V',Session.Param1,Session.Param2,Session.Param3,Session.Param4,'',Session.Param5,'');
      end;
    Ord('K')://拒绝游戏
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param4));
        SendBy(s.Socket.Connections[i],'K',Session.Param1,Session.Param2,Session.Param3,'','',Session.Param5,'');
      end;
    Ord('I'):// 询问游戏是否开始
      begin
        SelectUser(session.Param4,'A',0,0,1,UserName,Sex);
        i:=GetIndexbyHandle(strtoint(Session.Handle));
        SendBy(s.Socket.Connections[i],'I',Session.Param2,Session.Param1,Session.Param3,Session.Param4,Session.Param2,inttostr(byte(chat.qryUserLogined.Value)),'');
      end;
    Ord('D')://清除掉线用户
      begin
        ClearOffUser;
        BrowseUser;
      end;
    Ord('N')://文件传输失败
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param3));
        SendBy(s.Socket.Connections[i],'N',Session.Handle,Session.Param2,'','','','','');
      end;
    Ord('Y')://取消接收文件
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param4));
        SendBy(s.Socket.Connections[i],'Y',Session.Param1,Session.Param2,Session.Param3,'','',Session.Param5,'');
      end;
    Ord('O')://用户确认接收文件
      begin
        i:=GetIndexbyHandle(strtoint(Session.Param2));
        SendBy(s.Socket.Connections[i],'C',Session.Param2,Session.Param1,Session.Param3,Session.Handle,'','','');
      end;
    Ord('S')://传输文件
      begin
        i:=GetIndexbyHandle(strtoint(Session.Handle));
        SendBy(s.Socket.Connections[i],'Q',Session.Param2,Session.Param1,Session.Param3,Session.Param4,Session.Param2,'','');
      end;
    Ord('M')://测试连接
      begin
        i:=GetIndexbyHandle(Socket.SocketHandle);
        SendBy(s.Socket.Connections[i],'M','','','','','','','');
      end;
    Ord('X')://修改个人记录
      begin
        Chat.UpTemp.Close ;
        Chat.UpTemp.SQL.Clear ;
        Chat.UpTemp.SQL.Add('Update UserInfo');
        Chat.UpTemp.SQL.Add('Set UserName='''+Session.Param1+'''');
        Chat.UpTemp.SQL.Add(',Sex='+Session.Param2);
        Chat.UpTemp.SQL.Add(',PasswordA='''+GetTextName(Session.Param3)+'''');
        Chat.UpTemp.SQL.Add(',ImageIndex='+Session.Param4);
        Chat.UpTemp.SQL.Add(',Remark='''+Session.Param5+'''');
        Chat.UpTemp.SQL.Add('Where ID='''+Session.Param6+'''');
        Chat.UpTemp.SQL.Add('and PasswordA='''+GetTextID(Session.Param3)+'''');
        Chat.UpTemp.ExecSQL;

        if Chat.UpTemp.RowsAffected=1 then
        begin
          for i:=0 to UserList.Count-1 do
            if Session.Param6=GetTextID(UserList.Strings[i],';') then
            begin
              Chat.UpTemp.SQL.Clear;
              Chat.UpTemp.SQL.Add('Select Host,Address,Handle from UserInfo');
              Chat.UpTemp.SQL.Add('where ID='''+Session.Param6+'''');
              Chat.UpTemp.Open;
              UserList.Strings[i]:=Session.Param6+';'+
                                   Session.Param1+';'+
                                   Chat.UpTemp.Fields[0].Text+';'+
                                   Chat.UpTemp.Fields[1].Text+';'+
                                   Session.Param4+';'+
                                   Session.Param2+';'+
                                   Chat.UpTemp.Fields[2].Text;
              UserRemark[i]:=Session.Param5;
              Chat.UpTemp.Close; 
              Break;
            end;
          i:=GetIndexbyHandle(Socket.SocketHandle);
          SendBy(s.Socket.Connections[i],'X','','','','','','','');
        end
        else
        begin
          i:=GetIndexbyHandle(Socket.SocketHandle);
          SendBy(s.Socket.Connections[i],'X','','Error','','','','','');
        end;
        i:=ListBox1.Items.IndexOf(Session.Param6+'('+Session.Handle+')');
        ListBox1.Items.Strings[i]:=Session.Param6+'('+Session.Param1+')'
      end;
    Ord('B')://取得本人信息
      begin
        i:=GetIndexbyHandle(Socket.SocketHandle);
        GetUserInfoByID(Session.Param1);
        SendBy(s.Socket.Connections[i],'B','',Chat.Temp.fieldbyname('UserName').AsString,
               Chat.Temp.fieldbyname('ID').AsString,
               Chat.Temp.fieldbyname('ImageIndex').AsString,
               Chat.Temp.fieldbyname('Sex').AsString,
               Chat.Temp.fieldbyname('Remark').AsString,'');
        Chat.Temp.Close ;
      end;
    Ord('U')://返回聊天用户信息
      begin
        tag:=GetIndexbyHandle(strtoint(Session.Handle));
        UserInfoList:=TStringList.Create;
        for i:=0 to UserList.Count-1 do
          if Session.Param2=GetTextID(UserList.Strings[i],';') then
          begin
            StrtoList(UserList.Strings[i],UserInfoList);
            SendBy(s.Socket.Connections[tag],'U',
                   UserInfoList.Strings[5],//Sex
                   UserInfoList.Strings[2],//Host
                   UserInfoList.Strings[3],//Address
                   UserInfoList.Strings[4],//ImageInedx
                   UserInfoList.Strings[0],//ID
                   UserInfoList.Strings[1],//UserName
                   UserRemark[i]);//Remark
            break;
          end;
        UserInfoList.Free;
      end;
    Ord('L')://客户登录取密码校念,发送到客户时用户名后必须跟Sex
      begin
        for i:=0 to s.Socket.ActiveConnections-1 do
          SendBy(s.Socket.Connections[i],'?','','','','','','','');
        sleep(1000);
        ClearOffUser;  //检查该用户是否掉线
        sleep(1000);

        if (Session.Param1='?') or (Session.Param2='?') then
          SendBy(s.Socket.Connections[GetIndexbyHandle(Socket.SocketHandle)],
            'F','','服务器验证失败！','','','','','')
        else
        begin
          Chat.RealTemp.Close;
          Chat.RealTemp.SQL.Clear;
          Chat.RealTemp.SQL.Text:='select 1 from UserInfo'+#13+
                                  'where ID=:ID and Deleted=1';
          Chat.RealTemp.Parameters[0].Value:=Session.Param1;
          Chat.RealTemp.Open;
          if not Chat.RealTemp.IsEmpty then//检查帐号是否禁用
          begin
            SendBy(s.Socket.Connections[GetIndexbyHandle(Socket.SocketHandle)],
              'F','','帐号已被禁用！','','','','','');
            exit;
          end;

          if SelectUser(Session.Param1,Session.Param2,1,1,1,UserName,Sex) then
          begin
            UpUser(Socket.SocketHandle,Session.Param1,Session.Param3,Session.Param4,1);
            GetUserList(Socket.SocketHandle,Session.Param1,UserName,Sex); //客户取得用户列表
            SendAllUser(Socket.SocketHandle,UserName,Sex,'1','0',Session.Param1);//通知其它客户本人上线Logined=1上线Logined=0下线
            ListBox1.Items.Add(Session.Param1+'('+UserName+')');
            label1.Caption :='在线用户列表('+inttostr(ListBox1.Items.Count)+'人)';

            UserInfoList:=TStringList.Create;  //由于用户登陆会改IP和主机，要刷新UserList
            for i:=0 to UserList.Count-1 do
              if Session.Param1=GetTextID(UserList.Strings[i],';') then
              begin
                StrtoList(UserList.Strings[i],UserInfoList);
                UserInfoList.Strings[2]:=Session.Param3;//Host
                UserInfoList.Strings[3]:=Session.Param4;//Address
                break;
              end;
            UserList.Strings[i]:=StringsToStr(UserInfoList.Text,';');
            UserInfoList.Free;
          end
          else
            SendBy(s.Socket.Connections[GetIndexbyHandle(Socket.SocketHandle)],
              'F','','服务器验证失败！','','','','','');
        end;
        BrowseUser;
      end;
    Ord('R')://客户注册时返回用户列表;
      begin
        i:=GetIndexByHandle(Socket.SocketHandle);
        try
          ID:=NewID(Socket.SocketHandle);
          InsUser(ID,Session.Param1,Session.Param4,Session.Param6,Socket.RemoteAddress,
            Socket.SocketHandle,1,strtoint(Session.Param3),Session.Param5,
            strtoint(Session.Handle));
          UserList.Add(ID+';'+
                       Session.Param1+';'+
                       Session.Param6+';'+
                       Socket.RemoteAddress+';'+
                       Session.Handle+';'+
                       Session.Param3+';'+
                       Session.Handle);
          setlength(UserRemark,high(UserRemark)+2);
          UserRemark[high(UserRemark)]:=Session.Param5;

          SendBy(s.Socket.Connections[i],'S',Session.Handle,ID,'','','','','');

          UpUser(Socket.SocketHandle,Session.Param1,Session.Param6,Socket.RemoteAddress,1);

          GetUserList(Socket.SocketHandle,ID,Session.Param1,Session.Param3);
          SendAllUser(Socket.SocketHandle,Session.Param1,Session.Param3,'1','1',ID);
          ListBox1.Items.Add(ID+'('+Session.Param1+')');
          label1.Caption :='在线用户列表('+inttostr(ListBox1.Items.Count)+'人)';
        except
          SendBy(s.Socket.Connections[i],'E','','','','','','','');
        end;
        BrowseUser;
      end;
    Ord('C')://客户退出时返回用户列表
      begin
        UpUser(Socket.SocketHandle,Session.Param3,Session.Param4,Session.Param5,0);
        SendAllUser(Socket.SocketHandle,Session.Param1,Session.Param2,'0','0',Session.Param3);
        i:=ListBox1.Items.IndexOf(Session.Param3+'('+Session.Param1+')');
        ListBox1.Items.Delete(i);
        label1.Caption :='在线用户列表('+inttostr(ListBox1.Items.Count)+'人)';
        BrowseUser;
      end;
    Ord('T')://转发客户之间的交流
      begin
        SelectUser(session.Param4,'A',0,0,1,UserName,Sex);
        i:=GetIndexByHandle(strtoint(Session.Handle));
        if (chat.qryUserLogined.AsInteger=1) then
          SendBy(s.Socket.Connections[i],'T',inttostr(Socket.SocketHandle),
          Session.Param1,Session.Param2,Session.Param3,inttostr(byte(chat.qryUserLogined.Value)),
          Session.Param4,'')
        else
          SendBy(Socket,'T',inttostr(Socket.SocketHandle),
          Session.Param1,Session.Param2,Session.Param3,inttostr(byte(chat.qryUserLogined.Value)),
          Session.Param4,'')
      end;
    Ord('A')://广播
      begin
        SelectUser(session.Param4,'A',0,0,1,UserName,Sex);
        if chat.qryUserLogined.AsInteger=1 then
        begin
          for i:=0 to s.Socket.ActiveConnections-1 do
            if (s.Socket.Connections[i].SocketHandle<>Socket.SocketHandle) then
              SendBy(s.Socket.Connections[i],'A',inttostr(Socket.SocketHandle),
              Session.Param1,Session.Param2,Session.Param3,inttostr(byte(chat.qryUserLogined.Value)),
              Session.Param4,'')
        end
        else
        begin
          SendBy(Socket,'T',inttostr(Socket.SocketHandle),
          Session.Param1,Session.Param2,Session.Param3,inttostr(byte(chat.qryUserLogined.Value)),
          Session.Param4,'');
        end;
      end;
  end;
  //Dispose(RecText);
end;

function TForm1.GetIndexByHandle(Handle: integer):integer;
var
  i:integer;
begin
  Result:=0;
  for i:=0 to s.Socket.ActiveConnections-1 do
  begin
    if s.Socket.Connections[i].SocketHandle=Handle then
    begin
      Result:=i;
      Break;
    end;
  end;
end;

procedure TForm1.sClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if ErrorCode=10053 then
    ErrorCode:=0
  else if ErrorCode=10054 then//用户异常退出
  begin
    ErrorCode:=0;
  end
  else if ErrorCode=10048 then
  begin
    MessageBox(Handle,'端口被占。','提示',MB_OK);
    ErrorCode:=0;
  end;
end;

procedure TForm1.SendBy(cs:TCustomWinSocket;Msg, Handle, Param1, Param2, Param3, Param4, Param5, Param6: string);
var
  s:string;
begin
  if Msg='' then Msg:='?';
  if Handle='' then Handle:='?';
  if Param1='' then Param1:='?';
  if Param2='' then Param2:='?';
  if Param3='' then Param3:='?';
  if Param4='' then Param4:='?';
  if Param5='' then Param5:='?';
  if Param6='' then Param6:='?';
  s:=Msg+#255+Handle+#255+Param1+#255+Param2+#255+Param3+#255+Param4+#255+Param5+#255+Param6;
  cs.SendText(s);
end;

procedure TForm1.InsUser(ID, UserName, PasswordA, Host, Address: string;
  Handle: integer; Logined, Sex: integer; Remark: string;ImageIndex:integer);
begin
  chat.InsUser.Parameters.ParamByName('ID').Value:=ID;
  chat.InsUser.Parameters.ParamByName('UserName').Value:=UserName;
  chat.InsUser.Parameters.ParamByName('PasswordA').Value:=PasswordA;
  chat.InsUser.Parameters.ParamByName('Host').Value:=Host;
  chat.InsUser.Parameters.ParamByName('Address').Value:=Address;
  chat.InsUser.Parameters.ParamByName('Handle').Value:=Handle;
  chat.InsUser.Parameters.ParamByName('Logined').Value:=Logined;
  chat.InsUser.Parameters.ParamByName('Sex').Value:=Sex;
  chat.InsUser.Parameters.ParamByName('Remark').Value:=Remark;
  chat.InsUser.Parameters.ParamByName('ImageIndex').Value:=ImageIndex;
  chat.InsUser.ExecSQL;
end;

function TForm1.SelectUser(ID, PasswordA: string;a,b,c:integer;var UserName,Sex:string):Boolean;
begin
  {$IFDEF VER140}
  chat.qryUser.Close;//D6 Use
  {$ENDIF}
  chat.qryUser.Parameters.ParamByName('a').Value:=a;
  chat.qryUser.Parameters.ParamByName('b').Value:=b;
  chat.qryUser.Parameters.ParamByName('c').Value:=c;
  chat.qryUser.Parameters.ParamByName('ID').Value:=ID;
  chat.qryUser.Parameters.ParamByName('PasswordA').Value:=PasswordA;
  chat.qryUser.Open ;
  {$IFDEF VER130}
  chat.qryUser.Requery([]);//D5 Use
  {$ENDIF}
  UserName:=chat.qryUserUserName.AsString;
  Sex:=chat.qryUserSex.AsString;
  if not chat.qryUser.IsEmpty then
    result:=true
  else
    result:=false;
end;

procedure TForm1.UpUser(Handle:integer;ID,Host,Address:string;Logined:integer);
begin
  if not chat.Con.Connected then
    chat.Con.Open;
  chat.UpUser.Parameters.ParamByName('Logined').Value:=Logined;
  chat.UpUser.Parameters.ParamByName('ID').Value:=ID;
  chat.UpUser.Parameters.ParamByName('Handle').Value:=Handle;
  chat.UpUser.Parameters.ParamByName('Host').Value:=Host;
  chat.UpUser.Parameters.ParamByName('Address').Value:=Address;
  chat.UpUser.ExecSQL;
end;

procedure TForm1.GetUserList(Handle:integer;ID,UserName,Sex:string);
var
  HandleStr:string;
  UserNameStr:string;
  LoginedStr:string;
  SexStr:string;
  IDStr:string;
  i:integer;
begin
  i:=GetIndexByHandle(Handle);
  chat.qryTemp.Parameters.ParamByName('ID').Value:=ID;
  chat.qryTemp.Open ;
  chat.qryTemp.Requery([]);

  if not chat.qryTemp.IsEmpty then
  begin
    while not chat.qryTemp.Eof do
    begin
      HandleStr:=HandleStr+inttostr(chat.qryTempHandle.Value)+#13;
      UserNameStr:=UserNameStr+chat.qryTempUserName.Value+#13;
      LoginedStr:=LoginedStr+inttostr(byte(chat.qryTempLogined.Value))+#13;
      SexStr:=SexStr+inttostr(byte(chat.qryTempSex.Value))+#13;
      IDStr:=IDStr+chat.qryTempID.Value+#13;
      chat.qryTemp.next;
    end;
  end;

  SendBy(s.Socket.Connections[i],'L',inttostr(Handle),
    UserNameStr,LoginedStr,SexStr,HandleStr,UserName+Sex,IDStr);
end;

procedure TForm1.SendAllUser(Handle: integer; UserName, Sex, Logined, Registered,ID: string);
var
  i:integer;
  FQuery:TADOQuery;
begin
  FQuery:=TADOQuery.Create(nil);
  try
    FQuery.Connection :=Chat.Con;
    FQuery.SQL.Text :='select Handle from UserInfo where Logined=1';
    FQuery.Open;

    for i:=0 to s.Socket.ActiveConnections-1 do
    begin
      if FQuery.Locate('Handle',s.Socket.Connections[i].SocketHandle,[])
        and (s.Socket.Connections[i].SocketHandle<>Handle) then
        SendBy(s.Socket.Connections[i],
          'G',inttostr(Handle),UserName,Sex,Logined,Registered,ID,'');
    end;
    FQuery.Close;
  finally
    FQuery.Free;
  end;
end;

procedure TForm1.GetUserInfoByID(ID: String);
begin
  Chat.Temp.close;
  Chat.Temp.SQL.Clear ;
  Chat.Temp.SQL.Add('select ID,UserName,Sex,Remark,ImageIndex from UserInfo');
  Chat.Temp.SQL.Add('where ID='''+ID+'''');
  Chat.Temp.open;
  //Chat.Temp.Requery([]);
end;

procedure TForm1.ListBox2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  Offset: Integer;
  Bitmap:TBitmap;
begin
  Bitmap:=nil;
  if (Control as TListBox).Name='ListBox2' then
    Bitmap:=image1.Picture.Bitmap
  else if (Control as TListBox).Name='ListBox1' then
    Bitmap:=image2.Picture.Bitmap;

  with (Control as TListBox).Canvas do
  begin
    FillRect(Rect);
    Offset := 1;
    if Bitmap<>nil then
    begin
      BrushCopy(Bounds(Rect.Left + 2, Rect.Top, Bitmap.Width, Bitmap.Height),
              Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), RGB(255,0,255));
      Offset := Bitmap.width + 6;
    end;
    TextOut(Rect.Left+Offset, Rect.Top+1, (Control as TListBox).Items[Index])
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.E1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  ID:string;
  i:integer;
begin
  if ListBox1.ItemIndex<>-1 then
  begin
    ID:=GetTextID(ListBox1.Items.Strings[ListBox1.ItemIndex],'(');
    if selectUser(ID,'A',0,0,1,UserName,Sex) then
    begin
      i:=GetIndexByHandle(Chat.qryUserHandle.AsInteger);
      SendBy(s.Socket.Connections[i],'admin','0','Admin'+'('+datetimetoStr(Now)+'): '+#13#10+'  '+Memo2.Lines.Text,
        '','','','','');
      memo1.Lines.Add('Admin'+'('+datetimetoStr(Now)+'): '+#13#10+'  '+Memo2.Lines.Text);
      SendMessage(memo1.Handle,EM_SCROLL,SB_BOTTOM,0);
      Memo2.Lines.Clear;
    end;
  end
  else
    showmessage('请选择用户！');
end;

procedure TForm1.ClearOffUser;
var
  i:integer;
  ConnectCount:integer;
begin
  Chat.qryOffUser.Open ;

  while not Chat.qryOffUser.Eof do
  begin
    ConnectCount:=0;
    for i:=0 to s.Socket.ActiveConnections-1 do
      if Chat.qryOffUser.Fields[0].AsInteger<>s.Socket.Connections[i].SocketHandle then
        inc(ConnectCount);

    if (ConnectCount=s.Socket.ActiveConnections) then
    begin
      Chat.UpTemp.Close ;
      Chat.UpTemp.SQL.Clear ;
      Chat.UpTemp.SQL.Add('Update UserInfo');
      Chat.UpTemp.SQL.Add('Set Logined=0');
      Chat.UpTemp.SQL.Add('Where ID='''+Chat.qryOffUser.Fields[1].AsString+'''');
      Chat.UpTemp.ExecSQL;

      for i:=ListBox1.Items.Count-1 downto 0 do
        if Chat.qryOffUser.Fields[1].AsString=GetTextID(ListBox1.Items.Strings[i],'(') then
          ListBox1.Items.Delete(i);

      SendAllUser(Chat.qryOffUser.Fields[0].AsInteger,Chat.qryOffUser.Fields[2].AsString,
                  Chat.qryOffUser.Fields[3].AsString,'0','0',Chat.qryOffUser.Fields[1].AsString);
    end;
    Chat.qryOffUser.next;
  end;
  Chat.qryOffUser.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to s.Socket.ActiveConnections-1 do
    SendBy(s.Socket.Connections[i],'?','','','','','','','');
  ClearOffUser;
end;

procedure TForm1.N10Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to s.Socket.ActiveConnections-1 do
    SendBy(s.Socket.Connections[i],'?','','','','','','','');
  sleep(1);  
  ClearOffUser;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  if not assigned(form2) then
  begin
    form2:=TForm2.Create(self);
    form2.ShowModal ;
  end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  if not assigned(PasswordDlg) then
  begin
    PasswordDlg:=TPasswordDlg.Create(self);
    PasswordDlg.ShowModal ;
  end;
end;

procedure TForm1.UpdateState;
begin
  if Logined then
  begin
    N9.ImageIndex :=1;
    ToolButton1.ImageIndex :=1;
    StatusBar1.Panels[0].Text :='状态:已登录';
    U1.ImageIndex :=2;
    N1.ImageIndex :=4;
    N2.ImageIndex :=6;
    B1.ImageIndex :=8;
    N10.ImageIndex :=11;
    N4.ImageIndex :=13;
    ToolButton2.ImageIndex :=2;
    ToolButton4.ImageIndex :=4;
    ToolButton5.ImageIndex :=6;
    ToolButton6.ImageIndex :=8;
    ToolButton9.ImageIndex :=11;
  end
  else
  begin
    N9.ImageIndex :=0;
    ToolButton1.ImageIndex :=0;
    StatusBar1.Panels[0].Text :='状态:未登录';
    U1.ImageIndex :=3;
    N1.ImageIndex :=5;
    N2.ImageIndex :=7;
    B1.ImageIndex :=9;
    N10.ImageIndex :=12;
    N4.ImageIndex :=14;
    ToolButton2.ImageIndex :=3;
    ToolButton4.ImageIndex :=5;
    ToolButton5.ImageIndex :=7;
    ToolButton6.ImageIndex :=9;
    ToolButton9.ImageIndex :=12;
  end;
  N9.Enabled :=not Logined;
  ToolButton1.Enabled :=not Logined;
  U1.Enabled :=Logined;
  N1.Enabled :=Logined;
  N2.Enabled :=Logined;
  B1.Enabled :=Logined;
  N10.Enabled :=Logined;
  N4.Enabled :=Logined;
  ToolButton2.Enabled :=Logined;
  ToolButton4.Enabled :=Logined;
  ToolButton5.Enabled :=Logined;
  ToolButton6.Enabled :=Logined;
  ToolButton9.Enabled :=Logined;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UserList:=TStringList.Create;

  StatusBar1.Panels[0].Text :='状态:未登录';
  N1.Enabled :=false;
  N1.ImageIndex :=5;
  N2.Enabled :=false;
  N2.ImageIndex :=7;
  B1.Enabled :=false;
  B1.ImageIndex :=9;
  N10.Enabled :=false;
  N10.ImageIndex :=12;
  N4.Enabled :=false;
  N4.ImageIndex :=14;
  U1.Enabled :=false;
  U1.ImageIndex :=3;
  ToolButton2.Enabled :=false;
  ToolButton2.ImageIndex :=3;
  ToolButton4.Enabled :=false;
  ToolButton4.ImageIndex :=5;
  ToolButton5.Enabled :=false;
  ToolButton5.ImageIndex :=7;
  ToolButton6.Enabled :=false;
  ToolButton6.ImageIndex :=9;
  ToolButton9.Enabled :=false;
  ToolButton9.ImageIndex :=12;
end;

procedure TForm1.U1Click(Sender: TObject);
begin
  Logined:=false;
  UpDateState;
  N9.ImageIndex :=0;
  ToolButton1.ImageIndex :=0;
  N9.Enabled :=true;
  ToolButton1.Enabled :=true;
  Locked:=true;
end;

procedure TForm1.UMRestoreApplication(var Message: TMessage);
begin
  if IsIconic(application.Handle) then
    application.Restore
  else
    application.BringToFront ;   
end;

procedure TForm1.StrToList(Str: string; var List: TStrings;
  BreakSymbol: string);
var
  I: Integer;
begin
  for I := 1 to Length(Str) do
    if Str[I] = BreakSymbol then
      Str[I] := #13;
  List.Text := Str;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if not assigned(addfrm) then
    addfrm:=Taddfrm.Create(self);
  addfrm.ShowModal;    
end;

function TForm1.StringsToStr(Str, BreakSymbol: string): string;
var
  S: TStrings;
  i: Integer;
begin
  Result := '';
  S := TStringList.Create;
  try
    S.Text := Str;
    for i := 0 to S.Count - 1 do
      if i<S.Count then
        Result := Result + Trim(S[i]) + BreakSymbol
      else
        Result := Result + Trim(S[i]);
  finally
    S.Free;
  end;
end;

procedure TForm1.WMQueryEndSession(var Msg: TMessage);
begin
  //CloseTheInstance;
  inherited;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CloseTheInstance;
end;

procedure TForm1.CloseTheInstance;
var
  i:integer;
begin
  if chat.Con.Connected then
  begin
    if chat.RealTemp.Active then
      chat.RealTemp.Close;
    chat.RealTemp.SQL.Clear;     
    chat.RealTemp.SQL.Text:='select Handle from UserInfo'+#13+
                            'where Logined=1';
    chat.RealTemp.Open;
    if not chat.RealTemp.IsEmpty then
    begin
      while not chat.RealTemp.Eof do
      begin
        i:=GetIndexByHandle(chat.RealTemp.Fields[0].AsInteger);
        SendBy(s.Socket.Connections[i],'admin','1','Admin'+'('+datetimetoStr(Now)+'):'+#13#10+'  服务器将在一分种后关闭...' ,
          '','','','','');
        chat.RealTemp.Next;
      end;
    end;
    chat.RealTemp.Close;  
    //sleep(60000);
    chat.Con.Connected :=false;
  end;

  if assigned(UserList) then
    UserList.Free;
end;


procedure TForm1.ReturnGameCommand(MyHandle, UserHandle, CommandStr, Param1,
  Param2,Param4,Param5: string);
var
  i:integer;
  FFlag,FNowStyle:integer;
  LinesStyle:integer;
begin
  randomize;
  Fflag:=random(7);
  FNowStyle:=1;
  case Fflag of
    0: FNowStyle:=1;
    1,2,6: FNowStyle:=random(2)+1;
    3,4,5: FNowStyle:=random(4)+1;
  end;

  LinesStyle:=random(16384);//2的14次方，因为俄罗斯的宽度为14
  if LinesStyle=0 then
    inc(LinesStyle)
  else if LinesStyle=16383 then
    dec(LinesStyle);

  i:=GetIndexByHandle(strtoint(UserHandle));//用户的句柄
  SendBy(s.Socket.Connections[i],'P',UserHandle,Param1+'.'+inttostr(Fflag),Param2+'.'+inttostr(FNowStyle),'Secd',inttostr(Fflag)+'.'+inttostr(FNowStyle)+';'+inttostr(LinesStyle),Param5,CommandStr);

  i:=GetIndexByHandle(strtoint(MyHandle));//自己的句柄
  SendBy(s.Socket.Connections[i],'P',MyHandle,Param1+'.'+inttostr(Fflag),Param2+'.'+inttostr(FNowStyle),'Prim',inttostr(Fflag)+'.'+inttostr(FNowStyle)+';'+inttostr(LinesStyle),Param4,CommandStr);
end;

function TForm1.NewID(Handle:integer=0): string;
var
  x:TTimeStamp;
begin
  x:=DateTimetoTimeStamp(now);
  result:=inttostr(lo(x.Date))+inttostr(hi(x.Time))+inttostr(Handle);
end;

procedure TForm1.B1Click(Sender: TObject);
begin
  if not assigned(frmBrowseUser) then
    frmBrowseUser:=TfrmBrowseUser.Create(nil);
  BrowseUser;
  frmBrowseUser.Show;
end;

procedure TForm1.BrowseUser;
var
  UserItem:TListItem;
begin
  if not assigned(frmBrowseUser) then exit;

  frmBrowseUser.UserList.Clear;  

  Chat.qryUser.Close;
  Chat.qryUser.Parameters.ParamByName('ID').Value:=0;
  Chat.qryUser.Parameters.ParamByName('PasswordA').Value:='a';
  Chat.qryUser.Parameters.ParamByName('a').Value:=0;
  Chat.qryUser.Parameters.ParamByName('b').Value:=0;
  Chat.qryUser.Parameters.ParamByName('c').Value:=0;
  Chat.qryUser.Open;

  while not Chat.qryUser.Eof do
  begin
    UserItem:=frmBrowseUser.UserList.Items.Add;
    UserItem.Caption:=Chat.qryUser.FieldValues['UserName'] ;
    UserItem.ImageIndex:=Chat.qryUser.FieldValues['Sex']*2+Chat.qryUser.FieldValues['Logined']+17+2*Chat.qryUser.FieldValues['Deleted']*(2-Chat.qryUser.FieldValues['Sex']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['ID']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Host']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Address']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Deleted']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Handle']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Logined']);
    UserItem.SubItems.Add(Chat.qryUser.FieldValues['Sex']);
    Chat.qryUser.Next;
  end;

  frmBrowseUser.Label1.Caption:=' 共'+inttostr(frmBrowseUser.UserList.Items.Count)+'位：';
end;

procedure TForm1.G1Click(Sender: TObject);
begin
  frmConfig:=TfrmConfig.Create(nil);
  frmConfig.ShowModal;
  freeandnil(frmConfig);
end;

end.
