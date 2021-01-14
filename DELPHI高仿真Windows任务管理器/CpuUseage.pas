unit CpuUseage;
{
    自制任务管理器
    Tested on D7  Win XP SP4
    by maxyang
    QQ:122271697
    e-mail:maxwyu@21cn.com
    2007-05
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, Menus;
Const
  GRIDSIZE=12;
  CMRUN = WM_USER + 1001;
type
  TRGBArray = ARRAY[0..1024] OF TRGBTriple; // pf24bit
  pRGBArray = ^TRGBArray;
  TUseage=Class(TBitmap)
  private
    CurPos:Integer;
    procedure CM_RUN(var message:Tmessage);message CMRUN;
  public
   Constructor Create(iHeight,iWidth:Integer);
   procedure SetBgColor;
   procedure ReSize(iHeight,iWidth:Integer);
   procedure DrawGrid;
   procedure DrawLine(startX,startY,endX,endY:Integer);
  end;
  TMainForm = class(TForm)
    Timer: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Image1: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CpuPanel: TPanel;
    CpuImg: TImage;
    memPanel: TPanel;
    memImg: TImage;
    StatusBar: TStatusBar;
    procListView: TListView;
    TaskListView: TListView;
    endProcBtn: TButton;
    ImageList: TImageList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    MainMenu: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    X1: TMenuItem;
    N2: TMenuItem;
    A1: TMenuItem;
    V1: TMenuItem;
    H1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    H2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure endProcBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetProcList;
    procedure ShowWindowsList;
    procedure SetRate(aRate:Word);
  public
    { Public declarations }
  end;
  TSetThread = class(TThread)
  private
    { Private declarations }
    FBmp:TUseage;
    FMemBmp:TUseage;
  protected
    procedure Execute; override;
  public
    property Bitmap:TUseage Read FBmp Write FBmp;
    property MemBmp:TUseage Read FMemBmp Write FMembmp;
  end;
var
  MainForm: TMainForm;
  bgBmp:TUseage;
  memBmp:TUseage;
  mInfo:TMemoryStatus;
  doWork:TSetThread;
implementation

{$R *.dfm}
uses unitUseage,MemInfo,uProcInfo;

function EnablePrivilege(hToken: Cardinal; PrivName: string; bEnable: Boolean): Boolean;
var
TP: TOKEN_PRIVILEGES;
Dummy: Cardinal;
begin
TP.PrivilegeCount := 1;
LookupPrivilegeValue(nil, pchar(PrivName), TP.Privileges[0].Luid);
if bEnable then
TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
else TP.Privileges[0].Attributes := 0;
AdjustTokenPrivileges(hToken, False, TP, SizeOf(TP), nil, Dummy);
Result := GetLastError = ERROR_SUCCESS;
end;
function EnableDebugPrivilege: Boolean;
var
hToken: Cardinal;
begin
OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, hToken);
result:=EnablePrivilege(hToken,'SeDebugPrivilege', True);
CloseHandle(hToken);
end;


{ TUseage }


constructor TUseage.Create(iHeight, iWidth: Integer);
begin
   Inherited Create;
   CurPos := 0;
   Self.PixelFormat := pf24bit	;
   Self.Height := iHeight;
   Self.Width := iWidth;
   SetBgColor;
end;

procedure TUseage.DrawGrid;
var
  I,J:Integer;
begin
   Canvas.Pen.Color:=clGreen; 
   for J:=0 to Self.Height-1 do
   begin
      if (J mod GRIDSIZE)=0 then
      begin
       Canvas.MoveTo(0,J);
       canvas.LineTo(Self.Width-1,J);
      end;
   end;
   for J := 0 To Self.Width-1 do
   begin
     If (J mod GRIDSIZE)=0 then
     begin
       Canvas.MoveTo(J-(CurPos Mod GRIDSIZE),0);
       canvas.LineTo(J-(CurPos Mod GRIDSIZE),Self.Height-1);
     end;
   end;
   INC(CurPos);
   If CurPos=GRIDSIZE*100000 then
   CurPos := 0;
end;

procedure TUseage.DrawLine(startX, startY, endX, endY: Integer);
begin
  Canvas.MoveTo(startX,startY);
  Canvas.LineTo(endx,endY);
end;

