Unit Settings;

Interface

Uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Menus, ComCtrls,
  Spin, ExtCtrls, Buttons, MMSystem, ToolWin, ImgList;

Type
  TFrmSetting = Class(TForm)
    PageControl: TPageControl;
    TabSheet_Preview: TTabSheet;
    TabSheet_Capture: TTabSheet;
    Bt_Save: TButton;
    Bt_Cancel: TButton;
    Bt_Application: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SB_Brightness: TScrollBar;
    SB_Hue: TScrollBar;
    SB_Contrast: TScrollBar;
    SB_Saturation: TScrollBar;
    TabSheet_Alarm: TTabSheet;
    OD: TOpenDialog;
    LAB_Brightness: TLabel;
    LAB_Hue: TLabel;
    LAB_Contrast: TLabel;
    LAB_Saturation: TLabel;
    Panel4: TPanel;
    Bt_C_default: TSpeedButton;
    Bt_P_Default: TSpeedButton;
    SB_PreviewSetAll: TSpeedButton;
    SB_CaptureSetAll: TSpeedButton;
    SE_KeyFrameIntervals: TSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    SE_FrameRate: TSpinEdit;
    SE_QuantLevel: TSpinEdit;
    CB_UseAudio: TCheckBox;
    CB_OSD: TCheckBox;
    Label24: TLabel;
    SE_Package: TSpinEdit;
    Label30: TLabel;
    Panel15: TPanel;
    MainMenu: TMainMenu;
    S_Channel: TMenuItem;
    SE_FileSize: TSpinEdit;
    Label34: TLabel;
    CB_FileSize: TCheckBox;
    Lab_Color: TLabel;
    ColorDialog: TColorDialog;
    CB_ImageSize: TComboBox;
    Label8: TLabel;
    SB_MotionSetAll: TSpeedButton;
    CB_Alarm_default: TSpeedButton;
    Panel3: TPanel;
    Label9: TLabel;
    CB_Alarm_Sensetive: TSpinEdit;
    Label20: TLabel;
    Panel10: TPanel;
    Label11: TLabel;
    CB_Alarm_SoftAlarmContinuTime: TSpinEdit;
    CB_Alarm_SoftUseAudio: TCheckBox;
    CB_Alarm_PreCapture: TCheckBox;
    SB_Alarm_SoftSound: TSpeedButton;
    SB_Alarm_SoftSoundOpen: TSpeedButton;
    Lab_Alarm_SoftSound: TLabel;
    Panel11: TPanel;
    CB_Alarm_PreCaptureTime: TSpinEdit;
    Label10: TLabel;
    CB_Alarm_Capture: TCheckBox;
    RB_Alarm_HardAlarm: TCheckBox;
    RB_Alarm_SfotAlarm: TCheckBox;
    CB_Alarm_VideoUseAudio: TCheckBox;
    CB_Alarm_VideoLose: TCheckBox;
    SB_Alarm_VideoSound: TSpeedButton;
    SB_Alarm_VideoSoundOpen: TSpeedButton;
    Lab_Alarm_VideoSound: TLabel;
    Label5: TLabel;
    CB_BeginDrive: TComboBox;
    CB_EndDrive: TComboBox;
    Label12: TLabel;
    CB_Motion: TCheckBox;
    Label13: TLabel;
    CB_VideoFormat: TComboBox;
    TabSheet_Global: TTabSheet;
    SE_DiskEndSize: TSpinEdit;
    SB_OpenImage: TSpeedButton;
    SB_OpenFrame: TSpeedButton;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LB_CaptureImageDir: TLabel;
    LB_CaptureFrameDir: TLabel;
    CB_DSPStatus: TCheckBox;
    Label18: TLabel;
    SE_Maxbps: TSpinEdit;
    CB_CBR: TCheckBox;
    TabSheet_Auto: TTabSheet;
    ImageList: TImageList;
    TV_AutoCapture: TTreeView;
    ToolBar_Auto: TToolBar;
    TB_New: TToolButton;
    TB_Modify: TToolButton;
    TB_Delete: TToolButton;
    ToolButtonSp1: TToolButton;
    TB_Copy: TToolButton;
    TB_Paste: TToolButton;
    ToolButtonSp2: TToolButton;
    TB_PasteAll: TToolButton;
    ToolButtonSp3: TToolButton;
    TB_Collapse: TToolButton;
    TB_Expand: TToolButton;
    TabSheet_YunTai: TTabSheet;
    lv_YunTai: TListView;
    YTPanel: TPanel;
    sb_OK: TSpeedButton;
    sb_Cancel: TSpeedButton;
    ed_YTPort: TEdit;
    ed_YTBaudrate: TEdit;
    cb_YTName: TComboBox;
    cb_YTCOM: TComboBox;
    ed_YTAddress: TSpinEdit;
    ed_YTAddress_2: TSpinEdit;
    TabSheet_Net: TTabSheet;
    PageControl_Net: TPageControl;
    TabSheet_Net1: TTabSheet;
    LV_NetMode: TListView;
    NetPanel: TPanel;
    SB_OK_NET: TSpeedButton;
    SB_Cancel_NET: TSpeedButton;
    SE_MaxConnetion: TSpinEdit;
    SE_ConnectMode: TSpinEdit;
    TabSheet_Net2: TTabSheet;
    ToolBar_Net: TToolBar;
    TB_Client_new: TToolButton;
    TB_Client_delete: TToolButton;
    ToolButtonSp4: TToolButton;
    TB_Client_Modify: TToolButton;
    CB_ClientStart: TCheckBox;
    ListView_IP: TListView;
    TabSheet_Net3: TTabSheet;
    Label39: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Lab_EndPort: TLabel;
    Panel16: TPanel;
    SE_IniPort: TSpinEdit;
    CB_WebEnabled: TCheckBox;
    Panel17: TPanel;
    SE_WebPort: TSpinEdit;
    CB_SingleConnect: TCheckBox;
    LbDspName: TLabel;
    TxtDspName: TEdit;
    Procedure FormCreate(Sender: TObject);
    Procedure Bt_CancelClick(Sender: TObject);
    Procedure Bt_SaveClick(Sender: TObject);
    Procedure Bt_ApplicationClick(Sender: TObject);
    Procedure SB_ScrollChange(Sender: TObject);
    Procedure SB_PreviewSetAllClick(Sender: TObject);
    Procedure Bt_P_DefaultClick(Sender: TObject);
    Procedure SB_CaptureSetAllClick(Sender: TObject);
    Procedure Bt_C_defaultClick(Sender: TObject);
    Procedure SB_MotionSetAllClick(Sender: TObject);
    Procedure CB_Alarm_defaultClick(Sender: TObject);
    Procedure SB_Alarm_VideoSoundOpenClick(Sender: TObject);
    Procedure SB_Alarm_SoftSoundOpenClick(Sender: TObject);
    Procedure SB_Alarm_VideoSoundClick(Sender: TObject);
    Procedure SB_Alarm_SoftSoundClick(Sender: TObject);
    Procedure SB_OpenImageClick(Sender: TObject);
    Procedure SB_OpenFrameClick(Sender: TObject);
    Procedure CB_MotionClick(Sender: TObject);
  Private
    Procedure LoadSettingNum(ChannelNum: Integer);
    Procedure SaveSettingNum(ChannelNum: Integer);
    Procedure S_ChannelOnMenuClick(Sender: TObject);
    Procedure SetVideoPara(ChannelNum: Integer);
  Public

  End;

