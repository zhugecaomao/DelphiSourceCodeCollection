unit link;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ImgList,shellAPI, ComCtrls,mmsystem, StdCtrls, ToolWin, Buttons,
  XPMenu, DB, ADODB;

type
  Tlink_Form = class(TForm)
    Panel1: TPanel;
    ToolBar: TToolBar;
    NewBtn: TToolButton;
    OptionBtn: TToolButton;
    DelBtn: TToolButton;
    PrintBtn: TToolButton;
    OperateBtn: TToolButton;
    ToolButton1: TToolButton;
    LookforBtn: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    input: TEdit;
    StatusBar: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    NewName: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N3: TMenuItem;
    sToolBar: TMenuItem;
    sStatus: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N20: TMenuItem;
    R1: TMenuItem;
    N11: TMenuItem;
    M1: TMenuItem;
    D1: TMenuItem;
    ImageList2: TImageList;
    PopupMenu1: TPopupMenu;
    N26: TMenuItem;
    N27: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N36: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    E3: TMenuItem;
    N2: TMenuItem;
    objectE3TMenuItem1: TMenuItem;
    ComboBox1: TComboBox;
    Label2: TLabel;
    search: TSpeedButton;
    PopupMenu2: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ToolButton2: TToolButton;
    PopupMenu3: TPopupMenu;
    G1: TMenuItem;
    M2: TMenuItem;
    L1: TMenuItem;
    D2: TMenuItem;
    XPMenu1: TXPMenu;
    ADOQuery1: TADOQuery;
    ListView1: TListView;
    showdata: TButton;
    N12: TMenuItem;
    SmallImage: TImageList;
    edit: TToolButton;
    procedure ToolButton2Click(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure showdataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure OptionBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure sToolBarClick(Sender: TObject);
    procedure sStatusClick(Sender: TObject);
    procedure searchClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  link_Form: Tlink_Form;

implementation
  uses main,md_link,person,per_rep;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;
{URL连接函数定义}
procedure URlink(URL:pchar);
begin
 shellexecute(0,nil,URL,nil,nil,sw_normal);
end;

procedure Tlink_Form.ToolButton2Click(Sender: TObject);
begin
close;
end;

procedure Tlink_Form.NewBtnClick(Sender: TObject);
begin
add_link:=Tadd_link.Create(self);
add_link.add:=true;
add_link.ShowModal;
end;

procedure Tlink_Form.showdataClick(Sender: TObject);
var
i:integer;
ListItem: TListItem;
begin
 ListView1.Items.Clear;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from link');
  prepared;
  open;
end;

if ADOQuery1.RecordCount=0 then exit;
StatusBar.Panels[0].Text:='通讯录总记录数为：'+inttostr(ADOQuery1.RecordCount);
for i:=1 to ADOQuery1.RecordCount do
with ListView1 do
 begin
   ListItem:=items.Add;
   ListItem.Caption:=ADOQuery1.FieldValues['name'];
   ListItem.SubItems.Add(ADOQuery1.FieldValues['birth']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['mobil']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['fmtel']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['oftel']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['fax']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['company']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['postnum']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['web']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['email']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['address']);
   ADOQuery1.Next;
 end;

end;

procedure Tlink_Form.FormCreate(Sender: TObject);
begin
showdataclick(self);
end;

procedure Tlink_Form.R1Click(Sender: TObject);
begin
showdataclick(self);
end;

procedure Tlink_Form.DelBtnClick(Sender: TObject);
var str:string;
begin
ListView1.SetFocus;
try
str:=ListView1.Selected.Caption;
except
exit;
end;
 if str='' then exit;
playwav('sound\error.wav');
if MessageBox(handle,'起确定要删除此人通讯记录吗！','询问',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('delete * from link where name="'+str+'"');
  ExecSQL;
end;
showdataclick(self);
playwav('sound\sucess.wav');
MessageBox(handle,'删除成功！','提示',MB_OK+MB_ICONINFORMATION);
end;
end;

procedure Tlink_Form.OptionBtnClick(Sender: TObject);
var
str:string;
begin
ListView1.SetFocus;
try
str:=ListView1.Selected.Caption;
except
exit;
end;
if str='' then exit;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from link where name="'+str+'"');
  open;
end;
person_form:=Tperson_form.Create(self);
with person_form do
begin
Label1.Caption:=ADOQuery1.FieldValues['name'];
Label12.Caption:=ADOQuery1.FieldValues['birth'];
Label13.Caption:=ADOQuery1.FieldValues['mobil'];
Label14.Caption:=ADOQuery1.FieldValues['fmtel'];
Label15.Caption:=ADOQuery1.FieldValues['web'];
Label16.Caption:=ADOQuery1.FieldValues['email'];
Label17.Caption:=ADOQuery1.FieldValues['address'];
Label18.Caption:=ADOQuery1.FieldValues['oftel'];
Label19.Caption:=ADOQuery1.FieldValues['fax'];
Label20.Caption:=ADOQuery1.FieldValues['company'];
Label21.Caption:=ADOQuery1.FieldValues['postnum'];
end;
person_form.ShowModal;
end;

procedure Tlink_Form.PrintBtnClick(Sender: TObject);
var str:string;
begin
ListView1.SetFocus;
try
str:=ListView1.Selected.Caption;
except
exit;
end;
if str='' then exit;
playwav('sound\error.wav');
if MessageBox(handle,'你确定要打印此通讯记录吗！','询问',MB_YESNO+MB_ICONQUESTION)=ID_NO then exit;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from link where name="'+str+'"');
  open;
end;
person_report:=Tperson_report.Create(self);
with person_report do
begin
QRLabel1.Caption:=ADOQuery1.FieldValues['name'];
QRLabel3.Caption:=ADOQuery1.FieldValues['birth'];
QRLabel14.Caption:=ADOQuery1.FieldValues['mobil'];
QRLabel15.Caption:=ADOQuery1.FieldValues['fmtel'];
QRLabel16.Caption:=ADOQuery1.FieldValues['web'];
QRLabel17.Caption:=ADOQuery1.FieldValues['email'];
QRLabel22.Caption:=ADOQuery1.FieldValues['address'];
QRLabel18.Caption:=ADOQuery1.FieldValues['oftel'];
QRLabel19.Caption:=ADOQuery1.FieldValues['fax'];
QRLabel20.Caption:=ADOQuery1.FieldValues['company'];
QRLabel21.Caption:=ADOQuery1.FieldValues['postnum'];
end;
person_report.Print;
end;

procedure Tlink_Form.MenuItem4Click(Sender: TObject);
var str,mail:string;
begin
ListView1.SetFocus;
try
str:=ListView1.Selected.Caption;
except
exit;
end;
if str='' then exit;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select email from link where name="'+str+'"');
  open;
end;
mail:=ADOQuery1.FieldValues['email'];
URlink(Pchar('mailto:'+mail+'?subject=朋友,你好'));
end;

procedure Tlink_Form.G1Click(Sender: TObject);
begin
ListView1.ViewStyle:=vsSmallIcon;
G1.Checked:=true;
end;

procedure Tlink_Form.M2Click(Sender: TObject);
begin
ListView1.ViewStyle:=vsIcon;
m2.Checked:=true;
end;

procedure Tlink_Form.L1Click(Sender: TObject);
begin
ListView1.ViewStyle:=vsList;
l1.Checked:=true;
end;

procedure Tlink_Form.D2Click(Sender: TObject);
begin
ListView1.ViewStyle:=vsReport;
D2.Checked:=true;
end;

procedure Tlink_Form.sToolBarClick(Sender: TObject);
begin
if sToolBar.Checked then
begin
  sToolBar.Checked:=false;
  Panel1.Visible:=false;
end
else
begin
  sToolBar.Checked:=true;
  Panel1.Visible:=true;
end
end;

procedure Tlink_Form.sStatusClick(Sender: TObject);
begin
if sStatus.Checked then
begin
  sStatus.Checked:=false;
  StatusBar.Visible:=false;
end
else
begin
  sStatus.Checked:=true;
  StatusBar.Visible:=true;
end
end;

procedure Tlink_Form.searchClick(Sender: TObject);
var
i:integer;
str,csql:string;
ListItem: TListItem;
begin
str:=trim(input.Text);
case ComboBox1.ItemIndex of
  0: csql:='where name like "%'+str+'%"';
  1: csql:='where birth like "%'+str+'%"';
  2: csql:='where mobil like "%'+str+'%"';
  3: csql:='where fmtel like "%'+str+'%"';
  4: csql:='where oftel like "%'+str+'%"';
  5: csql:='where company like "%'+str+'%"';
  6: csql:='where web like "%'+str+'%"';
  7: csql:='where email like "%'+str+'%"';
  8: csql:='where address like "%'+str+'%"';
end;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from link ');
  if str<>'' then
  sql.Add(csql);
  open;
end;
if ADOQuery1.RecordCount=0 then
begin
playwav('sound\info.wav');
MessageBox(handle,'没有找到相关记录！','提示',MB_OK+MB_ICONINFORMATION);
input.Text:='';
exit;
end;

ListView1.Items.Clear;
StatusBar.Panels[0].Text:='查询到的总记录数为：'+inttostr(ADOQuery1.RecordCount);
for i:=1 to ADOQuery1.RecordCount do
with ListView1 do
 begin
   ListItem:=items.Add;
   ListItem.Caption:=ADOQuery1.FieldValues['name'];
   ListItem.SubItems.Add(ADOQuery1.FieldValues['birth']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['mobil']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['fmtel']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['oftel']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['fax']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['company']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['postnum']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['web']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['email']);
   ListItem.SubItems.Add(ADOQuery1.FieldValues['address']);
   ADOQuery1.Next;
 end;
input.Text:='';
end;

procedure Tlink_Form.editClick(Sender: TObject);
var
str:string;
begin
ListView1.SetFocus;
try
str:=ListView1.Selected.Caption;
except
exit;
end;
if str='' then exit;
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from link where name="'+str+'"');
  open;
end;
add_link:=Tadd_link.Create(self);
add_link.Edit1.Text:=ADOQuery1.FieldValues['name'];
add_link.DateTimePicker1.Date:=strtodate(ADOQuery1.FieldValues['birth']);
add_link.Edit2.Text:=ADOQuery1.FieldValues['mobil'];
add_link.Edit5.Text:=ADOQuery1.FieldValues['fmtel'];
add_link.Edit8.Text:=ADOQuery1.FieldValues['web'];
add_link.Edit9.Text:=ADOQuery1.FieldValues['email'];
add_link.Edit10.Text:=ADOQuery1.FieldValues['address'];
add_link.Edit3.Text:=ADOQuery1.FieldValues['oftel'];
add_link.Edit6.Text:=ADOQuery1.FieldValues['fax'];
add_link.Edit4.Text:=ADOQuery1.FieldValues['company'];
add_link.Edit7.Text:=ADOQuery1.FieldValues['postnum'];
add_link.Caption:='更新'+str+'个人通讯资料';
add_link.BitBtn1.Caption:='更新(&U)';
add_link.add:=false;
add_link.ShowModal;
end;

procedure Tlink_Form.N10Click(Sender: TObject);
begin
close;
end;

end.
