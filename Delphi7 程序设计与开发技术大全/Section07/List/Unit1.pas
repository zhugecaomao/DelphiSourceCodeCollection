unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ToolWin, ActnList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    N3: TMenuItem;
    X1: TMenuItem;
    E1: TMenuItem;
    Q1: TMenuItem;
    H1: TMenuItem;
    A1: TMenuItem;
    A3: TMenuItem;
    S1: TMenuItem;
    N4: TMenuItem;
    ImageList2: TImageList;
    ListBox1: TListBox;
    TreeView1: TTreeView;
    ListView1: TListView;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Label1: TLabel;
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
ShowMessage('打开');
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
close;
end;

procedure TForm1.Action7Execute(Sender: TObject);
begin
ShowMessage('关于');
end;

procedure TForm1.TreeView1Click(Sender: TObject);
begin
Label1.Caption:='TreeView：'+TreeView1.Selected.Text ;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
case ListBox1.ItemIndex of
  0:ListView1.ViewStyle:=vsIcon;
  1:ListView1.ViewStyle:=vsList;
  2:ListView1.ViewStyle:=vsReport;
  3:ListView1.ViewStyle:=vsSmallIcon;
end;
end;

procedure TForm1.ListView1Click(Sender: TObject);
begin
Label1.Caption:='ListView：'+ListView1.Selected.Caption;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
ShowMessage('保存');
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
ShowMessage('全选');
end;

procedure TForm1.Action5Execute(Sender: TObject);
begin
ShowMessage('清空');
end;

procedure TForm1.Action6Execute(Sender: TObject);
begin
ShowMessage('查找');
end;

end.
