unit UTaskMana;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Menus, StdCtrls, RzCommon;

type
  TFrmTaskMana = class(TForm)
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    RzMenuController1: TRzMenuController;
    btnClose: TButton;
    procedure Taskrefresh;
    procedure ListBarReFesh;
    function KillTask(ExeFileName: string): integer;
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTaskMana: TFrmTaskMana;

implementation

uses Tlhelp32;

var Proc: TPROCESSENTRY32; Snap: THandle;

{$R *.dfm}

procedure TFrmTaskMana.Taskrefresh;
begin
  ListBox1.Items.Clear;
  Snap:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  Proc.dwSize:=SizeOf(TProcessEntry32);
  Process32First(Snap, Proc);
  repeat
    ListBox1.Items.Add(proc.szExeFile);
  until (not Process32Next(Snap, Proc));
  ListBox1.Selected[0]:=true;
end;

procedure TFrmTaskMana.ListBarReFesh;
var i1, MaxWidth:word;
begin
  MaxWidth:=0;
  for i1:=0 to ListBox1.Items.Count - 1 do
    if MaxWidth < ListBox1.Canvas.TextWidth(ListBox1.Items.Strings[i1]) then
      MaxWidth:=ListBox1.Canvas.TextWidth(ListBox1.Items.Strings[i1]);
  SendMessage(ListBox1.Handle, LB_SETHORIZONTALEXTENT, MaxWidth, 0);
end;

function TFrmTaskMana.KillTask(ExeFileName: string): integer;
const PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle:THandle;
  FProcessEntry32:TProcessEntry32;
begin
  result:=0;
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName)))
    then Result:=Integer(TerminateProcess(OpenProcess( PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop:=Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
end;

procedure TFrmTaskMana.FormCreate(Sender: TObject);
begin
  Taskrefresh;
  ListBarReFesh;
end;

procedure TFrmTaskMana.PopupMenu1Popup(Sender: TObject);
begin
  N2.Caption:='结束进程 ' + sysutils.ExtractFileName(ListBox1.Items.Strings[ListBox1.ItemIndex]);
end;

procedure TFrmTaskMana.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var P:Tpoint; C:integer;
begin
  P.X:=X; P.Y:=y;
  C:=ListBox1.ItemAtPos(P,True);
  if C >= 0 then ListBox1.Selected[c]:=true;
end;

procedure TFrmTaskMana.N1Click(Sender: TObject);
begin //刷新
  ListBox1.Clear;
  Taskrefresh;
  ListBarReFesh;
end;

procedure TFrmTaskMana.N2Click(Sender: TObject);
var StrApp:string;
begin //结束进程
  StrApp:='确实要结束进程 ' + ListBox1.Items.Strings[ListBox1.ItemIndex] + ' ？';
  if MessageBox(Handle,Pchar(StrApp),'结束进程',MB_ICONQUESTION or MB_OKCANCEL) = IDOK then
  begin
    killtask(ListBox1.Items.Strings[ListBox1.ItemIndex]);
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    ListBox1.Selected[0]:=true;
    FrmTaskMana.ListBarReFesh;   
  end;
end;

procedure TFrmTaskMana.N5Click(Sender: TObject);
begin //关闭
  close
end;

procedure TFrmTaskMana.btnCloseClick(Sender: TObject);
begin //按 Cancel 时关闭窗口
  close
end;

end.
