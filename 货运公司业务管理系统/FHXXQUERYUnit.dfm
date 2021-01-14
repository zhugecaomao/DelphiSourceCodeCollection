object FHXXQUERYForm: TFHXXQUERYForm
  Left = 240
  Top = 362
  BorderStyle = bsDialog
  Caption = #21457#36135#20449#24687#26597#35810#31383#20307
  ClientHeight = 215
  ClientWidth = 525
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
    Width = 525
    Height = 215
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 112
      Top = 64
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26597#35810#23383#27573
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 332
      Top = 64
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26597#35810#20540
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object FlatComboBox1: TFlatComboBox
      Left = 69
      Top = 85
      Width = 145
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
        #21457#36135#20844#21496
        #32852#31995#20154)
      ParentFont = False
      TabOrder = 0
      ItemIndex = -1
    end
    object Edit1: TEdit
      Left = 269
      Top = 85
      Width = 169
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object FlatButton1: TFlatButton
      Left = 134
      Top = 140
      Width = 57
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 298
      Top = 141
      Width = 57
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = FlatButton2Click
    end
  end
end
