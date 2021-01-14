unit edit_photo_note;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB,mmsystem;

type
  Tphoto_note_edit = class(TForm)
    Memo1: TMemo;
    Bevel1: TBevel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  photo_note_edit: Tphoto_note_edit;
  str_old:string;

implementation
   uses main,pic;
{$R *.dfm}
{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tphoto_note_edit.FormCreate(Sender: TObject);
begin
memo1.Text:=pic_form.Memo1.Text;
str_old:=memo1.Text;
end;

procedure Tphoto_note_edit.BitBtn1Click(Sender: TObject);
var str:string;
begin
if memo1.Text='' then
 str:='-'
 else
 str:=memo1.Text;
 with ADOQuery1 do
 begin
   close;
   sql.Clear;
   sql.Add('select * from photo where note=:a');
   Parameters[0].Value:=str_old;
   prepared;
   open;
   edit;
   FieldValues['note']:=str;
   post;
 end;
 playwav('sound\sucess.wav');
 messagebox(handle,'照片注释更新成功!','提示',MB_OK+MB_ICONINFORMATION);
 pic_form.Button2click(self);
 close;
end;

end.
