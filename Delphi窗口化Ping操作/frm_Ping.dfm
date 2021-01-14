object FrmPing: TFrmPing
  Left = 927
  Top = 258
  BorderStyle = bsSingle
  Caption = #32534#31243#23454#29616'Ping'#25805#20316
  ClientHeight = 477
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 12
    Top = 9
    Width = 193
    Height = 33
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 21
    Top = 19
    Width = 46
    Height = 13
    Caption = 'IP'#22320#22336#65306
  end
  object BtnStartPing: TButton
    Left = 12
    Top = 172
    Width = 65
    Height = 25
    Caption = #24320#22987'Ping'
    TabOrder = 0
    OnClick = BtnStartPingClick
  end
  object EdIP: TEdit
    Left = 69
    Top = 15
    Width = 129
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object GBxPingData: TGroupBox
    Left = 12
    Top = 49
    Width = 193
    Height = 113
    Caption = #32593#32476#20449#24687
    TabOrder = 2
    object LblSAddr: TLabel
      Left = 100
      Top = 43
      Width = 6
      Height = 11
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblSRTT: TLabel
      Left = 99
      Top = 65
      Width = 6
      Height = 11
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblSDataSize: TLabel
      Left = 99
      Top = 86
      Width = 6
      Height = 11
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblAddr: TLabel
      Left = 45
      Top = 42
      Width = 36
      Height = 13
      Caption = #22320#22336#65306
    end
    object LblRTT: TLabel
      Left = 45
      Top = 64
      Width = 36
      Height = 13
      Caption = #24310#26102#65306
    end
    object LblDataSize: TLabel
      Left = 9
      Top = 84
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #25968#25454#21253#22823#23567#65306
    end
    object LblStatus: TLabel
      Left = 45
      Top = 24
      Width = 36
      Height = 13
      Caption = #29366#24577#65306
    end
    object LblSStatus: TLabel
      Left = 101
      Top = 24
      Width = 6
      Height = 11
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object BtnStop: TButton
    Left = 76
    Top = 172
    Width = 65
    Height = 25
    Caption = #20572#27490
    TabOrder = 3
    OnClick = BtnStopClick
  end
  object BtnClose: TButton
    Left = 140
    Top = 172
    Width = 65
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    OnClick = BtnCloseClick
  end
  object ListBox1: TListBox
    Left = 16
    Top = 216
    Width = 193
    Height = 241
    ItemHeight = 13
    TabOrder = 5
  end
  object TimerPing: TTimer
    Enabled = False
    OnTimer = TimerPingTimer
    Left = 180
    Top = 65
  end
  object XPManifest1: TXPManifest
    Left = 148
    Top = 65
  end
end
