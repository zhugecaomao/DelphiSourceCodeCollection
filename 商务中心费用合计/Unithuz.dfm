object Formhuz: TFormhuz
  Left = 248
  Top = 139
  Width = 555
  Height = 256
  Caption = #27719#24635#26102#38388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 1
    Top = 4
    Width = 271
    Height = 180
    Caption = #24320#22987#26085#26399
    TabOrder = 1
    object DKSR: TMonthCalendar
      Left = 2
      Top = 19
      Width = 267
      Height = 159
      Align = alBottom
      Date = 39188.916222754630000000
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 188
    Width = 547
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Color = clInactiveCaption
    TabOrder = 0
    object Button1: TButton
      Left = 186
      Top = 8
      Width = 136
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 340
      Top = 7
      Width = 136
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 274
    Top = 7
    Width = 271
    Height = 175
    Caption = #32467#26463#26085#26399
    TabOrder = 2
    object DJSR: TMonthCalendar
      Left = 2
      Top = 15
      Width = 267
      Height = 158
      Align = alClient
      Date = 39188.916971979170000000
      TabOrder = 0
    end
  end
end
