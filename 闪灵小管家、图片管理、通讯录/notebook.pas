unit notebook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ToolWin, Menus,mmsystem, Buttons, DB, ADODB,
  ImgList, XPMenu;

type
  Tnotebook_form = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SaveDialog1: TSaveDialog;
    ADOQuery1: TADOQuery;
    BitBtn3: TBitBtn;
    ImageList1: TImageList;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ADOQuery2: TADOQuery;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    showdata: TSpeedButton;
    TreeView1: TTreeView;
    BitBtn: TBitBtn;
    FontDialog1: TFontDialog;
    richedit1: TMemo;
    MainMenu1: TMainMenu;
    N1111: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    BitBtn5: TToolButton;
    ImageList2: TImageList;
    BitBtn4: TToolButton;
    BitBtn2: TToolButton;
    BitBtn1: TToolButton;
    ToolButton5: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    V1: TMenuItem;
    N7: TMenuItem;
    C1: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    ToolButton1: TToolButton;
    N3: TMenuItem;
    N9: TMenuItem;
    XPMenu1: TXPMenu;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure showdataClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtnClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  notebook_form: Tnotebook_form;
  node1,node2:Ttreenode;
  str:string;

implementation
  uses main,cateloge_set;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;


procedure Tnotebook_form.FormCreate(Sender: TObject);

begin
showdataclick(self);
end;

procedure Tnotebook_form.BitBtn5Click(Sender: TObject);
begin
set_cateloge:=Tset_cateloge.Create(self);
set_cateloge.ADOQuery1.Active:=true;
set_cateloge.ShowModal;
end;

procedure Tnotebook_form.BitBtn3Click(Sender: TObject);
begin
richedit1.ReadOnly:=false;
Label1.Visible:=true;
Label2.Visible:=true;
edit1.Visible:=true;
combobox2.Visible:=true;
BitBtn3.Enabled:=false;
BitBtn6.Enabled:=true;
end;
procedure Tnotebook_form.showdataClick(Sender: TObject);
var
i:integer;
begin
TreeView1.Items.Clear;
combobox2.Items.Clear;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from cateloge');
prepared;
open;
end;
ADOQuery1.First;
if not ADOQuery1.Eof then
  for i:=1 to ADOQuery1.RecordCount do
  begin
    ComboBox2.Items.Add(ADOQuery1.FieldValues['cateloge']);
    ADOQuery1.Next;
  end;
ADOQuery1.First;
while not ADOQuery1.Eof do
begin
node2:=TreeView1.Items.Add(node1,ADOQuery1.FieldValues['cateloge']);
  with  ADOQuery2 do
    begin
    close;
    sql.Clear;
    sql.Add('select * from notebook where cateloge=:a');
    Parameters[0].Value:=ADOQuery1.FieldValues['cateloge'];
    prepared;
    open;
    end;
while not ADOQuery2.Eof do
begin
 node2.ImageIndex := 1;
 TreeView1.Items.AddChildFirst(node2,ADOQuery2.FieldValues['title']) ;
 ADOQuery2.next;
end;
 ADOQuery1.next;
end;

end;

procedure Tnotebook_form.BitBtn6Click(Sender: TObject);
begin
if (trim(edit1.Text)='') or (trim(combobox2.Text)='') or (trim(richedit1.Text)='') then
begin
  playwav('sound\error.wav');
  messagebox(handle,'请把标题、分类、内容填写完整！','提示',MB_OK+MB_ICONERROR);
  exit;
end;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from notebook where title="'+trim(edit1.Text)+'"');
open;
end;
ADOQuery1.First;
if not ADOQuery1.Eof then
begin
  playwav('sound\error.wav');
  messagebox(handle,'此主题已经存在'#13#10'请改用其它的主题名称！','提示',MB_OK+MB_ICONERROR);
  exit;
end;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from notebook ');
open;
Append;
edit;
FieldValues['datetime']:=formatDateTime('yyyy-mm-dd',date());
FieldValues['title']:=trim(edit1.Text);
FieldValues['content']:=richedit1.Text;
FieldValues['cateloge']:=combobox2.Text;
post;
end;
richedit1.Text:='';
edit1.Text:='';
richedit1.ReadOnly:=true;
Label1.Visible:=false;
Label2.Visible:=false;
edit1.Visible:=false;
combobox2.Visible:=false;
BitBtn3.Enabled:=true;
BitBtn6.Enabled:=false;
showdataclick(self);
end;

procedure Tnotebook_form.BitBtnClick(Sender: TObject);
begin
treeview1.SetFocus;
if treeview1.Selected.Level<>1 then
begin
playwav('sound\error.wav');
messagebox(handle,'清选择要删除的主题！','提醒',MB_OK+MB_ICONINFORMATION);
EXIT;
end;
str:=treeview1.Selected.Text;
playwav('sound\info.wav');
if messagebox(handle,'你确定要删除此主题吗？','询问',MB_YESNO+MB_ICONQUESTION)=ID_YES THEN
begin
with  ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('delete * from notebook where title="'+str+'"');
execsql;
end;
showdataclick(self);
end;
end;

procedure Tnotebook_form.BitBtn4Click(Sender: TObject);
begin
if FontDialog1.Execute then
richedit1.Font:=FontDialog1.Font;
end;

procedure Tnotebook_form.TreeView1Click(Sender: TObject);
var datetime:string;
begin
if treeview1.Items.Count=0 then
exit;
if treeview1.Selected.Level=1 then
begin
str:=treeview1.Selected.Text;
with  ADOQuery2 do
begin
close;
sql.Clear;
sql.Add('select * from notebook');
open;
end;
with  ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from notebook where title="'+str+'"');
open;
end;
datetime:=ADOQuery1.FieldValues['datetime'];
richedit1.Text:=ADOQuery1.FieldValues['content'];
statusbar1.Panels[0].Text:='总记录数为 ['+inttostr(ADOQuery2.RecordCount)+'] 条';
statusbar1.Panels[1].Text:='当前目录：'+treeview1.Selected.Parent.Text;
statusbar1.Panels[2].Text:='记录写入日期：'+formatdatetime('yyyy年mm月dd日',strtodate(datetime));
end;
end;

procedure Tnotebook_form.BitBtn2Click(Sender: TObject);
begin
if richedit1.Text=''then
exit;
if  SaveDialog1.Execute then
richedit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure Tnotebook_form.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
