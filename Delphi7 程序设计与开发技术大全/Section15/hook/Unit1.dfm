object Form1: TForm1
  Left = 399
  Top = 132
  Width = 429
  Height = 470
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 443
    Align = alLeft
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #24320#22987#25429#33719
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = #20572#27490#25429#33719
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 96
      Width = 75
      Height = 25
      Caption = #36864'  '#20986
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 113
    Top = 0
    Width = 308
    Height = 443
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 306
      Height = 441
      Align = alClient
      Caption = #40736#26631#21160#20316
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 15
        Width = 302
        Height = 424
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
