unit ComMain;

{
1.
procedure TfrmMain.AppBtn2Click(Sender: TObject);
begin
  inherited;
  screen.Cursor := crHourGlass;
  SAction('mnuSpcx', 'Sp', '');
  SAction('mnuXsd' , 'Xsdzb;明细-Xsd', '');
  SAction('mnuRs'  , 'Rs', '其它-Qtgl');
  screen.Cursor := crDefault;
  MessageDlg('Set AppAction OK!', mtInformation, [mbOk], 0);
end;

2.
  pstrComputerName: string;
  pintUserId: Integer;
  pstrUserCode: string;
  pstrUserName: string;
  pstrUserPassword: string;
  pstrUserGroup: string;
  pblnLoadAppSelect: boolean;
  pblnSaveAppSelect: boolean;
  pHKL: HKL;

3.
  BeginShow(Sender);
  if not IsOpenMdiForm('frmSppp') then
    frmSppp := TfrmSppp.Create(application);
  frmSppp.Show;
  EndShow(Sender);

4. (dpr)
  ...
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Animate1.Active := True;
  frmMain.pnlMain.Visible := True;
  frmMain.pnlMain.Repaint;
  ...
  frmMain.Animate1.Active := False;
  frmMain.pnlMain.Visible := False;
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ImgList, Menus, StdCtrls, AppEvnts, inifiles,
  shellapi, Clipbrd, ActnList, Buttons, ToolWin, DBGrids,
  Mask, DBCtrls, OleServer, TeEngine, Series, TeeProcs,
  Chart, DBChart, printers, FileCtrl, Excel97, Word97, Excel2000, Word2000;

type
  TfrmComMain = class(TForm)
    PopupMenu1: TPopupMenu;
    pmnCascade: TMenuItem;
    pmnHorizontally: TMenuItem;
    pmnMinAll: TMenuItem;
    LineP1: TMenuItem;
    pmnCloseAll: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    mnuBackup: TMenuItem;
    mnuRestore: TMenuItem;
    mnuChangUser: TMenuItem;
    LineF2: TMenuItem;
    mnuExit: TMenuItem;
    mnuWindow: TMenuItem;
    mnuCascade: TMenuItem;
    mnuHorizontally: TMenuItem;
    mnuMinAll: TMenuItem;
    mnuCloseAll: TMenuItem;
    mnuTools: TMenuItem;
    mnuUser: TMenuItem;
    mnuPassword: TMenuItem;
    LineT2: TMenuItem;
    mnuCalendar: TMenuItem;
    mnuCalculator: TMenuItem;
    LineT3: TMenuItem;
    mnuOption: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHelpBook: TMenuItem;
    LineH1: TMenuItem;
    mnuAbout: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    mnuDesktop: TMenuItem;
    mnuPopedom: TMenuItem;
    AppPnl: TPanel;
    AppBtn1: TButton;
    AppBtn2: TButton;
    AppMemo: TMemo;
    PageScroller1: TPageScroller;
    tlbSKey: TToolBar;
    btnGuide: TToolButton;
    btnInCommonUse: TToolButton;
    mnuSetIcon: TMenuItem;
    mnuSjzl: TMenuItem;
    LineF1: TMenuItem;
    LineT1: TMenuItem;
    LineW2: TMenuItem;
    btnWord: TToolButton;
    btnExcel: TToolButton;
    WordApplication1: TWordApplication;
    ExcelApplication1: TExcelApplication;
    PageScroller2: TPageScroller;
    tlbAForm: TToolBar;
    mmuPrintSet: TMenuItem;
    mnuStatusBar: TMenuItem;
    LineW1: TMenuItem;
    labOpenAppButton: TLabel;
    Label1: TLabel;
    AppPath: TEdit;
    Button1: TButton;
    mnuToolBar: TMenuItem;
    LineT4: TMenuItem;
    mnuLog: TMenuItem;
    pmnInCommonUse: TPopupMenu;
    pnlMain: TPanel;
    Label2: TLabel;
    Animate1: TAnimate;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    labMain: TLabel;
    labBack: TLabel;
    ilsBar: TImageList;
    ilsSub: TImageList;
    ilsMain: TImageList;
    //App Even
    procedure ActiveFormChange(Sender: TObject);virtual;
    procedure ActiveControlChange(Sender: TObject);virtual;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);virtual;
    //Form Even
    procedure FormCreate(Sender: TObject);virtual;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);virtual;
    //File
    procedure mnuBackupClick(Sender: TObject);virtual;
    procedure mnuRestoreClick(Sender: TObject);virtual;
    procedure mnuSjzlClick(Sender: TObject);virtual;
    procedure mnuPrinterSetupClick(Sender: TObject);virtual;
    procedure mnuChangUserClick(Sender: TObject);virtual;
    procedure mnuExitClick(Sender: TObject);virtual;
    //Windows
    procedure mnuStatusBarClick(Sender: TObject);
    procedure mnuCascadeClick(Sender: TObject);virtual;
    procedure mnuHorizontallyClick(Sender: TObject);virtual;
    procedure mnuMinAllClick(Sender: TObject);virtual;
    procedure mnuCloseAllClick(Sender: TObject);virtual;
    //Tools
    procedure mnuPopedomClick(Sender: TObject);virtual;
    procedure mnuUserClick(Sender: TObject);virtual;
    procedure mnuPasswordClick(Sender: TObject);virtual;
    procedure mnuSetIconClick(Sender: TObject);virtual;
    procedure mnuDesktopClick(Sender: TObject);virtual;
    procedure mnuCalendarClick(Sender: TObject);virtual;
    procedure mnuCalculatorClick(Sender: TObject);virtual;
    procedure mnuOptionClick(Sender: TObject);virtual;
    //Help
    procedure mnuHelpBookClick(Sender: TObject);virtual;
    procedure mnuAboutClick(Sender: TObject);virtual;
    //Bar
    procedure ToolButtonClick(Sender: TObject);virtual;
    procedure btnGuideClick(Sender: TObject);virtual;
    procedure btnWordClick(Sender: TObject);virtual;
    procedure btnExcelClick(Sender: TObject);virtual;
    //Other
    procedure labOpenAppButtonDblClick(Sender: TObject);
    procedure SetMenuEnabled(mnuTmp: TMenuItem);virtual;
    procedure MenuPopedom;virtual;
    procedure MenuRepair(MenuItem: TMenuItem);
    procedure BeginShow(Sender: TObject);virtual;
    procedure EndShow(Sender: TObject);virtual;
    procedure SaveInCommonUse(Sender: TObject);virtual;
    function IsOpenMdiForm(strName: string): boolean;virtual;
    //Create App
    procedure AppBtn1Click(Sender: TObject);virtual;
    procedure GetMnuInfo(mnuTmp: TMenuItem);virtual;
    procedure SaveAppMenu(mnuTmp: TMenuItem; strIsParent: string);virtual;
    procedure AppBtn2Click(Sender: TObject);virtual;
    procedure SAction(AMenuName, AFormNames, AOther: string);virtual;
    procedure SaveAction(mName, fName, aName, aCaption: string);virtual;
    procedure mnuToolBarClick(Sender: TObject);
    procedure mnuLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComMain: TfrmComMain;

