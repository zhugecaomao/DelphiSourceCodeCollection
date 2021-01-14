object TextForm: TTextForm
  Left = 432
  Top = 296
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Text Engine'
  ClientHeight = 135
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FlatButton1: TFlatButton
    Left = 8
    Top = 64
    Width = 129
    Height = 33
    Version = '4.42.8.0'
    ColorBorder = clBlack
    Caption = #25191#34892#21152#23494'(&E)'
    TabOrder = 0
    OnClick = FlatButton1Click
  end
  object FlatButton2: TFlatButton
    Left = 144
    Top = 64
    Width = 121
    Height = 33
    Version = '4.42.8.0'
    ColorBorder = clBlack
    Caption = #25191#34892#35299#23494'(&D)'
    TabOrder = 1
    OnClick = FlatButton2Click
  end
  object PassWord: TFlatMaskEdit
    Left = 40
    Top = 40
    Width = 225
    Height = 19
    Version = '4.42.8.0'
    Ticket.Width = 28
    Ticket.Height = 13
    Ticket.Caption = #23494#30721':'
    ColorBorder = clBlack
    ColorFlat = clBtnFace
    ParentColor = True
    Color = clBtnFace
    TabOrder = 2
  end
  object FlatTitlebar1: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 274
    Height = 33
    Version = '4.42.8.0'
    ActiveTextColor = clWhite
    InactiveTextColor = 8559266
    TitlebarColor = clBlack
    Align = alTop
    Caption = 'Text Engine '
  end
  object FlatTitlebar2: TFlatTitlebar
    Left = 0
    Top = 106
    Width = 274
    Height = 29
    Version = '4.42.8.0'
    ActiveTextColor = clWhite
    InactiveTextColor = 8559266
    TitlebarColor = clBlack
    Align = alBottom
    Caption = #36755#20837#23494#30721#65292#28982#21518#25191#34892#21152#23494#25110#32773#35299#23494#25805#20316#12290
  end
end
