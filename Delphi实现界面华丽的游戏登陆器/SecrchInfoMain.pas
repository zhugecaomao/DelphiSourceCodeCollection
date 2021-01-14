unit SecrchInfoMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ExtCtrls, RzButton, StrUtils, Share, ShlObj, ActiveX;

type
  TSecrchFrm = class(TForm)
    GroupBox1: TGroupBox;
    StopButton: TRzButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RzToolButtonSearch: TRzToolButton;
    SecrchInfoLabel: TRzLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditPath: TEdit;
    RzButtonSelDir: TRzButton;
    procedure SearchMirClient();
    procedure StopButtonClick(Sender: TObject);
    procedure RzToolButtonSearchClick(Sender: TObject);
    procedure RzButtonSelDirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function CheckMirDir(DirName: string): Boolean;
var
  SecrchFrm: TSecrchFrm;
implementation
var
  boStopSearch: Boolean = FALSE;
  boSearchFinish: Boolean = FALSE;
{$R *.dfm}
function SelectDirCB(Wnd: HWND; uMsg: UINT; lParam, lpData: lParam): Integer stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) and (lpData <> 0) then
    SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpData);
  result := 0;
end;

function SelectDirectory(const Caption: string; const Root: WideString;
  var Directory: string; Owner: THandle): Boolean;
var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;
begin
  result := FALSE;
  if not DirectoryExists(Directory) then
    Directory := '';
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      with BrowseInfo do begin
        hwndOwner := Owner;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS;
        if Directory <> '' then begin
          lpfn := SelectDirCB;
          lParam := Integer(PChar(Directory));
        end;
      end;
      WindowList := DisableTaskWindows(0);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        EnableTaskWindows(WindowList);
      end;
      result := ItemIDList <> nil;
      if result then begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

function AddString(s: string): string;
begin
  result := s;
  if s[Length(s)] <> '\' then result := s + '\';
end;

function ReadMessage(MessageText: string; LengCount: Integer): string;
var
  I, CopyCout: Integer;
  Str: string;
begin
  if Length(MessageText) <= LengCount then begin
    result := MessageText;
    exit;
  end;
  if Length(MessageText) > LengCount then begin
    CopyCout := (Length(MessageText) div LengCount) + 1;
    for I := 1 to CopyCout do begin
      if I = 1 then begin
        Str := Str + MidStr(MessageText, 1, LengCount) + #13;
      end else begin
        if I = CopyCout then begin
          Str := Str + MidStr(MessageText, (I * LengCount) + 1, Length(MessageText) - (I * LengCount)) + #13;
          break;
        end;
      end;
      Str := Str + MidStr(MessageText, (I * LengCount) + 1, LengCount) + #13;
    end;
    result := Str;
  end;
end;

//获取当前的硬盘所有的盘符
procedure GetdriveName(var sList: TStringList);
var
  I, dtype: Integer;
  c: string;
