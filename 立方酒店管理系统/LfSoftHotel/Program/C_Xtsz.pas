unit C_Xtsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, IniFiles,
  C_Define, Mask;

type
  TXtszForm = class(TStdJdForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    edtBgmc: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    ColorBox4: TColorBox;
    Label6: TLabel;
    Label7: TLabel;
    ColorBox5: TColorBox;
    ColorBox6: TColorBox;
    Label13: TLabel;
    edtJf: TEdit;
    Label15: TLabel;
    cmbPortNum: TComboBox;
    CheckBox2: TCheckBox;
    edtSdir: TLabeledEdit;
    edtDdir: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    CheckBox3: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    ColorBox7: TColorBox;
    ColorBox8: TColorBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    ColorBox9: TColorBox;
    Label10: TLabel;
    Label11: TLabel;
    ColorBox10: TColorBox;
    Label12: TLabel;
    ColorBox11: TColorBox;
    Label14: TLabel;
    ColorBox12: TColorBox;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ColorBox13: TColorBox;
    ColorBox14: TColorBox;
    ColorBox15: TColorBox;
    ColorBox16: TColorBox;
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure ShowIni;
    procedure ExcuteIni;
  public
    { Public declarations }
  end;

var
  XtszForm: TXtszForm;
procedure Xtsz;

implementation

uses C_SelectDir;

{$R *.dfm}

procedure Xtsz;
begin
  XtszForm := TXtszForm.Create(Application);
  try
    with XtszForm do
    begin
      ReadIniFile;
      ShowIni;
      ShowModal;
    end;
  finally
    XtszForm.Free;
  end;
end;

procedure TXtszForm.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  IS_SHOWIMAGE := IniFile.ReadBool('BOOLEAN','SHOWIMAGE',False);
  IS_SHOWDDTS  := IniFile.ReadBool('BOOLEAN','SHOWDDTS',False);
  HOTEL_NAME   := IniFile.ReadString('HOTEL','HOTELNAME','常州立方软件公司');
  COLOR_OK := IniFile.ReadInteger('COLOR','COLOROK',cl3DLight);
  COLOR_BF := IniFile.ReadInteger('COLOR','COLORBF',clMoneyGreen);
  COLOR_TD := IniFile.ReadInteger('COLOR','COLORTD',clSkyBlue);
  COLOR_MF := IniFile.ReadInteger('COLOR','COLORMF',clYellow);
  COLOR_WX := IniFile.ReadInteger('COLOR','COLORWX',clRed);
  COLOR_ZK := IniFile.ReadInteger('COLOR','COLORZK',clGray);
  COLOR_ZT := IniFile.ReadInteger('COLOR','COLORZT',clWhite);
  COLOR_BJ := IniFile.ReadInteger('COLOR','COLORBJ',clFuchsia);

  COLOR_CYBJ := IniFile.ReadInteger('COLOR','COLORCYBJ',clFuchsia);
  COLOR_CYZT := IniFile.ReadInteger('COLOR','COLORCYZT',clBlack);
  COLOR_CYYD := IniFile.ReadInteger('COLOR','COLORCYYD',clYellow);
  COLOR_CYQR := IniFile.ReadInteger('COLOR','COLORCYQR',clRed);

  COLOR_HCBJ := IniFile.ReadInteger('COLOR','COLORHCBJ',clFuchsia);
  COLOR_HCZT := IniFile.ReadInteger('COLOR','COLORHCZT',clBlack);
  COLOR_HCYD := IniFile.ReadInteger('COLOR','COLORHCYD',clYellow);
  COLOR_HCQR := IniFile.ReadInteger('COLOR','COLORHCQR',clRed);

  JF_DIR   := IniFile.ReadString('HOTEL','JF_DIR','');
  PORTNUM  := IniFile.ReadInteger('PORT','ICPORTNUM',0);
  IS_YJSH  := IniFile.ReadBool('BOOLEAN','YJSH',False);
  DBF_DIR  := IniFile.ReadString('HOTEL','DBF_DIR',APP_DIR+'Database');
  BAK_DIR  := IniFile.ReadString('HOTEL','BAK_DIR','');
  IS_EMPTYDHF := IniFile.ReadBool('BOOLEAN','DHF',False);
  IniFile.Free;
end;

procedure TXtszForm.ShowIni;
begin
  CheckBox1.Checked := IS_SHOWIMAGE;
  edtBgmc.Text := HOTEL_NAME;
  ColorBox1.Selected := COLOR_OK;
  ColorBox2.Selected := COLOR_BF;
  ColorBox3.Selected := COLOR_TD;
  ColorBox4.Selected := COLOR_MF;
  ColorBox5.Selected := COLOR_WX;
  ColorBox6.Selected := COLOR_ZK;
  ColorBox7.Selected := COLOR_ZT;
  ColorBox8.Selected := COLOR_BJ;

  ColorBox9.Selected  := COLOR_CYBJ;
  ColorBox10.Selected := COLOR_CYZT;
  ColorBox11.Selected := COLOR_CYYD;
  ColorBox12.Selected := COLOR_CYQR;

  ColorBox13.Selected := COLOR_HCBJ;
  ColorBox14.Selected := COLOR_HCZT;
  ColorBox15.Selected := COLOR_HCYD;
  ColorBox16.Selected := COLOR_HCQR;

  cmbPortNum.ItemIndex := PORTNUM;
  edtJf.Text := JF_DIR;
  CheckBox2.Checked := IS_YJSH;
  edtSdir.Text      := DBF_DIR;
  edtDdir.Text      := BAK_DIR;
  CheckBox3.Checked := IS_EMPTYDHF;
  CheckBox4.Checked := IS_SHOWDDTS;
end;

procedure TXtszForm.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  IniFile.WriteBool('BOOLEAN','SHOWIMAGE',IS_SHOWIMAGE);
  IniFile.WriteBool('BOOLEAN','SHOWDDTS',IS_SHOWDDTS);
  IniFile.WriteString('HOTEL','HOTELNAME',HOTEL_NAME);
  IniFile.WriteInteger('COLOR','COLOROK',COLOR_OK);
  IniFile.WriteInteger('COLOR','COLORBF',COLOR_BF);
  IniFile.WriteInteger('COLOR','COLORTD',COLOR_TD);
  IniFile.WriteInteger('COLOR','COLORMF',COLOR_MF);
  IniFile.WriteInteger('COLOR','COLORWX',COLOR_WX);
  IniFile.WriteInteger('COLOR','COLORZK',COLOR_ZK);
  IniFile.WriteInteger('COLOR','COLORZT',COLOR_ZT);
  IniFile.WriteInteger('COLOR','COLORBJ',COLOR_BJ);

  IniFile.WriteInteger('COLOR','COLORCYBJ',COLOR_CYBJ);
  IniFile.WriteInteger('COLOR','COLORCYZT',COLOR_CYZT);
  IniFile.WriteInteger('COLOR','COLORCYYD',COLOR_CYYD);
  IniFile.WriteInteger('COLOR','COLORCYQR',COLOR_CYQR);

  IniFile.WriteInteger('COLOR','COLORHCBJ',COLOR_HCBJ);
  IniFile.WriteInteger('COLOR','COLORHCZT',COLOR_HCZT);
  IniFile.WriteInteger('COLOR','COLORHCYD',COLOR_HCYD);
  IniFile.WriteInteger('COLOR','COLORHCQR',COLOR_HCQR);

  IniFile.WriteString('HOTEL','JF_DIR',JF_DIR);
  IniFile.WriteInteger('PORT','ICPORTNUM',PORTNUM);
  IniFile.WriteBool('BOOLEAN','YJSH',IS_YJSH);
  IniFile.WriteString('HOTEL','DBF_DIR',DBF_DIR);
  IniFile.WriteString('HOTEL','BAK_DIR',BAK_DIR);
  IniFile.WriteBool('BOOLEAN','DHF',IS_EMPTYDHF);
  IniFile.Free;
end;

procedure TXtszForm.ExcuteIni;
begin
  IS_SHOWIMAGE := CheckBox1.Checked;
  HOTEL_NAME   := edtBgmc.Text;
  COLOR_OK := ColorBox1.Selected;
  COLOR_BF := ColorBox2.Selected;
  COLOR_TD := ColorBox3.Selected;
  COLOR_MF := ColorBox4.Selected;
  COLOR_WX := ColorBox5.Selected;
  COLOR_ZK := ColorBox6.Selected;
  COLOR_ZT := ColorBox7.Selected;
  COLOR_BJ := ColorBox8.Selected;

  COLOR_CYBJ := ColorBox9.Selected;
  COLOR_CYZT := ColorBox10.Selected;
  COLOR_CYYD := ColorBox11.Selected;
  COLOR_CYQR := ColorBox12.Selected;

  COLOR_HCBJ := ColorBox13.Selected;
  COLOR_HCZT := ColorBox14.Selected;
  COLOR_HCYD := ColorBox15.Selected;
  COLOR_HCQR := ColorBox16.Selected;

  PORTNUM  := cmbPortNum.ItemIndex;
  JF_DIR   := edtJf.Text;
  IS_YJSH  := CheckBox2.Checked;
  DBF_DIR  := edtSdir.Text;
  BAK_DIR  := edtDdir.Text;
  IS_EMPTYDHF := CheckBox3.Checked;
  IS_SHOWDDTS := CheckBox4.Checked;
end;

procedure TXtszForm.btnOKClick(Sender: TObject);
begin
  inherited;
  ExcuteIni;
  WriteIniFile;
  Close;
end;

procedure TXtszForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    edtJf.Text := SelectDir;
end;

procedure TXtszForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    edtSDir.Text := SelectDir;
end;

procedure TXtszForm.SpeedButton3Click(Sender: TObject);
begin
  inherited;
    edtDDir.Text := SelectDir;
end;

end.
