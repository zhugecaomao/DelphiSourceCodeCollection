unit Fconfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,cxSSTypes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,inifiles;

type
  Tconfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    XM: TEdit;
    Label2: TLabel;
    XB: TEdit;
    Label3: TLabel;
    YWM: TEdit;
    Label4: TLabel;
    HF: TEdit;
    Label5: TLabel;
    SR: TEdit;
    Label6: TLabel;
    JG: TEdit;
    Label7: TLabel;
    MZ: TEdit;
    Label8: TLabel;
    ZJ: TEdit;
    Label9: TLabel;
    HK: TEdit;
    Label10: TLabel;
    XL: TEdit;
    Label11: TLabel;
    BY: TEdit;
    Label12: TLabel;
    WY: TEdit;
    Label13: TLabel;
    CD: TEdit;
    Label14: TLabel;
    JR: TEdit;
    Label15: TLabel;
    JD: TEdit;
    Label16: TLabel;
    DH: TEdit;
    Label17: TLabel;
    DY: TEdit;
    Label18: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox4: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure XMKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  config: Tconfig;

implementation

uses fmain;

{$R *.dfm}

procedure Tconfig.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tconfig.XMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['a'..'z','A'..'Z','0'..'9'] ) then
    begin
      key:=#0;     // 强制输入的字符类型
      beep;
    end;
end;

procedure Tconfig.Button2Click(Sender: TObject);
var inini:tinifile;
begin
  IF (trim(self.XM.Text)='') or (trim(self.XB.Text)='') or (trim(self.YWM.Text)='') or
      (trim(self.HF.Text)='') or (trim(self.SR.Text)='') or (trim(self.JG.Text)='') or
      (trim(self.MZ.Text)='') or (trim(self.ZJ.Text)='') or (trim(self.HK.Text)='') or
      (trim(self.XL.Text)='') or (trim(self.BY.Text)='') or (trim(self.WY.Text)='') or
      (trim(self.CD.Text)='') or (trim(self.DH.Text)='') or (trim(self.JD.Text)='') or
      (trim(self.JR.Text)='') or (trim(self.DY.Text)='') THEN
    BEGIN
      MessageBox(handle,'模版选项卡没有填写完整！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=2;
      self.XM.SetFocus;
      exit;    
    END;
  inIni:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  with inIni do
    begin
      WriteString('Stencil', 'XM', self.XM.Text);
      writestring('Stencil', 'XB', self.XB.Text);
      WriteString('Stencil', 'YWM', self.YWM.Text);
      writestring('Stencil', 'HF', self.HF.Text);
      WriteString('Stencil', 'SR', self.SR.Text);
      writestring('Stencil', 'JG', self.JG.Text);
      WriteString('Stencil', 'MZ', self.MZ.Text);
      writestring('Stencil', 'ZJ', self.ZJ.Text);
      WriteString('Stencil', 'HK', self.HK.Text);
      writestring('Stencil', 'XL', self.XL.Text);
      WriteString('Stencil', 'BY', self.BY.Text);
      writestring('Stencil', 'WY', self.WY.Text);
      WriteString('Stencil', 'CD', self.CD.Text);
      writestring('Stencil', 'DH', self.DH.Text);
      WriteString('Stencil', 'JD', self.JD.Text);
      writestring('Stencil', 'JR', self.JR.Text);
      WriteString('Stencil', 'DY', self.DY.Text);
      if checkbox1.Checked=true then      //工具栏
          WriteString('ToolBar', 'DataControl', '1')
        else
          WriteString('ToolBar', 'DataControl', '0');
      if checkbox2.Checked=true then
          WriteString('ToolBar', 'Sheet', '1')
        else
          WriteString('ToolBar', 'Sheet', '0');
      if RadioButton1.Checked=true then      //表格编辑
          WriteString('Sheet', 'Style', '1')
        else
          WriteString('Sheet', 'Style', '0');
      if checkbox3.Checked=true then      //系统退出
          WriteString('System', 'SaveOut', '1')
        else
          WriteString('System', 'SaveOut', '0');
      if checkbox4.Checked=true then
          WriteString('System', 'AutoMessage', '1')
        else
          WriteString('System', 'AutoMessage', '0');
    end;
  inini.Free;
  main.ReadConfiguration;
  if main.ReadDataControl='1' then
      main.ToolBar1.Visible:=true
    else
      main.ToolBar1.Visible:=false;
  if main.ReadSheet='1' then
      main.tbsFormatting.Visible:=true
    else
      main.tbsFormatting.Visible:=false;
  if main.ReadStyle='1' then
      main.cxSpreadSheetBook1.PainterType:=ptOffice97Style
    else
      main.cxSpreadSheetBook1.PainterType:=ptOfficeXPStyle;
  self.Close;
end;

procedure Tconfig.FormCreate(Sender: TObject);
begin
  main.ReadConfiguration;
  if main.ReadDataControl='1' then
      checkbox1.Checked:=true
    else
      checkbox1.Checked:=false;
  if main.ReadSheet='1' then
      checkbox2.Checked:=true
    else
      checkbox2.Checked:=false;
  if main.ReadStyle='1' then
      self.RadioButton1.Checked:=true
    else
      self.RadioButton2.Checked:=true;
  if main.ReadSaveOut='1' then
      checkbox3.Checked:=true
    else
      checkbox3.Checked:=false;
  if main.ReadAutoMessage='1' then
      checkbox4.Checked:=true
    else
      checkbox4.Checked:=false;
 self.XM.Text := main.ReadStencil[1];
 self.XB.Text:= main.ReadStencil[2];
 self.YWM.Text := main.ReadStencil[3];
   self.HF.Text:=main.ReadStencil[4];
   self.SR.Text:=main.ReadStencil[5];
 self.JG.Text := main.ReadStencil[6];
  self.MZ.Text :=main.ReadStencil[7];
  self.ZJ.Text:= main.ReadStencil[8];
  self.HK.Text:= main.ReadStencil[9];
  self.XL.Text:= main.ReadStencil[10];
  self.BY.Text:= main.ReadStencil[11];
  self.WY.Text:= main.ReadStencil[12];
  self.CD.Text:= main.ReadStencil[13];
  self.DH.Text:= main.ReadStencil[14];
  self.JD.Text:= main.ReadStencil[15];
  self.JR.Text:= main.ReadStencil[16];
  self.DY.Text:=main.ReadStencil[17] ;
end;

end.