implementation

uses Common, Wnl, Dm, Popedom, PopedomCopy, User,
  Password, Login, SetIcon, Desktop, About, Main, Guide, Log;

{$R *.DFM}

{-Form Even 窗体事件-}

//Form.Create
procedure TfrmComMain.FormCreate(Sender: TObject);
var
  c: TComponent;
  mi: TMenuItem;
begin
  Top := 0;
  //Create Directory
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'System') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'System');
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Icon') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Icon');
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Report') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Report');
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Column') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Column');
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Filter') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Filter');
  //Ime
  pHKL := GetKeyboardLayout(0);
  //Login
  frmLogin := TfrmLogin.Create(self);
  frmLogin.ShowModal;
  if frmLogin.ModalResult <> MROK then
  begin
    screen.OnActiveFormChange := nil;
    screen.OnActiveControlChange := nil;
    Application.Terminate;
  end;
  frmLogin.Free;
  Self.Caption := Application.Title;
  Screen.OnActiveFormChange := ActiveFormChange;
  Screen.OnActiveControlChange := ActiveControlChange;
  ShortDateFormat := 'yyyy-mm-dd';
  DateSeparator := '-';
  //set ProgressBar1
  ProgressBar1.Visible := False;
  ProgressBar1.Parent := StatusBar1;
  //set StatusBar1
  StatusBar1.Panels[2].Text := DateToStr(Date());
  StatusBar1.Panels[3].Text := pstrUserName;
  //Set pmnInCommonUse
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select top 15 * from AppInCommonUse ' +
      'where uID = ' + IntToStr(pintUserId) + ' ' +
      'order by UseCount desc';
    Open;
    while not Eof do
    begin
      c := self.FindComponent(FieldByName('mName').AsString);
      if c <> nil then
      begin
        mi := TMenuItem.Create(self);
        mi.Caption := TMenuItem(c).Caption;
        mi.OnClick := TMenuItem(c).OnClick;
        self.pmnInCommonUse.Items.Add(mi);
      end;
      Next;
    end;
  end;
  //MenuPopedom
  MenuPopedom;
end;

//Form.Show
procedure TfrmComMain.FormShow(Sender: TObject);
begin
  pblnLoadAppSelect := True;
  pblnSaveAppSelect := True;
