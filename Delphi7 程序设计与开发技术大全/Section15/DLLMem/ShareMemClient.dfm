object Form1: TForm1
  Left = 192
  Top = 103
  Width = 250
  Height = 115
  Caption = #27979#35797'DLL'#20849#20139#25968#25454#23458#25143#31471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 81
    Height = 13
    AutoSize = False
    Caption = 'DLL'#20013#30340#25968#25454
  end
  object Edit1: TEdit
    Left = 96
    Top = 16
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 80
    Top = 48
    Width = 75
    Height = 25
    Caption = #21047#26032
    TabOrder = 1
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 32
    Top = 40
  end
end
