unit fileshare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Tabs, DockTabSet, Menus, shellapi, DragDrop,IdGlobal,
  DropTarget, DragDropFile, DropSource, DragDropInternet, Winsock, IniFiles, Jpeg,
  StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdUDPServer, IdSocketHandle,
  //IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,

  UntUdpCtl;
//  IdSocketHandle;

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
    DropFileSource1: TDropFileSource;
    DropURLSource1: TDropURLSource;
    DropURLTarget1: TDropURLTarget;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button1: TButton;
    N4: TMenuItem;
    N5: TMenuItem;
    Memo1: TMemo;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    Memo2: TMemo;
    Memo3: TMemo;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure getini;
    procedure saveini;
    procedure ListView1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SendFile(ip, files: string);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure OnCaseClentData(ISender: TudpCtl; IData: Pointer; ISize: Cardinal; IFromIP: string; IPort: integer);
    procedure OnCaseSvrData(ISender: TudpCtl; IData: Pointer; ISize: Cardinal;
      IFromIP: string; IPort: integer);
  public
    FileName: string;
    FileSize: integer;
    SvrUDPCtl: TudpCtl;
    ClientUdpCtl: TudpCtl;
    Lmem: TMemoryStream;
    Mem: TFileStream;
    procedure OnError(Sender: TObject; IData: PSafeUdpData; IErrorKind: SHeadLv);
    { Public declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean); ///////消息处理函数
  end;


var
  Form4: TForm4;

implementation

uses UntProctol; //, pmybasedebug;

{$R *.dfm}


procedure TForm4.OnCaseSvrData(ISender: TudpCtl; IData: Pointer; ISize:
  Cardinal; IFromIP: string; IPort: integer);
var
  Lp, LTep: PChar;
begin
  with ISender do begin
    case PInteger(IData)^ of //
      1: begin
          LTep := IData;
          Lp := GetMemory(ISize);
          inc(LTep, Sizeof(rhead));
          CopyMemory(Lp, LTep, ISize);
          Memo3.Text := StrPas(Lp);
          Memo3.Lines.SaveToFile('c:\1.text');
          FreeMemory(Lp);
        end;
    end; // case
  end; // with
end;

procedure TForm4.OnCaseClentData(ISender: TudpCtl; IData: Pointer; ISize:
  Cardinal; IFromIP: string; IPort: integer);
begin
  with ISender do begin
    case PInteger(IData)^ of //
      1: begin
          ShowMessage('Svr Resp Hello');
        end;
    end; // case
  end;
end;

procedure TForm4.OnError(Sender: TObject; IData: PSafeUdpData;
  IErrorKind: SHeadLv);
begin
//  Gob_Debug.AddLogShower('第%d-%d个包异常了 类型%d',
//    [Idata^.Head.PackedId, Idata^.Head.Part, ord(IErrorKind)]);
end;

procedure TForm4.SendFile(ip, files: string);
var
  Lhead: Rhead;
  LP: PChar;
  i: integer;
begin
  Lhead.Id := 1;
  Lmem.Position := 0;
  Memo2.Lines.LoadFromFile(files);
  Lmem.WriteBuffer(lHead, Sizeof(Lhead));
  LP := GetMemory(Memo2.GetTextLen + 1);
  Lmem.SetSize(Memo2.GetTextLen + 1);
  i := Memo2.GetTextLen;
  form4.caption := inttostr(i);
  Memo2.GetTextBuf(LP, Memo2.GetTextLen + 1);
  Lmem.WriteBuffer(lp^, Memo2.GetTextLen + 1);
  FreeMemory(LP);

  ClientUdpCtl.RemoteHost := IP;
  ClientUdpCtl.PeerSize := 1024;
  ClientUdpCtl.ReSendTime := 200;
  ClientUdpCtl.FreeWindowsCount := 3;
  ClientUdpCtl.SleepTime := 6;
  ClientUdpCtl.SafeSendBuff(Lmem.Memory^, Lmem.Size);

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
  Files: string;
begin
  files := Directory;
  with Tree.Items do
  try
    BeginUpdate;
    if Directory[Length(Directory)] <> '\' then Directory := Directory + '\';
    if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
    begin
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
    else AddChild(Root, files);
  finally
    EndUpdate;
  end;
end;

