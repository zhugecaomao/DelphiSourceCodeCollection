object Form1: TForm1
  Left = 192
  Top = 114
  Width = 352
  Height = 295
  Caption = #31616#21333#32452#20214#32534#31243#31034#20363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 208
    Width = 240
    Height = 15
    Caption = #26631#31614#32452#20214#29992#20110#26174#31034#19968#20123#35828#26126#24615#30340#25991#23383
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 24
    Top = 104
    Width = 169
    Height = 49
    BiDiMode = bdLeftToRight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 85
      Height = 13
      Caption = #26356#25913#23383#20307#22823#23567':'
    end
    object ScrollBar1: TScrollBar
      Left = 16
      Top = 24
      Width = 137
      Height = 17
      Max = 30
      Min = 8
      PageSize = 0
      Position = 11
      TabOrder = 0
      OnChange = ScrollBar1Change
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 16
    Width = 169
    Height = 73
    Caption = #25511#21046#32452#20214#26174#31034#29366#24577
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #26174#31034'TPanel'#32452#20214
      #38544#34255'TPanel'#32452#20214)
    ParentFont = False
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 160
    Width = 169
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Text = #26356#25913#23383#20307
    OnChange = ComboBox1Change
    Items.Strings = (
      '@'#23435#20307
      '@'#38582#20070
      '@'#26999#20307'_GB2312'
      '@'#40657#20307
      '@'#24188#22278
      #23435#20307
      #38582#20070
      #26999#20307'_GB2312'
      #40657#20307
      #24188#22278)
  end
  object RadioButton1: TRadioButton
    Left = 224
    Top = 16
    Width = 57
    Height = 17
    Caption = #32418#33394
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = True
    OnClick = RadioButton1Click
  end
  object CheckBox1: TCheckBox
    Left = 224
    Top = 88
    Width = 65
    Height = 17
    Caption = #31895#20307
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 224
    Top = 160
    Width = 75
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object CheckBox2: TCheckBox
    Left = 224
    Top = 112
    Width = 65
    Height = 17
    Caption = #26012#20307
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CheckBox3: TCheckBox
    Left = 224
    Top = 136
    Width = 65
    Height = 17
    Caption = #19979#21010#32447
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object RadioButton2: TRadioButton
    Left = 224
    Top = 40
    Width = 57
    Height = 17
    Caption = #32511#33394
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 224
    Top = 64
    Width = 57
    Height = 17
    Caption = #34013#33394
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = RadioButton3Click
  end
end
