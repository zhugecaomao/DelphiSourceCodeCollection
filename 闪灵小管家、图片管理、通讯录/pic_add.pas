unit pic_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtDlgs, ExtCtrls, StdCtrls, Buttons,mmsystem;

type
  Tadd_pic = class(TForm)
    ADOQuery1: TADOQuery;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox1: TGroupBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Bevel1: TBevel;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  add_pic: Tadd_pic;
    s,m:string;
    i,n:integer;

implementation
  uses main,pic;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tadd_pic.FormCreate(Sender: TObject);
var i:integer;
begin
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from photo_cateloge');
    prepared;
    open;
  end;
  if not ADOQuery1.Eof then
  for i:=1 to ADOQuery1.RecordCount do
  begin
    ComboBox1.Items.Add(ADOQuery1.FieldValues['dir']);
    ADOQuery1.Next;
  end;

  //*系统存储文件自动编号
    s:='PH'+formatDateTime('yyyymmdd',date);
    with ADOQuery2 do
    begin
    close;
    sql.Clear;
    sql.Add('select max(file) as filename from photo');
    prepared;
    open;
    end;

  if ADOQuery2.FieldValues['filename']=null then
     s:=s+'0001'
     else
     begin
     m:=trim(ADOQuery2.FieldValues['filename']);
     i:=strtoint(trim(copy(m,11,4)));
     if i<10 then
     s:=s+'000'+inttostr(i+1)
     else
     if i<100 then
     s:=s+'00'+inttostr(i+1)
     else
     if i<1000 then
     s:=s+'0'+inttostr(i+1)
     else
     s:=s+inttostr(i+1);
     end;
     //*自动文件编号结束。

end;

procedure Tadd_pic.SpeedButton1Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
 edit2.Text:=OpenPictureDialog1.FileName;
 image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure Tadd_pic.BitBtn1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
playwav('sound\error.wav');
Messagebox(handle,'请填写照片名称！' ,'错误',MB_OK+MB_ICONERROR);
exit;
end;
if trim(combobox1.Text)='' then
begin
playwav('sound\error.wav');
Messagebox(handle,'请选择照片目录！' ,'错误',MB_OK+MB_ICONERROR);
exit;
end;
if trim(edit2.Text)='' then
begin
playwav('sound\error.wav');
Messagebox(handle,'请选择照片！' ,'错误',MB_OK+MB_ICONERROR);
exit;
end;

with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from photo');
    prepared;
    open;
    append;
    edit;
    FieldValues['name']:=trim(edit1.Text);
    FieldValues['file']:=s+ExtractFileExt(OpenPictureDialog1.FileName);
    FieldValues['dir']:=trim(combobox1.Text);
    FieldValues['note']:=trim(memo1.Text)+'----照片加入日期： '+formatdatetime('yyyy年mm月dd日',date());
    post;
  end;
  copyfile(Pchar(edit2.Text),Pchar(ExtractFilePath(Application.ExeName)+'\photos\'+s+ExtractFileExt(OpenPictureDialog1.FileName)),true);
   pic_form.Button2click(self);
   playwav('sound\sucess.wav');
 if  Messagebox(handle,'照片添加成功！'+#13#10+'是否继续添加？' ,'提示',MB_YESNO+MB_ICONQUESTION)=ID_YES then
 begin
   edit1.Text:='';
   edit2.Text:='';
   combobox1.Text:='';
   memo1.Text:='';
 end
 else
 close;

end;

end.
