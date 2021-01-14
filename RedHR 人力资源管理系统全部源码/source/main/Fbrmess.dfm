object Brmess: TBrmess
  Left = 266
  Top = 319
  BorderStyle = bsDialog
  Caption = #37096#38376#32479#35745#20449#24687
  ClientHeight = 319
  ClientWidth = 305
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 273
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 36
      Height = 12
      Caption = #38582#23646#20110
    end
  end
  object Button1: TButton
    Left = 216
    Top = 288
    Width = 75
    Height = 25
    Cancel = True
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADOQuery1: TADOQuery
    Connection = Main.ADOconn
    Parameters = <>
    Left = 48
    Top = 144
  end
end
