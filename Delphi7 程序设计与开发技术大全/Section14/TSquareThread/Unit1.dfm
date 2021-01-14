object Form1: TForm1
  Left = 228
  Top = 123
  Width = 413
  Height = 220
  Caption = #32447#31243#20248#20808#32423#25511#21046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 24
    Top = 16
    Width = 57
    Height = 17
    Caption = #32418#33394
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 40
    Width = 57
    Height = 17
    Caption = #40644#33394
    TabOrder = 1
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 64
    Width = 57
    Height = 17
    Caption = #34013#33394
    TabOrder = 2
    OnClick = CheckBox3Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 88
    Width = 49
    Height = 21
    TabOrder = 3
    Text = '2'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 24
    Top = 120
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '3'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 24
    Top = 152
    Width = 49
    Height = 21
    TabOrder = 5
    Text = '4'
    OnChange = Edit3Change
  end
  object UpDown1: TUpDown
    Left = 73
    Top = 88
    Width = 15
    Height = 21
    Associate = Edit1
    Min = 2
    Max = 4
    Position = 2
    TabOrder = 6
  end
  object UpDown2: TUpDown
    Left = 73
    Top = 120
    Width = 15
    Height = 21
    Associate = Edit2
    Min = 2
    Max = 4
    Position = 3
    TabOrder = 7
  end
  object UpDown3: TUpDown
    Left = 73
    Top = 152
    Width = 15
    Height = 21
    Associate = Edit3
    Min = 2
    Max = 4
    Position = 4
    TabOrder = 8
  end
  object Button1: TButton
    Left = 304
    Top = 144
    Width = 75
    Height = 25
    Caption = #23545#40784'(&S)'
    TabOrder = 9
    OnClick = Button1Click
  end
end