procedure TUseage.ReSize(iHeight, iWidth: Integer);
begin
  Self.Height := iHeight;
  Self.Width := iWidth;
end;

procedure TUseage.SetBgColor;
var
  I,K:Integer;
  Line:pRGBArray;
begin
  For I := 0 To Self.Height-1 do
  begin
    Line := pRGBArray(Self.ScanLine[I]);
    For K := 0 To Self.Width -1 do
    begin
      Line[K].rgbtBlue := $00;
      Line[K].rgbtGreen := $00;
      Line[K].rgbtRed := $00;
    end;
  end;
end;

{ TSetThread }
procedure TSetThread.Execute;
var
  iX,iY,lastX,lastY,y,memY:Integer;
  pecValue:Array of Integer;
  pecMem:Array of Integer;
  iSeg,iMemSeg:Integer;
begin
  SetLength(pecValue,FBmp.Width);
  SetLength(pecMem,FMemBmp.Width);
  iSeg := Round(FBmp.Height / 100);
  iMemSeg := FMemBmp.Height;
  pecValue[FBmp.Width-1] := GetCPU_Usage*iSeg;
  GetMemInfo(mInfo);
  pecMem[FMemBmp.Width-1] := Round((((mInfo.dwTotalPhys/1024)-(mInfo.dwAvailPhys/1024))/(mInfo.dwTotalPageFile/1024))*iMemSeg);
  y := FBmp.Height+1;
  memY := FMemBmp.Height+1;
  While not Terminated do
  begin
     FBmp.SetBgColor;
     FBmp.DrawGrid;
     FMemBmp.SetBgColor;
     FMemBmp.DrawGrid;
     FBmp.Canvas.Pen.Color:=$0058FF35;
     FMemBmp.Canvas.Pen.Color := $0058FFFF;
     For iX := 0 To FBmp.Width-2 do
     begin
        FBmp.DrawLine(iX,y-pecValue[iX],iX+1,y-pecValue[iX+1]);
        pecValue[iX] := pecValue[iX+1];
     end;
     For iX := 0 To FMemBmp.Width-2 do
     begin
        FMemBmp.DrawLine(iX,memY-pecMem[iX],iX+1,memY-pecMem[iX+1]);
        pecMem[iX] := pecMem[iX+1];
     end;
     pecValue[FBmp.Width-1] := GetCPU_Usage*iSeg;
     GetMemInfo(mInfo);
     pecMem[FMemBmp.Width-1] :=  Round(((mInfo.dwTotalPhys-mInfo.dwAvailPhys)/mInfo.dwTotalPageFile)*iMemSeg);
     sleep(1000);
  end;
  If Assigned(FBmp) then
  FBmp.Free;
  If Assigned(FMemBmp) then
  FMemBmp.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   EnableDebugPrivilege;
   Self.DoubleBuffered := true;
   bgBmp := TUseage.Create(CpuImg.Height,CpuImg.Width);
   memBmp := TUseage.Create(memImg.Height,memImg.Width);
   bgBmp.DrawGrid;
   memBmp.DrawGrid;
   CpuImg.Picture.Bitmap := bgBmp;
   MemImg.Picture.Bitmap := MemBmp;
   doWork := TSetThread.Create(True);
   doWork.Bitmap := bgBmp;
   doWork.MemBmp := MemBmp;
   mInfo.dwLength := SizeOf(mInfo);
   doWork.Resume;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
 if Assigned(bgBmp) then
 begin
  CpuImg.Picture.Bitmap := bgBmp;
  MemImg.Picture.Bitmap := memBmp;
  MemImg.Update;
  CpuImg.Update;
  StatusBar.Panels[1].Text := Format('CPU 使用：%d%%',[dbuseage]);
  StatusBar.Panels[2].Text := Format('内存使用：%d/%d',[Round((mInfo.dwTotalPhys-mInfo.dwAvailPhys) / 1024),Round(mInfo.dwTotalPageFile / 1024)]);
 end;
 GetProcList;
 ShowWindowsList;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  doWork.Terminate;
end;

procedure TMainForm.GetProcList;
var
  List:TStringList;
  I,Index,J:Integer;
  AItem:TListItem;
  AInfo:TProcInfo;
