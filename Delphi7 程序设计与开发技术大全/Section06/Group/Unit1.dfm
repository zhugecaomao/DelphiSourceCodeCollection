object Form1: TForm1
  Left = 192
  Top = 107
  Width = 355
  Height = 339
  Caption = #20998#32452#32452#20214#31034#20363
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
    Left = 232
    Top = 16
    Width = 70
    Height = 13
    Caption = #36873#20013#26631#31614#39029
  end
  object TabControl1: TTabControl
    Left = 8
    Top = 8
    Width = 217
    Height = 145
    TabOrder = 0
    Tabs.Strings = (
      #31532'1'#39029
      #31532'2'#39029
      #31532'3'#39029
      #31532'4'#39029
      #31532'5'#39029)
    TabIndex = 0
    TabStop = False
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 160
    Width = 217
    Height = 145
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
    end
  end
  object ScrollBar1: TScrollBar
    Left = 232
    Top = 40
    Width = 105
    Height = 16
    Max = 4
    PageSize = 0
    TabOrder = 2
    OnChange = ScrollBar1Change
  end
  object RadioGroup1: TRadioGroup
    Left = 232
    Top = 72
    Width = 105
    Height = 81
    Caption = #26631#31614#39118#26684
    ItemIndex = 2
    Items.Strings = (
      #25353#38062
      #24179#38754
      #26631#31614)
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 232
    Top = 168
    Width = 105
    Height = 97
    Caption = #26631#31614#20301#32622
    ItemIndex = 3
    Items.Strings = (
      #24213#37096
      #24038#37096
      #21491#37096
      #39030#37096)
    TabOrder = 4
    OnClick = RadioGroup2Click
  end
  object CheckBox1: TCheckBox
    Left = 232
    Top = 280
    Width = 105
    Height = 17
    Caption = #26631#31614#19968#32447
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = CheckBox1Click
  end
end
