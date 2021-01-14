unit manage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB,mmsystem;

type
  Tmanage_form = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label3: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  manage_form: Tmanage_form;

implementation
   uses main,user_add,pass;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tmanage_form.BitBtn3Click(Sender: TObject);
begin
add_user:=Tadd_user.Create(self);
add_user.ShowModal;
end;

procedure Tmanage_form.BitBtn4Click(Sender: TObject);
begin
if not ADOQuery1.Eof then
begin
playwav('sound\info.wav');
if messagebox(handle,'你确定要删除此用户吗？','提醒',MB_YESNO+MB_ICONQUESTION)=ID_YES then
ADOQuery1.Delete;
end
else
BitBtn4.Enabled:=false;
end;

procedure Tmanage_form.BitBtn1Click(Sender: TObject);
begin
if  manage_form.ADOQuery1.Eof then exit;
repass:=Trepass.Create(self);
repass.ShowModal;
end;

end.
