object branmessage: Tbranmessage
  Left = 197
  Top = 121
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #37096#38376#21464#21160#35828#26126
  ClientHeight = 240
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object DBMemo1: TDBMemo
    Left = 8
    Top = 8
    Width = 321
    Height = 193
    DataField = 'memo'
    DataSource = Main.brancheditsource
    TabOrder = 0
  end
  object Button1: TButton
    Left = 248
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 208
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
