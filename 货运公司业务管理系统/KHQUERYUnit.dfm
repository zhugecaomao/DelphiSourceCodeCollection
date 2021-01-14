object KUQUERYForm: TKUQUERYForm
  Left = 221
  Top = 301
  BorderStyle = bsDialog
  Caption = #23458#25143#36153#29992#26597#35810#31383#20307
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
      Left = 102
      Top = 53
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
      Left = 301
      Top = 53
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
    object FlatButton1: TFlatButton
      Left = 120
      Top = 144
      Width = 49
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 272
      Top = 144
      Width = 49
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatComboBox1: TFlatComboBox
      Left = 71
      Top = 72
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
        #21457#36135#21517#31216
        #30446#30340#22320)
      ParentFont = False
      TabOrder = 2
      ItemIndex = -1
    end
    object Edit1: TEdit
      Left = 248
      Top = 72
      Width = 153
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
