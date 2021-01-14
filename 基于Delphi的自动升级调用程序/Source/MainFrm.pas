unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdAntiFreezeBase, IdAntiFreeze,
  ThreadMgr, UpgradeThread, ScriptParser, Global;

const
  WM_SHOW_MAIN_WIN = WM_USER + 100;
  
type
  TUpgradeStep = (usPrepare, usQuery, usProgress, usResult);

  TMainForm = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    OkButton: TButton;
    CancelButton: TButton;
    Notebook: TNotebook;
    ProgressLabel: TLabel;
    ProgressBar: TProgressBar;
    PrepareLabel: TLabel;
    ResultMsgLabel: TLabel;
    Label2: TLabel;
    DnListView: TListView;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DnListViewResize(Sender: TObject);
    procedure DnListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    FUpgradeThread:TUpgradeThread;
    
    procedure InitUI;
    procedure StartUpgrade;
    procedure WMShowMainWindow(var Message: TMessage); message WM_SHOW_MAIN_WIN;
  public
    { Public declarations }
    procedure ShowStepPage(Step: TUpgradeStep);
    procedure ShowResultMsg(const Msg: string);
    procedure InitDnListView(const Items: TDownloadItems);
    procedure SetDnListItemState(Index: Integer; State: TDownloadState);
  end;

var
  MainForm: TMainForm;

implementation

uses SysDM, PubUtils;

{$R *.dfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitUI;
  StartUpgrade;
end;

procedure TMainForm.InitUI;
begin
  MainForm.Caption := Application.Title;
  PrepareLabel.Caption := Format(PrepareLabel.Caption, [CmdParams.SoftName]);

  ShowStepPage(usPrepare);
  SetProp(Handle, SSoftName, Handle);   // 做已运行程序的标记
end;

procedure TMainForm.StartUpgrade;
begin
  ShowStepPage(usPrepare);
  FUpgradeThread := TUpgradeThread.Create;
  FUpgradeThread.Resume;
end;

procedure TMainForm.ShowStepPage(Step: TUpgradeStep);
begin
  Notebook.PageIndex := Ord(Step);
  CancelButton.Caption := Iif(Step = usResult, '关闭', '取消');

  case Step of
    usPrepare:
      begin
        OkButton.Visible := False;
      end;
    usQuery:
      begin
        OkButton.Visible := True;
        OkButton.Enabled := True;
        OkButton.SetFocus;
      end;
    usProgress:
      begin
        OkButton.Visible := False;
      end;
    usResult:
      begin
        OkButton.Visible := False;
      end;
  end;
end;

procedure TMainForm.ShowResultMsg(const Msg: string);
begin
  ShowStepPage(usResult);
  ResultMsgLabel.Caption := Msg;
end;

procedure TMainForm.InitDnListView(const Items: TDownloadItems);
var
  I: Integer;
  ListItem: TListItem;
begin
  DnListView.Items.BeginUpdate;
  try
    DnListView.Items.Clear;
    for I := 0 to Length(Items) - 1 do
    begin
      ListItem := DnListView.Items.Add;
      ListItem.Caption := ExtractUrlFileName(Items[I].SourceURL);
      ListItem.SubItems.Add(SDnStateStrings[dsWait]);
    end;
  finally
    DnListView.Items.EndUpdate;
  end;
end;

procedure TMainForm.SetDnListItemState(Index: Integer; State: TDownloadState);
begin
  if (Index >= 0) and (Index < DnListView.Items.Count) then
  begin
    DnListView.Items[Index].SubItems[0] := SDnStateStrings[State];
    if State = dsDownloading then
      DnListView.Items[Index].MakeVisible(False);
  end;
end;

procedure TMainForm.WMShowMainWindow(var Message: TMessage);
begin
  if WindowState = wsMinimized then
    WindowState := wsNormal;
  Application.Restore;
  Show;
  SetForegroundWindow(Handle);
end;
                     
procedure TMainForm.OkButtonClick(Sender: TObject);
begin
  FUpgradeThread.UserAccepted := True;
end;

procedure TMainForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.DnListViewResize(Sender: TObject);
begin
  // 防止出现水平滚动条
  DnListView.Column[DnListView.Columns.Count - 1].Width := 0;
  
  DnListView.Column[DnListView.Columns.Count - 1].Width :=
    DnListView.ClientWidth - DnListView.Column[0].Width;
end;

procedure TMainForm.DnListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  Item.Selected := False;
  Item.Focused := False;
end;

end.