Var
  FrmSetting: TFrmSetting;

Implementation

{$R *.DFM}
Uses Main, Global, tmSDKLib, tmSDK_DataType;

Procedure TFrmSetting.FormCreate(Sender: TObject);
Var
  I: Integer;
  MenuItem: TMenuItem;
Begin
  PageControl.ActivePageIndex := 0;
  PageControl_Net.ActivePageIndex := 0;
  For I := 0 To Sdk.GetTotalDSPs - 1 Do
  Begin
    MenuItem := TMenuItem.Create(self);
    MenuItem.Caption := Format(DSP_Num, [I + 1]);
    MenuItem.Tag := I;
    MenuItem.OnClick := S_ChannelOnMenuClick;
    S_Channel.Add(MenuItem);
  End;
  CB_ImageSize.Items.Add('CIF 352x288');
  CB_ImageSize.Items.Add('QCIF 176x144');
  CB_ImageSize.Items.Add('HD 720x288');
  CB_ImageSize.Items.Add('MD 512*288');
  //CB_ImageSize.Items.Add('D1 720x576');

  For I := 68 To 90 Do
    CB_BeginDrive.Items.Add(Chr(I));
  CB_EndDrive.Items.Assign(CB_BeginDrive.Items);
  CB_VideoFormat.Items.Add('NTSC');
  CB_VideoFormat.Items.Add('PAL');

  SE_DiskEndSize.Value := Cfg.WarningEndiskSize;
  LB_CaptureImageDir.Caption := Cfg.CaptureImageDir;
  LB_CaptureFrameDir.Caption := Cfg.CaptureFrameDir;
  CB_DSPStatus.Checked := Cfg.CheckDspStatus;
  LoadSettingNum(FrmMain.VideoWin.Selected);

  CB_FileSize.Enabled := False;
  //CB_Motion.Checked := False;
  //CB_Motion.Enabled := False;
