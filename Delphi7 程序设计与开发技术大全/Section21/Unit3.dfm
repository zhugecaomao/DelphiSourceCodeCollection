object Form3: TForm3
  Left = 480
  Top = 268
  Width = 529
  Height = 351
  Caption = #22270#20070#31649#29702
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
    Left = 168
    Top = 24
    Width = 168
    Height = 27
    Caption = #22270#20070#31649#29702#31995#32479
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 48
    Top = 80
    Width = 169
    Height = 201
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    object Button1: TButton
      Left = 32
      Top = 24
      Width = 105
      Height = 25
      Caption = #20462#25913#22270#20070#35760#24405
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 32
      Top = 80
      Width = 105
      Height = 25
      Caption = #20462#25913#23398#29983#35760#24405
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 32
      Top = 128
      Width = 105
      Height = 25
      Caption = #20462#25913#23494#30721
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 304
    Top = 96
    Width = 185
    Height = 121
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 1
    object Button4: TButton
      Left = 40
      Top = 24
      Width = 113
      Height = 25
      Caption = #25171#21360#39044#32422#36890#30693
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 40
      Top = 64
      Width = 113
      Height = 25
      Caption = #25171#21360#20652#36824#36890#30693
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 248
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkClose
  end
end
