unit file_share;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Tabs, Menus, shellapi, DragDrop, IdGlobal,
  //DropTarget, DragDropFile, DropSource, DragDropInternet,
  Winsock, IniFiles, Jpeg,
  StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdUDPServer, IdSocketHandle,
  IdTCPConnection, IdTCPClient, Buttons, filectrl;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    TreeView1: TTreeView;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    N5: TMenuItem;
    Memo1: TMemo;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    ProgressBar1: TProgressBar;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Label1: TLabel;
    TreeView2: TTreeView;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N4: TMenuItem;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure getini;
    procedure getini2;
    procedure saveini;
    procedure GetFile(ip, Sfilename, TFilename: string);
    procedure ListView1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    function AllOverTreeView(node: TTreenode): TTreenode;
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeView1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    hostName, hostIP: string;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean); ///////消息处理函数
  end;


var
  Form4: TForm4;

implementation

uses uDefine;

{$R *.dfm}

procedure Tform4.Getfile(ip, Sfilename, TFilename: string);
var
  Request: TRequest;
  ResponseBlock: TResponseBlock;
  FileInfo: TInfo;
  FS: TFileStream;
  I: Integer;
begin
  ZeroMemory(@Request, SizeOf(Request));
  ZeroMemory(@ResponseBlock, SizeOf(ResponseBlock));
  ZeroMemory(@FileInfo, SizeOf(FileInfo));
  StrCopy(Request.Info.FileName, PChar(Sfilename)); //请注拷贝服务器的文件
  Request.RequestType := RT_Info;
  IdUDPClient1.BufferSize := 8192;
  IdUDPClient1.SendBuffer(IP, 8000, Request, SizeOf(Request));
  IdUDPClient1.ReceiveBuffer(FileInfo, SizeOf(FileInfo));
  if FileInfo.FileName <> '==Directory==' then //有此文件则拷贝
  begin
    FS := TFileStream.Create(TFilename, fmCreate); //拷贝到本地的文件名
    try
      Request.Info := FileInfo;
      Request.RequestType := RT_Block;
      Self.ProgressBar1.Position := 0;
      Self.ProgressBar1.Max := FileInfo.BlockCount;
      Self.ProgressBar1.Step := 1;
      for i := 1 to FileInfo.BlockCount do
      begin
        application.processmessages;
        Request.Info.BlockPostion := i;
        IdUDPClient1.SendBuffer(IP, 8000, Request, SizeOf(Request));
        IdUDPClient1.ReceiveBuffer(ResponseBlock, SizeOf(ResponseBlock));
        FS.Write(ResponseBlock.Block.Data, ResponseBlock.Block.DataSize);
        Self.ProgressBar1.StepIt;
      end;
      Self.ProgressBar1.Position := 0;
    finally
      SetFileTime(fs.Handle, @FileInfo.FindData.ftCreationTime, @FileInfo.FindData.ftLastAccessTime, @FileInfo.FindData.ftLastWriteTime);
      FS.Free;
    end;
  end
  else
  begin
    CreateDirectory(pchar(TFilename), nil);
  end;
end;

function IPTOName(IPAddress: string): string; //根据IP取得计算机名称
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  addr: dword;
begin
  result := '';
  WSAStartup(2, WSAData);
  try
    addr := inet_addr(PChar(IPAddress));
    HostEnt := GetHostByAddr(@addr, Length(IPAddress), PF_INET);
    result := HostEnt.h_name;
  except
  end;
end;

function NameToIP(Name: string): string; //根据计算机名称取IP地址
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
begin
  result := '';
  WSAStartup(2, WSAData);
  HostEnt := GetHostByName(PChar(Name));
  if HostEnt <> nil then
  begin
    with HostEnt^ do
      result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

function GetComName: string; //取本机计算机名称
var
  ComputerName: array[0..MAX_COMPUTERNAME_LENGTH + 1] of char;
  Size: Cardinal;
begin
  result := '';
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(ComputerName, Size);
  result := StrPas(ComputerName);
end;

procedure DirToTreeView(Tree: TTreeView; Directory: string; Root: TTreeNode; IncludeFiles:
  Boolean);
var
  SearchRec: TSearchRec;
  ItemTemp: TTreeNode;
  Files, dirs: string;
