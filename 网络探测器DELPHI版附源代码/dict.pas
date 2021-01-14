unit dict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmDict = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    user_l: TLabel;
    pass_l: TLabel;
    user_list: TMemo;
    pass_list: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure user_listChange(Sender: TObject);
    procedure pass_listChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDict: TfrmDict;

implementation

{$R *.dfm}

uses main, function_1;

procedure TfrmDict.N1Click(Sender: TObject);
begin
  if (frmMain.open_port.Execute) then
    TMemo((PopupMenu1).PopupComponent).Lines.loadFromFile(frmMain.open_port.FileName);
end;

procedure TfrmDict.N2Click(Sender: TObject);
begin
  if (frmMain.save_port.Execute) then
    TMemo((PopupMenu1).PopupComponent).Lines.SaveToFile(frmMain.save_port.FileName);

end;

procedure TfrmDict.N4Click(Sender: TObject);
begin
  TMemo((PopupMenu1).PopupComponent).Clear;
end;

procedure TfrmDict.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDict.user_listChange(Sender: TObject);
begin
 user_l.Caption := IntToStr(user_list.Lines.Count);
 pass_l.Caption := IntToStr(pass_list.Lines.Count);

end;

procedure TfrmDict.pass_listChange(Sender: TObject);
var
  i, len : integer;
  str : AnsiString;
begin
  for i:= 0 to frmMain.share_user.Items.Count-1 do
  begin
    str := frmMain.share_user.Items.Item[i].Text;
    len := Pos('>[',str);
    if (len > 1 ) then
    begin
      Delete(str,1,len+1);
      SetLength(str,Pos(']',str)-1);
      if (TMemo((PopupMenu1).PopupComponent).Lines.IndexOf(str) = -1) then
        TMemo((PopupMenu1).PopupComponent).Lines.Add(str);
    end;
  end;
end;

procedure TfrmDict.CheckBox1Click(Sender: TObject);
begin
  const_pass := CheckBox1.Checked;
end;

end.                                     
