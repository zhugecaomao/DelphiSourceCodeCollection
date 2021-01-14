unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls;

type
  TfrmBrowseUser = class(TForm)
    UserList: TListView;
    Pop: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label1: TLabel;
    N5: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure UserListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopPopup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseUser: TfrmBrowseUser;

implementation

uses Unit1, ChatSource, Unit6;

{$R *.dfm}

procedure TfrmBrowseUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TfrmBrowseUser.FormDestroy(Sender: TObject);
begin
  frmBrowseUser:=nil;
end;

procedure TfrmBrowseUser.UserListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FNode:TListItem;
  Pos:TPoint;
begin
  if Button=mbRight then
  begin
    FNode:=UserList.GetItemAt(x,y);
    if FNode<>nil then
    begin
      Pos.X:=x;
      Pos.Y:=y;
      Pos:=ClientToScreen(Pos);
      Pop.Popup(Pos.x,Pos.y);
    end;
  end;
end;

procedure TfrmBrowseUser.N1Click(Sender: TObject);
begin
  form1.N1Click(sender); 
end;

procedure TfrmBrowseUser.N2Click(Sender: TObject);
var
  i:integer;
begin
  if MessageBox(Handle, '真的要禁用吗？', '提示', MB_ICONASTERISK or MB_OKCANCEL)=IDOK then
  begin
    Chat.RealTemp.Close;
    Chat.RealTemp.SQL.Clear;
    Chat.RealTemp.SQL.Text:='update UserInfo'+#13+
                            'set deleted=1'+#13+
                            'where ID=:ID';
    Chat.RealTemp.Parameters[0].Value:=UserList.Selected.SubItems.Strings[0];
    Chat.RealTemp.ExecSQL;

    UserList.Selected.ImageIndex:=integer(not odd(UserList.Selected.ImageIndex))+21;
    UserList.Selected.SubItems.Strings[3]:='1';
    if UserList.Selected.SubItems.Strings[5]='1' then
    begin
      i:=form1.GetIndexByHandle(strtoint(UserList.Selected.SubItems.Strings[4]));
      form1.SendBy(form1.s.Socket.Connections[i],'admin','','Admin'+'('+datetimetoStr(Now)+'):'+#13#10+'  你的帐号已被禁用，下次将不能使用...' ,
        '','','','','');
    end;
  end;
end;

procedure TfrmBrowseUser.PopPopup(Sender: TObject);
begin
  N2.Enabled:=(UserList.Selected.SubItems.Strings[3]='0');
  N5.Enabled:=(UserList.Selected.SubItems.Strings[3]='1');  
end;

procedure TfrmBrowseUser.N5Click(Sender: TObject);
var
  i:integer;
begin
  Chat.RealTemp.Close;
  Chat.RealTemp.SQL.Clear;
  Chat.RealTemp.SQL.Text:='update UserInfo'+#13+
                          'set deleted=0'+#13+
                          'where ID=:ID';
  Chat.RealTemp.Parameters[0].Value:=UserList.Selected.SubItems.Strings[0];
  Chat.RealTemp.ExecSQL;
  UserList.Selected.ImageIndex:=strtoint(UserList.Selected.SubItems.Strings[6])*2+strtoint(UserList.Selected.SubItems.Strings[5])+17;
  UserList.Selected.SubItems.Strings[3]:='0';
  if UserList.Selected.SubItems.Strings[5]='1' then
  begin
    i:=form1.GetIndexByHandle(strtoint(UserList.Selected.SubItems.Strings[4]));
    form1.SendBy(form1.s.Socket.Connections[i],'admin','','Admin'+'('+datetimetoStr(Now)+'):'+#13#10+'  你的帐号已被恢复...' ,
      '','','','','');
  end;
end;

procedure TfrmBrowseUser.N4Click(Sender: TObject);
begin
  frmUserProp:=TfrmUserProp.Create(nil);
  frmUserProp.Edit1.Text:=UserList.Selected.SubItems.Strings[0];
  frmUserProp.Edit2.Text:=UserList.Selected.Caption;
  frmUserProp.Edit4.Text:=UserList.Selected.SubItems.Strings[1];
  frmUserProp.Edit5.Text:=UserList.Selected.SubItems.Strings[2];
  if UserList.Selected.SubItems.Strings[6]='0' then
    frmUserProp.Edit3.Text:='男'
  else
    frmUserProp.Edit3.Text:='女';
  frmUserProp.ShowModal;
  freeandnil(frmUserProp); 
end;

end.