begin
  files := Directory;
  if files <> '' then
  begin
    with Tree.Items do
    try
      BeginUpdate;
      if Directory[Length(Directory)] = '\' then Directory := copy(Directory, 1, length(Directory) - 1); //
      dirs := ExtractFileName(Directory);
      if Directory[Length(Directory)] <> '\' then Directory := Directory + '\';
      if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
      begin
        Root := AddChild(Root, dirs); //如果是文件夹，则加一个节点
        form4.memo1.Lines.Add(dirs);
        repeat
          if (SearchRec.Attr and faDirectory = faDirectory) and (SearchRec.Name[1] <> '.') then
          begin
            if (SearchRec.Attr and faDirectory > 0) then
            begin
              Root := AddChild(Root, SearchRec.Name);
              form4.memo1.Lines.Add(Directory + SearchRec.name);
            end;
            ItemTemp := Root.Parent;
            DirToTreeView(Tree, Directory + SearchRec.Name, Root, IncludeFiles);
            Root := ItemTemp;
          end
          else if IncludeFiles then
            if SearchRec.Name[1] <> '.' then
            begin
              AddChild(Root, SearchRec.Name);
              form4.memo1.Lines.Add(Directory + SearchRec.Name);
            end;
        until FindNext(SearchRec) <> 0;
        FindClose(SearchRec);
      end
      else
      begin
        AddChild(Root, files);
        form4.memo1.Lines.Add(files);
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TForm4.getini; //取本地共享文件列表
var f: TEXTFile;
  s: string;
begin
  if fileExists(ExtractFileDir(ParamStr(0)) + '\Config.INI') then
  begin
    AssignFile(F, ExtractFileDir(ParamStr(0)) + '\Config.INI');
{$I-}
    Reset(F);
{$I+}
    if IOResult = 0 then
    begin
      memo1.Lines.Clear;
      memo1.Lines.Add(Label2.caption);
      with TreeView1.Items do
      try
        BeginUpdate;
        Clear;
        AddChild(nil, Label2.caption); //加顶级节点
      finally
        EndUpdate;
      end;
      Readln(F, s);
      DirToTreeView(TreeView1, s, TreeView1.Items[0], true);
      while not eof(f) do
      begin
        Readln(F, S);
        DirToTreeView(TreeView1, s, TreeView1.Items[0], true);
      end;
      CloseFile(F);
    end;
  end;
end;

procedure TForm4.getini2; //远程要求的共享文件列表
var f: TEXTFile;
  s: string;
begin
  if fileExists(ExtractFileDir(ParamStr(0)) + '\Config.INI') then
  begin
    AssignFile(F, ExtractFileDir(ParamStr(0)) + '\Config.INI');
{$I-}
    Reset(F);
{$I+}
    if IOResult = 0 then
    begin
      memo1.Lines.Clear;
      memo1.Lines.Add(HostName);
      with TreeView2.Items do
      try
        BeginUpdate;
        Clear;
        AddChild(nil, HostName); //加顶级节点
      finally
        EndUpdate;
      end;
      Readln(F, s);
      DirToTreeView(TreeView2, s, TreeView2.Items[0], true);
      while not eof(f) do
      begin
        Readln(F, S);
        DirToTreeView(TreeView2, s, TreeView2.Items[0], true);
      end;
      CloseFile(F);
    end;
    TreeView2.SaveToFile('temp.ini');
    Memo1.Lines.SaveToFile('Temp1.ini');
  end;
end;

procedure TForm4.ListView1Click(Sender: TObject);
var s: string;
begin
  if ListView1.itemindex >= 0 then
  begin
    s := listview1.items[ListView1.itemindex].Caption;
    Label2.caption := s;
    if s = GetComName then getini //如果计算机名是本机，就读取共享目录清单
    else
    begin
      with TreeView1.Items do
      try
        BeginUpdate;
        Clear;
        AddChild(nil, Label2.caption); //加顶级节点
      finally
        EndUpdate;
      end;
      IdUDPClient1.Host := NameToIP(s);
      IdUDPClient1.Active := true;
      IdUDPClient1.Send('L=' + GetComName + ',' + NameToIP(GetComName));
      IdUDPClient1.Active := false;
    end;
  end;
end;

procedure TForm4.saveini;
var f: TEXTFile;
  MyIniFile: TIniFile;
