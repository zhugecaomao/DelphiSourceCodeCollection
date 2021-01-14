object FormSUMALL: TFormSUMALL
  Left = 351
  Top = 238
  Width = 366
  Height = 133
  BorderIcons = [biSystemMenu, biHelp]
  Caption = #20840#37096#21512#35745
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 358
    Height = 65
    Align = alClient
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 39
      Top = 17
      Width = 48
      Height = 12
      Caption = #24320#22987#26102#38388
    end
    object Label2: TLabel
      Left = 39
      Top = 40
      Width = 48
      Height = 12
      Caption = #32467#26463#26102#38388
    end
    object DateTimePicker1: TDateTimePicker
      Left = 119
      Top = 14
      Width = 235
      Height = 20
      Date = 39023.000000000000000000
      Time = 39023.000000000000000000
      TabOrder = 1
    end
    object DateTimePicker2: TDateTimePicker
      Left = 119
      Top = 38
      Width = 234
      Height = 20
      Date = 39023.000000000000000000
      Time = 39023.000000000000000000
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 358
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Color = clBtnShadow
    TabOrder = 1
    object Button1: TButton
      Left = 100
      Top = 8
      Width = 126
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 228
      Top = 7
      Width = 126
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DM.adocon1
    ProcedureName = 'change_to_zero;1'
    Parameters = <>
    Left = 8
    Top = 6
  end
end
