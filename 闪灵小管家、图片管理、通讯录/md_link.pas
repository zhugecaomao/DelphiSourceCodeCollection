unit md_link;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB,mmsystem, ComCtrls;

type
  Tadd_link = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    add:boolean;
  end;

var
  add_link: Tadd_link;


implementation
  uses main,link;
{$R *.dfm}
{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tadd_link.BitBtn1Click(Sender: TObject);
var
edit:array[0..9] of Tedit;
i:integer;
begin
edit[0]:=edit1;
edit[1]:=edit2;
edit[2]:=edit3;
edit[3]:=edit4;
edit[4]:=edit5;
edit[5]:=edit6;
edit[6]:=edit7;
edit[7]:=edit8;
edit[8]:=edit9;
edit[9]:=edit10;
if trim(edit1.Text)='' then
begin
playwav('sound\error.wav');
MessageBox(handle,'姓名不能为空！','错误',MB_OK+MB_ICONERROR);
exit;
end;
if add=true then
begin
//检测用户是否已经存在
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from link where name="'+trim(edit1.Text)+'"');
prepared;
open;
end;
if ADOQuery1.RecordCount<>0 then
begin
playwav('sound\error.wav');
MessageBox(handle,'此人通讯录已经存在！','提示',MB_OK+MB_ICONINFORMATION);
exit;
end;
end;

for i:=0 to 9 do
begin
if edit[i].Text='' then
edit[i].Text:='-';
end;
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from link');
prepared;
open;
if add=true then
append;
edit;
ADOQuery1.FieldValues['name']:=trim(edit1.Text);
ADOQuery1.FieldValues['birth']:=formatdatetime('yyyy-mm-dd',DateTimePicker1.Date);
ADOQuery1.FieldValues['mobil']:=trim(edit2.Text);
ADOQuery1.FieldValues['fmtel']:=trim(edit5.Text);
ADOQuery1.FieldValues['oftel']:=trim(edit3.Text);
ADOQuery1.FieldValues['fax']:=trim(edit6.Text);
ADOQuery1.FieldValues['company']:=trim(edit4.Text);
ADOQuery1.FieldValues['postnum']:=trim(edit7.Text);
ADOQuery1.FieldValues['web']:=trim(edit8.Text);
ADOQuery1.FieldValues['email']:=trim(edit9.Text);
ADOQuery1.FieldValues['address']:=trim(edit10.Text);
post;
end;
for i:=0 to 9 do
begin
edit[i].Text:='';
end;
edit8.Text:='http://';
link_form.showdataclick(self);
if add<>true then
begin
playwav('sound\sucess.wav');
MessageBox(handle,'通讯录名片更新成功！','提示',MB_OK+MB_ICONINFORMATION);
close;
end
else
begin
playwav('sound\sucess.wav');
if  MessageBox(handle,'新通讯录名片添加成功！'+#13#10+'是否继续添加？','提示',MB_YESNO+MB_ICONQUESTION)=ID_NO then
close;
end;
end;
procedure Tadd_link.FormCreate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
end;

end.
