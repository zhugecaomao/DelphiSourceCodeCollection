unit config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,inifiles;

type
  Tconfig_form = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    CheckBox3: TCheckBox;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  config_form: Tconfig_form;
  config_ini:Tinifile;
  pic,tool,statebar:boolean;
  pic_name:string;
  pic_name_ico:string;

implementation
uses  main;
{$R *.dfm}

procedure Tconfig_form.FormShow(Sender: TObject);
begin
if checkbox1.Checked then
combobox1.Enabled:=true
else
combobox1.Enabled:=false;
end;

procedure Tconfig_form.FormCreate(Sender: TObject);
begin
config_ini:=Tinifile.Create(main_form.Exefilepath+'\config.ini');
pic:=config_ini.ReadBool('backGround_pic','背景图片',true);
tool:=config_ini.ReadBool('tool_bar','工具栏',true);
statebar:=config_ini.ReadBool('state_bar','状态栏',true);
pic_name:=config_ini.ReadString('picture_name','图片名称','');
if  pic=true then checkbox1.Checked:=true else checkbox1.Checked:=false;
if  tool=true then checkbox2.Checked:=true else checkbox2.Checked:=false;
if  statebar=true then checkbox3.Checked:=true else checkbox3.Checked:=false;
end;


procedure Tconfig_form.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked then combobox1.Enabled:=true else  combobox1.Enabled:=false;
end;

procedure Tconfig_form.BitBtn1Click(Sender: TObject);
begin
if checkbox1.Checked=true then
begin
if  pic_name<>'' then main_form.Image1.Picture.LoadFromFile(pic_name) else pic_name:='bmp\bg_xp.bmp';
main_form.Image1.Visible:=false;
main_form.Image1.Visible:=true;;
pic:=true;
end
else
begin
pic:=false;
main_form.Image1.Visible:=false;
end;
if checkbox2.Checked=true then
begin
tool:=true;
main_form.CoolBar1.Visible:=true;
end
else
begin
tool:=false;
main_form.CoolBar1.Visible:=false;
end;
if checkbox3.Checked=true then
begin
statebar:=true;
main_form.StatusBar.Visible:=true;
end
else
begin
statebar:=false;
main_form.StatusBar.Visible:=false;
end;

//*写入INI文件的系统配置-----------------------------------------------
config_ini.WriteBool('backGround_pic','背景图片',pic);
config_ini.WriteBool('tool_bar','工具栏',tool);
config_ini.WriteBool('state_bar','状态栏',statebar);
config_ini.WriteString('picture_name','图片名称',pic_name);
config_ini.Free;
config_form.Close;

end;

procedure Tconfig_form.ComboBox1Change(Sender: TObject);
begin
if combobox1.Text='默认背景' then
begin
pic_name_ico:='bmp\bg_xp_ico.bmp';
pic_name:='bmp\bg_xp.bmp';
end;
if combobox1.Text='自然魅力' then
begin
pic_name_ico:='bmp\bg_nature_ico.bmp';
pic_name:='bmp\bg_nature.bmp';
end;
if combobox1.Text='爱之旅程' then
begin
pic_name_ico:='bmp\bg_love_ico.bmp';
pic_name:='bmp\bg_love.bmp';
end;
if combobox1.Text='卡通动漫' then
begin
pic_name_ico:='bmp\bg_cartoon_ico.bmp';
pic_name:='bmp\bg_cartoon.bmp';
end;
if combobox1.Text='游戏先锋' then
begin
pic_name_ico:='bmp\bg_game_ico.bmp';
pic_name:='bmp\bg_game.bmp';
end;
image1.Picture.LoadFromFile(pic_name_ico);
end;

end.