end;

//Form.Resize
procedure TfrmComMain.FormResize(Sender: TObject);
begin
  PageScroller1.Visible := False;
  PageScroller1.Visible := True;
end;

//Form.CloseQuery
procedure TfrmComMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('确实要退出系统吗？', '退出系统',
     MB_YESNO+MB_ICONINFORMATION) = IDYES then
  begin
    //Log
    with Data.Tmp do
    begin
      Close;
      CommandText := 'insert into AppLog (uName, cName, CZ, RQ, SJ) ' +
        'values (''' + pstrUserName + ''', ' +
        '''' + pstrComputerName + ''', ' +
        '''退出系统'', ' +
        '''' + FormatDateTime('yyyy-mm-dd', Date) + ''', ' +
        '''' + FormatDateTime('hh:nn', Time) + ''')';
      Execute;
    end;
    mnuCloseAllClick( nil );
    Application.Terminate;
  end
  else
    CanClose := false;
end;

//Form.Close
procedure TfrmComMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  screen.OnActiveFormChange := nil;
  screen.OnActiveControlChange := nil;
end;

//StatusBar1
procedure TfrmComMain.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  //set tlbSkey
  if Panel.Index = 0 then
  begin
    PageScroller1.Parent := StatusBar;
    PageScroller1.Top := Rect.Top;
    PageScroller1.Left := Rect.Left;
    PageScroller1.Width := Rect.Right - Rect.Left;
    PageScroller1.Height := Rect.Bottom - Rect.Top;
  end;
  //set PageScroller2
  if Panel.Index = 1 then
  begin
    PageScroller2.Parent := StatusBar1;
    PageScroller2.Top := Rect.Top;
    PageScroller2.Left := Rect.Left;
    PageScroller2.Width := Rect.Right - Rect.Left;
    PageScroller2.Height := Rect.Bottom - Rect.Top;
  end;
end;

{-File 文件-}

//mnuBackup.Click
procedure TfrmComMain.mnuBackupClick(Sender: TObject);
begin
  { TODO : Backup }
end;

//mnuRestore.Click
procedure TfrmComMain.mnuRestoreClick(Sender: TObject);
begin
  { TODO : Restore }
end;

//mnuSjzl.Click
procedure TfrmComMain.mnuSjzlClick(Sender: TObject);
begin
  if Application.MessageBox('确实要进行数据整理吗？', '数据整理',
     MB_YESNO+MB_ICONINFORMATION) <> IDYES then
    Exit;
  Screen.Cursor := crHourGlass;
  try
   { TODO : Sjzl }
  finally
    Screen.Cursor := crdefault;
  end;
  Application.MessageBox( '数据已经整理完!', '数据整理',MB_OK );
end;

//mnuPrinter.SetupClick
procedure TfrmComMain.mnuPrinterSetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

//mnuChang.UserClick
procedure TfrmComMain.mnuChangUserClick(Sender: TObject);
begin
  //Log
  with Data.Tmp do
  begin
    Close;
    CommandText := 'insert into AppLog (uName, cName, CZ, RQ, SJ) ' +
      'values (''' + pstrUserName + ''', ' +
      '''' + pstrComputerName + ''', ' +
      '''退出系统'', ' +
      '''' + FormatDateTime('yyyy-mm-dd', Date) + ''', ' +
      '''' + FormatDateTime('hh:nn', Time) + ''')';
    Execute;
  end;
  frmLogin := TfrmLogin.Create(self);
  frmLogin.ShowModal;
  if frmLogin.ModalResult <> MROK then
  begin
    screen.OnActiveFormChange := nil;
    screen.OnActiveControlChange := nil;
    Application.Terminate;
  end
  else
  begin
    screen.Cursor := crHourGlass;
    SetMenuEnabled(MainMenu1.Items);
    MenuPopedom;
    frmGuide.Free;
    Animate1.Active := True;
    pnlMain.Visible := True;
    pnlMain.Repaint;
    if not IsOpenMdiForm('frmGuide') then
      frmGuide := TfrmGuide.Create(self);
    frmGuide.Show;
    Animate1.Active := False;
    pnlMain.Visible := False;
    screen.Cursor := crdefault;
  end;
  frmLogin.Free;
  StatusBar1.Panels[2].Text := DateToStr(Date);
  StatusBar1.Panels[3].Text := pstrUserName;
end;

//mnuExit.Click
procedure TfrmComMain.mnuExitClick(Sender: TObject);
begin
  Close;
end;

{-Windows 窗口-}

//mnuToolBar.Click
procedure TfrmComMain.mnuToolBarClick(Sender: TObject);
var
  comTmp: TComponent;
