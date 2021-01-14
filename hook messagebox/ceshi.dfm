object Form1: TForm1
  Left = 809
  Top = 220
  Width = 322
  Height = 420
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 112
    Top = 56
    Width = 73
    Height = 33
    Caption = 'hook'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 136
    Width = 75
    Height = 25
    Caption = 'unhook'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 248
    Width = 75
    Height = 25
    Caption = 'messagebox'
    TabOrder = 2
    OnClick = Button3Click
  end
end
