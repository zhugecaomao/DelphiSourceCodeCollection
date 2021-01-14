unit InputInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatGroupBoxUnit, ExtCtrls, TFlatPanelUnit,
  TFlatButtonUnit, TFlatTitlebarUnit, TFlatMemoUnit, TFlatEditUnit,
  TFlatComboBoxUnit, ComCtrls, DB, ADODB;

type
  TFrmInputInfo = class(TForm)
    InputInfoTitle: TFlatTitlebar;
    BtnExit: TFlatButton;
    Panel1: TFlatPanel;
    GBClientInfo: TFlatGroupBox;
    GBComputer: TFlatGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label16: TLabel;
    GBMemo: TFlatGroupBox;
    Memo: TFlatMemo;
    BtnPrint: TFlatButton;
    BtnPreview: TFlatButton;
    BtnAdd: TFlatButton;
    BtnExit1: TFlatButton;
    ECPU: TFlatEdit;
    EMouse: TFlatEdit;
    EMainBoard: TFlatEdit;
    EMemory: TFlatEdit;
    ESound: TFlatEdit;
    EHD: TFlatEdit;
    EDisPlayCard: TFlatEdit;
    ECDROM: TFlatEdit;
    EFloppy: TFlatEdit;
    EKeyBoard: TFlatEdit;
    EOther: TFlatEdit;
    EDisPlay: TFlatEdit;
    EBox: TFlatEdit;
    EPower: TFlatEdit;
    ESoundBox: TFlatEdit;
    EPrint: TFlatEdit;
    ENetWork: TFlatEdit;
    EModem: TFlatEdit;
    EUser: TFlatEdit;
    EMobile: TFlatEdit;
    EPhone: TFlatEdit;
    EFax: TFlatEdit;
    EAddr: TFlatEdit;
    EAmount: TFlatEdit;
    DateBuy: TDateTimePicker;
    DateBao: TDateTimePicker;
    CmbQuality: TFlatComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    BtnModify: TFlatButton;
    procedure BtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateBuyChange(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure EAmountKeyPress(Sender: TObject; var Key: Char);
    procedure EAmountChange(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }

    Procedure WriteInfo;
    procedure DBConnection;
    Procedure WriteToReport;    //写数据到报表
  public
    { Public declarations }
    Procedure Clear;
  end;

var
  FrmInputInfo: TFrmInputInfo;

implementation

uses main,global, Reg, report;

{$R *.dfm}

procedure TFrmInputInfo.BtnExitClick(Sender: TObject);
begin
close;
end;

procedure TFrmInputInfo.Clear;
begin
// 电脑配置
Ecpu.Clear; Emouse.Clear; EMainBoard.Clear; EDisPlay.Clear;
EMemory.Clear; EBox.Clear;  EHD.Clear;  EPower.Clear;
ESound.Clear;  ESoundBox.Clear;  EDisplayCard.Clear; EPrint.Clear;
ECDROM.Clear;  ENetwork.Clear;  EFloppy.Clear;  EModem.Clear;
EKeyBoard.Clear; EOther.Clear;  Memo.Clear;

// 客户信息
EUser.Clear;  Emobile.Clear;  EPhone.Clear; EFax.Clear; EAddr.Clear;
EAmount.Text:='1'; CmbQuality.ItemIndex :=0;
end;

procedure TFrmInputInfo.FormCreate(Sender: TObject);
begin
  Clear;
  DateBuy.Date :=now;
  DateBao.Date :=now+365;
end;

procedure TFrmInputInfo.DateBuyChange(Sender: TObject);
begin
  DateBao.Date :=DateBuy.Date+365;
end;

procedure TFrmInputInfo.WriteInfo;
begin
DBConnection;
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
if BtnAdd.Visible=true then
  ADOQuery1.SQL.Text :='select * from Userinfo';
if BtnModify.Visible =true then
  ADOQuery1.SQL.Text :='select * from Userinfo where id='+FrmMain.ListView1.Selected.Caption+'';
ADOQuery1.Open ;
if BtnAdd.Visible=true then ADOQuery1.Append ;
if BtnModify.Visible =true then ADOQuery1.Edit;
with ADOQuery1 do
  begin
  // 客户信息部分
  FieldByName('Name').AsString :=EUser.Text ;
  if  trim(EMobile.Text)<>'' then
    FieldByName('mobile').AsString :=EMobile.Text
    else
      FieldByName('mobile').AsString :='无';
  if trim(EPhone.Text)<>'' then
    FieldByName('phone').AsString :=EPhone.Text
    else
      FieldByName('phone').AsString :='无';
  if trim(EFax.Text )<>'' then
    FieldByName('fax').AsString :=EFax.Text
    else
      FieldByName('fax').AsString :='无';
  FieldByName('addr').AsString :=Eaddr.Text ;
  FieldByName('BuyAmount').AsString :=EAmount.Text ;
  FieldByName('TB').AsString :=IntToStr(CmbQuality.ItemIndex) ;   // 0 为一般客户。1为特殊客户。
  FieldByName('BuyDate').AsDateTime :=StrToDate(DatetoStr(DateBuy.Date));
  FieldByName('OverRun').AsDateTime :=StrToDate(DatetoStr(Datebao.Date)) ;
  // 电脑配置部分
  if trim(ECPU.Text)<>'' then
    FieldByName('CPU').AsString :=ECPU.Text
    else
      FieldByName('CPU').AsString :='无';
  if trim(EMainBoard.Text)<>'' then
    FieldByName('MainBoard').AsString :=EMainBoard.Text
    else
      FieldByName('MainBoard').AsString :='无';
  if trim(EMemory.Text)<>'' then
    FieldByName('Memory').AsString :=EMemory.Text
    else
      FieldByName('Memory').AsString :='无';
  if trim(EHD.Text)<>'' then
    FieldByName('HD').AsString :=EHD.Text
    else
      FieldByName('HD').AsString :='无';
  if trim(ESound.Text)<>'' then
    FieldByName('Sound').AsString :=ESound.Text
    else
    FieldByName('Sound').AsString :='无';
  if trim(EDisplayCard.Text)<>'' then
    FieldByName('DisplayCard').AsString :=EDisplayCard.Text
    else
      FieldByName('DisplayCard').AsString :='无';
  if trim(ECDROM.Text)<>'' then
    FieldByName('CDROM').AsString :=ECDROM.Text
    else
      FieldByName('CDROM').AsString :='无';
  if trim(EFloppy.Text)<>'' then
    FieldByName('Floppy').AsString :=EFloppy.Text
    else
      FieldByName('Floppy').AsString :='无';
  if trim(EKeyBoard.Text)<>'' then
    FieldByName('KeyBoard').AsString :=EKeyBoard.Text
    else
      FieldByName('KeyBoard').AsString :='无';
  if trim(EMouse.Text)<>'' then
    FieldByName('Mouse').AsString :=EMouse.Text
    else
      FieldByName('Mouse').AsString :='无';
  if trim(EDisplay.Text)<>'' then
    FieldByName('Display').AsString :=EDisplay.Text
    else
      FieldByName('Display').AsString :='无';
  if trim(EBox.Text )<>'' then
    FieldByName('Box').AsString :=EBox.Text
    else
      FieldByName('Box').AsString :='无';
  if trim(EPower.Text)<>'' then
    FieldByName('Power').AsString :=EPower.Text
    else
      FieldByName('Power').AsString :='无';
  if trim(ESoundBox.Text)<>'' then
    FieldByName('SoundBox').AsString :=ESoundBox.Text
    else
      FieldByName('SoundBox').AsString :='无';
  if trim(EPrint.Text)<>'' then
    FieldByName('Print').AsString :=EPrint.Text
    else
      FieldByName('Print').AsString :='无';
  if trim(ENetWork.Text)<>'' then
    FieldByName('NetWork').AsString :=ENetWork.Text
    else
      FieldByName('NetWork').AsString :='无';
  if trim(EModem.Text)<>'' then
    FieldByName('Modem').AsString :=EModem.Text
    else
      FieldByName('Modem').AsString :='无';
  if trim(EOther.Text)<>'' then
    FieldByName('Other').AsString :=EOther.Text
    else
      FieldByName('Other').AsString :='无';
  if trim(Memo.Text)<>'' then
    FieldByName('Memo').AsString :=Memo.Text
    else
      FieldByName('Memo').AsString :='无';
  end;
ADOQuery1.Post;
ADOQuery1.Close;

end;

procedure TFrmInputInfo.DBConnection;
var
  DataPath:string;
begin
  if ADOConnection1.Connected then ADOConnection1.Close;
  //防止被重复打开而导到数据连接错误
  DataPath:=ExtractFilePath(Application.ExeName)+'Data\mgr.db';
  {登录加密的数据库}
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DataPath+';
  ADOConnection1.Open();
end;

procedure TFrmInputInfo.BtnAddClick(Sender: TObject);
begin

if trim(EUser.Text)='' then
  begin
    Euser.SetFocus ;
    exit;
  end;
if trim(Eaddr.Text)='' then
  begin
    EAddr.SetFocus;
    Exit;
  end;
if checkreg =0 then FrmRegistry.ShowModal;
WriteInfo;
Clear;
end;

procedure TFrmInputInfo.EAmountKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',char(13),char(8)]) then  key := #0; 

end;

procedure TFrmInputInfo.EAmountChange(Sender: TObject);
begin
if (trim(EAmount.Text)='') or (EAmount.Text ='0') then EAmount.Text :='1';
end;

procedure TFrmInputInfo.BtnPreviewClick(Sender: TObject);
begin
  WriteToReport;
  QuickReport1.PreviewModal;
end;

procedure TFrmInputInfo.WriteToReport;
begin
DBConnection;
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text :='select * from Inc';
ADOQuery1.Open ;
QuickReport1.Refresh;
  if Checkreg=0 then
    QuickReport1.LblIncName.Caption  :='《电脑公司客户管理系统》--本软件尚未注册，请注册！'
    else QuickReport1.LblIncName.Caption:=TempInc;
  With QuickReport1 do
    begin
      lblPrintDate.Caption :=DateToStr(Now);
      LblName.Caption :=EUser.Text;
      LblPhone.Caption :=EPhone.Text;
      LblFax.Caption :=EFax.Text ;
      LblMobile.Caption :=EMobile.Text;
      LblBuyAmount.Caption :=EAmount.Text;
      LblAddr.Caption :=EAddr.Text;
      LblBuydate.Caption :=DateToStr(DateBuy.Date);
      LblOverRun.Caption :=DateToStr(DateBao.Date);
      LblCPU.Caption :=ECpu.Text;
      LblMainBoard.Caption :=EMainBoard.Text;
      LblMemory.Caption :=EMemory.Text;
      LblHD.Caption :=EHD.Text;
      LblSound.Caption :=ESound.Text;
      LblDisplayCard.Caption :=EDisplayCard.Text;
      LblCdRom.Caption :=ECDROM.Text;
      LblFloppy.Caption :=EFloppy.Text;
      LblKeyBoard.Caption :=EKeyBoard.Text;
      LblOther.Caption :=EOther.Text;
      LblMouse.Caption :=EMouse.Text;
      LblDisplay.Caption :=EDisplay.Text;
      LblBox.Caption :=EBox.Text;
      LblPower.Caption :=EPower.Text;
      LblSoundBox.Caption :=ESoundBox.Text ;
      LblPrint.Caption :=EPrint.Text;
      LblNetWork.Caption :=ENetWork.Text;
      LblModem.Caption :=EModem.Text;
      QMemo.Lines.Clear;
      QMemo.Lines.Add(Memo.Text); 
      LblCn1.Caption :=ADOQuery1.FieldValues['cn1'];
      LblCn2.Caption :=ADOQuery1.FieldValues['cn2'];
      LblCn3.Caption :=ADOQuery1.FieldValues['cn3'];
      LblIncAddr.Caption :=ADOQuery1.FieldValues ['Addr'];
      LblIncMail.Caption :=ADOQuery1.FieldValues ['Mail'];
      LblIncWeb.Caption :=ADOQuery1.FieldValues['Web'];
      LblIncPhone.Caption :=ADOQuery1.FieldValues['Phone'];
      LblIncFax.Caption :=ADOQuery1.FieldValues ['Fax'];
      LblIncPhone1.Caption :=ADOQuery1.FieldValues['Phone1']
    end;
ADOQuery1.Close;
ADOConnection1.Close;
end;

procedure TFrmInputInfo.BtnPrintClick(Sender: TObject);
begin
WriteToReport;
QuickReport1.Print;
end;

end.
