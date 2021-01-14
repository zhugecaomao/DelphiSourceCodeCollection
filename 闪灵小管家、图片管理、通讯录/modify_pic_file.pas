unit modify_pic_file;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Buttons,mmsystem;

type
  Tmodify_pic = class(TForm)
    Bevel1: TBevel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modify_pic: Tmodify_pic;
  lel:integer;
  oldname:string;
implementation
  uses main,pic;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tmodify_pic.FormCreate(Sender: TObject);
var str1,str2:string;
begin
oldname:=pic_form.TreeView1.Selected.Text;
if pic_form.TreeView1.Selected.Level=0 then
begin
 lel:=0;
 RadioGroup1.ItemIndex:=0;
 label2.Caption:='你正在修改的照片目录是：'+pic_form.TreeView1.Selected.Text;
end
else if pic_form.TreeView1.Selected.Level=1 then
begin
 lel:=1;
 RadioGroup1.ItemIndex:=1;
 label2.Caption:='你正在修改的照片文件是：'+pic_form.TreeView1.Selected.Text;
end;
if length(label2.Caption)>14 then
begin
 str1:=copy(label2.Caption,1,30);
 str2:=copy(label2.Caption,29,60);
 label2.Caption:=str1+#13#10+str2;
end;
end;

procedure Tmodify_pic.BitBtn1Click(Sender: TObject);
var newname:string;
begin
newname:=trim(edit1.Text);
if newname='' then
begin
 playwav('sound\error.wav');
 messagebox(handle,'新名称不能为空！','错误',MB_OK+MB_ICONERROR);
 exit;
end;
if lel=0 then
begin
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from photo_cateloge where dir="'+newname+'"');
  prepared;
  open;
end;
if  ADOQuery1.RecordCount<>0 then
begin
playwav('sound\error.wav');
messagebox(handle,'此目录已经存在，请选择其它名称！' ,'错误',MB_OK+MB_ICONERROR);
exit;
end
else
begin
 with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from  photo_cateloge where dir="'+oldname+'"');
  prepared;
  open;
  edit;
  FieldValues['dir']:=newname;
  post;
end;
  with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('update photo set dir="'+newname+'" where dir="'+oldname+'"');
  prepared;
  Execsql;
end;
pic_form.Button2click(self);
edit1.Text:='';
playwav('sound\sucess.wav');
messagebox(handle,'目录修改成功！' ,'提示',MB_OK+MB_ICONINFORMATION);
close;
end;
end
else
if lel=1 then
begin
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('update photo set name="'+newname+'" where name="'+oldname+'"');
  prepared;
  Execsql;
end;
pic_form.Button2click(self);
edit1.Text:='';
playwav('sound\sucess.wav');
messagebox(handle,'照片名称修改成功！' ,'提示',MB_OK+MB_ICONINFORMATION);
close;
end;
end;

end.
