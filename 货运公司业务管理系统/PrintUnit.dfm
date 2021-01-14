object PrintForm: TPrintForm
  Left = 231
  Top = 161
  BorderStyle = bsDialog
  Caption = #25171#21360#31383#20307
  ClientHeight = 244
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 244
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 104
      Top = 56
      Width = 130
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #35831#36873#25321#25152#35201#25171#21360#30340#27169#26495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Effect.FontEffect.Gradual.Enabled = True
      Effect.FontEffect.Gradual.Style = gsTopToBottom
      Effect.FontEffect.Gradual.StartColor = clBlue
      Effect.FontEffect.Gradual.EndColor = 16744703
    end
    object FlatComboBox1: TFlatComboBox
      Left = 88
      Top = 88
      Width = 161
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ItemHeight = 13
      TabOrder = 0
      ItemIndex = -1
    end
    object FlatButton1: TFlatButton
      Left = 80
      Top = 168
      Width = 57
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 200
      Top = 168
      Width = 65
      Height = 25
      Caption = #25171#21360
      TabOrder = 2
      OnClick = FlatButton2Click
    end
  end
end
