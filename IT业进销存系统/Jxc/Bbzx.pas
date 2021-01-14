unit Bbzx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, DBCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
  Clipbrd, StdCtrls ,db, QuickRpt, dbtables, dbclient, comedit, ActnList,
  buttons, jpeg;

type
  TfrmBbzx = class(TForm)
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    Label1: TLabel;
    Image2: TImage;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnModify: TToolButton;
    btnDel: TToolButton;
    ToolButton10: TToolButton;
    btnExit: TToolButton;
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    Image1: TImage;
    ActionList1: TActionList;
    aExit: TAction;
    Panel2: TPanel;
    ilsSub: TImageList;
    mnuAll: TMenuItem;
    mnuCopy: TMenuItem;
    mnuClear: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ListBox1: TListBox;
    Panel6: TPanel;
    Panel7: TPanel;
    ComboBox1: TComboBox;
    Panel8: TPanel;
    aBblx: TAction;
    aBb: TAction;
    aGo: TAction;
    Panel12: TPanel;
    KhXsHz: TImage;
    Splitter1: TSplitter;
    procedure aExitExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aBblxExecute(Sender: TObject);
    procedure aBbExecute(Sender: TObject);
    procedure aGoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBbzx: TfrmBbzx;

implementation

uses
  Dm, Main, MyLib;

{$R *.DFM}

procedure TfrmBbzx.FormShow(Sender: TObject);
var
  i: integer;
begin
  Panel12.Align := alClient;
  Panel12.Visible := False;
  //ComboBox1
  with frmMain.mnuBbGl do
    for i := 0 to Count - 1 do
      if Items[i].Visible and Items[i].Enabled and (Items[i].Tag = 0) and
        (Items[i].Caption <> '-') and (Pos('报表中心', Items[i].Caption) = 0) then
        ComboBox1.Items.AddObject(ClearHotKey(Items[i].Caption), Items[i]);
  ComboBox1.ItemIndex := 0;
  ComboBox1Change(nil);
end;

procedure TfrmBbzx.ComboBox1Change(Sender: TObject);
var
  i: integer;
begin
  ListBox1.Items.Clear;
  if (ComboBox1.ItemIndex >= 0) and
    (ComboBox1.Items.Objects[ComboBox1.ItemIndex] is TMenuItem) then
  begin
    with TMenuItem(ComboBox1.Items.Objects[ComboBox1.ItemIndex]) do
      for i := 0 to Count - 1 do
        if Items[i].Visible and Items[i].Enabled and (Items[i].Tag = 0) and
          (Items[i].Caption <> '-') and (Pos('报表中心', Items[i].Caption) = 0) then
          ListBox1.Items.AddObject(ClearHotKey(Items[i].Caption), Items[i]);
    ListBox1.ItemIndex := 0;
    ListBox1Click(nil);
  end;
end;

procedure TfrmBbzx.FormActivate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to frmMain.tlbAForm.ButtonCount - 1 do
    if frmMain.tlbAForm.Buttons[i].Hint <> self.Name then
      frmMain.tlbAForm.Buttons[i].ImageIndex := 0
    else
      frmMain.tlbAForm.Buttons[i].ImageIndex := 1;
end;

procedure TfrmBbzx.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmBbzx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBbzx.aBblxExecute(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TfrmBbzx.aBbExecute(Sender: TObject);
begin
  ListBox1.SetFocus;
end;

procedure TfrmBbzx.aGoExecute(Sender: TObject);
begin
  if (ListBox1.ItemIndex >= 0) and
    (ListBox1.Items.Objects[ListBox1.ItemIndex] is TMenuItem) then
    TMenuItem(ListBox1.Items.Objects[ListBox1.ItemIndex]).Click;
end;

procedure TfrmBbzx.ListBox1Click(Sender: TObject);
var
  s: string;
  c: TComponent;
begin
  s := TMenuItem(ListBox1.Items.Objects[ListBox1.ItemIndex]).Name;
  s := Copy(s, 6, 50);
  c := Self.FindComponent(s);
  if (c <> nil) and (c is TImage) then
  begin
    Panel12.Visible := False;
    TImage(c).Align := alClient;
    TImage(c).Visible := True;
  end
  else
    Panel12.Visible := True;
end;

end.

