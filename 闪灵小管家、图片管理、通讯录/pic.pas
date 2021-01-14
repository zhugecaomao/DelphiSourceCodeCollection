unit pic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtDlgs, ImgList,mmsystem, ExtCtrls, StdCtrls, ComCtrls, ToolWin,
  DB, ADODB,shellAPI, XPMenu;

type
  Tpic_Form = class(TForm)
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton12: TToolButton;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ToolButton14: TToolButton;
    ToolButton11: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton5: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    Panel1: TPanel;
    Panel6: TPanel;
    Memo1: TMemo;
    Panel5: TPanel;
    ImageList1: TImageList;
    SavePictureDialog1: TSavePictureDialog;
    ImageList2: TImageList;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel7: TPanel;
    Label3: TLabel;
    PageControl1: TPageControl;
    TreeTab: TTabSheet;
    TreeView1: TTreeView;
    SearchTab: TTabSheet;
    Panel2: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Button2: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    D1: TMenuItem;
    N4: TMenuItem;
    X1: TMenuItem;
    C1: TMenuItem;
    F1: TMenuItem;
    N5: TMenuItem;
    E1: TMenuItem;
    I1: TMenuItem;
    I2: TMenuItem;
    O1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    XPMenu1: TXPMenu;
    Image2: TImage;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ImageList3: TImageList;
    TreeView2: TTreeView;
    TrackBar1: TTrackBar;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    Procedure ZoomPicture(Zoom:single) ;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TreeView2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);           //图片放大,缩小
  private
    ZoomOut      :single;
    ZoomIn       :Single;
  public
    { Public declarations }
  end;

var
  pic_Form: Tpic_Form;
  node1,node2:Ttreenode;
  str:string;

implementation
 uses main,pic_add,photo_cateloge,edit_photo_note,modify_pic_file,pic_print;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tpic_Form.ZoomPicture(Zoom:single);     //图片缩放
var
   DRect:TRect;
   w,h  :integer;
   bitmap:TBitMap;
begin
   w:=Round(Image1.Width*Zoom);
   h:=Round(Image1.Height*Zoom);
   DRect:=Rect(0,0,w,h);
   Bitmap:=TBitmap.Create;
   try
       bitmap.Width:=w;
       bitmap.Height:=h;
       bitmap.Canvas.StretchDraw(DRect,Image1.Picture.Graphic);
       Image2.Parent:=ScrollBox1;
       image2.Width:=w;
       image2.Height:=h;
       image2.BringToFront;
       image2.Visible:=true;
       image1.Visible:=false;
       Image2.Picture.Assign(bitmap);
   finally
       BitMap.Free;
   end;
end;

procedure Tpic_Form.Button2Click(Sender: TObject);
var
i,n,k:integer;
begin
TreeView1.Items.Clear;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from photo_cateloge');
prepared;
open;
end;
n:=ADOQuery1.RecordCount;
ADOQuery1.First;
while not ADOQuery1.Eof do
begin
node2:=TreeView1.Items.Add(node1,ADOQuery1.FieldValues['dir']);
  with  ADOQuery2 do
    begin
    close;
    sql.Clear;
    sql.Add('select * from photo where dir=:a');
    Parameters[0].Value:=ADOQuery1.FieldValues['dir'];
    prepared;
    open;
    end;
while not ADOQuery2.Eof do
begin
 node2.ImageIndex := 1;
 TreeView1.Items.AddChildFirst(node2,ADOQuery2.FieldValues['name']) ;
 ADOQuery2.next;
end;
 ADOQuery1.next;
end;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from photo');
prepared;
open;
end;
k:=ADOQuery1.RecordCount;
StatusBar1.Panels[0].Text:='目录数: ['+inttostr(n)+']';
statusbar1.Panels[1].Text:='图片总数: ['+inttostr(k)+']';
end;

procedure Tpic_Form.FormCreate(Sender: TObject);
begin
    ZoomOut:=1.0;
    ZoomIn:=1.0;
Button2click(self);
end;

procedure Tpic_Form.TreeView1Click(Sender: TObject);
var pic_name:string;
begin
if treeview1.Items.Count=0 then
exit;
if treeview1.Selected.Level=1 then
begin
image1.Visible:=true;
image2.Visible:=false;
str:=treeview1.Selected.Text;
with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from photo where name="'+str+'"');
 prepared;
 open;