begin
(*
  if fileExists(ExtractFileDir(ParamStr(0)) + '\Config.INI') then
  begin
    AssignFile(F, ExtractFileDir(ParamStr(0)) + '\Config.INI');
{$I-}
    Rewrite(F);
{$I+}
    if IOResult <> 0 then
    begin
      Writeln(F, tToStr(maxdw)); //最大量程 add 2000.9.12
      for i := 1 to x - 1 do
        Writeln(F, floattostr(scl[i]));
      CloseFile(F);
    end;
  end;
*)
end;

procedure TForm4.Button1Click(Sender: TObject);
var s, str, s1: string;
  i, i1: integer;
begin
  s1 := '';
  str := NameToIP(GetComName);
  i1 := 0;
  for i := 1 to length(str) do
  begin
    if copy(str, i, 1) = '.' then inc(i1);
    if i1 < 3 then s1 := s1 + copy(str, i, 1)
    else
    begin
      s1 := s1 + '.255';
      break;
    end;
  end;
  s := 'S=' + GetComName + ',' + NameToIP(GetComName);
  ListView1.Items.Clear;
  IdUDPClient1.Host := s1; //'202.116.1.255';本网段广播
  IdUDPClient1.Active := true;
  IdUDPClient1.Send(s);
  IdUDPClient1.Active := false;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdUDPServer1.Active := false;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  //设置需要处理文件WM_DROPFILES拖放消息
  DragAcceptFiles(TreeView1.Handle, TRUE);
  //设置AppMessage过程来捕获所有消息
  Application.OnMessage := AppMessage;
  IdUDPServer1.Active := true;
end;

procedure TForm4.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  nFiles, I, j: Integer;
  Filename, s: string;
  ListItem: TListItem;
begin
  //
  //   注意！所有消息都将通过这里！
  //   不要在此过程中编写过多的或者需要长时间操作的代码，否则将影响程序的性能
  //
  //   判断是否是发送到ListView1的WM_DROPFILES消息
  if (Msg.message = WM_DROPFILES) and (msg.hwnd = TreeView1.Handle) then
  begin
  //   取dropped   files的数量
    nFiles := DragQueryFile(Msg.wParam, $FFFFFFFF, nil, 0);
  //   循环取每个拖下文件的全文件名
    for I := 0 to nFiles - 1 do ////////支持拖动多个文件过来
    begin
  //   为文件名分配缓冲   allocate   memory
      SetLength(Filename, 255);
  //   取文件名   read   the   file   name
      DragQueryFile(Msg.wParam, I, PChar(Filename), 255);
      Filename := PChar(Filename);
  //file://将全文件名分解程文件名和路径
  ////////FileName为拖过来的文件，包括文件全路径。
  ///////////////////////此处实现对文件的操作
      DirToTreeView(TreeView1, Filename, TreeView1.Selected, true);

      if Treeview1.Selected <> nil then
      begin
//        if TreeView1.SelectionCount = 1 then
//        begin
          for j := 0 to TreeView1.Items.Count - 1 do
            if (TreeView1.items.Item[j].Selected) then
            begin
              s := ExtractFilePath(Memo1.Lines[j]);
              Label1.caption := s;
              if TreeView1.items.Item[0].Text <> HostName then
              begin
                IdUDPClient1.Host := NameToIP(TreeView1.items.Item[0].Text);
                IdUDPClient1.Active := true;
                IdUDPClient1.Send('SF=' + ',' + HostIP + ',' + FileName + ',' + s + ExtractFileName(Filename));
                IdUDPClient1.Active := false;
              end;
            end;
//        end;
      end;
    end;
  //file://结束这次拖放操作
    DragFinish(Msg.wParam);
  //file://标识已处理了这条消息
    Handled := True;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  Panel5.caption := '本机计算机名：' + GetComName + '   本机IP:' + NameToIP(GetComName);
  hostIP := NameToIP(GetComName);
  HostName := GetComName;
  Button1Click(self);
end;

procedure TForm4.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Treeview1.Selected = nil then Exit;
end;

procedure TForm4.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  Node: TTreeNode;
begin
  if Source = Treeview1 then
  begin
    Node := Treeview1.GetNodeAt(X, Y);
    if Node <> nil then
      Accept := true;
  end;
end;

procedure TForm4.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: integer;
begin
  if treeview1.getnodeat(x, y) <> nil then
    treeview1.getnodeat(x, y).selected := true;

  if Treeview1.Selected = nil then
    Exit;

  if (DragDetectPlus(TWinControl(Sender).Handle, Point(X, Y))) then
  begin
    // Delete anything from a previous drag.