begin
  List := TStringList.Create;
  try
  RunningProcessesList(List);
  StatusBar.Panels[0].Text := Format('进程数：%d',[List.Count]);
  J := 0;
  procListView.Items.BeginUpdate;
  For I := 0 To procListView.Items.Count-1 do
  begin
     AItem := procListView.Items.Item[J];
     Index := List.IndexOf(AItem.SubItems.Strings[0]);
     If Index<>-1 then  //已存在,修改数据
     begin
       AInfo := TProcInfo(List.Objects[Index]);
       AItem.Caption := AInfo.ProcName;
       If AItem.SubItems.Count>3 then
       begin
         AItem.SubItems.Strings[0] := IntToStr(AInfo.PID);
         AItem.SubItems.Strings[1] := '';
         AItem.SubItems.Strings[2] := FormatDateTime('hh:nn:ss',AInfo.CPUTime);
         AItem.SubItems.Strings[3] := IntToStr(AInfo.MemSize)+' K';
       end;
       AInfo.Free;
       List.Delete(Index); //删除
       INC(J);
     end else    //进程已不存在,删除
         begin
           procListView.Items.Delete(J);
           DEC(J);
         end;
  end;
  For I := 0 To List.Count-1 do    //添加新增的进程
  begin
    AInfo := TProcInfo(List.Objects[I]);
    AItem := procListView.Items.Add;
    AItem.Caption := AInfo.ProcName;
    AItem.SubItems.Add(IntToStr(AInfo.PID));
    AItem.SubItems.Add('');
    AItem.SubItems.Add(FormatDateTime('hh:nn:ss',AInfo.CPUTime));
    AItem.SubItems.Add(IntToStr(AInfo.MemSize)+' K');
    AInfo.Free;
  end;
  finally
    procListView.Items.EndUpdate;
    List.Free;
  end;

end;
procedure TMainForm.ShowWindowsList;
var
  List:TStringList;
  I,Index,ImgIndex,J:Integer;
  AItem:TListItem;
  AI,NewAI:TWinInfo;
  AIcon:TIcon;
  ProcIDList:TStringList;
  function CheckProcID(aWinHandle:THandle;clsType:String):Boolean;
  var
    strH:String;
    aPID:HWND;
  begin
    If clsType='Progman' then
    begin
      Result := false;
      Exit;
    end;
    If (clsType='IEFrame') Or (clsType='CabinetWClass') then  //IE,exploerer
    begin
      Result := true;
      Exit;
    end;
    GetWindowThreadProcessId(aWinHandle, @aPID);
    strH := IntToStr(aPID);
    If ProcIDList.IndexOf(strH)=-1 then
    begin
       ProcIDList.Add(strH);
       Result := true;
    end  else Result := false;
  end;
  function GetWinIcon(aHandle:THandle):TICON;
  var
     tmpIcon:TIcon;
  begin
     tmpICon := TICon.Create;
     tmpICon.Handle := HICON(SendMessage(aHandle,WM_GETICON, ICON_SMALL,0));
     If tmpICon.Handle=0 then
     tmpIcon.Handle := HICON(SendMessage(aHandle,WM_GETICON, ICON_Big,0));
     If tmpIcon.Handle=0 then
     tmpIcon.Handle := GetClassLong(aHandle,GCL_HICON);
     Result := tmpICon;
  end;
