object YBCXForm: TYBCXForm
  Left = 288
  Top = 220
  Width = 365
  Height = 202
  Caption = #26376#25253#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AALabel1: TAALabel
    Left = 103
    Top = 24
    Width = 136
    Height = 13
    ParentEffect.ParentFont = False
    Caption = #35831#36755#20837#24744#24819#26597#35810#30340#26376#20221
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold, fsItalic]
  end
  object Label1: TLabel
    Left = 74
    Top = 66
    Width = 52
    Height = 13
    Caption = #26597#25214#23383#27573
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 240
    Top = 67
    Width = 39
    Height = 13
    Caption = #26597#25214#20540
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Edit2: TEdit
    Left = 216
    Top = 81
    Width = 81
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 136
    Width = 49
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 136
    Width = 49
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object FlatComboBox1: TFlatComboBox
    Left = 56
    Top = 80
    Width = 89
    Height = 21
    Style = csDropDownList
    Color = clWindow
    ItemHeight = 13
    Items.Strings = (
      #25552#21333#21495
      #21457#36135#20844#21496
      #19994#21153#21592
      #33337#21517'/'#33337#27425
      #24180
      #26376)
    TabOrder = 3
    ItemIndex = -1
  end
end
