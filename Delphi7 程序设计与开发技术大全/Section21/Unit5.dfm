object Form5: TForm5
  Left = 257
  Top = 263
  Width = 486
  Height = 317
  Caption = #20462#25913#23494#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 72
    Top = 16
    Width = 313
    Height = 65
    Caption = #20462#25913#23494#30721
    Columns = 2
    Items.Strings = (
      #20462#25913#23398#29983#23494#30721
      #20462#25913#31649#29702#21592#23494#30721)
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 80
    Top = 104
    Width = 297
    Height = 97
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 84
      Height = 13
      Caption = #35831#36755#20837#26032#23494#30721#65306
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 84
      Height = 13
      Caption = #35831#30830#35748#26032#23494#30721#65306
    end
    object Edit1: TEdit
      Left = 128
      Top = 16
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 128
      Top = 56
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 232
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkCancel
  end
end
