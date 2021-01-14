object F_rbb: TF_rbb
  Left = 339
  Top = 273
  Width = 327
  Height = 137
  BorderIcons = [biSystemMenu]
  Caption = #24403#26085#25253#34920#26085#26399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 7
    Top = 59
    Width = 258
    Height = 12
    Caption = #27491#22312#29983#25104#25253#34920#35831#31245#20505'.........................'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 0
    Width = 303
    Height = 57
    Caption = #23450#20041#25253#34920#26085#26399'...............................'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 27
      Width = 48
      Height = 12
      Caption = #23450#20041#26085#26399
    end
    object DateTimePicker1: TDateTimePicker
      Left = 81
      Top = 24
      Width = 210
      Height = 20
      Date = 39393.000000000000000000
      Time = 39393.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 108
    Top = 83
    Width = 93
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 215
    Top = 83
    Width = 92
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object ProgressBar1: TProgressBar
    Left = 5
    Top = 72
    Width = 300
    Height = 7
    TabOrder = 3
  end
end
