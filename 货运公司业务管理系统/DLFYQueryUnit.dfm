object DLFYQueryForm: TDLFYQueryForm
  Left = 290
  Top = 194
  Width = 456
  Height = 292
  Caption = #20195#29702#36153#29992#26597#35810#31383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 264
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object TAALabel
      Left = 80
      Top = 72
      Width = 0
      Height = 0
    end
    object AALabel2: TAALabel
      Left = 354
      Top = 84
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
    object AALabel1: TAALabel
      Left = 27
      Top = 85
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
    object AALabel3: TAALabel
      Left = 182
      Top = 84
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
      Left = 1
      Top = 104
      Width = 128
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
        #20195#29702#21517#31216
        #30446#30340#28207
        #30446#30340#22320
        #33337#21517'/'#33337#27425)
      ParentFont = False
      TabOrder = 0
      ItemIndex = -1
    end
    object FlatButton1: TFlatButton
      Left = 128
      Top = 176
      Width = 49
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 272
      Top = 176
      Width = 49
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = FlatButton2Click
    end
    object Edit1: TEdit
      Left = 296
      Top = 104
      Width = 145
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object FlatComboBox2: TFlatComboBox
      Left = 155
      Top = 104
      Width = 121
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
      Top = 6
      Width = 89
      Height = 25
      Caption = #21333#26465#20214#26597#35810
      TabOrder = 5
      Visible = False
      OnClick = FlatButton3Click
    end
  end
end