end;
pic_name:=ADOQuery1.FieldValues['file'];
if fileexists(extractfilepath(application.ExeName)+'\photos\'+pic_name) then
Image1.Picture.LoadFromFile(extractfilepath(application.ExeName)+'\photos\'+pic_name);
Memo1.Text:=ADOQuery1.FieldValues['note'];
end;
end;

procedure Tpic_Form.ToolButton1Click(Sender: TObject);
begin
add_pic:=Tadd_pic.Create(self);
add_pic.ShowModal;
end;

procedure Tpic_Form.ToolButton7Click(Sender: TObject);
begin
if SavePictureDialog1.Execute then
image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure Tpic_Form.ToolButton4Click(Sender: TObject);
var
dir_str,file_str:string;
i:integer;
begin
 treeview1.SetFocus;
if treeview1.Items.Count=0 then
exit;
if treeview1.Selected.Level=0 then
begin
playwav('sound\error.wav');
if messagebox(handle,'你确定要删除此照片夹吗？'+#13#10+'这样会删除此目录的所有照片！','警告',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
 image1.Picture.Bitmap.FreeImage;
 dir_str:=treeview1.Selected.Text;
 with ADOQuery1 do
 begin
 close;
 sql.Clear;
 sql.Add('delete * from photo_cateloge where dir="'+dir_str+'"');
 prepared;
 ExecSQL;
 end;

 with ADOQuery1 do
 begin
 close;
 sql.Clear;
 sql.Add('select * from photo where dir="'+dir_str+'"');
 prepared;
 open;
 end;
 if  ADOQuery1.RecordCount<>0 then
 for i:=1 to ADOQuery1.RecordCount do
 begin
  if fileexists(extractfilepath(application.ExeName)+'photos\'+ADOQuery1.FieldValues['file']) then
  deletefile(extractfilepath(application.ExeName)+'photos\'+ADOQuery1.FieldValues['file']);
  ADOQuery1.Next;
 end;
 with ADOQuery1 do
 begin
 close;
 sql.Clear;
 sql.Add('delete * from photo where dir="'+dir_str+'"');
 prepared;
 ExecSQL;
 end;

  playwav('sound\sucess.wav');
  messagebox(handle,'照片文件目录删除成功!','提示',MB_OK+MB_ICONINFORMATION);
  Button2click(self);
  exit;
  end;
end;
if treeview1.Selected.Level=1 then
begin
playwav('sound\error.wav');
if messagebox(handle,'你确定要删除此照片吗？','警告',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
 image1.Picture.Bitmap.FreeImage;
 file_str:=treeview1.Selected.Text;
 with ADOQuery1 do
 begin
 close;
 sql.Clear;
 sql.Add('select * from photo where name="'+file_str+'"');
 prepared;
 open;
 end;
 if ADOQuery1.RecordCount<>0 then
 begin
 if fileexists(extractfilepath(application.ExeName)+'photos\'+ADOQuery1.FieldValues['file']) then
  deletefile(extractfilepath(application.ExeName)+'photos\'+ADOQuery1.FieldValues['file']);
  ADOQuery1.Delete;
 end;
  playwav('sound\sucess.wav');
  messagebox(handle,'照片删除成功!','提示',MB_OK+MB_ICONINFORMATION);
  Button2click(self);
  treeview1.SetFocus;
end;
end;
end;
procedure Tpic_Form.ToolButton20Click(Sender: TObject);
begin
close;
end;

procedure Tpic_Form.ToolButton6Click(Sender: TObject);
var filename,filepath:string;
begin
TreeView1.SetFocus;
if TreeView1.Selected.Level=1 then
begin
filename:= TreeView1.Selected.Text;
 playwav('sound\info.wav');
if messagebox(handle,'你确定要打印此照片吗？','询问',MB_YESNO+MB_ICONQUESTION)=ID_YES then
begin
with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from photo where name="'+filename+'"');
 prepared;
 open;
end;
filepath:=extractfilepath(application.ExeName)+'photos\'+ADOQuery1.FieldValues['file'];
print_form:=Tprint_form.Create(self);
print_form.QRImage1.Picture.LoadFromFile(filepath);
try
print_form.Print;
except
begin
 playwav('sound\error.wav');
 messagebox(handle,'系统出错，打印失败 ！'+#13#10+'请确认打印机是否安装好？','错误',MB_OK+MB_ICONERROR);
end;
end;
end;
end;
end;

procedure Tpic_Form.ToolButton14Click(Sender: TObject);
begin
cateloge_photo:=Tcateloge_photo.Create(self);
cateloge_photo.ShowModal;
end;

procedure Tpic_Form.ToolButton8Click(Sender: TObject);
begin
if trim(memo1.Text)<>'' then
begin
photo_note_edit:=Tphoto_note_edit.Create(self);
photo_note_edit.ShowModal;
end;
end;

procedure Tpic_Form.ToolButton11Click(Sender: TObject);
begin
pic_form.TreeView1.SetFocus;
if pic_form.TreeView1.Items.Count=0 then
exit;
modify_pic:=Tmodify_pic.Create(self);
modify_pic.ShowModal;
end;

procedure Tpic_Form.ToolButton18Click(Sender: TObject);
begin
shellexecute(0,nil,'mspaint.exe',nil,nil,sw_normal);
end;

procedure Tpic_Form.ToolButton5Click(Sender: TObject);
begin
if not Assigned(Image1.Picture) Then exit;
   ZoomOut:=ZoomOut+0.1;
   ZoomIn:=ZoomOut;
   ZoomPicture(ZoomOut);
end;

procedure Tpic_Form.ToolButton2Click(Sender: TObject);
begin
   if not Assigned(image1.Picture) then exit;
   ZoomIn:=ZoomIn-0.1;
   if zoomin<0.0 then zoomin:=0.0;
   ZoomOut:=ZoomIn;
   ZoomPicture(ZoomIn);
end;

procedure Tpic_Form.ToolButton3Click(Sender: TObject);
begin
    ZoomOut:=1.0;
    ZoomIn:=1.0;
    Image2.Visible:=False;
    Image2.Picture.Assign(nil);
    image1.BringToFront;
    image1.Visible:=true;
end;

procedure Tpic_Form.Button1Click(Sender: TObject);
var
i,style:integer;
str,csql:string;
begin
if combobox1.ItemIndex=0 then
style:=0;
if combobox1.ItemIndex=1 then
style:=1;
if trim(edit1.Text)='' then
begin
 playwav('sound\error.wav');
 messagebox(handle,'请输入查询内容！','错误',MB_OK+MB_ICONERROR);
 exit;
end
else
begin
str:='%'+trim(edit1.Text)+'%';
  if style=0 then
  csql:='select * from photo where name like '''+str+'''';
  if style=1 then
  csql:='select * from photo where note like '''+str+'''';
with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add(csql);
   open;
  end;
  if ADOQuery1.RecordCount=0 then
  begin
   playwav('sound\error.wav');
   messagebox(handle,'没有找到任何符合条件的记录！','提示',MB_OK+MB_ICONWARNING);
 exit;
  end
  else
  begin
  TreeView2.SetFocus;
  TreeView2.Items.Clear;
  for i:=1 to ADOQuery1.RecordCount do
  begin
  TreeView2.Items.Add(node1,ADOQuery1.FieldValues['name']);
  ADOQuery1.Next;
  end;
  end;
end;
end;

procedure Tpic_Form.TreeView2Click(Sender: TObject);
var pic_name:string;
begin
if treeview2.Items.Count=0 then
exit;
if treeview2.Selected.Level=0 then
begin
image1.Visible:=true;
image2.Visible:=false;
str:=treeview2.Selected.Text;
with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from photo where name="'+str+'"');
 prepared;
 open;
end;
pic_name:=ADOQuery1.FieldValues['file'];
if fileexists(extractfilepath(application.ExeName)+'\photos\'+pic_name) then
Image1.Picture.LoadFromFile(extractfilepath(application.ExeName)+'\photos\'+pic_name);
Memo1.Text:=ADOQuery1.FieldValues['note'];
end;
end;

procedure Tpic_Form.TrackBar1Change(Sender: TObject);
var
pos,step:single;
begin
pos:=TrackBar1.Position/10;
step:=pos-1.0;
if not Assigned(Image1.Picture) Then exit
else
begin
   ZoomPicture(1.0+step);
end;

end;

end.