End;

Procedure TFrmSetting.LoadSettingNum(ChannelNum: Integer);
Var
  I: Integer;
Begin
  Caption := Format('系统设置 (通道: %d)', [ChannelNum + 1]);
  With Cfg.Config[ChannelNum] Do
  Begin
    TxtDspName.Text := DspName;
    SB_Brightness.Position := Brightness;
    SB_Contrast.Position := Contrast;
    SB_Saturation.Position := Saturation;
    SB_Hue.Position := Hue;
    CB_ImageSize.ItemIndex := StreamFormat;
    SE_FileSize.Value := MaxFileSize;
    CB_OSD.Checked := IsShowOSD;
    SE_KeyFrameIntervals.Value := KeyFrameIntervals;
    SE_FrameRate.Value := FrameRate;
    I := CB_BeginDrive.Items.IndexOf(BeginDrive);
    If I = -1 Then
      CB_BeginDrive.ItemIndex := 0
    Else CB_BeginDrive.ItemIndex := I;
    I := CB_EndDrive.Items.IndexOf(EndDrive);
    If I = -1 Then
      CB_EndDrive.ItemIndex := CB_EndDrive.Items.Count - 1
    Else CB_EndDrive.ItemIndex := I;
    CB_Motion.Checked := IsMotion;
    CB_Alarm_Sensetive.Value := Alarm_Sensetive;
    Lab_Alarm_VideoSound.Caption := Alarm_VideoSound;
    Lab_Alarm_SoftSound.Caption := Alarm_SoftSound;
    CB_Alarm_VideoUseAudio.Checked := Alarm_VideoUseAudio;
    CB_Alarm_SoftUseAudio.Checked := Alarm_SoftUseAudio;
    CB_VideoFormat.ItemIndex := VideoFormat - 1;
    CB_UseAudio.Checked := StreamType = 2;
    SE_QuantLevel.Value := QuantLevel;
    SE_Maxbps.Value := Max_Bps;
    CB_CBR.Checked := CBR;
  End;
  SetVideoPara(ChannelNum);
End;

Procedure TFrmSetting.SaveSettingNum(ChannelNum: Integer);
Begin
  With Cfg.Config[ChannelNum] Do
  Begin
    DspName := TxtDspName.Text;
    StreamFormat := CB_ImageSize.ItemIndex;
    MaxFileSize := SE_FileSize.Value;
    IsShowOSD := CB_OSD.Checked;
    KeyFrameIntervals := SE_KeyFrameIntervals.Value;
    FrameRate := SE_FrameRate.Value;
    Brightness := SB_Brightness.Position;
    Contrast := SB_Contrast.Position;
    Saturation := SB_Saturation.Position;
    Hue := SB_Hue.Position;
    BeginDrive := CB_BeginDrive.Items[CB_BeginDrive.ItemIndex][1];
    EndDrive := CB_EndDrive.Items[CB_EndDrive.ItemIndex][1];
    IsMotion := CB_Motion.Checked;
    Alarm_Sensetive := CB_Alarm_Sensetive.Value;
    Alarm_VideoSound := Lab_Alarm_VideoSound.Caption;
    Alarm_SoftSound := Lab_Alarm_SoftSound.Caption;
    Alarm_VideoUseAudio := CB_Alarm_VideoUseAudio.Checked;
    Alarm_SoftUseAudio := CB_Alarm_SoftUseAudio.Checked;
    VideoFormat := CB_VideoFormat.ItemIndex + 1;
    If CB_UseAudio.Checked Then StreamType := 2 Else StreamType := 0;
    QuantLevel := SE_QuantLevel.Value;
    Max_Bps := SE_Maxbps.Value;
    CBR := CB_CBR.Checked;
  End;
  SetVideoPara(ChannelNum);
