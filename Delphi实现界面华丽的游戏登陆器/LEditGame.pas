unit LEditGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Share, RzButton, Main;

type
  TfrmEditGame = class(TForm)
    ListBoxGame: TListBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    EditGamePort: TEdit;
    EditGameAddr: TEdit;
    EditNotice: TEdit;
    EditServerName: TEdit;
    ButtonGameChange: TRzButton;
    ButtonGameAdd: TRzButton;
    ButtonGameDel: TRzButton;
    ButtonGameSave: TRzButton;
    procedure ListBoxGameClick(Sender: TObject);
    procedure ButtonGameChangeClick(Sender: TObject);
    procedure ButtonGameAddClick(Sender: TObject);
    procedure ButtonGameDelClick(Sender: TObject);
    procedure ButtonGameSaveClick(Sender: TObject);
  private
    SelGameZone: pTGameZone;
    procedure SaveServerList();
    { Private declarations }
    procedure LoadLocalGameList;
  public
    procedure Open();

    { Public declarations }
  end;

var
  frmEditGame: TfrmEditGame;

implementation

uses HUtil32;

{$R *.dfm}
procedure TfrmEditGame.LoadLocalGameList;
var
  SectionsList: TStringlist;
  I: Integer;
  sLineText, sShowName, sServerName, sServeraddr, sServerPort, sNoticeUrl: string;
  GameZone: pTGameZone;
begin
  ListBoxGame.Items.Clear;
  if FileExists(m_sLocalGameListName) then begin
    SectionsList := TStringlist.Create;
    SectionsList.LoadFromFile(m_sLocalGameListName);
    for I := 0 to SectionsList.Count - 1 do begin
      sLineText := Trim(SectionsList.Strings[I]);
      if (sLineText[1] <> ';') and (sLineText <> '') then begin
        MainForm.GetServerInfo(sLineText, GameZone);
        if GameZone <> nil then begin
          ListBoxGame.Items.AddObject(GameZone.sShowName, TObject(GameZone));
        end;
      end;
    end;
    SectionsList.Free;
  end;
end;

procedure TfrmEditGame.SaveServerList();
var
  I: Integer;
  GameZone: pTGameZone;
  ServerList: TStringlist;
  sLineText: string;
begin
  ServerList := TStringlist.Create;
  for I := 0 to ListBoxGame.Items.Count - 1 do begin
    GameZone := pTGameZone(ListBoxGame.Items.Objects[I]);
    if GameZone <> nil then begin
      sLineText := GameZone.sShowName + '|' + GameZone.sServerName + '|' + GameZone.sGameIPaddr +
        '|' + IntToStr(GameZone.nGameIPPort) + '|' + GameZone.sNoticeUrl;
      ServerList.Add(sLineText);
    end;
  end;
  ServerList.SaveToFile(m_sLocalGameListName);
  ServerList.Free;
end;

procedure TfrmEditGame.Open();
begin
  SelGameZone := nil;
  EditServerName.Text := '';
  EditGameAddr.Text := '';
  EditGamePort.Text := '7000';
  EditNotice.Text := 'http://';
  LoadLocalGameList;
  ShowModal;
end;

procedure TfrmEditGame.ListBoxGameClick(Sender: TObject);
begin
  try
    SelGameZone := pTGameZone(ListBoxGame.Items.Objects[ListBoxGame.ItemIndex]);
    EditServerName.Text := SelGameZone.sServerName;
    EditGameAddr.Text := SelGameZone.sGameIPaddr;
    EditGamePort.Text := IntToStr(SelGameZone.nGameIPPort);
    EditNotice.Text := SelGameZone.sNoticeUrl;
  except
    SelGameZone := nil;
  end;
