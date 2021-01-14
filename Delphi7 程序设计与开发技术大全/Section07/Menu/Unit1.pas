unit Unit1;

interface

uses
  SysUtils, Windows, Classes, Graphics, Forms, Controls,
  StdCtrls, Menus, Dialogs, ExtCtrls;
       
type
  TForm1 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  public
    procedure SizeItemClick(Sender: TObject);
    procedure SizeClick(Sender: TObject);
  end;
const
  idSysAbout = 100;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  PullDown, Item: TMenuItem;
  Position, I: Integer;
begin
  // 生成下拉菜单
  PullDown := TMenuItem.Create (self);
  PullDown.Caption := '文字大小';
  PullDown.OnClick := SizeClick;
  // 设置菜单的位置
  Position := MainMenu1.Items.IndexOf (file1);
  MainMenu1.Items.Insert (Position + 1, PullDown);
  I := 8;
  while I <= 48 do
  begin
    // 生成子菜单
    Item := TMenuItem.Create (self);
    Item.Caption := IntToStr (I);
    Item.GroupIndex := 1;
    Item.RadioItem := True;
    // 设定响应事件
    Item.OnClick := SizeItemClick;
    PullDown.Insert (PullDown.Count, Item);
    I := I + 4;
  end;
end;

procedure TForm1.SizeItemClick(Sender: TObject);
begin
  with Sender as TMenuItem do
    Label1.Font.Size := StrToInt (Caption);
end;

procedure TForm1.SizeClick (Sender: TObject);
var//修改文字大小
  I: Integer;
  Found: Boolean;
begin
  Found := False;
  with Sender as TMenuItem do
  begin
    for I := 0 to Count - 2 do
      if StrToInt (Items [I].Caption) =
        Label1.Font.Size then
      begin
        Items [I].Checked := True;
        Found := True;
        System.Break; // skip the rest of the loop
      end;
    if not Found then
      Items [Count - 1].Checked := True;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  I: Integer;
begin
  // 添加分割条
  AppendMenu (GetSystemMenu (Handle, FALSE), MF_SEPARATOR, 0, '');
  // 将MainMenu控件中的菜单添加到系统菜单中
  with MainMenu1 do
    for I := 0 to Items.Count - 1 do
      AppendMenu (GetSystemMenu (self.Handle, FALSE),
        mf_Popup, Items[I].Handle, PChar (Items[I].Caption));
  // 使按钮变为不可用状态
  N2.Enabled := False;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
//粗体
if N4.Checked then
  Label1.Font.Style:=Label1.Font.Style -[fsBold]
else
  Label1.Font.Style:=Label1.Font.Style +[fsBold];
//复选标志
N4.Checked:=not N4.Checked ;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
//斜体
if N5.Checked then
  Label1.Font.Style:=Label1.Font.Style -[fsItalic]
else
  Label1.Font.Style:=Label1.Font.Style +[fsItalic];
//复选标志
N5.Checked:=not N5.Checked ;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
//下划线
if N6.Checked then
  Label1.Font.Style:=Label1.Font.Style -[fsUnderline]
else
  Label1.Font.Style:=Label1.Font.Style +[fsUnderline];
//复选标志
N6.Checked:=not N6.Checked ;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
//红色
Label1.Font.Color:=clRed;
//单选标志
N8.Checked:=True;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
//绿色
Label1.Font.Color:=clGreen;
//单选标志
N9.Checked:=True;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
//蓝色
Label1.Font.Color:=clBlue;
//单选标志
N10.Checked:=True;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
//字体为“@幼圆”
Label1.Font.Name:=N15.Caption;
//单选标志
N15.Checked :=True;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
//字体为“宋体”
Label1.Font.Name:=N1.Caption;
//单选标志
N1.Checked :=True;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
Close;
end;

end.

