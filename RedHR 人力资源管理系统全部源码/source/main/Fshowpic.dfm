object showpic: Tshowpic
  Left = 223
  Top = 133
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #22270#29255#36164#26009
  ClientHeight = 400
  ClientWidth = 360
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
    Width = 345
    Height = 81
    Caption = #22270#29255#35828#26126
    TabOrder = 0
    object DBEdit1: TEdit
      Left = 16
      Top = 32
      Width = 313
      Height = 20
      MaxLength = 150
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 345
    Height = 265
    Caption = #22270#29255
    TabOrder = 1
    object Panel1: TPanel
      Left = 16
      Top = 24
      Width = 313
      Height = 225
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 311
        Height = 223
        Align = alClient
        Center = True
        Stretch = True
      end
    end
  end
  object Button1: TButton
    Left = 272
    Top = 368
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 368
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 368
    Width = 75
    Height = 25
    Caption = #35835#20837'...'
    TabOrder = 4
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = #20301#22270'|*.bmp'
    Left = 88
    Top = 208
  end
end