procedure TForm4.getini;
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
      with TreeView1.Items do
      try
        BeginUpdate;
        Clear;
        AddChild(nil, '共享文档'); //加顶级节点
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

procedure TForm4.IdUDPServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var
  i, j: integer;
  s, s1, ip: string;
begin
  s := '';
  s1 := '';
  for i := 0 to high(adata) do //接收命令
    s := s + chr(adata[i]);


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
    IdUDPServer1.Send(IP, 8000, s);
  end;
end;

procedure TForm4.ListView1Click(Sender: TObject);
var s: string;
begin
  if ListView1.itemindex >= 0 then
  begin
    s := listview1.items[ListView1.itemindex].Caption;
    if s = GetComName then getini; //如果计算机名是本机，就读取共享目录清单
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
var s: string;
begin
  s := 'S=' + GetComName + ',' + NameToIP(GetComName);
  IdUDPClient1.Active := true;
  IdUDPClient1.Connect;
  IdUDPClient1.Send(s);
  IdUDPClient1.Disconnect;
  IdUDPClient1.Active := false;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  sendfile('127.0.0.1', ExtractFileDir(ParamStr(0)) + '\Config.INI');
end;

procedure TForm4.DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState;
  APoint: TPoint; var Effect: Integer);
begin
{  // Transfer the file name and contents from the data format.
  EditFileName.Text := FTargetDataFormat.FileName;

  // Limit the amount of data to 32Kb. If someone drops a huge amount on data on
  // us (e.g. the AsyncTransferSource demo which transfers 10Mb of data) we need
  // to limit how much data we try to stuff into the poor memo field. Otherwise
  // we could wait for hours before transfer was finished.
  MemoContents.Lines.Text := Copy(FTargetDataFormat.Contents, 1, 1024*32);
}
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdUDPServer1.Active := false;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  SvrUDPCtl := TudpCtl.Create(Self);
  SvrUDPCtl.OnDataCase := OnCaseSvrData;
  SvrUDPCtl.RemoteHost := '127.0.0.1';
  SvrUDPCtl.RemotePort := 8002;
  SvrUDPCtl.ServerPort := 8003;
  SvrUDPCtl.OnDataError := OnError;

  ClientUdpCtl := TudpCtl.Create(Self);
  ClientUdpCtl.OnDataCase := OnCaseClentData;
  ClientUdpCtl.RemoteHost := '127.0.0.1';
  ClientUdpCtl.RemotePort := 8002;
  ClientUdpCtl.ServerPort := 8003;
  ClientUdpCtl.OnDataError := OnError;
  Lmem := TMemoryStream.Create;

  //设置需要处理文件WM_DROPFILES拖放消息
  DragAcceptFiles(TreeView1.Handle, TRUE);
  //设置AppMessage过程来捕获所有消息
  Application.OnMessage := AppMessage;
  IdUDPServer1.Active := true;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  Lmem.Free;
end;

procedure TForm4.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  nFiles, I: Integer;
  Filename: string;
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
    end;
  //file://结束这次拖放操作
    DragFinish(Msg.wParam);
  //file://标识已处理了这条消息
    Handled := True;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
//  DirToTreeView(TreeView1, '\\sctcdata\交换文档', TreeView1.Items[0], true);
  Panel5.caption := '本机计算机名：' + GetComName + '   本机IP:' + NameToIP(GetComName);
end;

procedure TForm4.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Treeview1.Selected = nil then
    Exit;
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
  // If no files selected then we can't drag.
  if Treeview1.Selected = nil then
    Exit;

  // Wait for user to move cursor before we start the drag/drop.
  if (DragDetectPlus(TWinControl(Sender).Handle, Point(X, Y))) then
  begin
    // Delete anything from a previous drag.
    DropFileSource1.Files.Clear;

    // Fill DropSource1.Files with selected files from ListView1.
    for i := 0 to TreeView1.Items.Count - 1 do
      if (TreeView1.items.Item[i].Selected) then
      begin
        DropFileSource1.Files.Add(Memo1.Lines[i - 1]);
//        DropFileSource1.Files.Add(TreeView1.items.Item[i].Text);
        form4.caption := Memo1.Lines[i - 1];
      end;
//        DropFileSource1.Files.Add('\\sctcdata\交换文档\' + TreeView1.items.Item[i].Text);

    // Start the dragdrop.
    DropFileSource1.Execute;
  end;
end;

end.