begin
  for I := 65 to 90 do begin
    c := chr(I) + ':\';
    dtype := getdrivetype(PChar(c));
    if (not ((dtype = 0) or (dtype = 1))) and (dtype = drive_fixed) then {//过滤光驱}  begin
      sList.Add(c);
    end;
  end;
end;

function DoSearchFile(path: string; var Files: TStringList): Boolean;
var
  Info: TsearchRec;
  s01: string;
  procedure ProcessAFile(FileName: string);
  begin
   {if Assigned(PnlPanel) then
     PnlPanel.Caption := FileName;
   Label2.Caption := FileName;}
  end;
  function IsDir: Boolean;
  begin
    with Info do
      result := (Name <> '.') and (Name <> '..') and ((Attr and faDirectory) = faDirectory);
  end;
  function IsFile: Boolean;
  begin
    result := not ((Info.Attr and faDirectory) = faDirectory);
  end;
begin
  try
    result := FALSE;
    if findfirst(path + '*.*', faAnyFile, Info) = 0 then begin
      if IsDir then begin
        s01 := path + Info.Name;
        if s01[Length(s01)] <> '\' then s01 := s01 + '\';
        Files.Add(s01);
      end;
      while True do begin
        if m_BoSearchFinish then break;
        if boStopSearch then break;
        s01 := path + Info.Name;
        if s01[Length(s01)] <> '\' then s01 := s01 + '\';
        if IsDir then Files.Add(s01);
        Application.ProcessMessages;
        if findnext(Info) <> 0 then break;
      end;
    end;
    result := True;
  finally
    findclose(Info);
  end;
end;

procedure TSecrchFrm.SearchMirClient();
var
  I, II: Integer;
  sList, sTempList, List01, List02: TStringList;
begin
  boSearchFinish:=TRUE;
  sList := TStringList.Create;
  sTempList := TStringList.Create;
  List01 := TStringList.Create;
  List02 := TStringList.Create;
  GetdriveName(sList);
  for I := 0 to sList.Count - 1 do begin
    Application.ProcessMessages;
    if m_BoSearchFinish then break;
    if boStopSearch then break;
    SecrchInfoLabel.Caption := '正在搜索：' + sList.Strings[I];
    if CheckMirDir(sList.Strings[I]) then begin
      m_sMirClient := sList.Strings[I];
      m_BoSearchFinish := True;
      break;
    end;
    if DoSearchFile(sList.Strings[I], sTempList) then begin
      if m_BoSearchFinish then break;
      if boStopSearch then break;    
      for II := 0 to sTempList.Count - 1 do begin
        SecrchInfoLabel.Caption := '正在搜索：' + sTempList.Strings[II];
        if CheckMirDir(sTempList.Strings[II]) then begin
          m_sMirClient := sTempList.Strings[II];
          m_BoSearchFinish := True;
          break;
        end;
      end;
    end;
  end;
  List01.AddStrings(sTempList);
  if (not m_BoSearchFinish) and (not boStopSearch) then begin
    I := 0;
    while True do begin              //从C盘到最后一个盘反复搜索
      if m_BoSearchFinish then break;
      if boStopSearch then break;
      Application.ProcessMessages;
      if List01.Count <=0 then Break;
      sTempList.Clear;
      if DoSearchFile(List01.Strings[I], sTempList) then begin
        if m_BoSearchFinish then break;
        if boStopSearch then break;
        List02.AddStrings(sTempList);
        for II := 0 to sTempList.Count - 1 do begin
          if m_BoSearchFinish then break;
          if boStopSearch then break;
          SecrchInfoLabel.Caption := '正在搜索：' + sTempList.Strings[II];
          if CheckMirDir(sTempList.Strings[II]) then begin
            m_sMirClient := sTempList.Strings[II];
            m_BoSearchFinish := True;
            break;
          end;
        end;
      end;
      Inc(I);
      if I > List01.Count - 1 then begin
        List01.Clear;
        List01.AddStrings(List02);
        List02.Clear;
        I := 0;
      end;
    end;
  end;
  sList.Free;
  sTempList.Free;
  List01.Free;
  List02.Free;
  boSearchFinish:=FALSE;
end;

function CheckMirDir(DirName: string): Boolean;
begin
  if (not DirectoryExists(DirName + 'Data')) or
    (not DirectoryExists(DirName + 'Map')) or
    (not DirectoryExists(DirName + 'Wav')) then
    result := FALSE else result := True;
end;

procedure TSecrchFrm.StopButtonClick(Sender: TObject);
begin
  boStopSearch := True;
  Sleep(100);
  Close;
end;

procedure TSecrchFrm.RzToolButtonSearchClick(Sender: TObject);
begin
  if boSearchFinish then Exit;
  RzButtonSelDir.Enabled:=False;
  SearchMirClient();
  RzButtonSelDir.Enabled:=TRUE;
  Close;
end;

procedure TSecrchFrm.RzButtonSelDirClick(Sender: TObject);
var
  sNewDir: string;
begin
  sNewDir := EditPath.Text;
  if SelectDirectory('浏览文件夹', '', sNewDir, Handle) then begin
    EditPath.Text := sNewDir;
    m_sMirClient := sNewDir;
    if m_sMirClient[Length(m_sMirClient)] <> '\' then m_sMirClient := m_sMirClient + '\';
    m_BoSearchFinish := True;
    Close;
  end;
end;

procedure TSecrchFrm.FormCreate(Sender: TObject);
begin
  boStopSearch := False;
  m_BoSearchFinish := False;
  //boSearchFinish:=FALSE;
end;

procedure TSecrchFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 // boStopSearch := True;
end;

end.

