unit UColor;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  RzButton, ExtCtrls, StdCtrls;

type
  TFrmColor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    ComBoxColor: TComboBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    ColorBox1: TColorBox;
    RzBtnOK: TRzButton;
    ComBoxLogon: TComboBox;
    RzBtnCancel: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit11MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Edit11Change(Sender: TObject);
    procedure Edit11DblClick(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComBoxColorChange(Sender: TObject);
    procedure ComBoxLogonChange(Sender: TObject);
    procedure RzBtnOKClick(Sender: TObject);
    procedure RzBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmColor: TFrmColor;

implementation

uses Registry, UMainFunc;

var
  reg1,reg2,reg3: TRegistry;
  os:string;
  
{$R *.dfm}

procedure TFrmColor.FormCreate(Sender: TObject);
begin
  Reg1:=TRegistry.Create; Reg1.RootKey:=HKEY_LOCAL_MACHINE;
  Reg2:=TRegistry.Create; Reg2.RootKey:=HKEY_CURRENT_USER;
  Reg3:=TRegistry.Create; Reg3.RootKey:=HKEY_USERS;

  if reg2.OpenKey('\Control Panel\Colors',false) then
  begin
    Edit11.Text:=reg2.ReadString('Menu');
    Edit12.Text:=reg2.ReadString('MenuHilight');
    Edit13.Text:=reg2.ReadString('HilightText');
    Edit14.Text:=reg2.ReadString('Hilight');
    Edit11.Color:=StrToColor(Edit11.Text); Edit11.Font.Color:=StrToColor2(Edit11.Text);
    Edit12.Color:=StrToColor(Edit12.Text); Edit12.Font.Color:=StrToColor2(Edit12.Text);
    Edit13.Color:=StrToColor(Edit13.Text); Edit13.Font.Color:=StrToColor2(Edit13.Text);
    Edit14.Color:=StrToColor(Edit14.Text); Edit14.Font.Color:=StrToColor2(Edit14.Text);
  end;

  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion',false) then os:=reg1.ReadString('ProductName');
  if ( os='Microsoft Windows 2000' ) and ( reg3.OpenKey('\.DEFAULT\Control Panel\Colors',false) ) then
    begin
      Edit15.Text:=reg3.ReadString('Background');
      Edit15.Color:=StrToColor(Edit15.Text);
      Edit15.Font.Color:=StrToColor2(Edit15.Text);
    end
  else
  if ( os='Microsoft Windows XP' ) and ( reg1.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',false) ) then
    begin
      Edit15.Text:=reg1.ReadString('Background');
      Edit15.Color:=StrToColor(Edit15.Text);
      Edit15.Font.Color:=StrToColor2(Edit15.Text);
    end;

  with ColorBox1 do
  begin
    Items[0] := '自定义...';Items[1] := '黑色';  Items[2] := '深红色';
    Items[3] := '绿色';     Items[4] := '橄榄色';Items[5] := '藏青色';
    Items[6] := '紫色';     Items[7] := '绿蓝';  Items[8] := '灰色';
    Items[9] := '银色';     Items[10] := '红色'; Items[11] := '浅绿色';
    Items[12] := '黄色';    Items[13] := '蓝色'; Items[14] := '紫红色';
    Items[15] := '浅蓝色';  Items[16] := '白色'; Items[17] := '鸭蛋绿';
    Items[18] := '天蓝色';  Items[19] := '米色'; Items[20] := '次灰色';
  end;
  ColorBox1.Selected:=Edit11.Color;
end;

procedure TFrmColor.FormShow(Sender: TObject);
begin
  ComBoxColor.ItemIndex:=0;
  ComBoxLogon.ItemIndex:=0;
end;

procedure TFrmColor.FormDestroy(Sender: TObject);
begin
  Reg1.CloseKey; Reg1.Free;
  Reg2.CloseKey; Reg2.Free;
  Reg3.CloseKey; Reg3.Free;
end;

procedure TFrmColor.Edit11MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin //动态地改变ColorBox1的位置和颜色
  case TEdit(Sender).TabOrder of
  3: begin ColorBox1.Top:=60;  ColorBox1.Selected:=Edit11.Color; end;
  4: begin ColorBox1.Top:=90;  ColorBox1.Selected:=Edit12.Color; end;
  5: begin ColorBox1.Top:=120; ColorBox1.Selected:=Edit13.Color; end;
  6: begin ColorBox1.Top:=150; ColorBox1.Selected:=Edit14.Color; end;
  7: begin ColorBox1.Top:=264; ColorBox1.Selected:=Edit15.Color; end;
  end;
end;

procedure TFrmColor.Edit11Change(Sender: TObject);
begin //编辑框的值改变时改变它的颜色和字体
  TEdit(sender).Color:=StrToColor(TEdit(sender).Text);
  TEdit(sender).Font.Color:=StrToColor2(TEdit(sender).Text);
end;

procedure TFrmColor.Edit11DblClick(Sender: TObject);
begin //双击编辑框时自动将内容拷入剪贴板
  TEdit(sender).SelectAll;
  TEdit(sender).CopyToClipboard
end;

procedure TFrmColor.ColorBox1Change(Sender: TObject);
begin
  RzBtnOK.Enabled:=true;
  case ColorBox1.Top of
  60:
    begin
      Edit11.Color:=ColorBox1.Selected;
      Edit11.Text:=ColorToRGB(ColorBox1.Selected);
      Edit11.Font.Color:=StrToColor2(Edit11.Text);
      ComboxColor.ItemIndex:=-1;
    end;
  90:
    begin
      Edit12.Color:=ColorBox1.Selected;
      Edit12.Text:=ColorToRGB(ColorBox1.Selected);
      Edit12.Font.Color:=StrToColor2(Edit12.Text);
      ComboxColor.ItemIndex:=-1;
    end;
  120:
    begin
      Edit13.Color:=ColorBox1.Selected;
      Edit13.Text:=ColorToRGB(ColorBox1.Selected);
      Edit13.Font.Color:=StrToColor2(Edit13.Text);
      ComboxColor.ItemIndex:=-1;
    end;
  150:
    begin
      Edit14.Color:=ColorBox1.Selected;
      Edit14.Text:=ColorToRGB(ColorBox1.Selected);
      Edit14.Font.Color:=StrToColor2(Edit14.Text);
      ComboxColor.ItemIndex:=-1;
    end;
  264:
    begin
      Edit15.Color:=ColorBox1.Selected;
      Edit15.Text:=ColorToRGB(ColorBox1.Selected);
      Edit15.Font.Color:=StrToColor2(Edit15.Text);
      ComboxLogon.ItemIndex:=-1;
    end;
  end;
end;

procedure TFrmColor.ComBoxColorChange(Sender: TObject);
begin //菜单色
  ColorBox1.ItemIndex:=-1;
  case ComBoxColor.ItemIndex of
  0:  //当前颜色
    if reg2.OpenKey('\Control Panel\Colors',false) then
    begin
      Edit11.Text:=reg2.ReadString('Menu');
      Edit13.Text:=reg2.ReadString('HilightText');Edit14.Text:=reg2.ReadString('Hilight');
      //if Edit12.Enabled=true then Edit12.Text:=reg2.ReadString('MenuHilight');
      Edit12.Text:=reg2.ReadString('MenuHilight');
      if ComBoxLogon.ItemIndex=0
      then RzBtnOK.Enabled:=false
      else RzBtnOK.Enabled:=true;
    end;
  1:  //默认颜色(2000)
    begin
      Edit11.Text:='212 208 200';
      Edit13.Text:='255 255 255'; Edit14.Text:='10 36 106';
      //if Edit12.Enabled=true then Edit12.Text:='';
      Edit12.Text:='';
      RzBtnOK.Enabled:=true;
    end;
  2:  //2000 推荐
    begin
      Edit11.Text:='239 235 214';
      Edit13.Text:='216 252 216'; Edit14.Text:='80 140 216';
      //if Edit12.Enabled=true then Edit12.Text:='';
      Edit12.Text:='';
      RzBtnOK.Enabled:=true;
    end;
  3:  //默认颜色(XP)
    begin
      Edit11.Text:='255 255 255';
      Edit13.Text:='255 255 255'; Edit14.Text:='49 106 197';
      //if Edit12.Enabled=true then Edit12.Text:='49 106 197';
      Edit12.Text:='49 106 197';
      RzBtnOK.Enabled:=true;
    end;
  4:  //Office 01
    begin
      Edit11.Text:='247 243 222';
      Edit13.Text:='0 0 0';       Edit14.Text:='133 193 255';
      //if Edit12.Enabled=true then Edit12.Text:='227 235 244';
      Edit12.Text:='227 235 244';
      RzBtnOK.Enabled:=true;
    end;
  5:  //Office 02
    begin
      Edit11.Text:='247 243 222';
      Edit13.Text:='0 0 0';       Edit14.Text:='133 193 255';
      //if Edit12.Enabled=true then Edit12.Text:='255 255 255';
      Edit12.Text:='255 255 255';
      RzBtnOK.Enabled:=true;
    end;
  6:  //FlatXP
    begin
      Edit11.Text:='231 227 231';
      Edit13.Text:='0 0 0';       Edit14.Text:='255 154 0';
      //if Edit12.Enabled=true then Edit12.Text:='255 207 0';
      Edit12.Text:='255 207 0';
      RzBtnOK.Enabled:=true;
    end;  
  7:  //Korilla
    begin
      Edit11.Text:='255 251 247';
      Edit13.Text:='0 0 0';       Edit14.Text:='82 170 255';
      //if Edit12.Enabled=true then Edit12.Text:='214 211 231';
      Edit12.Text:='214 211 231';
      RzBtnOK.Enabled:=true;
    end;
  8:  //蓝天草地
    begin
      Edit11.Text:='239 235 214';
      Edit13.Text:='216 252 216'; Edit14.Text:='60 120 184';
      //if Edit12.Enabled=true then Edit12.Text:='131 191 255';
      Edit12.Text:='131 191 255';
      RzBtnOK.Enabled:=true;
    end;
  9:  //雅虎通
    begin
      Edit11.Text:='239 243 231';
      Edit13.Text:='255 255 255'; Edit14.Text:='110 110 110';
      //if Edit12.Enabled=true then Edit12.Text:='181 181 181';
      Edit12.Text:='181 181 181';
      RzBtnOK.Enabled:=true;
    end;
  10:  //Win2003
    begin
      Edit11.Text:='212 208 200';
      Edit13.Text:='255 255 255'; Edit14.Text:='10 36 106';
      //if Edit12.Enabled=true then Edit12.Text:='210 210 255';
      Edit12.Text:='210 210 255';
      RzBtnOK.Enabled:=true;
    end;
  11:  //Longhorn
    begin
      Edit11.Text:='247 243 222';
      Edit13.Text:='0 0 0';       Edit14.Text:='146 180 195';
      //if Edit12.Enabled=true then Edit12.Text:='197 231 246';
      Edit12.Text:='197 231 246';
      RzBtnOK.Enabled:=true;
    end;
  end; //endcase
  case ColorBox1.Top of
  60:  ColorBox1.Selected:=Edit11.Color;
  90:  ColorBox1.Selected:=Edit12.Color;
  120: ColorBox1.Selected:=Edit13.Color;
  150: ColorBox1.Selected:=Edit14.Color;
  264: ColorBox1.Selected:=Edit15.Color;
  end;

end;

procedure TFrmColor.ComBoxLogonChange(Sender: TObject);
begin   //Windows 登陆时的背景色
  case ComBoxLogon.ItemIndex of
  0:   //当前颜色
  //begin
    if ( os='Microsoft Windows 2000' ) and ( reg3.OpenKey('\.DEFAULT\Control Panel\Colors',false) ) then
      begin
        Edit15.Text:=reg3.ReadString('Background');
        if ComBoxColor.ItemIndex=0
        then RzBtnOK.Enabled:=false
        else RzBtnOK.Enabled:=true;
      end
    else
    if ( os='Microsoft Windows XP' ) and ( reg1.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',false) ) then
      begin
        Edit15.Text:=reg1.ReadString('Background');
        if ComBoxColor.ItemIndex=0
        then RzBtnOK.Enabled:=false
        else RzBtnOK.Enabled:=true;
      end;
  //end;
  1:    //2000默认
    begin
      Edit15.Text:='58 110 165';
      RzBtnOK.Enabled:=true;
    end;
  2:    //XP默认
    begin
      Edit15.Text:='0 78 152';
      RzBtnOK.Enabled:=true;
    end;
  3:    //绿色
    begin
      Edit15.Text:='0 128 0';
      RzBtnOK.Enabled:=true;
    end;
  4:    //粉红色
    begin
      Edit15.Text:='250 156 210';
      RzBtnOK.Enabled:=true;
    end;
  end; //endcase
  case ColorBox1.Top of
  60:  ColorBox1.Selected:=Edit11.Color;
  90:  ColorBox1.Selected:=Edit12.Color;
  120: ColorBox1.Selected:=Edit13.Color;
  150: ColorBox1.Selected:=Edit14.Color;
  264: ColorBox1.Selected:=Edit15.Color;
  end;
end;

procedure TFrmColor.RzBtnOKClick(Sender: TObject);
begin //确认
  try
    if reg2.OpenKey('\Control Panel\Colors',false) then
    begin
      reg2.WriteString('Menu',Edit11.Text);
      reg2.WriteString('HilightText',Edit13.Text);reg2.WriteString('Hilight',Edit14.Text);
      //if Edit12.Enabled=true then reg2.WriteString('MenuHilight',Edit12.Text);
      reg2.WriteString('MenuHilight',Edit12.Text);
      //reg2.writestring('Window','255 255 255'); //窗口为白色
     RzBtnOK.Enabled:=false;
    end;

    if ( os='Microsoft Windows 2000' ) and ( reg3.OpenKey('\.DEFAULT\Control Panel\Colors',true) )
      then reg3.WriteString('Background',Edit15.Text)
    else
    if ( os='Microsoft Windows XP' ) and ( reg1.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',true) )
      then reg1.WriteString('Background',Edit15.Text);

  except //处理异常
    Reg1.CloseKey; Reg1.Free;
    Reg2.CloseKey; Reg2.Free;
    Reg3.CloseKey; Reg3.Free;
  end;
end;

procedure TFrmColor.RzBtnCancelClick(Sender: TObject);
begin //关闭
  close
end;

end.