begin
  mnuToolBar.Checked := not mnuToolBar.Checked;
  comTmp := Screen.ActiveCustomForm.FindComponent('ControlBar1');
  if comTmp <> nil then
    TControlBar(comTmp).Visible := mnuToolBar.Checked;
end;

//mnuStatusBar.Click
procedure TfrmComMain.mnuStatusBarClick(Sender: TObject);
begin
  mnuStatusBar.Checked := not mnuStatusBar.Checked;
  StatusBar1.Visible := mnuStatusBar.Checked;
end;

//mnuCascade.Click
procedure TfrmComMain.mnuCascadeClick(Sender: TObject);
var
  i:integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsNormal;
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsNormal;
  Cascade;
end;

//mnuHorizontally.Click
procedure TfrmComMain.mnuHorizontallyClick(Sender: TObject);
var
  i:integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsNormal;
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsNormal;
  Tile;
end;

//mnuMinAll.Click
procedure TfrmComMain.mnuMinAllClick(Sender: TObject);
var
 i:integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsMinimized;
  ArrangeIcons;
end;

//mnuCloseAll.Click
procedure TfrmComMain.mnuCloseAllClick(Sender: TObject);
var
 i:integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
end;

{-Tools 工具-}

//mnuPopedom.Click
procedure TfrmComMain.mnuPopedomClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmPopedom') then
    frmPopedom := TfrmPopedom.Create(self);
  frmPopedom.Show;
  EndShow(Sender);
end;

//mnuUser.Click
procedure TfrmComMain.mnuUserClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmUser') then
    frmUser := TfrmUser.Create(self);
  frmUser.Show;
  EndShow(Sender);
end;

//mnuPassword.Click
procedure TfrmComMain.mnuPasswordClick(Sender: TObject);
begin
  frmPassword := TfrmPassword.Create(self);
  frmPassword.ShowModal;
  frmPassword.Free;
end;

//mnuLog.Click
procedure TfrmComMain.mnuLogClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmLog') then
    frmLog := TfrmLog.Create(self);
  frmLog.Show;
  EndShow(Sender);
end;

//mnuSetIcon.Click
procedure TfrmComMain.mnuSetIconClick(Sender: TObject);
begin
  frmSetIcon := TfrmSetIcon.Create(self);
  frmSetIcon.ShowModal;
  frmSetIcon.Free;
end;

//mnuDesktop.Click
procedure TfrmComMain.mnuDesktopClick(Sender: TObject);
begin
  if frmDesktop = nil then
    frmDesktop := TfrmDesktop.Create(self);
  frmDesktop.Show;
end;

//mnuCalendar.Click
procedure TfrmComMain.mnuCalendarClick(Sender: TObject);
begin
  if frmWnl = nil then
    frmWnl := TfrmWnl.Create(self);
  frmWnl.MonthCalendar1.Date := Date;
  frmWnl.Show;
end;

//mnuCalculator.Click
procedure TfrmComMain.mnuCalculatorClick(Sender: TObject);
begin
  WinExec('Calc.exe', SW_SHOWDEFAULT);
end;

procedure TfrmComMain.mnuOptionClick(Sender: TObject);
begin
  { TODO : Option }
end;

{-Help 帮助-}

//mnuHelpBook.Click
procedure TfrmComMain.mnuHelpBookClick(Sender: TObject);
begin
  { TODO : Help Book }
end;