end;
{
function TFrmShopItem.InListViewItemList(sItemName: string): Boolean;
var
  I: Integer;
  ListItem: TListItem;
begin
  Result := False;
  ListViewItemList.Items.BeginUpdate;
  try
    for I := 0 to ListViewItemList.Items.Count - 1 do begin
      ListItem := ListViewItemList.Items.Item[I];
      if CompareText(sItemName, ListItem.Caption) = 0 then begin
        Result := True;
        Break;
      end;
    end;
  finally
    ListViewItemList.Items.EndUpdate;
  end;
end;
}

procedure TfrmEditGame.ButtonGameChangeClick(Sender: TObject);
var
  sServerName, sGameIPaddr, sGamePort: string;
  nGamePort, nItemIndex: Integer;
begin
  if SelGameZone = nil then Exit;
  sServerName := Trim(EditServerName.Text);
  sGameIPaddr := Trim(EditGameAddr.Text);
  sGamePort := Trim(EditGamePort.Text);
  nGamePort := Str_ToInt(sGamePort, -1);
  if sServerName = '' then begin
    ShowMessage('服务器名称，输入不正确！！！');
    EditServerName.SetFocus;
    Exit;
  end;
  if sGameIPaddr = '' then begin
    ShowMessage('服务器地址，输入不正确！！！');
    EditGameAddr.SetFocus;
    Exit;
  end;
  if (nGamePort < 0) or (nGamePort > 65535) then begin
    ShowMessage('服务器端口，输入不正确！！！');
    EditGamePort.SetFocus;
    Exit;
  end;
  nItemIndex := ListBoxGame.ItemIndex;
  try
    ListBoxGame.Items.Strings[nItemIndex] := sServerName;
    SelGameZone.sShowName := sServerName;
    SelGameZone.sServerName := sServerName;
    SelGameZone.sGameIPaddr := sGameIPaddr;
    SelGameZone.nGameIPPort := nGamePort;
    SelGameZone.sNoticeUrl := Trim(EditNotice.Text);
  except
    SelGameZone := nil;
  end;
end;

procedure TfrmEditGame.ButtonGameAddClick(Sender: TObject);
var
  sServerName, sGameIPaddr, sGamePort: string;
  nGamePort: Integer;
  GameZone: pTGameZone;
begin
  sServerName := Trim(EditServerName.Text);
  sGameIPaddr := Trim(EditGameAddr.Text);
  sGamePort := Trim(EditGamePort.Text);
  nGamePort := Str_ToInt(sGamePort, -1);
  if sServerName = '' then begin
    Application.MessageBox('服务器名称，输入不正确！！！', '提示信息', MB_OK + MB_ICONSTOP);
    EditServerName.SetFocus;
    Exit;
  end;
  if sGameIPaddr = '' then begin
    Application.MessageBox('服务器地址，输入不正确！！！', '提示信息', MB_OK + MB_ICONSTOP);
    EditGameAddr.SetFocus;
    Exit;
  end;
  if (nGamePort < 1024) or (nGamePort > 65535) then begin
    Application.MessageBox('服务器端口，输入不正确！！！', '提示信息', MB_OK + MB_ICONSTOP);
    EditGamePort.SetFocus;
    Exit;
  end;
  New(GameZone);
  GameZone.sShowName := sServerName;
  GameZone.sServerName := sServerName;
  GameZone.sGameIPaddr := sGameIPaddr;
  GameZone.nGameIPPort := nGamePort;
  GameZone.sNoticeUrl := Trim(EditNotice.Text);
  ListBoxGame.Items.AddObject(sServerName, TObject(GameZone));
end;

procedure TfrmEditGame.ButtonGameDelClick(Sender: TObject);
begin
  if SelGameZone = nil then Exit;
  if MessageBox(Handle, '是否确认删除此游戏?', '确认信息', MB_YESNO + MB_ICONQUESTION) <> ID_YES then Exit;
  try
    ListBoxGame.DeleteSelected;
  except
  end;
end;

procedure TfrmEditGame.ButtonGameSaveClick(Sender: TObject);
begin
  SaveServerList();
  MainForm.LoadLocalGameList;
  MainForm.LoadGameListToBox;
  Close;
end;

end.