//    DropFileSource1.Files.Clear;

    // Fill DropSource1.Files with selected files from ListView1.
    for i := 0 to TreeView1.Items.Count - 1 do
      if (TreeView1.items.Item[i].Selected) then
      begin
        if ListView1.itemindex >= 0 then
        begin
//          GetFile(NameToIP(listview1.items[ListView1.itemindex].Caption), Memo1.Lines[i - 1], 'c:\1.doc');
        end;
//        DropFileSource1.Files.Add(Memo1.Lines[i - 1]);
//        DropFileSource1.Files.Add(TreeView1.items.Item[i].Text);
        form4.caption := Memo1.Lines[i - 1];
      end;
//        DropFileSource1.Files.Add('\\sctcdata\交换文档\' + TreeView1.items.Item[i].Text);

    // Start the dragdrop.
//    DropFileSource1.Execute;
  end;
end;

procedure TForm4.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  i, j: integer;
  t, s, s2, s1, ip: string;
  lp: Tstringstream;
  str: string;
(************************************************)
  Request: TRequest;
  ResponseBlock: TResponseBlock;
  ResponseFile: TFileStream;
  FileInfo: TInfo;
begin
  if AData.Size = SizeOf(Request) then
  begin
    ZeroMemory(@Request, SizeOf(Request));
    ZeroMemory(@ResponseBlock, SizeOf(ResponseBlock));
    ZeroMemory(@FileInfo, SizeOf(FileInfo));
    AData.Read(Request, SizeOf(Request));
    case Request.RequestType of
      RT_Info:
        begin
          if FileExists(Request.Info.FileName) then
          begin
            ResponseFile := TFileStream.Create(Request.Info.FileName, fmOpenRead);
            try
              application.processmessages;
              FileInfo.FileName := Request.Info.FileName;
              FileInfo.Size := ResponseFile.Size;
              FileInfo.BlockPostion := 0;
              FindFirstFile(Request.Info.FileName, FileInfo.FindData);
              FileInfo.BlockCount := GetBlockCount(ResponseFile.Size, Sizeof(ResponseBlock.Block.Data));
              ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, FileInfo, SizeOf(FileInfo));
            finally
              ResponseFile.Free;
            end;
          end
          else
          begin
            FileInfo.FileName := '==Directory==';
            ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, FileInfo, SizeOf(FileInfo));
          end;
        end;
      RT_Block:
        begin
          if FileExists(Request.Info.FileName) then
          begin
            ResponseFile := TFileStream.Create(Request.Info.FileName, fmOpenRead);
            try
              if ResponseFile.Size = Request.Info.Size then
              begin
                application.processmessages;
                ResponseFile.Seek((Request.Info.BlockPostion - 1) * SizeOf(ResponseBlock.Block.Data), soBeginning);
                ResponseBlock.Info := Request.Info;
                ResponseBlock.Block.DataSize := ResponseFile.Read(ResponseBlock.Block.Data, SizeOf(ResponseBlock.Block.Data));
                ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, ResponseBlock, SizeOf(ResponseBlock));
              end;
            finally
              ResponseFile.Free;
            end;
          end;
        end;
    end;
  end
  else
  begin
    lp := Tstringstream.Create(str);
    lp.CopyFrom(AData, AData.Size);
    s := lp.DataString;
    lp.Free;

    if copy(s, 1, 2) = 'S=' then //收到查询上网计算机的命令
    begin
      s1 := copy(s, 3, pos(',', s) - 3);

      IP := copy(s, pos(',', s) + 1, length(s));
      s := 'R=' + GetComName + ',' + NameToIP(GetComName); //回复：根据查询的IP进行回复
      IdUDPServer1.Send(IP, 8000, s);
    end;
    if copy(s, 1, 2) = 'R=' then //收到回复
    begin
      s1 := copy(s, 3, pos(',', s) - 3);
      j := 0;
      for i := 0 to ListView1.Items.Count - 1 do
        if ListView1.Items[i].Caption = S1 then j := 1;

      if j = 0 then
        ListView1.Items.Add.Caption := s1;
    end;
    if copy(s, 1, 2) = 'L=' then //要求取共享目录
    begin
      IP := copy(s, pos(',', s) + 1, length(s));
      Getini2;
      IdUDPServer1.Send(IP, 8000, 'OK' + HostName + ',' + HostIP);
    end;
    if copy(s, 1, 2) = 'OK' then //要求取共享目录
    begin
      IP := copy(s, pos(',', s) + 1, length(s));
      getfile(IP, 'temp.ini', 'temp.ini');
      getfile(IP, 'temp1.ini', 'temp1.ini');
      TreeView1.LoadFromFile('temp.ini');
      memo1.Lines.LoadFromFile('temp1.ini');
      deletefile('temp.ini');
      deletefile('temp1.ini');
    end;
    if copy(s, 1, 3) = 'SF=' then //接收文件
    begin
      j := 0;
      t := '';
      for i := 4 to length(s) do
      begin
        if s[i] = ',' then
        begin
          inc(j);
          if j = 2 then
          begin
            ip := t;
            t := '';
          end;
          if j = 3 then
          begin
            s1 := t;
            t := '';
          end;
        end
        else t := t + s[i];
      end;
      getfile(IP, s1, t);
    end;
  end;