//mnuAbout.Click
procedure TfrmComMain.mnuAboutClick(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(self);
  frmAbout.ShowModal;
  frmAbout.Free;
end;

{-Bar 快捷菜单 窗体切换-}

//ToolButtonClick
procedure TfrmComMain.ToolButtonClick(Sender: TObject);
var
  i: integer;
begin
  if Sender is TToolButton then
  begin
    if TToolButton(Sender).Hint <> screen.ActiveForm.name then
    begin
      for i := 0 to self.tlbAForm.ButtonCount - 1 do
        if TToolButton(Sender) <> self.tlbAForm.Buttons[i] then
          self.tlbAForm.Buttons[i].ImageIndex := 0
        else
          self.tlbAForm.Buttons[i].ImageIndex := 1;
      for i := 0 to self.MDIChildCount - 1 do
      begin
        self.Next;
        if screen.ActiveCustomForm.name = TToolButton(Sender).Hint then
          break;
      end;
    end;
  end;
end;

//btnGuide.Click
procedure TfrmComMain.btnGuideClick(Sender: TObject);
begin
  Animate1.Active := True;
  pnlMain.Visible := True;
  pnlMain.Repaint;
  if not IsOpenMdiForm('frmGuide') then
    frmGuide := TfrmGuide.Create(self);
  frmGuide.Show;
  Animate1.Active := False;
  pnlMain.Visible := False;
end;

//btnWord.Click
procedure TfrmComMain.btnWordClick(Sender: TObject);
begin
  self.WordApplication1.Quit;
  self.WordApplication1.Disconnect;
  self.WordApplication1.Connect;
  self.WordApplication1.Visible := true;
end;

//btnExcel.Click
procedure TfrmComMain.btnExcelClick(Sender: TObject);
begin
  self.ExcelApplication1.Quit;
  self.ExcelApplication1.Disconnect;
  self.ExcelApplication1.Connect;
  self.ExcelApplication1.Visible[0] := true;
end;

{-App Even 系统事件-}

//ActiveFormChange
procedure TfrmComMain.ActiveFormChange(Sender: TObject);
begin
  ActivateKeyboardLayout(pHKL, KLF_ACTIVATE);
  mnuCascade.Enabled      := self.MDIChildCount > 0;
  mnuHorizontally.Enabled := mnuCascade.Enabled;
  mnuMinAll.Enabled       := mnuCascade.Enabled;
  mnuCloseAll.Enabled     := mnuCascade.Enabled;
  pmnCascade.Enabled      := mnuCascade.Enabled;
  pmnHorizontally.Enabled := mnuCascade.Enabled;
  pmnMinAll.Enabled       := mnuCascade.Enabled;
  pmnCloseAll.Enabled     := mnuCascade.Enabled;
end;

//ActiveControlChange
procedure TfrmComMain.ActiveControlChange(Sender: TObject);
begin
  pHKL := GetKeyboardLayout(0);
end;

//ApplicationEvents1.Exception
procedure TfrmComMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if Pos( 'not a valid date',E.Message ) <> 0 then
    E.Message := '日期输入错误，请重新输入！'
  Else if Pos( 'Cannot perform this operation on an empty dataset',E.Message ) <> 0 then
    E.Message := '已经没有数据，不能删除！'
  Else if Pos( 'not a valid floating point value',E.Message ) <> 0 then
    E.Message := '数据输入错误，请重输！'
  Else if Pos( 'Invalid input value.  Use escape key to abandon changes',E.Message ) <> 0 then
    E.Message := '数据输入错误，请按Esc键后重输！'
  Else if Pos( 'Key violation', E.Message ) <> 0 then
    E.Message := '已有相同的编号，不能修改！'
  else if Pos( 'Field value required', E.Message ) <> 0 then
    E.Message := '编号不能为空！'
  else if Pos( 'I/O error 21', E.Message ) <> 0 then
    E.Message := '驱动器未准备好，无法访问！'
  else if Pos( 'read-only dataset', E.Message ) <> 0 then
    E.Message := '此项资料不能修改！'
  else if Pos( 'is not a valid value for', E.Message ) <> 0 then
  begin
    E.Message := copy(E.Message, pos(' ''', E.Message), pos('''.', E.Message) - pos(' ''', E.Message) + 1) +
      '输入无效，输入范围是 ' + copy(E.Message, pos('range is ', E.Message) + 9, length(E.Message)) + '.';
    E.Message := StringReplace(E.Message, ' to ', ' 至 ',[rfReplaceAll, rfIgnoreCase]);
  end;
  Application.MessageBox(Pchar(E.Message), '系统提示', MB_OK + MB_ICONWARNING);
end;

{-Other 其它过程-}

//labOpenAppButton.DblClick
procedure TfrmComMain.labOpenAppButtonDblClick(Sender: TObject);
begin
  AppPath.Text := ExtractFilePath(Application.ExeName);
  frmMain.AppPnl.Visible := not frmMain.AppPnl.Visible;
end;

//SetMenuEnabled
procedure TfrmComMain.SetMenuEnabled(mnuTmp: TMenuItem);
var
  i: integer;
begin
  if mnuTmp.Count = 0 then
    mnuTmp.Visible := mnuTmp.Tag = 0
  else
    for i := 0 to mnuTmp.Count - 1 do
      SetMenuEnabled(mnuTmp.Items[i]);
end;

//MenuPopedom
procedure TfrmComMain.MenuPopedom;
var
  i: integer;
begin
  if UpperCase(pstrUserCode) = 'SYS' then exit;
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select * from AppGroupMenu ' +
      'where gName = ''' + pstrUserGroup + '''';
    Open;
    for i := 0 to self.ComponentCount - 1 do
      if (self.Components[i] is TMenuItem) and
        (UpperCase(Copy(self.Components[i].Name, 1, 3)) <> 'PMN') and
        (TMenuItem(self.Components[i]).Count = 0) and
        (TMenuItem(self.Components[i]).Caption <> '-')
        then
        TMenuItem(self.Components[i]).Visible := Locate('mName', self.Components[i].Name, []);
  end;
  mmuPrintSet.Visible     := true;
  mnuChangUser.Visible    := true;
  mnuExit.Visible         := true;
  mnuToolBar.Visible      := true;
  mnuStatusBar.Visible    := true;
  mnuCascade.Visible      := true;
  mnuHorizontally.Visible := true;
  mnuMinAll.Visible       := true;
  mnuCloseAll.Visible     := true;
  mnuCalendar.Visible     := true;
  mnuCalculator.Visible   := true;
  mnuAbout.Visible        := true;
  MenuRepair(MainMenu1.Items);
end;

//MenuRepair
procedure TfrmComMain.MenuRepair(MenuItem: TMenuItem);
var
  i: integer;
  blnSeparator, blnFirst, blnVisible: boolean;
begin
  blnSeparator := False;
  blnFirst := True;
  for i := 0 to MenuItem.Count - 1 do
  begin
    if (blnFirst) and (MenuItem[i].Caption = '-') and (MenuItem[i].Visible) then
      MenuItem[i].Visible := False;
    if blnSeparator and (MenuItem[i].Visible) and (MenuItem[i].Caption = '-') then
      MenuItem[i].Visible := False;
    if MenuItem[i].Visible then
    begin
      if (MenuItem[i].Caption <> '-') then
        blnFirst := False;
      blnSeparator := (MenuItem[i].Caption = '-');
    end;
    if MenuItem[i].Count > 0 then
      MenuRepair(MenuItem[i]);
  end;
  blnFirst := true;
  for i := MenuItem.Count - 1 downto 0 do
  begin
    if (blnFirst) and (MenuItem[i].Caption = '-') and (MenuItem[i].Visible) then
      MenuItem[i].Visible := False;
    if (MenuItem[i].Visible) and (MenuItem[i].Caption <> '-') then
      blnFirst := False;
  end;
  blnVisible := False;
  for i := 0 to MenuItem.Count - 1 do
    if (MenuItem[i].Visible) then
      blnVisible := true;
  MenuItem.Visible := blnVisible;
end;

//BeginShow
procedure TfrmComMain.BeginShow(Sender: TObject);
var
  strCaption: string;
begin
  Animate1.Active := True;
  pnlMain.Visible := True;
  pnlMain.Repaint;
  if Sender is TMenuItem then
  begin
    if Pos('(&', TMenuItem(Sender).Caption) = 0 then
      strCaption := TMenuItem(Sender).Caption
    else
      strCaption := Copy(TMenuItem(Sender).Caption+'a', 1, Pos('(&', TMenuItem(Sender).Caption) - 1);
    labMain.Caption := '正在打开"' + strCaption + '", 请稍候 ...';
    labBack.Caption := labMain.Caption;
  end
  else
  begin
    labMain.Caption := '正在打开, 请稍候 ...';
    labBack.Caption := labMain.Caption;
  end;
  labMain.Repaint;
  labBack.Repaint;
  SaveInCommonUse(Sender);
end;

//EndShow
procedure TfrmComMain.EndShow(Sender: TObject);
begin
  frmMain.Animate1.Active := False;
  frmMain.pnlMain.Visible := False;
end;

//SaveInCommonUse
procedure TfrmComMain.SaveInCommonUse(Sender: TObject);
begin
  if Sender is TMenuItem then
    with Data.Tmp do
    begin
      Close;
      CommandText := 'select * from AppInCommonUse ' +
        'where uID = ' + IntToStr(pintUserId) + ' and ' +
        'mName = ''' + TMenuItem(Sender).Name + '''';
      Open;
      if IsEmpty then
      begin
        Close;
        CommandText := 'insert into AppInCommonUse ' +
          '(uID, mName, UseCount) ' +
          'values (' + IntToStr(pintUserId) + ', ''' +
          TMenuItem(Sender).Name + ''', 1)';
      end
      else
      begin
        Close;
        CommandText := 'update AppInCommonUse ' +
          'set UseCount = UseCount + 1 ' +
          'where uID = ' + IntToStr(pintUserId) + ' and ' +
          'mName = ''' + TMenuItem(Sender).Name + '''';
      end;
      Execute;
    end;
end;

//IsOpenMdiForm
function TfrmComMain.IsOpenMdiForm(strName: string): boolean;
var
  i: integer;
begin
  result := False;
  for i := 0 to MDIChildCount - 1 do
    if UpperCase(MDIChildren[i].Name) = UpperCase(strName) then
    begin
      result := True;
      break;
    end;
end;

{-Create App 成生系统表-}

//AppBtn1.Click
procedure TfrmComMain.AppBtn1Click(Sender: TObject);
var
  s, strFile: string;
begin
  screen.Cursor := crHourGlass;
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppMenu';
    Execute;
  end;
  MainMenu1.Tag := 0;   // 代表 mLevel 的值
  PopupMenu1.Tag := 0;  // 代表 mIndex 的值
  GetMnuInfo(MainMenu1.Items);
  //删除固有菜单
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppMenu where mName in (' +
      '''mmuPrintSet'', ''mnuChangUser'', ''mnuExit'', ' +
      '''mnuStatusBar'', ''mnuCascade'', ''mnuHorizontally'', ' +
      '''mnuWindow'', ''mnuMinAll'', ''mnuCloseAll'', ' +
      '''mnuCalendar'', ''mnuCalculator'', ''mnuAbout''' +
      '''mnuToolBar'', ''mnuStatusBar'')';
    Execute;
  end;
  // App.txt
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select mName,mIndex from AppMenu order by mIndex';
    Open;
    while not Eof do
    begin
      strFile := Copy(FieldByName('mName').AsString, 4, Length(FieldByName('mName').AsString));
      if FileExists(strFile + '.dfm') then
      begin
        s := 'SAction(''' + FieldByName('mName').AsString + ''', ''' + strFile + ''', '''');';
        AppMemo.Lines.Add('  ' + s);
      end;
      Next;
    end;
    AppMemo.Lines.SaveToFile(AppPath.Text + 'App.txt');
  end;
  MessageDlg('Set AppMenu OK! 请把 App.txt 中的代码复盖 Main.pas 中的过程 AppBtn2Click, 再执行第二步.', mtInformation, [mbOk], 0);
  screen.Cursor := crDefault;
  Close;
end;

//2.GetMnuInfo 取TMenuItem的属性
procedure TfrmComMain.GetMnuInfo(mnuTmp: TMenuItem);
var
  i: integer;
begin
  if mnuTmp.Count = 0 then
    if pDataBaseType = 'SERVER' then
      SaveAppMenu(mnuTmp, '0')
    else
      SaveAppMenu(mnuTmp, 'false')
  else
  begin
    if pDataBaseType = 'SERVER' then
      SaveAppMenu(mnuTmp, '1')
    else
      SaveAppMenu(mnuTmp, 'true');
    MainMenu1.Tag := MainMenu1.Tag + 1;
    for i := 0 to mnuTmp.Count - 1 do
      GetMnuInfo(mnuTmp.Items[i]);
    MainMenu1.Tag := MainMenu1.Tag - 1;
  end;
end;

//3.SaveAppMenu 保存TMenuItem的属性到数据库
procedure TfrmComMain.SaveAppMenu(mnuTmp: TMenuItem; strIsParent: string);
var
  strCaption: string;
begin
  if (MainMenu1.Tag <> 0) and (mnuTmp.Caption <> '-') and mnuTmp.Visible then
  begin
    PopupMenu1.Tag := PopupMenu1.Tag + 1;
    if Pos('(&', mnuTmp.Caption) = 0 then
      strCaption := mnuTmp.Caption
    else
      strCaption := Copy(mnuTmp.Caption+'a', 1, Pos('(&', mnuTmp.Caption) - 1);
    with Data.Tmp do
    begin
      Close;
      CommandText := 'insert into AppMenu ' +
        '(mName, mCaption, mLevel, mIndex, mIsParent) values ' +
        '(''' + mnuTmp.Name + ''',''' + strCaption + ''',''' + IntToStr(MainMenu1.Tag - 1) + ''',''' + IntToStr(PopupMenu1.Tag) + ''',' + strIsParent + ')';
      Execute;
    end;
  end;
end;

//AppBtn2.Click
procedure TfrmComMain.AppBtn2Click(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete from AppAction';
    Execute;
  end;
  screen.Cursor := crDefault;
end;

//2.SAction 生成AppAction
procedure TfrmComMain.SAction(AMenuName, AFormNames, AOther: string);
var
  i, j, l, intTag: integer;
  strFList, strFName, strMx, strClass, strName, strCaption, strOther: string;
begin
  strFList := AFormNames;
  strOther := AOther;
  //AppAction.aIndex
  AppMemo.Tag := 1;
	while strFList <> '' do
  begin
		if Pos(';', strFList) <> 0 then
    begin
      strFName := Copy(strFList, 1, Pos(';', strFList) - 1);
      strFList := Copy(strFList, Pos(';', strFList) + 1, Length(strFList));
    end else
    begin
      strFName := strFList;
			strFList := '';
		end;
		if Pos('-', strFName) <> 0 then
    begin
  		strMx := Copy(strFName, 1, Pos('-', strFName)- 1) + ' - ';
      strFName := Copy(strFName, Pos('-', strFName) + 1, Length(strFName));
    end
    else
  		strMx := '';
    if FileExists(AppPath.Text + strFName + '.pas') then
    begin
      AppMemo.Lines.LoadFromFile(AppPath.Text + strFName + '.pas');
      l := Pos('class(T', AppMemo.Lines.Text);
      strClass := '';
      if l > 0 then
        for i := l + 6 to l + 50 do
        begin
          if AppMemo.Lines.Text[i] = ')' then
            break;
          strClass := strClass + AppMemo.Lines.Text[i];
        end;
      //frmComJbzl
      if (strClass = 'TfrmComJbzl') or (strClass = 'TfrmComFlzl') or
        (strClass = 'TfrmComDczl') or (strClass = 'TfrmComDjzb') or
        (strClass = 'TfrmComLbzb') then
      begin
        SaveAction(AMenuName, strFName, 'aPrint',  strMx + '打印');
        SaveAction(AMenuName, strFName, 'aNew',    strMx + '增加');
        SaveAction(AMenuName, strFName, 'aModify', strMx + '修改');
        SaveAction(AMenuName, strFName, 'aDel',    strMx + '删除');
        SaveAction(AMenuName, strFName, 'aTotal',  strMx + '统计');
      end;
      //frmComDjzb
      if (strClass = 'TfrmComDjzb') then
        SaveAction(AMenuName, strFName, 'aView',   strMx + '查看');
      //frmComDj
      if (strClass = 'TfrmComDj') then
      begin
        SaveAction(AMenuName, strFName, 'aPrint',  strMx + '打印');
        SaveAction(AMenuName, strFName, 'aNew',    strMx + '新单');
        SaveAction(AMenuName, strFName, 'aDel',    strMx + '删单');
        SaveAction(AMenuName, strFName, 'aInsert', strMx + '增加');
        SaveAction(AMenuName, strFName, 'aDelete', strMx + '删除');
      end;
      //Add Action
      AppMemo.Lines.LoadFromFile(strFName + '.dfm');
      with AppMemo.Lines do
        for i := 0 to Count - 1 do
        begin
          if (Pos('TAction', Strings[i]) > 0) and (Pos('TActionList', Strings[i]) = 0) then
          begin
            strName := trim(Strings[i]);
            strName := Copy(strName, Pos(' ', strName) + 1, Length(strName));
            strName := Copy(strName, 1, Pos(':', strName) - 1);
            intTag := 0;
            strCaption := '';
            for j := i + 1 to i + 3 do
            begin
              if Pos('Tag = ', Strings[j]) > 0 then
                intTag := 1;
              if Pos('Caption = ', Strings[j]) > 0 then
                strCaption := Copy(Strings[j], Pos(' = ', Strings[j]) + 4, Length(Strings[j]) - (Pos(' = ', Strings[j]) + 4));
            end;
            if intTag = 0 then
              SaveAction(AMenuName, strFName, strName, strMx + strCaption)
            else
              SaveAction(AMenuName, strFName, strName, 'Delete Action');
          end;
        end;
      //Other Action
      while strOther <> '' do
      begin
        if Pos(';', strOther) <> 0 then
        begin
          strName := Copy(strOther, 1, Pos(';', strOther) - 1);
          strOther := Copy(strOther, Pos(';', strOther) + 1, Length(strOther));
        end else
        begin
          strName := strOther;
          strOther := '';
        end;
        if Pos('-', strName) <> 0 then
        begin
          strCaption := Copy(strName, 1, Pos('-', strName)- 1);
          strName := Copy(strName, Pos('-', strName) + 1, Length(strName));
          SaveAction(AMenuName, strFName, strName, strCaption);
        end;
      end;
    end
    else
      ShowMessage(PChar('File ''' + strFName + '.pas'' not find!'));
  end;
end;

//SaveAction
procedure TfrmComMain.SaveAction(mName, fName, aName, aCaption: string);
begin
  if (aCaption = '') or (aName = 'aRefresh') or (aName = 'aSearch') or
    (aName = 'aAll') or (aName = 'aViewMode') or (aName = 'aSetViewMode') or
    (aName = 'aDetail') or (aName = 'aView') then
    exit;
  fName := 'frm' + fName;  
  if Pos('(&', aCaption) > 0 then
    aCaption := Copy(aCaption+'a', 1, Pos('(&', aCaption) - 1);
  with Data.Tmp do
  begin
    Close;
    if aCaption = 'Delete Action' then
      CommandText := 'delete from AppAction ' +
        'where mName = ''' + mName + ''' and ' +
        'fName = ''' + fName + ''' and ' +
        'aName = ''' + aName + ''''
    else
      CommandText := 'insert into AppAction (mName, fName, aName, aCaption, aIndex) ' +
        'values (''' + mName + ''', ''' + fName + ''', ''' + aName + ''', ' +
        '''' + aCaption + ''', ' + IntToStr(AppMemo.Tag) + ')';
    Execute;
  end;
  AppMemo.Tag := AppMemo.Tag + 1;
end;

end.