begin
//过程可能内存泄露
  List := TStringList.Create;
  ProcIDList := TStringList.Create;
  try
    GetAllWindow(List);
    ImageList.Clear;
    J := 0;
    TaskListView.Items.BeginUpdate;
    For I := 0 To TaskListView.Items.Count-1 do
    begin
       If J<0 then
       J := 0;
       AItem := TaskListView.Items.Item[J];
       AI :=  TWinInfo(AItem.Data);
       If Not CheckProcID(AI.FHandle,AI.FClsName)  then
       begin
        INC(J);
        Continue;
       end;
       Index := List.IndexOf(IntToStr(AI.FHandle));
       If Index<>-1 then
       begin
         NewAI := TWinInfo(List.Objects[Index]);
         AIcon := GetWinIcon(NewAI.FHandle);
         ImgIndex := ImageList.AddIcon(AIcon);
         AItem.ImageIndex := ImgIndex;
         AItem.Caption := NewAI.FCaption;
         AItem.SubItems.Strings[0] := '正在运行';
         AItem.Data := NewAI;
         List.Delete(Index);
         INC(J);
       end else
            begin
             TaskListView.Items.Delete(J);
             DEC(J);
            end;
       AI.Free;
    end;
    For I :=0 To List.Count-1 do
    begin
       NewAI := TWinInfo(List.Objects[I]);
       If Not CheckProcID(NewAI.FHandle,NewAI.FClsName) then
       Continue;
       AIcon := GetWinIcon(NewAI.FHandle);
       ImgIndex := ImageList.AddIcon(AIcon);
       AItem := TaskListView.Items.Add;
       AItem.ImageIndex := ImgIndex;
       AItem.Caption := NewAI.FCaption;
       //AItem.SubItems.Add(NewAi.FClsName);
       AItem.SubItems.Add('正在运行');
       AItem.Data := NewAI;
    end;
  finally
    TaskListView.Items.EndUpdate;
    List.Free;
    ProcIDList.Free;
  end;
end;
procedure TMainForm.endProcBtnClick(Sender: TObject);
Const
  WarnMsg= '警告: 终止进程会导致不希望发生的结果，'+#10#13
          +'包括数据丢失和系统不稳定。在被终止前，'+#10#13
          +'进程将没有机会保存其状态和数据。确实'+#10#13
          +'想终止该进程吗?';
var
  procID:HWND;
  SeledItem:TListItem;
begin
  SeledItem := procListView.Selected;
  If Assigned(SeledItem) then
  begin
    procID := StrToInt(SeledItem.SubItems.Strings[0]);
    If Application.MessageBox(WarnMsg,'任务管理器警告',MB_YESNO+MB_ICONWARNING)=IDYES then
    KillProcess(procID);
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  anItem:TListItem;
  AI:TWinINfo;
  ah:HWND;
begin

  anItem := TaskListView.Selected;
  If Assigned(anItem) then
  begin
      try
      Timer.Enabled := false;
      aI := TWinInfo(anItem.Data);
      GetWindowThreadProcessId(aI.FHandle,@aH);
      //ShowMessage(IntToStr(aH));
      If ah<>0 then
      KillProcess(ah);
      finally
      Timer.Enabled := true;
      end;
  end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  anItem:TListItem;
  AI:TWinINfo;
begin

  anItem := TaskListView.Selected;
  If Assigned(anItem) then
  begin
      aI := TWinInfo(anItem.Data);
      SetForegroundWindow(aI.FHandle);
  end;

end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  keybd_event( VK_LWIN, MapVirtualKey( VK_LWIN, 0 ), 0 , 0 );
  keybd_event( ORD('R'), MapVirtualKey( ORD('R'), 0 ), 0 , 0 );
  keybd_event(  ORD('R'), MapVirtualKey(  ORD('R'), 0 ), KEYEVENTF_KEYUP , 0 );
  keybd_event( VK_LWIN, MapVirtualKey( VK_LWIN, 0 ), KEYEVENTF_KEYUP , 0 );
end;

procedure TUseage.CM_RUN(var message: Tmessage);
var
  wnd:HWND;
  ac:Char;
begin

end;
procedure TMainForm.A1Click(Sender: TObject);
begin
  A1.Checked := (Not A1.Checked);
  If A1.Checked then
  MainForm.FormStyle := fsStayOnTop
  else MainForm.FormStyle := fsNormal;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  Application.MessageBox('2007-05 by maxyang'+#13+#10+'e-mail:maxwyu@21cn.com','关于',MB_OK);
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
    H2.Checked := false;
    N5.Checked := false;
    N6.Checked := false;
    N8.Checked := false;
    If (Sender as TMenuItem)=N8 then   //暂停
    begin
      Timer.Enabled := (Not Timer.Enabled);
      N8.Checked := (Not Timer.Enabled);
      Exit;
    end;
    SetRate((Sender as TMenuItem).Tag);
    (Sender as TMenuItem).Checked := true;
end;

procedure TMainForm.SetRate(aRate: Word);
begin
  Timer.Enabled := false;
  Timer.Interval := aRate;
  Timer.Enabled := true;
end;

procedure TMainForm.X1Click(Sender: TObject);
begin
  Close;
end;

end.