End;

Procedure TFrmSetting.S_ChannelOnMenuClick(Sender: TObject);
Begin
  FrmMain.VideoWin.Selected := TMenuItem(Sender).Tag;
  LoadSettingNum(FrmMain.VideoWin.Selected);
End;

Procedure TFrmSetting.SetVideoPara(ChannelNum: Integer);
Begin
  Sdk.SetVideoPara(ChannelHandle[ChannelNum],
    SB_Brightness.Position, SB_Contrast.Position, SB_Saturation.Position, SB_Hue.Position);
  LAB_Brightness.Caption := IntToStr(SB_Brightness.Position);
  LAB_Contrast.Caption := IntToStr(SB_Contrast.Position);
  LAB_Saturation.Caption := IntToStr(SB_Saturation.Position);
  LAB_Hue.Caption := IntToStr(SB_Hue.Position);
End;

Procedure TFrmSetting.Bt_CancelClick(Sender: TObject);
Begin
  Close;
End;

Procedure TFrmSetting.Bt_SaveClick(Sender: TObject);
Begin
  Bt_ApplicationClick(Sender);
  SaveSettings;
  Close;
End;

Procedure TFrmSetting.Bt_ApplicationClick(Sender: TObject);
Begin
  Cfg.WarningEndiskSize := SE_DiskEndSize.Value;
  Cfg.CaptureImageDir := LB_CaptureImageDir.Caption;
  Cfg.CaptureFrameDir := LB_CaptureFrameDir.Caption;
  Cfg.CheckDspStatus := CB_DSPStatus.Checked;
  SaveSettingNum(FrmMain.VideoWin.Selected);
End;

Procedure TFrmSetting.SB_ScrollChange(Sender: TObject);
Begin
  SetVideoPara(FrmMain.VideoWin.Selected);
End;

Procedure TFrmSetting.SB_PreviewSetAllClick(Sender: TObject);
Var
  I: Integer;
Begin
  For I := 0 To Sdk.GetTotalDSPs - 1 Do
  Begin
    With Cfg.Config[I] Do
    Begin
      Brightness := SB_Brightness.Position;
      Contrast := SB_Contrast.Position;
      Saturation := SB_Saturation.Position;
      Hue := SB_Hue.Position;
    End;
    SetVideoPara(I);
  End;
End;

Procedure TFrmSetting.Bt_P_DefaultClick(Sender: TObject);
Begin
  SB_Brightness.Position := 127;
  SB_Contrast.Position := 63;
  SB_Saturation.Position := 63;
  SB_Hue.Position := 127;
  SetVideoPara(FrmMain.VideoWin.Selected);
End;

Procedure TFrmSetting.SB_CaptureSetAllClick(Sender: TObject);
Var
  I: Integer;
Begin
  For I := 0 To Sdk.GetTotalDSPs - 1 Do
    With Cfg.Config[I] Do
    Begin
      StreamFormat := CB_ImageSize.ItemIndex;
      MaxFileSize := SE_FileSize.Value;
      KeyFrameIntervals := SE_KeyFrameIntervals.Value;
      FrameRate := SE_FrameRate.Value;
      IsShowOSD := CB_OSD.Checked;
      BeginDrive := CB_BeginDrive.Items[CB_BeginDrive.ItemIndex][1];
      EndDrive := CB_EndDrive.Items[CB_EndDrive.ItemIndex][1];
      VideoFormat := CB_VideoFormat.ItemIndex + 1;
      If CB_UseAudio.Checked Then StreamType := 2 Else StreamType := 0;
      QuantLevel := SE_QuantLevel.Value;
      Max_Bps := SE_Maxbps.Value;
      CBR := CB_CBR.Checked;
    End;
