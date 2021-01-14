object HYFYQueryForm: THYFYQueryForm
  Left = 304
  Top = 260
  BorderStyle = bsDialog
  Caption = #28023#36816#36153#29992#26597#35810#31383#20307
  ClientHeight = 230
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 230
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 40
      Top = 65
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #36873#25321#23383#27573
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 331
      Top = 65
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26597#25214#20540
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 192
      Top = 64
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #36873#25321#26376#20221
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object FlatComboBox1: TFlatComboBox
      Left = 8
      Top = 85
      Width = 129
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #25552#21333#21495
        #33337#36816#20844#21496
        #21457#36135#20844#21496
        #33337#21517'/'#33337#27425
        #24320#33337#26102#38388)
      ParentFont = False
      TabOrder = 0
      ItemIndex = -1
    end
    object FlatButton1: TFlatButton
      Left = 96
      Top = 168
      Width = 49
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 248
      Top = 168
      Width = 49
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = FlatButton2Click
    end
    object Edit1: TEdit
      Left = 307
      Top = 85
      Width = 101
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object FlatComboBox2: TFlatComboBox
      Left = 163
      Top = 85
      Width = 118
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
      TabOrder = 4
      ItemIndex = -1
    end
    object FlatButton3: TFlatButton
      Left = 8
      Top = 8
      Width = 81
      Height = 25
      Caption = #21333#26465#20214#26597#35810
      TabOrder = 5
      Visible = False
      OnClick = FlatButton3Click
    end
  end
end