end;

procedure TForm4.N6Click(Sender: TObject);
begin
  Button1Click(self);
end;

procedure TForm4.N7Click(Sender: TObject);
var i, j: integer;
  s, s1: string;
  kk: ttreeNode;
  t_dir: string;
begin
  if Treeview1.Selected = nil then Exit;
  if selectDirectory('请选择操作目录', '', s1) then //打开目录
  begin
    for i := 0 to TreeView1.Items.Count - 1 do
      if (TreeView1.items.Item[i].Selected) then
      begin
        if TreeView1.items.Item[i].Count = 0 then //
        begin
          s := ExtractFileName(Memo1.Lines[i]);
          Label1.caption := s;
          if TreeView1.items.Item[0].Text <> HostName then
          begin
            GetFile(NameToIP(Label2.caption), Memo1.Lines[i], s1 + '\' + s);
          end
          else copyfile(pchar(Memo1.Lines[i]), pchar(s1 + '\' + s), true); //本地拷贝文件
        end
//      else AllOverTreeView(TreeView1.items.Item[i]);
      end;
  end;
end;

procedure TForm4.TreeView1DblClick(Sender: TObject);
var i: integer;
  s, s1: string;
begin
  if Treeview1.Selected = nil then
    Exit;
  if TreeView1.SelectionCount = 1 then
  begin
    for i := 0 to TreeView1.Items.Count - 1 do
      if (TreeView1.items.Item[i].Selected) then
      begin
        s := ExtractFileName(Memo1.Lines[i]);
        Label1.caption := s;
        if TreeView1.items.Item[0].Text <> HostName then
        begin
          GetFile(NameToIP(Label2.Caption), Memo1.Lines[i], s);
          shellexecute(0, 'open', pchar(s), '', '', sw_shownormal);
        end
        else
          shellexecute(0, 'open', pchar(Memo1.Lines[i]), '', '', sw_shownormal); //打开本地文件
      end;
  end;
end;

procedure TForm4.N10Click(Sender: TObject);
begin
  N7Click(self);
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
var s, s1: string;
begin
  s := 'd:\1122\asd\343\redame.txt';
  s1 := ExtractFileDir(s);
  ForceDirectories(pchar(s1)); //创建多层目录;
  copyfile(pchar('E:\2440\redame.txt'), pchar(s), true); //本地拷贝文件
end;

procedure TForm4.TreeView1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  node: ttreenode;
begin
{
  if button = mbright then
  begin
    node := treeview1.getnodeat(x, y);
    node.selected := true;
  end;
}
end;

function TForm4.AllOverTreeView(node: TTreenode): TTreenode;
begin
  while node <> nil do
  begin
    if node.HasChildren then
    begin
      application.processmessages;
//      GetFile(NameToIP(Label2.Caption), Memo1.Lines[node.Index], 'c:\123\' + ExtractFileName(Memo1.Lines[node.Index]));
      node := node.getFirstChild;
      allovertreeview(node);
      node := node.Parent;
    end;
    if node.getNextSibling <> nil then
    begin
      application.processmessages;
      GetFile(NameToIP(Label2.Caption), Memo1.Lines[node.Index], 'c:\123\' + ExtractFileName(Memo1.Lines[node.Index]));
      node := node.getNextSibling;
    end
    else
      exit;
  end;
end;

end.