End;

Procedure TFrmSetting.Bt_C_defaultClick(Sender: TObject);
Begin
  CB_ImageSize.ItemIndex := 0;
  SE_FileSize.Value := 100;
  SE_KeyFrameIntervals.Value := 200;
  SE_FrameRate.Value := 25;
  CB_OSD.Checked := True;
  CB_BeginDrive.ItemIndex := 0;
  CB_EndDrive.ItemIndex := CB_EndDrive.Items.Count - 1;
  CB_VideoFormat.ItemIndex := StandardPAL - 1;
  CB_UseAudio.Checked := False;
  SE_QuantLevel.Value := 15;
  SE_Maxbps.Value := 10000;
  CB_CBR.Checked := True;
End;

Procedure TFrmSetting.SB_MotionSetAllClick(Sender: TObject);
Var
  I: Integer;
Begin
  For I := 0 To Sdk.GetTotalDSPs - 1 Do
    With Cfg.Config[I] Do
    Begin
      IsMotion := CB_Motion.Checked;
      Alarm_Sensetive := CB_Alarm_Sensetive.Value;
      Alarm_VideoSound := Lab_Alarm_VideoSound.Caption;
      Alarm_SoftSound := Lab_Alarm_SoftSound.Caption;
      Alarm_VideoUseAudio := CB_Alarm_VideoUseAudio.Checked;
      Alarm_SoftUseAudio := CB_Alarm_SoftUseAudio.Checked;
    End;
End;

Procedure TFrmSetting.CB_Alarm_defaultClick(Sender: TObject);
Begin
  CB_Motion.Checked := False;
  CB_Alarm_Sensetive.Value := 12;
  Lab_Alarm_VideoSound.Caption := '';
  Lab_Alarm_SoftSound.Caption := '';
  CB_Alarm_VideoUseAudio.Checked := False;
  CB_Alarm_SoftUseAudio.Checked := False;
End;

Procedure TFrmSetting.SB_Alarm_VideoSoundOpenClick(Sender: TObject);
Begin
  If Not OD.Execute Then Exit;
  Lab_Alarm_VideoSound.Caption := OD.FileName;
End;

Procedure TFrmSetting.SB_Alarm_SoftSoundOpenClick(Sender: TObject);
Begin
  If Not OD.Execute Then Exit;
  Lab_Alarm_SoftSound.Caption := OD.FileName;
End;

Procedure TFrmSetting.SB_Alarm_VideoSoundClick(Sender: TObject);
Begin
  PlaySound(PChar(Lab_Alarm_VideoSound.Caption), 0, SND_ASYNC Or SND_NOSTOP);
End;

Procedure TFrmSetting.SB_Alarm_SoftSoundClick(Sender: TObject);
Begin
  PlaySound(PChar(Lab_Alarm_SoftSound.Caption), 0, SND_ASYNC Or SND_NOSTOP);
End;

Procedure TFrmSetting.SB_OpenImageClick(Sender: TObject);
Var
  S: String;
Begin
  S := LB_CaptureImageDir.Caption;
  If Not GetDirectory('请选择抓图保存目录', S, True) Then Exit;
  LB_CaptureImageDir.Caption := S;
End;

Procedure TFrmSetting.SB_OpenFrameClick(Sender: TObject);
Var
  S: String;
Begin
  S := LB_CaptureFrameDir.Caption;
  If Not GetDirectory('请选择抓帧保存目录', S, True) Then Exit;
  LB_CaptureFrameDir.Caption := S;
End;

Procedure TFrmSetting.CB_MotionClick(Sender: TObject);
Begin
  If CB_Motion.Checked Then Application.MessageBox('报警功能未完成，建议不要启用。', PChar(SMsgDlgTip), MB_ICONINFORMATION);
End;

End.

