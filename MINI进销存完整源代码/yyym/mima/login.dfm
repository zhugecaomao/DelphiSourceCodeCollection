object loginform: Tloginform
  Left = 370
  Top = 288
  Width = 283
  Height = 153
  Caption = #35831#36755#20837#23494#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 41
    Height = 13
    AutoSize = False
    Caption = #23494#30721#65306
  end
  object Edit2: TEdit
    Left = 104
    Top = 24
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 152
    Top = 72
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button1Click
  end
end
