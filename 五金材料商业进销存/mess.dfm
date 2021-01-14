object mess_frm: Tmess_frm
  Left = 371
  Top = 231
  BorderStyle = bsDialog
  Caption = #25552#31034
  ClientHeight = 113
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 255
    Height = 113
    Align = alClient
    Color = clInfoBk
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 42
      Height = 14
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #20223#23435'_GB2312'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 94
      Top = 72
      Width = 57
      Height = 22
      Caption = #20851#38381
      Flat = True
      Visible = False
      OnClick = SpeedButton1Click
    end
    object ProgressBar1: TProgressBar
      Left = 4
      Top = 48
      Width = 245
      Height = 18
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 216
    Top = 24
  end
end
