object FGJT: TFGJT
  Left = 291
  Top = 267
  Width = 410
  Height = 109
  BorderIcons = [biSystemMenu]
  Caption = #32467#26463#24403#21069#26102#38388
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
  object lbl1: TLabel
    Left = 8
    Top = 21
    Width = 186
    Height = 12
    Caption = #27491#22312#32467#26463#24403#21069#30340#24037#20316#26102#38388'.........'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 40
    Width = 96
    Height = 12
    Caption = #35831#36873#25321#24037#20316#26085#26102#38388
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btn1: TSpeedButton
    Left = 328
    Top = 7
    Width = 52
    Height = 17
    Caption = #24320#22987
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = btn1Click
  end
  object pb1: TProgressBar
    Left = 1
    Top = 62
    Width = 396
    Height = 10
    TabOrder = 0
  end
  object dtp1: TDateTimePicker
    Left = 113
    Top = 35
    Width = 267
    Height = 21
    Date = 39410.000000000000000000
    Time = 39410.000000000000000000
    TabOrder = 1
  end
end
